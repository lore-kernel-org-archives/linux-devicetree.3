Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF140548EE;
	Wed, 20 May 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276627; cv=fail; b=r10UO50tN6MZG0rkjb7k54Rfc3IngdKOrSFRisA/zvr1EwqFPafUC/MM68Cx6W/loUfci3rNKldCMUHgWY2mrn0bdRD/W3Z5yzNA4+zxVuUW0ek5keeOfaU5W4fKDIBv4Wdlzw9OoN001JPMuXbHEFGBzMcpQThn50pe9f8AAr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276627; c=relaxed/simple;
	bh=l2NFtfPajEsKphvvIj3HwHTIwMt7OSXC8JEapGF5AUA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XHDm0RkzepFja3yLjJi51HutPttUktZs9/Kr8nnYy2IBcFN9JGMWBoRUcpOjEnZA4HM9tF0JyHsUc12/8n3ZPwxW/mB5puXvgldwfyCXwt7lhqNL697Ew36tlq7afebZhbGlxeHR19j3p8PYGksbvuBghDp47psl4R3EUv0ewWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FimjYPkM; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FimjYPkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779276626; x=1810812626;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l2NFtfPajEsKphvvIj3HwHTIwMt7OSXC8JEapGF5AUA=;
  b=FimjYPkMv5kd/eXmzTl1gadK2IGHB9wHz1sAq1fWy4iN85NxK8IGUzSW
   Jy077Xqn8aQpB7C7dZNqxEEjuMwYrm0PRLzUPRTIxgdtcmGdf/FgbjMO8
   WxWbQzQng2WnsEz4C38EFZNTnlfhIdrhsxEQCvJYxr0QcY0NEEeLhhKYk
   oZ0EUmFEiaytOeLvsE7nCLwTCtN0fSF3DYwIbvZcHmFpO7/+PR6DI6ajR
   ULZKM83LhLCgcisQ286cY7wASfp9PzhlbaVYGQd1W6t9fvHHm9fvoCsJf
   RjSrnekMYJJd0ve2xX9DSw0B9JsWPbcLIdRxs0PdaFEsRX6zKUleyA3+F
   A==;
