Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6593ACA77;
	Tue,  5 May 2026 03:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952085; cv=fail; b=o6cI0OF02vsENqk+uDsre9IheWULRF0I4eiHszYioAWt456VzeI97vcx3OgM+JBfQT1/56diXS3cBt/G03OrpkuPiQxbT1nJ61aPwuOKKXif2naitLvD88b920cG4C2+/JaovmiIr9Qj73MUSF/4SSdr7p6yGuPLdl/I7DoM9hQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952085; c=relaxed/simple;
	bh=LNZb29Z11V23Z9GXmwR1TFgfWWEmYSvHcN1M85C9Xwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bBdIeGhxOQQ1q6T2wCPKfXW8E7USiMcUCdI1OshV5PBBvX6joA/w0lKxhrFwVfp3ewZi9Sr7WOH7mLrRV93qlpMYMzYICugQGweXE+8L5DwUlfw9NVAvNGGof2iioNpQf9eoss/gGqRoWUkTbsl/mAjP5UlH9krrVVQrV72aAoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=l9MF0tR8; arc=fail smtp.client-ip=40.93.196.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="l9MF0tR8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIufxX8fhu6AZs0w6u7830Hwf/FMcJC2ZziotUNVLyxW+9tyWWv0vWCwsH/c+R/QmS8DOCRS7qrUIJZZR8Uc0lziFF2mVKB35wB8rFHbfFky+ttozdUTbxumDjebK0zylv2t/LVZTWofbl7mDHf2Miti04nXkuPzzLELsmBBBKmS61kJxvMQXI26JkWbNTfS4aFPpQTBXC/cy44qt40pxIfH96n5fr7hpV88KDVX0OBu1wI7fmfoOYY6991+NcQzLiJKnR6hFgTL7Gr7ioMO/v7Aw6LzBZGhL2oXUjNUNkk/Dhsrwf9pmx5heMEqP1FDhQXFPJxg6blFZPum1SmXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=ln+0R9Gh1zGkyRdO6W7uhkTU5oUN+DX+2ErP0OaFbiOKoqOkNMFFihfbabOgXYB1Vz64XtUHmqMjkcY8D4taDC2teE7Yo3dbDpq8Nxlbid6ayztJNs0fxYQMREJDrfiaRPY3sPv+SHglP5sxuR6FwwqW6apJaZjbcMzeyYh5qv3Poquf4HJ+ooGOnaiOE6OgE52DmMIdHqBIHw0vIp6kv0tnTyJGdGkhKu8FTFEj6Ii1S69dt0TW7qOaDDCQhD/UEin7Nx79eHarbP6noXFsty60m39BCWTEZSVOZb0JxM31p0LUn2DRBVNGuUZdGoDim6YNoDiM/Rs+d5TvEyQDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO3+lUnL1oC37H5l+HQU+ytsNrdLba6PHtws+tGd3Xk=;
 b=l9MF0tR8Sfs7r5aI1+DDD61jEJHYy2TjWNN7GsnMXUX/+Ys8asFLIGr8d+siMTy4/fwParm0hHSLJYYa0PSuEct733lIscho7ya0hngARIkaJa7Slj691y2GcZBUn84JnKBowDIo5v6BNgJhCxDyZyCQfWs7HH531ELx3CsVHKM6vqaSZ2yZBd02dEnKCY1s1DxDzswhz9bi/xiTx8jPlKkV0XKrbbN6K9CQsbzHAA3PlpoLyamj46MJyDN6qg26EWxOsn1w3zFsLGRQU7POeHrG7R5tqCTkA+GC1ghIseEP2P/icANQ7HLGeuvC2DtV6W7Lx6ByGorDrJI1wGPGtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SA3PR03MB7254.namprd03.prod.outlook.com (2603:10b6:806:2fe::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 03:34:42 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 03:34:42 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v2 2/2] arm64: dts: intel: set alias for i3c controllers for agilex3
