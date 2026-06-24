Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010014.outbound.protection.outlook.com [52.101.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF3B322A2E;
	Wed, 24 Jun 2026 06:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282130; cv=fail; b=Fwz4+9lCRbupu1Rmxast4y+0159tjO/YU5jLUix7gTMVSKfkI7oiqfzJP0oJrY4SAIW1uYLUDNpjGnEVkrKLlofUHsCp9q4TNun3ZrLUDRakzjxYKWA/NlXs9J8Aw9UAcb9HzQxQ82rhfiG91YVJWjdST569pkz5zi5DLedxf0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282130; c=relaxed/simple;
	bh=wMp+zpcBX6r89qYxI2RclGfeFBL27br7PfO0UFUso68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UR/eiqfmPiayUwjg07y6XJcdlZVL2Q4EQlUK5e6+t2K4PxMGIE0ZRusZ1Y25ewMnplBPwdCNcyXaJPP9x5zMYcMXVrTImcL96I53Z2zaJLNGp9q5StJuvw0tRur37z3mS4U7fWW4lf8nYkqxXomvITi5CAbl/3MCht7Y1YvZye4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Irl8ZBmy; arc=fail smtp.client-ip=52.101.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Irl8ZBmy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCW3NV6AURVnt9OpBBwI1CEvJkHwiKKZgxAYhl2LZyOMLN4wJFGODD3NtnQLVZFFn2Gdj8ODEeKRRK09kFtOCLtsaOB3pMONsbUvvEbFQrRPnfVHrQpvIeyRkGFNPpj5ECwpF8q741WrJHkyz0KQMvB9Z+r9TtSPw5WZL+jwjcTxJg85555m82M9N8nO+xpmadPfSgNOoKXzm7VPF7gNMULwqdOpoDwAns1tyG5y5Hk9QQXRTZZ81CIG1kN6auVFhz5X/LgM1AZNib9vWycrOfGTdkaiiGPFmqkKRHNqXKZXKHbUX6QY35ZfB+X6T6xs0WF93APL6foBSt/BCAFPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=890CgyyPrKAjV74ua9zETtWMPn2jlbdWcVcLUGhfF58=;
 b=ryvMWuGGUHHGF0YWooR8IoYESy1+18K9QcveQOBlr09emVW5M0+vnCqjYYEeSwvZ17EoaKW1kDEyleC3XuqqGrnuq275rDH61ZpViHOXlMmx5ldxCpb807LR3YB+iljAd0YlBevNlY8B/eUD1Jj1Du4lQkv7cATPjtuU885B6rmsXLxWwHCxg61H8yN4gcnCmbi64DTam6HOHbBwuIzJbrtFVfH1xTeFfssf2skrG0oHvcTZIm5M0jRuhXrqE6qrRHIKWACmFhF6fCey6NlRA0oms4E9MOiFcuKDIennxvsxCq8jt6erStX0TQZiucT0N8QyGYhsNVbXz3g/emeWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=890CgyyPrKAjV74ua9zETtWMPn2jlbdWcVcLUGhfF58=;
 b=Irl8ZBmymV5436ZroLFGRsNxpsKag5DIvuwUoM49MU051IK5kwTH1ZLqesHmipKAuyrWaQhQLF5KPu3OBXsbe2UDestHeItBev/Jxg/FkydwJDvLUPM4Hcuc+4bYRWHKNfrZvUNwyYXz5dnooB0Tx8VxT+NrzhTpj7OAeNMAv6qmNyMECPy42CZuDETm2rvMrL9RCFKpdQHVQ5xzu20nZjcNcpPBvSq6+VuhnJjemUTzZnO33F98kQx//iUSPtCqZWG08PzcZ+SLvEDd5yT8l5DwjGRnu4wXdMLXck3qo9ioaf21f+2vKhW4Su1oRCb/wrlPiKG8gvd21oxdHQI8lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB6593.namprd03.prod.outlook.com (2603:10b6:806:1c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 06:22:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 06:22:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: socfpga: agilex5: Enable the SMMU
Date: Tue, 23 Jun 2026 23:22:02 -0700
Message-ID: <20260624062203.12221-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260624062203.12221-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c530d0-5ad0-46ed-8d61-08ded1b8e92e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|55112099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	hJBAoj7kr+q/OFBWMgGQFhgUQSYSq+QOibdic38Zjp8sHw0dXfMf/xfUPdfsuORl52cEMipOlOBFElkPtIZCFjyHB7WDRYkMA2SMn5w9TTU/L2v/tmzrm3Z4ueBiEVaOAo8emeBomRBSo6j5J5CMomE80m5B4W/6RDkGYLTOOYmoddI+p2Zpq9+VLbZ+Wo261klJaaCZTQ2TeHhbaVC0w5KZKtgvyQiyp4nr61JAVd5G7dHPwc/xGalGmPr4i57xa9OVL7h7CbJKvbDyK6mrV2EajYgqVP0hAchveseMlNoE3Onts21cRt/OyuNjTRUvIkw3DGinbuYZBhMI0z6UNiKatvbeomYzXOo9U97TcBrWDX3ow9ZzR/YROE/R+/bHg2UkcjHfMlETlsMe299MoDaFz/Y919kaRtoxndHwAz6W+S9DFsnoW/sotVgfu67I9dObI7+vHQZcvfA6J0gc2GANWEoQ8HF/4sj0vayXRyHFAMsSpQ/ocuxHD4qi2C1MP6pj0/gUeIj3PoC1P0rP7J+kcDXzuCV7DAzi8ME5wridPoHEFUgOZebMKRoO0oWLYM+y5mKnk7217FMnUjn1oyNYKQyCFo1xBS49NNHkiXIKqVvp6MvE1vI79BU/I8RXxrTNzPrMyCkkiwrRPNuK+PGA3B6B9lRLmxqK4CL2vT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pqk58vSrbbcI101VuVFEtYAr5RAwbvsOPYTa1HeVJBZNbCEsIkNLrUwO+oM?=
 =?us-ascii?Q?CMuJs6sv2PPbSSb/P2HJfhZNUXpFU/TUY3h49w2DDUl95915Rk09Wsqn0VE7?=
 =?us-ascii?Q?pYHYF978vAScKQC/Q9G3UO4qxrH9TmFSaZSwo45fLwQHEi6ArVH+14EJzYRB?=
 =?us-ascii?Q?fdZWpIG+qSdKemKBgem+Rgo89P5RhcUBk2xnK5zfAxa0YHKpe2jUlNsnnHqt?=
 =?us-ascii?Q?7ehneZ/s+I6/GqIz+yWZgL1UwXRbpZIyVgX68GAR1ZdwP9x3ANj0coIp8xhh?=
 =?us-ascii?Q?qCgk0Hb3SnNN6Jh+Z2CcLnW7qDGHdGY3ht4ueiQ7svJhckGH03wkSUau/w4G?=
 =?us-ascii?Q?VCgrDpqfx+VAv2t4neRQzyNRs1+QPe58grQ+m184WtdO3bUIxE22SZRX16q6?=
 =?us-ascii?Q?YJ5C6lcu8P2jbAbxXw8etaJg0Nz/YWcKOTpmcaRRYWutI7f6tjqWlIAJSl5D?=
 =?us-ascii?Q?HIhGOAh46cDdwr9QFHDXqJ1PqaK9hwNpWiZIKcV4LiJ36dSlLHv0GFTh3zgc?=
 =?us-ascii?Q?YvHrAXYhwL5qV4OrR7wvdXRrN6TnBNKRqd5wnjTnevaCwM1E9AMDP2Csepx7?=
 =?us-ascii?Q?btMT5yOwgInQvnTO+WFR+9GFzZbJTkXeUdYnk8UqnO/vXhbwKGaSolqzSuo/?=
 =?us-ascii?Q?UOMCAVpOkBAgD3+NIt9GtphESvNvNt8kzhtEWbdOltuOfh09IgXsMquHd+XW?=
 =?us-ascii?Q?FZPanBa2xXWsjvqdvp6BYOqF8J4vLLGKK0EOjpsUpLcKgoYXJ6psa8BYVbz2?=
 =?us-ascii?Q?TNBxsdq83AuOrZBvIe1vkH96JjTOAc94eHZWqtq58EbTdwwV3hDyTxihYNxY?=
 =?us-ascii?Q?aySZa5HC4aP2dTdrZ4fUTgDKN7975jqCwc9GPIpLVVc6mNIGvRKxdJwrCBbC?=
 =?us-ascii?Q?b8234oBhTGE//QpJ23uka9YI9cvuhb9UxXSBqbXPIlTqouXLFs5kEk9q6XKH?=
 =?us-ascii?Q?bVnmNZsWfmRYH8T8sxXatR+GOzEGuX+sHgRi5Cp39trgYIDDfAohs5x9OGO2?=
 =?us-ascii?Q?xOdCxrOiHSLAU8F9uYZDN9CZrFV8dC1SRnWupLcQ2fCEXjwnqg3A9Blue8rw?=
 =?us-ascii?Q?yDvsQCkAi17HByap1YVIY7arVTAJ9cmMmJ+5WPH+qP5Ns6r41f3ulVy3QR4z?=
 =?us-ascii?Q?3E+awaQPsTjZWt0MSSQr7Tr+NIcQs4XkbE9j+dI6CMWR8iQa61ydpTXsAnA0?=
 =?us-ascii?Q?2pMmuS4TkFqhQcGYZ55gzTfXvKGw/5LYwZKCeoi7hATgDmZXotbGokgc2V6N?=
 =?us-ascii?Q?wIqELYSmpxKcYLBvw8sLIRAA+jExGdoihvhdW5s2a2stXlCpiHGuAj3hTzqu?=
 =?us-ascii?Q?7kbUUbqI0MxHLQEp8N1y1abaoyNArmdI8ccoW9WLCjfqSB23M5BaxTsTYusl?=
 =?us-ascii?Q?akzhW0nK4OLKczQfPVgPwh9/ddJzksE0i8OqQfp5s9hOvaFVmiHlijfrmEgf?=
 =?us-ascii?Q?Pl/CyyPydxy21xNvEUco/YG9l+BHap0ApU8JMubzg4BYNnoyfKDdYaQB5yeD?=
 =?us-ascii?Q?jyzaguWnAP6PlnIujfWTd1o3dRhHxaURX3bYyPmbnTYu5MLdNw/EfIwHVdTj?=
 =?us-ascii?Q?L69OK6rxyKdWhQxw4+/s9NC56QaGq6zkk2XpwfHNP3J30Cm3R5K1+6fHawwv?=
 =?us-ascii?Q?fRNTs2WKkREyLTZ58WixkA+54Sx1sPDdF89RuhP+SRAFzSsIo1vaAj4Lmn/w?=
 =?us-ascii?Q?vZlrpFKR5bjC6GlnHCSogrFwCd26+o3KysBNZIpYraugIF5WZywNzCYcb22y?=
 =?us-ascii?Q?Qny3IsLQNlTb2XY3D0+JdpdVm86MKUHjFgvGSmh7+lt52q/CQ+KXFZxpNqdD?=
X-MS-Exchange-AntiSpam-MessageData-1: 3TVaoAHYedYf6Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c530d0-5ad0-46ed-8d61-08ded1b8e92e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 06:22:05.1363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmmtNR2neS7SHCt3157gyzSqLsNWf9yze0lEFkqYwHPiPbiyJx0pqB8HFHPES9vbiqoD63tAYR61fAEoJQcaOBtEU1DseFXvDFEBj9GoXj0RkgSzhB0HEXlBfLIcLfio26Xz3kurC+BHclRU/gF+ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6593

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The SMMU is disabled in socfpga_agilex5.dtsi. The SoC uses a different
memory-mapped base address for its peripherals, which requires the SMMU
to be active so that the Secure Device Manager (SDM) can correctly
access those regions through address translation.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v4:
- Remove status = "disabled" instead of setting status = "okay", as nodes
  without a status property are enabled by default

Changes in v3:
- Fix commit header to follow subsystem naming convention
- Remove commit body line that restated the subject
- Clarify which file had the SMMU disabled

Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60ee..daa1f9e0d1f5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -385,7 +385,6 @@ smmu: iommu@16000000 {
 			interrupt-names = "eventq", "gerror", "priq";
 			dma-coherent;
 			#iommu-cells = <1>;
-			status = "disabled";
 		};
 
 		spi0: spi@10da4000 {
-- 
2.43.7

