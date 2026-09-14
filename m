Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB05323A562
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345612; cv=none; b=jsScbQ6nVB+oh/VY/N7sYCJTd8xYemQfK9vwj7Ig8OjKW2K9KbiP+R+ltmVAgolOcAQNLOvJaIhY0Q6Mxe9Cp1UBiN1iyb426Gh6vMVsbtbku07JlrViy8nphMNFO33eWIP7pO9YhWFy0MfOR455mdiqJZaSAdLeb68H6XAGqgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345612; c=relaxed/simple;
	bh=j3pqj6wX2Y9j33bl/gZCdlghWUqkVbHEl14PKZ2w38I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkgO18DhfTNYdWNUc3pmEEDXwNeHdPEPSrETNiLzFqm1HHW26RrQtxjv5TkpF6VwR3BsJspOPqcnySbQP0pNtLGKd8Cx+ppUy0EOfcCLrLJTsGFdH5axVrTb2qsRj1zePCErIZNaY4spkGY3O5mNlcBw7/eWLqsN6nMYhdcLptQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEH7RHt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZJ8mzZmA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEH7RHt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZJ8mzZmA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06Cns2659972
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fhHkV5ZH2IWbRWw4FpuzKYxl
	rQHT67Pv+hyugolUmOE=; b=AEH7RHt392v0JFqubQvGMbrb+Bdmsxhn89rvkWl0
	jV1+rcG9FMUUK8myYDDs19gnBQTjqNkkfjy47SYrGHSagk1R0CWqYaxZUHMXQroN
	qRQ7VdIVuVtZBKbVVkXfQwAr031KTzjdMr8oqF7oFRUt2gRCQl8CuHnKG2tf7/jT
	lf/CHAp89RGIyZ2EvXf4BPUqF8uKqVRBW0GlR9FXwEEuQx60nUdEVX9j7Eut3aOT
	IVSyWzCjHOy8JZLJbIo22hcOKTtHzZOUBJ7fBQfwSjATyv1K3FPsil+UP7oAumaS
	pSVeP23W+iMraoWttGxSSn7gHUGXao0LDZWGtsuvVI4z9A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd4f3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:26:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7a31f3af5so994069e0c.2
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789345609; x=1789950409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhHkV5ZH2IWbRWw4FpuzKYxlrQHT67Pv+hyugolUmOE=;
        b=ZJ8mzZmA3pB8ZMzjOruYdEW6IeqsxKDcyQZlQ+ZJPmabLbot130xITRyeRXwmMBZDi
         iLXkPAVC0DdM2s+Zg3M19j53EA5OBDYDXcF8XIWcD/WNm8lb778znoindYe5fHVSFjRD
         F01UIFSiorRx2FFqvsUFsecOYeqvlgVvcgMUooxHqvXcRtNyvq4X/ynd0qbtTxkQ2Qp+
         AY8HS/GNz1cDz69VuDxCF+rzNCKUHIOG56tnXkifH87selFmF7FQ+Cydn4rmHQ8QRczk
         KSG11f2Q3ly9ARfAdp7pGe07QoipbqgaJZH9Ee/kIkyDdAw1igz6Iw/kuYn+w3x8z9LG
         UB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789345609; x=1789950409;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhHkV5ZH2IWbRWw4FpuzKYxlrQHT67Pv+hyugolUmOE=;
        b=ZtK82+/DSFg3FYsoNleIPLCXdKT6e9JvNL0XJokQocojWHJ0XlV7iGZBC5+VfS1PjV
         aRhG30ARYCy2dKaFV4rvqjzt+BNwzEuJbv9PZAHuXDrsxSlEkoe49Vh0tk1L9LVowDox
         s/PQqIS3IhdJ27MFHX2REdixt3+SKM+qx6Rnf4qONata9lx89Ln9Tw2TUqDfHm7OAGnT
         3lx3Jf0ou25kWKHbeNwbrnwaQRvoTljcQsFBrzAQI6Q+p8f9P+y5KbzP0TFmeplfOVL6
         n6B+fNEaaBVqu51yXwYXvCEBEFIRGi4dpT47NVKhmdz98ZdHiIfAJrbeHRHmOr7HR7/w
         07rw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ3hL120dqVit6xOcXRd1vln0Xp4Wr1PaMwll0OAim0CTSdaFUGX2x5rsjNrdrENXoWw8Ujojd64AS@vger.kernel.org
X-Gm-Message-State: AFuF++kIgQkgzIUFW/yO2ZYPK1jjwvSrDsKW6bxNT+bSwRzuUtRH+wU9
	hyC+cuQU0bB8cb38iVlxRyaB3PCwDPBb06xZBtnG5+cvIIFo+R7/sn6Ql41mhetazaOQdExFSIp
	46OQCrbEfIX9/Ytp8LD7FIFh0DwvR/UUstystL41OTj4r5ClLnI/mMgkfTaaKovn/
