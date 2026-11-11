Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420805;
	b=dxDM3BRuIO6IFJuuNhnlsfVtPAOMllyRMcH9+xZlOVyqt6NZ9wGBbdOJE0qoZuNGJWS2
	 q7JV0c9AZgNLIW01EXdcBK7ZU7Wdd8fkKi6xWx2EE2pt99I1Kcb5P2OTaJDUw7Mm0HSZl
	 g9/alhQvryiza808Nn5i9Re3rVthKC219HrcgctqahDbFzidiHh/ubtaG/2Q9hLgW1aIV
	 RJWa5P+FB3/Ihf+cdw9ORTJMvdyxWTrckZn8ifiYfE2IO+x38ZLkqwwLr0WX8eLeL57KD
	 CmY5e31U+/Q5pQyAaRbcmnmSCqj6UGSnFd3PzvMBqQ8oQTGJ3GZP3sLv3C2pIIZhB8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
	b=B2Pd9eggEn7Qibf5eKfZdL695GMiXCqtHLes3gxIQ0PoybkJG8VZJvHkM03qt92HxGC6
	 8ZCYRJILHsu02a4u7QA547QwC4uz9RAU0jbuK0VtzX3ZXOz+4PVqfd1DhqRtlsq0NMmPn
	 ozPPhLV/EKnwrOGoOZOXTvGwC7wgpejg0GBCF0Nk8YTUJBMoaPHUrtiOX5neOZscJj4rV
	 ORhbmI6ri76SlvgVs5SEtU4bqm2kr0XzuuffyjzeEizHyhnU1Iq0NeCBo55puUOr6tzEs
	 opdhUsA/IgnjX6Wm5M8ZSzpzHgfyfQnQfBpsDrO+fPGVTyTyByxaAI8/ZDw0jGc6UyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F860606A886
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F860606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtSAL2980854
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqwMgBBAIrIccsbaUs5qyWO3
	n3mmYzB8oRH1B9/XhhQ=; b=RgGAo6g7+T2CoN3qbu6ujPRQjGYF1EHQpIdnGAon
	UEDJ2xDBUmAp3zWPanKfxrYudMNGirThmjc8tUs6PVEiW/esgH1KUaeECz3CN4wh
	1oBhS5WHbfBLAle0TBgUTh8tV2RvDhAyqY7wskTOvEPOTq2Zh/RoyIO/haPNoB09
	Kl9B2obGL8k9BKH4uchwjUWdQ3lt54SHzQx3V8WtGXevYremtxO/C6fGKb9mLSS0
	pIdqwlkUT5uA1zLOSKl+jeRqkkhIGAjHNa8f19t4qaFQ3n5ReLTYppKIIZ+js6AP
	o4zxel37UKz2lFLWye+Mk2JcL4aZnnNN06u61ICaDc3WCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksmajtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so568427185a.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420802; x=1795025602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=O4aIFWpU/ZlST5KMk0c44Jd1SZ/ZEqe53RIBLtcbT8btufYyZ7/Zc+Kdu1TkMuh11t
         4VYUHdBxxfin8HKclTBH0T2Sm3mXK8lT/FQWtsCUb5+E6/2kqnUulvEc48y/sKtGCFvf
         ZOTmhPr2Lg89jV9UIyUKmJWOLFcA/+kpKXKJb64Er6TzykkKmJUFm0PSd0FsTmWI5/yA
         xw+zy//ITNO9ypet3EfHSN2KD0rFN6XAtKFMXmF7A0I+GvN/k3DcjOOj94KyDbEbMRK+
         vZhgAbrM1Un1sliztjsRH3MfAKzoTlX/i3pp9DlLAm30eGxzdkVjANnapnYEkj/QYUUu
         NuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420802; x=1795025602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=1eBt8Xeipa1oE3hAAwyStW5DygVFwJdXGaYIlAU7mfY/5/RPcMQW2BnaGr6eTC/Bp+
         QKYLAa6KRdrhe9u2L/wJTKhAair9fW0ghAuxVPMq4CgGlr/UKrBAacTFF0PH8y0XVh4f
         NW+Hkz0OLfDg9yNsdFg5To4E4I+z/VcWbS8nfR9rq6m5TF4VDv9Od0xXjbKibylKLOTJ
         15F/4NlgzHK8zjcG1Ore7QJL4Rxy8KcqTUiSEZEfCSCwP4NESpmQU7EBjvIW3GG7Am7t
         +TAckh4y43GAtrCUFLwPkoSwDNB3XUuIwxHc9Augb5I8YIbGwLnJOB+s5pBDQjwnOhb6
         G6+w==
