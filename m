Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BE39EF14
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652258; cv=none; b=KQ+IHKlxW32BM4McxmjqKw/VUwKMN98TqHa9YSIIPfDSaBAoyz/dXYU2o5kO0DfB+sWFkYVUBhZGAh4EE/DFVLRZ6OplpmEudnlzr05kB6K1epo10Uzbe+8QERB1xCCcADH9CnyC2MH5BY9uifiyX5QPfrjJBc4ypXnsZTgD1fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652258; c=relaxed/simple;
	bh=mWr3INx56v17cs1bsy22XJTVS9xOy8x4DDFWsqgvvy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9H1OmNmVz76lJDTuPoHU/duK1J4yFR7jiSv1ER/dR2yfN/qZiVmk9inZvFmCLg9DbShqSHu22oeZrfxYIU+VJO1zf8vydMoBdI2ArWs+8AtmLIkwNVixBixQnYIvbxohpYknG5lE6DZ+We1lSDJ1J1yXVwN2EGaLDNyFFDLv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXbgFEkx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alTGfJXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXbgFEkx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alTGfJXC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfpoF3821898
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZD0T2UGNWyjaocuRVZIPGls5
	8uRnomBelAEtEdMD7Bc=; b=LXbgFEkxwdptNZ5NlStNkQVeG0+zkErpr7g1hdkh
	D5YSMubcjdDfNB2k4oooVFglvcGyuA7HaqsNk1hjQixBz2lZCbhRDf2PLxMI4jpf
	z7+P5+ZfVj3TbHR/vergFA3xy/CJS2ihzmUAxo4zAuClCwaONq1AqOci9KaZ1+4Y
	s6LPMx52rifD6nq8vB3wR1k7FAi6/dQD7Yv4TzOs0BFHXjB3krKvyoSk2Zx9UnZx
	DD2aDOo+Gf2yRDpfuoZrmRI2gan1V28z+jvMF9zBDgwEprFeDgBdeUjbGIRq6ide
	BozXbP3Eij4f2Qzvs5845yHX7x1nPjcYB6boetdcxp/qOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d61m7070d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 22:57:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4fe4ff7bso119274591cf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774652256; x=1775257056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZD0T2UGNWyjaocuRVZIPGls58uRnomBelAEtEdMD7Bc=;
        b=alTGfJXCcCF6Qew9FoOhx2yjayV80prsU7wOwmJs3rwMdoUF3MuHlhrzWWTMkRyH56
         3xXEwSWYdIMSbpERHNrzj+y6GQlWjD/OobhGnrSLpa6Xu1+J8ttbqCWzWJ2go+nQ1ygj
         ZXemoNYjoHxvUxW+odh+9g6tEVCSavaqCwmERUoSp+LqJgB13ECWvQXZGJhQ62F+gRmk
         TVnZknis03BRBtoisboAWtpo/iJ/AhqY1ASsRy4Sw9WYjbeSvNrrYGYqbK7k3hvay8+3
         nFZ/yZZHM9Wk5MwqSaurMnHMtC/SQ83V+ZI/6yPZ6yCWey6yw+lvkO6d0Khg9r/EUox1
         JIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774652256; x=1775257056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZD0T2UGNWyjaocuRVZIPGls58uRnomBelAEtEdMD7Bc=;
        b=hTN3ZtfpTsej4wgEyEMKPQyZU/Fhfaoj0z6Yn3QMTKBGIakHQ9OqqUCNcBWFmV891q
         XUUCwu3t957XgkD48w9aKwovHTluxhCR9DMBaCkBPkmcgizr0p0OLY4Mmp/RvZI8essj
         TOgEY+mFPaivFeuYfZRvNjUryJdSuHSFzmjO3r3UylX26i+0IlBnofMEwssdUWfjbjFV
         QK7uhOPhjCrgJIkxvsROF0zCKZiNZTIGbd2kmTjeQjqsRjqDn0mEHAUgdRRefpvNuAzH
         tVPagIvaAPPDaE5Wq/thJ+mWmn9xl8w5sxE6dgrFq6u46hnm00mbRyN+asZOJYRPo0SF
         Amjw==
