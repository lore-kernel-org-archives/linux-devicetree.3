Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0588438462
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212226; cv=none; b=WcQAnw47XhL8bT+82TYQ7mWgq0NctK8Un2NuNIfWTmIsNIrBzPFok2KBepmHtII72Jaq9DT2XYnxLVlh+qXS/2v03AHmyJLk6ANOpSaGwB/qP8TwuBRb+H25aq/sZS5ii484hYWoa1ER/mRZwxIOXbwRFYWigHm6KyeKzCWG1aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212226; c=relaxed/simple;
	bh=1VYCKCrAyEhpsBy/ENyJCD4sKWa/IVk24XytgZK6qb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwVHxAobk/g/Cc3EycbMx6aHiJWQmE/fUJxHKV67jC95+iMlLvNlSdErXGdxGOXGi67EcMiTbbK5p2XyXdzLkrb43SV/CIFgDZHWQz0C4kAbI9W7dr/9sw+n9sLazfJquDtvCIEFODaCSib3cwuewcRZgfjbh+WhXNROIMxIssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIy9tnhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjQWeamq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIy9tnhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjQWeamq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKKOp2571381
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=; b=iIy9tnhj6Mslhz5E
	RRafDU9EzghUQladYzSkiSHTrnLC7MWI1wCGoIje7bt0zii6JknWtCCWnEi8McE5
	pGSZaVPI1Xhx6HJBNSc8XfB2LlVEGaAAlYvIjfICyrnav5kGu2FXfnBpPS5l/gMf
	vn1azsBn8y2W5dzaModRYpFfJW+kEs9BTO9LNB/SVV8OEo3KbtKk3RFmCkvDop9Y
	8IVd1g5phvIL7dOWEtfo9XJ5J6l7CFEpQPe0AFJjRThozer2JujBZuUmfdxThF/R
	VUHtFih1ZRFnI+B0J0AuiUqkBmRQG0pYS8DJ1xnUZl0CpdFPC9zBwIvMBT9JnefX
	Q55RFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064wgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:30:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso146736085ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212223; x=1784817023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=;
        b=hjQWeamqm1IsZw3DQ8AEZCGuHZiqdXklsmiKP1wRI/tRY1mngkoC564Y6kQt87rA6W
         a6vAKaDmUwo6O2+UAsdgm1JTf992d74n24Cz2sctq0jcKC/e1DV5UUU/u/RE5MYYMIvj
         L/Z+4Zix+yoULOp4UjQ13pP3yo7tFW2n9p4FzeC+XeAwlPfe/zJX8+b++qmXtHTa1o0K
         9spTn8krrGAjg9AoYkl85rBC+xDQxOINqf85AKa6Oi/cDxQd/GLGk1C1a5zxWukB67+M
         xikJFa2QS1hIDRy5vMHu6q/ugZGB/5kLNAQ6KH0+/ZCgEZBrlOUFskk0QB/P9TirmYs1
         UWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212223; x=1784817023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgdrdr4wElfalXkygqDmbCVsaSzd4hqWwtTE1Q1Yb9A=;
        b=WcmdJhXaN7zdogTTCyjB/3UTW2fa5KKkBFP8JU41x4H/doN9v9Pf4YUnFMaV2apf0r
         2lU7blaMHjHjXA26kA4MijAzAxaarU89kYRS/ceIYqGnD89lJlEm2RbCsm3WD1yLr/wZ
         pNBNOvUKJQ8FtFcD13KmcgnfapL8ci67CqerOa2t9Ud5+h0U2TxT2zkt9sua7df7paI+
         IUwAbwE+IBLsBJ8BkbMytO1JpmjIf04JgkQlWn89rcudQzsyLWDy1ZpPda1BRgQoRbgL
         Xp55Cr2S0DlVLnkpGcvcNgwDSUoUz3/4mXGa7QHLtl0P+I9LqcNhDuBTNkTtzpoRVbts
         ejTA==
