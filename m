Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B543E9CD
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514030; cv=pass; b=qAgF+c9IvwdxAEWQHfTh9xrmIcGDLe+e6Mpz445wj3adhPil0RpbkLtAAt+oxIgNgJRdXIzEGdacNFYux7GkYYe009LM58J4XH8Vt1qvawiMSW8KT/ia7eJGsRp+mDs13xfxjQkoueXmAfbxMnSkAAthcFsYCGeIXqpG9ULTLg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514030; c=relaxed/simple;
	bh=H83S0AwhXzq6woEOv+KvSXSUUyNWOFO1aLq4NDVNzbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOBe/GGO5UbuUFcSJEjPIhSuqRzPeqMQ4BziJEwcxb/jCw1mZLuyaEHLRY8Deh+KqtR/MSuk3z8QVSJmgsSLCpEUfCAXmDqA/mSaIGV22pVFgzEbPO8g0UCxlL4YKEPtNMONrqTm4lLbiJqM20EiW2aomKMamJI1MsOahwwpf6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nO026Yj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3397cV9; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nO026Yj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3397cV9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3dZ92537924
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=; b=nO026Yj1+2d5lC91
	Mij0+Pis4QhyNC8DCTXVTYIefT/931idEd9hotLnHlC+lXnzXQFQrwKEi62p8AbM
	jimt0KKIxUHFzUobeCXI0fM4qU7kJLXPvvwF18Nyi/A6EA2OMvG5CtB5RUtZVYqc
	NPlcSQ/dCw8Tp54PRuwrRThLKf52WpgxglyklRIjgkRLD0HjySkBjTcquhjtzg/x
	CWvT8ZzjzB02nMFD4gbH9c9jnsU3Si21HEThNesnfLikcMOzxcazYPIW03BW19i9
	Nooaw6EkareqyXhJxOZ4UNosySshMiFJWH6yh1Zf7LUcuopxVQztRw3Rq+Bv4vJm
	o378xA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u13cmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 12:33:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f113592bf3so13383666d6.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 05:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514027; cv=none;
        d=google.com; s=arc-20260327;
        b=RfHsfW1anWVUIrfiC7m9RgOJX8Mu/Nmoc9GRc/xxeo6HNCHBGQrTAgxqmA7Txbplog
         HY4iaRY5AzwQt30eL67C9Hi95yaJAUYYC7E4faqFA/Necn2BGS8P9UHb06ugKALern+1
         m5GrACKPRKgRS8XeCKAYBgbzLq9QHN88877/J2UcgWcePfam28P23ep25h6+jdgoO9lr
         7ADZlXkiMys4Ig7fPtA1Rjxcmr2P1QoWymqkQiQHtVLuDI7LOKOQldPx5I2daaj30tGJ
         k/ABe2STesTVKAduBt5icG/WH2LyM5VJq/tbHIx52f4l+v/7S62aqXvaZbLFp+qMDU9r
         olKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        fh=Gi9QInmFGEKgOLTlAOSSPkVwzArWFQLvq6hYG3yfpWw=;
        b=XLvFpgmLbFPLScBki23cJ26PySJy6fgF4Bis8GogyzWZikV1zpLze99AGVXLiskhh1
         xp27Gqrkwp6cwvZzes6tAvgDjq6C1LM7cHzLQ9TGqBl4n5sYS+kSVVTLPnOqHcrDnth1
         VVCsFUSpZ2TiS3g2TyMOC3ULOFGICbiomoTkGbiInA+zVcIGH6S9dSkUqZ/TXX0k0106
         wNofDANebsHAq19b9nAkDc6QoqRvu22Fh6egoMlQsN1Ac4DSB8kkY2jLF3NW24pIBcvJ
         HuSUxngo3qWODysOi2q1I55WJuxLN2naIS+hYxorKo37+rOrTeau+aUVuOzw6F2/YoCc
         jk4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514027; x=1784118827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        b=c3397cV9MfZss+gfozt0bTBYRntW+uMaUzz36DneJifbrO5d8x6tVt8Ig8YYOjpcFU
         /fwwxpLu2xBIATPr/PBZBi2f3XcnK970T6r7WiJv+qt9gnO3+f9Fw4TZSBL5UunuPM0C
         NIRTnecH0Dcnm67WYjN1hazwapWaY70m3n6/4eziI4jsnbKuK9PwMitf39UEOUsOJUHd
         L1V9/JBXi1fkXOxMK9Zi1CeJL/8qBDOd0HvYrih1Ebb/AhRgXv6PGQZ/3HbC9+5xPzji
         scpIxdV7ZKnowanRZ16YK6SNKUnW2U42rXuctyix7rU3TJ74fpwk2QXkGxJSGij78CiM
         6UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514027; x=1784118827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        b=gwnfnR6zGCojlYpzWS+EY0kxGkq1Xkx7MJzXXprvp+5rFU16DNcOUASYII7o1EnPRa
         eQMYX4Ysiw1p6gEoD6vTOYkNS1dH/KoQVzWFpK3gXOumIgo14P12qclvYBQx1KgMAl5r
         gG5rlyAqQlqo7xm/Dh77tLym2Ea1wOwY3d5bAwasXUZ6bROi2/STeM5iwZ8xL654eAtj
         zV8NvQWzF74DmWjtKDBPVWHnW75iqg/PvPOJ/8mO2sr9niP7LRUqQaErl5tLtzkMMkfB
         6OXzCib6GzKhNPZnFgPVKzRWG8VVNwC5wlkqrut/crAN2YcDbkjHVhGYiOCYbMpZApLQ
         QtGw==
