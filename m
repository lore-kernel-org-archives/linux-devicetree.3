Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC43DCDA9
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194236; cv=none; b=oHgY5uEE2M04u6xvxsFF1+vvt6CkIxvcbQPAxBJOCvLsYj/EkcpAGvtXZySMDk8KLgVtTXtfBejtqio/QxeM80tJK81BPgwGAYZSg55dwTrgXv5o5nxW3ZQG1Mg8aeLBfqaCWlpgh93rFPtWTkYBK3cidRGACx7RtAMnApQENTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194236; c=relaxed/simple;
	bh=PMsDMFWhEV7pctXWXtEMNGVU2nxw9yeGWELxyBTu8YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0Elx0aNxMiAblAogTy9T9MWGMjNXysP7zhOyTY9LQy4X8dZ6E5Koyw1Hgv/CPGKDoz+dQTGUM6JKL3VHw1F31IERjr6oUhceqAqT79PGVor1Y78wApRqulFRW7ieSB/LCtkgC8eLmBYrdJtyKXIX73h2In2VMincZgl3HlaDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeLKCJX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH+7NRkB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeLKCJX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH+7NRkB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFq1hT2900888
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=; b=oeLKCJX2IWEAz85m
	uG1dKtptaCjTthoJ04PWVxyhFfstlQhOqXXSQ2qnsXmp9lUiI9Mlp2K77Rh/z0UH
	VnnAV5VTw6xw3Mv2TvhLQsNjAs5y6IvG/LONYJO9IdJw21hiP6sBB1fi+xPuu5fK
	OgmomtYR9ppQQB+x6ZHf/aeyWpQ4LGjItVST8h/N8mPAprzVj8VpBR8KCU6p8Kii
	EeJAneoi0Ux2pqfcC7u40feK3V6Q2kHljRvQX5Zs0dPSXxZCLDVEh/SGBfRe9kU0
	ULBWZ90U0c+BNnp2qfG1JKTPSXB32llp/yXRm5wy8lxTWglAJz/MrIKaoXTC+MSa
	ETs9iQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vahvqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:37:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c673f01b76so96964e0c.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 09:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194233; x=1788799033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=;
        b=RH+7NRkB7Hgj87n+cgbMizoMIfEu83lw0mslw205E9Duc0vGJIM0w+8jH+Wdu9kkqp
         m3m43Pl/NCQV3E1C6vSnwe6J9e3nVfkY1kPDcYWaGMFCmnPLKO/6qi9RVZ2VQ5BPqJIz
         kDkFAOnDn13Y/tYo/uWFWmN3FNiuYZI7CHUWWoLEktG2Jr2OhL6haLSvgOwLP7stgURR
         Y/YzjCQyBkCs2lKQJ7sUcU2mJCSgibZ/76VP/S43u7ODnzoOHhrWvCWsla2nALc9Lm2X
         DYLcWw9MRfI2FMg3w51eH91Ud3SKhGDKFEWVWTWNYFXJLAHoBqM2XCO87CwTfHhSSqjS
         Zn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194233; x=1788799033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkOzXmv1woFoeQJtIpxPXxYwsR0W1dreX8GPkYWvKdU=;
        b=VtHoOOUxlblYY2q4JhDntjGU3bbwYeuM7IEuy9W9wgGk2a3LrU7b2CKfyp2jW1VE04
         bGTNaHE4e5GkDxh+JWAa/dJe3mnDyda5nHscDeopBmXzOAob66KEZhD+REBQZprP7jA3
         XU7ARXSaZn0nIaGT3bUExJMNW/7Kug9gC5hPPvEmWY5sGJslErpOWjrRu3luVFK7MjSD
         yuXJd+wXnzGnzHs79G0V+9uUN7aJeSU1J/0tekGZReMMtfPY2xjFYQP0E6Hw1O4Pow8P
         oBjvtimyADjQyhV9903dCMY3+VJ2nwjnRjCRP2BxyyZPu2pLRXArFbfiW6uD/Bdrd9gJ
         6Xwg==
