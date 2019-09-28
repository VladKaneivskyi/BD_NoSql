from cassandra.cluster import Cluster
from cassandra import ConsistencyLevel
from cassandra.query import SimpleStatement

cluster = Cluster()
connection = cluster.connect('ticheter')


with open('drop.cql', mode='r') as f:
    txt = f.read()
    stmts = txt.split(';')
    for i in stmts:
        stmt = i.strip()
        if stmt != '':
            print(f'Executing {stmt}')
            query = SimpleStatement(stmt, consistency_level=ConsistencyLevel.QUORUM)
            connection.execute(query)
            print(f'{stmt} - done')
        
with open('create.cql', mode='r') as f:
    txt = f.read()
    stmts = txt.split(';')
    for i in stmts:
        stmt = i.strip()
        if stmt != '':
            print(f'Executing {stmt}')
            query = SimpleStatement(stmt, consistency_level=ConsistencyLevel.ALL)
            connection.execute(query)
            print(f'{stmt} - done')
with open('work.cql', mode='r') as f:
    txt = f.read()
    stmts = txt.split(';')
    for i in stmts:
        stmt = i.strip()
        if stmt != '':
            print(f'Executing {stmt}')
            query = SimpleStatement(stmt, consistency_level=ConsistencyLevel.ONE)
            connection.execute(query)
            print(f'{stmt} - done')
