Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3F432E96;
	Tue, 28 Jul 2026 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785242725; cv=fail; b=NcNSTKmSJWPxo/9YOQ+vhnBnq5/5OgPz/hP08hnRe2kkB+oFH+ntDARA/y/Hr7Ul9p8bHD+fPfouGr1hyT2FBCyEZ/hn4YqCI8nk5EYrpl+kbwe+ufuF0js7uaC/0Q9ow5Se3qc6riCd5EmF8AeeISEu6Ovls812e4lAhehUda4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785242725; c=relaxed/simple;
	bh=cZXt0QgTzt6NfwGopFrF1o0laEw+jbzo4QmHLaUmLnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KImf3M9DMjNWCBxJYhEz60GbttA/B2ysfy4ap95++HusdfT6lZd1lPZzgqq+oRuGLaC1iXcD1i8bKzTgEp2pzkVViLi053LTAoYDNrGho4Vg/zKo6plZa6JxPnFTOS0dQDbxZZZjtJPC3+B1fo1EIPr/7lKm/wrZAyk26YrslpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Fvv9azQr; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gHeSN5pQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Fvv9azQr";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gHeSN5pQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBEn5P3852537;
	Tue, 28 Jul 2026 07:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=FSEAfRKuG/hnocoMI5wKiJzTyiYyBzVRwff0YPHzu
	3I=; b=Fvv9azQrAGkSMEMQgYP9Q9NaiF65/26/DJhotCIsLDmR8XuVCRnT1csI0
	1r74WgzEKI4C8dWqwMHYnU+4BdapR3CHSc1VEjuA7FpWS4s47zCRA0xtpbgTBtRp
	dOWRxm2HbzJkCNY7+ETJdUoQMV0LqS9u1YXUe9C1LGr9onCk5uy3dtqECexUDWBs
	aa2tgFayQXNXaOzjQ81tq7GwwrB+9jziUgKDivOeE1Nbw6LuCwIT3UOTP0OJY2wB
	xfnIWxPv+mNEXgxiFKGLQP1ojLJC6kUJqN7oKUIa3q8bHARWcrPVYED/MQX6YS3L
	21jnITdGjTcBXXGJ1kkIuzkybGuJg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb0yd7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 07:43:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctC6wWSF/3KNFZ6Vv1JAx5tDv7iglwDYYj+BBX/EtNZfpfaAM4TFjc4AfJ/dkWkZ0URx5ehfXBQUMJIQ2a4hI0UWFODLnbV7sfFkwP5jy7JR8YAHAU6Cd3O7pE3OloxsJY7+5rEyUOgeytx24Ehg+xmtsCW9j0cnja471yd8+urMjFoX/AfqBJqXnpmWa8qkKvnWvAVovNhRTa8C0L8OdvP3pzs9plV/WcP/tNG2sLn5YIuD26wTXheJ7lMBeWd3MpqmUF1UPgnKdXU4Uz9VX/pD4oBnjOs1BkzEbh6wSPn+Ey25BXAvzh0mxpVhAd2L90i+A2Y1v+Cu8g2jBqq1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSEAfRKuG/hnocoMI5wKiJzTyiYyBzVRwff0YPHzu3I=;
 b=Y4Oiw4KA9h2zy/FNdI8pTwjggVsxgpNQg6T2oavnqSAH41/r5B3/jwKAXkb+ckQ0Ot00Slyk77jxBVJVvQf0x1LZoZmrGIgueA4Zbz6H/olEgbx/57ZFIL6hVa3uyLHxp75maySmY51978J1d5hCWy/jZGEskN6aJhefLQop9Ghb7j/ihb05OQYzIwvxvtN0ylicNlTk129TpxyLlkc0iati1JNXsh00gijMUzhaR6ivQ1ffyYseA/lQsJgqQBOthRpQo2fakQask+yu3s4MT/TVdPtugvVl1tYgNGocix5+aTSEgI72mi9RWtUe56t5eKaqeo4LW76YzYAxeTFNtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSEAfRKuG/hnocoMI5wKiJzTyiYyBzVRwff0YPHzu3I=;
 b=gHeSN5pQRbrrDmgbvWc7FK0bAgAK7ULZdjLkp9txBBQFYhn8ga94p7EhkLY/vrr+njcFklQPgNI3pFHU3+PMQvDh5zmw1A5mnp4nQBOumf4+ZdIjW10vm4D5VCT3VjDBaTmqAyZ0Fm0++bAXip/xTW+XYmkEROvBCnd9w9iljEw=
