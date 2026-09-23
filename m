Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DDD2F3C18
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132397; cv=none; b=GX6m6YC6O8nkxKiGkH3qrj0gqyBVJog/tOSHnU2n5zPpW3oZyDzRvkCEcN2pR8g9jti53LA96Jm0wagLkqpgRrnv6lGcOKmUwNr4wtkK7K8jbICCOnHSDF+St/21kvNAa8tg7hCGwrqCbmhmSqLro1JIEdZDy+F5mKNRX34mbLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132397; c=relaxed/simple;
	bh=RMKbGXPUS+GUMUHxSbHbcqX4rPxmEL/XQKVk0tP4MBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxagb/WnD9EuWjJjByy77SsmOkmc4ZB57EHijuglngY+CVTQ7krVidFsjWAGjoR9jLvMTkG2r7mpJWIuozYCFMFtIv7eCvSDVBL7v04TlsgUa1sHSSsrs2gpGQnNu8Vpqi3y3p1DpTRp3v4IcovdaTzZ36lUMsfblJD9zCbHIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq8YoPsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVvKOEXe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq8YoPsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVvKOEXe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDUWS1167811
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=; b=Wq8YoPsKkFmdS5IQ
	27CNPJF4Y55SVu/HVYyhJ+VIYXGt78vPWF7zB24f8c3q0F4/dmqjBrBOeqW4kslh
	10sIcD5NF2b6j8inY0eB+x9WOI15zG8Zx3ESCSqye8V6gXYr7JEOppFdyJMpy6E6
	rRubpQAz0M+zTx6UZ5VkeUDEIuUljlCbUzV/6kupOgE9bHwQ7669E6S2onpLYCiZ
	RY6jkAP6q+jjy98CVye6d6Ylcy/VVZvN0b0TJeHkY93wJvT39bm2EbuJJFKvGJIW
	3jY7lxYS5KUk2AisHm4cizcPrIAZdEaOjPB6HBvpz6HxXNmtczNJYJ6u6K6VUw2M
	kJKP+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw1q1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:59:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso726976a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790132390; x=1790737190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=TVvKOEXe3wUpTfYVTEDUbYXy2SaDIi0xxaygshxBcXZCPAiGOQXYSVPKKrHgNGH8Ya
         KJ3WED/dBI/nKWDhzFeyt14h+RLXPpfdU7P4MDI66HsSVlfld4PU1popM6HMpJBDR6VK
         dX2GRUwRLR5g77bu/9XbeoBKLclv7+2Mei0hcTPaGkppk+M43YJJfGoRasW5QT2TlL2t
         aL+NOR2BsvzS4iMY3BT3JbhHunF1Y2PQitEEqcqu2iF5qDZzFM5uvinls+Nt8duzQYgj
         6Gj/EJvA2Oyel/gfQGh8K2XToEv6Lihh1Nlmkjrl3xhfIzqi1qtttaUFSLhYQi9yrMCy
         fsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132390; x=1790737190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=aT1YQvZkLmYdE3p8ykdR74r91tWIr984o4Box++ug7gzvte1XINxk7m4WQJntphR1a
         sVhMjDnfn75OmzJLr7Llb4Jlyd7G8gG6O/1SisF8pbH5KieudyISXl+DHx6ZkUtp1nVP
         82zcFv2ewfnoqa9iE93BB73Nw0JCWlPd3CguDc2Cy8HjAOSTAk2hgc+QTWslbxbvmVKp
         ciayHX5/Huk2E1pmPpoIBKvDCkhMIc6rNQf7KhM6stJsa8gEQTVuP2e1BdNvt3AQIemI
         dfVBVgaG8LFw0GrLUWw+0sdbcI2IwRWK1tsvVxUR6KtEQEZ48UG88p6bH20kAbhL8H4l
         FBAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9QJBuk27oEwyryzbQzdWSRTQcRREKM8WUI7GOTEsux2ainsGhX9h1hULKRbuPXQvG73Or9FPjtHZI@vger.kernel.org
X-Gm-Message-State: AFuF++k1YVWpkPmRLOZgh8ROAkukN3Q6dZjGw20+M47+qDx/7mclLGuC
	mUQ/3eWQd/lSlcp/eZWpuLiGr5LH3Bp0c07+oPQMf/ar7X6JxqJpygsCtQFh8D1iaMZy2oXW79Y
	SfL73mIlc/D2GEj/tIzn+FPlSfbShu/EGsROxPIG5mevUY52d1nOqpLlRcAoab8Fo
