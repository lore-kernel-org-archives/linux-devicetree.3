Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF23366DB5
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251042; cv=none; b=rW/VbG34OzcfccC4DGd88vqbrgbXNKHy3gZOGXd67i3J1sLl+XgVV5YhzaWHLEwCrYP2iBwVV2xxj0sra2mld+PoQP07Hk3uGzzfht3bhGHCgfGNmEVMYZYl3rTtTdf1pJOo/glrKq5SmZ77liaXnvCJnshlUXhRF8t7ef2+4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251042; c=relaxed/simple;
	bh=r178vsKwvgyqUHd4xJpDzrxyGb4ZvsUOAqi6mLxfCRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzkV9xadTLYF9ufc1aLSXuQamZaIWrYQh9yWEiHkhTUdE3Bp3M54mv3iFhJOF8yunjR8Bey5HBeOlnhdC2nrOZxxwrTWQZ/ZpHJe3YKU/6K0fU1yfuSOcjXEs7pU9VqwWqIigIY9zVV5FYZTXm34hqh4XOwpDT1Ukjx48sbTrv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=keyxsWPI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ir8+80M3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="keyxsWPI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ir8+80M3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3C6PF2534717
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jOQo7atp0PkKhTHTvYjSenGu
	Cfs6kxtscFTLtljYI+U=; b=keyxsWPIEkauKEmZPfLb2SNcuo/U9LQqi18ufS66
	zSqtUZL0btXBrdAVlBeJxPIaek+bFswen3fvqHRmTXIEsCwe+9eMrFj02/EpNwe6
	ldtWQI+FfyF1ZHQognU8BJ7X8p6RPL2NUhbkFxCzsJTpmF5/OT5btFwnl06Cior/
	T60YA+gBRgYFpqNS5OAJLv6fqjc4VyZzu+92X4jp/A6kNaxqjRufhcqOoBUyf2L9
	y3/fBpE7p1nOQEWlyqKewSB7iXvnPOUF2/q/TOx+EWBZfWO1207E1HdasTPQcJrB
	ezyj/MyJ53W2c3PO76f9k4RnUmYXeUxsHTKAIXro/j2/9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er76eh5pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:57:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so12500861cf.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781251038; x=1781855838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=Ir8+80M3trkpHPTaOeED2hvQva5PbrgaUDr/rxpHF64mWrbCA2sS3NwaA6guNjHY07
         bNYJu87zohmqnrdXNw00rd0ivQaPbB/4HJqhXPOXEXN5UEnOOqmXGysCCrFMniIYgg/I
         IGDZkIlpeSl/SHlfLuhiHYDPa/Gmw4fXjewwnw+hYfH1XjE070AO8kZ2iI2Y6pAVU5Sp
         iBcuv2L3RdmovGkWlaU1AF9gfALW+eHR6LRHrDWdfld/aqQ78BgXaeO6GSgOQ0MFzHmw
         e78GTuuzOJ+DdKXyd3JURSRWqXpvyWsRBGNxjPwZNfWOI8DjzMOwfG+VehD/4JmuQHzI
         2auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251038; x=1781855838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOQo7atp0PkKhTHTvYjSenGuCfs6kxtscFTLtljYI+U=;
        b=ekkYWDBMClnFHkGcsvtPvSXx0MXuzVm9pzZnRz8t5vMd7z8TUopBVbywfK/alKBeq7
         OwTXFyL/RsJnyJSDk7RLVvRXJxCQ0QkqNA2sbjyutoiLpfCKEtHuAuPjGB49QtnvP4OO
         oY4gpZ5S85b+s8T3HS9k4soi2v9j+lepvEMJASKO2TyscJpvm7jcko5w6CrYTrxhA3bD
         R2MILRW5V2fU+fI1fdyhlw5w8Gtlt2r+biiVNdLI6MkLaZdwButqc/owmf2iwaAuL4Cn
         zvp24vC3kYRa5xRSkaiolrZMpjbE+ypHg5zuXHMN7uDvSIBKFnPswXHZysVXBL0SAcrU
         M2dg==