X-Forwarded-Encrypted: i=1; AHgh+RqGvskw7+rqkoYt802XUSAxRx8oYFhD8jScwQfdNC3XmuaNIcD6gzpqLQ5kczNWZpEmWHehGBDIYM9R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Kdo9ijUYjy6egbitqxgg9zuzgYX2JPa9nYXGZ7vIPWJrGHVs
	GpYktDBuANGpXtlS6k0tfycTeW4vk4T4btViPzqWA7Xa2aDZcxfEcicxoA/k+gr/C8hr5vLGf3T
	xvUP0HSz3mDN1Y/Fn1NiTnyW2+dnphmSxYp8YfVvY18bk0FRDZFt5Yp+e08X2Ix3NNDmSpu+p4z
	FMwOmAukNHGC2Eissr28l6qQTm+6SsyT91fbbaJrpJ50ME4pJUDg==
X-Gm-Gg: AfdE7ckTlLgabJJyZaiTCL0xJdcsetWFwS0f9CQOuXDpHdDTPZ6MeCJsPRbbA5v3pUz
	ttaKEZf9MmS339tMOsQZOT1xj4K931tvupVzU4Q6hTbCsbJSkpAOeVvVI9vmpXk+01kwZDbKdSv
	8vP32OSrhdgb72+BEeZLFVgyy6gUAalICgtDlr9CyiZf0WDiiO1t2tP8HAlj/TVEwl99bKVxyjk
	0djadyD7fnofqMGsq4IfJLMuiWnJuqmqE9QPcFr02ZMw9YKKqDMwpkO4bnS0PCMk0BVil5pZeab
	taE9YjR9
X-Received: by 2002:a05:620a:2b9a:b0:92b:641f:ea5e with SMTP id af79cd13be357-92ecf4e9a7emr214270685a.0.1783514027267;
        Wed, 08 Jul 2026 05:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:92b:641f:ea5e with SMTP id
 af79cd13be357-92ecf4e9a7emr214267885a.0.1783514026767; Wed, 08 Jul 2026
 05:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com> <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:33:35 +0200
