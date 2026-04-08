Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BEB363C61;
	Wed,  8 Apr 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639300; cv=fail; b=qGSQM/CVTTMnpyVT7tACwg+dMowMIQ2j04LaN2GXRzoLwcGESHm9rLXOSXOMilbRrizLyzJkSXrbmD5jX9dSS2dfy1cM7eMOJtM+nzeWGfT5ulFLY2gGFVRLRXnJoH6qHbQjehxfb/3hJ2BdhqKNMBAoOklqD5e1eXl9SJUP8ss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639300; c=relaxed/simple;
	bh=rB4wgOJREAxtyL8IhYvJ0e36GJaueghjx39dPMVHuj8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oA407fnnQdJHqUCz9RC0mkbQTlYOGVW6o3iQXj8TdUTl9UdbELTsP1gMWVeWokgtM+lag+Z85rxSyd00cRZmtGNwXZ4FdcxpABm5EDsILpO2wnG5SNzWDb2nDQd4ra7n5gGhefrKzP0bXoEdPu5dM/faq9Q6gY4MkD10c3o1BX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Z31+zt/L; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Z31+zt/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4blZipHOEnM2R/B5vT8AkI6ezj03k5sxewt5kqHAD+Y0AxV9t0FipmS8cl7BfJ/PiHbGj4VlQIatWQwvhN0kiiAIJpghtB1WZSe69JyA0oia8+5A250I/6+DrHiI9b7Lb5xgMXeeXAgfK5HHiuveBEngyOv3z5RASFoCjE/q3l3vhtfdkOUTqbZqRLAHeMa1W2ffm1tI5LTXMnMcP51g7MK/GzaKG2YKURAnrQs2MZDjXiD3JRFZ0f/cxJDyBJ6uw7KsaFpx8j/j1tEei/ly3/bUcVJDA1JwFlIBiOBDBiLdqx/cw6mYICHqo2WJ8XZ3jsqsgvUoipcKoruaBzXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rB4wgOJREAxtyL8IhYvJ0e36GJaueghjx39dPMVHuj8=;
 b=NXf8cQK+yTVpcOvDk36OBOiMfgXhlCS4FowcX7b5XauXraGUzORNiMEhx6/qmDMxkJnk91vOtFaqoZUCMhZseEn6cfus+qriphX6aT5h8UOxTj4G90KLaZubuT78E5y4xdAFWezDBZZkmg+HHAKS6OrfM3TswuBuCRd6mpZ3GqDkiuU6m7eX9oslkpTDYT5H0/d0Rv+VghiAQmil3ptMu6wyxFLqnHni3BUefpOucwKFfgSuTUT9PlUQbL6IdJVOck4WexF9I+b6sJKU9xRUSrZAi6FTtTTDoLh9WHZdgOOpzDOo0M0f3kJ+s74L+mEFo05DHsakrxZEmwJaLcVxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rB4wgOJREAxtyL8IhYvJ0e36GJaueghjx39dPMVHuj8=;
 b=Z31+zt/LLZYSWiSqeFzkH9d+kla8KWiM21v44J7BtD5Bg8rXCpTn/VI1WtFL0Zv06AAmOuxF/olNBnSD8T1165U+A+MenKJpbdIMEkD/slzskSTSn61fUDdl0n3iWDkehApKnAIqfB7/Y7auT2x4diL59eSKYfy2RXQhLPtY+hzKuRyu2ADSO5Qvu+eAd4yXa9ZwuMvzpuPLjZcJfbEighaUuq4N//dKqUsNwOE9jJByzJF3z0DS/Wt47xHZqHT4rSaSJjT2DE0OOvhfTd3qIrLaoNGsmf5k9vcQe/Cd59Mts2JCEmVxqIx+w7LhOwHEI6K5SnOtj2UE0qC87ehP8A==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA5PR01MB11209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 09:08:09 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 09:08:09 +0000
Message-ID:
 <MA5PR01MB12500407E24D8E355D0B3D392FE5BA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 8 Apr 2026 17:08:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: sg2044: use hex for CPU unit
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
 <20260406232655.144043-2-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260406232655.144043-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <4ff624cd-4780-4c7a-8a23-9dd8d85e2d30@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA5PR01MB11209:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ea08e0-9f48-4a00-7e5b-08de954e5a79
