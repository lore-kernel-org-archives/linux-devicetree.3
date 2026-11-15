Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737423;
	b=XQIM22eHD7HXsgQroWj1QThukZjdw0rTjrpf4BlWh16UdSmdfFxB8RcmnLIp3IjrkLDw
	 nfcKKRdfvIEPXk6QrY/xin8CSyp8iNxpIaou0rO3Us9BRuU/yDq5GcB3RY3KlxmYUfDS3
	 MBWLl6BZFEwRcZYiHR+W/jbcQXTe7c9qLZoOgJCUVry18Mop+PuqMhc1plBwqOIE8+dfC
	 NEUeji5qOWnieqO2lGkF6sRcWe/t/KLv9p5XtX2CD49ZsGNp5vfy9Th2Sg0Os8++uQSGM
	 xDTuqjY100Cz/DsapnzQVBkGtB5W/5o8HjSvarOqBxiPWfpGsoZn3P+wdbotBT3U/Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jZbPE80Um1vaL8XJX138DxP5RpxO+K91varTjkhX3aQ=;
	b=i4I7NH64/c4c9nKgeu6vF5x/iUdu3Fd3Z109HnRNwHV6iPBLenoSY0/d1ISr08m3N2mo
	 OLnrWb/ONlichtZHIHYUKitlBu6pSmvoY9QLk57MubRCKa65Z+tRexeR+rd2OJKdaQ5Wm
	 JQq0bRrtr1y186pK2gOFC+qtqz4vHxqf43raJHiO9bDKYCzsQBi3/BMntqEFbmQanBBTA
	 pup6ZSGTbzS5DSuKm7r7QWuLYi+bPV1yec7aTpG0Zh5moC+2pWPFgK8LMzAKFh+XFzDNe
	 o+1/qTldrBeqH4z/MHSt4g2Yk8MzqcOL5Y+pYC8M+Q7NP/HMnPiqjuzb3f+eH6LjfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hz9JkJwT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQ5usyu5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01859606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01859606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hz9JkJwT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UQ5usyu5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wFPk3140612
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZbPE80Um1vaL8XJX138DxP5RpxO+K91varTjkhX3aQ=; b=Hz9JkJwT/gzveF3G
	3VNvnsO9hYMAqIaKP7R0fbgt0tUmRuINmVcKxUCy4ytg3J8cAe8DQYisIj4FT9cR
	3ZHIIY1EMknBi/UMGuLeASZALvPJtlMLs2JxTLH/GItVc2dMaO3dj4Gv2zT2GF1U
	ddo6M2aQzYthjFVNCVhwSLSvlgU9maHO70YTuTRtVRZiTeBsvC6j3ISjhhxDTdLQ
	i1kjw4hnvztF/u0fSfyFUBvMHgetZfD7POFJVZXYkeoWVScfOOIeQKSbBNsnvAgd
	98Q8updj2DkR8V6Sy8EWbljWLnqLXctHtZHz17Q4pbW+JAla74ykoeud3EjjJWit
	nGQpUw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdtqm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:10:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so230946585a.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794737421; x=1795342221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZbPE80Um1vaL8XJX138DxP5RpxO+K91varTjkhX3aQ=;
        b=UQ5usyu53iyPHsHm3/gNETB4mL2TnBACysh2K3oZo3v1AInamTdjnbLTHRPQFVJYL5
         WSS3dJYFv/IlV5UzjzdAtM1P08eLMl9eJoAzRsdXYw5foMe5rmG/+QpVKEK1sX8TjQBH
         nI9kzLtYxEzMJsZDbpCDCTVedXn4D5s0y3lr+GV8UbSHCBYOwvjfTmqFrUMLOCvVtqh6
         bYPPPFbN51CbeqWO4jY4z/VFUjalRKU3jeVg++GJ1bXmfANxfaNwQfyCEZCW3uL0qpa9
         LEV1x+niCKvBu6k7D8ItaIQvND8Ndaz7QG5a9Z2Zfbb/HbEFMgtd73TdVDBepMHGzCE7
         oZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794737421; x=1795342221;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZbPE80Um1vaL8XJX138DxP5RpxO+K91varTjkhX3aQ=;
        b=vIKx2WaWkOTxPrAeKbPyWk1CLceV9kIVrld2MI5DX6x6CVX6MoN3eDDInO1/My44Sc
         uQgsbGVdHTF4gCnIGlhKkT2gIlVi0HOxOMjT3w0XoShTMHF6Nv4CmCJ6p96hIHT/DG1C
         9Eu2I7006SIW9UOplWeoqMvmiDUjU+Pd1G2AGd06hwtOaKQobTW6fpj3OZiC3zW47uE5
         EEDudrJfkTxQtc8ZaCdPdJ8mitIF+Jj9aMCHLvRQZ0mzVsIkilvHRH1Mt9LKK3eeAg4H
         aQKvA/nkwFa/txqYR1lK0m/E9AzqdKngWwVkiZEAPni2XxxLdMIFtMQf2G2TfsSU4O1R
         nkaQ==
