Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFD748CD71
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784504; cv=none; b=jX5z9/66RKl9OojkOOjNgUIU5onTNyMzKkDYYU2ikX+6lkjpFYWvtNmf2r93nHIS/tj9A35L1xvNcAfROw/McjeCJsDbW5eU+oCp7lyCo0IzVK8ltgM6bq5ZUWXURWoKe3bDTFS8N4jL+Oq1kWb1Ny/+feu2VZFe5xanbzrrDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784504; c=relaxed/simple;
	bh=WBHrSTQ++EBmgNGA/9tpbMeWFhdN/4x6saXzLgPldSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDHsbbr1pkexZPStZu8juciV1b73MNz8WdOSCtRuZ+Nu/FUi4Lownf9yDOYOZuwGOZ5+csSebBD2PYbpcRsgLfz65Tpa0ont+NA6Lu9RV9Olg1pom0uBfkoB143zEBn0wFNz/qR1d8Eke6Aq5A2yQDkqdkCHrIfvujPLbaOUBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRgkmdzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs5lujRo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRgkmdzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs5lujRo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnKBa004265
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=; b=QRgkmdzrNVdnI69T
	PKrlNWYQxgUMX2mQRQSdOk3967Omd3V8BVHOMkmjs9cTTI80MKneRVXWcXKrq8ye
	mycdtMz3FTmTgrx5fIOmGa+b5je8xkXuI7p4goU02EONZZsAc/H84jrH182RxuTK
	a10JW1sdvgPFW/6f6GCGRtqzepHYf7gTgKAJcE+VRPwtCUV3CsaNlPFOlMvN+/bz
	cw9UY8jgq+YwlJpKBPvsNP1n1P9LHadyCJrKB/wcGrwsLIXyT+2ipcTiYUWZZNgd
	pjVTwhF36h6/ZpOiHAGauosrDSqbt0bIVOyGG+81AY8Yg68Oa7kgpgFdhyZfd6ZM
	FBRXRA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg10kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:35:01 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73883529f72so2994310137.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784501; x=1789389301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=;
        b=bs5lujRoAQPBLHO1M4gwG9LJhNhwlFmmVYIIVKXfH5z9JL+ZkFceihPxd8t3BRawKd
         26vi1AVtfbbh76Hg1u2wT1Fnwp3SNlI8vw3mJ2C8MCKa0WWS/C16Y+6khvhp8XQktO5G
         dvhnUInw6537RyBcfML/JohxIALeZ3gqQEz8c+AoH1LHPvtMXzkbLNZcggFmbjBaaAbs
         NUqzV6SWTyU6qfCBizk7h0cfCB1GtRkX4f+vZdMGN6UWy0m85LmSzBDltO/aAiCsajmE
         0veDJyLnkQBqOOtG48YV5S3OcN3ZFCFPfte+//XF4gznKExn8uwyvzJ3xfbOhv5ZTbpU
         R1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784501; x=1789389301;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=;
        b=kkwURfzXK0J6rC+ZKk1VGH/Ums/pA4sQUsYNpaoVXCzLBAXb4tv+nkGd3FS7hPt814
         tLKkQpdTww5gmY7nED09+9Aaft07W3eylgDDgKVNUnx3Xm5f/Bp83wo/ee0OU38YzUsM
         7YrGT4fRvwq3CR4PKzj6CzCkLl29iK7WGjYTRIw7QFm+UIlPiPWdMf+2feyzF4kVOmt4
         ZS+7S3W2i6z/EKt7+wh1hAdQIahuXziVeVrsb6c5GzXFyqCnF2veni51ZcR/83CZ3bmD
         7GOHFdzu4aMHRrCpFdna08UOsrusqySCoQU2XN52X3cbMZxtaYXyimrwHRAsPkKXJ7TA
         ewFw==
X-Forwarded-Encrypted: i=1; AKwUvByTDANE7vPsAj58s/yEABzBdARq+yd2tD5CW/MYPOEO0+hTJH74GElwNPnRYW7SW362KydnTztS2jJh@vger.kernel.org
X-Gm-Message-State: AFuF++nwKkY0LI0L91MSIRMXeTfCkNlRTGmpKoGRT1SM4+rCzXg2XRej
	dA6A2LlBzzNeZzQPq+Jl6MYZ3GJeMnzaAIQ7MCwSx0nTZMvxASywNl7aJ+nsRLqtz0iGG3dnb+7
	RVSnMde5Yb4shksPVjTfLiAZHYv1WyX5k5z4TgIs/TaoN3ZhtQdb6y+J1NthOU1on
X-Gm-Gg: AYBFou0ddkjL6ZYCrDNKrN1Q2SaS5Yv1W8vx7ISTQibbq6f2E0MHBcQ7e1v9GLDRpdR
	WG9+9Yp8QtYS/eLcAOqDFgDW5xzFHN+3Y1WG3UbNujL+92V5IeB8H/IWcfXtoZ8cOmHbY/RIQIz
	WCw13Rqpn/BQrfWQtmcl1AubV2nyeJRLnMpUeLJLGYzIQ12v2aRvwpJa/iMsDSPFaMX/FQcv6LS
	RgvTkhTm/UoCBZN9U2o1ry5JnPPoRc6Y7fqDEQ9CVEkcxEB2hIkqiZ4IJXvmI2N/LYyCQsbjQ58
	T/phL0zUvoSMiJgFSfznNkRLuTKvTI9wHgqR/9ZJtWN1BAGFNSCqSrVsk0Gr8ZUmkGYMSx9gR2T
	YJBWgnmD37iqtIxcWvpzGnGBvPMvi
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr9992799137.10.1788784501189;
        Mon, 07 Sep 2026 05:35:01 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr9992772137.10.1788784500704;
        Mon, 07 Sep 2026 05:35:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm27784233f8f.31.2026.09.07.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:34:59 -0700 (PDT)
