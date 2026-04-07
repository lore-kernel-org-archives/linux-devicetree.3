Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023091.outbound.protection.outlook.com [52.101.83.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1774635A393;
	Tue,  7 Apr 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.91
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580508; cv=fail; b=HglRY0Adm/0x1hi1no0w1SDcp9uUezYUFs3uHJ6Wg87ZoPSEZdAtoBvSehLaDynujEFi9BmCjges+8EWN54Vx1hAS5I/X7HWHd11yYce8JroClgKWXhnu2H5jVVioCveDx+wMDLrgGCxyfoLrG/TRWH2EDUE33MYIeumRCg3FSI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580508; c=relaxed/simple;
	bh=Spst1qADKbG/QCJc6KW2P+pR9hKRNDn6Pff4uG3+HJo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u56FtUkivI7wJPEVAcjAd9eNxgjgqo6pH//jF+6X9e7Y6l6R15//ut+JpE6Qe2FXSEc+mItQ80Zfcxq7jn69piAh9c5p9OAd5zB+uzaLKHwdxuMf7oI2uDpa4UCWIoxCrLFDeJeXUoklyAYKqE3gO6+E4v57gajF0RFhTW84AEM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com; spf=pass smtp.mailfrom=seco.com; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=pic3hO7I; dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b=pic3hO7I; arc=fail smtp.client-ip=52.101.83.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=seco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="pic3hO7I";
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.b="pic3hO7I"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OaeIOdunpyNul0wZX2qIp8s+UfnOXu77ZpOrPeigWY1Qas9Mqn+Uo18iiDGRyFDfq45kD2EvXuQdjObVSE3+AyZPNzKmywQ7Z4eTgF8SL5h9KtK4gcUHU+a6VwzUnXQgK5U8FSsHOPfmMReIucptV6K72zf5MxZu4kiQAiW92CXvPmYScnX9duCexr0KWhcmJN32HFnkPNK0PYeEibsiTeXnYYnGkZPzEbEzQ6QWZKNQGTKwazOXrMXBAWvibu6Gk9jOPYOnkoQBB6MUXn/GkySvpp1A3e9I/Wu9IhdMsvGQUYm7qCErZ64beKzZZClkMynyg91KOmy7oAVWNMvLGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzMGN41Rw18K4gdUvcwtL34pQT/2ozXkkDma8guFJ/U=;
 b=sGQ1ukfxfDAqyzj2iLDz84rVoGQkpLp1JLoqmYKCFECS7SszLvPjolac/yu7uWJmTiuew91ZDykEeyikECCZZterijCM/4LQV8lTjONY9MBjsgUD4h89bgSqNyDDLE/VlkUBf4mVz0G/SwdGFL2TpOI15FqPW5977nCfEKV3hmdm7xWSVV844A6Yd469zXiFwSA7AD5POuJdWiznF5mnLevVwk99TwjEsV6XmroeXkM9bt8mpKMtVLoxmca9KNTC7roKJDoqQNC5RK3ZrczycD7nlWUQQ41gz1HF3uGKhnWKBHNItBRBcqvJXLExPTI5dmqDA7U3QvUMypoar5Neng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.82) smtp.rcpttodomain=kernel.org smtp.mailfrom=seco.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=seco.com; dkim=pass
 (signature was verified) header.d=seco.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=seco.com] dkim=[1,1,header.d=seco.com]
 dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzMGN41Rw18K4gdUvcwtL34pQT/2ozXkkDma8guFJ/U=;
 b=pic3hO7IupLKOvZuKDK1Lev1y3XFvwlMwPjcMuZBJCHbrFgaCjqpwLdw9Jsj2bKUKlhbA3oLkxWRunN3ldSNIMLhY2a/GrvYVNfo8C7y3c9jvdyrJWxiuZ2ReqWfof1Y/wuT7ULy1w+QDM9xLnSahspeWg8Vn4gCacZ7nOq293D02sIP0Hib+y4Idla7RXq6dzmcWRn6SYYNq0j+f+G7blwF7ftkhVefG7melhiaBFvJT/XfXnKjvjmc8tHgfJRUqeF71lD3aWNoBka6JrpCQK2rxtc2Vdac8odXvCb0754LzTHymmXuhPUDmPitpDA1+vBtZYSWud507ohgDIQYYw==
