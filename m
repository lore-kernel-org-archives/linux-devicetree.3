Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA444A0903
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141740; cv=none; b=JsPLVVyQvzr/t0sqXRxb+xB5EBiT4YnHFeveqdM1iJGvaQMzJDc4EnHnhwfvJuLfbMSeJusrmLhGoKlEU/jn4OktUJHRPz/PIwJRHWemEmxSjaRIesHN3bl58aLHpqwtz+C+z27NldnY3ZeZsdd/n+n4HUZPA5zOGK8BGPNmy70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141740; c=relaxed/simple;
	bh=lzTiCMfXmBBMNBYrGo7n0+U0h3AodXshHBSUkETHf9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osta8hVFmyYwcUsArp4/eGHXzSEjK80VBS9fc/3ognN0T1mRx5boe5iYlPHJgiutlfKcdgxQMHa7PU8MBICrIMEl2hNT1ZrXVBmby46rRmLfI1TVxGnEtZL9cqFafiNFwbb5wVORzKkcY61uxRnRroe6QeD/Awen1wldAJ964bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dqyk7Z5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQoa+HGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dqyk7Z5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQoa+HGq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAVH222596
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+D114KpAsx+agyqYsIr5jY5EYt36qFLcj/ka8IKdRy8=; b=Dqyk7Z5ovAa7SRGT
	K1HzDG9VtyHfDZdfKyJvpISk62nPxNK89BrrA5MMKUTxZ2q46OGLN73UhptCNvYd
	JARnUbS9+RzSxN9DHJSx1gpF74BEy9wwOuzIpG9CAgJaxakI+kU9Ep07/9waNjAn
	NEj+IoUrYNGrYfU1WB1oIDmT4vkwsvseXzpjPklkLCg4ulAtnaNT175/grQFbb+q
	JrhstgCzXUA+QDxN7T9Uz12asMRaxRpNyh89VBlUq0fezg49KDltwOKGPz7orOyU
	4m00yTdDS6/1UOh0Mg7ewkceiTurr1OtXH92qQYBWTGY9ohH3bKEJ1nHj+8cUCcn
	xAQCew==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrahnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:48:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c66ec39d8cso73451e0c.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141736; x=1789746536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+D114KpAsx+agyqYsIr5jY5EYt36qFLcj/ka8IKdRy8=;
        b=HQoa+HGqXb8sOnsCVNPAcm2pKV5sg8pcwnY8ERH4m2Nh3sYUhBjupR09H9i3hKWqPZ
         eTvNs7Ah+aTrxUvcvkAqqyzq5XZimBedifLE3oa0w/j7AT8AwNeICCZ/cZfTXLd08Qcj
         x9RSNMKLt26C+1vNPHRB4xGROVNcV8Ldz3ja0HEAn5Ey4Dwnn0KD8aiwYzpVzFwyLYcV
         b5au8Jjq2bzGXNWeB4EOjwjFd3l7aLTsUscX3172ZteU0DoNV2maXZzKwdPV/lTTqBtE
         5D9ZM8T9N/rPJAXEuKZrdy1D8jAgHrPLLkO3K9Yk+IfHrBctoHbsX7bMcD01FADgEuCZ
         VFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141736; x=1789746536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+D114KpAsx+agyqYsIr5jY5EYt36qFLcj/ka8IKdRy8=;
        b=cq41YNFtP9nngrFLq88XBCqHiiLZmOYFLq0N3w0z/q9PkTO88Jug0uLVUSGX/bObTl
         mkOPCP4QYCesG1iGb1JTwjfraZW8NddY6t15Yiz3MWd+S22bAQOlZEFs4HhQQcm6QWmo
         uu8VRESColh5JO8oOeXczYRtMPaKljYUz9bK86exMT4FGCSnfJqwA+LAtiPg/jsD0LXk
         cUebiDFrsoeY+3CHzlqq0qlwcssFWaiswK9qBjJ5rlO8P4F8abZ2aaUzDL2T3YmGw+/l
         8e+rsoI2IfrrAyegvZKkZY9dKEHiKXX8DpRDS9/zU+HiDjyo46BPUO6UFKe3h7iSZFg0
         N3fA==
X-Forwarded-Encrypted: i=1; AKwUvBwezd4GZNM3O3GgsxWOszmBQIHOs36o2W7zRpzZqL56XoBupt03fiK5VWGz+5ESHU6vl9UJnDu0mo1U@vger.kernel.org
X-Gm-Message-State: AFuF++kMr2K+hKwnG7sqG9cATwtYUB/7VAPtqb2wxV53/5f6tiR4lXVP
	4GH7oMj3kurXrR/XeslaUWs8JY0we2e/W64NwFW4j20iqv2pLXBZBuSJ3/GXnWFngYbnN0nfbco
	meNVH15M0PNhvuBng37CYqdAqQc3UGb5pEJ1kj78I2aEPlTd0omsT2D1/uWdM6ZwD