X-Forwarded-Encrypted: i=1; AL+hErHw7RUO5vB8KJ0p+p4N5cQ5lvhWIjgaRvjTsW8ceZiiXOMp0m6Ds2eSauuhFE1MRt2gcy6S2/TSmijj@vger.kernel.org
X-Gm-Message-State: APuU4Z8zSVXiGtrvP89vmHS8Jv7v3SgizpteUJk4uVVT/jvI5iN9iszi
	UuRB2FWo/Hwnab8HdjMhVB8CGX2ss4EMbHKPioKFkdc6XLltXynApcbGilKCv579oPkxd6Htkci
	AlXvZZvEfpbhhc+/B8P/CztWha1MtaGero50PBlAIApymIFXOqJKz/8c6tvIjhyq2
X-Gm-Gg: AYBFou34wqZ4X0dpv38M0Etp4HwFagXVT/sFblA9KkDM2b/4w57xK2DnLW7CxyfJGUx
	jpp4jxYEyWiZqKM/8e2S3PG2Wy22I9Dm1hnWBgIKj3+KAhvs5TGiWj4vEQNDS2WJQNoE5j2dVJ5
	+L6cdua6reZTOT3mbn6NT8wtv1xmF0Z31aiJAW1IveAwrFosYwJe6A9xTIwAbGTj5w6mBVraIg0
	QbD4HLvprFcc6p2tlnvxoWRojkRtbIY3sZ2FfgiEZYwEPc1MHyQJj2AkcmdxidhxheisDQurGr6
	Oc8mYh2e0/YuoOpmxvBkr6LKRmS7e2n3x/dgjPjC43F5WnoQsC2PBIbPFol3sLIar6nL6zbaFkC
	Mt95ZWAfuqJsyUOsVkHMct1r+I9qa8s1/oftqlggV07C/4KofRAHogUppSCUibDWI1/mSOLeC11
	UVbFrm6WuaicfHuPLc92LcrxUa6rLGzWdZfRMA2F2wx5VVaU/9nC0W1LHEoPNTUg==
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564280285a.19.1794420802224;
        Wed, 11 Nov 2026 10:13:22 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564271585a.19.1794420801627;
        Wed, 11 Nov 2026 10:13:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0924f262sm13151041fa.22.2026.11.11.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:13:20 -0800 (PST)
Date: Wed, 11 Nov 2026 20:13:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
Message-ID: <ft3rayikzieiuttoaqz7lcgv2sgn73cslgh6urur3pud57sqqg@aouonlfb2klw>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-GUID: 72XqAjbbHybvDEQr2ZgPtYjDGmUAsqMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX7AEoqiQaxx4A
 ECLQnFqtrQY98urdJ/KOpMwcwH1fB5CQX5VAnsNUW+vFfqWd4XGzryOrfGggIlC8lJQLRupMRSE
 gDOfOQxep0oI3P4CgPJ60whU0wt51hHCp7D+EQZ2+blGqG9lVYL+904ilSX5FPlAiMU0PWIbuaR
 5rayB0sv7MOqAFJ+kM7KKQ6to7d4NusFl0dMDlFMt2n0wVTSiGIdC5KbLxtayGo/AR6TOHJSAGq
 zE06j+NLkMQbKkImX5dmn04SzFHQq5uphcwZ9MzwgaW/pVdMrZ1Dlf595P01E5cm+MZ2cC91wO/
 zmpxgmY6X3m5A6x8gdYKe7ugVaksBiGBUkNNAhmaGmBaQ+b/okGOfcFN5Z57PCbnpCTdgySIyi8
 yb7xU88aO8nQA1VDf5BEvg0vwBUxL6nlE7TAEzFQxbmFz7VLyjYEYyIEGTaRs9UzWRbAnWeaZRV
 DIMOe3CnVVcVY26SgiQ==
X-Proofpoint-ORIG-GUID: 72XqAjbbHybvDEQr2ZgPtYjDGmUAsqMF
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4b043 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX3mh6UCjUjucE
 O7af0B8EdmSIdwu/3DKGAQLn4D/x4NFr5IP2n28o9uyLVzQ0PZwKpdprQ/dXoSQ5RfkLlOLdCFw
 vZV5RcIZOjZ6ZnyWvnyx/OCzGbjouxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:00PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 4 ++++
>  arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 4 ++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  7 files changed, 36 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