X-Forwarded-Encrypted: i=1; AL+hErHIpAdzbXSZGs9I0CImc5LlJ2uTZ559CccFT/xBCDSqO/akx57phr0otuZpbL7+o4WQQ13w01ufVolv@vger.kernel.org
X-Gm-Message-State: APuU4Z8ws0QAUN4hmDwNdM2ID6Z261UgOH0f+SxUf9WO+7gbaQfkhbxM
	COvCBZyqNxzZp3wpoEZCX3W3qv0fwm5EdZRWWz5I1Wxl8h/Gy3C99TXGiFC8Uj03UWgmQ7AQPNy
	YrNTVomAenTrCkMYSfaFiThphzv7VBbpeA9U8Ybpc2QRnqjhuVPX3zxqT23HoTIFj
X-Gm-Gg: AYBFou1FdjGkiXWQnZLdqPRvQ9Q4+IaFyVzLK5rohZ+oX8FjR6vvMURPLVUghhvmFv2
	qFs380qWS4S9QOuO0NEKZoCFx2ZLHlB34y1TSNMoINPmQJ3eYoPHD/54O6peXSyfU0BEHgUhJGQ
	eZGLkikkq3o0XWuYdoRaJEgxK+Weve7Uj14iEvcCTPMzAoj67trHPFSsmgm86yWMLkpHlPRTAZr
	3DqsogH3dSLvb0raqFvFtwr5XdJPZtBktqcgoNNa7xNKtGMdhXtKHRiiODAVO/ATM34YBQDKO4Z
	N4MQ5992z94FapL+oCyD3Q//DkFyocv/jZWmyTvwVd6cV+3Yw9LRPJjW/uwSELQpBek2wDGwDhL
	GQK0v+RttzOGOAR/rjI722NbifRwuW6RQCRyrDuAPRVnzqdNDetvPOqiGoFaEOStsW4a+dciFPd
	XJnuGL73mdnfnR/SrGYw==
X-Received: by 2002:a05:620a:439b:b0:93f:228c:52fc with SMTP id af79cd13be357-9494bc410f7mr1140001685a.58.1794737420900;
        Sun, 15 Nov 2026 02:10:20 -0800 (PST)
X-Received: by 2002:a05:620a:439b:b0:93f:228c:52fc with SMTP id af79cd13be357-9494bc410f7mr1139997885a.58.1794737420210;
        Sun, 15 Nov 2026 02:10:20 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23cf6e9sm3264633a12.20.2026.11.15.02.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:10:18 -0800 (PST)
Message-ID: <ae296de2-15fb-4c9d-8fec-26a370b167b4@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:10:14 +0000
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
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass macro / soundwire: retry deferred
 clock acquisition
To: yass27106 <yass27106@gmail.com>, andersson@kernel.org, broonie@kernel.org,
        srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
 <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af9850e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ZP6RTSIIFES_E-Ul-7cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfX+AcqjOHEvLH8
 rJ7R1rA/rx3lpymFyjwVJXbWpfzbkkA+iYQOwNEXQ2ovvwkTwPEzu5C8S9E8MUBOdg9JwX0HXpk
 Bj16J36v41DwD0sdkdnhLiCYHMIRPJc=
