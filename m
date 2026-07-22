Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53CD46D565
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719566; cv=none; b=imizFRmJFSxRWOuMd7t5rVj7RI237KY1H3dzreClC3ZrbiVBs09LYbIb+k9M40xG1yYKDlFTkrHDGR9E8MVj3wvJLzu1Rn72hx82LvamUErghgUWM2jRZry0yPpwQlJy+4/hq4elUgC7gvDDLf1t1+NnHH7xwcLBaxxJJcaXRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719566; c=relaxed/simple;
	bh=3sKii6cz5beoLpCzSNChnkLlkM/gVt7OCUCSSnghbog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVdht142HfpSTsO44bIsh6NgQX+f+Skl82RvaBhOce+6YbNEVDyU4FxXi+vMnT1YqE+1SzdmT9VpgZln5TpiZt4mbNvMa3W20wBOq59Uyrkzdtxu4NQZM6x/2EmklDmcTK0X3ns/6LD/UgqQDuV5LAoIX8Yr2g9wn3xp9M0UORA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOtS7G0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3PRBaS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOtS7G0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3PRBaS0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xe1C123896
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rt86BCYIuYzX/mu0QffxPwBR
	J6JJWBu/4GWFdmipzIo=; b=bOtS7G0dWCKzq3eVWbTAIUQjHYLOhMqToKTar6Ng
	FVgC+aEpc/oBMtOtNfN42xpolJ76QbIEnjcBTY52s3YkgHOHJaLy27vr8oethpOF
	1X8vG7emOuhx+R9SVLLc9DJKm1+fAH0BlnRFz4bkyUr3t0PRoAHuPEuWcFa1yU60
	4tbZRv1rXyBqLpjANk56Jk5uhu6DNW/zOWaLrpc7Fej+iUuC8K/P5itwTiKZC7Va
	jxZheWvWkmGiBSnqewk6OnNQKcuDBdSCDm65h8j+xicW4AqGggUaXVnatNRwrIDR
	ktyPCg7bj866IudK/Y7w8jl/EzMASwukj9qseqwMmENcvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4su0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 11:26:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907c59bd73bso909886d6.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 04:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719560; x=1785324360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rt86BCYIuYzX/mu0QffxPwBRJ6JJWBu/4GWFdmipzIo=;
        b=h3PRBaS06X1xsmPI0eiJFRn4OZOOVIXDIdvYpeqCQPY+PFS/iZoo/UrshY/6iF4EOs
         XTcTSKiDHiILCRVLQfKMw6blKmyiUHQ+ZQpAOIofWvnywR8mnSTPz5Y1DqOdKQjXcXxf
         ZfMxjjuXScEwKzNciBwlf1EAU5QEuvvUPQ1j3ucIc0OSRd+jLsc1MHXvo6/Osrhh5Q5C
         QUwx///sfsj3q9iJ3/MhzrW/jwu0OHXdt4wF/KX/rYeoiZyygZRJ9iUi2qlUE+C82VJQ
         phsRR0eHULD3FdHpVdhdaXvn8WRfF7TIrNjIpjHKNb63+sbB+HGUPiFUv9fFxE95sK1U
         kh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719560; x=1785324360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt86BCYIuYzX/mu0QffxPwBRJ6JJWBu/4GWFdmipzIo=;
        b=Mcu9q7EMsW0loTWManwET3HMb8v6oWiSfkIVlib6DVHOtyCaQsHhZaUQHfHGxfsTcA
         E/0No67js2vz9Ze4yEIatZUspYxXAfYzaO4uGbdm3X2X8uytaEbRrvT/wnaollgZlyNN
         fu6UnQLT+ucQQRtK/HqAhqbpnLbdEcirJypWRzrhaSuUmH30S+D57jANpCV7j+N+XJX4
         WKN0jmRHvpHsGLjxECkK+t4/pnjlAPldmQJWDlC9518K7Tpk7IL84uM1B4HtIt9xlcXb
         K415qI/wNlHYzc6CZ5gd9o43zYEu/gxf2e/Q4geOgU6DpAT4QppJPYkTx4rxqHHfyqsD
         seqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtof+Gt68ObxoDf6cE31szMUCmT6wHwCDfcLbVOTq1pzJuzf3oMncwJJdDQ6RxHhL+obG3DzlLWeXh@vger.kernel.org
X-Gm-Message-State: AOJu0YyzdZjXi7zdGSQ6TC0oknpwKYAODFpxvMFbtdS20InLEaGCRU3d
	OofLYVxpjcXbI4WpJBC5reVCcVr1jjxGeqtgaWNd0CKV4uBCY5HcIx2yi1G4qo5Y/zQM/7H7mBf
	EdfnlQfSSxC99SGOftYu9tWBH3+k1I9TY3taGm1dJL5ovd68g9q2wjoZx0DSYw35t
