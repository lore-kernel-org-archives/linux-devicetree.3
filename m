Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502CB363C50
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995896; cv=pass; b=FQYuLLBHim+lqXEaWlhUhnq51hgBnqn87PH6qlEWD8tBEfWPYLVXA/PJxGlBesM2AdBKdDE0dJBx8gGJtDJlLuFeufmO7Vv8pmTAZcPKXHEYdAcbkCXLEtmY6pCtW5R61CW46eS4lu13fG46koJ6ogw0/0rb2G4zQhOut5g7FNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995896; c=relaxed/simple;
	bh=/F5bUrQOL6qjXqnNv8WEGRzaHmX1VWR0LG4ALaOjTpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0+Rf8gYT0mCVpyBwqbBLKTzd5nXthuAx33uDm5Dz2U0F5QKdVICJPDakm/qYmf9Uh1CDdruuMAvxiqiD6tYZzt0xt222ihlHGg70NKcd8qhrIyAUvGTWiqVvjfakHFwNvYZC+TCaxCW4bvBzFx3BMx4XmsiKV6yYOVeLvrErxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSXkUZ79; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BLsDQFoZ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSXkUZ79";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BLsDQFoZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CEAAG2187756
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 15:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=; b=FSXkUZ79BlApOINR
	af/MGmqQz++xr1KBSQFO1BQOhnKliuSWZGl3ECMY5fzC/ff8iqW2j8yTBQZ8qeIu
	yXJAGiE0zqmaYpx22VYaysHfRBsN61UJwzaX7lmU3aX8F0uUitTJJLX8msJVywIR
	8Zx/7+Ms/92vF8NFmM2E42NtDwcLRHzSy4X3K9kJlBdK/OOXWJrQ/IEozTnuQbIu
	dUTRA+1QmFO0APH0CmPfBjpTLNEQmQktkpxVDzMAyCxoQakk1LSnvi3LakHHou2H
	0jCZqc382wr4rLRbONa/otcXqt90r1m0/cgLoVi5lRIRpUiSBJChqzOBOdPjSuZb
	ZXQrXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce0u49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 15:44:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca154e2b5so161576846d6.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777995893; cv=none;
        d=google.com; s=arc-20240605;
        b=kmir2T3hvdxsc0zjSc8HVdqKsr6DZ1k1puQOgbg5NrVMK66YEDNRNx5k3Whvb7MKTR
         DRhyfUxmizD5eYMHhL56MmmbJ/3lpI1dhopTAcnZp6lt1lYXlnrO/R2xUA/ONTCEcaKO
         MmSzp6PpkfHSyPXHZ2L/ocpGOm5C0GkU8KX1HwMh/MgND+mvxWoRmVGDbzbPIc3XL9XL
         qz38qjbfR+pDgXJY6gogsxZ7+3hYDkVydn0jHrgLQi3dDwQMqO01UYND0b1MastzwDao
         hip69BTRvc83xr4lUbMdoXVrEBIYsXEwiZ2hLo8L928upl8iCskVIJozVnI/oIYCCJuE
         3w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        fh=mN1/0Dtk9HJx5hMKlf8drOum8Hr5RE4kiBittzc4VP0=;
        b=GBRveETVokDCaR9LhHIzMNca3qo73+RYsLmVX78jKnI1UeZ8nxYLDpqcSRN7UIVNoP
         Ag0A8iU0mHCM7ahRjvfi1TEcdtujZefHnfrrFcdO39DNVNt9wc9kNv5r/ZkVg5ExXbuG
         ZfYvdlnvNGDkP4Va03eVeUF5Toj4cRVd5SfFXzV1CJCyw903V/lGCF9d3bwsBtnTUYrF
         OeW2+lzXEOT3sck2XSlf0YBssyBx5GVavdkwbbZcesb26vLDpGCQ//Q5VFCqGJvyprw0
         KpHLuhIEtzH6fHhjUTSP3pWjmi0GKuyTgrKy2ZgKH0NGtwFEgMetuEpMa+2ho7KrsC2Q
         nHJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777995893; x=1778600693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=BLsDQFoZJckiVpPRva2HjCf7H8XPQqJ7but4pJRzuS13AO0kIeoEQtpq8ooMjIg5nR
         fTUwTJ8bMZ8r3dFOY5nSx+aXIJHWtg9J3xaQJIh/a8iu5xFN/oR00B8ZO6gpWjfiZfOz
         Z6qqo0m4KZ+Rqq9FnJY1KS6sqvcAtRbRy22phAXgZ5zuA5RfPwY220WZFCOq3xnPvCWC
         d6z6HK6OFBaSqtK5gq0LhPGk/sKrbtPtkHXRg8L8oj+aIlr9Dj2iUKSdlRfTwjrY3Ovc
         DN8ZP+dTS8YxemmbaBNTGNnbDzvXL3A8GUggkUrQkYFXjkH/hnPRd8pEsxOoqvm2mTwX
         ozHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995893; x=1778600693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHtuKQwh8UstxhITdsUE78yY+LEnRMi9wxCxBnmC8jc=;
        b=iwuo1jVLXfb+nijprsicuxDOD4wwjxGmEpgBzJluqFHc/tDvVoWc+YVbn+Rq8IQPiy
         I9pahZqYZ4p7+6xOpUaYlcuNXQ2YkK9wjjvLnv6OyK5S1SdWliapnt8H89V6Sjam+TBz
         5uhEm++r3wsBH74UM3Panuv7mRe2ssM+hdXTl5SA/IAQchXUiOY2QXXkBIPkxEc5XvUA
         FCR2ZGbtafvYkVkYQiBNmlkmvDEK38XDejby5nJ/g/LVsXMVw3MlrrT4+ROIf2j/+4HM
         K/9GtAjgmTKlkozBQHLOgvLulH20/UDiCgtvX+arp/JX7Jmupoo+ASv7uL/MTR/VAZ2T
         /8Lw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZLp3OsWUYC6Y4wElu/qEUFz29IkzVodaaprgZmPqydflr1Yb1LP4ITSLmeScWcFY3iOzcp9UK/S1F@vger.kernel.org