X-Proofpoint-ORIG-GUID: eVHJx-KUkcUhMp4oYj7WhqNkeAui8eRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MCBTYWx0ZWRfXwcIVdRXfC22o
 h27jBpeivSrZ/86Moki81aaOKXnt380BR6kP922OFL4fFopbctxBKDp+kNwQXR/7iWf8dcrB638
 fQWn2QLhvnLRhw4wZXVWLtnjxEJH3Dc2SL76OfU8yZvcLDLHH2XCz8EFRnGQGnEW+h1WE70C5WU
 ixRaAUtidP1pKTG762+8WQ9TAf+rXXs2jwoDC+z+6vRyua/SLrwXnI7ZemewmPTuB26D9kpYGo7
 oq3kPa5RWM+WOsWlAEjiH//VzVzF5naSBS9CjK9wb/BOPP8buRTqoZOfbCOE1Ng+U+LbZQGt84H
 0qCGbEgMwzgBFpi6GaNYptF6ENCw7bIu8RnqqB6UQqtRniNRnrrScYjebxprGbSQgsrvHpO0+gY
 9juCkrGJSykcmPUqNQ9l0IDIs1oI7VcqNDZ4yz5f2bJVxD4Zi9HWYz0K2oxbfiAfHikm7MzBDIl
 mgobZptNOpdJ064gvLA==
X-Proofpoint-GUID: eVHJx-KUkcUhMp4oYj7WhqNkeAui8eRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150040

On 11/13/26 1:24 PM, yass27106 wrote:


Please explain the problem, its hard to review this without a commit log.

--srini

