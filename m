Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CF2F8EAF;
	Fri, 19 Jun 2026 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781850486; cv=fail; b=DYxfbA6rDHXXY4yfEvvMHbM0jQZbnpCZsOJfnzl3AEGI3wRQ+R05XfixGlfn3TRxDlTHvKFcFEYJw5hgDWOWguojTFCVVkgfs4wet9FBG+6IGkCv0qljKkN9kndKH5xCY4hshTN5CGRiiiDOqQzZ+jlvH0FIBRVHWwvPHc7arCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781850486; c=relaxed/simple;
	bh=cfnUhLAFB7CK7qF2H+MZZQogVFEXFxLGYVPpt+gP5u0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YDfPXibCQyGl/HfYiOm/wEjCGbrPuTqzAMUjgqmdCuxFZ/OnVAm40jLICjnlcAvE8cPL8RLB0mNKwmdP50+lq1aPU9vQGWUqe3gkOZOlJFz/hf6VTlyd2LovxefVqu7Yl86IEOfuCi0WpTn/iPsVxM2khh6Bu/JIRVd1ndNEb5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=m50TBLMU; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=E2RxIpJq; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="m50TBLMU";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="E2RxIpJq"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65J2ucIv974945;
	Fri, 19 Jun 2026 01:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=QyeEI5OGWzc5J
	STdXFh5wVFtJ5UF/sE2+36u3mI4LIw=; b=m50TBLMUPBUYARYBGMbn0IzVE4dq+
	SivWBbzdzlr++omrnqxpZcDBpZZiD+GubqKW6topGOD0ltGz7ctKrBMwJv9ERAte
	4gblLCVpf5oNO+9/yBDtg8BGMw8END3Qsd9HQweo11XxKF5SKQfO8orgIck4erMk
	lUOloUp9CpxGr80k/c8cmeHwua+M0EPazSAzvfBlIV3FLIBMTBYIV6tmIer/UQ1X
	4XW50HSlG65BmXtBIPIWDeOc9RJDG1RCnvr+VHj4/QhEDwnozEU3EkZCcILO5MkT
	gps7hRqvMWlJQ2YOVGWw3Vg7dueVB6PEYhsM26PMw0mE17A0tCUIBMKVQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4evfmme8fe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 01:27:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv+Q+o149pRp/JWQ55ZNiqP1LPG8r/76bbhaBu9KSQhfP+hnzXhSbPCu9pdSI1g5OWzbg6Wa/j8fQXjRyvrS1m8K6LpR73wkWJ90o6TbxW5qyVb8BO34FzOn2K4MksbIOTo5IHAioHu7ymnT9v82x6T8vDsvBQEZS/Z3kXhvQ1I/C+Ybjx9LUtgepmnJFc4kdyCtiI6inv2qX8aEAMSzKu0U/O0xcL2dcn16YNxgagTSTBLQ9GaXrKVrEIkdD9Ei6blbWHTN+OTU0LytMLqc4P+Vb4VVS/pBqhCvWETwyS5D11PSWHKQPP4f9tHl7c2Pz/hyHjj8MfZBYq9Ee0PNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyeEI5OGWzc5JSTdXFh5wVFtJ5UF/sE2+36u3mI4LIw=;
 b=G5TX4GP7Oe30ug3rxJAz7ExA0IMKdnyumQ5rPLw2/U/FxWWXRUSiYQLdOJiyhCWbIbQXxT3vxjW/Y4YsvIQqx0AkKHUQD2+mikOZADIBsSZVujkncgRkv2ga0u/CKHoONR/bxWEaxiySsVRJg+z9054zGjwdAeHNCy5GnriX9Uv0YxWixEt9def51N2MCDiMcTxrDoDzuRNIuMWQ6pcCHUPHeaERjaRJCLY6mL9XbKj5VMbWmDG/NJtA1OOGUHBok+tmp6HI6pREHmmQ3qcQBEaBUt32WVnhTk961YyJCeJgd0KBWIKr5ou4GQiZ2U6ElHqmRCm8QIX8PKt2+vVa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyeEI5OGWzc5JSTdXFh5wVFtJ5UF/sE2+36u3mI4LIw=;
 b=E2RxIpJqKcWWkubFpuccKY6A5p471dD3i4WEXv96ytzOjY9N7EuQNs45PbnfAW+KynyvR4IdJpjWmk90iP2xH+YzDlAQBXVCeXd3S/d+A0TGvfu1W7dMBb6kBA9xwUt/7qsKC+p+CfGg6i232zCJ6TJpbu/AGvabtJY9bMN2BLE=
