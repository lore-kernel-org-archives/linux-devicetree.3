Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BA137E5D1
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047677; cv=none; b=YK7qWsfV5QxpUTf8Sk5NK9jaX3xmMvGbv6L/msMf9j8oKBMfHwXhQ2kiIAC6aNEyVbNnjSumllt/R64nCzKIdx4gHjF2Ct0i1bQotPV23YLdxiBBVMHQNNNY5Kn+/BFscS7Rvw35iyj53PIZHLow3RkAfvGA8jIYv0nwqdzURxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047677; c=relaxed/simple;
	bh=Qtxel18qHJKw163J6jbG6RGG0MrSRAy72mEeBvuRRrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKmdMY54VkwYc9yw9Thdd5Lhqa1sV82QKXJBjl7ASSEAM76JU6wecTL0NjWR/g5Vt6fOGyk2Ggf+UbQSwxd9TtYOYC1vxAVgoGHldmipeDQ/6q8kC0i7TlXnrUG05asgvV/TeeJWz1uqbsWyhptpgpGqPsjYU15X28lEnmo9DFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdfJu0ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9t/BzA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdfJu0ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9t/BzA/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sKX23675273
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=; b=gdfJu0axBKKYEKXW
	MfePgdhEbSULg/4hA1RuqsG2vO+FAcrKMIh+y108Kuu3G1FLH3q9YIrwtvSw/MbA
	CoATIUutxVgPfBA9SEwx0ObCTgroUYt3Exh5BWsoq6fQyVvuFuAz5U/iS073Cg5L
	08srJr+OnllzMZUd8jUxBJACqmmi9jcwvS6GfmnT6lGeueV+RITv3y6f8YFxDV3A
	2+siGJP6uNeouwqAz9teiZ6lLNUZKyi97hfLejkmXJen6InSOxesHw2hwa5oRkuD
	LjOt8fxO/FmXB+MPB6GwfQMn9mQoDMLy6XsRUtxLpV5GbUOnJ7H9leVdPYzkOA/6
	Ov7o8w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5r42r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:27:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso5959943a91.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 20:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047674; x=1790652474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=;
        b=C9t/BzA/S2oQ3NSo8p1vCFSnmaSACr4tGFkeDipiggY7n5hwspGyFWuRv+g9NIX5Lq
         wEQhQxU6T9BI132a49+ogaLXGOJWLq1KKjYFXuu7Dm4Gwk3pakGNj/9JF6A34engQgw4
         oWgI0nHW/nhtUJ5xBh4o/pne0vlDt9gDxj6Z+H7vmHMuyJU+wpALcBC9B0tn8vXg2JHP
         NK3VPiaE02Enzza5BRQeWrKf0QNUxNgNlI2/ZP2iWUMeBJBf1qnHb5ngY3A5yd6Q34XC
         wefc5CmkGzM52KEgd/Rtpv3u3k0ZNaAU2g6qI8LtNm4sywXfHvs4dIxIMxcX0sBc8c3Q
         Y/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047674; x=1790652474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=;
        b=LNgNqDJ0ORRiCs8HRvCwTadEKMNJ+aLcPhdZa3ZkJRPL6IPH3jqH+4YPJqV/vTyZOR
         q/Anr8BoT+0pEPlSrhtSCymTXDsnjIDqiZXLYr2AMB1uGjqpYis2Vel1d3KHLgjI+HrU
         ZVHDBjAKZiHEhyXeJoBX7hq+UwMJewL5Z+1MVL2ZmqjgD3U7dvBd5kGlGmNWjwOpMcvl
         SAA7s9ghQUeYr6Lgph+D0gUMu5M0bEvqIAzMY3YuPxB5TrrxQQ6V7s8qhCbTjeeX5uEV
         54tcfYBfRuzfIhLKbOxs+NW71jJcFPF6OhlxkSy13csebsplvqHRqpThO4dS042jsHHj
         /I6w==
X-Forwarded-Encrypted: i=1; AKwUvBzkQveHZY6/b4GcKhokaofTXYdemvoCjshgGLtbB0fDCp/PocsCKgPRmM06SOqANro7ueAsggNdfikJ@vger.kernel.org
X-Gm-Message-State: AFuF++lkJOui7wCNOXMvFjcgMocy/Y35uZVtoRZRxHF4sfv3jFbkczBW
	X+rMmtYmNsibXcIMyiC5K44atOa00h+WheJ11U7xmraCi4boq26HJvcLQ6CGoZCSaZR9EqJUPdZ
	zhEWajWrxjM/2yQHEl8ueLmytolBlCRH2lCSBrW50QBe2TaBsxPB5wGg3papWonFw
