Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD8342901E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439996; cv=none; b=QCRKL2vTA9hFjCx1cJ3TA52J4e+nG6wa9khpA9gYeLUFMOttRyIQ0nP/3LudTYW6CGddg16W6bdDw6Oz/glQOGmCZbqAth+2Mj2DmLmRIg7yHG2BwziUkN4AB+ikLSnuVEDSTRiD6h3/JvzrAsPPCLTFIHw3ZlFxIL7IP5nXdWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439996; c=relaxed/simple;
	bh=LyUpJFKfESBHuLkCIiDNQZkrg1ABi7qIcSdkqeBKKZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0ulS2+dLVTSlsChFShGQ6X0tXAKXi7fwmNXTtw6Eil3aGYBT+FMNriTYchSebE2szWEd0cDFFWd90vrqMZx6wJX0Oj1Y7wlqQhOiLg/fxsIyXjbB0oWg1nCR9VGcKfG7X2Rbjv1pOme2IxRghxoXCSRkDrOu7808OzSeL2PT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4YtsrcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX/rYETL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4YtsrcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX/rYETL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B79swX3552688
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vQMbBYKosM4bhsnucZvfevVV
	XwVTm2ddA2HEncy5r1Q=; b=W4YtsrcHS5KTk3OmKdZiG0dDZeKyHSCayC7uSbQa
	4kbmuzC9iyeFHwOL8eyaQ3soKvYupucQuYXK9g7ydYuSxArS8/PGD3A6EjQqpb3i
	cM5dx3IGYVls3S6Rnh0F0QiW+/sY121CFnUp2n2zLkClEEUf2BSGJtRXUplJEG14
	suxCPa/huS+r9UyQF5ixOXViFu7lus3XVJKBqGnDSf5k/vpZ2bAGpTd75VsLu+38
	6NCGHbtlL4PTax1a1wwlrB/Nnnmm+zqq+j8rpxlyBO+D1P3+N8IcnNF9foR8mtJn
	/9t3gENY3yZpa5uH4znixtbqTuPyGWCgdn/WpWgjcnTakQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk221u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:19:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c26012cd0so26589061cf.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439993; x=1787044793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vQMbBYKosM4bhsnucZvfevVVXwVTm2ddA2HEncy5r1Q=;
        b=jX/rYETLNg5KV2nInv0LuXHPe47v5L9JjbQixcNTheyvQmPZRzRy+KtUIFXJGjMb3/
         EuFFGiI5qO7vti0si/pt9OdIDesn6WWU/1JHUEbrFRNyqlzb7gRiaegdx1B5OGCwjz7b
         5DMJWmA1hl1WXxb6n/VupfyrEXYu7xAPwW8KwwTB5wRA9fLDEziDTwnQg8g0QH7pwWE9
         QUL7WaFCVKavgWzic6nNFVBkbiyM0CF0BvQwjxc+uzbhWVNwmr/8Bb7w4wkj3AHFTrms
         Yfux6UwPcCU8/M8/WSsCXD5MZquwmYxXsrtU35an1zxyP9omFdsmoHf3qKZNbFGHyBs1
         q2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439993; x=1787044793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQMbBYKosM4bhsnucZvfevVVXwVTm2ddA2HEncy5r1Q=;
        b=PD69P0k9KRhhjDPqNI6yEE5xh7wcmxGaB1TId1IwzkGTU7Xy0mhwHTXR/LNRZXG1pz
         dgyS1cfpjOXuEB8kLuWw7+Mf6kM7Bq2szWMv5LRcxKCzuY0vuR5OUHlyvS5JZZaActr3
         2rqTCVLw+GMf9UjEUjskFRWkmYBan76ugPYnAxw7OpMi4YrLKP8yYg6+qGAt2uU3k+X4
         jEGuPZV+LhD2G3Vw1wG1vprKIWadtFD3IM0VxwjnUYWporw39IUSl0/OJjfT0pgKaPmb
         3u7CokRPLGgvT466vdfIkYNWC4dC0hk+ZhG9NVzLY86YQYc3bRVn75jDxNlOKKHiUJVR
         BpiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqCd0FOQkWeiPez5+69ECQT4g8k8Yq3b274QdQbZMFpnklcxtE/q34RhyAUb7quX0GIKnbuTMwRILG@vger.kernel.org
X-Gm-Message-State: AOJu0YyIz1vu1TDNofwaEk3aXos6t3v/STawUwRUG6z9Ut9H/KqzAo6L
	mXwT1dgwwx1wK7t9R+rMNkPlouYfBYg5iwVTfIYmGnsX1tssuavTWbHkOUbgIhVtUs9uioawWAl
	uRRen8L4iszN3ewXHUiBvjyvFBuPDyIO7qEN+9d6lKjHbNi+YlreP0HDPTKVZ2xYc