X-Forwarded-Encrypted: i=1; AHgh+RoEVCvSyCWdrc4GB5f4T638Mu4Xi4pvb27KO1Z4r2n1b/S5Usc2/v30HerJl0oD8t9ghTciZ8FgOUCO@vger.kernel.org
X-Gm-Message-State: AFuF++m4UdMjCpFPIB4awAI5JqKwpsO6F0icbOkhM4osCUjJ4GE0+Axg
	vDeOuwkT/xZ8CDE3XlwLgcaCQrxih9p/r44mk8CIOIKSfwLFwaIpu3TJ2jN5yv/33x0J7Tu5dlP
	WlyE5b9Yful0Frf6ysjvY2V8twv0LsadrVrhMsYAmdWtAJrVKDg3AlUgbCA6ND3GM
X-Gm-Gg: AR+sD13oN5xex3oMTrQzL6+lnkgpfeMf3rZ8nVn+Ul2y3CKxWIxaYifOJWiq5VFuDVM
	DBnYft87K9MSnvHn7d5HaXsjPKncMCg/CFGxJkeKyayt75KrznnJgSBw709LKwpYGjeZ1wME8w7
	Rb9TBvJNACplNGRf+yPulXnu5hc3HsejhE1aoIiQLcgL9t/4RzwEdZP/Ag1R47cTvXbYsgC1EqN
	dnLa324KbBWZmE2Q+HBMNJ5DkgXyjVrv1W2eQOC8P6QzUPx0IU/0BNrqdZlPiPO+Y4/omtx0JmA
	qjInXUJUmsSA6LzR17+cPXPJqgE6QsE1MMyN2OaTqPoLB3eVb15sCBYTerAL8jr8k0JvnWyyOR+
	Qn095BHWLXXMhN7nYMOB3fw==
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr4135464e0c.0.1788194233597;
        Mon, 31 Aug 2026 09:37:13 -0700 (PDT)
X-Received: by 2002:a05:6122:6b0f:b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c68096658emr4135459e0c.0.1788194233165;
        Mon, 31 Aug 2026 09:37:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce53sm2391683e87.59.2026.08.31.09.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:37:12 -0700 (PDT)
Message-ID: <4741e7a7-b6c3-4e5f-af03-d0121dc228a1@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:37:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 04/12] dt-bindings: display/msm: hdmi:
 Correct name of disallowed supplies
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-4-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-4-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfX23O4OLOrAgaW
 f1Omr7DztvFRrVtS8qauP/XvUnrXwD6lREcYDuFbvorY9wwne3uGuLdMbTeLLIUcl8oLlaCxF5V
 8dLfMcns6QwSPN1/OvdfDMtM3SsvIJXis6AHbmjMz9M+f6WnmKctSjHkzziGcXgyZL5OA+/XKsy
 hqtocibnn6xzL234RDvQXVRolQXfvJHpAMChlD7Dm/vIvlYaNeDyoHcM46HbpRbiYW0l+KLuejo
 nnw3vc0g3pCTL0c+AiX7bcf9fSRH8+lkFM85dDbVDStyzHsGPT5YrtHpD27f5NS+yheo4HF9fki
 x3peps2nU9jVR8eFznbIrhqVJvuY5lIEoOvz1mAD4SZmjDaBUGN1se1dGKHtUILB1KRuFZaR0N7
 xMtyE9qMRWHT/VVtNl5aZsyBgu0y5WglLIMYDCLhj7rVxj3XF+yC5fbmAfWzdbCBMpRZ5sUvleh
 OzdYQ71o7MR/3fkN3kA==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a95adba cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JLRh7K5kIuGMceoZOjoA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MyBTYWx0ZWRfXxcsghyVzCPGX
 1HlE4EJgTtwSOyMAHknPf8bFQDokIfS0DwgfQEZqJxYzHQxLq3ixSI1YP/FNuGUa5moYi6MLfvw
 268esSwQEaHUFyvn2Fh6oHYeovLNS80=
X-Proofpoint-GUID: eo5ghhZRCki5rnOMNh3SlXzSIdIEZt3h
X-Proofpoint-ORIG-GUID: eo5ghhZRCki5rnOMNh3SlXzSIdIEZt3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310143

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> There are no properties in DTS or Linux drivers called
> "core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
> wanted "-supply" properties instead.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

FWIW downstream only seems to have the PHY/PLL supplies for 8998
(or VDDIO and VCCA for 96). I don't know if the TX block needs any
power other than the on-SoC power domains

Konrad
