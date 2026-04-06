Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644C1C84CB
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 00:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437126; cv=none; b=IJiXLk2wkjh4D0DrmbRvWPLMF9rSYf0WUdk8a6afCCmQGhBe1FAjRD5uQO2Ax5RKZSYroGzSlngVWu4jasE7Pq67dfwTM/lf8+ivBVDuwPjphqBkOfEl+nB/yic2lNe8qKjQyvny5wb9vCt2EyP6gUhtpdS1X2aeOzV3eCo6Vx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437126; c=relaxed/simple;
	bh=U69NL3KlUJycu99EStF2wXR52dcBIx4LneC9N3tjWxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWuypnJLP2cW7HOXPlzMfMoEvstlKdM6nvfUEtPJQ51q5W5YPGGjWQ4pYfQ0eyBTyNEFEDmt0HgpSM4DH0d2ketM+/kNsYx9lgiyyfV2Du7X76tjI8ttjHRHj9fmq6ooGAGs6a1hPnVdUlagZF7FJNu5DT5bPhdvpgy/I4kOPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oraVGmkq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QaVP/PLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oraVGmkq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QaVP/PLF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635EOX9o4094879
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 00:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=plykkzu89dtG38Upzg/y2TNU
	tXJmjdeCCRcfnkKEyGA=; b=oraVGmkqRj/TEC1Zfqb1y2uMv30guNpqZmXRksJd
	sm4aGZbJoiYFVrq/1jnX4OaBsy9yGh3z9bJ0aG6UT+dNKDRC0eoHW9Ip9zplgnrq
	nuO3mSKBwgA47J9fvcwDNPYB5lYxA38Mg8cBTx+s7TpYB6XMulYEGL3TU0woN+WA
	eOI4jYZzrGNjQvlPlmLwbdbQXl2KT3qW27nGWF8wxBrfju93+PHqBO3khGtWwRkm
	jN+jEQUNQme1CfK/M4i/nvzf/CH6KDlwcpe6NqkiNWVmaKpGzYkKPUPQXk8Pi4iv
	3nAGmXByB7dNrEO9HlAtulpdtUEan8BNWf2Pwb9iv20FxA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfkgqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:58:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093a985e21so99941311cf.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 17:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437124; x=1776041924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=plykkzu89dtG38Upzg/y2TNUtXJmjdeCCRcfnkKEyGA=;
        b=QaVP/PLF9tZ8rpbjn0eu+LHKzRiI3NJNAbEvC9Wr6ZFSHRtFaLs2HbWA//gksam16p
         TkJPrPBgwjRjTETV6t6jBehaPt5dgpbNE0wbYqui/Zva0xpS15/O89/K7uSN28Xwbobl
         aFYQPji7bKLk1SnZG9gu4vOcCKWLvVpQWre2l35H85nqfVLoRGIL7rjGuOBtiMRCJEV2
         5DWN3ZoahWId33UxCCKrypQwIAOQmud9kXMw+Ii9vAD4bmIvvg52FCrMWZbenm1DQ/yG
         12sqJg7hmclMaQ390k6wgM+5KuNC3SXDfRwpD8sL9Nk3APViQLvlghuxJIKrw7un4YwW
         SPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437124; x=1776041924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plykkzu89dtG38Upzg/y2TNUtXJmjdeCCRcfnkKEyGA=;
        b=pntZcDbPk48Schmv2RvHRYT8zPbdnVMGfHkgPugYKgV2CCV39xKXMFzlXmMAAMYd6g
         ZygOFTvO1gqUGk4WD+tIC9JqKA0aMxVupgKC/Gg7o5Zpqpn4ScKbEi/x+g+wkiObRHeX
         LcffTzbXM0N4MBrGuvxZyjjbLUdU7hJvsKkkSsCxhRo/FHM5FjJvFTkRS0Ubtk+Dy8EH
         n5sHC0PBAtkzTPd2rm256gmoa++vcOVJTcOYzQZ+F6pLxP3/PaGGoMTMaUPEb3Zh3zhq
         hSlq5bzS2FSBIHB3WdjKumEx04vzyGBkczggy1snXidsAqPXsmAyJgP9cbpEkJNhrlYk
         WVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8iFVyqE2Xsq4A6r18sS+gTI842mVX6mQmPuz2kuZAxm0Y6iw8n2bhWvcQy2vYCH/A2/h5StH+vnU@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRUBWLl5nSCmudxkcIYVekoPP885JF+EsQK3JV7MzkA0BMwSU
	w9Sev+DH93cHnvWO3Jq8dmW/4loefs0jEBI4KH75WNDerliZKUBRdPDk3cI6+EOKweh7z+13iT1
	T/jduuNu0FBRCn8KxXJ4ytclTb7vc4OgKNUE9XqjGEIFbvi6FrM2ZSSmRC4HJxViu