X-Forwarded-Encrypted: i=1; AHgh+RovvnbMJHjZfgW/VtPrj9ftAL6qDJC9Djv4h5LsuL4REOkU/+A/HH6C45e/6LUbkgICIlvYDqiV5A2J@vger.kernel.org
X-Gm-Message-State: AOJu0YySSs7uaV8dChkld+MucrRvLbQiXKhV9F4cVzpCwrhacVDgwWlj
	ANslweN8zlQqp2y3wdaDDnP9PTH70tIAQZaWc+AbwGOly/h+rvtPgbQNSSX6u9BnA/B0S/wde0T
	5rxC1bpGPcanR3PZlhY0uasHybSmLQPXIsjHK6xACDkly2e2PeTztq3c/w5sMzMuq
X-Gm-Gg: AfdE7cmcg7IwC7TOaG6HZMvZxyK2gSTvIZE448s9HkTjJqNje2jwQUdgmO2xVF0rqBI
	pyXUb/Xn/6makIs0aaU9XAq9p4+ylvXrVubtJEVo/goSwtRbxw+hXojbpN2KXhe0rAecqD8BtmH
	x167Wa9I9O2XWUG26/qoa2d2F9UHroE6vHQAVQPKRQhFDqL2RIoXnZS6FcQXHAz5I3rED0UzERo
	uAjVneM3BCnNgf/meHylEYMd7D8vUcFRKov7F0djYj2II3nQXETbWnDaJU8DXc20IUml0c0YBHe
	QXfLmcsSCEouwKjH19gaACyRAYiDvM2lB5N1gvUmDJvktjRusoWhrQyMNq1Bi21zBZHqpdgKFvG
	T/6OUcyp+XkCyDqEAIYvEFY1LRj5OjWbH
X-Received: by 2002:a17:903:f8c:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cef14b7f75mr102033095ad.41.1784212222688;
        Thu, 16 Jul 2026 07:30:22 -0700 (PDT)
X-Received: by 2002:a17:903:f8c:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cef14b7f75mr102032485ad.41.1784212222185;
        Thu, 16 Jul 2026 07:30:22 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e393bsm21100175ad.7.2026.07.16.07.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:30:21 -0700 (PDT)
Message-ID: <ab694e97-6e59-439c-967c-c2ec90019f96@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:00:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] arm64: dts: qcom: monaco-evk: Add SDHCI support
 for eMMC via overlay
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-4-monish.chunara@oss.qualcomm.com>
 <20260701082916.A892A1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701082916.A892A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX3ITcok+Mf5UM
 boKy/1W9kr6akggNg7YovrlvjhC8Jlrvzx/TitQeHRArmKGvRrN1mo01ZPx0bmh/eyikudgJd25
 GtXyTP1agujEApf88wATKae4ueCLWIs=
X-Proofpoint-GUID: J_Tx6OH9i7vfM6Pm3_gZw0zt3kckVhpM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX0O4jCVboT7t9
 58MVsj7s6jRXg4FVxu799IsZ+4PXM2ttIhHeJP5PrCjuGKCg84k5u4itUijMNVKUe1/M3+zIQF+
 wOTp8r9ht3CdtfE1XwlDZbYJnXctA8mnwwJh9Ffin4dzKgRboSyIfdNSARcAH5WESiMawbX7tk+
 baBtPCDsw8CX0MR7NWkGrvLGDGcX9bG51p4tqSBFnNllYfsw3OHT9NLoQIruwfhrHV0G0Ljwoyb
 Ny+WohFBdxv9b70SLFOSqvmef5zdGBGt97hlhwu4ymT0rDZ40oyZpMXzy7EJ7IH/SSt+pqzLE9h
 pLi59aUh/nl5YzfGEG3cX09jGLWHOpqqOzjSYKE4Kcixuoq4nY1nmN56icsrQtlLdurohQq1jZ5
 fkDS8CDRJVPfPMN8UGek2GVJCx9GJi9aHIwQxFvExBdHD6NLk/Yzq4UN0DfsQ5LI6bOj3wK88mR
 6Kn56Sw23/c/qmvZ8Ng==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58eaff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xqg8VznY_0t-hhDNkJoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: J_Tx6OH9i7vfM6Pm3_gZw0zt3kckVhpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160149