X-CSE-ConnectionGUID: Ev8UTxZeR4uJKgnQrqMfdA==
X-CSE-MsgGUID: 4pebWmKOSheNuWgIaG/dEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83787504"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83787504"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:30:25 -0700
X-CSE-ConnectionGUID: kf+9zQY/TGOHxNk7uZTgfw==
X-CSE-MsgGUID: 2ElbWzbvTEaWp4Qwkef/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="240401932"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:30:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 04:30:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 04:30:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 04:30:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrbd+6hJGc96/wF9Bj/BHdr2q6g5dD3+3Vt00GYNgaI1U3nqkMYMUrVLiIpJBDkQNtoeswGw5OEITKzSDYC1TEnHK6xYByCRMs9PF5F7fpsxf7NsMrTtyEjmZPk1yGPp/SIKU4IApi7fOVX7aTqueiPjxE6pi9EpefWsSPsTP7PRY85NG8osVluPEaXiNTqxDhIdTJcQL7FtXv8TEuZpfRNorHZB0js7sgXbZE4D/m9RRUGB4HZ49ooxIEHX2Ftluw/xb/yGnIqYPE7AlB8tT6FPQG6IbQN8AFqjWvc01ieRJMcrUhQPJbrxgjSMMxhB7ACbdqIkoXexkvlYqIm4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD/oublxSsi942fEQaauhNfScGnSrvQhgcTLBkCrwjQ=;
 b=EhbikdfM+ssORBRnU/CscoNA+UHFN2qV0/nN5RJ6/V3SdSBBXXxZqOy40T/lM/wyXN5APjYf9378LJU+xSGyIx5O8a7erE7Y6jq0d6+mC5DiZRsJma5F/hUJMV3INJZiL+TLQwondT3/F3KFMOpnrrFvzSuDNWNMhi2tKa3dkqNTJFcAV9GTpIvb1lZgnW5EXEgcmN4xBtJZxzNdtmsWgaGkqOr7eoXeIjTtd9FS7ANvBVyHVGaKBMXW7vDYT3qKOttdZtZAC5aNP32BYt1SFXwdFq9mGxwZg3bs4xAp5/PGdQRYLZx4m066AROsnA/K8z+HRW4rpshD0z7L7DtmMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by PH7PR11MB7124.namprd11.prod.outlook.com (2603:10b6:510:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 11:30:19 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 11:30:18 +0000
Message-ID: <a56d974c-64c2-450e-8668-f987de64468b@intel.com>
Date: Wed, 20 May 2026 14:30:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] perf tools: Add RISC-V trace PMU record
 capabilities
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
 Chitale" <mayuresh.chitale@oss.qualcomm.com>, Nutty Liu
	<nutty.liu@hotmail.com>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-11-anup.patel@oss.qualcomm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260429125135.1983498-11-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::25) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|PH7PR11MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5098a468-6924-4aeb-0b1d-08deb6632bc0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|4143699003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: /gGiB6oa5zh7W+NfGcDMau0ngOlM/mBHV9odsTLGZ4Sjn1L9lzgEk3RPdVNAdB7XJ5NLOR8dr9GcyEFx0uHR5YyiSMRN8AobRyd3VhtyCqlLWCz0cNDP3g07ac5g2n7CAwHEnGkifjIJ+N9voiGWJ5N5Y4Z6+RpCZ1esk8kgsCrH1FYh7v98sneNjph/rgzA2Mv1AMZt09zvCm12s1kAOUWFuJCAa9vpE/yQZq9FAvHO7ZU08LcCUydfy/lP874wNOnD9AR24tmljwirCg904HsYYhk5b6WZS3i3pXmsE+wQNSw8WiVHZkYS79s95x6eb6llp2puELiLk3b/JmeWO34EYVHk3HIkBlAqvuImgAZKDvLC4RbAabIX23rtQulGZram8TThdgRXKDe7vdz22bmNFks+r+1+7POlvnUtuNPoj8Il8lhYpcCutaIM0/Pw5Pcbb2gv420KsOy16AqMVEnW8QyHyMYA+0Jr4cgb+RxihmZnStFk2Fv2QV0C2e9tyv3SxcMQRIg7ZU6CbTSo+6lCt9Bya0ssoGaHy4wgEecF1OXPEXQu2AWaQI839zGDEywkyUUHJ4jMO6X3aoG7GT7VYfH+ndIZTJF/EiY+TvwgFXfzjUCK65Znl0GDgDb8/Oq36lHy8gMOpKJUM/mCf55m47bdcYgi3EQe8AC/PoeBq2npn9WbhDfZW03q5c7t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnE1OHl4NjlNSUw0NWVGNktaUi9uUXpyWmlJKzRqWFVIYXhxYkFlNDgxQmxL?=
 =?utf-8?B?NCtEaEh6UTJvVzljdWM4NnhrUERsVlM4U3MrYS93cGNLWU8wTTJQN1h1aGNL?=
 =?utf-8?B?ZWZxejdkbm5aVHZKQnhhK3BVaTkvVDdwKytUK012MlJlZlBQdm5qMFRXSllT?=
 =?utf-8?B?bHJaTk9BN3MwKzlyczNxOGNNRGVBYTZFQkFxOVJaMlgzemZ0MDAvVmozWVR3?=
 =?utf-8?B?RWZOWTlJUTRjN3ZDdkkrcHRvenlrQVp0a25IY2ZORWRISHA2Y0thSmVZV25E?=
 =?utf-8?B?ZWZ1NzNpUzkvMUdJd2NHTmUwQ09GaDVLOFpGTGlhRXBRb0toZG5XZStPS28r?=
 =?utf-8?B?Q29nUTdYaHBjV3J0WGZMdElXOElSVzR6eUpzWXJTcHQyT1kyaElHUXQxd2RE?=
 =?utf-8?B?K3owa2FwR3hjb1czMWlicmdNOHFOUENlS0RMcFZqdndrZTNTZGNXVXk4Nlk4?=
 =?utf-8?B?UnJpOWlQUU1aaU11WUg3SittQlRzOE9ZY2tXN3lmUmxaK0hwdHZYejFIQlY1?=
 =?utf-8?B?YXRqcHlkQ1NiWDk4TFZ4TzZEMHFhcjFoTG1pNlRISkdMR3JxQTY5TTVWRmVh?=
 =?utf-8?B?VlpLcmxuYkxuSk53OUh5UHU5Q2JSUkRSVUROUVBmWFRsZjFpbG5UcERlT01R?=
 =?utf-8?B?UUhjMEt6V015Z21TeUtuK3pyMGs4T3dYcEF3Q3lSNFNXendBNWFrRjI2YUNu?=
 =?utf-8?B?RUhVY3BoRTh5Z0tKdkdSY3BCR2hXZzcyS2JaV0g3TGZad1o5Y1hQZVAwdUMv?=
 =?utf-8?B?cUI0NGRKTXpkVUlHOVkyY25wWFpsbUJQQnRNMzByK2gydFc1cnR3Zi81MGxS?=
 =?utf-8?B?aG1qbEY1ZjZIeFRIZ2NNRWFIa0JTRTllZmVxRE0wbDZDS1RkaFB2aXBZZnZX?=
 =?utf-8?B?SFllN3hrZ1FxOW1HY0hNb0RYVHBFcWRLbUJlNVdCcDRoc0dCc1RiOEtuc01Q?=
 =?utf-8?B?aWswcUhRQmcvbTYzUmh3disvZlA0cUd1TkUvdVdCVU9hendqcnQ1QUlyc3gr?=
 =?utf-8?B?WGJ0NTczRmlkaWg1R0NZQXNHZ09tZ0srUDQ1N25heVFBaXdudVlDSHVqMzZY?=
 =?utf-8?B?TDNvMmFUZ0tVZDFndVVDUVpYbDFSWHkwUDQ0cDJac3Y5NHBoWFRTeUJ1bGhl?=
 =?utf-8?B?MjRwRkF6TXdJREw4N2NPWm1HckYrQTB0TkhaMkZHU1oyVFprZWNSazNqUFdH?=
 =?utf-8?B?QmxyMUo2MmVLWnNNU0trdGJ3b1lpQ3hmM0licllUVmdQRER1TUZtRFNlSnMz?=
 =?utf-8?B?UlBaR2R4eFpOZjIrZkw3SnU1aFg0U1lKbDZDbWNzdE00Mk45NEVLRkNObGxx?=
 =?utf-8?B?V1BsV29Ecml6MmdPdko5b1BUNU5sYWJsa21RbE9zOUJCckMwa1BTUUp6OGdN?=
 =?utf-8?B?eFpTd3RabDZ2cmJrNzNSQjVEM3RmRXVYVFU2b0YrNTJHd3ZybGpCTXRlbkNp?=
 =?utf-8?B?VlFrcnNaQzJhQlY3ZEk5VlFZcG5EMXBLcGVBa2REQkFtYlZjRHNydkRTWk54?=
 =?utf-8?B?UFhkT2RMZFR4Qit2NldEN05yTWpaWEtxVnJFbGVuUVl1WWRYd0V4VmR5S0dX?=
 =?utf-8?B?bkZyYmVpYzNjS2N3OHBsZkVwS09PVFJEaXQvNjVLNTBqcDRMc1Y2RlZZV05m?=
 =?utf-8?B?QjNqQkhHeEtEUGZhckFvVGlmd2JpQWhDQUNldVFnQUR4bzRnUkFKLzhJVnRt?=
 =?utf-8?B?VjVDL2ZwZndmWitkMVEzZ0lnUm5QVG9semNlS3o4aXE2Ry9VVDRCN0V5ZHlo?=
 =?utf-8?B?RkM4QjVIN2xVOVdodWlxcW5KNWZweUpiWDhMOFZLSzlDUFM5eHJGY1QwRmRY?=
 =?utf-8?B?cGVRQXVIaDZUY1NZM1BUejk0Y0hBNXdXMzB2NjJDRXRXWU1FYzZrNGIwSWtj?=
 =?utf-8?B?dlJhaVp0c0VwT25WTTF2VjE5RE16c0x5d24xT2VHWFlWcXZUajYrMy9SWVVy?=
 =?utf-8?B?SDBGeVlVNzR3d091cG9WZHlsRVhVYmRHSmhTYTl1d0NQMFBIcDR5WGRIU3VF?=
 =?utf-8?B?NEE3R2I0a1Vlei9sN2ZCWGszZEY1WTVUNVdNSVlhbCsvdVJsS1hRbjBlamQ5?=
 =?utf-8?B?U3NWRmpCQldRelZjOWVqQlN1ZzdXTkdWNEprQlJ2cmhEK2ZVUmJLNzYzZVdN?=
 =?utf-8?B?U2EzSW9QYW9EOTRTUm9QYWJlbGtTd013YTdjSXRjRjBzOXBvOXl3REIwa24x?=
 =?utf-8?B?NnlQWlo5MjJhRlJkQUhOclduUlpZa1pNS1VmQnk4YlBVWE13OW8rMUROcUZP?=
 =?utf-8?B?ZTJkMUtSc2VPdUVKRksvcC9ST0tRRXNZaVdheWk2aUR5Q1RpTFhkOFVTTDQ2?=
 =?utf-8?B?UDg1Q2ltcWpJVVhMa3RudFpTMDBhdzFYOE5vcEFoY3JXZW1XNmNlTTVYRjR6?=
 =?utf-8?Q?CtZJJw1GZboLH8qk=3D?=
