Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E93D1CCD;
	Wed, 20 May 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276762; cv=fail; b=bZPlVbeigs3SytpBmBj1o7c/e34NwTX7d4EWsFzyv2ozWgJX529PLcozshFDFbam9a79LWTMVeAw5t9Hh8W/cDtNSmEOOPz8fcpjAToVWeCQDzdQEjazujuFNKfyTowU/osBzu/eFFbNJvTRB2ZpOW+zFDQN1yMTXy+dq7kuU10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276762; c=relaxed/simple;
	bh=msPiuW4MwgXGMSbrByKTI4dQfjdsu5Z+1US8qkFN32M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pcxB37umPOFPO/vE1MYcThvrHWQEHLFr30PaMD+zZ00QJ5iBuYY8mnbj05DCQvsiut5bL79yAjl8XsK5NG1z0e0/1xRlJ7ZTOaPm/1S6hG6Ta8pPSw2D/YgbXCdHjxc+rRicM5jZZNaqWcowg65yv7bBzYhLAu3AIsUDBockkoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayg8c4pR; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayg8c4pR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779276760; x=1810812760;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=msPiuW4MwgXGMSbrByKTI4dQfjdsu5Z+1US8qkFN32M=;
  b=ayg8c4pRpWAEfzgigf+ZQOrfJM9LnecIxehAt1KGeNQScSstkDIP7vLp
   H88aAjK88XXoWCYbhHonAAfPHeEOG26ehXjLinGUUMBRz1nuZjqVU5utO
   2OATGC4OMNUWx4PffDK2DEiJ82BTuUGnbb4OevxClDpDBmH9544aVGJ4Q
   qVOFu0ve/rKv9pN0yA7ZaBndyhtWtCcLCRutzewkLXZZ5W+6x9zM21tJR
   s2fIfJ2GwL+PqAoV2RTAmSqSWPsHabSuCMPnEMt5fSc9JbHbB1lq86dlj
   wU3gf34z1HjXV8HbnFnntBzn6PQGsZZGByLypo7BY2lW1+RFDSyb/BEuN
   w==;
X-CSE-ConnectionGUID: IR1pNrQiR7CNm+PJEoxtrg==
X-CSE-MsgGUID: 2vBpTHlVRQC/qRkIgo4zSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="67700063"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="67700063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:32:39 -0700
X-CSE-ConnectionGUID: Yjg6xQ0RQEadpWCssGtnIg==
X-CSE-MsgGUID: unQEnIBHSy2aZL8zdtaErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="278243161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:32:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 04:32:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 04:32:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 04:32:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KnwB12U5FSxAxD5hgcrKosxQ0rL93hgKqkPEhl0eD1bfzpi0wipRj2HAdiDi186rCVG2YSIjEuSjnN2ylyovHoG6sUJgfRBDbHtQWf+02U4k5IVwRv8LTriuJOnb5JxGzNsyXN8HooL0Ra99/P4QcfMkgBEUkjWRQJH78KcABb7hHaCXzqFB2spvqXm+bWnkWxQbFg6FX5uMm5yzV7DP/9NlQgkl072HytkEGJRyIxZD4uitnkqEs0PjzdonOq6wpLexfXOpdRVGXXp948PIJLWxqtYYtvo6GhaB/xWCM9+rNdrrKqURqrKez5TQc5Wr7t5CmG4Y05rAqpD9oFklww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYy8IKz6W8/VB2dYd4mjaci/Ry5hfuAxOsBvNJAxhDA=;
 b=DVtJdfjSPv/rAloYNxvS/lMCyQxaC7DGYDexXoizzjEvlVTJCfV+5q3be5GgC1LqObxnakX2QE9ZGhGKo/lqplETERQlYeFMncLQd5iYelSOmwrjxuprvst7uO0x3venlpGcgk6+RuK4rmUyuACyfkRsUCljr1qLRXwsM6S4VKOjhj6Bs3aWrs9hrFYDONzIi2Dn8lINuVyvUCQYQk9wNpf9oUAErDusau20DTm6UzFT0fNEss535+fDNRURki1y/o4p+tOY3QBptVDyG4/LTkSdirpMbP66gcBfuSBemtAFYFxw3y2gL6S/UeNU2tR90hHcqZTi3H4QGhCw+m7QzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 11:32:23 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:32:22 +0000
