Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738006;
	b=cqSS3W3EWG4QrV+vDE80TVR6HckWNKhVphEJKHpfsUaL+MRVlEAXhWg33s5oiRZ0y9BG
	 YuUawSOJvdv76fyADNZPCnd2uj5Elr/U4JV7PgkLmDO7/OZb07aeoXEXJXHDAEqD4bNwR
	 i7JkUOxk2bIIPh424F0lKlsoU897QsGy5aR6CIMHdjD5SFILJxPsCDF4VAWOFDY1wHmky
	 bVGB8apymtQAliz1JHaCj1wD+PnR0r7j4NEbNwWNffX4JMhbKZs3l6gtxe7tKv4eve7Xx
	 ucXStAxVg3gmAkU7i9qtu6/G4lKfSj36z07K4XbjuwxsmfELDByCOpVGIEK/XDFKf8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vv3gb/44y0nsmGIRSeUFCDOoITa51Yhi1b3o3dnHEA4=;
	b=DDFJMp1g5CzL01HQh59CWMBBqxeQUCmH0vj7ogN3imDoW/a7svW38nX2PQ1kdY0ggFLO
	 qIQZcFj9dd0QXcAeVlZP0f5HDv2EafJhWEx0oQ91SgDoWBeAaWkg6JFHBTUOdu0p26uwd
	 WBfM4z7JMYPnCtbxOfLzy9E1/JsFmOX/rfI5TDoSTnA4koC2xEmwXflJhgjl5yPpQwZgp
	 vacp9bRddzmmOqcTX+sUz8vg0vk1XMUdNxYKcUvkU3N95GUhKOSNhZzfr3xhlIx2YdUzW
	 SMbcHkBgpvhtn0NpeBGLcpb4bQhqNVTe7hmLdh4hvwJivLDImTNF0QDyTkYqFsbE7Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XwnC0gI/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVlhtxRt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3DC606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XwnC0gI/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVlhtxRt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w6c92205532
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vv3gb/44y0nsmGIRSeUFCDOoITa51Yhi1b3o3dnHEA4=; b=XwnC0gI/DKfYBDa4
	ntRp7sDO0bSKc74Ul7SrpLWTaF3YofZZRBla8mugNpU7p8u7BJ3KrEXP7TH7C7Vo
	b6l16N2tyFgNNnLva4h9jx3a7ryIgGK8s3+k/I4jNFBEWINtQUMN+hQIwC629YSc
	QITD9azm91vgqxvfLJBrizPGi361m1DA+hxeh6mWlLd+nlo9CGuycJmqMhPdLPIL
	JZCrOax13jaisSrjvq0qtO/nqGudCkImGwPis5LCor5Jq5Otz3t7rwkpfrqDTPI5
	eWTCaS+ysj3m/DzQMPBv3RxpfyU/VKpyuZC16kaVQLuGsTXCdOgxsCag9U8BfbOQ
	Vf1tFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk22rn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:20:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so58252885a.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794738003; x=1795342803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vv3gb/44y0nsmGIRSeUFCDOoITa51Yhi1b3o3dnHEA4=;
        b=XVlhtxRtfHmmZ6Ym00+ecJa69clnwI2xEQoZVo1fZZNtm2kVhrX6HOJNW1XMyO3I+6
         1aH4EwnzLS5IGOLRRcI1EAQh1y7VaQ+m6iBwA/m+mPNDSHtiCj6ch64QsYpJ8XD/VnOV
         crKCzZoshUEWG5aIZZZvz3RpNRGLNJqyytNZYnASMvMQhOGhxSseU8T73f1tKUQqNE8O
         IZusc1vjUkQl3xZAHWMQ9Z9VR13+BAujzhF00ZOQit+7hPNiOsW1erJfR1Ijhw6hF/R4
         ft9tWXsfIJ7QxRu+sogFQUQc8SUZHvGfsdpqKfpsZQv9IV9kDNj169nsiYYqYDueyvr5
         ++fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794738003; x=1795342803;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vv3gb/44y0nsmGIRSeUFCDOoITa51Yhi1b3o3dnHEA4=;
        b=txCPMgIamdvpXDFRmWepFSUm3MOGQ3MvrDe+s8gIbwQg+hPwdwZ12N77eHQIzZh0KZ
         bdxSVDorIGfXAueJCOQhrVys77e7DiszbjdHtxS9n6P4JyN7cl8oRa48MDf23bpuieX/
         LDtBro5Iry8NDmbG08wgt3vz4p6IkrdbAEkutrFlx1gOOCvktXhwWMxPoLVW/q2K5cYC
         bP1rg2iJFemoHp7PJ7SBkxK4KqIi3cNjmx6OVSmOHgjQtn/PpzrcSlJl4GUGJF43Gvi0
         ktzOXC8VjK4tRDSYdMhVOTXiQm49i4ABWninlTYOlwnovvXXQiMN8JNTgiafw/XGopmw
         FOrw==
