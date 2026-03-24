Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B4A34FF74
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314979; cv=none; b=Z7SrJR3fkVFbgGp6FElEXIrMsZFQXQcNTmTHmqdF2p5bEolvg5d9Xl5/6jbJhgaolNV6CbTsCfoLAT7JaNoSo68MvVubRULRyoCGABeOwEz4oXQtY+RD0GVo0t4OaRb8icD2Bu1M73y1GUX6y+xH7sg4NtILk4ypVADRM/xIV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314979; c=relaxed/simple;
	bh=1l3+Va5sqYSJgpgZYM+gzU64csJMw/k3cfhpHLNp6os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUPKgAQABmtgmahdy95JOOrTEvAWzuc+X4eTgWVkZa7D5x2tIYUMq2DuCYBCKoL+crU/RkQx0dAKUqFyueGC3U9HaRISnTPKDaOR4axdPqB6jVEiU4oepSF9pYBeYtjhul5UXAHtlyUqdZzcqd9LHHsnK/OuEA6hPoMlzgtiDdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/V2NVdP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UePgi22u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/V2NVdP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UePgi22u"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHr9V52833932
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rsxzjbt6r5Pg4/NOwUWiiQIv
	8QhVIonCXubO1twg9k0=; b=U/V2NVdPGkzCZlRq32KiZVF6b7psyalPqbSkGZSU
	Ei768SswfIgKwdeSjsgcxpFv1IHo05uT+AufyPaZtTGTrYC4QNYL1AQyjg19xl8T
	YH2hac04wFkCLXD473GM/hfuD8fM2tln9qj3hkr2SYBp6pSvFve3CgijoucptBIR
	j9n31n/Fnc0Yjq8XD+TnC7AniYPhOsQ1Ij4vbcJ6i3DKJyfPGYdsLyqJ3sSA3EBI
	dVeg7v2mZ0cQ7UmcZQLUngEHGpSAhD0CM2ILkx5Awmh7JKZm0sOjglQHN817dRuL
	ERvVWupRI9UIvt1si/TYleAabWqQE2kOkTGvPE6lEq7zhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jta90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 01:16:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091a96f0bcso198722421cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 18:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774314977; x=1774919777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rsxzjbt6r5Pg4/NOwUWiiQIv8QhVIonCXubO1twg9k0=;
        b=UePgi22uVZp1TbxtMr1ES6aibsCZjszIRaDPrlFbTdfPK9MjX5NUxwaPwZGLGtQE88
         AUh03SC3+/tTL/UIpEgvB8PQlOO/EV6C0Hv+I+Idc6GKRMUo9+nThXZDXeMvSgygtaAi
         xxoiwWgdDITbLOb7M9duG/DYLSJw4cg6gJhX1Z1IMCi/EEIO5+ZK3VaHbqzHDP+DONWr
         u/7rsK78TSS0DovwDWwK3m9D7EAv7LIG0WXK581fIz33d/8JhCqly50JVkZi0+Mgsvm5
         GLDKcwK/uK+72T5mAOYDtK0cIUM1tM6kabD4Lcr08JOYQX9NAc3aHOJcvm/E6ptexYKW
         Cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314977; x=1774919777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsxzjbt6r5Pg4/NOwUWiiQIv8QhVIonCXubO1twg9k0=;
        b=hmlTqZd2ynRzBRqRQTZFHQ4/2R14dSKGeHJxaI25hbkp4frWNQA44SlJx8tOBPVMqT
         +Xs7gm+9FpAQ1FMX/qiQ8b/Ip7AMjxzWbZEB5D+LK9v4srjmg3BsrJfFJxO5JPd+cz82
         kptv5wYPLyQaCmRB32P/l/A6CF9mFciegjQ2bjS29NzcNtqkedOpPLUfG2JST2ecI6DI
         HAgHL9uiA1xR+8R5Cy6KCqZvWW0z4alebESCte9fqgIqkkMnJX4jkRaPnxIs36ov7uFs
         5ontCRNpjV2WWVqs2RjZRAAJqXEJU79FiQaQyTLSlQbY2rh9y2REZOljyks8Bj7BLpDp
         hytQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5y9ifdZAU5eWEV34T8F8z1Yb7sGbWHPXsuZEkoCJRONJD9SEacj3DNF4MNSnIcj65xsiScCXtD72C@vger.kernel.org
X-Gm-Message-State: AOJu0YyoaZeXKmWXojC3hV0atJJCSIM8tgWEy+RwTC7ipFUo9TlxAP6X
	V1F0NL5E/d7LSWQADO4WbAytnQKQA6tf6cTkalFBTTd+ngOdLVe5ePVjg1ZGvVIzmUjtUdxK9Ng
	XDKn4sPxqKCcE00xo6C2H8Sy+pyuWRcZ54LZu6ckGy9url0CaDWEgL8MYIiDT0lN+