X-Gm-Gg: AYBFou0HKBemdfSZxHRD9spNSZcDGRahBOZ/alf+tb22XT3LMAoJF87YlEp2mna/T49
	/UzIEODCBdyRgrzMb/ybAZ9Qcm9dVSTAKJtjw20AnvKjvU/jgR79GZn8Gmby9RRw8/SmzaivNwF
	D2tK3EA5Pujk1AUD4q6dTkLndto5iRkPaqOYmkvUMX7wNLf0tTbLRwGITt2aSWP+mx9/fzlqjBk
	4fwHx/nVPMq73rEYqTg15VY0AcMoIlHBf8uOlQQroOr/RCrlWScKfQ1i7MfFRqC+eXfaYHJNbEi
	O5jel5PuUoDB7C9pZDiLKEarHXg5a/ULje9Utofxn2oP/9M88xt5rtw43Kwe50j/anrPs/EMSwd
	j40SpTqU=
X-Received: by 2002:ac5:c5ba:0:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c845f4547dmr1731523e0c.1.1789141735829;
        Fri, 11 Sep 2026 08:48:55 -0700 (PDT)
X-Received: by 2002:ac5:c5ba:0:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c845f4547dmr1731461e0c.1.1789141735422;
        Fri, 11 Sep 2026 08:48:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b594f0fasm1042819a12.25.2026.09.11.08.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:48:54 -0700 (PDT)
Message-ID: <dc49be3b-5b8e-420a-be34-09bb27fc65f3@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:48:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] drm/msm/hdmi: Handle msm_hdmi_power_on() errors
 during .atomic_pre_enable()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-2-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OcVQxl_7hpGHEG07CXfDTtmh-PNEvWOU
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa422e8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gvqx0daIpy4NcrUZJzkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: OcVQxl_7hpGHEG07CXfDTtmh-PNEvWOU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX9kkl7l+MPCBr
 RugQjJ+NxQGD9l/eHwfNn7HOyMw2XKaKU6qeIxywCZgfwAu3paIPu1N7oqGaJaBWY7CbkwK6nnO
 7T+aN4PVQRHMc2a4h7OvJxI8dI9WijM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX/UXe5vwqaBSG
 wAcxT8rzqTzsgqfSgjSJDRoMZPfKhoT8a9eNZE3q8Nm8kV9JpNfV36XZEhiCHixKNwbME/HUqjA
 9sheWbg5vk4NUyT1C10UM6qn/+3ex/DIPJt+a7ciQXYlG1XJ6+GVq0GNewBbI/0ceeeEdX1DtvE
 OG89aZeGF2voB9ea1TMGznQaFR1gEp43HBHEv33mubULn5+TJvxKyXzKaeSV5FtFF+iEJtCL4XZ
 0zue+AVKUY0xdXfGtTJODcd33ExFaOev5sR9ACh9B0iLcHo4O6238cH4CkXIZAf3oW6IUVBsqKW
 4DlbBtvZI0T2+Inoh7YFJV5TSSdcKF6qzb/w5kmIUQuIdHVfSP/kxbA36DH5dzS+vwaIVKFa1as
 cuMLI3O61ErmwwhKz813Tg8pDOsqykHes1NNky6APuBSTOUv1+nO+65wQiERzWEn0y0zplEDpDi
 9WffyCWrkCP5MNL5cEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> Properly handle power up failures during .atomic_pre_enable() by
> aborting the .atomic_pre_enable() to avoid accessing registers why
> blocks did not bring up.  Otherwise this could lead to imprecise aborts
> when accessing MMIO while entire power domain is off.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: ba3d7bf3a7ab ("drm/msm/hdmi: Convert PHY files according to new design")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 157f19bd90b4..db85400e574e 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -13,14 +13,16 @@
>  #include "msm_kms.h"
>  #include "hdmi.h"
>  
> -static void msm_hdmi_power_on(struct drm_bridge *bridge)
> +static int msm_hdmi_power_on(struct drm_bridge *bridge)
>  {
>  	struct drm_device *dev = bridge->dev;
>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
>  	int ret;
>  
> -	pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
> +	if (ret)
> +		return ret;
>  
>  	if (hdmi->extp_clk) {
>  		DBG("pixclock: %lu", hdmi->pixclock);
> @@ -29,9 +31,14 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
>  			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);

^ should fail too

Konrad