X-Forwarded-Encrypted: i=1; AJvYcCUV9i0bsLTzmBCgBpBARM09FrmVgN1eb8W1PNGkD5aO6cyFtAf/bIc0FOiIg/ZsQRw92s8OsNxtexDo@vger.kernel.org
X-Gm-Message-State: AOJu0YztfEeELrdHeMDmbPpLIKaSK+OK/sHZxA+iXOx51BgQJRO9vnQR
	xF1fSuUDbMjIuJiy45moB9QtA8014wZDWcdiUF9zn+AAWZGrwnDDXPINkR0TjsnHwPn2Sv/CYqt
	zB6Ln/lupxJ3QeAQi7LzAncpQGlx6l3XsWboknniNAaTQNzF/c9XyWtiAD5UxDe1u
X-Gm-Gg: ATEYQzyNn4vgf4RHJkBxLMqJZ0it7kjM6opmfMVKQ9gOo7L/IvBzlnfIvi99EgFLB97
	Ru6Dzv7WskX7Y2nni4U7fxKOEEOsd0Qbh8B5U1HFh0wJgHYP9E1gZF+z9Q2j/38+AHT0n9/b5VZ
	oRk4Sou9Rhe+cRWwjxZtyZHk+ZbiLRGIIb09PbFXsTp8SU4X9UjAEIIBXT6V5pRpVoOMrELwVn/
	2cHfuiWJ6dzcj6Gb5xfUrAhMBg8p9pynAHM5IHeo+QUkXsL0/ByfKQUijFTxNaGkqNnD6AG3ItK
	KZzz8MJzUL0qPVl8BOUV0C1cqzYe2ff6FWtXButPxRIypLb/WOBD2GEQxqHu+IIuPhhFNvV1VsF
	1AosxBM9FmJxyEdXadLz8dGbCmmLIpHRlXNCace+d0gHds7oS5fdSx/nYT+yHuHllBZ8J1WQ9jI
	jgwnmh79I/puzFndga3L9ozuBZy2JB7a8JDNw=
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr91618541cf.10.1774652255712;
        Fri, 27 Mar 2026 15:57:35 -0700 (PDT)
X-Received: by 2002:ac8:5992:0:b0:50b:46ee:5aed with SMTP id d75a77b69052e-50b993c6a6fmr91618261cf.10.1774652255243;
        Fri, 27 Mar 2026 15:57:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140a4desm70884e87.33.2026.03.27.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:57:33 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MSBTYWx0ZWRfX98jFe36Cdj+O
 VP2chgZ4B9Mkv01xnXCNdTjSEE1Oc8TemHhRNdc3HbD1gaTDfzyulvMVgQZ+4uz6wmS3LZHp225
 utoRSGc71A/08xMBDTO0ZBtN3fecF5GLUrIF3fQsgwRs6fSBpdMVu02+Taj/zWfwxe09hvGAFOZ
 ven9Epjj9diFQ387FRklLOM1wnrJmadjiRqff/zfS0gh4Jdigjo9AoxgpH/o2KQX3ZRhBN5bXQB
 ntd/xqm+GS6xVuum4OlyjuVQ/30CavLMz/4uZ4HW9GcoNaYCnvyygKQUI0aYRtB4MoYmVknuM4n
 M64Bbl90EAx7dn0E7LeeyL7aH9d3TpGrepeGY9CsIj4Ehy3zP8r6vCfBgMLmlsDJEqivoYeckDz
 +34jZ8UwewZbtasYlA/d8WxywAcTciNdX7gyHzbf1SgX2Wh8VL0IAvDtH3tMAe24TX7rOcclurz
 4mqA2oyglGah6Af6UOw==
X-Proofpoint-ORIG-GUID: _eihRvNr-bT5VfJ1u9V56ERTFjsRZoi7
X-Authority-Analysis: v=2.4 cv=aoC/yCZV c=1 sm=1 tr=0 ts=69c70b60 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=ER6jexHYGgKHINCZH0oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: _eihRvNr-bT5VfJ1u9V56ERTFjsRZoi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270161

On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