Received: from DS0PR17CA0022.namprd17.prod.outlook.com (2603:10b6:8:191::21)
 by CO1PR10MB4641.namprd10.prod.outlook.com (2603:10b6:303:6d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:43:52 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::6) by DS0PR17CA0022.outlook.office365.com
 (2603:10b6:8:191::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 12:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 12:43:52 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:43:50 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 07:43:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 07:43:49 -0500
Received: from yashas.dhcp.ti.com (yashas.dhcp.ti.com [10.24.53.80])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SChV3Z3330720;
	Tue, 28 Jul 2026 07:43:42 -0500
From: Yashas D <y-d@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <airlied@gmail.com>, <simona@ffwll.ch>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dridevel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <luca.ceresoli@bootlin.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <tomi.valkeinen@ideasonboard.com>,
        <j-choudhary@ti.com>, <r-ravikumar@ti.com>, <sjakhade@cadence.com>,
        <yamonkar@cadence.com>, <u-kumar1@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <d-mittal@ti.com>, <b-padhi@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: display: bridge: cdns,mhdp8546: Add no-hpd property to the cadence bridge
Date: Tue, 28 Jul 2026 18:12:23 +0530
Message-ID: <20260728124224.774785-2-y-d@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728124224.774785-1-y-d@ti.com>
References: <20260728124224.774785-1-y-d@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CO1PR10MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e372e6c-5be5-42d2-be57-08deeca5e141
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|82310400026|36860700016|10067099003|56012099006|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	cQlIcK2/pTDXMimDJSQszTy5G937y8MyEtysapodwDAXUo7LgO/n6o1tQbAGhoV2RD/wiKJFeYU2lsvmcam0S/hu/lhP4SKxgGEbfIuJkn3cl1g45ZeLkrRv7OGjhIqsXqz8IB7kYKjrGW58OMw16NKyHHScWtEXIQBU9P6V4LJ4JKgYBSbIHnh/xUgvG6fzNShnm6vP+toJfhms/ev9XPDHjPPAFncJq+iGSZnVa1PskcVlufNLf8Reydh1ZDt1zR5FBQszeoj2yICgJpfPz/TZS8xXVTr9+NNjV6m0vRNlVwyvCUu1AAUcgEWDHD4OvTvjZQ9SddgOZGuX0GU9FQTlA3v7QuW7436KccfWCFrTBmd2nTZ1tev3ntp9A7lJBlw5miQBzGm8IqzM4ojSsrymyy04zR8yv2sA17suW661YhUrm0gurWjQ/jRwU0ebsY7xw/gCTLBQf+/jF5Gn2nTeeptutwGa+P5kjDyjNJNYx+Zn3GDdUQfr6YAJ0nYFBeq/QOP/KSdlgcIBKGpxZqY6SU5F3I9f4FKjUW308IGx9S0dvt8A2RS6E+CaZKmRwvI0+v3Qpq7eQcgtNNWjdI5AzU/qwgcnG3WHoSfAwptQyyHO5yz7ff78o1HHAmdtqV6iCofZiLl+ABWUDWAnLZBCmEcD/e107gl3g8gC5cj6xSCmRBSl4CTFTieSmgfIFfQhZr8+ZnzFG3rphwrIUPpckyxc35Qh5JaZdKhT4XufnvlRbpvpVc/USyIaShuq
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xpucRINE/DkPszMh7D+tJqREud5FHn7DJc430Uw5V6c86SMCxfwEmlJGhMsXm0sM4herWDxPh016+hD5aWlB2tAAEbXRK5in9aEVappnoUPKxQvLcaVlUEmUKgpUZKWlE268t5hvdBzgLdRAOGBy4ZFx7wgCy9tZQetCeCET3ogaX1Ch++G96AXBFmubPQHFWeyvTE+gd9R46s2O95xaAqD85KkAf7RyWjBgX0JeS9NfpqekEMgLJ047dNbs4FPiRslgQUPsKjuGBuJUXihKIAca5HCexAZtgvAVf+XcUX5jRnyYvW7oxdavxCJ70+stxHN/xNwGuZzaQvioogW3KQy68D85U06B6jC11TKTsucuGU0+FPwwKxpUs3+CRhKtXIUYkZ6mVD4qd5ooNhG8VbkSuPp7OwCK3GHcvZObgi1TdqF3UmvAJMJgmNL3Rdzr
X-Exchange-RoutingPolicyChecked:
	FjxRCqkEJagXUIKTnnrh7ArM89B3wQAxI5P/XIP64exYRwGOjAkTFcPMDJ+M4xgPMGo1r6p+t3Ll/ODVnwcl48pMQKveh6y1IpwV962mWeLWAtlYyJdpjhYi+M1wbeaq/ttVM/5xB3XBfP3/5IQDCC6HYRQOIHOLLC/TrOXUuOlw8X9XwrOsuCF8E/HoBBd5GbYsfQiB5H0Bss9rvhBUCQsmJLa1A3cVYspIf+qr1LwNRnYGI/tqRp05bkLOSISKH3RAOVccW+lTB5Q0ZK8akriH/qVoOz9IF9dLBqHUbKs0FFEXFuR31OZDWfx/NtDctqMOQ+F7Pa3yIu55jyx0fQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:43:52.5088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e372e6c-5be5-42d2-be57-08deeca5e141
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4641
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a68a40b cx=c_pps
 a=+UayH2mdqs80qU9+PBkj6w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=EzX1xrUl6JEdRszeJO8A:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-ORIG-GUID: kF0aP4mWw92UxbFHk0kPgcAX-FPA1LSy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMiBTYWx0ZWRfXyBSVovWitwuY
 hLz1vkbahzpi5qG+462NIB5d28Z+4mk8IlYvjVgqgQR7VEeZ7FTz+zTp1kef8gJlFSzw3VDdL0c
 9HP4zUKXtYXhZ14nMC830r5VdKZ0o64=
X-Proofpoint-GUID: kF0aP4mWw92UxbFHk0kPgcAX-FPA1LSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMiBTYWx0ZWRfX/r4sLes+ozm6
 D7GTMCd0P9jUPZGJOJ5/b6i/nFCa2kn8rYSoJW6Ffc9YIfU3i4uf2lZXBu1CcrMRJUUsAAHsFRf
 Qnft4zsLPr8ooRB05OE9pWXHb5/U6xpEG1McS8A1dih/ad299Db6E0Q4ta8BIcSmEo39C1P+l1p
 jwg621jgEBIpPC93JLKsBcqzcFJABDf/CDawCPjtbsaqIzxcojQQ1XTbAQyEGz1cLQ/C8YT7TJU
 MqZ0IbUnetgjDrT/69e5HpCJHOvB+kHWI+x97cUWNwO4FNx0uywqR8exnnfebtLNqGXFs2CZu+r
 4oTYr3QoYgm6XnyOGsB1da/wo3RVZWhvZ5fR5QWhHxpao7gTRx2UOX0gxOkPkxI378B5jpLlAIz
 WcbguDsGvtHAITvGGodkyIPV4wW7VOiJAWwXbA3yAsO69gp/1946a2AngeXGJY+A2lA+PoIm+Yb
 IuV/39idLw3SkWwwGFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280112

From: Rahul T R <r-ravikumar@ti.com>

The mhdp bridge can work without its HPD pin hooked up to the connector,
but the current bridge driver throws an error when hpd line is not
connected to the connector. For such cases, we need an indication for
no-hpd, using which we can bypass the hpd detection and instead use the
auxiliary channels connected to the DP connector to confirm the
connection.
So add no-hpd property to the bindings, to disable hpd when not
connected or cannot be used for hotplug detection.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Yashas D <y-d@ti.com>
---
 .../bindings/display/bridge/cdns,mhdp8546.yaml  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
index c2b369456e4e..f19a4900ecd8 100644
--- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
@@ -57,6 +57,23 @@ properties:
   interrupts:
     maxItems: 1
 
+  no-hpd:
+    type: boolean
+    description:
+      Set if the HPD line on the bridge isn't physically connected to the
+      DisplayPort connector or cannot be used for hotplug detection.
+
+      Valid use cases include:
+      - HPD pin not routed to the connector on the PCB
+      - HPD signal muxed with another function (e.g., audio) on the SoC,
+        making it unavailable for hotplug detection
+      - Hardware design where HPD cannot reliably detect monitor presence
+
+      When this property is set, the driver will use auxiliary channel (AUX)
+      DPCD reads to detect monitor connection instead of relying on the
+      hardware HPD signal. Monitor detection will use polling rather than
+      interrupt-driven detection.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.34.1

