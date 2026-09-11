Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56788493625
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141650; cv=none; b=QFTQtilF6dkh5mDbSWimK2DqVyZ0chCUaV2w5PQr+HDCXmB7cDohcHJ0osqmb31vdtlnZDZJy1ZwUDqbMDkzNdFDVpfxJ9Zd1hwrIE/jzhIAfu7hr0iXsPqmrn6AorzRgE4YPSw3Oxz/5cuZNLPFBDVgzzpmlP7/ewj8soimmvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141650; c=relaxed/simple;
	bh=jQOKo/0EcaLTKkAlP93GOK9T1NRbX2+OwvLKoZ940lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcIxH4/1/AjEh6HX+Eo6MRYWnQEAby3ucaMNxDYehN/j86b/dlGbe5dG21brOApsYEwZEeEtYCeEcvPjrATFr6AbwtKlCsr01FOe7LYLFksn5zp63OgdMpbIr+lMbug6/UpY126h9yTGNuhXmDEGq8HE4e7maj5Hu/N6L3Cr7ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxyRhZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDnpNvd7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxyRhZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDnpNvd7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA6qj658274
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=; b=nIxyRhZehWMkVrXR
	2GaPdMAHZP7A+k0lBwJrtHhG5VfwXwjxPDe3WJ2RtymndrVQSgeaQ/djVThV4h0A
	DEvBMiNqn7x9jY6lTt8G+u/kvyA/U1zG/X2J8kyGjf1f+wOVflZYvh2BPcKC0SGm
	9HMaXNYZURecS5Z0PXMHnGPQkiWbyHwmsNZ/QZ31Kw0GHBMzphG+fZMJnFcmWmTg
	rN4m96B6FO/fZ/5jAzxOms9UJ32YnzCYYW8WxUNuPL8BAOhYT2gZ4Lx70SrNuXkx
	rlz8hE1HWYftk6GDuKOnUY5FAOMwn6P1ZXhnMBAutEcPCQrrIlTMQYyouNRHLRM+
	jQ0qVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r532-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:47:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939eb754904so14583585a.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141645; x=1789746445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=dDnpNvd77J+53Hdfra4cOIgRbgipGsvF87uzEJxRq0f+Cy0DD0MIgVMrTIYcsmNS/z
         FQ8xAF9Wly4UcnHCmwB4Ub4KrF5k+GsuPZ2aOeopFV2d/C9Zjh19VZOSKhVT7kEXaR3u
         inTAp2Ui3KPyQB6O/h+6QVEQcPwITyslWn0aoZNrgk4B74r4dyehv/Lc8INf3xZInNe2
         iJo3cwgKH3rSI6EkRLFznEMlwgRpu3nflfpqNZPvZYzqFMLyKaifJeV1ogHT1lTkoz68
         ipcgLHEKH/Dx22gtd3YK9jTWkEIGDIqbVu2oo7UQF7Pmz228f9o0NgKjFbUM8PrLNSyp
         wocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141645; x=1789746445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAP4G/5H0Hyu01kOmdgc+EaLrKXNW6ITWSH6r5rO1zQ=;
        b=kbDWM54NfJO5HFi23kfjIa8i4mLy0AIIw5k2cdhvwxajUZSqI1d7nQkGndScngXsnr
         rNwyyy6TxAl4U9Izb6XdOPKU1qH8jJl1ATVeZpx98R1VQ522eE2Wnjbb0Xa+ejKqPMTd
         C/unHTSzYm39DiUKcSWxGjFKkTuxNVtdRt9SGwxGAWAOJoIpF5gePF/mUmAPhGY/ipo0
         eWy26UHKY7YfBag4+ajLiyy/RSSAXlSshNXlZ8qZWacHGPnq1M+45p4APw8XnkPqHIgP
         9XgiD43lNbmHSb2j7vBTy/YmTwPOHzFZmggbguH8TTwtgn0r4AyYICsNI21669e3ffNh
         W3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBw9BI66LhjnUc3o74IQDfHr2lAkWJ6QFwSOYpJhtBbsOTDx5G66kBnGSFzVvWqoYA9eQ1/wlT+jv7tD@vger.kernel.org
