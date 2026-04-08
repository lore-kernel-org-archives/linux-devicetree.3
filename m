Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010008.outbound.protection.outlook.com [52.103.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3483A75A7;
	Wed,  8 Apr 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639432; cv=fail; b=ZmUF+riykZAF6UdQfyXoN+Ywtq/2CHdDOcdFvMwG+bOS+xN4UIpx0dZ0mO8v4Cg/yqj6CZYGZNrb7f1GKJHVyhhZPCweWmcjyI6cJkLqasjdaG9d5hZY03MaIMaYlp3u7sDAm/+hKqb8vYPgmovMCMrEyFf8y4sAmyeVaOlqat0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639432; c=relaxed/simple;
	bh=ycljNHXs8nAyACcnRRma/yfno+DV5a1B5N0zFR/Imx8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=it4T/MkBeJJbJ91gTDGMhUqQ/JNZsFbDFTxaFfGLTyv1NRzzjJCR/aN9aD2YQPE8FcpTLdKuelL3ku5Exk1NyemMbekLYM6atPyFY++U/ur8O0n0bffwdM1eJgJBcv1b/2vJTAnOE0KB41WH869i1UbSMLEEU0xcvqYmzdt+bhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Rx3JSi4r; arc=fail smtp.client-ip=52.103.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Rx3JSi4r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yG8lD6B73PRPN2V+31779QrXpM/9hZvTqL91cM7ns1NqAg/1hsVuIdM1nc75BEjrhwUJh98ulFeYcliSDZhmPoDebGWr60iIdVWaprscfT8rX8KZyoNzmyHYNUt20gw4MFv8FWO394vrecRUebpW8u8hTKxVHZTcN5nAhJ6KhakZ1Ng2APLGnPNKVu7ayuoach6wVpYzDo95D2/VQOWU3OQYbwYPvqbQQ7cNFJyAS12XT7v4lOy0DfbHoFy6FE44+ZhZiNFRghVGg7lvz+WDBplJc51Ew8nhB2sz053D12lZFxkqYzCIWejvX7wJ11T0T5ansKlcGBq5yb9XTcDwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycljNHXs8nAyACcnRRma/yfno+DV5a1B5N0zFR/Imx8=;
 b=tLsoDP2J14/I8ULF/g7lx4d6ALUZ/AYnlret2/7Wj5hK0/dwJU30/AmFe89nuaTib7/DI6FU0jJyn3BOryg1Syk6XpyNj8E5K3GgiVSnMtSirwN/3oMvtRj+eAa+PKWYHiOxIIll9dvRwjZEc9KoISF5Ej91s2w92ZC9OcEDB34tT8JlVidBvnW8T6DLJ/YMxWClWOAggim3FI//15CgrW4bowiimB+8GEsA5jOd8GNzur5w6PtHAUoDfSVlKveMNMZ/zUgXQpTin/Dz0J1LTWux+SnT6zqQY/OuCcdu9/LS8nNd9uycD8mk0qPXChmv0gyBs8Js3OcLRkKRlX9EXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycljNHXs8nAyACcnRRma/yfno+DV5a1B5N0zFR/Imx8=;
 b=Rx3JSi4rpcHURVvWsq+R++3zkdHaRFSsBzs9N2VJ6lrFlbOi60Sq+CCh9Z6HlwJebSDQt/UaFX8wtsBnjp4Nxsz0tdsyac+E49Lv8w3a5l2dfqs5iIopKeTmThLdRtATrOL940tMteQv2AW+vkO49CXtno5IbdCqX7sYGHG0q1dK8D0gLRS+grNrt3tyt0hD+copDQR9YO2SFjlRHz4qBdJm8xvDsHrDuBmFa/SCd4lTieCaD46WjU0T/4idP00q1oUQtBGQA7og1G9GPX42BDpnZchYp2MkYEbDoo9Af3OINTooFZtSLqwQaidalnKxBiw81n5Ygk6HJOm5T7Un5g==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PNZPR01MB12767.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:29b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Wed, 8 Apr
 2026 09:10:21 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 09:10:21 +0000
Message-ID:
 <MA5PR01MB1250006464D9E3E43AB1F27F7FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 8 Apr 2026 17:10:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: sg2042: use hex for CPU unit
 address
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>, Guodong Xu
 <guodong@riscstar.com>, Guo Ren <guoren@kernel.org>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260406232655.144043-1-inochiama@gmail.com>
 <20260406232655.144043-3-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260406232655.144043-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0041.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::7)
 To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <bb0336b8-202b-4c75-a48d-49df0d2fe97a@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PNZPR01MB12767:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ab99a1-c5da-4268-26e2-08de954ea8e9
