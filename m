Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC4428846;
	Wed,  6 May 2026 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067155; cv=fail; b=PniDEKpPLSTNo2j2lhAlXUq5tEnVZUP1BKZpgCRlVRBPYYEvVFCXpZIcYutjD4bAyZ+3v+RX8ksj9k+0VRCLOl2l3AJXPfX0f8eUjKQ/IuuXBf4py9hS+HUipV5APWBoWPOV7l5CUI+HxnCkJWYBBUwHD6FgZbOEp7IRJ6JH8pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067155; c=relaxed/simple;
	bh=ka8BHOZy4zow114JC740ch+wQ5cNG76z6CGo1NAHfl0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y+lcBW10GcLxxPb5cvscndMR3wbzQ0ku3IL61vraSlIJgM+vAkrDGGPxZ1nkIa9XLoiTpC8IfxTD3U2d9XiK9XyvjUYsBJOfFY9MUedqkPPPvZ0ZnxNDl99oqtnZvDHY8NdqY1l5f/3c2Bu+5xKtakustA2HyrAnr8sIDGoX25c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n55sW6/PNhKj1u3MhFjXsV95wH3YGPvhPpf4C82SJznL7Akw4mv6Wo4tjwRNZ+CoOEzCF3MqqbY8lE0D6kedRFgUVKsTaN9P1Yx3alU+ANkZoFC9RWl49plHzvDbt5MjLXUtyqjp3MJRqpQ/FJQt4vh2FHdnluOYaVWGTOt6JrQoC34vWUTvLtwVZFkw1CjS4/7eX6hW7rrmgHinNBysxGLEnDCvDXdh1a6ch185WtQ44qppleSk/cPW1h0hAUQ3/aOjjFTpCLszd8TQEW1tQhwWfn3MC3bQNIegtoqXv8p475YzWtB3E+dZkNU1ERP5pkKKEcZBKQYgGEXZrO4JLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1udS+ImRIEe6t/AvU1f2Hf0h5nakM4/xMRoji79H3g=;
 b=DPnHbvqtnzZPqMsxVX9WSFSMYN1/Sf4Okk3wETu9CnNahAJCYXtMPIGSWod6ibUUh/eWkmoMun9StSIDyL/jU+JjvJehFMsMqjht5B6kpy48maFDS/LQ9ORjbkLNwCuF7AOzIpJCDrumCUSwQB75raxvPW8fDGiTjg/Y3gYz4lk52JgWAk3/79+TA+C9/fN5uVVTB7CnoujGjvNwdNlAK/hR+x5Yu6Cx1DZkT2CEj0jn4Y+q2QuB1b0JiGyNyK0xnNhGirYN2vQbGL1Mgyoi8ndx8/qhOAFMyCH7qF82lcST7k+OfGzeWiQpEU6t7s3OhTU9mxjkaPYpIk8SXu2H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1171.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:59:52 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.008; Wed, 6 May 2026 08:59:52 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Zhu <michael.zhu@starfivetech.com>