X-Forwarded-Encrypted: i=1; AL+hErF3zjMSjKyJO2ENahomcxETK10lUsVURVNv/ikuDYaxu8/Ymr9hrMaJX6pgsB4jfO3fgKfJon9Yr3WK@vger.kernel.org
X-Gm-Message-State: APuU4Z81/8tR8OTjM7zPlXQY1QOABH/pF4695Bw3sJsaw/CV5DUDIoaS
	orRALTJfJi5/rgPa2kt/7tuS0qJqLZ7qUunhQRSlXUzGk4pXoUrfnrD1KMBlpqcrHORlmpbZOX4
	tlFdFsHwRUOJar+QX8fOAOlm4BEmEx+U7XZO/xkNOpfj5FhIJ5Tb98U54cKrbQHyL
X-Gm-Gg: AYBFou2Q54ryrKDpiw1zGExfU9QEPmsVmR95vHeG9hiXPS4+lozaWt5aNxmHaw/xQvf
	j9UWy5zRMxh2JHch48Zw48yotT+h8OL0yOA2SgRdZEhWQmC0Bf9Cp2HN/wZ9NEOEmhg4QZK9vxN
	cdXSOtTUhULk1YwnPouJpYnsedcTEOch7krCIHLHuqN5XofgS3jgq59/UWC4G2xGdazPr4OEV3V
	uNeLPNch22Igy4/oJe32fvS9zt5P9Sm0v+x+Hdh4GIGDXSTgvHJSvtLZg1fQjCn4AZMXnbI4IMt
	1K3m4DWTPKk+gbYT/38s23TKaISNES8l0y0eW4K2HxvLeD+Ep/k8zlWz3jN0KVojAJdvJCBFRfp
	77nXBZc1tYo43VoR/uMuINytCfplpWh8OUZsUkUherz61pwlZfYzHb8Gh9QxM5bM41qYd4R1CZP
	VprYv57/rZN+/kHMdSuA==
X-Received: by 2002:a05:620a:3950:b0:93f:3e45:a419 with SMTP id af79cd13be357-9494bc17f96mr1129787085a.38.1794738003349;
        Sun, 15 Nov 2026 02:20:03 -0800 (PST)
X-Received: by 2002:a05:620a:3950:b0:93f:3e45:a419 with SMTP id af79cd13be357-9494bc17f96mr1129784385a.38.1794738002823;
        Sun, 15 Nov 2026 02:20:02 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c235f206sm3203547a12.13.2026.11.15.02.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:20:01 -0800 (PST)
Message-ID: <efa3cc40-15ff-44e2-b783-333306bc4ee4@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:19:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: lpass macro / soundwire: asynchronous
 probe with clock retry