X-Gm-Message-State: AOJu0YxsqYwqnXGOLQL0DjVOY3+110YC1QG34Ymt9h+PRPavEEP+oDEp
	9yJePpigI8cLi8COdYdj6b4dc2DX2ydGOTPeGgqKIS/Z6m6lHnOx+0Y8LMyC9XTuA9MRaTFYa56
	uuLoDdRxsiVBDc3i69Z37aKj0JDpYGhQpcq/RAi4LyROWsWWriW8hwGRsDhGS4XgxoOIFQBIdYO
	LXcIZCX2I4kAdh2TAw+nLs4JyYIh3DuiACKh8z2E8=
X-Gm-Gg: AeBDietN4dMHfZzT0PEYI4gqEAn+stHj8zpH57UGntIk3o8r/ZTR7+Z5L3DUQvO4rMC
	liYTS+4kPcWKh3jXIdiep/aiInP342uzd6HUPdxDS4IkTBG0t1UScxDJwf7A228/AIALDcjP9u7
	BrJM7n8xHH71JTDNQ28bGzX2njPHlkaoxWgtFHIdr5a5vnqXYN64qn6axNuS2E9gPLPs/S7qTuF
	xqLuI/qKdYGrBrEzLHEqdf8ng5wR4O8d2jnvYCbECx3tWGeVzo=
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id d75a77b69052e-5104be18800mr207048191cf.16.1777995892868;
        Tue, 05 May 2026 08:44:52 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:50d:9174:cf33 with SMTP id
 d75a77b69052e-5104be18800mr207042311cf.16.1777995887526; Tue, 05 May 2026
 08:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc> <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