On 7/1/2026 1:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Duplicate regulator node creation and label shadowing in overlay.
> - [Low] Redundant device tree overlay duplicating base configuration.
> 
> Pre-existing issues:
> - [High] Conflicting device tree properties silently disable SD card functionality.
> --
> 
> commit c17f3092c8fef709ae2384b75b1582cdb37b5837
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay
>     
> Enable the SDHCI controller for eMMC functionality on the Monaco EVK
> using a device tree overlay.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 0b60626369190..a341d6dab6150 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -71,6 +71,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
>>  monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
> 
> [Severity: High]
> This is a pre-existing issue, but does applying the monaco-evk-sd-card.dtso
> overlay break SD card functionality by conflicting with the base device tree?
> 
> The base device tree monaco-evk.dts defaults to eMMC and hardcodes no-sd and
> non-removable for sdhc_1.
> 
> The monaco-evk-sd-card.dtso overlay adds no-mmc and cd-gpios, but doesn't
> explicitly delete the base boolean properties using /delete-property/.
> 
> Because overlays don't overwrite or delete boolean properties without that
> directive, the merged node would retain both no-sd and no-mmc, which could
> completely disable media scanning.

Update in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

> 
>>  dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>>  
>> +monaco-evk-emmc-dtbs := monaco-evk.dtb monaco-evk-emmc.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-emmc.dtb
>> +
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
>> new file mode 100644
>> index 0000000000000..cb2566ac6923c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
>> @@ -0,0 +1,37 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/ {
>> +        vreg_s2s: regulator-vreg-s2s {
> 
> [Severity: Medium]
> Does this create a duplicate phantom node instead of merging with the intended
> base regulator?
> 
> The base device tree monaco-evk.dts defines a fixed regulator node named
> vreg-s2s. This overlay defines a new fixed regulator node named
> regulator-vreg-s2s and assigns it the same label vreg_s2s.
> 
> Because the node names differ, the dtc overlay compiler won't merge them.
> This could create a second phantom node at the root (/regulator-vreg-s2s).
> 
> Will local phandle references to <&vreg_s2s> in this overlay resolve to the
> new phantom node instead of generating a fixup to the correct base board
> regulator resource?

Updated in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

> 
>> +                compatible = "regulator-fixed";
>> +                regulator-name = "regulator-s2s";
>> +
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-max-microvolt = <1800000>;
>> +        };
>> +};
>> +
>> +&sdhc_1 {
> 
> [Severity: Low]
> Does this overlay duplicate properties that are already fully configured in
> the base device tree?
> 
> The base board DT monaco-evk.dts already sets up sdhc_1 for eMMC with
> properties such as no-sd, no-sdio, non-removable, vmmc-supply, and
> vqmmc-supply.
> 
> Since this overlay redefines all of these exact properties, does it offer new
> functionality beyond supports-cqe, or should the base board DT instead leave
> the controller unconfigured for media types so overlays can correctly apply
> the specific parameters?
> 

Yes, updated base board DT to be storage-agnostic in v4: 
https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

>> +	vmmc-supply = <&vreg_l8a>;
>> +	vqmmc-supply = <&vreg_s2s>;
>> +
>> +	supports-cqe;
>> +
>> +	pinctrl-0 = <&sdc1_state_on>;
>> +	pinctrl-1 = <&sdc1_state_off>;
>> +
>> +	pinctrl-names = "default", "sleep";
>> +
>> +	non-removable;
>> +
>> +	bus-width = <8>;
>> +	no-sd;
>> +	no-sdio;
>> +
>> +	status = "okay";
>> +};
> 

Regards,
Monish