Subject: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Date: Wed,  6 May 2026 01:59:36 -0700
Message-Id: <20260506085937.754808-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1171:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a7b5fdb-061f-4871-60da-08deab4dd631
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|366016|376014|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HWQ8oYJqDmu8CTNCflFbH3eLyo0N1IYyHY3bkjejlICAX4jOXOokhCF3MdTvNle1XiELN1E3ylmjHXg1ul9h2d/9bEB9Fkr5NrEaIdmevEv/yhxr8/fIl/Ww4WvIKJKa1jF2QMfD0zS5lAIWMTQJ3EReRrJjaawfKSMob2ViF0MMk5siyTpVpfoajZm6CjvswqRTsHuSDjtITDGHgI7eii9Bu791uELYrC7MZYpq9zQzlh76J+ir6KZv0/OkKYbBuw0sqwytI76Qungsri5zaQVNaze6DNngiSYl4aXRA2m83sUoCS9YQ9XAL/kUMqfwHpLuoracSCyqdv6rytGzE9bWKgqOlAJtQubqYsItdimvAxCTByzHxI7rXMiDjXNXcYjDzalzAflJv0GMHuS8MMzQ4X0FpDJoS+F7Gw9vLY4T6eAOeJloDiD+vVpM9JiJZJCLLM1VKySJy0jbpvgAHcJWDe4DV+h1N6tvNdJ6xliKrrXOnzG5qy1THjF7KUXCFLZ9onP0m0xLKRMZHiNOqg944qsj+TAE4AnF40jJpw7PQtTXqJjTOl4zGxTUMOhGA/hdA9C8JLqYdjQvvZqAYA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(366016)(376014)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5bpcIJi5OyiZz9L8AULIrSF+p0g8FBGI9bR+rC09783/YtVuksOWrfRb390?=
 =?us-ascii?Q?gySTOMwLgP7KYoCTWPafFjSIkG2HN9cez+zw/EaYghJWqucMGYKGzy5Dbnbd?=
 =?us-ascii?Q?S3DQYZdkeCme/vqqtMj0weJKGMLULte1zE8MKy3FsyilpHs8/GeiuMqQYXhz?=
 =?us-ascii?Q?Fm0GmTC1MzY+oB02AyIYX1ceYgJRkbDEVw69qP7fplBWFJeijgHg5qXglPM9?=
 =?us-ascii?Q?3qDqNH4Fqi1/2/n70QTnDp4+XvgrkRSmsFA7/YQRmueWbZbBIw6+mL5qtsBX?=
 =?us-ascii?Q?HdQ/hMy0NvoEwqykTmV9Wn2jUXI9SS5kFD0ON8rFV7IcnMii31g8Ij898Avy?=
 =?us-ascii?Q?4p0476oaRqE/FMse/dFZ1eZULrns6jaZ5E9Kb0TNojaJJnoBkxbciIB0DUl5?=
 =?us-ascii?Q?Rct3nVg1dGciOQ8VQSEPZMNUBtcmaXhk6peaSvYd7fVrwNrHOr7iDnOYBZ4w?=
 =?us-ascii?Q?F+JV3KNN+1cdTjDTVdlCVMJslP3JZKIAzebYmoytqMdwDVb2CFoUwmjnpeQe?=
 =?us-ascii?Q?CEsXA1XD739VwIXmVuE6u8V54OJAz4aUM5tAcGFpjuvcTjEF7JST8FRDdhW6?=
 =?us-ascii?Q?ta7gqVvi6CqDUO8z4dSTKimEoSu9ypWLePEHwTx1CExOYtteWH60Z6r7ojVF?=
 =?us-ascii?Q?7wMh8O6XJdOrCKwSNBMVT4Pa7QgZYJeZMvL/aFn6NfRL5eQdO6QT2gPu4t+S?=
 =?us-ascii?Q?ZeFkmYtabvf0o6eqcX7hhYPBxS1MEzlIePX2YKtUIaBxaP+AKdcpIZvUI6Ds?=
 =?us-ascii?Q?1gXN/ttm5ABy+3XICt0t1Mp7Amfqvs4xcMZuXwfWDMMbXZvtcPQlhGIfKbvb?=
 =?us-ascii?Q?aOwlfP5nTciNUKfmRqCzgCmLpWc9QWHn2XSB+Cv9WznruA8UdCnqktrpODbu?=
 =?us-ascii?Q?+S6uXI/oJ1hywf2bt+N0WvWOiPzjfzhtiiNIaTwipVVKyGW8ktSbXreZziIP?=
 =?us-ascii?Q?4jArkCEzPaYRbtGCdAj8PL6Gc2t9wXflHSDcIY6pY+W5DeVMnYGQcEFjzvZb?=
 =?us-ascii?Q?Oe/UM8UYqkrp1HPj60+Xd3gvZgxM67e2VR8oW1aHdvw1YOUSP588fc37S92z?=
 =?us-ascii?Q?EJEp+6+u79704EGb9Ox77cbx6voY8RGwxZ7Dca2Js7/LyMK7A26HU6A5djMz?=
 =?us-ascii?Q?kW3F5uxdt+wLilXHp0ge7WzGgwW5+kgJa5xrV+f/nPhCKZtZHXlKDk+JVJpP?=
 =?us-ascii?Q?xZpWTmyRH6pDAkTIlAwtmLSbZiVox3asnLWvQoHnLvOXYwNfhOBJ7wHXTFju?=
 =?us-ascii?Q?Mm5efweVx22rIPXBq5NeQ1bq0tV2nNtxqVljoMw6YbB8TrE+9GB4vmpuoqa4?=
 =?us-ascii?Q?FSWOJ1CbKDFSsg/RCeQY+6D654AuFj437wqNEWsdrADLUD06Hi/YAgaCgCBj?=
 =?us-ascii?Q?PzDRvJ8vPe3mLCX5Q423fvn9lt/Q5NsbMqb1GX035l/Q7ZpscKbon6RU7SzB?=
 =?us-ascii?Q?fj7sdjA+mTMPOyP3StAPXkNcVDl//0PeDT/gp7yPF3Vks3QZHuSgIHz4XVSw?=
 =?us-ascii?Q?SqTUlhpd9QfIeA4Xmw5du2l3Ttkrwto5E+w82o6JBzEb+oYrNp1ppJDerVUj?=
 =?us-ascii?Q?0OIEp4OdTmh2vH/nNarf/1nSsQRuYIPO3sm8bjuP8MbqzeMLy/RshoLvpv2a?=
 =?us-ascii?Q?kq20SkSiuR35ikMKGDreRLgAI1h6jbjLMae7zF79AzsLxEKDlsPpUJVODhdr?=
 =?us-ascii?Q?8Plrd9GuVMiYAXJZLirmVCbWtJ+nFfa24RBIyJ/Kh3I9JSba2WHZyKOjUYhl?=
 =?us-ascii?Q?pxQxB1BdJYhbZCzr2W2lW5xKstZvQN1B7JqCyLI4KxVItRNr/5Bw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7b5fdb-061f-4871-60da-08deab4dd631
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:59:52.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8MYoRPhxGpziMFh013DOVhHOs4pVZ9VmBvx4tWB5Ss03WZAl9pX4fJsXO5KVuM3HgH9+uZBfE6CgotKWLOxxaCTby+01RIG/90uF+SW9XjBCCfUFhqu3V2Hp3/GZx+R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1171

From: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Add device tree bindings for the StarFive JHB100 RISC-V SoC.

Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 8ba0e10b529a..277618efff6e 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -43,6 +43,11 @@ properties:
           - const: starfive,jh7110s
           - const: starfive,jh7110
 
+      - items:
+          - enum:
+              - starfive,jhb100-evb1
+          - const: starfive,jhb100
+
 additionalProperties: true
 
 ...
-- 
2.25.1

