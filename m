Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F946F4BE
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787189; cv=none; b=VAoVx2jtIOp0EgUGjEqm6aFoEH1Pl/uHBRSxpcGUSxTEqJxoyfwgBHNTfe+e0B8C171QNzLn0VTs7D0PcUHFLW4SfgHkEwDPw6UYxTM5i4M9loiaeU3X0eGLaUJjAjM7KdkjDq/Cg1Q7zIZyKvyYMgzN0n+YyZaG5YcwvHQxC7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787189; c=relaxed/simple;
	bh=WgcI26FeoEdWG7ZPdDnmzjzv5QVIEhBxYmSWfdbLxkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYTkY2K4NyD5VtjyRBW3EWY8vH6mBtsV+G3iuG1MldW2D630gjwwVrZd4dv+igtCO+TeSYysJrO8qQdtU4RGDRNFBJhHI2XLbf8SWX2XqoqNU3W5POIEwgYa6J+S9f7bLN13ZyWUZord2bsXPzmdsvKP7xGNg0h9wv/1NWf/ydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8+KyANs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hrzCLyrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8+KyANs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hrzCLyrR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDvG004211
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=; b=P8+KyANst6/u4em3
	KEliQpfBJueTsQAYAW8Xg6mfTWf9Yu8MchBPPBU/S3bXuQfjXDHJib+dro0o4lRs
	f8abG8qk4knhhwiEh8dY4zpFsD1v3epK1vJ3D1KjVn5fADPydXIVUTTBdZUO8vR+
	5KEgXydBz1K4e6/JbWndbIqxTyNgV2YZbdYIBSsIULAsLmNqvro3lGifxIzu3LYF
	1NBD/BtVNbrtxV9e6RxZivp6u9BK73hPr5kWVGlvnfXDge73J2furTlHt3Zr1zg9
	DZUfUz/xBxvTW62Bm3aX7MTpTXH/6gzxOWsGnbYmxY9fRkAY3OZco2yuFou9VVF/
	qMcrNQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg15tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:19:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c123b3f7a2so673328e0c.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787180; x=1789391980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=;
        b=hrzCLyrRGEGRpsKE0BEM8ms7agfg3Xht7/5XFreUnn9nYhCdSuj7bbbYpq/kZpgnXZ
         aXqsvaw8ZTCgEPSj2iTY6wgzQSrVqaEWba2E2MBcjEk+3ywWaBZSuQfUqCxeoW6rnXIe
         HrJtb9I2a8nuxYDLSJ7d3nfaA6rry+iav8x9/4McD6Ep3b/BjYiiJDNzScMCw+8T5JB2
         gNQQNXwdwmTc4BhqCtx3vsG2wlbRbnl0uZVahkWYcKdHEim1MT1NwsRhszQLgAGYoH4x
         BccQp/BEehGs8d3ccDc9B/G3Yl+oDfNFo9Bb0RlAdSe7EClqH5v8MnZaP8188Kfba0jp
         VC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787180; x=1789391980;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YcGSOzVcathbMGrauMsKb7vtcdXz92tDZk77j/tjWA=;
        b=oaOH5wd2g9xus3t0Khcf4hICwUri9UbSsfWi5PzQkLxOEGETs36qp1b+XQOkgHmXZn
         IFTaFZh6GgAMGZ2Uj5Vd0cbZHhau6Y6oKn9a6JVVH9wi2uSjuq5ql+FpFxzwLJPM/cpa
         3FAB1wNiUg95/KtxYxp9ij1uPPzR5dFFnzqPmnvcGloUj/gG9wKbqtzKQCWYQXg801Ax
         jZcID9vQXTHhqQJ1a/yDy4zsVecfHNhxrh35bK+3aVleOAwvBPigfrDPIjLN9MsA0SD8
         EkP4z/flF/hwXuPMLHVJpAG/1Hp1gBeZFtudFtZ3w3hpR4yAyQPnFMWqlnbG8HnYTtHZ
         EU2w==
X-Forwarded-Encrypted: i=1; AKwUvBw2VmcDpp0bRfOTBvfFYyrRUzOwkXOO7h8yjTIuBqPGFwzBacfZ7kufBIbJQ2hbycf8UDXVV25KL9g6@vger.kernel.org
X-Gm-Message-State: AFuF++mttPSXLw4MIVB7nbi6w6gSZ4U+c9+QKg8fOYaS6i/i1s+RLqRL
	BnJmJfmUC5MepfIdFWhMd4bVFfgdH51vTG7BuoSq67PiewPx7tbcyczh9QKbEwZ9d9LgSQgSf64
	5VWnLHUWvklPPseYh9dopwVmw9fuKlloOeQ94fCRKcS7/Aqu/bNttAwKvvCL9923o