Date: Tue,  5 May 2026 11:30:30 +0800
Message-ID: <b83be9e6a3ea0c15c7032856cc6e67f3185ad613.1777951738.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
References: <cover.1777951738.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SA3PR03MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: bdaad352-1617-4e10-e6ea-08deaa573eba
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	FAOtGBYL43GicbXFUilTEHyNluKKoEj8xeC1jNcrVMpr2T0WZX/qPPpzq76wQ0AAu+LD2QX4xu8B9VULRZeWgLhGpKeh9oFTVG+8/slz+77R/m9CV3kG2af9ZNlEjTu+uLdC6zPBbLEhswCmcqxLfS4E1y0cKRbIhQwyzcDHVnPv7VS0JxV3CayYdMXsMCtYviqYHXVQg+IHvjwrfG891Zj4rwP/78oXUN8JBOXBGti5mHVCbEyorxrn5nSKTPeQJ/1h5JSXtoSHRynZnBrKkbHwdHwY/2vhpRx//VD69uK3CHm0JssvRjVlN1Htq2/o3Ir0XAMv73ASOf/MmOw/17XzvIo65oLOHxGcY90AAx2sMCAEd26zcAZMdCpp6uoxw62fhtUybxZbxnkw5qMLvD72EBFt7K/vbJSkUllyYU5Tdb9iJugbjzrnNr9xx1nHa5gD6qgAftBosYP2TxtWrZ2hSglVQIdhxOvIQ8jcvBWaTTeqiGnl68db06jaJS0Nerj6LBOz3NKJRlQuWXzwhOLxezxXELHyY7SnWZybTVU5XgYd/xU2CjZeYiRB9r0dI8XrtrakYkjijJT7oWJPqoa+JrYNtXD7ys+x4qfF3+R+/JIg3pP49tFxeMDAFFNfLO/6/sRJoOpnfOmOCJIIm/0F7IOWM65R+90Km/V+ID/47ixyLhNwAQcMIRQRqRLf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5dCkqz99jHf/IzdVt3Zsqh/Q7rFz43FVEZiEHTIEEqiFO1EPHMxKxanJZmaK?=
 =?us-ascii?Q?F+t6hyYQk7VxHSDq6WQWFbiW/Ad885hZ4QNrWEjWU9tOOplIXoukl4fZB2bz?=
 =?us-ascii?Q?7w91urCmQLjj0wtM4C0OQ1YQr5vj7gIoNbTPt11PUbJ58WCbKb3YsKHCmAAc?=
 =?us-ascii?Q?rvL7uU7LRGXafJJna++qgpdTqA9KOPPXNVCGidOtG3ZMQZHiYbbi8EhqucG7?=
 =?us-ascii?Q?ek0OtbHK/IkgNgeGEdZHo7WgXH0Ahzz8onPU8SPa7m75bEwLSpDWcDJJY7YS?=
 =?us-ascii?Q?xtwJSv7K29u2oZzWGGJ1Fs11S9jdL7uq3y2TfPrVANu9gXP3jks9Wmda8Z/b?=
 =?us-ascii?Q?PhBtASmWn0c7NOoPFAhesr9SstNN2hSQ3ojJ5gb1578+UmPVMJych1bjisjd?=
 =?us-ascii?Q?009hT4i1UII5MqN1EeoBEP6fH4jyLaRplpeLM1Yemelj4TGTrijw4y+EDjxn?=
 =?us-ascii?Q?hb96ydltskV59GhE6+2DEizo91vLxxBep9LgbtoMN6PgeKKZBTXru2DYKQPq?=
 =?us-ascii?Q?3/xOcZlpuNiKGxAf3X1VmwAkfZ1Up3fzDn4Os6hDFsVSuW+dOrCv7yQI+X1Y?=
 =?us-ascii?Q?ZrCJW3BoMXMidaSSjzslbkqGrVI1VGxMV/TRS6R9QQcAZSasKMh2xYfYKaGC?=
 =?us-ascii?Q?ZmTWr42ovSDuPKGq5Ax4zTmdZf6EtguZZeDpnBbp1NSs9eaO62Jd/4HEXMJF?=
 =?us-ascii?Q?RnUTHpZyc8Y0jX78EAbDTtOD5G/t4Gj6GTeU23VWgNGqWOciZlErReWXyME0?=
 =?us-ascii?Q?xTMfeO/5u51eiKSsYwl4pdvpD+txEAnrLhEE55NBExzjWOCIqetBHUbxSUYO?=
 =?us-ascii?Q?d8qsRTRgbpCI2YZe+RbkXg5h2lWTmKjiIKWGdFEErhIZMJdeJmS1FxT9Zklx?=
 =?us-ascii?Q?aHOtz+ykluzHLxHIBLkgD7oc4hFBJLef0DMJW+XiCEUqFdnZUQVeU0RzU8UB?=
 =?us-ascii?Q?xPDSIR0hG0MBKi9tcG1e2JiaMU3TkBcUpj5LbqihqajUCRnb63KNUe4nLu/E?=
 =?us-ascii?Q?36VXRZzpkgloAr15WZNFw9yrVNTJl4wWO4Qq6JyppzT3W236LZXEa5vAmNIT?=
 =?us-ascii?Q?Sgea2XFpjojANsTx7VUb/Q3tTn1iSQ290itky79RCY+fq2x8ZiPRgMO8lGxj?=
 =?us-ascii?Q?Yci3SHoY9AJ//z8RfPghNWrp0AXI9tRNtLX7n1Klq3Mpd0GlhrRnQ6v/xx9f?=
 =?us-ascii?Q?JIXuH05aXzl1wGoGOQTtrO99QWvmjFOLCd6Vm0uJ5Mu0GLAITtu5M2nuU1w3?=
 =?us-ascii?Q?1bP4VZYohmBa74r++0OtRXN9RddTO1GcdOrJaRkb/EnSsoV+jOJD0RiEY0MS?=
 =?us-ascii?Q?7D5/8Z48tx9mfpY0Gvm5ClkqWr0R9Sn5AGN26071vVeM1EjSrcx63iGR5EdA?=
 =?us-ascii?Q?WBvicrs4KfiHGiq3MOv3GiCvhe0Y47746OFzm7sN/j/uMDr3rl5j0WduC5+6?=
 =?us-ascii?Q?6fKh6ASVepKc7B7LdHWfRctw/1WmAonpMj9KYrkVsQBeWl1Agk51sZAgAQyN?=
 =?us-ascii?Q?ggbw8OnDLvGKjH3En0lcXZEK6SWByi/6RsaFgJMFhNamoD8IjUihTxNP1FK/?=
 =?us-ascii?Q?lvSjOjQjCGfYvndRPQ7+3fYD1hN8dmgQuGitcj1EVnghhmNCnG2VvWdZxZ4d?=
 =?us-ascii?Q?djrWVyfxsxTEMsa7+YDbQrAhp9MOatHuqUCntzrS5shlpi9LE+Fem69tm9XL?=
 =?us-ascii?Q?YpAQngL1WAmbN9VCHVIcr1BTtD7HgF96cJ6SAyXlRyPKBQn+2xEL5siF+uKK?=
 =?us-ascii?Q?hYq4quxubH55lWS03sN3LiaBm0L8DGo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaad352-1617-4e10-e6ea-08deaa573eba
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 03:34:42.7635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Sim0Bp4irE8smkkbyZciFiB1xpTVXgZUjP9ViXsMiajsrkafbl5Vt9caykxUa7WFd4zCjv44Ohf1Z/IqfaFzmnkqki0dMWOFsYwscyoHAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7254

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Agilex3 SoCFPGA have 2 i3c controllers, a main master and a secondary
master. Setting the alias for both i3c controllers to prevent bus id
contention when both controllers are enabled which results in driver
probe failures.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
index 14b299f19f3a..25e17df0cbdb 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
@@ -12,6 +12,8 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet2 = &gmac2;
+		i3c0 = &i3c0;
+		i3c1 = &i3c1;
 	};
 
 	chosen {
-- 
2.49.GIT