X-Gm-Gg: AYBFou3GP2DvsKXP/G2lb4I12xSlz0xyLUUmdN00HPB7z9VH+mHYYDeHq8fOkr2pftg
	1yLhGzSepTkKLCgPMzCqjk41Zr+WIHDKmW1Jjk6+TuFSGKFpLbAKBC7krKYIQ90sqC93kfDe/Sk
	tvNfjugPazFlvNRVxHwsDbl2RE8ZApQz/bHGLO9gY9bIVwGQLOb4OGUHi/X6CDEBrAFwddsgXpU
	gPgLox7gm0O/My7AFBA6iMdvaCd3OJ4RtiVbePvlvQI/wY5vDldTJ26afM0OiSmOQN1Cr0swG4l
	2Hxuk9RKXIn/w6ELYUWRWpVye9bee21Nrhdo5GnjNW8fpB7rAnl7X0rV9PjfNwNv5bbCVJ5pBJm
	b3aetwvnGAqnZ2ZZZ/Rcxmk8/gV+1ur5p1AIYWW9mwvHYToz7xiHIWYC0mTWiSbYX4Q==
X-Received: by 2002:a17:90a:d4f:b0:39e:6a7f:1dd0 with SMTP id 98e67ed59e1d1-39e6a7f2240mr8215909a91.44.1790047673536;
        Mon, 21 Sep 2026 20:27:53 -0700 (PDT)
X-Received: by 2002:a17:90a:d4f:b0:39e:6a7f:1dd0 with SMTP id 98e67ed59e1d1-39e6a7f2240mr8215897a91.44.1790047672932;
        Mon, 21 Sep 2026 20:27:52 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm54445a91.17.2026.09.21.20.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:27:52 -0700 (PDT)
Message-ID: <6b8bf779-6494-45b7-9b87-dc62aa4a7220@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:27:49 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <20260922031703.54C521F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260922031703.54C521F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3EGO7jhqV_bL1c9YQlkvDhaStXaQU-gY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX01maw5Fv9H1Z
 1Yy4MMq76tW2cyLvhnt0tfvbWic9SdrTBRXb2xanHAHOCBkoeQTlna/3BSkO6yqyMni8RdWQmhF
 f0Ym16RK3L+0kL3c3ovyErsN4H0Umuk=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab1f5ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9PwK0JBZ0THiR8dXEk0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 3EGO7jhqV_bL1c9YQlkvDhaStXaQU-gY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfXwHRauwHtcKMw
 oAx0BY7xoOmq9+Ke1HoHs3bApWnmBp/nGUetyuRGzUAVwF65tzeVA9auziN8fvGu2VQNv9iVi/2
 P5JTV5lbt3fURFRiE7+q0wA4Q3GmY0Z4stAmdoR78BPbBAd2Gnp7vtQ/AYqNueBV7bOSxgkJTPd
 nKFRpA+NQJV31fcwHJN7XhF592kLaeaG0ttI4PHhkIp537uZOzl446H8IpghTqOuCzkiiNLjMxa
 4D05gFWJ8Ai2oim6ZbQyztePhJGZ6N/++pEA1tZyYElhV2hl0GsCxrQbgAcY3aqVR6z1/4fYdmM
 S5Fyz+aJ7OLDmvsGbIMGbMC9gUYJ9llI83iFq2cshut+8wIiStoq8E2GGTIVUO90h2MK4P5ijUL
 zOFQ34Ncpiry2J4NXwd+OVNjdLAw5TNZi5+o3P9LAjDQcy1lErk1ks0Gu+6kBsfFxBZlfpZdAMp
 WjOxQG6OobLR+VVagtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045



On 9/22/2026 11:17 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: shikra: missing arm,coresight-loses-context-with-cpu property
> --
> 
> commit aab8605634d60b3bebc7a736fcec36f07d87f859
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing
> 
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC. The CPU ETMs have a memory-mapped aperture, so switch each
> node to the standard "arm,coresight-etm4x", "arm,primecell" compatible
> with its MMIO reg range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index c1f06f692f664..62bacf749241f 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> [ ... ]
>> @@ -3218,6 +3150,24 @@ cti@9020000 {
>>   			label = "cti_apss_pe0";
>>   		};
>>   
>> +		etm@9040000 {
>> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> 
 > [Severity: Medium]> Will this omission cause ETM tracing to silently 
stop functioning during CPU
> deep idle?
> 
> By switching to MMIO without adding the arm,coresight-loses-context-with-cpu
> property, the coresight driver will skip allocating the save state.
> 
> drivers/hwtracing/coresight/coresight-etm4x-core.c:etm4_add_coresight_dev() {
>      ...
>      else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>          pm_save = coresight_loses_context_with_cpu(dev);
>      ...
> }

Currently, we are not enabling the CPU SAVE/RESTORE in HLOS driver on 
QCOM platforms.

Thanks,
Jie

> 
> Should the arm,coresight-loses-context-with-cpu property be added to these
> new MMIO etm nodes?
> 

