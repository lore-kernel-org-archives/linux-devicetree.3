Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403080;
	b=lqP1LudAFHKpSlCaRvDG4TJv62hQciAZGhFwFoPmc/KPWgcw8HTDAd7HWyVXKfBPAKke
	 XHmPtQR2RpIz7qyLw6XnwI3wJUph+kcC2FmE4ZPgwueSsS8a76qDYLbhUG4GUyWLQjU1F
	 1Bn5F4/ZUQVRIEVJqyK1M+73Eh8UmRBtSOUDMGjmU0Qq6kg5tGDy/nGtwrDHS/hkJuGBb
	 ryMnmyvLMuJTHZM2ngjjDJDQXCyg87wW0pomQUqrSS6Qvkxl+8DSDY35Ec8NTuCNoRnjl
	 SgCA+J+ZD9dl3FCiGRgqaPwdcTSNETslfAdlyy1VRfXzcKAZ+aUTIuSVUE3p09ZUP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
	b=KuJsQiHgOfgbIZ7fC0CLzfjxn8Uom1QSu6KIKejGQZqaVsVRCfvgpehoqJklhzsknhe5
	 8rwJywwtNanOG4vnFVVwj1QVgVQhpJbzCCmdHWoenjqDSNfQ0hKfSyptmmDDBuDqAkdzM
	 VWoC6tlKrrlxctIirPzWnDtoQNizwPlsJulHdeJ++8yjDLxf/ZcQuzb+00v6HYrFAeG5B
	 2tgvmMZSuu1U38mTmUPK49qNnlX5jutd/0jeZJm+CHtOohSG6Aoi/lTUjC+lW1laItCzz
	 hB94vlK6rZ9iar8i2k7QB37Df4Ke6u8m8Qu2iJmIAXwB1DdyalR+WiWSEDysWf/zu/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F815606A33C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F815606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LG7PUXik;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aURViFfN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ5Xr2974969
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rJPCHE8Tetc6T6Zx5wds0tJA
	NIOD/gQ8/VVy3tOE6x0=; b=LG7PUXikLDPaAgezLLNNCNrPtW9zK3iCE1T8LagM
	7/oWUez+nMSLKYJmTZQ3FdCiE3ePS+DmXvuiGd3u6r0P8YbBRo4arqZJNZTEsBGl
	UUl5Fe5A4QAztxLviTgE4KNPdqI5sEi7uIo4uuw8hG0cI/Ohmtq6QGUl3H9wCGLx
	fF57U2cBuYVm2Mh2neOr7SChJFOYWZXVBx+eVkxplTHMvPei1FeLbYuoV9PT4Pma
	9xJdO3jmhhgKvevKQvDYoSwvz8KCl0kYk2zHzRgOEQybZ3uUX33VeLIOtJxlJWZ5
	TqQv2hwKv+TEm+zhmTPtsZgM7YypuzmwWyIGzC5wkRucQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbxnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:17:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso579732485a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794403078; x=1795007878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=aURViFfNAZtsojK4Qbwlbj9yjKG+uxQ1/mEDFfHrWjD1x30roFfnbCeH6p8lQXRT+V
         2OTYV76EPkLjrOiLt5F/uIs0biUy5ZHNzH4RPZOayvgzDKB9Nbb4SBRXtFxNUJyD61Y6
         rxRzdlONfFwFqGweDas4bR9SbkUmRRrNU9n4733FlYu09mig1H1d6yEmrlRiGUglrKJX
         vszvUg66TexC/rEegClhxYwSi/kjj7OaS9zStlPax3chbq78R7XYL5r3dxE31NgWILuZ
         GIduPZd3HXIMs7Du1UIcp0LwrYPxsK0wNKvMjAHnlt3XFOxvSCYqwKuTlN5tMpxQd3Sy
         C7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403078; x=1795007878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJPCHE8Tetc6T6Zx5wds0tJANIOD/gQ8/VVy3tOE6x0=;
        b=2W0GsxMSXYSNfo+t9PlHeyXSZzl3yLDAJiJwDHLG1A85wxo7IMRgKzgs9aFJPINRzX
         wxykTmjQfjtavq7trS3m/vTOnUq4gZOfgzvjGFqftTL3JozZJyjjo6TmNnuEDKYfE2P3
         nQoEytX1Sp0a4vlkMmk969J7X2GCKnn4ijBEasYOFtLq46BBDqygi0eZQ3JSc5nTMBgX
         u1KIDonIvjdeSm8/su6wnO4/mptHMaR7yQ2d/ODcAB3O8CB6ENL7nnvlfL97ncJgesgy
         QkOZ3xL1SBcEp7GnddknUDIyFhy1DovoYJ15YSdurLMwthtfIORrrWeHOo8UL7/yE/Jn
         H7NA==