X-Gm-Gg: AR+sD10z9ayE6Wch6ILUv1v5s4vfhAhJv8PyFuelWmPKja1FwVoGKqEjlJfc6J5Le+I
	u8SX8y97JZa+ONLlyh8AJ/xyFVApH2x4qxcP86yXDtJ9A8wSvhQ592cjeSIRQ65xJIkaHvOHmT6
	+FidA35Kyg0HeGE8uT3Xg/C1XXInc56iwE1P2P+1dVxsiy7Au3Qav1gG45Qo2dxApqQ3M2L1qbr
	SexJnOzpK/dQKAH5ATyNFidTFaiY/Y0q7YHLSgNvUdB32yFqcqG05+knJYaLLe2N2/TD1Vd3et+
	oHfqsaE5ZbqOBIDzviRh+uGV+29ZB/SwQLBuz6ACyXeUL2l1VQ49G33gn9Bcyd1/8knmFrlKddE
	2M9qC7/jcpa/dsCI=
X-Received: by 2002:a05:622a:94:b0:517:c6b1:bffa with SMTP id d75a77b69052e-5213f66b3a8mr215906641cf.48.1784719559524;
        Wed, 22 Jul 2026 04:25:59 -0700 (PDT)
X-Received: by 2002:a05:622a:94:b0:517:c6b1:bffa with SMTP id d75a77b69052e-5213f66b3a8mr215906291cf.48.1784719558875;
        Wed, 22 Jul 2026 04:25:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85a2573csm5078766f8f.0.2026.07.22.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:25:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:25:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16
 (UX3607OA)
Message-ID: <36sqh2y22cc454wdpdfxzgek6h2ahhrszbfepf4jyqrgr2u3xp@d6lwvojpcdxv>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
X-Proofpoint-GUID: wsuiiIQo7sPWotYxfPRznHxtfe1eO65l
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60a8c8 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=s0AnzQxE4kFPvzPjDjsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMCBTYWx0ZWRfX6KSdgcQP2VJG
 j5E+t9hbqtYjik3Qk7jmCFqnR14/83ZQeKo5HVrTgSEX4s1eqgJ9mt5G6x/SMKfyLUgRn2mmMuf
 NnB9AKym6hRkq4GZKMy9ue3a4uCJS7dP7ycgsVuGM28eOz4+v1kQVPiWwo/dhg3xp/h/idpnfLU
 WWWXqQXgyf/xTtXnoEb+B+JmcUiw3RlIsX22z4PK1ccjO4nXRrj7ObnH6qE3CLZ/3/R+1sY2Yye
 nBlG0umifGw89w5z1V8uBXXc+W/S40UuJaOSBin7jZjmgJl728BbiYt+81z7j6kLRz2BlXo8FV5
 1Aa6SOS8/hVAeWcner3Jm+kXZn8hIUOjbgoFlGMP6FO4FyFwVUtp9CpWTX77Lj84V+DogXIhvMa
 22Lz4AoZQ0hkTfJBcMxCkig2/NqmRboDI8cR8Pp9aR3vsBKAzG/8MMUvcftv2keHVQEpa4virdY
 5svFTxutF8x9MXrz+rA==
X-Proofpoint-ORIG-GUID: wsuiiIQo7sPWotYxfPRznHxtfe1eO65l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMCBTYWx0ZWRfX1t44kWcGw+AB
 8utblPA5mJgwA90R54SgjsB+Sq5gI8O787IWfipInP46tE9UnnljzoTb8dmDbLuaLocajIRyeNL
 khZXY0y55bWaygOogj8GjiNjLYzgRMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220110

On 26-07-21 19:11:27, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
> of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
> Glymur platform capabilities.
> 
> The hardware wiring is very different versus the 14" SKU - the larger
> one is based on the System-In-Package reference design, unlike the
> smaller one, which derives from a more common Chip-On-Board base.
> 
> Currently working:
> - Audio playback (4 speakers)
> - GPU, Display
> - HDMI port
> - Keyboard, touchpad, lid switch
> - Privacy LEDs (camera-use, camera-block, mic-mute)
> - Charging, Type-C, Type-A port
> - Onboard SD Card slot (RTS5329)
> - Wi-Fi, Bluetooth (QCC2072)
> - Touchscreen should work on the SKUs that have it, but it remains
>   untested due to lack of access to such a device
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1271 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
>  4 files changed, 1274 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..1c86e7e98f55 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> new file mode 100644
> index 000000000000..be1a217c5bee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -0,0 +1,1271 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"
> +#include "pmh0101.dtsi"
> +#include "pmh0110-glymur.dtsi"
> +#include "pmh0104-glymur.dtsi"
> +#include "pmk8850.dtsi"
> +#include "smb2370.dtsi"
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +/delete-node/ &pmh0104_l_e1;
> +/delete-node/ &pmh0104_l1_thermal;
> +/delete-node/ &pmh0110_h_e0;
> +/delete-node/ &pmh0110_h0_thermal;
> +

[...]

> +&remoteproc_adsp {
> +	firmware-name = "qcom/glymur/ASUSTeK/UX3607OA/qcadsp8480.mbn",
> +			"qcom/glymur/ASUSTeK/UX3607OA/adsp_dtbs.elf";
> +
> +

Nit: Drop the extra blank line above.

> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/glymur/ASUSTeK/UX3607OA/qccdsp8480.mbn",
> +			"qcom/glymur/ASUSTeK/UX3607OA/cdsp_dtbs.elf";
> +
> +

Ditto.

> +	status = "okay";
> +};


Otherwise, it looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