X-Gm-Gg: ATEYQzwnpPUEcLDvogTdqaUhJ0ANtWuwIyK9fbgOV737Q/AfUdqVcycXYxJ6hwEQrUX
	Dwo/6hX4CLpdGCQQjuL4cBfjYj/UBn7p/JrsbsppHHkKbf/ayt3CzRKn4Qld3SLB+oky5HJ6GJ3
	EDN8n6MP8X6ECL05CeofnwLJQNVFQlp5DHl1a8Ys1TRk8CFoRalrdcoJaGKP1Iiy55WQBBHy/e3
	Bf4pRbE8lqwlc6rHKxeA6n8MZS0Rw6Xp9hqs/QtWdYEJPO3HQrnkjrwwsZCuBHOZrBB3DJLPD+j
	o0QXp+D6pBQl1jy2bZyJ5xYlH2DCk0GDAM2jo2Zp3VvfKUTUQJhBKw43f9j/V8vk9bTYodOZ0h2
	6AWdKXc9mu/thJ5PlTVG9x2jfxgwhGtWd27SVkKpDwDklhYORBsHwcwooJ3zl9hXX9Mzjr52X0M
	BC6/DD1QN7z0w3OAdwKPNU9sHDlEOh+rekmdM=
X-Received: by 2002:a05:622a:1a9f:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50b37a6f68fmr223443401cf.44.1774314976910;
        Mon, 23 Mar 2026 18:16:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9f:b0:50b:37a6:e497 with SMTP id d75a77b69052e-50b37a6f68fmr223443061cf.44.1774314976387;
        Mon, 23 Mar 2026 18:16:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192be7sm2840169e87.17.2026.03.23.18.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 18:16:14 -0700 (PDT)
Date: Tue, 24 Mar 2026 03:16:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
X-Proofpoint-GUID: YRd8Kprt4z09ZJssjfysHI0ZTVQixw_g
X-Proofpoint-ORIG-GUID: YRd8Kprt4z09ZJssjfysHI0ZTVQixw_g
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c1e5e2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jW_e0x0zkUzx9qZkMvMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwOCBTYWx0ZWRfX3DlM1eBJPsbH
 RwYMyw1sw0ghZRxDlmXIHBoiQ6GQZBMx5XVTsTzGZ7qhJ+zGV0AhdSRchgVJOD5FIXq7f+8zPu2
 kU+cHV4G8LYpGjUtNQLoMqfjZHPWzHXG+qtEIVQcH4+1TZMdjjCJfKr3CH+VUxo+MKzNkWxN5dj
 ta1i4d77PkLjDX4H6J16Ad2etktnAtpu+XAIoB3YDuhUbdqoponkdkPfiv2S9kCGulOPBCTrgJI
 MrFgqjADLxqN7xVLl2ILE8DI9YrXhUQ54QUDEY1dchV5Za1Br288YcTruLA64NtKCLIgkso/mcU
 S7M04V2HlYoTpKLVfv3Nzs9SeNKZDUqZ1piq1PbnU54J1jC7ta0V3vwc8NQNChsGkdJJ1t9q9e/
 2zbG0VPf4IPrwZH1JZWvUkAveqwIre0uWS6v76tgpP4h/SHBK9K95SY3UiXKl45osVY1ZTwcY6K
 djUrdwsJS9zZjXJL1YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240008

On Sun, Mar 22, 2026 at 11:19:44PM -0700, Jingyi Wang wrote:
> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
> 
> Enable bluetooth WCN785x and Wi-Fi on Kaanapali MTP board.
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 121 +++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 5054c5933687..d0f3909621c9 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -27,6 +27,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart7;
> +		serial1 = &uart18;
>  	};
>  
>  	chosen {
> @@ -189,6 +190,68 @@ wcd939x: audio-codec {
>  
>  		#sound-dai-cells = <1>;
>  	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;

swctrl-gpios?

> +
> +		vdd-supply = <&vreg_s2j_0p8>;
> +		vddio-supply = <&vreg_l2g_1p8>;
> +		vddio1p2-supply = <&vreg_l3g_1p2>;
> +		vddaon-supply = <&vreg_s7g_0p9>;
> +		vdddig-supply = <&vreg_s1j_0p8>;
> +		vddrfa1p2-supply = <&vreg_s7f_1p2>;
> +		vddrfa1p8-supply = <&vreg_s8f_1p8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;
> +

-- 
With best wishes
Dmitry