Message-ID: <c6c8ce84-bb47-4761-962a-e506a393f2b7@intel.com>
Date: Wed, 20 May 2026 14:32:15 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] perf tools: Initial support for RISC-V trace
 decoder
To: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Greg KH
	<gregkh@linuxfoundation.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, "Mayuresh
 Chitale" <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, Atish Patra
	<atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, "Sunil
 V L" <sunilvl@oss.qualcomm.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mayuresh
 Chitale" <mayuresh.chitale@oss.qualcomm.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-12-anup.patel@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260429125135.1983498-12-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::15) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4eeeb1-374d-43be-d9cd-08deb66375c8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|4143699003|18002099003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: USBfcqzEaiIACIVfN1bLmWRa6mri/og2GBNDfjOxcUhCvXFSKqTmYt6x4TZNdK7xaKM50HqKR9snq0Ma+GHibtpwB/A9AlSb90RftJKj2i7sDLo08DzYv8ylPbROP9dx7+u7E9Q9pVfSsAPhsxFaB5sJyBo7wIWpWkjt5LmpbkHDRaFyof/P1ohQrEITMjYYxBfqR4aR0KsBHEj5CDSyIZeht61lTTchQO/f9U/XPLPPAGwAfKfgwbQFBycjTT6ENoHkyWG48SLE/3ui0XoDVhNxHHp7ET8Cgwp9Cfi/u2acRE8clWMwU7ZmKGdPMFqLgbRr8JJPVFsL0t6zTaaqVNvvBgsuVmL3DLEw6woisZf+ckKZqJxYMgD+WfobbU1jvvQeBqI2dYoLV18GpOUxgk74dJge/al+z9Ht01BOgJAOnFylJ3eoWf019gmjlXBmxor8b2R6E/1TxSQ98j/wmjA+eZJH+/2AkqoLBAcRYF9iDS864hn2++pIQFVtzHtv31INfgiccWZV+kVygfPLfXiV3itSUc/TK/6gjlELTSV4WDGFels/wheyDfjqnz9UWvjNWPYIYQlQZXsIZKu1hxbv/+O8PCzjyoMD9z2iZLxxhN4/YpzbZMOd7BqnGNlXEg3BGTcipsD3czBCFKdngYNSHS2EBl2scGO8xikHC4QchlfJCXHm3LfPvTOhzmDk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(4143699003)(18002099003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXQzTmRHeVJndCsybnpwaW04YVVVOU9CWFVXaDN5WGVBUWxKZHRPUmFpcXFV?=
 =?utf-8?B?VG9rS3J6L1ZReGxZVXpiLzZydjNWWlZwUHJzRHBranJUakd6clhUNzNyVUJl?=
 =?utf-8?B?bEhhR0JobUhOa1Z2S3VJdXBaS0QrekdHeXNjWXpTdE5TUW9BLzlLZHRrSEZV?=
 =?utf-8?B?aWJBZXdqMnROVVpUUllObThrQ3N2L0I4V1FZcUduc0FiMW9jT3AzWlBCK01W?=
 =?utf-8?B?ZHQ5WnoyZzEvaFQzTHRodlVkSGdaVU8vbUFScCs0M1laRHpjRng0QTlRazJG?=
 =?utf-8?B?VUc5QWRaSjludG9SbmlWNXBiUU0wMmpidFJoK01kVjhyNURFUFBVMzVFbG1Q?=
 =?utf-8?B?RnVrTWtaT1RpaStnTmJoOGV3Q0orVTBiVzUwaVdyczBxc21RcTBBMUdoZmEx?=
 =?utf-8?B?dENiM20zck85cXdtWjFEY3BRR0NISzEvTVRtNDNRblJkQStvcXQzTmtDMXNC?=
 =?utf-8?B?azVIRU9EdHk5cjAxc3Q2S3V6QnVBYlNTSG9lMmVtZHZOZ0VMT3J4QzR4VmMx?=
 =?utf-8?B?aXNLRWRUdHFmWmJxa1lQN0RWbnRxelpueXJ4Rm5CTEM0MVZJaVZmNHVDUWR4?=
 =?utf-8?B?N0JPZFZLRDJ3RXdkSGdhb2l1K0xqV09FdDI3Y0Nrd203L2gxQnRwQjBWaE44?=
 =?utf-8?B?TWZYOGQwK1Y2Y0NXR2paWFZhdy95MG9Xc1JmdGNFemJqaHZCM0hVdHJ5Y3lO?=
 =?utf-8?B?ekZTbGxRTGxSYzhDd2pkZTNmcFZXRlhWNWtDRkZtRklEWmhNRk1ZL3p2bSs3?=
 =?utf-8?B?QUFwTTFPVGJLb08xQWZ5S0tWRDVWTnd1emIrd3V3QVE1cm0zaUVUMzQwMzBj?=
 =?utf-8?B?czZ4TW9KY1VjOEtOb3ZhcnY3ejZSNm9XOGVzOXN2R0ZFNFloM0tuVndUMnkr?=
 =?utf-8?B?WGh6VGN1ZFdLQTB5OWloZFNLY1pOMitaclVaVjNhcDRUY095S3A0TUM5eVRT?=
 =?utf-8?B?L1Uxa2ZtN3RlcjQvbGVYaTE4OWRCTDltTXB3ZFQ1cmt3d0pmZnZqSnlCRS9a?=
 =?utf-8?B?Zkh0UmZTVVN5Rzl0cmFjWk41N0haK1NWRXc2dFlXMStGZ09DZzZDTmJjU2tY?=
 =?utf-8?B?MVlxMzJwcTQwM0xmeU9XL1NIdXhjdkJQUDVHZlh6U2U1SjhPUzJPd1c5REZU?=
 =?utf-8?B?RzJoWnpsa1JxMWFnT3FRRmY3b01UQjRjbVY2SElyVVB0RFJUZWExU0lUYVho?=
 =?utf-8?B?VlhvNmFpNS9CejNiNENPWEdXdEZYcWNCTllJNzM2eEM5YWw0cHFqSDdUVVpN?=
 =?utf-8?B?ZERKMTBJMEhpNTJpSHNUYXZINmV2VWN0WlVmM2FOSGF2MmZHM01LRkhUUFVI?=
 =?utf-8?B?NHZpREdsMm5GMFBnUFhTbUFpaGVjNEUxOEZ6aFpxdWwwK2dMQnJMQW9HQ0Ft?=
 =?utf-8?B?SVlGcUpKQ0xEcWw3VGhYM2dlN0Y1ckZraGZiMVJLN2VycFZyR0txNHJTZGFq?=
 =?utf-8?B?aFM0MDcxazdsVWpsYlRLakhWNmVScHc0d3JtN29aaXBpNGZOL21lcWU4bVh1?=
 =?utf-8?B?U2N3WGc4Q3BCVkY0allVNk8zN2RMNWJFSGZNTVVHbW9XSGZLbnBhN2pLSVRN?=
 =?utf-8?B?a0E3eTV3d2Jpcm5NNWt6eWs4UTRONE52Y2Fka2xDd0Uwck9YVmhpdFl1akhT?=
 =?utf-8?B?Zk9XMno5Ujh2QTRiVGN3ZDRvLzF3QjlHSUJuZ3JKMy9ZbWM1bDZGeUI5dkVU?=
 =?utf-8?B?TkttOExMcVM1TFlDL2JUeDJJcGFGNUxKYkFKVkcvOGJqay9PMUw5UG90SVB4?=
 =?utf-8?B?NHh0NjJiRmgwN3JIYW1iMmlBQmxCNWFkSW9PdStxN08wQklSWTdZd0JpTFl0?=
 =?utf-8?B?c2hxMEJidTFWTjB3Nm90Z0JLNXVqL2gwOUtrYzNLWmRnWXhYL3ZONUJkVURh?=
 =?utf-8?B?ZUhXYjdoMHZiZXFuVmdPL2hXcExuNHdlUXlsV21IbEhvQU1HM2U0SVNrMVB6?=
 =?utf-8?B?a3FtNmd4T1J4dXdRdUc5eTBENHlrM3ZibUZ3UWtsWStrZFJBVzhwejZuVGV0?=
 =?utf-8?B?NVBCNkpTbS9qSGlLb3Vic2w1V0o1SWozUk90Um1FUS8xSEx5OE02VG05VnJP?=
 =?utf-8?B?WS9LcWVGMzNZVTRLVjNjUWVBQXVsa3B0UjRKTTh5WTZxQUxhdlRxREM2SE5S?=
 =?utf-8?B?M3ROdERPZllVd2VXb0ZaQnc4UjY1U2RpdjZPQnh2bFNVeTNxcG5EcDduMVhz?=
 =?utf-8?B?VlJCSm5wZUlKN2lUNjNXWTMwaDJQMlhpVnlKYjZvbit0N29QSisvekNQVTMw?=
 =?utf-8?B?YU9kenpURDdPMFR6ZUFNRENmYTJQWnNPemJKSEwybUExaUV5eXpvczZNdTRD?=
 =?utf-8?B?cEZYSmxVd3JSTFkrUlBVYkhyNGlOcGJrMFp6TzFoSHp5S0FjM1Q1UT09?=