X-Gm-Gg: AYBFou10nkCyuS56B+aIrW83JTUgfvE1955iedq/gwCDzpJ6maVUvQWp2LunlLrevVj
	9Re/k+F4qvm/Grfbjkf+iHljqsNDpfoToE2hSI19QvcS09GofnjW4rQBiR5IgoexX21n73bB0sj
	ih6M/5mRQ6y2Q8fPWxjIzQx5TBw+8miN4ZyNi8w9ho5Hpl27Bb6F9GpifDH/WChdb+sRZtWdunr
	v0yfvXdbAq1vkXVQCVDQrsm8SmEel03bPLJQZJL2ih36LnIS2i+IIDxh6l79Ww45bMwZS2WrzBh
	tvUKGOzUZT6xJGUMhBegKqZ+D03SV3VxROWggxnADH6Bobj0pK2V63eOevMeOOEMV92zXHTPTjR
	Ts2NblpH9Z3KLGCvrzHF8fm7bv5p7zbBuFMFk6gVtAB03afh2xYpeXirQo81TEtUN1AJCyu8JRf
	vky+k3YgNqJmct
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr86430137.6.1789345608902;
        Sun, 13 Sep 2026 17:26:48 -0700 (PDT)
X-Received: by 2002:a05:6102:b0f:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-79b5d8a21afmr86411137.6.1789345608432;
        Sun, 13 Sep 2026 17:26:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0456644sm2091675e87.18.2026.09.13.17.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:26:45 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:26:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Message-ID: <zfytnhu7vipotsoztncetoffnlzkw62vz2scuoogieol6et7ro@io7nslu5sdho>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa73f4a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dCp4QOuT8fr3gmi_UlEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwNSBTYWx0ZWRfX2UE7PiUMRVML
 tT8pTwwXZC6SwQZgckLdivhFovdY3SzP7O76qinZCM8Ie+tDI84rHQESlls8Wd2R9UsURVCDy3c
 R6dMskPJWFpVrQTecOWo8TQq1GFY027g3gOIbJhMMaFV84bcUCpRLpKANViaBQniHuF3QkS2TBu
 zwKET4l3x3kJFUB43zDT2x2hQLWObszShKxma2rV8wGhKukQYGgKgMVgg7i0b4HgusuGx3iiZCD
 yc6V2plJcMcrCWR2jSWpol1HtWl0T9ZO2FSPohpBAtyg6D8lhedjeJcTuO/0j2SiTiNvQSP1BGk
 Hydoqp6WLur0bynX0Ak9EfCXuSZdNeceP47UriMjgoNqoO2eHVNlmNGpnK2mXoZUCm8k4I1wd+3
 g7nkHSbJ/ZbslPsOco0+UM4emjJA/9i3JZiDBCW036VJ4PTjN7o86+Oil2/rGguA+oQR4ut3f/9
 mz4CIbKBTbFnNePsraA==
X-Proofpoint-ORIG-GUID: KVWMSr_5O8KFY9YPXAsT827VTY2W56s6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwNSBTYWx0ZWRfXzbb41azZyYpc
 tAU7x1aoRyWfdhGMjtQMhFIU0y7MfjWBSalpC5B3xxe2nA8kYTJrzchs9GlvI5OhQr405laVoQJ
 LcG0j6MIGe+D4WryVJDOF44DDfUgFfs=
X-Proofpoint-GUID: KVWMSr_5O8KFY9YPXAsT827VTY2W56s6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140005

On Fri, Sep 11, 2026 at 12:29:34PM +0200, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these

There can be no -EPROBE_DEFER in the middle of the
msm_hdmi_phy_resource_enable().

> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> index eb1088755cb3..15e37596bdb1 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> @@ -67,16 +67,28 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
>  	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
> -		return ret;
> +		goto err_pm_put;
>  	}
>  
>  	for (i = 0; i < cfg->num_clks; i++) {
>  		ret = clk_prepare_enable(phy->clks[i]);
> -		if (ret)
> +		if (ret) {
>  			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
>  				cfg->clk_names[i], ret);
> +			goto err_clk_unprepare;
> +		}
>  	}
>  
> +	return 0;
> +
> +err_clk_unprepare:
> +	for (; i > 0; i--)
> +		clk_disable_unprepare(phy->clks[i - 1]);
> +	regulator_bulk_disable(cfg->num_regs, phy->regs);
> +
> +err_pm_put:
> +	pm_runtime_put_sync(dev);
> +
>  	return ret;
>  }
>  
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