X-Exchange-RoutingPolicyChecked: I/sm1udpmTnHkfAu0BrJ/RwMNpJatikFWT48NkExTC2T8FXztEFQtpPUFtWIHAOHZ7TAs52LCsdVKgdByesHMkiLEjkTBjsNiXfF+YeapFDRdbwaG8Ja62YrV1FpeF6YhRmRhZFF7iy+fIVNn6zGeY56/tOzHQBFZvWq58c4K5+npB9Qajlgsevp1yA3Y9+a/rncFpvLUR63LISLFfUeYWqrBozsZlLElc6n6tinhADBtjd9OP3kFzdvPdzFEMlU9e32tHsqCFt1H7VRypjxh9ciMSW6kvCJOs8x1bFtQ0gOgRApuPqehIJgx4bmYVuyT5oXfdcDYjq8pj05x8N+iA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5098a468-6924-4aeb-0b1d-08deb6632bc0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:30:18.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iOzVcLS4vnJP8Em+zwOkK4Y48NOICgRAn78Nm6cgXxPD+TKZkD6XMRv7u55LsmhFQPpihrEQCQfpSjFGy2PyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7124
X-OriginatorOrg: intel.com

On 29/04/2026 15:51, Anup Patel wrote:
> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Introduce the required auxiliary API functions allowing the perf core
> to interact with RISC-V trace perf driver.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

