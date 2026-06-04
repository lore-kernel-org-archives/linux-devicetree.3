Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1E399007;
	Thu,  4 Jun 2026 10:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570226; cv=fail; b=hcxfHH/nG75TmFrejmidxgvEwPh7TR8g5MyXIQoXcqn/LkYUr3LvGEjCIFYA8b4UjIyO3Gu1ZZeIWjf0KMoa/GJ4RpP5RzR0zWp0o1r4KE/I9v3CChmAvznXzWgcH93rXzX44/x99Sl8MPXrXpGs5dWG//HZ0ZTZLAW5TIjKJKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570226; c=relaxed/simple;
	bh=VENncm7tlhcI6aEBgF3hHg5GDDXz5ZgMD5tfK5y5kIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QXn3Ha6M7LyExNtAyQ3r0TKcW/29Tjam68xSwMDptCP5s3rDUp3pazKnfP3l1qGVNwhw596hy0DuuJQaoPWCAAK4GXRsruA8mKHGnKsJDowngFLf+LdoWCqV/HInnvsoLK06CdwdTnRXjn3RFiuTMYbMBa0D61LOit0J1s4vtp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=TOnpZy8x; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="TOnpZy8x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI35GdnVHHUvplwXXbnY4HPh/gModEcQsciN3uZTRwe2milAfUCfuhtyyGAfiyUE1L0ePvKxR/6CZZs/raf/yJtKjgjx6jDXyF3LpW1wCtaez5B3hmPoDkvoMN+oauhGzgsScHlHfmRzcp9IIeh26RoGZhlxPuZ/mdlo3+DvBOG0m4Yb6iOmi0deHaqHX6F6WD/0vHjgCNoWccWMo5Zsb5xALcjwEvXpnO6JN5Srd83mfzZeFzpu+X4DOspUIagJrpPNSQpd/H9p+ZZ4yZ0Wi5JIjP9OUSodtrLUizU2kBf/lewKNLlvIgNItniUjfe8wPm+8OzBvDhEZj1j7Y4OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DspxAAcTSJDakdu2++cQE9nvEO0XTFrI+bL6wQtn7k=;
 b=it86PuZMx6AxQJTtUCHHbXWNLv6XEgNcZQdK92jw75+lXAOJIKQuO7odKA++zUQ+B7dKXhlXr5Ro8tai7I2od+VPTZQFNLLU3vjj7Nr91Tc5v2YUg2Ml2OEDfrTjyB3CUYDX6ZggGqmX/eV0nvgdD9c14LC3rPGVtUrXqysa3iu8EwKtilf9ys6gjDssytvbEI1kjX/ilRiG3Wkqn0ith1I1aMv1/rGmvmY+T/9nKAbanT7XgcR5G49O4Cd0aX4dIxCP0TgDjZ/q5hgEkh8o2kzQ7XH+dVm/toTgu8qo95R1L1jU8J8KL0+w7kvG5nkSxx6BbCHQRr1jyZZWhKH8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DspxAAcTSJDakdu2++cQE9nvEO0XTFrI+bL6wQtn7k=;
 b=TOnpZy8x46e1xNbA41vngPkiB7yAMZnzk+sJKBEqFSz6Vdz4ZLZOfgaRI2ioBgrHva8StOe+KKhDWdeSnkCcorvx2fgR2e8EGDbOrpvQo3J0A3rUsYSqyEZLt41HX5ZCQ9Rv3NAgxPwIWIT+n9ogAikYtkGbM5jNVfaYADCaYuGTgaOspR7BCyStJYBnTXpYUhCz1XTnAwo3Myh+ajBtqZVe/K5u+mkoDpsDL4roWLKXRCGEo2WrKsBW6hxkckgubJjYQFOgW7i4YYlkohK05icHWx9woARnUxLhfNWkhJMuETEfU51EueK9ml8vRzJEPTx8FJhUpGrYg9Fg3vDcKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PHXPR03MB989234.namprd03.prod.outlook.com (2603:10b6:510:3ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:50:22 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:50:22 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: socfpga: Enable SMMU and add DMA coherency for XGMAC
Date: Thu,  4 Jun 2026 03:50:18 -0700
Message-ID: <20260604105020.24782-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PHXPR03MB989234:EE_
X-MS-Office365-Filtering-Correlation-Id: 42434e0f-18a1-4fc7-bbb3-08dec227135a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|55112099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	OvGKAFn9YABi4a+rBPsbx77YDW74McKleswKxtB8fHdZOUdIQ49a5IMxy+MTHzF5rrFElthyKNj66ngpjMt7e0yFGDCrRu7FvFW46RHJUhZlsZMABNCnVUpPlNF7tr8WL4YdM+29ML8hyk9OtEXBrJgRYYXbYk6MgkPs6WmCfg0mloM+JyReEF2rIxyQXa5d5MRI8xWzzWd9Q9uRSSQs7l5Uqwgt3Iv1CGsFamKD4Bz2o9JLDfEOFQmRegeq3X3t5MY9tMLPS/QcRlY7vEVvQfQq+7drX6JqrlYmKc89TI4PwUv1QFSThwt0c5lNOTzzSv4wovYi1Qs3i3MUATQ5zFCbR5cX50DIKz5mrhcf9nnz1G3U/cfink5TWQLcUUT+bPSuy8nlrv3rx9hKmAtQ6AcwJSdLMiUyWMQdXQZG5s7UBSIsld8KtGMqYUckdSkqNJA9QI8b09l0Yg3tSNkFigESX545n/W3ohnZ7Tbw2pD1DzhZKH5Vdvk6Oj6+0rTiFoQgqorwS2ULeppQAULDkRgdMRelnKpht3CjbD46JIhSzryl1jPl1w1XqYCo7/BvREwJK4cxnvtdssJZ9nCTc4qCUuwQ5FOoOn2Dv5DcfOE8NBb0/8wz6nYIBWoryFuvR61hZjQ3t4Jg4T2me6XRBSVUAQEZK3gCHeKyi0MM6LQfhsU+/joCi9CjdeLqVDZQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(55112099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C48+qIEy6HSrvooDtaLQrx2SpNLWPANi3iYOOOAlLchfKeBHe005mVIDH4WE?=
 =?us-ascii?Q?Zm+cLcKyQdyGAJOsnep/uU0o42AdkjUDtQ2QiBybWtphKq6Az5IHS4FSYM6b?=
 =?us-ascii?Q?rt26u1kbk80dFQ8MMk2JIbxY1GZPwfWIO4SJj/saSJ2buFBn+zeiFgIrdKtF?=
 =?us-ascii?Q?AohwfvFSh5AtRrzSnQ7xEiUeDeDf8Fwug0fGg3qkOzQqcozaeYMc1AdyrtzC?=
 =?us-ascii?Q?ca3L076JB5QhAP6sFKzJKem3wFbJv3dyd9vwLmp7S3kgspg71etjyK6nTvri?=
 =?us-ascii?Q?IVsaHeL6636enxLlqG6rWq2BLzdbLbjIRqhpnyfbhKZ4kbkVcirPBQuslh1N?=
 =?us-ascii?Q?/V2xxSAfKbWIwv+39OmPFIbRFHWlYfIqIsBpQ/0TZotJUrrCpLU+YqnRoJmF?=
 =?us-ascii?Q?VF9VdhK43/68N3QO+f+u97Kc01MZXJsgN08gJadXhyIn6ooxHxKnfCrb7FCm?=
 =?us-ascii?Q?1Zlwesp3gVQQKQ9BcwoIWSscpYzpYz1+t4can2AYlVn8v1mxi+67o9bFAjaL?=
 =?us-ascii?Q?1+MUiHeXy/3r4uUHY52xgXsYLw9K2EgmeTy0G3CE1pMAc3QKWoUofyskxyUp?=
 =?us-ascii?Q?bRMaXU5xrUdLNDjAeATyvMSIlw4WV4yLHjZhptW0j9z4CNF3E5F9Xji6xn81?=
 =?us-ascii?Q?L9VoCocf92SmNMIYqg8axkt7yL0V9RrJlal2vFq2fG0bAMd/Tv3LzyURZjN8?=
 =?us-ascii?Q?ODHvlqBZGrOCsW7LQvKSVzE3GdEOAcTTId7ApJuau9jD0cPNRC3SVra3zgYZ?=
 =?us-ascii?Q?X/psfcK5bsqZKQCBC5eGTIdMs37Qk0c/H+R30wRmniIh3SVNfvrW2gm7EwaW?=
 =?us-ascii?Q?HN8Dz+MsttwJiKrcIK4LQ0Avjh4uJWXDT8PFzoU3s2ZxKSxddX3FqWbhHkkj?=
 =?us-ascii?Q?F5EbmbPFH7hySDJtC8gcRp7Mk0cO4nhcO/bI3+XNWtK+edgQ9iwjgYle7fi9?=
 =?us-ascii?Q?9DWdfv8+evMx4Fmyosp0BYxqUxYEZChHSBQkeP1Kj8TXbQ4tBiCbzabk0rxy?=
 =?us-ascii?Q?CmaHeA53yUEzWTVrxXlmhzXQuhoqjeq/QPLAHhUZdWhpA9QgL/ne2eoFvfHc?=
 =?us-ascii?Q?LO/58z2wXW8KY6EYOCvnAZgYke9doDIiSeQg41aj7MUAiOzFJu0ZukMqGirh?=
 =?us-ascii?Q?SlT4vDspGEhezL/eFtQC3vp82qkWrNT3I2EsDBNneGXsCbYWmK+R6yXpi6TN?=
 =?us-ascii?Q?4WmP+XMys8xI4n1osUe7uiJAHSr0pAefUGP91w3273Hf5TCSImY/y+eCPlnK?=
 =?us-ascii?Q?4LbzoCJIHkpCLOLroDUPhvJRWJaucJqTt1iBuGuAQ3bGVA5wPXFV6YLcIKzE?=
 =?us-ascii?Q?eL6LppvjPs/AmX+tYqvGlLOoHP8hU8IduRGD5SkOURpCPYCrIAEbjbeD9d6x?=
 =?us-ascii?Q?B/dUX+iPxlrPe2NXdvIOvZM/IjVoX7Hv8/cNGr9crT0Pks2Pos5uxgmefeX0?=
 =?us-ascii?Q?ABX+R6kSRQQNovs+edmdWTQDLTQYVSXYxMBPeM796JtFTQ71iFFSEFy8H7Ba?=
 =?us-ascii?Q?Ui0x0nJZnw6wg5PmUFy2DIKUgyGgGJBR+cC4lIjhvqm8BnRCSTUPWTYiTrZs?=
 =?us-ascii?Q?2LV28jevkUme3mQPncIB3zQtCfvf7Y7oEMlKsYJ8jtDTTcKXDIB8OfTZWL0N?=
 =?us-ascii?Q?ZLuWWjuNccMxJWSbNOFKaZUouVmUdxvcdNBdQTjOlO43HT30ZtSinQBjJvqa?=
 =?us-ascii?Q?clb+ifOBagd2YZtAUJ7o6wSrflyGY0eAVup9RH2LBvoezVwYPv4SASb7EWaU?=
 =?us-ascii?Q?mrUukfhJ4ccAbJbn3d67Tx7TLEt96KuFBSsMQ9bqmFmBPkpr8307ngYZu+vz?=
X-MS-Exchange-AntiSpam-MessageData-1: Z25FVOxX9grToA==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42434e0f-18a1-4fc7-bbb3-08dec227135a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:50:22.0682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bbuwpCdMLwrCUY5PPu6MyrtZMo2B3DyiqzrMTMyYNo4rh/TxuyWmfwjpsqaBANenP19nXtxmu7go7MH4yXZyYFciFHdOi92hDwqbP8vm4bU4gdrPz+14zVQFlfP/5/wCiYaG9+yheRB2l8z5da/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR03MB989234

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series enables the SMMU and adds DMA coherency support for the
XGMAC nodes across the affected board device trees.

Patch 1 enables the SMMU for the SoCFPGA board device trees where it
was missing. The SoC uses a different memory-mapped base address for
its peripherals, which requires the SMMU to be active so that the
Secure Device Manager (SDM) can correctly access those regions through
address translation.

Patch 2 adds the dma-coherent property to the XGMAC nodes. The SMMU
is enabled and transactions going through it are cache coherent.
Adding dma-coherent prevents redundant cache flush/invalidate
operations and potential stale data issues.

Changes in v3:
- Fix commit header to follow subsystem naming convention (patches 1 and 2)
- Remove commit body line that restated the subject
- Clarify which file had the SMMU disabled

Changes in v2:
- Move SMMU enable into the base DTSI file instead of individual DTS files
- Move dma-coherent property into the base DTSI file instead of individual DTS files
- Improve commit messages and cover letter descriptions with more context on why the changes are needed

Nazim Amirul (2):
  arm64: dts: socfpga: agilex5: Enable the SMMU
  arm64: dts: socfpga: agilex5: Add dma-coherent to XGMAC nodes

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.43.7