X-Gm-Gg: AR+sD12PoPdO0kupbCe3qZjHOzpyjvlBCnJSBS1ohXDds/fK8+0v4Jp0Zecs0x1EKv6
	6O2GqVoPz0Jv2MsSWaNNK/92jHd8aEAwr9jCReFmgLkMM1ynHbjghMyTRD2C5gONLRfUu0s/qox
	TKt0qt5DfPU1UFHOwjwXYyQGEJE8c7984xI9ciCSeKmZTPJk6PDiMV1M/hdmOM0jR2mEWN57FI9
	bteEAYBj8o3KCVAVUZ40geuHyhuodhkuIAwA3VPRIG01Oz1AbIPHX8vXdJeGsmBcBZf8Dn3mbDP
	6jrvsP8hfUzU+eAwGy2tSa4JA5XTqxluzMr1/NjMUUSazZdias3jMInZLZDnidGTkx0TmEMyfDK
	8XsW2l2m02FFOENRnoAj+1zGHXS4qMvpcWeR1toPXoHUNCRxuWHBeS+xWTTNRa3FDK3FEj1FZ7r
	vdJXDE14e7PvU1+Q==
X-Received: by 2002:a05:622a:a18:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d585dea65mr14209741cf.28.1786439992860;
        Tue, 11 Aug 2026 02:19:52 -0700 (PDT)
X-Received: by 2002:a05:622a:a18:b0:519:efea:cf41 with SMTP id d75a77b69052e-52d585dea65mr14209461cf.28.1786439992397;
        Tue, 11 Aug 2026 02:19:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872d9d1sm162976e87.60.2026.08.11.02.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:19:51 -0700 (PDT)
Date: Tue, 11 Aug 2026 12:19:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add Xiaomi Redmi 9T
Message-ID: <6tyswguhuemcwmvkcuwd5ssk2xj7s57cufogkzk2jgisnygqos@dwvsicvnylf4>
References: <20260810-next-patches-v1-0-79a779d76173@gmail.com>
 <20260810-next-patches-v1-7-79a779d76173@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-next-patches-v1-7-79a779d76173@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfX8JeT+cL5OYCX
 o2YV7OowWyanHpvDZMiZLOsNOfYNV+N/qytOOvtnLDBgoDl15Wp+AqOufZWZJcNhLZy7rqIPzGk
 DrqbOoMbDo1WJgllJEpck6kHJiupN1/FNUcYWZ4yDsYaCRNxrXr/wKu1gfxgs2VsnquLn2RUwXH
 4BNYDUeLkPIhSDfJGdaGN1EYmjn3ujITQAy7K67muMvYbjFFjnHXNOcDa0WNeXI6v4hsUEA0ool
 EMysGL5v8PGMsM2aX7JWXgBcOyCZsiC+CI2/irQpSeujPfr0XIAlhZnxtO5kSnI8ir7S4cqLRYN
 qt1wINZuQwI76o4+gzKSj3SoeGFP51uUhywu77TZXSZxg0sdJzxgl8OmoeT4QjcnMOXd1CLPnBY
 orADouahqEX/1UIPvzCZTqo+GON9ebAWEO1f/Oi4UM5L137ga6rI91ge0i+Utq5kHeQW8QVXLJN
 7rjaXdrw+p2q3EETEfg==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7ae939 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=8dPnOhcq9ZKN02hjC8wA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NiBTYWx0ZWRfXy0/nrOoBS5V8
 RX6Pl1w+EIyit3tRMFzPpNAFCYzJIyZH3btb7y57fnDUDgocLwWPsBY7NMeDws4kXJzByMX1F8L
 +TRWlSSwZ6d8NzWZV07RLOAnldOnN+c=
X-Proofpoint-GUID: QkTns1YKTbtjrNi274Vz-0d61bHqoDF1
X-Proofpoint-ORIG-GUID: QkTns1YKTbtjrNi274Vz-0d61bHqoDF1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110076

On Mon, Aug 10, 2026 at 06:55:40PM +0200, Adam Skladowski wrote:
> Add a devicetree for the Xiaomi Redmi 9T smartphone, which is based
> on the Bengal/SM6115 SoC.
> 
> Supported functionality as of this initial submission:
> 
> * Display via SimpleFB/SimpleDRM
> * GPU
> * I2C peripherals (Backlight)
> * Power Button, Volume Keys
> * Regulators
> * Remoteprocs (ADSP, CDSP, MPSS)
> * UFS/SDCARD
> * USB
> 
> Device tree also contains supply maps to other subsystems like MDSS
> but due to missing dependencies like panel those are disabled.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/sm6115-xiaomi-lemon.dts | 440 +++++++++++++++++++++++
>  2 files changed, 441 insertions(+)
> 
> +
> +/delete-node/ &pil_ipa_fw_mem;
> +/delete-node/ &pil_ipa_gsi_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &pil_adsp_mem;

Keep them sorted, please.

> +
> +	vph_pwr: vph-pwr-regulator {

Nit: regulatur-vph-pwr. But current name is also fine if it's an only
regulator.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> +
> +
> +&usb_hsphy {
> +	vdd-supply = <&pm6125_l4>;
> +	vdda-pll-supply = <&pm6125_l12>;
> +	vdda-phy-dpdm-supply = <&pm6125_l15>;
> +	status = "okay";
> +};
> +
> +/delete-node/ &usb_qmpphy;

Just 'status = "disabled";'?

> +
> +&xo_board {
> +	clock-frequency = <19200000>;
> +};
> 
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