Received: from CWLP265CA0279.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5c::27)
 by AM9PR03MB7709.eurprd03.prod.outlook.com (2603:10a6:20b:41e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 7 Apr
 2026 16:48:20 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:401:5c:cafe::e7) by CWLP265CA0279.outlook.office365.com
 (2603:10a6:401:5c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 16:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.82) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 7 Apr 2026 16:48:20 +0000
Received: from outmta (unknown [192.168.82.133])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id E822D2008059D;
	Tue, 07 Apr 2026 16:48:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (unknown [40.107.162.85])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D9F5F200C4FDF;
	Tue, 07 Apr 2026 16:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqJ8spQnPKVeABi+z7pt23Cg0bIn+QRl1/t0PkBIFIbcYdk78+XMQ6FDDdTQvJVQCWSRKKKmaUh663URxNSLh1VMuhGcjfDr4kVp6Ox2we2iqGgzuKG7N/ADtKm1QkegjlYrqm9JOLMtVBRaM/FvDPYvnkxbV64PXOBKbrLYnJXrEIJPK3opnAsEEfwxvOJOqmtKocIqeXxv6VUIUfnHoYVaTOUNOmqTLlP+Zy8vDtdy6O2sAp58/8NaCxGitW6os6UXoDHaPLSpeqxLn4wPSChMToxd7trRhgk3H1vsQRwKBh7JD7VnAlSwHHsMSUivTXh6TvJIabAXHASS2qjARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzMGN41Rw18K4gdUvcwtL34pQT/2ozXkkDma8guFJ/U=;
 b=JKh3ArAGjKj5i3M4LDmeStqPyrjXIau3ijtXy85qV9gUkOdeSgWjEzQ98f/WVq4cSVjOtCy4IHPnkEUqFAE5kYIDHXXQHGRGIFHzqrh13mjSy2S/T7hUNmWLa526KdhMIn4xaCpqJ+ma21zsxNldPc/uIE1AaWDQYQ0Y5f52RjBR1R4U1HQRNKJ0TD3Mzwbx1GBLdINfRebP2fDcJ0UStsLk4v5IynhkY1Ic3Apgvn90nTXYGS4nACfA9h9fTXgYvho8gdnPajimahJoRQ/jhiiAO/ZjgFIYDVhWdNqt734Wh9kgPIponhrGAAJknqoHWipthgrzA7V/8x692auYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzMGN41Rw18K4gdUvcwtL34pQT/2ozXkkDma8guFJ/U=;
 b=pic3hO7IupLKOvZuKDK1Lev1y3XFvwlMwPjcMuZBJCHbrFgaCjqpwLdw9Jsj2bKUKlhbA3oLkxWRunN3ldSNIMLhY2a/GrvYVNfo8C7y3c9jvdyrJWxiuZ2ReqWfof1Y/wuT7ULy1w+QDM9xLnSahspeWg8Vn4gCacZ7nOq293D02sIP0Hib+y4Idla7RXq6dzmcWRn6SYYNq0j+f+G7blwF7ftkhVefG7melhiaBFvJT/XfXnKjvjmc8tHgfJRUqeF71lD3aWNoBka6JrpCQK2rxtc2Vdac8odXvCb0754LzTHymmXuhPUDmPitpDA1+vBtZYSWud507ohgDIQYYw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com (2603:10a6:102:329::6)
 by DU0PR03MB8501.eurprd03.prod.outlook.com (2603:10a6:10:3c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 16:48:16 +0000
Received: from PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::10b9:4b34:65e0:ffb1]) by PAVPR03MB9020.eurprd03.prod.outlook.com
 ([fe80::10b9:4b34:65e0:ffb1%4]) with mapi id 15.20.9745.027; Tue, 7 Apr 2026
 16:48:16 +0000