X-MS-Exchange-SLBlob-MailProps:
	iS5pQZgsAQDoZe0MsFsUcxnezMxcSwn2G8Wp220eeYqJzvLdiS8MYFA2tgvPSI7C6tbERiDZFbkgbNdLUIOd7cwIsQXujmhwM3DHH9NoI070q0P/r2nkp2r47RYxv390A/51olTqyuStA6DYSffPtU2mkUfnpmbxTpjChug+m8XPZEX2rIcAOrpDV7nXC433QezU8Nu5wpPspyHPqLWwpcpL2yfMg+eIWY/m0KQdiTiFnh1BVkDXZPOXSh+ej36VXQLRPPajgRMwKwr2YYwCGAGsW1d+sG1ywQZIrV9TPIgFfpH64OHaW7ecvuraaPhHa3mFKilqsuPpQrI6RDKQ15RDU6ByORRa2tnoaoYePEVdcU4y81wrM38ZJL7VKQ02ozpwIWaDPboBfkpXWK8lYHSK8tTWfge2VVbtEQit3xYKfBSTzT8MJbzmDaLGxv8xXaAhtAeWWNFdfe/EvzeWQHpUl4D8Jw9vVNHvxkXn1EZFAx6q3z5r8/hApyQil8aoULPl95diAgeLMyjSsd7Z+3YpqfN2jGnssMmc4KpuaBPzBzc+UvdvyFzj4VTe9gizbXIaAdEh287cNa9tmKqzpTWjXbhvE6Tp1FXFxEv7v6M1tObbq6fF+ZhwcYdpHc4/ir4JZqF+NFPRR2Zh+J3UHh38hvMqn6cELPMblWFKZ1QSmk3mozY5J1TUHw5v1WrzT1uE1eTQH9zEUGnyuoGnG1Xv6C6PyG+jrOUGXCKGlGlOLnfnLo4qALIzV3h7sZ+naCGzdQDvMyJHgHFI1ovOdq1D0HpoCXMNxB+hLnGwwZQXZaTYo2/OQxjXkRMRHiqP
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799012|6090799003|23021999003|15080799012|22091999003|24121999003|25031999004|8060799015|461199028|41001999006|10035399007|1602099012|52005399003|13041999003|40105399003|440099028|3412199025|26121999003|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGFENW5kTGtubEVBUVo2MU5vNWZqajNVZXVFSmx2NHg5cFFTczZaalo1RWJ0?=
 =?utf-8?B?WDdyNTdZY3h6QVhrRkZzaHhxYzk1dWVSd2JTaXJRditkL3crZng3YlVKakVm?=
 =?utf-8?B?RUs5b2JYYUh6YjI1L0ZadzFPZXhKUHpXNUtobVp0cGIvV00xVkR4TFlWbExU?=
 =?utf-8?B?cS9meGJ2UkVuUjREOGw5WURKNmVtUGRXR2pBMnBRM0Z1M2M2WXV3Z1RoN3hw?=
 =?utf-8?B?ZjlnRGRkN1hKQXAxUXorZDNPQ3I5VTVJeGswUlVSQ1F3aytkbTlacWdHQ0Zt?=
 =?utf-8?B?R1FWdUY5VGIrTll6MGVpM1I3ZjlVQlFSb1RaSHRJZ3VvYWk1V1hEaVV6VWd2?=
 =?utf-8?B?a08wQ1daeGNoYUVKWmVJbnpxZVFlUGV1ejdCdE0xYWcwR240bmcraGxpSnhk?=
 =?utf-8?B?MmlsT1JUYVZVN1ZTT0pDSFBkZVljeHBxR3UxWHIyaG45dVVnWE0vL1RNZEYx?=
 =?utf-8?B?bm5YOXVncFFsS3lTZG5GMmxqOVhyUlJjUkVlSTNsTEJHZVU5ajZFWEcrazBE?=
 =?utf-8?B?K0VFWWtPbU1LNTFlL1piKzlwMUNhN1NvVmViRGQweERhT1ViZEVoenZ3Qmd6?=
 =?utf-8?B?ZGE2MStsbGRxRmhMbnVYVmxjUy9scU1mZGdHNnh1ZG01RDk5MUUvb2lJN0xS?=
 =?utf-8?B?UkIwcGk3ZTAxQWF0MCtaYk8ydWFiQTVTL0NzTk5Kb3J1WlcwaVprUkcrNTVO?=
 =?utf-8?B?U2w0WHZaQndjL0V5MXNPQmZCVnJ2UDBiNmw0SjJIeFJUckxHamw3TFloYnFW?=
 =?utf-8?B?U2Q2a09KUkg0TWF0NTJWcFc1SE5KMkhlcmhmaHlxT1dydEF5dnduOGJWWjNi?=
 =?utf-8?B?RzZPNTZGVFpVdlRTYmpMWlN4Mm0zd0VZdEo2cXFlVW1uSHRiNTJocXlIYzVx?=
 =?utf-8?B?aWphZVkzd3ZXZ3lieGR4d20xMzlNQnc5YzdrQXBjdmVyeUYzck5vMXdldzZP?=
 =?utf-8?B?bUVsWWI0QzMvZHNmcHF6cTVoWDBQYlB6KytCR3BWQW5xZjFRc1FGUTdpZTcz?=
 =?utf-8?B?TElobSs5WkxxeGdaMHJ3TS9YWWdCdlYzUW81c2J1bTg5VlFIaFZCa1JJbldk?=
 =?utf-8?B?L2gzaG5YR2VSSnlqSGRocXZVeEtOYXhYay9UZHk0WkJsdjcxZHg3ZWdhRG1M?=
 =?utf-8?B?dE14SWFJUlYzSmNXcHYzcmFHS2FwTFhQM043TktmOENxd3h2Sm1GbytJTmVt?=
 =?utf-8?B?ditrTW1hd0RoOFF3NTRNUkhuRjFlcnRqZVUvM0RoamRmazBaamc3WHhXL2d3?=
 =?utf-8?B?dGtHN3VyTFMxNjZ3UjJHY2Z2VVd5NzEvR1ZHaityR0NDZ3ZBY1B0SzByN0Rm?=
 =?utf-8?B?V2dQdExPcmt1eVlLb2dLNnR1d0RDa0l6Tmo0NGlldUkrbldzQ2FUMkFob0p4?=
 =?utf-8?B?c2k3amUrek1HZkNvZjdQUHJtZVRXSVlpemtCd3dFUERtUXlMOTh4VXVmTmZn?=
 =?utf-8?B?SVpadWYvb0poUHJYWkw3dnFSWGx6aDJTb3RDTmRvYUIyRzVpN1ZxZVhFeWU5?=
 =?utf-8?B?eDIvK2FVUlhBekk5Tjdad0hJWTg0eHE4b1ZaVndKRWpvT1ZUY1RVenJpQ2x6?=
 =?utf-8?Q?d1odPzSfSgTkwV3P26kLywbXz15PWq9XRyULXKrayP5sYX?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnFnSzd3dlZ1cklYM1dOVXpTajVXUHpoYnphbGdKQTVxM2p0Y3dxZ2h3NGNW?=
 =?utf-8?B?STdLci9PL2t4QTBodHJjMHVFbk5WRjF3UWlSdDVhREtIWnExWkpieDI4MzFY?=
 =?utf-8?B?TjZzQ3JtLzF3NnpKN2JpTE85RXlrNWlLTEcxdmNRN2Y1TWV3T2hxY2V2QVFv?=
 =?utf-8?B?bWlKVW1YZkJjOERHWUtEYjVHQ0V4bHk2c3I4aFRQSWFzN0hTdHh6T1Y3QW5B?=
 =?utf-8?B?bStieUc5eWdmcnJhK3hSa3Z4NUVnL1hCWkN4dkNFa3pyMmgrNk1kZDZyM21y?=
 =?utf-8?B?MVpLeGp6RTJmcUxqSDIvMTRJUjdYR3hHQlZRL0JmZmhMUHhZQUY1UUNkb0tx?=
 =?utf-8?B?VnJubzlHOFdLTlZYOEExbjJwWnhtY2phcDJkOTVPVFV5NS9oTFVJbXk2bHpt?=
 =?utf-8?B?TVBTY3Vha280V0V6NVRPRFdwb0ZOZnlmZitDQ1k5bTg5Rk9JUG4rNkt3WGl3?=
 =?utf-8?B?V2k3UnpJQk9PUGY1UGtLa2RicWdaRXJ2U05CS0Zxa05wWmJBMXJ5akhRbjZN?=
 =?utf-8?B?WFE2bUd0bU8zT2o4WVJOcFhWOEZQM2RlME1xeUhFdjRxelI1T2JKajUwUG0w?=
 =?utf-8?B?MDh3bXZ5akNVdmNWeTZWYWc5MUcwaXRnMjFmamJLMWtmU1FtUW9NY2NWUkp3?=
 =?utf-8?B?ZjJKS09TSTV0VHhIL2hoNEtTSDRRdVQvOFNoaWg0bks2NGw1TXNNaGs4Tkpn?=
 =?utf-8?B?WFpQVHpTemszaFErYkdONkl2REQ3WTZOQ1dOZERackxaMWNrTitVQks5RHoy?=
 =?utf-8?B?QWRqajJXeCtNYU82SzZDRFpIWU5LcURoLzgxT2ZLYVNvR1I2U1FZaktHK2o3?=
 =?utf-8?B?NVZ6enBvS2hJTXZRMnQvSVBLU3UvaE9JZHJGeGJ5SmpLUlBkeTdFblN1RkJS?=
 =?utf-8?B?WUF3NkRHdWNlTG9CUVdqdDJZdHVNUG1CVXA0UndhQ3lOOEk2UGcvZ2JLYlhV?=
 =?utf-8?B?b3d3WUtLRENhczFOOUg5anJaVXRCSjFwQ2c2Z2lldTNobkI0Z3IzNzgrenJ4?=
 =?utf-8?B?c0ViR2RGbUVBbk5Wc25jVVBKMndyUUtHUzhvRU1DaUc2M25Kd3YwN0UranpE?=
 =?utf-8?B?RXVEUER4OTlQT1cyVUU4ZFFNdUpzb3F1UlE5UjNqMUovZGV4RXAwZTJGN201?=
 =?utf-8?B?QnJNZDhwYnFvZEZNcUpjV3J6bW5Idmg1YVlub2pranU0RWgyaGxNRnQ2dldy?=
 =?utf-8?B?T2hJOFgzK01EZncrbEZnSWtNSElRWDcyVisxV2ZraExNOU5JSFNvRUZBVG45?=
 =?utf-8?B?eHVQS1RMWHZzUmtiQW9nN01Eais0MkY4NVpUb2x6eVltbitFWVFzR3BzQmRE?=
 =?utf-8?B?bUJXZGlSU2Q1UEZwN0Y5SHV1WVZQUFJBK1M4clVadUdTYXVqZzdacTI0Q0pP?=
 =?utf-8?B?bERYdy9qSzAvNS93SmlXYW11VWJOWkQ1dTQ1eU0xV3FkV2liUG1mN0FDQXhu?=
 =?utf-8?B?dGI5L21lcktTVCtvZGtNVUQrRDQyRStiMkxzd1BJMkJDOEM4SFk5RXRvTmRz?=
 =?utf-8?B?RHlQS05wUmdxRUtMdHNMV2EyK2VOZmdvQlArWWxsVEQzZEt4Uk1vNFQybzFu?=
 =?utf-8?B?aFZmUTIrWGZQVnRlV0xPNmg3TXA2emREWFR2Zm1lNTlyeGdUZmNDQWVsdzBD?=
 =?utf-8?B?bGhPOUdSdDRtTDcrT3hOWnEwYW9JckJoMUpmQ2xMd2ppczJITTJ5TDV2aWNi?=
 =?utf-8?B?S1Bac3ZtRk1wTmk1MzZZUW0xTHc1aTRLSHJxNnhWNGR0dlRuYW85VWswZGdK?=
 =?utf-8?B?V3RwdjNyQ0ZiOTdFazVjblN2K0g5bXVoQTF4aEVDQlpKUVdkUWVicHFaK2t0?=
 =?utf-8?B?T3I0WE0xN0plaFRVVFFueTB2MkFoZWUwcWptTitrdmJ5Zk1JNEREb1RSYW85?=
 =?utf-8?B?TzVRaDYvWDg2WlVlRnRHbTJTNnRIMGlqLzV5aVY1QXFaYVhMVWo1eGduT3lD?=
 =?utf-8?Q?RKpp2hD0f5bep4HwRGyAGRczq2711BOc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ab99a1-c5da-4268-26e2-08de954ea8e9
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:10:20.9853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB12767


On 4/7/2026 7:26 AM, Inochi Amaoto wrote:
> Previous the CPU unit address cpu of sg2042 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.
>
> Fixes: ae5bac370ed4 ("riscv: dts: sophgo: Add initial device tree of Sophgo SRD3-10")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com> on Pioneerbox.

Thanks for your quick action.

Chen

[......]


