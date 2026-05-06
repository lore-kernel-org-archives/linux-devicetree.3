Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4F47F2D9;
	Wed,  6 May 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076585; cv=fail; b=PhTrIYhG7nvYyFzgxaF7XteiIyuA6HNKLdzIfZ+4U4ljQPwh6jNrf7xYXWF6l2pL/rpVABw+Uu+J94/CnC4i4O9gV5+6Mkt6pxbOlYwQuCSmIEtvDYJvOzhxWR6HKKFAqXs/d418KmftuuBq0bARWRzjPjYbdA8esa1I1ObAd7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076585; c=relaxed/simple;
	bh=1oLQ+x2o5t7kHgqYFdIKsbvQ0suRF/SpeHmTb8F+1n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XRXi8ugE8SeA67XcXJimBoDmFGf+cIJjoxlrgHjDGpJYcbAFuXciApuKXk2az80Q/+XCnsl8+NsVfqwA1UtfvIIyiql8Gfiug6ZVzRaKZvxMYUkJJyZVR6adGITBDXisdBE0yXqqAcsmiFRVkzZJQnpcgg/BaNXxDBNwfwaVfNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a64zmPGa; arc=fail smtp.client-ip=52.101.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a64zmPGa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqR+fMUHDkQOn3fcdTNZRyKkJdsZgYqpgVkcP6kYTRpB4dmzHBdHoc3vqzOvZGLx6o5VKTaUPMo5mP74fBPexuA/hUletxaqZgFEHmPvFG4d8+5XWhPVJf+TT46Vjgmt03TXx+7YRYEoCUF0Uxu2vL1qV9rHoedeErWm2zs1GXPFAJcR14mQAxJ3ad9uaR4d0tRB5xhfAUz1RxCF54XRiKMQslXQjb57NrbqeVm1CsEg1dfuibMNvK/InlotQiwdoQL+8Ufzv7Pyb9LBg1Y3sy4SJdnz4O/xFh+aDlW3+/oUNtZfoGjfAWBmRR7UP/bLyDOlgppW9H1DblJZhpdgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaroybcJkG1Hy6QOb58NvnEUwBIR9uay5Zqv1v3Z7tE=;
 b=F+/zmHaHLh2hCT+QuWIJLWs3uISPfDCzkNi7SJNvFSd6JlqEOGNMtJoO9rUZIuEf6bGTqU8iEojTnwfI0MUd6lEBzbmV727ZC6P0IPC5AbBuZF3cxlPoQx/hZH1w3X+Hafso6bO9IakCVElQWk/7aymK7BrtSC+8Kp9ydc3iyjTj3XKOdyGl8qvyant1G/H63bs+SvbZNxIUW29wAhHOJrhye+Y0Ci1cg4h9KQlb6DUDarZ1IJ/WLBn2XosXYIrRb1WxTkt+yup2mHWFS5y8mv83VcwFSXntyBitxXrFKBBquAe/YHFH/2jCREUDUZ2JsPCUBJJlefnh9ZdIQFp72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaroybcJkG1Hy6QOb58NvnEUwBIR9uay5Zqv1v3Z7tE=;
 b=a64zmPGa9Km8Zi58tjk1wj6kC47sOpCP6n4YBAixotlt7o95f7wR5R9kOZL7csCy2tcf/N38P515nfUDVOCf6RhmLEdFebyd5iDT2MTe8CIV1iyue3p6E2jjzBpvjddfYRyXwQRGifBZJm0IjJYhBugFEvBZitl0Iv7avKD2Nik=