X-Forwarded-Encrypted: i=1; AFNElJ8BFDCO68U5IyZB8ZBoULKGapfkxfU0KFp1VPtQE4sMAVYnYalDbEiF/LNu6lJ3OKj86iU26eR11s4X@vger.kernel.org
X-Gm-Message-State: AOJu0YzbC7f/xVo9486+Q/meUn/rZmHt21PyRzNqqdf2EK/rDY8cCLlu
	WjJVZptwuumz6faQXnGkGBm1Ex+MN41Ovjxrdqgyeh1Z/0CjUU6nYL5aWUGD3IV2vJMZQNzdLeQ
	0l56M/rZQ8GreHsLSifx5mCFh5bkX+CrRnI7l5FgpSoPdjydqRuqF79IFeDEGcZWA
X-Gm-Gg: Acq92OFEwyCRHwAGeryK1g7pYVgcv5R+LKmCpw5PqN13o6GrEavU69NMNDkqMWIGcXh
	WkYYBaUAo3j2i8axGWCyfjzIpK5OSb9IeynPU2b/OtDHDe3U2r7YbwOBtNqr9miwUS6RIQ0TRTp
	5dzMRyYvCW0Sn8uJLYNoy6qpyTlnE00W2AF7bEMMBVS6oHytqIRs3JixkgEc/voyEtecmNvba5S
	FgCYiI2MEzOz5MrIVjXe2BqA1RwakfGAJBLadM6Lz8X/gGj0jYzxXGecY97i+IQeyQ7yQ1TNLQf
	i9qbjtCVQSh8UWfrpQcd1Gk4QJvW5mWoa6wXwpMs/y6K+yp8+9aEaIO+MYQIi1SriRflWl684Nq
	PiI/PH3jVu++XFdVivtMdqZEeesAbIzh1/lijQCCeTD6ss9Ax62Wl8IcVKS2iiRcm6SZGxLseaN
	TEyb3nf3v/5WnypYjOSA3ALquO14uxNuXDG/w=
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21287141cf.48.1781251038456;
        Fri, 12 Jun 2026 00:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:164f:b0:516:e39a:8540 with SMTP id d75a77b69052e-517fe53afb6mr21286871cf.48.1781251037972;
        Fri, 12 Jun 2026 00:57:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f52sm321429e87.6.2026.06.12.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:57:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:57:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Message-ID: <tkgqorjdnvwcx4ddgi5m7j3g6wlawxnm5ugty6y33ftwxzbvv5@uxcai2sgglfs>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
X-Authority-Analysis: v=2.4 cv=O94Jeh9W c=1 sm=1 tr=0 ts=6a2bbbdf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=f_qOLs0Lkya9IhinK5kA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UKpZxILrahhtWzR2kXVRmCEUwU2hJ6xa
X-Proofpoint-GUID: UKpZxILrahhtWzR2kXVRmCEUwU2hJ6xa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX/T915CD0QA67
 0qDGsoSyxi30IW0HcR8jMCje6PE6+0IK2BJPc7eok8HwekaKL/iu6zwMzZ5jDG39Ng/QQqjtOct
 mL8LjNgFf/M+Sx71nScAB71+kP+C7mZtttPdgWCxnmfuN7TnDGo2XVFshJQgVoxKJof6PWaLqsc
 9hKGWqcyi9X7ksSbffS4STM2yOWTdY//aKncwhMrgetWlWuQFQ6dBx7XR7WdWKpAq1VnamuqE8H
 Li7Ynn3Lcw5cJOOIWaB3LR582ZugtGIRCo0/aqn0Pls0yGchTDDf1VN2f48izf5AersMxHAqg5K
 pqLn7O+d1LY8kVbPk5+Pd+0IxIGjzKYERSaHo1DHTtteOSwovnZUU+0Y0G2LQA73y5EJ2NwD1kk
 Q8JEqON0xESM7SMgJrCQzPg/vq9e5pPq+BeGWZacRjq3Syuu4x9I+E5ske6YyqhUDoPIF653hAF
 9JdpzYFl0dopFvE65tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX2XtS5+5ZrILp
 V7BY2y7LTFnJtA9tJySb9y5NAy0LhrXU3K8KqnzM/Vu0SSlu1nQ71N5N26tSlxQZyXA9UsnmIGb
 mY4b85FFv4sfm6agML+UgeTw5oXsAGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120070

On Wed, Jun 10, 2026 at 09:41:47AM +0200, Neil Armstrong wrote:
> Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
> is incompatible with the default SM8650 generic sound card.

Incompatible, how?

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..508d1445bf21 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  	};
>  
>  	sound {
> -		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
> +		compatible = "ayaneo,pocket-s2-sndcard";
>  		model = "SM8650-APS2";
>  		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>  				"SpkrRight IN", "WSA_SPK2 OUT",
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