In-Reply-To: <20260430132140.30369-3-r.mereu.kernel@arduino.cc>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 17:44:36 +0200
X-Gm-Features: AVHnY4IJCC3ds5r3VsgLF9k8vq5o94dTl-X7DpRfJfmTcyAIRiLE7IATJGnRpPg
Message-ID: <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
        linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE1MSBTYWx0ZWRfX7qYNzMRfnMzb
 bh6w2u1WXnutd/Fw7KPy9/kW9732f7Ds485/FIrytDhcuoq4TLxD8erBq19eviMYZE4rWVt7X3Z
 9S+pB7rrF/t5JfuTYlVqstnX9Wjb5dHHvNal4u1DDAzKXp/amCEV4KXiGiTrB46BcCfjcEOI5y8
 QdXbJypq1Ecs/uo3VBP5/4TBfeWZYdT1PXGs1OJM8EMkIJ7cxqedO5qE6eoqcLIGpBnney1nYV/
 EqwTv3aacm3YmPuZix4FetpkO35W6xcceG6sRBm2bmnSVp+ITroTuyIZ9lVu+Ogk5wQw5lLUNxr
 9CRnSpniYT6pKdue1qYquoItu+hcsd9xeqo7crl32g2uvvpq0aZxhbmPu19R+BYA5pWpj9oskW0
 ORm8Bw4IQPDYz4B3iHSFNMMedJdoEocemBsr3EUXJ2xP9rF2gCM4axm6pEobYcmUNPgWamYxaZz
 vnrlzZCy5QZHr0A3Edw==
X-Proofpoint-GUID: 3OItQnosCFEAy5dBDEHoPFmSGLEypsma
X-Proofpoint-ORIG-GUID: 3OItQnosCFEAy5dBDEHoPFmSGLEypsma
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69fa1076 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=uNWQtxkOhitwP4Q5j2cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050151

On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
<r.mereu.kernel@arduino.cc> wrote:
>
> From: Riccardo Mereu <r.mereu@arduino.cc>
>
> This is done in order to support different video output over DSI.
> Since audio part is linked to Analogix USB-C controller it is moved to
> the same DTSO.

I'm a bit skeptical about having a separate DT overlay for this. Is
that really the right approach? The Analogix block is part of the main
board, so it feels like it should be the default video/audio output
defined directly in the board DTS, rather than in an overlay.

Would it make things unnecessarily complex if we instead keep it in
the main DTS, and only use overlays to remove or override properties
for the specific cases that require different routing (e.g.
media-carrier or waveshare)?

Regards,
Loic