X-Gm-Features: AVVi8CdcEQxDSYQbGM3A0YJ2FGsOv7iL-bQUXTPLTW45XYvR5BZI2JHmw7675-M
Message-ID: <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: okU2OYR7aV3Wj9m5z4Skojsh-Fh36xvD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX8HPhIJzs9fCk
 dSC7B/fh2HVOj70n1Jvc/AA007cr9xKnohssx1KSWVqqUU6q0/q3icjhx/SawrrpcsVLb3jk/cW
 f54jR+eWebLQxqHl8z7UL3XFsEhXVH0=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4e43ac cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=5sf5Z9IX9qwckH8PYdEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: okU2OYR7aV3Wj9m5z4Skojsh-Fh36xvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX3OI9FxiihtIL
 mVsZXitNGEPZJoZbVT9CTE5qVwgLxPF/aLH/Kd4RTWvizVl/j23gVXFb7H9dwLRVGgsZ3tSWfC8
 gXZR16vt3VIcJYnr2rVQY9RSkRBEQEf3KPr/WJ//z/+HIahobmqewiRihL1aIc2GmNsXRr2AdF5
 zH9jzns10bJRnqDXsAngCCkJ7dTbZYsQ/iMig5B4TaKICHwJ1c7A1mFs1a+4cFInWLcebV8BPKG
 X4zPL+ynwddNtIIs1+W/M5ExV1dw3w+77KWxtWuTZewsTX5tMRmawvhae6SRbRAvXD7z03UiZav
 +cHbCImgChJfJBSS3oJUCqJgne6iTrMoQENi0H4LHbfSE3/176Ch1y2XAq0+0V8wai2hcNCrhTX
 nra6WOMSJxUy2Iok2rpGMbgGbX/nSzC6perEgyii3xmjdcZqG3HT31l0h77vgPTWjywAJsCk6ly
 GluUM8T8Cl7/QmoCVtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080122

Hi Srini,

On Tue, Jul 7, 2026 at 6:37=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
> capture DAI links to the sound card.

Looks like this hat also features a button on P11 (gpio85)?
So it would be good to extend gpio-keys in that overlay.
In that context, maybe assigning KEY_NEXTSONG or KEY_PLAYPAUSE?


>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-wavesha=
re-wm8960-audio-hat.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 5a1c56cf98f6..27cce61893ad 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)      +=3D mahua-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D milos-nothing-asteroids.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-arduino-monza.dtb
> +
> +monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs   :=3D monaco-ardui=
no-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-arduino-monza-waveshare-wm896=
0-audio-hat.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-evk.dtb
>
>  monaco-evk-camera-imx577-dtbs  :=3D monaco-evk.dtb monaco-evk-camera-imx=
577.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm89=
60-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare=
-wm8960-audio-hat.dtso
> new file mode 100644
> index 000000000000..cf7b6a220bab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audi=
o-hat.dtso
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Device tree overlay for the Waveshare WM8960 Audio HAT connected to t=
he
> + * Arduino Monza 40-pin JHAT connector.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&{/} {
> +       /* on board fixed crystal */
> +       wm8960_mclk: wm8960-mclk {
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <12288000>;
> +               #clock-cells =3D <0>;
> +       };
> +};
> +
> +&i2c0 {
> +       clock-frequency =3D <400000>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       wm8960: audio-codec@1a {
> +               compatible =3D "wlf,wm8960";
> +               reg =3D <0x1a>;
> +               clocks =3D <&wm8960_mclk>;
> +               clock-names =3D "mclk";
> +               AVDD-supply =3D <&vdc_3v3>;
> +               SPKVDD1-supply =3D <&vdc_5v>;
> +               SPKVDD2-supply =3D <&vdc_5v>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +};
> +
> +&lpass_tlmm {
> +       lpi_i2s1_active: lpi-i2s1-active-state {
> +               clk-pins {
> +                       pins =3D "gpio6";
> +                       function =3D "i2s1_clk";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +
> +               ws-pins {
> +                       pins =3D "gpio7";
> +                       function =3D "i2s1_ws";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +
> +               data-pins {
> +                       pins =3D "gpio8", "gpio9";
> +                       function =3D "i2s1_data";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +       };
> +};
> +
> +&sound {
> +       pinctrl-0 =3D <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s=
4_active>,
> +                   <&lpi_i2s1_active>;
> +
> +       i2s1-playback-dai-link {
> +               link-name =3D "JHAT Analog Playback";
> +
> +               codec {
> +                       sound-dai =3D <&wm8960>;
> +               };
> +
> +               cpu {
> +                       sound-dai =3D <&q6apmbedai LPI_MI2S_RX_1>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6apm>;
> +               };
> +       };
> +
> +       i2s1-capture-dai-link {
> +               link-name =3D "JHAT Analog Capture";
> +
> +               codec {
> +                       sound-dai =3D <&wm8960>;
> +               };
> +
> +               cpu {
> +                       sound-dai =3D <&q6apmbedai LPI_MI2S_TX_1>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6apm>;
> +               };
> +       };
> +};
> --
> 2.53.0
>