X-Forwarded-Encrypted: i=1; AL+hErFf7PaAqOy7d1ftUhNyy7MtzKaY5CuGU3708ftHLmQD+mpjuggbSGja5gXMF6RY6hfNFBEs8asDSN8C@vger.kernel.org
X-Gm-Message-State: APuU4Z+xNV1VYOZ8ErIzvuoaiP/MuagFC3u1MlQxsQRPZLH0AliYwDU4
	ZFzE3qN3oAWBCAq69c7aVax1y/mF9zrRZr8glN2FBS3J3Ai7caiHaI5DqRpLCmAV8/sV8e4HQWd
	tR+e2SRObkNVD4qXVlOfB8Znf2JM9rG1TpSvkvMonoSsKCpjpUDuF57B0e/jkkNpA
X-Gm-Gg: AYBFou05muWIH7werx6j+yh09Rm14oIw9tSKUEOp9i64JI9rUc3nyIDtNRk3PCYt0Sf
	vNKO4vmUYpwbijCGFlQebsOTc+Lx24d7kd9GvATQryy4UjQJYI/9W3zE0zOf/tFghFwI6mE3vZT
	inRQBH6TJSkwOJsUXwRAX1acaf6zcDB09cEOYsTsmdGytXQAKidydcEBP+r3cJJJRi6wpjeNBvc
	n0HtAIH/q+xrn8b0YaVRlqO+GSRXiwchXDfHRFO4othp79or5bVZ9/1cmnHmTHurTW+uqjgPXvS
	aPiGQyjMmjW/pOupMuH+2GqBdGki1EfdNq8AmRiR37c0o1/6oVNdH2PsBRwmpTaJlis4cIonmAw
	JB6fSE+OdEXymiweWN//W4PPRCpqeGJVYODEJzLFhz2vMj1rNXBRyWXzBN5iu9XzEuvsKgbWAda
	xvMYueWexMNhUwz47F9qoPTsr08xSG0cvciq+MwAQFd3ws6+Ecg7QxkXUUzLarAw==
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421670385a.27.1794403077865;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
X-Received: by 2002:a05:620a:198d:b0:93f:231:9ff with SMTP id af79cd13be357-947ae87a080mr421664885a.27.1794403077349;
        Wed, 11 Nov 2026 05:17:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15b8890bfsm563193e87.15.2026.11.11.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:17:56 -0800 (PST)
Date: Wed, 11 Nov 2026 15:17:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Message-ID: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com>
 <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX3pNzRSvr++g4
 LCcTjMC6JVSSCe9clEVamCzc7WSTQwOWXn449v98s2ZhJMtfh3LoAdvW6+nqmoUTS+QFfDvCjDh
 E+3d656fufVvOOkLE1iNfJNKYhjzDBq1Ql8S//NzHDJBgWNTb6vAAxkn7m6vmjJqgR8fMxtGZdM
 O6VemP/Fely14h2eRpGwG5ezXKWEDTI7jS+GvPLezXLLYOxq0zbXpZcd+tQuX4Icssv4NS8nkwG
 Lo3dklGTGs/qS0ntjD47P+pG2c+UE0LcLY7hwZAV1Qta8701xLHXmVR/4JAJyalznsvcbyH1LWO
 LQykjGzO+HflXtXuCpAdVwH4tJ48SXJy9KSdEAQQzfmtyML6uIvzcAg8RBp46+cOmg0sx9gxIce
 j85U6vI8sHlfjx/gtrXq9cbvA3d34eF0IXbVYWwBDuv5BMPULsrxGi/WNsGMEmhsqLMgSp/HbO3
 0L+7AahcwQGGt29YAyA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46b06 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iS208GUargVqoEZNhgwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: jJOyC1hdewlkobMiLcsv3QlV8bWOnbu0
X-Proofpoint-ORIG-GUID: jJOyC1hdewlkobMiLcsv3QlV8bWOnbu0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX9hlXoScfPmKo
 EJAPiXApvHKIIgGw/8xJEj3iNKZ2/vZCU55OmTN5pqVSry9FeAsX5ZptEF+9L1JIQrWhdZPhlem
 LUuvi8hvihQ8jJ1deryNS2R5snFp70o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

On Tue, Nov 10, 2026 at 06:39:08PM +0200, Atanas Filipov wrote:
> Add the JPEG encoder hardware node to the SC7280 (Kodiak) device tree
> so the qcom-jpeg V4L2 encoder driver can bind and operate on this
> platform. The node is disabled by default.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 67 ++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index 8c7523602d271..b46fbf5ebbeed 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -5164,6 +5164,73 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
>  
> +		jpeg_enc: jpeg-encoder@ac4e000 {
> +			compatible = "qcom,sc7280-jpeg-enc";
> +			status = "disabled";

Same comment. Enable it by default.

> +
> +			reg = <0x0 0x0ac4e000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd SC7280_CX>;
> +			power-domain-names = "titan_top", "cx";

The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
MX should be listed here (and used to cast required votes on the MX
rail).

-- 
With best wishes
Dmitry