X-Gm-Gg: AYBFou0os9oTEcrJBq0MF8FqsIAljBVdRACriHv3RXxTdh7cpLiGg9Hz56MQGc20IWK
	l7OK/emgIFf7IgdCt+xkj7gXZXYoM5tg+do6VaMCzoEDlUG/47hiX5YDNSLv7CMPTT1qTylvc65
	VZTFZzKA96jZxTxLxNeCnnm432VEeQcE5JVYnLWWYeDbg+5JZWGCJTLHuAuxGUUEX8roIy05Atq
	SuzsjuIA5z20/HFj6M2+rv00ctLQEdGPaFDnyBiLOfR7hpi/QQM5rW1QkpwbJ/nt7az9m/GUrRW
	sZ299epaIUmb5K9leqUigJ0tjKhb/oGwVUZSYnrJrFZlYd2/3iDo3CyGZWe0CHcfYIUUyLqnkN+
	kXn0shBBy/CnVSt0whgdFHfLCwvgiKdwxm23MTqgKBJghLjeLqagETClex+9I14Y=
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203585a91.63.1790132390114;
        Tue, 22 Sep 2026 19:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203540a91.63.1790132389605;
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5de5c8sm3352105ad.60.2026.09.22.19.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Message-ID: <272abb48-8f13-4fe8-a7ab-bfa353f1f8ec@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:59:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfX4lrLNLizZaKg
 54+ucU7Vrx+SeM7pg75dYjCnWQvJi+GEjnSuSnPJR2bwmRHUrpBcTFIfxwhltFFhZuJf//PVbtF
 kVUs1n73O2nZhYoAXM5HZHc59CJO2dhdkjV/ZETnr7+9maHKKSeYm0tCVS549X+Pvl5LZRUrc8z
 20ntGFJPyUQx1KzXt53+zehzK9RRMTdlqWFL0xv15nGT3SfHb4JBxWu3ymsnnO5z92tnbRG8F1e
 STdyN2kQ6nIKB4CRf3O8Iibrtb4gZGPW76arSXFnjYNp9pe+YdzJmfFOWZ16PSLU3T4hwTsL3Mu
 75qd2FRFbY1nQuPt0u7iRSUxPyAPrMRa6pb7vMVU0tzWXlSnKGdbmBWxaFXcEu9KIz5L64YAwj0
 hVs3wJ3jFDCn1LycdfsbKhS9SQXm7/FpdsxXgKgfNsnR4hP3Bw31+UCHz99xSBq6jhfDKLrUmY7
 j1FFzp1rXEV7GcslIPA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab340ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2UIP8dk73OJ_h1EwUPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aQDvtuCT6T6fYZrqxKCLvsjy443k_-Jm
X-Proofpoint-ORIG-GUID: aQDvtuCT6T6fYZrqxKCLvsjy443k_-Jm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfXyRB5GXSYSiLm
 2fjYWXf+da+PuGibbvox0/+mEgB3Wvo3HmOcg+qBuZdsssK9ImzFD9mj1tuficWRCReYyo0poyz
 EhfR3EcRsQarx9upbrjRY4k4cgA4Jjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230011



On 9/14/2026 5:37 PM, Yin Li wrote:
> The original code created a platform device for the cache node itself
> rather than for the MSC, so the MSC was never created. Instead, walk
> the cache's children using for_each_child_of_node_scoped() and create
> the platform device for the MSC child node, skipping cache parents
> that firmware has marked disabled.
> 
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 480e38cfa86d..7ef3ed55b066 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
>    */
>   static void mpam_dt_create_foundling_msc(void)
>   {
> -	struct platform_device *pdev;
> -	struct device_node *cache;
> -
> -	for_each_compatible_node(cache, NULL, "cache") {
> -		struct device_node *cache_device;
> -
> -		if (of_node_check_flag(cache, OF_POPULATED))
> -			continue;
> -
> -		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
> -		if (!cache_device)
> +	for_each_compatible_node_scoped(cache, NULL, "cache") {
> +		if (!of_device_is_available(cache))
>   			continue;

Hi,

As sashiko-bot said：Checking of_device_is_available(cache) here 
introduces a mismatch with mpam_dt_count_msc(), which only checks 
whether the MSC node itself is available, not its parent cache. And in 
practice, cache nodes are rarely if ever marked as disabled in the 
device tree, so this check adds unnecessary inconsistency without a real 
benefit.

I'll remove the cache availability check in the next version to keep the 
two consistent.

Thanks,
Yin


> -		of_node_put(cache_device);
>   
> -		pdev = of_platform_device_create(cache, "cache", NULL);
> -		if (!pdev)
> -			pr_err_once("Failed to create MSC devices under caches\n");
> +		for_each_child_of_node_scoped(cache, child) {
> +			if (!of_match_node(mpam_of_match, child))
> +				continue;
> +			if (!of_device_is_available(child))
> +				continue;
> +			if (of_node_check_flag(child, OF_POPULATED))
> +				continue;
> +			if (!of_platform_device_create(child, NULL, NULL))
> +				pr_err("Failed to create MSC device for %pOF\n", child);
> +		}
>   	}
>   }
>   
> 

-- 
Thx and BRs,
Yin

