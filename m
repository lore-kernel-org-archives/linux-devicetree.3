Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F73A3E96
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750932; cv=none; b=unZT4zfHp58Z7QTPwH2xQhA5T5qqHBNIOFajv5QYx/L8mShEVYoJaTEaU/7zUYoUGEzHYh4fyq5K01D9jVbAHJk6+RRRqXr29IkkzSkx/ym7Kot+pfrKqsqPdo+ap/TcwZHg0/bWf9KTGqt5AzbF8+DXW2SLLm33ZHZ+Ua7CE7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750932; c=relaxed/simple;
	bh=eb9GI3Ik7tKkTtsi+hd+WYKwmb9P4O3AFMHxum3Lw9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nJ1CUkB0Bjms9SAvsI3GImcwMQuF+XxFx9fRgHiP1xyxInxaNINn1ui/2ydxFKUwpCsAv2u8fn+YmLzV+y6ORDIFbOC07usW51adn4VUqZTbIxHIMYO/kxeDLA3nzhzx6ZUg7dc4fZ0sOfmp6sql/jgssyiSr7qYYAzf7FbmK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKoJQpi7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVFPycKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKoJQpi7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVFPycKL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9JrF82524346
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JZdaKTAzggE+dJA6GpUXOyxK
	2DDdS9Y3B1CJJnVdArQ=; b=AKoJQpi7pC883APWeeBtFtrD7+wxf1Ww7N6xAOkx
	D9qinPZ1C6JUi+P2cH75/flvdIojK80NG01uK23AxNZTwuHk0tEVbH/17EYgWFUM
	/9psiQtFHN3Zx4E8fs+UO7MiKhQIqwdGbqIeE0xPw0BYUCHuQsLxVO33PmuwUdLO
	52BwXvkgAcMMO+mPsjOfqChDntoSvrB3x3rdhEBSRiNojnucUr9T/tNu7rx/SPXb
	rBO4coJmCRzGCTaflf5qs7mph7R2vvT/oiruVVshJ6s2Vd77l1nFYhAmDSqQg1kJ
	YY0LQtBxmL0Izlt8EQITYRudSns1YaUYLz04aTAXvsYvZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjk94x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 09:28:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fba8d8c40so64888321cf.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778750929; x=1779355729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZdaKTAzggE+dJA6GpUXOyxK2DDdS9Y3B1CJJnVdArQ=;
        b=kVFPycKL9F/K6bMNFkWHW5xcnC52wa+p4yDL2FD1WEnwFbBfS4ssQSbcD0QTc6e4dr
         yg8YzBgRWktI04ua5EEEtytUUjYPRE9HksxILVXB49Yr6VmKT1YU3WDcv3n6tcOXlwcz
         Jwz2P3eqJr6Sf2i/JiaiZaBKIer3eq9qn+Dmh9pCz79gGDVX9unkwGpM8yEYcrKa2Q8h
         A+TfHD9unD6sDy0WMPOgGY5GffjQDbhBOzHJh1N3utzN7qg5Jq7+lj9MdZkQTd4hg8le
         dCjBTdA6fTpg0eqvU/5DtOGbKCNYecOBnNMKjVZojIbknStD81i57/qzvznN4yCWbN3O
         tq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750929; x=1779355729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZdaKTAzggE+dJA6GpUXOyxK2DDdS9Y3B1CJJnVdArQ=;
        b=XMDP80C0SJNN6mukUvBB+5AXLUwvQKwd7Py/ckIZaGNuxAd0ooVM96XwCvu24ZUrqo
         5lp433aQheO1uWQ/y5wSLOnEzt5jxYto7ICoNinggwnlHcJ0MKcOGWU8QisnpihZMZuV
         qaQzzRyXk2OaPdBAnrrUy5xH83hQ86NOEurlPDngkZuUf1yUOEkPaboueENXxv2uBeNn
         HLR5M1W9USKPoQRmkDirOpM3tVeyf3nlINIPjPljECOgtKGR+oeatSZ1RWEXuL7b1sqk
         4of+wWCZ24I2OZICU+5JT6ID6JHhikziN/9k7r1R7bk/pxQgLiAhKXpRR210kK+tX+LB
         fnCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FPvjJdLvgtL1Z6vDpXjLw27EQJqVExJvy0+XrIbNPiQEr9aj62Er7NNDeEkKqCgih2QEatJzX8zZg@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkaXDNM0546u1T6hOuaBD34/k6yVFR6hHlcuZjkJAD0f03a82
	HhYthzgqhU6uVXHe4zkFjC2gQKyHsMlhLwyxcqQxxoSfiOtLQDV1Ugc7Kp8+X0rtriNdY7xFxKS
	JQDgyrH0R5ln1J6GKmIi+ol9WVOevW0i+h3QbpQcQ93GnkaOtO6cGvym6NMtQ3rWktB4szSdD