X-Exchange-RoutingPolicyChecked: ShPdD4dKSPrzo2pklViVEbGzzRdT/VQ++YU0Ak5l45778X5dTmMZNfgAUEqY/rRDQCRCtS2v3JQmDUd+f6uuhSonxVw2V183kqafrffjSUIhI5H6FYEtqf+q4Pv7jPQ/8i5S3iL586Y0kdoi2woBoIGZDEwyEMrbWlQAuvi2qUuoCb5yp3kCzqYq/D1bpHcJeP7kr8h6I7wITN/uFnX/0zkJDXUtcUy3adBtQehIfHIDr1dUwE/kiCU5hZZ+WBXQQwOpR8/10HuJA3hne+7pSipXWXnKrpwH82mQJY0O8mlTLklIdRTq4LqRVp1UvZ1UGbjDoy6ETCBp1jLT6FcfQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4eeeb1-374d-43be-d9cd-08deb66375c8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:32:22.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W36mMJbS62TqCuSsGWvO0EVmFMaRiswwunrVgrH6ScgCjwqqRX8BfjCuL1apRuMX+rejHQGkhXf5VSWInWy7Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-OriginatorOrg: intel.com

On 29/04/2026 15:51, Anup Patel wrote:
> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add bare bones support for RISC-V trace decoder so that the data received
> from the hardware by the RISC-V trace perf driver can be written to the
> perf record output file.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/util/Build             |  1 +
>  tools/perf/util/auxtrace.c        |  3 +
>  tools/perf/util/rvtrace-decoder.c | 91 +++++++++++++++++++++++++++++++
>  tools/perf/util/rvtrace.h         |  1 +
>  4 files changed, 96 insertions(+)
>  create mode 100644 tools/perf/util/rvtrace-decoder.c
> 
> diff --git a/tools/perf/util/Build b/tools/perf/util/Build
> index 70cc91d00804..1cd1491f93c8 100644
> --- a/tools/perf/util/Build
> +++ b/tools/perf/util/Build
> @@ -147,6 +147,7 @@ perf-util-y += cs-etm.o
>  perf-util-y += cs-etm-decoder/
>  endif
>  perf-util-y += cs-etm-base.o
> +perf-util-y += rvtrace-decoder.o
>  
>  perf-util-y += parse-branch-options.o
>  perf-util-y += parse-regs-options.o
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index 944a43d48739..c6bd6642ce05 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -54,6 +54,7 @@
>  #include "arm-spe.h"
>  #include "hisi-ptt.h"
>  #include "s390-cpumsf.h"
> +#include "rvtrace.h"
>  #include "util/mmap.h"
>  #include "powerpc-vpadtl.h"
>  
> @@ -1412,6 +1413,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
>  		err = powerpc_vpadtl_process_auxtrace_info(event, session);
>  		break;
>  	case PERF_AUXTRACE_RISCV_TRACE:
> +		err = rvtrace__process_auxtrace_info(event, session);
> +		break;
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/rvtrace-decoder.c b/tools/perf/util/rvtrace-decoder.c
> new file mode 100644
> index 000000000000..58db5ca62c1a
> --- /dev/null
> +++ b/tools/perf/util/rvtrace-decoder.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V trace Decoder
> + */
> +
> +#include <errno.h>
> +#include <inttypes.h>
> +#include "evlist.h"
> +#include <internal/lib.h>
> +#include "rvtrace.h"
> +
> +struct rvtrace_decoder {
> +	struct auxtrace auxtrace;
> +	u32 auxtrace_type;
> +	struct perf_session *session;
> +	struct machine *machine;
> +	u32 pmu_type;
> +};
> +
> +static int rvtrace_process_event(struct perf_session *session __maybe_unused,
> +				 union perf_event *event __maybe_unused,
> +				 struct perf_sample *sample __maybe_unused,
> +				 const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +static int rvtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
> +					  union perf_event *event __maybe_unused,
> +					  const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +static int rvtrace_flush(struct perf_session *session __maybe_unused,
> +			 const struct perf_tool *tool __maybe_unused)
> +{
> +	return 0;
> +}
> +
> +static void rvtrace_free_events(struct perf_session *session __maybe_unused)
> +{
> +}
> +
> +static void rvtrace_free(struct perf_session *session)
> +{
> +	struct rvtrace_decoder *ptr = container_of(session->auxtrace, struct rvtrace_decoder,
> +					    auxtrace);
> +
> +	session->auxtrace = NULL;
> +	free(ptr);
> +}
> +
> +static bool rvtrace_evsel_is_auxtrace(struct perf_session *session,
> +				      struct evsel *evsel)
> +{
> +	struct rvtrace_decoder *ptr = container_of(session->auxtrace,
> +						   struct rvtrace_decoder, auxtrace);
> +
> +	return evsel->core.attr.type == ptr->pmu_type;
> +}
> +
> +int rvtrace__process_auxtrace_info(union perf_event *event,
> +				   struct perf_session *session)
> +{
> +	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
> +	struct rvtrace_decoder *ptr;
> +
> +	if (auxtrace_info->header.size < RVTRACE_AUXTRACE_PRIV_SIZE +
> +	    sizeof(struct perf_record_auxtrace_info))
> +		return -EINVAL;
> +
> +	ptr = zalloc(sizeof(*ptr));
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	ptr->session = session;
> +	ptr->machine = &session->machines.host;
> +	ptr->auxtrace_type = auxtrace_info->type;
> +	ptr->pmu_type = auxtrace_info->priv[0];
> +
> +	ptr->auxtrace.process_event = rvtrace_process_event;
> +	ptr->auxtrace.process_auxtrace_event = rvtrace_process_auxtrace_event;
> +	ptr->auxtrace.flush_events = rvtrace_flush;
> +	ptr->auxtrace.free_events = rvtrace_free_events;
> +	ptr->auxtrace.free = rvtrace_free;
> +	ptr->auxtrace.evsel_is_auxtrace = rvtrace_evsel_is_auxtrace;
> +	session->auxtrace = &ptr->auxtrace;
> +
> +	return 0;
> +}
> diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
> index 24b32947fb4c..8e3eb4d681a7 100644
> --- a/tools/perf/util/rvtrace.h
> +++ b/tools/perf/util/rvtrace.h
> @@ -15,4 +15,5 @@
>  
>  #define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
>  
> +int rvtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
>  #endif