X-MS-Exchange-SLBlob-MailProps:
	iS5pQZgsAQDoZe0MsFsUcxnezMxcSwn2G8Wp220eeYoQeBfpi1MSbZQ8iExEgCcHZA9u6sByRHD8DR+eRGxBaAQTdhrAlBtKzyeeUhJ1umCP5XnRXhJBukxkj9EUuXUKghUV4z1DgiT3SQUmkhReE3yawMa15R5odWDkQZ98pLhLnMsAivVdRQAjU2H3IF17KSbIUa646mDBd1ATLx+ULa2tcA40egbgTq+0vThebLfutDOzRRRwDXsu7+gQWfbAsnC7koD4DVAGAbPltXXS4TMkI/60ZCSCBFsP9e7xWusxG5YIE2eexKqKBsrv1zIEPxy8o0sFX083KzVQavdmVMLYS/IbBZwGe9Edfo1XZSy/uJooOwZooOoTa/lOfm81o9Tq6qYfH7poNtyb98zW/miy/ivmq1HLIM57/V4j71//tOpXFER1gM8fBe6Z/TxQb176476Vbaos4h2/WTyjgDY0xpqLEWEaY0RSNAwD4BPbwxe9C+FEMZUyKqb36HmHcvVNpqwkuCMylw/TbhyUXsYdJSeU0XRcnzphIP9Y5JRD3OnTi0ZtppE3PjHFWukuNR/7SLe13T55zrJFIiYBGOEy19F3i3+NXDAgDGqqvqmVqAMpq12pCVPzrEIjMh9nYpPHc/9oHL3PsirWSgUEiPbYO1MNK80HgUnoZbulw1DiUbGrP5/dwI0rqtoAGxo1Dau/yKmB/wQNCyccBNIZ+6JKidB2ehB5SI3JiG5XWQgkn34yTvQzIfCZLy831sh8eEYmdkMUnRZTlVvX94dimwbqXd+k/uZ11WmNcWCAs0JBOTvKx7p8Os/K0zjaZgyr
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|23021999003|41001999006|15080799012|461199028|8060799015|6090799003|19110799012|24121999003|22091999003|25031999004|10035399007|4302099013|440099028|3412199025|26121999003|13041999003|1602099012|40105399003|53005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkZOQys3ZHRmNFFPTGZVekMrZUxxSjVzNStIUW9GeUFZRTVkMmRNUUdNckw5?=
 =?utf-8?B?bEJmN21zeS84bnRaRXlvcjNsanhMVGZEZ1gyNGNyR0tnMzF6aEtqZVFSaFp0?=
 =?utf-8?B?S3pJL0ljZEQwM09abTQvdFgvUE14bnN6TUxtVzVFK2JKcG5xZTBrdUkyMWNy?=
 =?utf-8?B?RzRDM3puYzIwOWxaNHBySnVoNFpFNWZnNGhhZ0I5c3ZJcnRTdTRhLzhBZDJV?=
 =?utf-8?B?ZE94REpHaXhtdnRwNGdSSkRNbkVtZTF0a1h3ZnFSZ0NJY1ZtR2JVSmcyd1d2?=
 =?utf-8?B?aXU1TmZCVE91NHdXb1pNT3BSMS8xUjd6eVNRK3ZoSGtCby9PWGRiZGNYRTk3?=
 =?utf-8?B?WTV1TFFrczJCZlpNb2I2MlBZa1g1SUZhNHcrTVl6TVVlcERNR2E5Z0hmaE8z?=
 =?utf-8?B?bWNnUVNKa0NEVzg3RzQ5SWdOK0dBbTl2VUFiOGFISVdDVUdBVmg5N2l4U3FK?=
 =?utf-8?B?bTh6dThxbXdWRFZGYWdjL2JONldobWhWQ1VzZ1dpSjJiclVhMHprWmpWNjk2?=
 =?utf-8?B?U3A3ZzJidmNEdHdZMlVsMkNtYXJITkFYSytyOVJ3aUFaNnRZd0srSzk3N0lo?=
 =?utf-8?B?VFRmUXBneU1nQUtLUDlPVk1HL1E1a043QmNqNEFTQ2FwM1p2R0Vra2Zpc3FB?=
 =?utf-8?B?SVQzZ2UrN2lPeEFTSldoQjZXbG8vVmw3UFN1VklFUmFvTDJzVnM5Ui9waGM0?=
 =?utf-8?B?VlVpVFdLaEl6ciszQUNDU0licUM5S0J6T1JqUWhOdTlFNkhzNGQ5VW1TVjd5?=
 =?utf-8?B?UDVBVk15cFRWc21aZFNnTDBJRHZIbEZoclJxK0pQQ1o2N0hsa0Q0dG5XVDdK?=
 =?utf-8?B?M290c0pZMTgzcFRWNUg2K3ErclZiS3pwVVJOT3p3d2FJaDhtNlBnMFp0VnRs?=
 =?utf-8?B?Z2pYMWx6TS92KzBRaGpmMHdPbm90aVlUMHJRdkNndlRRT1krV0d6clc5STls?=
 =?utf-8?B?NjVEWng3aVo1SnIyVWFjOVdOUDRDRVNIMDlEeGRYNjhhQ2lvUmplbVFVS3Jh?=
 =?utf-8?B?RVJsR09wWnpIdXJIR1ZqaFpzRHdyMzN1VktWV1FQZlFrblZyRzFGWkYrMGRV?=
 =?utf-8?B?VU1QV2dtMkhZZElMbWVjWUJ1WnhOQVNibFpJRjBacXQzQUM4cHh0N2xMMFBO?=
 =?utf-8?B?L0VXRXN4UTBiUlB1aFdLRWU1VCt1cTZxeUVzc1NIVU4vV1QzMGRqdUUyNEVO?=
 =?utf-8?B?RUxhclFHOFphODFzNld4ZC9JSG9EL2M5ZzU1NjVKcmR2SXVYbEZkZ1dSaHRQ?=
 =?utf-8?B?QjlwdVkwWXFvUmFtR3F3TnBpbjFhdXQyVC9USTRrOFVvTXgzanF4dDBoc1VK?=
 =?utf-8?B?OHc4UWtoRXZ0SGxISE1SUHRWb2NmZU1xWXZzcjRWRnNjeHl0MFdKTUtnMjNB?=
 =?utf-8?B?NE83VjgwZmcvNmJudVluMzdYTzZVSHdGYUtEYVVDbXFiT0ROdTlEWlEwYVh4?=
 =?utf-8?B?Mncvc3FRREZ5WDkzdWptWmR2RkYyYUpMWXR2Sk1kcERwKzFWRjdlRFc5aTVt?=
 =?utf-8?B?ZkVPTXk5OGNUUDhWeTl4VWRHOWxRMk1yUjhOa3FaMUdPMWVyVXI1eWxUMVdi?=
 =?utf-8?Q?JSh+yPb2DHoUNMWBRggff2ysrFDr5JkBDS1ZCPB4d8ZRD1?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SC9lUU80TnhyUnFIV2JZOTh3alc4cnB2U2ljTHdIQTczLzZtNUVwUWViNTNh?=
 =?utf-8?B?bURoUnF6UnlyQWZGNk0rL0w0czBIMHNsQ3dLaVZRZ3NLcFJuQ2N6SkMrMlpJ?=
 =?utf-8?B?dllMSVdwWDdEUEdIcnB4c1JQRk13YWg2MHhjZXFBbDJJOFZDMGJNMXpXZTJj?=
 =?utf-8?B?MXpXNGVFa3VEd0FGR2NzUHVtcUlKblMza2hNbGpvVGNLSmVTck5HT01BZFRF?=
 =?utf-8?B?VlF5UXdkb0paVjJLU0JQQmlLVUIrZmhoYmdDTE9MMGg1azFGOEh0c0lUQ3JX?=
 =?utf-8?B?ZU5KZjh4emx6Y2t0TTRsQmFRUWVkdEFUY216Zm1GMmsxK3FWZXMvQlNMY3da?=
 =?utf-8?B?MDJLbzV2YUlLWDJXdzlNUjlQWjJERFhaRGc1SVZOc2JjYndzakJ4WTlCVnRh?=
 =?utf-8?B?MFN1N0VCQnVDWTBnTW1oWmU0UUR1WkxiclBHTy9zNHptQnN0cWw1cTBTQjUv?=
 =?utf-8?B?N3g2QnYvUWE4bVRZVS9aRllDL1FQMTlPZUtuYlYyOVhXR05nTDU1ZlVrMXYz?=
 =?utf-8?B?NTZrUHZOMnRqQmVSS000MjUzUzVyR1NzSWo0RFF5Mllxd3RLa3hmVFpETEF0?=
 =?utf-8?B?Zm5lQzk3NjRaS0lRZEFUSVhiUUQxMXlNVDlNSUlRWkVsbExGVkoyZkh5cHJE?=
 =?utf-8?B?QXNPNDJTN0M0dkwrT1huRXdvWk1oWTNCaGtIbVFubmZ4SENNcUxobEZRSlVU?=
 =?utf-8?B?ZG1EYVhhSVpnaU1XNTRYazVCTGNVaGhteW8yMzJpMURSaVBNMGR0TzNUSkVh?=
 =?utf-8?B?bU5YZ3FMb3B5TnlZS0RpQWpvSnVuYVVtT3JGM093c2RYd2tlSUYrcGJxOUdU?=
 =?utf-8?B?SW9ZS3dPU1JDUUkzMzMwMTlyZkxqMXA2U1JNQU9HV3ZHYURod3ZOT1pUaFJs?=
 =?utf-8?B?VTVKQm5QdDA1T0Jpd0ZzdVRvMExxdEJDT2l5YUwrdE8xMU1CUEJudDlTaXZK?=
 =?utf-8?B?eWJkRGdtQ2c3NTF2c2lya1JGcWZBQWp6SkNsRWxpeS9RQVlweHVuSkx5ell2?=
 =?utf-8?B?WjBmb1h4VUtpc0t4cVVobjg3dnJ3UXlCUXZhZWl6MFBzbFM2NkJLdGhRV3J6?=
 =?utf-8?B?SFNjMGJXY29pM0FCaC80MjdSczBwQlBXVFN0SWcyTyswVmJpK3kxZG9HMC9X?=
 =?utf-8?B?TWZhU1lham9sU2kyRk9qSFoyQ1ByWWd2VnJuQW9qb1ZZZ2t0TVFrZ3lLRFMr?=
 =?utf-8?B?MXpNNVhxK2dWcTZrUnZCUEpKOGlxS3ZiRk0wcnp4STA3eEZrMWFMU2tMZVhE?=
 =?utf-8?B?RzVSR01jejdQclZQU3dIM1NrRDNLNlloQXFsNnNHemREb01IcTBIU2xFeFZw?=
 =?utf-8?B?QXlHdWZwZng0aXpRL2Ewai9rVTFqbjIrd0JDOGRrcDdzRW5qZTY4eGsyK3dW?=
 =?utf-8?B?cmMzam9vSVZETzM5U3UxMXlXcSsrbEliTTJiSDRRZkdhbFl3Vkl1WUlsTm5T?=
 =?utf-8?B?M1p2c05POEdwdElSZDJuNlkyV3A1ck9uZjdOT1dPbEFYSDhtSjEvOGc2cjhG?=
 =?utf-8?B?SVNaaUtCR0dKSElrNVNPNklheHZyYlQwTm5yb3lDd0MxOHVVQlZMU2gwOUdv?=
 =?utf-8?B?MnNrV1dqRHRITDMrZFV1Q1NlZkdSeDdJOFFaOUtPaFpBdDlJbWd4V0xFdHh1?=
 =?utf-8?B?aHlYL3hQZnhFc1VjTWlBWkIyRXRKcm9GNXJ5a2NibEFUZVpMYTl6eWFQeTFM?=
 =?utf-8?B?OVhlQldmVkMxMHBDbXhvdlpZWFdDQ2xhUDVXQllKUlFmRXZIc2tUVnJTWGFV?=
 =?utf-8?B?Z25odVNYZS9pV0RSSXBhQ3hhZTc4S0VIOEQvaFE1a1pkNUNGTzZ3dGd4Q3FY?=
 =?utf-8?B?MmZma1FSNTFPRUordUZPdUgyYTVYaVY0RndPYW5TcnNnZnI5Sm9hbUJ6R2Ra?=
 =?utf-8?B?QXRrZ0lsWU92cjQvK2l6TmppdmtPdEhVSFViZXJsR3RGTkhBSTd3WjF3WFVF?=
 =?utf-8?Q?1JTnCX2kEtMoE69jbI2pV/Dvw7YSBIgE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ea08e0-9f48-4a00-7e5b-08de954e5a79
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:08:09.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5PR01MB11209


On 4/7/2026 7:26 AM, Inochi Amaoto wrote:
> Previous the CPU unit address cpu of sg2044 use decimal, it is
> not following the general convention for unit addresses of the
> OF. Convent the unit address to hex to resolve this problem.
>
> The introduces a small ABI break for the CPU id, but it should
> affect nothing since there is no direct full-path reference to
> these CPU nodes.
>
> Fixes: 967a94a92aaa ("riscv: dts: add initial Sophgo SG2042 SoC device tree")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Link: https://lore.kernel.org/devicetree-spec/00ddad5a-02f5-474e-af9c-11ce7716ddfc@iscas.ac.cn/

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Thanks for your quick action.

Chen

[......]