To: Daniel Carter <yass27106@gmail.com>, krzk@kernel.org, andersson@kernel.org,
        broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
        perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
 <4aaa766cace2455ab6c75ab801df357f@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Gs-dq2E8AYKn_1OcKIHZWaPsw0P1GVLL
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af98754 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=vgGamaXp3XozwZ2yb4MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfXw5+7RnbdWe3h
 f+EKsArOfZ7hPXchclcCq33jMhVE0QCZ1oRFWvyerL8CXqYSIbJY9rWlWrscWUjTwrgRBiqV4tv
 V0VCK18/QpK0CpYG7VJPYgWnF7L6lqM+t8OoCaypfDb6ZHXsfFASOMJEi3WmJlWMnnJQoD9s0Z3
 ++92b+fdkShCWaudfqSaabhLkPZtr7RUoXv5YMLXSK4O4C7cdoVK1trTgAdTItyKDyHzHjEQRI/
 sAzmU0CIelTk9cl29lBs61pZ3qk7pNLg8eojeTykWeRcWlUC6KkLl/KRerR3o6GWVgSCTnZxLcl
 6YL94kI/zR0CYknp9HtkYRbPXA0apJdcVMOR9Yx+W0Rojnie4PYO2N3MK47uPmCxgK8prodp9nF
 J9dCkCW37PTZRHE/sJbYDNqDFMANjr7zcmkeVm5Waq/CJxNx4X1lkynJyoaCpPvJtL5IQFshHKi
 UIHVQfaq/5b9a0omtXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX07esb1SdJWf6
 Ude1nV5nPHFClilL+4aSQBS2g5O8JANRy7mKhLxGtP71m6dVTP36L1arRI7GYB0HjHrjmsV6S2H
 9MWOF5pFoQUS/k7nsreVd8MGfLBrczw=
X-Proofpoint-GUID: Gs-dq2E8AYKn_1OcKIHZWaPsw0P1GVLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150040

On 11/13/26 9:02 PM, Daniel Carter wrote:
> The LPASS WSA/RX/TX/VA macro and Qualcomm SoundWire drivers request
> clocks whose providers (va-macro fsgen, the q6prm clock controller
> under the ADSP GPR service) can register after the consumers probe.

Why?
> Clock-provider registration does not trigger deferred-probe retries,
> so consumers stay deferred indefinitely.
Looks like we are fixing some generic issue in these patches if there is
one.

Can you please explain the problem that you are hitting, are you seeing
that the soundwire controller never reprobes if its defer probed?

> 
> Add a bounded retry (60 x 500 ms) around the clock acquisition in
This is a hack, and am sure it will break in no time.

Please fix the probe order bug rather than comming up with this hack.

> these drivers, share the retry helpers through lpass-macro-common.h,
> and mark the drivers PROBE_PREFER_ASYNCHRONOUS so a retrying consumer
> does not block the probe of the clock supplier it is waiting for.
> 
> Signed-off-by: Daniel Carter <yass27106@gmail.com>
> ---
>  drivers/soundwire/qcom.c              | 24 +++++++++++++++-
>  sound/soc/codecs/lpass-macro-common.h | 40 +++++++++++++++++++++++++++
>  sound/soc/codecs/lpass-rx-macro.c     | 11 ++++----
>  sound/soc/codecs/lpass-tx-macro.c     | 11 ++++----
>  sound/soc/codecs/lpass-va-macro.c     |  9 +++---
>  sound/soc/codecs/lpass-wsa-macro.c    | 11 ++++----
>  6 files changed, 86 insertions(+), 20 deletions(-)

Multiple changes and with multiple subsystems in single patch is not a
good way to send patches, Please consider splitting the patches starting
with subsystem level and patch per problem.