X-Gm-Gg: AYBFou00uIKk07Z0jPH3LcHHLl+dMbleyZ33D++M6XzhKAyKjuORZifCSeEiWz+3yoC
	TeML19E+7AQ7e2ONAY9OCIRTC/SmKQ3IrbbFpY5+boP0I9JynVgTpUe4n1b/uZ1P95snJENQekQ
	d8yoPrNg8lsgwYGyd/0n+EXfA4cKuJTqaYPYp8x+gYwVL045iOPJTF9I1eWrtUy3H/fvfYcmq5L
	AJquawC8vIjBppKm+xep5TXEWdDt9c1kOB5sXyenJEYbmuMD6iyPs6SOAEcBSpFalwr8HsYQ8r1
	P3piPFKN+P+AhTizYQMRGC4lNdXMN1f7CDkPAZ6RtZ+Ibiqon8O958xEK3bRbgZl1MVI4NO6rl+
	ppyjjziN8aRo/xPJV/PwXWQA4Okvf
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr7376240137.9.1788787179999;
        Mon, 07 Sep 2026 06:19:39 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a4a91077bmr7376211137.9.1788787179534;
        Mon, 07 Sep 2026 06:19:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm424350915e9.5.2026.09.07.06.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:19:38 -0700 (PDT)
Message-ID: <ab27c2fe-1a0b-459c-90b0-62eaab286cc1@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:19:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-2-b097cf1eac77@oss.qualcomm.com>
 <20260907131419.D9BEF1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907131419.D9BEF1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfX0qJw9fzkeiSg
 ymghEXQVHjpe6lZQcJVbVbVGEoa6qqAZmbOWKJRgEw6+9KQZUNET6mHkWJqaRBtjBnfr2zS576i
 xaUW5nAszbffg+AyO89bgyo5GTDaXlzI1vgsSEbeWPcWfF2KntN80lOXeR4Cs+tEwvP6iDvFjYx
 U3QoDOyhsuZCwjXdTd6GbEqNp6q1v5iEjDKitBeHVSt3P7XEAzlT+SBLbWnG3IceDHl+7m+U8Qk
 zeghzOFeofsteeMh71NhoIy+eX1wCSs5kTfFz8+XImiJsEI0E8eEWAYGiunmZlF5g4O+Ae/60Dz
 gtBWXQCynF9+u9JKKPyXfmgzrviZNyI6TCqB8Nz0FrmxnQtg2fUUMDxup2SyJk4KpGKujpOqBT9
 uJFKh3Tpmwt5HYuoCfZHwGUYvN4Svcy07Do0nPKR96PoVrY9x0bImrRTb064eXM7VVbchOGKNjN
 XXA4dVsr0Qg7iwDbDDA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb9ec cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cqV9-yYPM6X3oF6Ldn8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: iX8Sg8_tyIcpdwwWUAgYOeeRl9b01wrG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfXxECIM0zHWWdw
 o40ya/uNqsU/WwDWofFFvH6L4QWW7F1z5in6EiYA5z9n/i0ppdg6QXgiL6zHo8ZACJn1hJtRVOT
 Q6Bqretw+LxVU1joyDuQU2vQYS/vXd0=
X-Proofpoint-GUID: iX8Sg8_tyIcpdwwWUAgYOeeRl9b01wrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070147

On 07/09/2026 15:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Imprecise abort (kernel panic) in .atomic_post_disable() due to unclocked MMIO access after a failure in .atomic_pre_enable().
> --
> 
> commit 4f4c185244ef7ea6a900e7c373d8e29c18ab92a6
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
>     drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
>     
>     Properly handle power up failures during .atomic_pre_enable() by
>     aborting the .atomic_pre_enable() to avoid accessing registers why
>     blocks did not bring up.  Otherwise this could lead to imprecise aborts
>     when accessing MMIO while entire power domain is off.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> index 157f19bd90b4e..db85400e574e4 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> [ ... ]
>> @@ -287,13 +294,18 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>>  
>>  	msm_hdmi_set_timings(hdmi, &crtc_state->adjusted_mode);
>>  
>> -	mutex_lock(&hdmi->state_mutex);
>> -	if (!hdmi->power_on) {
>> -		msm_hdmi_phy_resource_enable(phy);
>> -		msm_hdmi_power_on(bridge);
>> -		hdmi->power_on = true;
>> +	scoped_guard(mutex, &hdmi->state_mutex) {
>> +		if (!hdmi->power_on) {
>> +			if (msm_hdmi_phy_resource_enable(phy))
>> +				return;
>> +
>> +			if (msm_hdmi_power_on(bridge)) {
>> +				msm_hdmi_phy_resource_disable(phy);
>> +				return;
>> +			}
>> +			hdmi->power_on = true;
>> +		}
>>  	}
> 
> [Severity: High]
> Does this early return cause an imprecise abort during atomic_post_disable()?
> 
> Since atomic_pre_enable() returns void, the DRM core will consider the state

That's a atomic_pre_enable() problem.

> committed even if it returns early here. This leaves hdmi->power_on = false
> and the PHY clocks and PM domain powered off.

Pre-existing design.


Best regards,
Krzysztof