X-Gm-Gg: Acq92OE6ZCxMmqpLFPk7tzxbuUVz2nsFbZ9IXwAxUSLHkSZSMgHgCecc1/At7b0+wnm
	LrWYROpWlOzgGl220ylkwjFrXeAvQyRHHMFMscB6qAD0vfD9fnx2Y3zlXT6cBPI24hcMMlZionZ
	5qj/s47S0gjbeprddFAsOOktLB/CXKuBvZM06Vnel6QGnanzEw9t1gYZInWE/3NGgP+Q518yoSo
	WnHYNXjAZErshOYm+r6ec2g4TudUiDkOao7Q30I5+YIr+hPPoA8aKlb3rcos7OzdZU4c8NwTSRO
	viuz0oJb6Xha0CCzY9H1IiNedFLkiX2/+eS85cxZ62TsxjwnOBryQs7oYy4KjK9Yvytx6K0N8Ts
	wDBXg+PZzAw/oGbvQcTHPVjvPjSPdqMARDci1K9N2/VWICCKhuNS/ZJ+ye4iFv0GVLStyhA+vo+
	oBZ6gcMarb/Sk5A/hnJSxShql9WylYk7RztDs=
X-Received: by 2002:a05:622a:3ca:b0:50b:4946:2781 with SMTP id d75a77b69052e-5162f5a3c6emr93345531cf.38.1778750928838;
        Thu, 14 May 2026 02:28:48 -0700 (PDT)
X-Received: by 2002:a05:622a:3ca:b0:50b:4946:2781 with SMTP id d75a77b69052e-5162f5a3c6emr93345391cf.38.1778750928411;
        Thu, 14 May 2026 02:28:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc518sm361532e87.39.2026.05.14.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:28:46 -0700 (PDT)
Date: Thu, 14 May 2026 12:28:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
        robh@kernel.org
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
Message-ID: <pfvh4kxhrorhykdhzackmn572wfqbeawdusn2qegsugueblagu@a3wf4pmozztx>
References: <20260513-iris-sc8280xp-v6-3-0d11d90d3e26@oss.qualcomm.com>
 <20260514045715.E22CCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514045715.E22CCC2BCB7@smtp.kernel.org>
X-Proofpoint-GUID: vpjSG64n-XCPNPI85NsUcMWhQShqXFn6
X-Proofpoint-ORIG-GUID: vpjSG64n-XCPNPI85NsUcMWhQShqXFn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA5MiBTYWx0ZWRfX7uk6kMWqXHAT
 9sbfb36sBxbzThSdJeP9xUSqlWohUoCfpRkB/XUvn2daZIOj4dOZQYHt1gmI90S90QdocEVU35m
 pN8Wg7Xfj1/ULNwvTCt7M9tWDEv+bBIiboU1kwEZ4g5rt8wtGy+wKKgwNUq1/NFZ7/7e9rMIW8A
 6DWnfvSoFYfSiu2yQEp2oSXZJxz1h/j4aj1phe4s5Ck+8fOHx9p4+q0BLvTD2UmSVw3EAZElWkf
 q7Y0QsAcL0Yepby0kFdwq6zvRcFnnyX+Me3U9+4o79BP1dAOBuC5t1VEnt/6YjxQLZhdUsB6Uy5
 sfIfcxwXvnTq1zefRYqtunLMEWlGzazgKAlzbz5y8NKdDshgcghLOUytSxIWFUU0eKlmcb+8gKn
 y9O4kmsh+4J70lHV0IVZorDqgOLAg1LWG9EAvFopwniLQVKupezz9bk+qesM574y+GQLoLIuKuO
 WlT8MhIVsiC7hKdkRng==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a0595d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CKH5FQq_NqdB-pMRBGYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140092