Received: from CH2PR05CA0051.namprd05.prod.outlook.com (2603:10b6:610:38::28)
 by DM3PPF2867093BF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 06:27:55 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::36) by CH2PR05CA0051.outlook.office365.com
 (2603:10b6:610:38::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Fri,
 19 Jun 2026 06:27:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 06:27:55 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:27:54 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 19 Jun
 2026 01:27:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 19 Jun 2026 01:27:54 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65J6RnDF2097702;
	Fri, 19 Jun 2026 01:27:50 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v6 0/2] Enable audio support for J721S2 EVM
Date: Fri, 19 Jun 2026 11:57:47 +0530
Message-ID: <20260619062749.1575066-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM3PPF2867093BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ea1afa-5116-4eae-11b3-08decdcbe603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|13003099007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZgRU2lqqLdE15TLjy6exYk6ujtXowFZmx20XhFcwcaGNMtIIBLNjfP1jJCLnSkr22e2NYrx6oUSINUZPHLvFwaTduViM+vQf8fnbb5xttJynab3tldTVmuvGrv95b37g8zc1i6F6DmoYAUx5/NL2kc/eLtvTTIGPR7cbtTEZJeMpSnV7z3idGaTH00iw2/WfRzJwSNhq6UWjTLBgbaSc99HvduTDG3FnVdXta7o2gi5O4GENzSfRlDnCSrEsnExBKQdnyr2dOKeIpQZcoR/UaaNqxemR9XOnvlqOIoL9v0U5qgWdCs4dxFVZBV5MmRfVaTsprefb1D4/nn0Go0reTA7r85CpvZpsY5r4wxH2h2VJM0MPS41z+1k6k6MU+UrncX4KC68G9Tyc/4oaZqXtsQXh6NzWrLtRueE/iShPUcSQH45OKxiBovSO3DbISFYyV2UqfZNzxXekNhUtW3U4Ob0quAL126D4ZvSAZXjanwH12EpuK7QmMmorGND9eMWTP+LI9butpnFcPLL4Q4R5IhT8eXj6m+a+bJwVLmFOXJos3oBs9A6bEVwgEWzH1pCRzlCGzKbq2JvT6u5aK8Nfa3lHyge7aT12/OUGyCixeXYUad6wm7VkIizvqC8bP+5NHCTSqahKbbBS6XrB6oQZH2V4ErefAOwVsuXdZru5wmBhEdc0W3ZwPbfBMkla4rGuKOkF9Orwf4cAAUu3AftusA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(13003099007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WdwGO5DxF9roVU0PL+1Z4cgvJVy/iNBWK8KE+ZSQ8iE9DjtHu4PBkxXhYxwypAc817HqrULZ4l44S+wjwssfetvaqpD/LfEtExSsF5Nj23FOh1TPMWY1MoAyjJkN48UnEyPND9dV0y0iQMgFIq/7+WLjpkWvZ6y1xF3YWu3vGU5bMLhMCwVclguWhcULvyG9FFtwY6G3lVGoL/7vKLQCbyBx0lbppQCYjKYKh2NaDBQEobyjJRKMIkO8f4gDt6vIUdsS8Hgj9knxGcxkv1j9bq1tX/fBF5sWS/iNWEbZXYAesmBTRrCZ/BKKgeyMkd2sNC8E5WI4vrlIgwaRB8t5aWl86BletDJ+S3QKXmp7NJsNOkEfsQEAjvT9HTwXNKde+axWFW8Ap1ss5GWnBop2W/r3YCf8Cw69zjUrOWQ2uIlHX/XeYTPRRWqOQOhWcCg5
X-Exchange-RoutingPolicyChecked:
	AcGRdUMArU+oQwMOYY8L3ErnV6B7tgyu9UJDGJmQWAoctH3RMOk4o9IqSwhaJYzefOfrEyx2DE/0sv7GyBVqPmRdMEj7QR+NMTXYJE8uJQIpVfxh6co7j7JMWEozMujRE5Su5nSc3mw881ncpMouRkbDs3scI31Dn+H8yzdTyJPQ1X6Hg+sDvlrDEZfe0QGywHZUFtBE/NYohg7sIsLSCRQvL9yvhDCmH0uXvoK/Rk2mfpy/lQzF2I13BdtegOgng9paNUvOkNUkbchGar023KsK9SssWXRfHluyGP3ofCz7HObs3ax6NaBhcruh1c7Af4kT0fmh9ge0oj3DmIZ32g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 06:27:55.3180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ea1afa-5116-4eae-11b3-08decdcbe603
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2867093BF
X-Proofpoint-GUID: tNHn4TgIvMp641Ey1nTrcAlH_SsmXTET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfX/PsCbbWyjTeP
 t/I4TUnyCDf384SIBiXS1qFKtAHC79cA0wSLRh3Ub+NeRCgaLWrQDN8KoENu/KTWbFyR7nN9+HC
 PW2grp5CwR0i55fH8b8l2x4dmsa9vEmfRiWHvRJVoOVgmSIb/Xd1w+xouT6a7Iu1U+NSnwKdmGM
 HgpqC32d6HurW3PCxWRbv1lQPYmsC7Ut34FKQIMtetWc+fGpHpM0GKBwHUAvI8/amXndDgosxLP
 OTNXSUUWJeXvIbCduBE2FqXzB8/UKh+WDlFkRvZv+qk6cNwmPpJYpvlUy8n7O9TDjbHxEOBUGYl
 VC3EVH9MaHMmZbqj3nRyhK2+coWI13Gd7Qg7Bsgt3emzaq3S+15chURZ9Yyc2EhU1NnRsqIQkeW
 57/9Qwj8bbujDJLn1gvcV9PgbJFnLxnJWWLmH80JjVhGhMa83R6ga82ORBdjicQpvxucCkA/3hC
 QCesqUu2oBk8Mx/YSQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA1NyBTYWx0ZWRfXwObElozAxyd9
 HDZZP7PL9aHrNF+cyJt6oGNTfK+MIKkB1imhyZ/byY6w43hjCVWRaja/fu/fs4+lg2XwQEQQJ11
 s6x0bbL3DwVAbbGiGqgPOwafQimJo+4=
X-Proofpoint-ORIG-GUID: tNHn4TgIvMp641Ey1nTrcAlH_SsmXTET
X-Authority-Analysis: v=2.4 cv=Z//c2nRA c=1 sm=1 tr=0 ts=6a34e16f cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=8__9IKA1ZvyzrIITXxQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190057

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes since v5:
Link to v5:
https://lore.kernel.org/all/20260520115603.2662930-1-m-shah@ti.com/
- Move audio_refclk1 clock node from the overlay (k3-j721s2-evm-audio.dtso)
  to the main DTSI (k3-j721s2-main.dtsi) so it is always available
  independent of the overlay being applied
- Drop the &scm_conf block from the overlay since it is now in main.dtsi

Changes since v4:
Link to v4:
https://lore.kernel.org/all/20260519142341.2531948-1-m-shah@ti.com/
- Explicitly disable main_mcan3 and main_mcan5 as they will silently
  break mcasp audio routing

Link to v3:
https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
Link to v2:
https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1:
https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/

Bootlogs:
https://gist.github.com/Jamm02/8ee551c2c8db3a58a9aa7976e049fa28

[0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 5 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1