> drivers/soundwire/qcom.c           | 37 +++++++++++++++++++++++-
>  sound/soc/codecs/lpass-rx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-tx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-va-macro.c  | 43 +++++++++++++++++++++++++---
>  sound/soc/codecs/lpass-wsa-macro.c | 45 ++++++++++++++++++++++++++----
>  5 files changed, 195 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10ef..cb50cf239cd 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -21,6 +21,41 @@
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "bus.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char *id)
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
>  
>  #define SWRM_COMP_SW_RESET					0x008
>  #define SWRM_COMP_STATUS					0x014
> @@ -1669,7 +1704,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	ctrl->hclk = devm_clk_get(dev, "iface");
> +	ctrl->hclk = clk_get_retry(dev, "iface");
>  	if (IS_ERR(ctrl->hclk)) {
>  		ret = dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface clock\n");
>  		goto err_init;
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index c41eb8de616..5d893960dd8 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -18,6 +18,41 @@
>  #include <linux/clk-provider.h>
>  
>  #include "lpass-macro-common.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char *id)
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
>  
>  #define CDC_RX_TOP_TOP_CFG0		(0x0000)
>  #define CDC_RX_TOP_SWR_CTRL		(0x0008)
> @@ -3780,25 +3815,25 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	if (!rx)
>  		return -ENOMEM;
>  
> -	rx->macro = devm_clk_get_optional(dev, "macro");
> +	rx->macro = clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(rx->macro))
>  		return dev_err_probe(dev, PTR_ERR(rx->macro), "unable to get macro clock\n");
>  
> -	rx->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	rx->dcodec = clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(rx->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(rx->dcodec), "unable to get dcodec clock\n");
>  
> -	rx->mclk = devm_clk_get(dev, "mclk");
> +	rx->mclk = clk_get_retry(dev, "mclk");
>  	if (IS_ERR(rx->mclk))
>  		return dev_err_probe(dev, PTR_ERR(rx->mclk), "unable to get mclk clock\n");
>  
>  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		rx->npl = devm_clk_get(dev, "npl");
> +		rx->npl = clk_get_retry(dev, "npl");
>  		if (IS_ERR(rx->npl))
>  			return dev_err_probe(dev, PTR_ERR(rx->npl), "unable to get npl clock\n");
>  	}
>  
> -	rx->fsgen = devm_clk_get(dev, "fsgen");
> +	rx->fsgen = clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(rx->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(rx->fsgen), "unable to get fsgen clock\n");
>  
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 6deaaabe43a..4b8635cc2b2 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -16,6 +16,41 @@
>  #include <linux/clk-provider.h>
>  
>  #include "lpass-macro-common.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char *id)
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
>  
>  #define CDC_TX_CLK_RST_CTRL_MCLK_CONTROL (0x0000)
>  #define CDC_TX_MCLK_EN_MASK		BIT(0)
> @@ -2258,25 +2293,25 @@ static int tx_macro_probe(struct platform_device *pdev)
>  
>  	tx->data = device_get_match_data(dev);
>  
> -	tx->macro = devm_clk_get_optional(dev, "macro");
> +	tx->macro = clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(tx->macro))
>  		return dev_err_probe(dev, PTR_ERR(tx->macro), "unable to get macro clock\n");
>  
> -	tx->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	tx->dcodec = clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(tx->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(tx->dcodec), "unable to get dcodec clock\n");
>  
> -	tx->mclk = devm_clk_get(dev, "mclk");
> +	tx->mclk = clk_get_retry(dev, "mclk");
>  	if (IS_ERR(tx->mclk))
>  		return dev_err_probe(dev, PTR_ERR(tx->mclk), "unable to get mclk clock\n");
>  
>  	if (tx->data->flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		tx->npl = devm_clk_get(dev, "npl");
> +		tx->npl = clk_get_retry(dev, "npl");
>  		if (IS_ERR(tx->npl))
>  			return dev_err_probe(dev, PTR_ERR(tx->npl), "unable to get npl clock\n");
>  	}
>  
> -	tx->fsgen = devm_clk_get(dev, "fsgen");
> +	tx->fsgen = clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(tx->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(tx->fsgen), "unable to get fsgen clock\n");
>  
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 03d6434a4a1..fda1bbada11 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -19,6 +19,41 @@
>  #include <sound/tlv.h>
>  
>  #include "lpass-macro-common.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char *id)
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
>  
>  /* VA macro registers */
>  #define CDC_VA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
> @@ -1557,15 +1592,15 @@ static int va_macro_probe(struct platform_device *pdev)
>  
>  	va->dev = dev;
>  
> -	va->macro = devm_clk_get_optional(dev, "macro");
> +	va->macro = clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(va->macro))
>  		return dev_err_probe(dev, PTR_ERR(va->macro), "unable to get macro clock\n");
>  
> -	va->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	va->dcodec = clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(va->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(va->dcodec), "unable to get dcodec clock\n");
>  
> -	va->mclk = devm_clk_get(dev, "mclk");
> +	va->mclk = clk_get_retry(dev, "mclk");
>  	if (IS_ERR(va->mclk))
>  		return dev_err_probe(dev, PTR_ERR(va->mclk), "unable to get mclk clock\n");
>  
> @@ -1610,7 +1645,7 @@ static int va_macro_probe(struct platform_device *pdev)
>  		goto err;
>  
>  	if (va->has_npl_clk) {
> -		va->npl = devm_clk_get(dev, "npl");
> +		va->npl = clk_get_retry(dev, "npl");
>  		if (IS_ERR(va->npl)) {
>  			ret = PTR_ERR(va->npl);
>  			goto err;
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 899c8bee464..437a0876a8b 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -19,6 +19,41 @@
>  
>  #include "lpass-macro-common.h"
>  #include "lpass-wsa-macro.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registration
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char *id)
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
>  
>  #define CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
>  #define CDC_WSA_MCLK_EN_MASK			BIT(0)
> @@ -2701,25 +2736,25 @@ static int wsa_macro_probe(struct platform_device *pdev)
>  	if (!wsa)
>  		return -ENOMEM;
>  
> -	wsa->macro = devm_clk_get_optional(dev, "macro");
> +	wsa->macro = clk_get_retry_optional(dev, "macro");
>  	if (IS_ERR(wsa->macro))
>  		return dev_err_probe(dev, PTR_ERR(wsa->macro), "unable to get macro clock\n");
>  
> -	wsa->dcodec = devm_clk_get_optional(dev, "dcodec");
> +	wsa->dcodec = clk_get_retry_optional(dev, "dcodec");
>  	if (IS_ERR(wsa->dcodec))
>  		return dev_err_probe(dev, PTR_ERR(wsa->dcodec), "unable to get dcodec clock\n");
>  
> -	wsa->mclk = devm_clk_get(dev, "mclk");
> +	wsa->mclk = clk_get_retry(dev, "mclk");
>  	if (IS_ERR(wsa->mclk))
>  		return dev_err_probe(dev, PTR_ERR(wsa->mclk), "unable to get mclk clock\n");
>  
>  	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
> -		wsa->npl = devm_clk_get(dev, "npl");
> +		wsa->npl = clk_get_retry(dev, "npl");
>  		if (IS_ERR(wsa->npl))
>  			return dev_err_probe(dev, PTR_ERR(wsa->npl), "unable to get npl clock\n");
>  	}
>  
> -	wsa->fsgen = devm_clk_get(dev, "fsgen");
> +	wsa->fsgen = clk_get_retry(dev, "fsgen");
>  	if (IS_ERR(wsa->fsgen))
>  		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
>  

