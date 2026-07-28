Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0C37C0E2;
	Tue, 28 Jul 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255967; cv=fail; b=fTu9unq8NRghhQmmBqfVGG/tuyeMwohJukcackMYZgQY2/sRr/c/DU1fr0Ij8pLgQCSxp7Or4kj6Qq2QOhobtlo+pHuq1CyOqkNVokKTcyiAPjMHb1VRQX2nbKlFDeEYlaiYjnv5AhPJ7DbsjxCAsBPhFWosH5n56opbH98uZXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255967; c=relaxed/simple;
	bh=9vS2sNqkAwsBOb+4YWLcM6jcSJQxUjnFweC+02wKWOo=;
	h=Message-ID:Date:MIME-Version:To:CC:References:From:In-Reply-To:
	 Content-Type:Subject; b=PApVPCXGkI+DBu06gFP3Jax9mMU4M4e9Kh0RbXfE60vaGY3z7a8uMfiLiq3CMpw7+iksPq1Dg3nZIPkt2FRryjA2X8oqSbpdAA7QDg7/EM97yAKmcv5EBhEkdi6q1wPcDVQ71vfczeidK/Ay5hOPbaruYHPNNCWMQLa7oN93sw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=gCjBBC7n; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YAHBCWl8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="gCjBBC7n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YAHBCWl8"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66SEdmue4024869;
	Tue, 28 Jul 2026 11:20:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CFcb7ctQWMy5LF/FvMR7Ax34CwXl9rVnlPK89PXm4
	jw=; b=gCjBBC7ndwEEAfch7GVDXwA93APVj2GDMvgsBVOXhFup/QzWzIlz4qj4C
	pU6RTauO2DphPC3MN66wbH7Avs9R6nJ80flss7lTKj9j9VwF5HXhPtDto9XSMmyl
	6zamGyfP7dJszccN7sCENs2862HSdmMcVtUr6S8g2DOpnKeZ8YIuwg7ZiOXZSC44
	mHXH6nERwJ6t/R9SuHCYtPSsBJmQIC/gzcsjVGvg0McnrLzLnqPbiPgQL1/wV3J4
	AvQlFXljnqJn0vXs+cw4eZegcmsDdQtZnObv9QL6owCEZ9X7HaGYl23YbQRYHNpI
	4lWqnjmp1HouDQXa26ZbsvIWnR0/Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012020.outbound.protection.outlook.com [40.93.195.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fpufxt6ge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 11:20:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBz4396OtbJiAsJ0zlbrK/S++NPOLd2oNmuHFOh1yRtNnrNSdl9REA4qXsY25IbkFfIx2eXyWNN8k+koY99MF/bJkM0q19oqqoym4bYq7XGquzCXMk624zheN7c4yWHBAqd5jExCm9/ucNkMtdvHlG9wb+qpaxpJkuQuvplCwzlUo6Sj33vKEOJg2BRNY0SJSnwZksti8Zi4qiXlqBdJYSWb+20urA+FizaMsOEbDji3NRYLtnHA7LHxyqrva5LeaUcVHmIfW0NpSi/UPa5UK1gTUct4IOGUXb8AGAQ4BcygLdU0GJoZbmu76H7eigs3W/+o0BFTMW5d4TnMi1Oayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgvVj51IO8P5D8LaXZNxvifru4kGjYdRTWWWooADLEE=;
 b=DdOz11MU5CDH5//R6QgCp6M+qiDhFeV17LHfdHed45fQznfawrJNYRbGNR0YqfD1+hZD9gTF2ofrSJZg4AZr94V5lFeHZIHCtnMpS194OgihKdzdSbJ4fqEvIya5AZXdr/+1YD1UkQJJoZ7vBlDN44Fg6yR036H/mNd6XYlg69p/aIUfAOLRyB/qQCOf07yidz0mM1Bys7jQ/Jmm899SNNz72C0UL6gsoH47ZsCxOkL+4uSJ+XhrVTw36AkoXK0fE5GUk0QkOXKMLLIw6DyxiyUQYPUq24/F2OCEBekJ3ln1Jy472iyiBzeO6spGhdH5oSUTytmtzXiRcDV/jWMNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgvVj51IO8P5D8LaXZNxvifru4kGjYdRTWWWooADLEE=;
 b=YAHBCWl8JOTplfaEV7lTTcgHHI3yWGEWOdRuArVLLnaXbHum32QnX1xGgIDIYwhVsPw1TUoD6hH/j2aPqZbxTZGr3DvDaYjhQp3xa17GlrZs6XuLQJpjy7jAxijIFRBB4w+5IVl6GuS903FwSfMuBKuyEsWBKPGAuY4GRwYS7YQ=
Received: from DS7PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:3b8::24)
 by DS7PR10MB5998.namprd10.prod.outlook.com (2603:10b6:8:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 16:20:05 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::2f) by DS7PR03CA0019.outlook.office365.com
 (2603:10b6:5:3b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 16:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 16:20:04 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:19:56 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 11:19:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 11:19:55 -0500
Received: from [10.24.53.80] (yashas.dhcp.ti.com [10.24.53.80])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SGJlOI3034633;
	Tue, 28 Jul 2026 11:19:48 -0500
Message-ID: <07f536f1-9a60-46a3-bc3e-fcec4bb7ce02@ti.com>
Date: Tue, 28 Jul 2026 21:49:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <j-choudhary@ti.com>,
        <luca.ceresoli@bootlin.com>, <andrzej.hajda@intel.com>,
        <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>, <s-jain1@ti.com>,
        <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>,
        <yamonkar@cadence.com>, <simona@ffwll.ch>,
        <maarten.lankhorst@linux.intel.com>, <b-padhi@ti.com>,
        <airlied@gmail.com>, <jonas@kwiboo.se>,
        <tomi.valkeinen@ideasonboard.com>, <sjakhade@cadence.com>,
        <r-ravikumar@ti.com>, <conor+dt@kernel.org>, <u-kumar1@ti.com>,
        <mripard@kernel.org>, <neil.armstrong@linaro.org>,
        <jernej.skrabec@gmail.com>, <devarsht@ti.com>, <rfoss@kernel.org>,
        <dridevel@lists.freedesktop.org>, <d-mittal@ti.com>
References: <20260728124224.774785-1-y-d@ti.com>
 <20260728124224.774785-2-y-d@ti.com>
 <178524895001.2116102.6714678554328277201.robh@kernel.org>
Content-Language: en-US
From: Yashas D <y-d@ti.com>
In-Reply-To: <178524895001.2116102.6714678554328277201.robh@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|DS7PR10MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb32841-b778-43b0-0f4d-08deecc4150d
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|23010399003|1800799024|18002099003|22082099003|3023799007|4133799003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	apqbJUPLQJh+hMFroEEl3O3t//ZUUdzm5nquWDwY+Q5mk1Axide1DNLqVx2i1DBNSgS/Syn97bCmjgtXMUleq0qIPUCfSwmxSaarmQz6SaNLsKAFqBo/sdeTazX1aubcVZCQ8/GMkDkv/qpd0gUfm/vnUvy/AZlFmHoU16ahLE9lz/wAHHKZ//F3ddqr02KKeeNzCQ28ZgX1QyRknkXrHV1ueWJzZBu4n6wZLHnjDFD+r57IRHH19CmIWVNQ+AJGJISKHIkTG270DcDhxWcX3JJ33d2wFVMOi5VOv4BtuNKg34Crk9v4eUXDaKxvWxZvMmhzeFOgsYDG7492MwR/rNTqYsYTFJMD6HzQHdMCpS9vsZyUJ2PFWsSarShcrCp8IEzSVsZRM1Vho1GNOADP5iavdK5JZgWo4s1xP1z1GpDgU+XTPa5dID8xU9RSZM/qHifXDpTCkq3afaXiha/AY7BDxl9FER0o/uoqAMKdsLj9wlC+4ol58FbhBsC974YCphItx7lqqo6SVp8AiWe/BpMHVIKAErC5/lYkpgHAvHDqt1LiMzCDhTKa+R+YIu4slB3LTbyIyiWMsyR6pMM4LzhnZhEXskF+NOHT8d/5ueMPTWPJvjM1okdqeP2g3X332xLpztkQEHh/mPeuuIhLiw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(4133799003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3amh8vH9TS/zvk4Kg3Qu0ELiDT8vpbzp93VJ8PLFuzhvQs/GbpxhuxRLLClp7ovImLnRYbhWyi1KEGoBGuhnyDcADVwhO8rWYOzkxJaYO4D0oYYEWZ6/j7s2tZCOvUHrewWf+lFC+LdQUefWGaOINthbrX7FUubpkYfFkq49rfmk6jAQTvnxxD4Ox+wmY8M9/r+mZ9DnB+mrFiVie5DWsM4D9OipJNaK0w41omd2HgvpbMv1Wz02D0iryRqXk8uvMiRyCW8M2Q+pN+asDAvFiZ2daColcZEk2pFDcWbuLMppcLNjg6vJ3kmsUr1r+2sH6vxkC+vFcJGV9tdDVlGgBjQd6pdlJyVyK6lXYnXsWxDywQLq+zoLO+WJTY3NrJLhSalh55du2LVw/Zj2BG1nGCqHhu//oz+rVuJe/XBtxa5Mh2YhG4Vhte97FFBuFAAr
X-Exchange-RoutingPolicyChecked:
	AYBn2TT2C61AHUK7mCg4vzLPLwCCns7isZUzZFhm8yBtoBw6NO35GkcQAQVE+1GN3TH6Y+Co6tnrHw4F9rAknPqT6khWh8q6cgWqNMVamPDeq5NPXtnN7lq5bJyVqQDhmt0vVpdv8uXX/oEAEu6FFahgoOdYZz8hCDFk9z7vGcyXzeEjyM0jOhXGLhWp5YbvPymhfpQZ0zgASrQ+dGfx7mGTc4+GktxGRov6DvrW5u4FUQ0Q+AFETj15Md9eBK/a4aEn0yjn3OvWosmgbrBfDc6k7MIQ+ymspiiKVGcz43QWNUofbpgGdzI6QsN0aCdXQ3Yq33lFnF6mtWKAD4A2ZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 16:20:04.3147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb32841-b778-43b0-0f4d-08deecc4150d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5998
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0NSBTYWx0ZWRfX1V6IxA/ZypX5
 FKJKpfaJHGkUUsEp5KHOES4l0c97775fJaX6LuK6mrZrAQpelOliJW0/Ln/YX96NHYP1OSFTULg
 2KNlIzVui89+FSgiWy53AlRgNZ58gJ03P3UnUe3nsG2wrN/SUnzAA3sOOoKYR7obDHkShiOkfM2
 5l7CAU2OPuRhBD5INAVuHDjmqRWcrWtUGWS6BlyJWfbMmAbv+yzpyiu/lWwsLoieHxW09tIIaVq
 3oHBsMpFvMAOPnrVUYGk7hP9/jdy23bgNn1JBQCz4R9rWiJxkmELc+yPe42lxVI/HehHZ20fZSR
 LAqWIiBSO+cSZHhfsbgdDY3rp4LxEHJA+qw9fKVA1+ohKfaec9WLnNhmIhtMpEaRJlrLMw/DtBU
 fnk3oYZtjQFTpjGFhXQJkr8zAgLUwjoXSQaEPgcc3b2/w2gqma64qz8L9rY4asFfz/+0MSHuPz/
 bIOP1MK0s3uAbnxAsCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0NSBTYWx0ZWRfXzzHlBdGCE78K
 bnVM007LkL7D0Q0xEC6LJg9xowNQq/UsP9EsSsRR6XAhlKenYkLKzCXKmaFE+COBMZsLQeK+rdz
 aIpduLuFNiUJLpDpl8YLjCxv1atyIPY=
X-Authority-Analysis: v=2.4 cv=a70AM0SF c=1 sm=1 tr=0 ts=6a68d6c0 cx=c_pps
 a=88sJ5CXPnL4yMuzzfZxD4w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=RpNjiQI2AAAA:8 a=uherdBYGAAAA:8 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=WLdAmb08tD0yJPlYAzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CtdQWZWwXWPhgu9pV-5ZEgafUjIHkEwH
X-Proofpoint-GUID: CtdQWZWwXWPhgu9pV-5ZEgafUjIHkEwH
Subject: Re:  Re: [PATCH v5 1/2] dt-bindings: display: bridge: cdns,mhdp8546:
 Add no-hpd property to the cadence bridge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280145



On 28/07/26 19:59, Rob Herring (Arm) wrote:
> On Tue, 28 Jul 2026 18:=E2=80=8A12:=E2=80=8A23 +0530, Yashas D wrote: > F=
rom: Rahul T R=20
> <r-ravikumar@=E2=80=8Ati.=E2=80=8Acom> > > The mhdp bridge can work witho=
ut its HPD pin=20
> hooked up to the connector, > but the current bridge driver throws an=20
> error when hpd
>=20
>=20
> On Tue, 28 Jul 2026 18:12:23 +0530, Yashas D wrote:
>> From: Rahul T R <r-ravikumar@ti.com>
>>=20
>> The mhdp bridge can work without its HPD pin hooked up to the connector,
>> but the current bridge driver throws an error when hpd line is not
>> connected to the connector. For such cases, we need an indication for
>> no-hpd, using which we can bypass the hpd detection and instead use the
>> auxiliary channels connected to the DP connector to confirm the
>> connection.
>> So add no-hpd property to the bindings, to disable hpd when not
>> connected or cannot be used for hotplug detection.
>>=20
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Yashas D <y-d@ti.com>
>> ---
>>  .../bindings/display/bridge/cdns,mhdp8546.yaml  | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:=
30: [error] syntax error: mapping values are not allowed here (syntax)
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/d=
isplay/bridge/cdns,mhdp8546.yaml: ignoring, error parsing file
> ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml: er=
ror loading YAML: mapping values are not allowed here
>    in "./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.y=
aml", line 66, column 30
> ./Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:=
30: mapping values are not allowed here
> make[2]: *** Deleting file 'Documentation/devicetree/bindings/display/bri=
dge/cdns,mhdp8546.example.dts'
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml:66:30=
: mapping values are not allowed here
> make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentatio=
n/devicetree/bindings/display/bridge/cdns,mhdp8546.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1703: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> Seehttps://urldefense.com/v3/__https://patchwork.kernel.org/project/=20
> devicetree/patch/20260728124224.774785-2-y-d@ti.com__;!!G3vK!W-=20
> t7VTYjMiEiiyA5HnNwMPXZXIDl6mIiVFQjSxqG20XM1FTyTXYmNfyADL2cjwLH7WdrUA$ <ht=
tps://urldefense.com/v3/__https://patchwork.kernel.org/project/devicetree/p=
atch/20260728124224.774785-2-y-d@ti.com__;!!G3vK!W-t7VTYjMiEiiyA5HnNwMPXZXI=
Dl6mIiVFQjSxqG20XM1FTyTXYmNfyADL2cjwLH7WdrUA$>
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

Hi Rob,
My dt_binding_check had passed, will upgrade and run it again and send a=20
new patch.

Thanks,
Yashas D