X-Gm-Gg: AeBDietrcCGkUWtFYrm21/Tmp266ltBq1BHnAVcr/m9DO/0lp0xeBPsH2zX07tLR0jU
	ToTJW708U7TJCmLmjAMT5n/oskOLNGXV2c5MbgS/mv1XXONidqdqSJk/w2/PMFPxoconA0GGquO
	/FG5Q20C0KoyE86R2JUnw6qaj2eHrG9wgRCufdr2EUCfavRKyelPstYLyGgt7CrkhiLZVzPBdL3
	Sc9IqS3dL7aLeXgpO07UrxjKE9VC6ifuDdXAPn1OcFC6JY1M6KwuvesfgsywR802inhFKnMscdi
	PkehFT0UbuxqtM+LrF5Jahj8Z99VlRWg2lhj91+itoIXiwKiONZQ1zgsBQI0e7VQJBx8EEvxMGR
	OsT4kkcmukPc4Wjkqsa9fn6wsSbWxNoBA6nIWHhXMgnnbriS7ZJ/Eq+Bqplvbf+nZrdNnn+kBI7
	2wFV/58XgtTfzle4Ww4OlihYxhF7uB61LQCV8=
X-Received: by 2002:a05:622a:5a0f:b0:50d:8656:3e60 with SMTP id d75a77b69052e-50d865643a3mr60606811cf.50.1775437123918;
        Sun, 05 Apr 2026 17:58:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0f:b0:50d:8656:3e60 with SMTP id d75a77b69052e-50d865643a3mr60606501cf.50.1775437123405;
        Sun, 05 Apr 2026 17:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdfe5csm26751851fa.15.2026.04.05.17.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:58:41 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:58:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: dp-controller: Allow
 DAI on SM8650 and others
Message-ID: <obnn4673iq7xdynuitngag35o7he3ogfegxwx33hnvlzhubjsm@5v3sr6euwrpr>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfXwk9o1N69bmpy
 qUScSsUR8EXbpVMALyv3MmG8/UP67ERvHnWWU1GUbbENd/cB/kSkcpYAHn2BNdxYyEcMEgxxJVK
 T9ff9Yphnug8iezLMrZ89ATOsE7fwh/WIG/rrHGGwcfLgfVeLURJ9rIIpRGCqiatdRQeUfhHeSl
 dAeDxs7e7i9u4skWLK7uGskmTnV9RtvMN1O9Xfj12ABOHStOmjAXLnWc75OofjUr6H1R48pdgAY
 pbhuN7u3BrrjKIOTW52gTiHXTJgf02ATkGxdNKM1GqzasX6SfOD4wAQ1aNoGVf+bGMIz9WoFYgO
 xwx1C6Q06C8y9/2zcpYyLx6vo38qQQIKe6UgrAPn//W12FYXdhX69IOzJdHNsrvU/EdHAZhq5jd
 XZ4lkGnbIXr66S6AVpSNtNmjt8ju4crBgBBmoeZpAJE/b1hl/LeN/0CbwnEzF4nGj/ibSMqIWUz
 vLW6CWMlACUP8QkMB7Q==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d30544 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Ul4Vrl7rK0zFZ15zA1kA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yKMo7S1VgW7YMUg3cHdWmxCovz0NakVO
X-Proofpoint-GUID: yKMo7S1VgW7YMUg3cHdWmxCovz0NakVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007

On Sun, Apr 05, 2026 at 04:33:58PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort on Qualcomm SoCs like SM8650 and compatible SM8750 supports
> audio and there is already DTS having cells and sound-name-prefix.  The
> "else:" clause for non-EDP and non-aux-bus cases already requires
> '#sound-dai-cells', so it should actually reference the dai-common.yaml
> for other properties, as pointed out by dtbs_check warnings like:
> 
>   sm8650-hdk-display-card-rear-camera-card.dtb:
>     displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add dai-common.yaml reference (Dmitry)
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