X-Gm-Message-State: AFuF++mtxzWFfThmSxttkVXLSxFv+8u6EgG2depCXTPlbnYGFzIlDkaD
	G0UxLTDGz5UjSIJ+V1y097cnvGu+k35J/CWYJ5ioJq4doFRbv7eSf3O8AW2eEHr8W9RkoKjj3Kt
	eW50FWlI6ueIvUeAAgOEzpMs4Nk+J0ry0DZ0fF9aceOCE1FStJYOjkmCYm83RruZ0
X-Gm-Gg: AYBFou0ZzN3/VCNKqxT5s1Z9DWRvRnagNIFcLVUIXeV6tSrQR9d8Ku4ZooXvX8yIVto
	M7MPQXrNZ6KcT522XjzAmyDfMN0OiO6Qn6NHd9DWnu80KXbHysingVmNAm0VoMh9kguafAT9RHn
	5ZDi8MLuOqgXcSxFw47jfd//aVZhCigBZ/742iK5YNiSNZeUEswDQ8Kj6Is+UxtJ7yvywJ6RG//
	I4QxO77AHQVV8tIm22tVcvcmlJIoo1P43IWFoAiVELHfb9VnyhGdO3c6j8IsmJ4U9P3K5TNxPCI
	o4N1VQnzT9uwXyD6bFJtHFN0TG/PqlHdg2tc/BPjFdrbgHY3D/i2/qJwektm5kJ5IM/uuPnfAN+
	++ziFMusQTTB2j4ZkEQoiJA==
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563652585a.1.1789141645457;
        Fri, 11 Sep 2026 08:47:25 -0700 (PDT)
X-Received: by 2002:a05:620a:260f:b0:939:7e96:d296 with SMTP id af79cd13be357-939e9e707abmr563647685a.1.1789141644963;
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5912644sm984557a12.11.2026.09.11.08.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:47:24 -0700 (PDT)
Message-ID: <fa4c12eb-2b46-427d-bc47-a55e10e963c1@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:47:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
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
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX23MVlw6YwWcw
 vpUHyiyXN4y1Ee+2QUocJdc/u5+AgYEyUL4BZC0RtKSgt5IFpJhLdyMIQJA339q0h/DGVJXMC16
 3SI+GK+EUH2lfaKv/MUFTxBd5W442vWi2uo8pXANHzdriijWn4JOpXIfrCvBgY1ndgwk8j7Yc6Q
 J2QgS5zTeaCQNwty5NdAaXObtInEjj0ZjvnwlLCkO23y9qnKfbyYMI17CL+i3Hm7E/DBGdh3J1R
 EyD379ctzp82PHjLxX/wBWHptBque1Ne1KJ9+pZZhtP2/IEvG61aLiORU7vimTGZhKIt9ZOX969
 +6qy9QniAg+115PaiS2laCnoutjL/EguIQ3DzsifJMpmny4lWT3XXMNUZFB79cJUZ9KeV/0RIkt
 uug5YyHX1DXEW6xuMlVbOiWBddul/RkeAej9vlfOVDmI9iBmUCaE8H1y8K+uf+wwuby/cZt0RRP
 2R/OFJgFhuK9MaBwYnA==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa4228e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5N7f0bWkOQp0pCbeU4sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CrV4TiXP85yWSwu0MgfsktGzsbv6odLV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX+43d8Rupz9CZ
 8DtKi1BAWDVUx29WSXn6vyTPCPrih0muXx3PAV3xXnBuPG/BfXrYaDVYtKUVJw1TW1OopPKhqt6
 gdukKfPInSBMTMlSX4SO7hxxUPEfOZQ=
X-Proofpoint-GUID: CrV4TiXP85yWSwu0MgfsktGzsbv6odLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