A few minor comments, otherwise:

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  tools/perf/arch/riscv/util/Build      |   1 +
>  tools/perf/arch/riscv/util/auxtrace.c | 219 ++++++++++++++++++++++++++
>  tools/perf/util/auxtrace.c            |   1 +
>  tools/perf/util/auxtrace.h            |   1 +
>  tools/perf/util/rvtrace.h             |  18 +++
>  5 files changed, 240 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>  create mode 100644 tools/perf/util/rvtrace.h
> 
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 2328fb9a30a3..e07d5525ece6 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1 +1,2 @@
>  perf-util-y += header.o
> +perf-util-y += auxtrace.o
> diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
> new file mode 100644
> index 000000000000..5293ece2147d
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/auxtrace.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Risc-V E-Trace support
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>
> +#include <linux/zalloc.h>
> +#include <errno.h>
> +#include <time.h>
> +
> +#include <internal/lib.h>
> +#include "../../../util/auxtrace.h"
> +#include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/evlist.h"
> +#include "../../../util/evsel.h"
> +#include "../../../util/rvtrace.h"
> +#include "../../../util/pmu.h"
> +#include "../../../util/record.h"
> +#include "../../../util/session.h"
> +#include "../../../util/tsc.h"

tsc.h not needed if rdtsc() is dropped