Message-ID: <b4bf6aa4-bfee-4859-9251-343b5cb1fd5e@seco.com>
Date: Tue, 7 Apr 2026 12:48:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update my email address
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260407164722.211610-1-sean.anderson@linux.dev>
Content-Language: en-US
From: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20260407164722.211610-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAP220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::23) To PAVPR03MB9020.eurprd03.prod.outlook.com
 (2603:10a6:102:329::6)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR03MB9020:EE_|DU0PR03MB8501:EE_|AMS0EPF000001B5:EE_|AM9PR03MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: a59090ad-f8ee-4159-ef47-08de94c57985
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 PHFEdBJZdbChcR2rRUBSDP8Xj8ZWsimH3sZXWW/WtStp0Z+ArdJzspNuTkk0SngrEVJn5Ldo9BMsrqr9mimqNKS6M7sle9gHDC/K2iuHVzs0Ep/rdpgJe4yw9IRcSnBPGKvDYqn2v7JzfnQq6iG0FZ9l6vDSPQifrswXgDhb1GfKo6tUTlM2nnkvR21usMsIdxWX+89d9BFt+48gHmHh2P5s1D07mo1ohQcF7FcYgaRK1jiNpueXYPMsg21LX7E1jtUYTaLPrHYxlqyB7HyJ4N/60h0Uq72Z63aa+ZyA0bte/vjsVfyNBQ7rG82EW5KINSa5XPDXUVIPBx9asty3s4enboKpSds65RTEowtcqS8nbF6rE7XOlxAEdRHsGq0QrKxZvio9hvRXbU/FSxzKBKk/6JRhGdGk9NtQK9BJodv/uVWZvawoMUNoWtnwIDOHd+btVG4TOjWjQGSlvIrPPcLIILQjpklWFWAiDBEL2KeJ5RfoIsKhWwzycBSXBXoBnNGarXHFbgnklKz+ssDUZTyd4F8vWZcd1DD0Y0MnCutSAX85HRyPkrECZi9qPrQZJQWLHlS9c3bEow16W6QG6z78I2BApoKEtq6n3d6TaKOuMkp5Pu+SZWcJz0Qt2wTvwkmxqiE4j/oRI7JS4VnogyRipvbM/XI1u0FI2Wi1v+ORYFQH6ynFqQEmv+HIZzZe
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB9020.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 vwTIdNRoL3TpjMCyTydDlkVOrI3wZEJg9MS1gsutgQLwv4uEsPXTwRK1TXV5wY1Laqowdl4j8wGHte1ZnMr9cWXSy5lpAopqgrKbfjTtx4QZuQ6abGERjSf9dh4KXRFwVqsWLoggPa3dEaV0BdE+InafYKfJpB6P9SRA3S6AklDs7XrMNKF1eFfh2n2bgzM7UEyA4Hgc/GBi6qVqZT5NOZOoRs1tdWVkmCWZq8pVUnWy2wis4GjoSGF718mRzT197RUMHOMN4oWsqNFk7rY8sNl/7NgxVlatpU5DUdCSSNwIi47CDhhhJWYDvsv4yZS1oVWjob5DQYeaa8YPnWcRgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8501
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04af0ee1-4605-4cce-b148-08de94c5770c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|35042699022|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	abLr0Xc//fubJmNIQ2xc7QgZPA4rSz040KUgeI80wfvPRPhAomwBFVl7ZiOInAQcZzAb1cFOxIFxjrOQ31mp0Gt6eUYScGnO7faksCxUmbwPL4h5JcKQEKGIv7+AMnqYKRl6t8/3e96EaOJhmbsF63O7Xcg9PTSSbF/NnQbaYB8mtKaqIwx6kEy7Df2aWDNrx5BhwZQXtLACHm1TZI4Ldc1beaGaGiBZQv0hchlMHB5TEXoZ7mwuAbZ6QNjYswQmsdC5eBLMsRa5GQZACVa9agUN18Jj37rkhW03RlAqGCkKkls58OLP23Zntq+5ZDhcSc/OXwbm2bNarDMYcNm1xXGDK79GxflnxHKVP3MmPatxzGXx07ZKzElvnFCbVQXooTdNMNbyq+1M28iNtynANWt3LhKP4kKwEd1gRGl4coEazCgFf+N3G8hdzkWAmfIS+Q8Y1bhtPe1sAGtKUyrmTpklz9MWQQRSedjQr05MMX87mMyioBZwtv1W5CbFx0iJavcWlsWcnNvvoSSsKajOs3GDQxNQBvSakSFoYEWl0omGl5xEK/mf8CppaKHQDoYtKuXrLAfbLTZ/1y+Eozi/JxpzKCFG4lATRcNnWLDbcyxj5HuR6psRB0C+7lo/nh00t4kp3yk5gdYlygqabh0H2OaV4e0g1jwP2EN+PTpOnS/bxhV391UDSA3sh29o7463KiOS1kbgQ6rXoK0TTmM1m6H/Pkipy+A6L/ZhWs4ZPTw=
X-Forefront-Antispam-Report:
	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(35042699022)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UUYCTJXU4sd6fHl9I1iF2knozuhHKvnwSZsGfc31MFHa5KBU+J3hmPoFSeMzW3c4dj11J4n2acTnm+G/XXjj52Y5Zl0KGNwqiHb/ovEphU7SI8j/tDma/lL9bdJLe/fNdQ0Hw9cTkXRf03ag41mkcoyq9hm/wSkXq+5fXa5YHaWV5d4l9MsXKA5K+D5h+pMg4nXjoPc5JHAUQYJHHqx/QZuJlwZglP8+HCvmByhGQlMQZMa06MsiO1QA30qjv9XIsGi8/3qcGvLjcrHhlnAoqcSKE0l6dDnBEZ4+RR0O6Mrd4yz1AFyuWwBC+CGpWYyaw3iYc5BiiNwANqkrhOu6br3UrET+Rs2yI0W4MY2AB+fqy+tI5zJxrP8mChbg8FoJPSkRZ8Ns87nnVDUsG+P+ca2uh2CoPVA70WtkkhzI9ZJJFewsQikPhyRAsu60KDha
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 16:48:20.0990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a59090ad-f8ee-4159-ef47-08de94c57985
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7709