--srini
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10ef..473449dbdfa 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -21,6 +21,27 @@
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "bus.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider
> + * registration does not trigger deferred-probe retries, so a consumer
> + * that loses the probe-order race stays deferred forever. Wait up to
> + * 30 s for providers that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i = 0; i < 60; i++) {
> +		c = clk_get_retry(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) != -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}
>  
>  #define SWRM_COMP_SW_RESET					0x008
>  #define SWRM_COMP_STATUS					0x014
> @@ -1669,7 +1690,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	ctrl->hclk = devm_clk_get(dev, "iface");
> +	ctrl->hclk = clk_get_retry(dev, "iface");
>  	if (IS_ERR(ctrl->hclk)) {
>  		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
>  		goto err_init;
> @@ -1921,6 +1942,7 @@ static struct platform_driver qcom_swrm_driver = {
>  	.remove = qcom_swrm_remove,
>  	.driver = {
>  		.name	= "qcom-soundwire",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = qcom_swrm_of_match,
>  		.pm = &swrm_dev_pm_ops,
>  	}
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 10ad682019f..83bc7075a28 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -6,6 +6,9 @@
>  #ifndef __LPASS_MACRO_COMMON_H__
>  #define __LPASS_MACRO_COMMON_H__
>  
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/clk.h>
>  /* NPL clock is expected */
>  #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
>  /* The soundwire block should be internally reset at probe */
> @@ -74,4 +77,41 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>  	return "NA";
>  }
>  
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider
> + * registration does not trigger deferred-probe retries, so a consumer
> + * that loses the probe-order race stays deferred forever. Wait up to
> + * 30 s for providers that are registered milliseconds later.
> + */
> +static inline struct clk *
> +lpass_macro_clk_get_retry(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i = 0; i < 60; i++) {
> +		c = devm_clk_get(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) != -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}
> +
> +static inline struct clk *
> +lpass_macro_clk_get_retry_optional(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i = 0; i < 60; i++) {
> +		c = devm_clk_get_optional(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) != -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}
> +
>  #endif /* __LPASS_MACRO_COMMON_H__ */
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c41eb8de616..658bf947aac 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3780,25 +3780,25 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	if (!rx)
>  		return -ENOMEM;
>  
> -	rx->macro = devm_clk_get_optional(dev, "macro");
> +	rx->macro = lpass_macro_clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(rx->macro))
>  		return dev_err_probe(dev, PTR_ERR(rx->macro), "unable to get macro clock\n");
>  
> -	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	rx->dcodec = lpass_macro_clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(rx->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(rx->dcodec), "unable to get dcodec clock\n");
>  
> -	rx->mclk = devm_clk_get(dev, "mclk");
> +	rx->mclk = lpass_macro_clk_get_retry(dev, "mclk");
>  	if (IS_ERR(rx->mclk))
>  		return dev_err_probe(dev, PTR_ERR(rx->mclk), "unable to get mclk clock\n");
>  
>  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		rx->npl = devm_clk_get(dev, "npl");
> +		rx->npl = lpass_macro_clk_get_retry(dev, "npl");
>  		if (IS_ERR(rx->npl))
>  			return dev_err_probe(dev, PTR_ERR(rx->npl), "unable to get npl clock\n");
>  	}
>  
> -	rx->fsgen = devm_clk_get(dev, "fsgen");
> +	rx->fsgen = lpass_macro_clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(rx->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(rx->fsgen), "unable to get fsgen clock\n");
>  
> @@ -4005,6 +4005,7 @@ static const struct dev_pm_ops rx_macro_pm_ops = {
>  static struct platform_driver rx_macro_driver = {
>  	.driver = {
>  		.name = "rx_macro",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = rx_macro_dt_match,
>  		.suppress_bind_attrs = true,
>  		.pm = pm_ptr(&rx_macro_pm_ops),
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 6deaaabe43a..329e1304b38 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2258,25 +2258,25 @@ static int tx_macro_probe(struct platform_device *pdev)
>  
>  	tx->data = device_get_match_data(dev);
>  
> -	tx->macro = devm_clk_get_optional(dev, "macro");
> +	tx->macro = lpass_macro_clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(tx->macro))
>  		return dev_err_probe(dev, PTR_ERR(tx->macro), "unable to get macro clock\n");
>  
> -	tx->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	tx->dcodec = lpass_macro_clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(tx->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(tx->dcodec), "unable to get dcodec clock\n");
>  
> -	tx->mclk = devm_clk_get(dev, "mclk");
> +	tx->mclk = lpass_macro_clk_get_retry(dev, "mclk");
>  	if (IS_ERR(tx->mclk))
>  		return dev_err_probe(dev, PTR_ERR(tx->mclk), "unable to get mclk clock\n");
>  
>  	if (tx->data->flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		tx->npl = devm_clk_get(dev, "npl");
> +		tx->npl = lpass_macro_clk_get_retry(dev, "npl");
>  		if (IS_ERR(tx->npl))
>  			return dev_err_probe(dev, PTR_ERR(tx->npl), "unable to get npl clock\n");
>  	}
>  
> -	tx->fsgen = devm_clk_get(dev, "fsgen");
> +	tx->fsgen = lpass_macro_clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(tx->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(tx->fsgen), "unable to get fsgen clock\n");
>  
> @@ -2515,6 +2515,7 @@ MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
>  static struct platform_driver tx_macro_driver = {
>  	.driver = {
>  		.name = "tx_macro",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = tx_macro_dt_match,
>  		.suppress_bind_attrs = true,
>  		.pm = pm_ptr(&tx_macro_pm_ops),
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 03d6434a4a1..e718edd732e 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1557,15 +1557,15 @@ static int va_macro_probe(struct platform_device *pdev)
>  
>  	va->dev = dev;
>  
> -	va->macro = devm_clk_get_optional(dev, "macro");
> +	va->macro = lpass_macro_clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(va->macro))
>  		return dev_err_probe(dev, PTR_ERR(va->macro), "unable to get macro clock\n");
>  
> -	va->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	va->dcodec = lpass_macro_clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(va->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(va->dcodec), "unable to get dcodec clock\n");
>  
> -	va->mclk = devm_clk_get(dev, "mclk");
> +	va->mclk = lpass_macro_clk_get_retry(dev, "mclk");
>  	if (IS_ERR(va->mclk))
>  		return dev_err_probe(dev, PTR_ERR(va->mclk), "unable to get mclk clock\n");
>  
> @@ -1610,7 +1610,7 @@ static int va_macro_probe(struct platform_device *pdev)
>  		goto err;
>  
>  	if (va->has_npl_clk) {
> -		va->npl = devm_clk_get(dev, "npl");
> +		va->npl = lpass_macro_clk_get_retry(dev, "npl");
>  		if (IS_ERR(va->npl)) {
>  			ret = PTR_ERR(va->npl);
>  			goto err;
> @@ -1782,6 +1782,7 @@ MODULE_DEVICE_TABLE(of, va_macro_dt_match);
>  static struct platform_driver va_macro_driver = {
>  	.driver = {
>  		.name = "va_macro",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = va_macro_dt_match,
>  		.suppress_bind_attrs = true,
>  		.pm = pm_ptr(&va_macro_pm_ops),
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 899c8bee464..02fca60edf4 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2701,25 +2701,25 @@ static int wsa_macro_probe(struct platform_device *pdev)
>  	if (!wsa)
>  		return -ENOMEM;
>  
> -	wsa->macro = devm_clk_get_optional(dev, "macro");
> +	wsa->macro = lpass_macro_clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(wsa->macro))
>  		return dev_err_probe(dev, PTR_ERR(wsa->macro), "unable to get macro clock\n");
>  
> -	wsa->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	wsa->dcodec = lpass_macro_clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(wsa->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(wsa->dcodec), "unable to get dcodec clock\n");
>  
> -	wsa->mclk = devm_clk_get(dev, "mclk");
> +	wsa->mclk = lpass_macro_clk_get_retry(dev, "mclk");
>  	if (IS_ERR(wsa->mclk))
>  		return dev_err_probe(dev, PTR_ERR(wsa->mclk), "unable to get mclk clock\n");
>  
>  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		wsa->npl = devm_clk_get(dev, "npl");
> +		wsa->npl = lpass_macro_clk_get_retry(dev, "npl");
>  		if (IS_ERR(wsa->npl))
>  			return dev_err_probe(dev, PTR_ERR(wsa->npl), "unable to get npl clock\n");
>  	}
>  
> -	wsa->fsgen = devm_clk_get(dev, "fsgen");
> +	wsa->fsgen = lpass_macro_clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(wsa->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
>  
> @@ -2917,6 +2917,7 @@ MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
>  static struct platform_driver wsa_macro_driver = {
>  	.driver = {
>  		.name = "wsa_macro",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>  		.of_match_table = wsa_macro_dt_match,
>  		.pm = pm_ptr(&wsa_macro_pm_ops),
>  	},