>
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   5 +
>  ...ola.dts =3D> qrb2210-arduino-imola-base.dts} | 122 +++++++++++++++---
>  ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 +++++++++
>  3 files changed, 168 insertions(+), 20 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts =3D> qrb2210-=
arduino-imola-base.dts} (85%)
>  create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_=
sound-usbc.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 4ba8e7306419..e89a0e77072b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -193,6 +193,11 @@ qcs9100-ride-r3-el2-dtbs :=3D qcs9100-ride-r3.dtb le=
mans-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qcs9100-ride-r3-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qdu1000-idp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-base.dtb
> +
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola-video_sound-us=
bc.dtbo
> +
> +qrb2210-arduino-imola-dtbs :=3D qrb2210-arduino-imola-base.dtb qrb2210-a=
rduino-imola-video_sound-usbc.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-arduino-imola.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D qrb2210-rb1.dtb
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> similarity index 85%
> rename from arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> rename to arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> index bf088fa9807f..fb22effb9a35 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-base.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright (c) 2025, Arduino SRL
> + * Copyright (c) 2026, Arduino SRL
>   */
>
>  /dts-v1/;
> @@ -110,6 +110,106 @@ multi-led {
>                 leds =3D <&ledr>, <&ledg>, <&ledb>;
>         };
>
> +       sound: sound {
> +               compatible =3D "qcom,qrb2210-sndcard";
> +               model =3D "Arduino-Imola-HPH-LOUT";
> +               audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> +                               "IN2_HPHR", "HPHR_OUT",
> +                               "AMIC2", "MIC BIAS2";
> +
> +               mm1-dai-link {
> +                       link-name =3D "MultiMedia1";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA1>;
> +                       };
> +               };
> +
> +               mm2-dai-link {
> +                       link-name =3D "MultiMedia2";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI=
_MULTIMEDIA2>;
> +                       };
> +               };
> +
> +               mm3-dai-link {
> +                       link-name =3D "MultiMedia3";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA3>;
> +                       };
> +               };
> +
> +               mm4-dai-link {
> +                       link-name =3D "MultiMedia4";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6asmdai  MSM_FRONTEND_DA=
I_MULTIMEDIA4>;
> +                       };
> +               };
> +
> +               hph-playback-dai-link {
> +                       link-name =3D "HPH Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               lo-playback-dai-link {
> +                       link-name =3D "LO Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               ear-playback-dai-link {
> +                       link-name =3D "Ear Playback";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai RX_CODEC_DMA_RX_=
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 0>, <&swr1=
 0>, <&rxmacro 0>;
> +                       };
> +               };
> +
> +               hph-capture-dai-link {
> +                       link-name =3D "HP Capture";
> +                       cpu {
> +                               sound-dai =3D <&q6afedai TX_CODEC_DMA_TX_=
3>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6routing>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&pmic4125_codec 1>, <&swr0=
 0>, <&txmacro 0>;
> +                       };
> +               };
> +       };
> +
>         vreg_anx_30: regulator-anx-30 {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "anx30";
> @@ -165,6 +265,7 @@ anx7625: encoder@58 {
>                 analogix,lane1-swing =3D /bits/ 8 <0x14 0x54 0x64 0x74>;
>
>                 pinctrl-0 =3D <&anx7625_int_pin>, <&anx7625_cable_det_pin=
>;
> +               #sound-dai-cells =3D <1>;
>
>                 connector {
>                         compatible =3D "usb-c-connector";
> @@ -198,20 +299,6 @@ anx_ss_in: endpoint {
>                                 };
>                         };
>                 };
> -
> -               ports {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       port@0 {
> -                               reg =3D <0>;
> -
> -                               anx_dsi0_in: endpoint {
> -                                       remote-endpoint =3D <&mdss_dsi0_o=
ut>;
> -                                       data-lanes =3D <0 1 2 3>;
> -                               };
> -                       };
> -               };
>         };
>  };
>
> @@ -225,11 +312,6 @@ &mdss_dsi0 {
>         status =3D "okay";
>  };
>
> -&mdss_dsi0_out {
> -       remote-endpoint =3D <&anx_dsi0_in>;
> -       data-lanes =3D <0 1 2 3>;
> -};
> -
>  &mdss_dsi0_phy {
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-u=
sbc.dtso b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.=
dtso
> new file mode 100644
> index 000000000000..6fb256498cd1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dts=
o
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arduino SA
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&anx7625 {
> +       ports {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               port@0 {
> +                       reg =3D <0>;
> +                       anx_dsi0_in: endpoint {
> +                               remote-endpoint =3D <&mdss_dsi0_out>;
> +                               data-lanes =3D <0 1 2 3>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dsi0_out {
> +       remote-endpoint =3D <&anx_dsi0_in>;
> +       data-lanes =3D <0 1 2 3>;
> +};
> +
> +&q6afedai {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       #sound-dai-cells =3D <1>;
> +       dai@18 {
> +               reg =3D <SECONDARY_MI2S_RX>;
> +               qcom,sd-lines =3D <0>;
> +       };
> +};
> +
> +&sound {
> +       pinctrl-0 =3D <&lpi_i2s2_active>;
> +       pinctrl-names =3D "default";
> +
> +       hdmi-i2s-dai-link {
> +               link-name =3D "HDMI/I2S Playback";
> +
> +               cpu {
> +                       sound-dai =3D <&q6afedai SECONDARY_MI2S_RX>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6routing>;
> +               };
> +
> +               codec {
> +                       sound-dai =3D <&anx7625 0>;
> +               };
> +       };
> +};
> --
> 2.53.0
>