> +
> +#define RVTRACE_PMU_NAME "rvtrace"
> +#define KiB(x) ((x) * 1024)
> +#define MiB(x) ((x) * 1024 * 1024)
> +
> +struct rvtrace_recording {
> +	struct auxtrace_record	itr;
> +	struct perf_pmu *rvtrace_pmu;
> +	struct evlist *evlist;
> +};
> +
> +static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
> +				     struct evlist *evlist __maybe_unused)
> +{
> +	return RVTRACE_AUXTRACE_PRIV_SIZE;
> +}
> +
> +static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_session *session,
> +			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +
> +	if (priv_size != RVTRACE_AUXTRACE_PRIV_SIZE)
> +		return -EINVAL;
> +
> +	if (!session->evlist->core.nr_mmaps)
> +		return -EINVAL;

This check is not needed

> +
> +	auxtrace_info->type = PERF_AUXTRACE_RISCV_TRACE;
> +	auxtrace_info->priv[0] = rvtrace_pmu->type;
> +
> +	return 0;
> +}
> +
> +static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
> +{
> +	bool privileged = perf_event_paranoid_check(-1);
> +
> +	if (!opts->full_auxtrace)
> +		return 0;
> +
> +	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
> +		if (privileged) {
> +			opts->auxtrace_mmap_pages = MiB(16) / page_size;
> +		} else {
> +			opts->auxtrace_mmap_pages = KiB(128) / page_size;
> +			if (opts->mmap_pages == UINT_MAX)
> +				opts->mmap_pages = KiB(256) / page_size;
> +		}
> +	}
> +
> +	/* Validate auxtrace_mmap_pages */
> +	if (opts->auxtrace_mmap_pages) {
> +		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
> +		size_t min_sz = KiB(8);
> +
> +		if (sz < min_sz || !is_power_of_2(sz)) {
> +			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
> +			       min_sz / 1024);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
> +				     struct record_opts *opts)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +	struct evsel *evsel, *rvtrace_evsel = NULL;
> +	struct evsel *tracking_evsel;
> +	int err;
> +
> +	ptr->evlist = evlist;
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (evsel->core.attr.type == rvtrace_pmu->type) {
> +			if (rvtrace_evsel) {
> +				pr_err("There may be only one " RVTRACE_PMU_NAME "x event\n");

Should "x event\n" be just " event\n"

> +				return -EINVAL;
> +			}
> +			evsel->core.attr.freq = 0;
> +			evsel->core.attr.sample_period = 1;
> +			evsel->needs_auxtrace_mmap = true;
> +			rvtrace_evsel = evsel;
> +			opts->full_auxtrace = true;
> +		}
> +	}
> +
> +	err = rvtrace_set_auxtrace_mmap_page(opts);
> +	if (err)
> +		return err;
> +	/*
> +	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
> +	 * must come first.
> +	 */
> +	evlist__to_front(evlist, rvtrace_evsel);
> +	evsel__set_sample_bit(rvtrace_evsel, TIME);
> +
> +	/* Add dummy event to keep tracking */
> +	err = parse_event(evlist, "dummy:u");
> +	if (err)
> +		return err;
> +
> +	tracking_evsel = evlist__last(evlist);
> +	evlist__set_tracking_event(evlist, tracking_evsel);
> +
> +	tracking_evsel->core.attr.freq = 0;
> +	tracking_evsel->core.attr.sample_period = 1;
> +	evsel__set_sample_bit(tracking_evsel, TIME);
> +
> +	return 0;
> +}
> +
> +static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
> +{
> +	return rdtsc();

rdtsc() is 0 (weak fn) for riscv, and does not make sense,
so just return 0.

> +}
> +
> +static void rvtrace_recording_free(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =
> +			container_of(itr, struct rvtrace_recording, itr);

Does not need line wrap

> +
> +	free(ptr);
> +}
> +
> +static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
> +{
> +	struct rvtrace_recording *ptr;
> +
> +	if (!rvtrace_pmu) {
> +		*err = -ENODEV;
> +		return NULL;
> +	}
> +
> +	ptr = zalloc(sizeof(*ptr));
> +	if (!ptr) {
> +		*err = -ENOMEM;
> +		return NULL;
> +	}
> +
> +	ptr->rvtrace_pmu = rvtrace_pmu;
> +	ptr->itr.recording_options = rvtrace_recording_options;
> +	ptr->itr.info_priv_size = rvtrace_info_priv_size;
> +	ptr->itr.info_fill = rvtrace_info_fill;
> +	ptr->itr.free = rvtrace_recording_free;
> +	ptr->itr.reference = rvtrace_reference;
> +	ptr->itr.read_finish = auxtrace_record__read_finish;
> +	ptr->itr.alignment = 0;
> +
> +	*err = 0;
> +	return &ptr->itr;
> +}
> +
> +static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
> +					   int pmu_nr, struct evsel *evsel)
> +{
> +	int i;
> +
> +	if (!pmus)
> +		return NULL;
> +
> +	for (i = 0; i < pmu_nr; i++) {
> +		if (evsel->core.attr.type == pmus[i]->type)
> +			return pmus[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
> +{
> +	struct perf_pmu	*rvtrace_pmu = NULL;
> +	struct perf_pmu *found_pmu = NULL;
> +	struct evsel *evsel;
> +
> +	if (!evlist)
> +		return NULL;
> +
> +	rvtrace_pmu = perf_pmus__find(RVTRACE_PMU_NAME);
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (rvtrace_pmu && !found_pmu)
> +			found_pmu = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
> +	}
> +
> +	if (found_pmu)
> +		return rvtrace_recording_init(err, rvtrace_pmu);
> +
> +	*err = 0;
> +	return NULL;
> +}
> diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
> index a224687ffbc1..944a43d48739 100644
> --- a/tools/perf/util/auxtrace.c
> +++ b/tools/perf/util/auxtrace.c
> @@ -1411,6 +1411,7 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
>  	case PERF_AUXTRACE_VPA_DTL:
>  		err = powerpc_vpadtl_process_auxtrace_info(event, session);
>  		break;
> +	case PERF_AUXTRACE_RISCV_TRACE:
>  	case PERF_AUXTRACE_UNKNOWN:
>  	default:
>  		return -EINVAL;
> diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
> index 6947f3f284c0..4f4714c1b53f 100644
> --- a/tools/perf/util/auxtrace.h
> +++ b/tools/perf/util/auxtrace.h
> @@ -46,6 +46,7 @@ enum auxtrace_type {
>  	PERF_AUXTRACE_S390_CPUMSF,
>  	PERF_AUXTRACE_HISI_PTT,
>  	PERF_AUXTRACE_VPA_DTL,
> +	PERF_AUXTRACE_RISCV_TRACE,
>  };
>  
>  enum itrace_period_type {
> diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
> new file mode 100644
> index 000000000000..24b32947fb4c
> --- /dev/null
> +++ b/tools/perf/util/rvtrace.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + * Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> + */
> +
> +#ifndef INCLUDE__UTIL_PERF_RVTRACE_H__
> +#define INCLUDE__UTIL_PERF_RVTRACE_H__
> +
> +#include "debug.h"
> +#include "auxtrace.h"
> +#include "util/event.h"
> +#include "util/session.h"
> +#include <linux/bits.h>
> +
> +#define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
> +
> +#endif