Message-ID: <e1842799-2603-4f7a-b3db-623483bd4bd8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:34:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 07/12] drm/msm/hdmi: Split PHY init from
 power up
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, olteanv@gmail.com, vkoul@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
 <20260828142231.81AD01F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828142231.81AD01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX7cCEdgsaAqK2
 CQSF6fjlTckGUStVwNtPBxkj4tAXOFeV4MK59w/29FWqc2e4PLlccW1caZB/+tZL9waNTPn75fp
 WzpPJlLfvIpeaAWAIppByy7PGy0nvEg2MY7QqvReVKnCWNodrMKtoxsSoOBPJb/IJXQSQjktbuN
 utnP1dCyy7Fn4NJ4VU3VYrriBgGfdNxd4JvX++JKb/Vft4E7i4RuzW5UD8gkQzlmRvlQUbtlUko
 8wXSW9P5kQDvxYrx8+GDO/z+2yMDBOBXK59Ay+DltlHZC/QxyiITzN06sGTxOcSHSglKVfaIKIX
 c6U0UQVjexYS9jA+Qy7G7ILXJDDry7H2gtggfMQOMhwYpKUmNEyTtzr7C+pIjof9gpbdqr+MCkb
 Dbw9a11KVMVf46gX9O1eAhims+xq/AmVQHswfuwKuAV7UEQY7s2zxARJ+XMr9hUCcG1h5/tRtju
 u11ZtNzvwyJ1JSn6Bvw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eaf75 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3il5d3tusZ4osa2_RUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: ANNcqQMfegRBBOSh-Z8sHvL2Fii3fyKX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX/+W5+YMXlH7C
 56x6GWlKRydywnLkFsxBl54minUuOXlgZPuhwt9QxEzXUg7oV0ds+WJ6t1oCOol1LocdkwJOI4n
 Nd8j78cswzVD7Dgb3d9wTjH9EBkoyjs=
X-Proofpoint-GUID: ANNcqQMfegRBBOSh-Z8sHvL2Fii3fyKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070139

On 28/08/2026 16:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] The HDMI pixel clock is disabled before the 20ms vblank delay, breaking the intended shutdown sequence and risking hardware hangs.
> - [Medium] Unconditional clock disable and PHY deinitialization can cause unbalanced clock teardown or CCF warnings.
> 
> Pre-existing issues:
> - [High] Hardware registers are accessed after dropping the runtime PM reference.
> - [High] Missing return value checks for hardware initialization functions, such as `pm_runtime_resume_and_get()` and `msm_hdmi_phy_resource_enable()`.
> --
> 
> commit 821f230494b55344c7aaf6bb73ba3e416ff8cb25
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: drm/msm/hdmi: Split PHY init from power up
> 
> This commit reworks and splits the msm_hdmi_power_on() sequence into
> smaller steps. It separates out runtime PM enablement, introduces a new
> msm_hdmi_phy_init() step, and splits clock preparation and reparenting into
> msm_hdmi_clk_prepare() which runs after PHY initialization.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> index 9d027f96ae243..ead6ba3b8192a 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> @@ -15,12 +15,18 @@
>>  
>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>  {
>> -	struct drm_device *dev = bridge->dev;
>>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
>> -	int ret;
>>  
>>  	pm_runtime_resume_and_get(&hdmi->pdev->dev);
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to ignore the return value of
> pm_runtime_resume_and_get() here?
> 
> If it fails, the power domain is not enabled and the PM usage count is not
> incremented. Proceeding to access hardware registers will cause an SError
> or panic, and the subsequent pm_runtime_put() in the disable path will
> underflow the usage count.

Addressed separately.

> 
>> +}
> 
> [ ... ]
> 
>> @@ -341,6 +359,8 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>  	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
>>  
>>  	msm_hdmi_phy_powerdown(phy);
>> +	msm_hdmi_clk_unprepare(bridge);
>> +	msm_hdmi_phy_deinit(phy);
>>  
>>  	if (hdmi->power_on) {
> 
> [Severity: Medium]
> Can this unconditional clock disable and PHY deinitialization cause
> unbalanced clock teardown or Common Clock Framework warnings?
> 
> If atomic_post_disable() is called to sanitize the hardware during initial
> modeset (where hdmi->power_on is false), msm_hdmi_clk_unprepare() will be
> called without a matching prior enable. This bypasses the state tracking
> guard and triggers a WARN in the CCF.

It's pre-existing approach but I will address it in v2.

> 
> [Severity: High]
> Does this code disable the HDMI pixel clock before the 20ms vblank delay
> inside power_off()?
> 
> Because msm_hdmi_clk_unprepare() is called before power_off(), the
> pipeline is frozen mid-frame before the delay executes. Powering down a
> frozen display controller mid-frame frequently causes system-wide bus hangs
> (AXI bus stalls) on ARM SoCs.

No, this is just pixel clock, not bus clocks.

> 
>>  		power_off(bridge);
> 
> [Severity: High]
> This is a pre-existing issue, but can the code following power_off() access
> hardware registers after the runtime PM reference has been dropped?

Ack


Best regards,
Krzysztof