Received: from SA0PR11CA0176.namprd11.prod.outlook.com (2603:10b6:806:1bb::31)
 by MW4PR10MB6371.namprd10.prod.outlook.com (2603:10b6:303:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 14:09:40 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:1bb:cafe::70) by SA0PR11CA0176.outlook.office365.com
 (2603:10b6:806:1bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.16 via Frontend Transport; Wed,
 6 May 2026 14:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 14:09:39 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 09:09:38 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 09:09:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 09:09:38 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646E9bP71518266;
	Wed, 6 May 2026 09:09:38 -0500
Message-ID: <f5d3795a-32a3-4d86-8813-e74fc8e41725@ti.com>
Date: Wed, 6 May 2026 09:09:37 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add AM62P silicon revision detection via NVMEM
To: Francesco Dolcini <francesco@dolcini.it>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260209172330.53623-1-jm@ti.com>
 <20260506110920.GA53971@francesco-nb>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260506110920.GA53971@francesco-nb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|MW4PR10MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 444555c7-966d-479f-b823-08deab791ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	I+BXGOpsP+97Beodch3wpDzPVvuEakvm9/kpyzp7CtEs6yCSDG++Rc3ccej7rq5pUXYeOvPMUYLnT0aFghg13kQTC5SAcEqVIrHQsiPSF5QtiAiFX/NQLNvupMrG6QJC0iWQIKNAM5MiCkmA/hga7/YbnwD4S6wfPi2KAsLQQwtkSk3JNOvREFFctzKQVvm5vucTTaBV4nDP5OwYsDtOHaIkmpiAibM02OUsPyvi6vTIWqG7wdBAHF0zHIMIflRpXXL+yxwuFIL+bBfhZt3FocsHbb94edxRFuZ3v5nBUKp9TuE70eNu8oFWNAcDQIFoFseMRJWq9C3ipTIr4h9mnoN3lIQP0d76wxcClA/jUHsX1wA5q4aJLiCEmnuADDk8NsBr+faPWoigOAum9Q6KlF9LLrbffu2XQ5aIXNEyz8YdGGPw1vtnJRNF49i6cSd2qvjfowMZwsrUpB2by4ZbaDAtVAyho19B2M2YnwHB8/5HWT8NQRHA2GdBX1rFFbUoQdNDc+ToCNkN9jtbhBC2YFGrG40Thj/2HWQYxKuyOOzia07KRLd4E/gAtMDDo7my+Ezjg5MHIGx/Q/GMwFJ3QuD7wMl88L5IeJ85sLK0piGzGMwuLYC6lF/Uq+KTPALd3exLHsYMtrmgjmJgNYGVZl4gywKQ+oP+CS7KK9Enahn+BH5Nc0P5Nb85FY8PKN+sfdg4o/YQwVW4Zj1MADFzseSydfX+4N3Bc5S7/nXvyNE=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4ojs9jw+csNf+xbGStoPLSxCqNHMIDjYvSTDlrRJO5E5PEN1FWi6zgaCFLVwZ6Rdg8Dr7YZR4AZ/JPwk7QMZtXkpg+vauFaTDNx3iCyaLIeYRo9CjhQn9fPw+SE2/FjUU3SZX73bXn3vtx9Ejemx8n46/gET/dyxqUgx2m2uD890XcNTyGOKx8x06c0qUUy/0r06cxzyVsFRwmIqQl4sf9HxbTYn38J/n54qlJZw/R0RvGYhqtAslLkMFNrCAjnk7H4edUDa35QT0SbbC4ZGPqhpAxUCrU9xPp5pdRPcSQ+rk5/Qd/ufB+vKlsKXokT+iwwrO1O+VETATGVIHFOn4N31Tk6k5yH4+zj+j/12xcLY85nrFpMfB/xgTUDlZHkIM/U6tulK/33BRHUmcS90RSr4eKBAEhqJK4msm9qcqaccD8mf9HH6uu2rLE3GCNsn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:09:39.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444555c7-966d-479f-b823-08deab791ce9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6371

On 5/6/26 6:09 AM, Francesco Dolcini wrote:
> Hello Judith,
> 
> On Mon, Feb 09, 2026 at 11:23:28AM -0600, Judith Mendez wrote:
> 
> ...
> 
>> - NVMEM support is fully optional - the driver continues to work without
>>    it and falls back to SR1.0 for AM62P devices
> 
> Is this correct? Just wanted to be sure, given the issue we had with TI
> 6.18 kernel on this very specific topic.
> 

If you do not define an NVMEM node in DT then this driver falls back to
SR1.0 and continues working. If you do define an NVMEN node but do not
enable the NVMEM driver for that node then you will go into a probe
defer loop as you found. This is a general issue not specific to this
driver that could perhaps be solved by setting limits on probe reattempts,
but that is outside the scope of this series.

Andrew

> Francesco
> 