On 4/7/26 12:47, Sean Anderson wrote:
> Soon I will no longer be working at SECO. Update the mailmap to redirect
> to my linux.dev address which I still have access to.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
>  .mailmap                                                    | 1 +
>  Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml | 2 +-
>  MAINTAINERS                                                 | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 2d04aeba68b40..b9b5b1cd81608 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -738,6 +738,7 @@ Sathishkumar Muruganandam <quic_murugana@quicinc.com> <murugana@codeaurora.org>
>  Satya Priya <quic_skakitap@quicinc.com> <quic_c_skakit@quicinc.com> <skakit@codeaurora.org>
>  S.Çağlar Onur <caglar@pardus.org.tr>
>  Sayali Lokhande <quic_sayalil@quicinc.com> <sayalil@codeaurora.org>
> +Sean Anderson <sean.anderson@linux.dev> <sean.anderson@seco.com>
>  Sean Christopherson <seanjc@google.com> <sean.j.christopherson@intel.com>
>  Sean Nyekjaer <sean@geanix.com> <sean.nyekjaer@prevas.dk>
>  Sean Tranchetti <quic_stranche@quicinc.com> <stranche@codeaurora.org>
> diff --git a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
> index b1597db042635..3538eafff6b13 100644
> --- a/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/xlnx,xps-timer.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Xilinx LogiCORE IP AXI Timer
>  
>  maintainers:
> -  - Sean Anderson <sean.anderson@seco.com>
> +  - Sean Anderson <sean.anderson@linux.dev>
>  
>  properties:
>    compatible:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc4..bc4b38eab832c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10248,7 +10248,7 @@ F:	drivers/net/ethernet/freescale/dpaa
>  
>  FREESCALE QORIQ DPAA FMAN DRIVER
>  M:	Madalin Bucur <madalin.bucur@nxp.com>
> -R:	Sean Anderson <sean.anderson@seco.com>
> +R:	Sean Anderson <sean.anderson@linux.dev>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/fsl,fman*.yaml
> @@ -28907,7 +28907,7 @@ S:	Orphan
>  F:	drivers/net/ethernet/xilinx/ll_temac*
>  
>  XILINX PWM DRIVER
> -M:	Sean Anderson <sean.anderson@seco.com>
> +M:	Sean Anderson <sean.anderson@linux.dev>
>  S:	Maintained
>  F:	drivers/pwm/pwm-xilinx.c
>  F:	include/clocksource/timer-xilinx.h

Reviewed-by: Sean Anderson <sean.anderson@seco.com>