On Thu, May 14, 2026 at 04:57:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The Venus/Iris driver ignores the `mmcx` power domain, failing to vote for its performance states which will cause MMCX under-voltage and AXI bus hangs at high clock speeds.
> - [Low] The `power-domains` property in the `video-codec` node has 4 items, but the YAML binding `qcom,sm8250-venus.yaml` restricts it to a maximum of 3 items.
> - [Low] The reserved memory node name 'pil_video_region@86700000' uses underscores instead of hyphens.
> --
> 
> commit 436af127f4d0421fee1976f98a2eab9818c98aa4
> Author: Konrad Dybcio <konradybcio@kernel.org>
> 
> arm64: dts: qcom: sc8280xp: Add Iris core
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> [ ... ]
> @@ -691,6 +694,11 @@ reserved-region@85b00000 {
>  			no-map;
>  		};
>  
> > +		pil_video_mem: pil_video_region@86700000 {
> > +			reg = <0 0x86700000 0 0x500000>;
> > +			no-map;
> > +		};
> > +
> 
> This isn't a bug, but device tree conventions expect node names to use hyphens
> instead of underscores. Should pil_video_region@86700000 be renamed to
> pil-video-region@86700000 to avoid dtc W=1 warnings?

Indeed, I'll fix it.

> 
> [ ... ]
> @@ -4181,6 +4189,97 @@ usb_1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> > +		iris: video-codec@aa00000 {
> > +			compatible = "qcom,sc8280xp-iris", "qcom,sm8250-venus";
> > +			reg = <0x0 0x0aa00000 0x0 0x100000>;
> > +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> [ ... ]
> > +			power-domains = <&videocc MVS0C_GDSC>,
> > +					<&videocc MVS0_GDSC>,
> > +					<&rpmhpd SC8280XP_MX>,
> > +					<&rpmhpd SC8280XP_MMCX>;
> > +			power-domain-names = "venus",
> > +					     "vcodec0",
> > +					     "mx",
> > +					     "mmcx";
> 
> Does the YAML binding for qcom,sm8250-venus support 4 power domains?

This is handled by the series at [1], which is now merged into
media-committers tree (and pending for next).

[1] https://lore.kernel.org/linux-arm-msm/20260209-iris-venus-fix-sm8250-v5-1-0a22365d3585@oss.qualcomm.com/

> 
> Without adding a conditional block for qcom,sc8280xp-iris, won't this fail
> dtbs_check since the fallback schema restricts power-domains to a maximum
> of 3 items (venus, vcodec0, mx)?
> 
> Additionally, since this falls back to qcom,sm8250-venus, will the Venus
> driver properly attach and vote for the mmcx power domain?
> 
> The video codec driver using sm8250 data explicitly defines only mx as the
> OPP power domain. As a result, devm_pm_domain_attach_list() might only
> attach mx and ignore mmcx.
> 
> If mmcx is ignored by the driver, won't it remain permanently at the lowest
> statically configured state? When the codec dynamically scales to higher
> frequencies (e.g., 560MHz) requiring turbo_l1 for mmcx, could this lead to
> hardware under-voltage and AXI bus lockups?

-- 
With best wishes
Dmitry
