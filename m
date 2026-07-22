Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDD235677C
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730969; cv=pass; b=O2IwP30umq1NMz42YCcHXo6m50hzxn2q7WZUKvlICvAFhQXaG3Ep2bS8M653Fp+EsEAa/lKF/x2bn1uYcxrH5VBTkqoZ1htve8FIAil44/AFu8ejbZnvE6aegf/Yc6BQwMFEgw0V3ttpyq/RoNblrc14fLzotL3tis/HNfyWU78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730969; c=relaxed/simple;
	bh=1vJyrAoL2euVy+qY3Yjv6srX/UU2a0Wpoeehhy9ElQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGnMeYtYm1j+d1a5AeOp6ajxmkoL1QRVnK+OVyleMCMH/HpZOjkbUmildd8uy7FZVjAqiN2dC6YRFA2OlnCj3ZEdg/7yVj+1gs3ThE49diudUX0FZ+UrxIpozS+rURRYauGofgSpak7J3O34Xyh4SC2EgzyDYGaX7d37AwByVEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMK2QAxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NY84YrxS; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMK2QAxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NY84YrxS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWi1a860766
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=; b=kMK2QAxDYnAbOfyd
	O35VxwihZ8jm0XkYxlmcJ1leh6VJJeSSmUADAkmQduwSpE5wp6AfYSD2MMg+WQGz
	frMAeI4Ofz5nD1j7iDHB/RMeScyK9Q9CeBrziWmQ5j1LWrg5uAWB8OP93JNLuV4r
	4AEA3FmPMEjatUcHpp73WVBwtCLEVUcCwCIdGHVFqs4naQr9bX9qbGl45tngYcja
	y3vrM6LsXhI2r9HtsE9hYNSXJpq+16jh47Zu/ryPKkjijMAECJnTsDX3yOPLoQ1n
	Jyyv/OWBv9MNgt4hYMXXVq89yjIGljb2Nfd3OHJ/VGhQ7Ou3NXM4M86YPkWw+8yW
	a/vOPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2n3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:36:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so1855768585a.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784730965; cv=none;
        d=google.com; s=arc-20260327;
        b=aefs0+bcyyUQyONAj77xFQ6cQRGCWU0wHsSAJp5qVdVN6U9BXwmO5ZMmfP8+rUslCx
         93S/8qKoX0wvycYthzCOZhJ18s5JvhYTM+G47kzg91xgMbRPirTHqprvJMjmqE4HF8Pv
         e0N2oedQXEIF64tyKohvvXpchbHveqBMdIUW0OB8n81fNcTxp07xw1Macrb7Cr0LfQAd
         cYOsgRjrDDYtTS07IYBp4L4QH8YN3d8D8pthK3zsbzGHnSEj6mR+gdq9Q7GTzKbwznwi
         ufpxUBA4AMksV+uRy/Ph5iCjLQyAru/loRjiRokJzN9pmWt6RbVD642zAEp3v3Exk0nb
         o1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        fh=oX4Uzg9dcyu2CDk+nh6soPZDCMVzgtSa2n/Wjl6aqLM=;
        b=B5lzlkRZ9QhQd1P02sJ3+0uKrtb24Fhmbgds04CmrhQnZE8Af0QD0UwUD2nEWKTc04
         +tAa3k2amnOhxC8rvf4HNif1lInImYGQfZlMvqqErPpmahWVsz57hMFLkE5C3vA463+e
         EVvSHJvnj2OWuF+6ldoLHi3/yqBdGSSm7ml/GaROjs2Exm9vVRyx/XP36ZVYih4AV+WC
         ZTMh+1rKx5ryGugs/AaxXYpkHWJw8csedyZwUh7t31cOIvSZ9K2f14n89fuUy+Mtt9fo
         KyUZUZ95No2fXtNsDbhYxn25iMOA9+PJX1o5v6oG3461ytdNtyq6b1bgx+ToeP/Sh0mv
         +gww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730965; x=1785335765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        b=NY84YrxSnn4vw8zq/jyvqGxDc3XUJKIYtFdyVxKUUw3LdD420EAozxO2XLQpRXMSAa
         MwFnovAoRRD1q+AByDlLCq2FuTC6bd0McEhui61uDAw3zyjbJmn6XI84h/u8xZkXnMhx
         bLvO0HaUD4w/DMMCBDIAwtcABM/bCxEuyt8ndmGk85x7QW4mLccATy+r3kU8oahWyLJX
         sa8nAY0UVpj09e2GkTSq7ji+36ZUONApvDF+UOIAyIQKCEFZNtQrf0MaINxr7CA1z6Ba
         4tH5K094+CXD+yT5YCuzvPOCTcY7DaWLfJVEoUj7PxEZHJDa5oLOn0VSiy58np+Qp9BG
         FNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730965; x=1785335765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WooIVRqK6kIZ1xrMCevJKUrFdBOtMfyMStJXi9H6/8w=;
        b=Qwrg++QPoWLT0AXe4NNGCZXwhdZpG+wvY0oSrMxHWi0SfRX1VjxWiKJiG5qXf8upMX
         5qHDmZlJULjSg6tW0mmHc3qWnwI3ACNaURlpMo5Fzb5ip78CO4FEIPaKl+1lek5fn8Qz
         /fOtZc8+ZzGl8Kr9TSiG/RyCkj9N5GJdaZpQzXE/9iqlrmuaN42oSqgpB2YMGq7pbJhV
         +RCF8zasSgWZ62CGm6oSkxatUuYA1bzOlpZ9UgPgbw0yCAAzofG9ifbLtBHXII5T+heQ
         OetAyHp6C3KM1NyNGYE6Jjc5hXkWkIakFBPyyNle4OlkRMhxj/1g9p6NAL4ow3aYat7v
         DCgA==
X-Forwarded-Encrypted: i=1; AHgh+RpVUy8oxDKc7tl+Ejez7ZiGBVzICcO5caSKYf4Ix7YTuKIJaD3AK4MZ2P/tdoEFIg+wYhngpZ6q9mSz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/UG+alvokDGPK8EwBmWAVg4joVReeKTpEaDqRPoOYS96QMk08
	jR3Lm5/r80XHMhlzg+JGeyVgH08W6lkDI12ftJpNxrC6qj3QTesh2XqYJN3nVHhdI5Su6Uq2Xtt
	k4thPIYi4t0v/EtXF8D6VgkYk6VFlrA6jqK3gVTJqJ1B2MBKZYp4OHC8R4kHgqeBdgAtQmd+Q+W
	oBCSiHlLmp0Zw+0rtIc5tBUfhsjKC1NwoLNASmHZQ=
X-Gm-Gg: AR+sD110kfW362tt24ka72fdjjgxpMokT5UMitZU8675jgpdnSvDJqYOednRN1PlULe
	lHLu1t3IIMjvuDK+K3he1sL258KWCgFhHhXa2nhNMAMaiqc24Pdr/8RVhhY9CKNUbDN7qiDvkSL
	cfhpedDgNAkDqgPIWbd/ttqAR+aV49oOMhYXtOOdki4l6DUywNb2aXKFXFtHrHWEImyFCACidch
	o1nvA3ZMSR8ZudYhwCdVyYrxO/qN43Lch+MqZMtGQQVO6+oSADq0mBuZUYcusvPQiDrmo2K/eM=
X-Received: by 2002:a05:620a:a0dc:20b0:930:f7ee:2ce6 with SMTP id af79cd13be357-930f7ee3746mr177005085a.31.1784730965098;
        Wed, 22 Jul 2026 07:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:a0dc:20b0:930:f7ee:2ce6 with SMTP id
 af79cd13be357-930f7ee3746mr177000885a.31.1784730964398; Wed, 22 Jul 2026
 07:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com> <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-3-32ec576c5865@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:35:53 +0200
X-Gm-Features: AUfX_myomlSaRfEvLnmECpgY5P9YRIZkvRRfkhd9ga-0ctiWS8sbnUwKFiSuGgk
Message-ID: <CAFEp6-0c60AW_XQFW27FawqumG087XyjasLs1-YkO_4hQZ45-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support
 for PMM8620AU
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60d555 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=YAKpJRmczyeQ_Nu4dK4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: q_enSYiFZjqS8yWxbx_FhtZ-DYR5_9iA
X-Proofpoint-ORIG-GUID: q_enSYiFZjqS8yWxbx_FhtZ-DYR5_9iA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX5mZg3oKSLZp6
 3wPFSD+/d0A62kArtkpmFwa1c3pjmSIdra2HzW7mJsH5P24u42FcHuDhp6V5+3kgvwZjyHZFlKM
 sSJwX1xmqdhB+1JfjzCuiRH8lo3stiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MyBTYWx0ZWRfX9pqzjdSOKqi5
 wNjksoEMDBtIRLlqx+0MDtu1LvNecExCCf4AIjKpoMpPslIpzptei5xXHvwMDQv+1HyMiRyiGSs
 ZpDkWnDfN3SACflqXihjKs1L/OA+sdBguScvWXlRA3qbTLYZ2GL3ZdxfNp0BXFgwzD/lmgIckUb
 LBr/Cw0kHgJD7GHCBhJXO6TE5q27B8JWBl6xeTKjjSEpD/Qxx2FY5WOM8+9zazOtZspQpBvt7s+
 cUFd3EcdRnEcKJxcABKBJHW1bG0Vd2D/dI5sfYg5JVOypuIz1WG7YKgR02xTepF9Xvfp1WTIfWg
 Oxv/mLTKKrEXEdt5P7UTYgNPn3nsHKHix5qp6ETgozkbRZgyUwu00iUYuiBHWnjIZuykB50KtRo
 +Lo+dq4iTX2H/8r/ddkMZAUmaZpNCszc+CtEyKUL6t4u65yz/cDI/+qB7dV33Rdrd0NOuZaBbin
 iPY2p9n8QSpyaRzSlgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220143

On Sun, Jun 14, 2026 at 10:06=E2=80=AFAM Jishnu Prakash
<jishnu.prakash@oss.qualcomm.com> wrote:
>
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
>
> Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
> present on the Monaco platform.
>
> Each ADC node exposes the following ADC channels:
>  - DIE_TEMP: PMIC die temperature channel
>  - VPH_PWR: Battery/supply voltage channel
>
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Tested ADC thermistor reading on Arduino Ventuno Q (Monaco Monza).

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot=
/dts/qcom/monaco-pmics.dtsi
> index e990d7367719..232bcb942b54 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
> @@ -5,6 +5,7 @@
>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>
>  &spmi_bus {
>         pmm8620au_0: pmic@0 {
> @@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
>                         interrupts =3D <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING=
>;
>                 };
>
> +               pmm8620au_0_adc: adc@8000 {
> +                       compatible =3D "qcom,spmi-adc5-gen3";
> +                       reg =3D <0x8000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       interrupts =3D <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING=
>;
> +                       #io-channel-cells =3D <1>;
> +
> +                       channel@3 {
> +                               reg =3D <ADC5_GEN3_DIE_TEMP(0)>;
> +                               label =3D "pmm8620au_0_die_temp";
> +                               qcom,pre-scaling =3D <1 1>;
> +                       };
> +
> +                       channel@8e {
> +                               reg =3D <ADC5_GEN3_VPH_PWR(0)>;
> +                               label =3D "pmm8620au_0_vph_pwr";
> +                               qcom,pre-scaling =3D <1 3>;
> +                       };
> +               };
> +
>                 pmm8620au_0_gpios: gpio@8800 {
>                         compatible =3D "qcom,pmm8654au-gpio", "qcom,spmi-=
gpio";
>                         reg =3D <0x8800>;
> @@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
> +               pmm8650au_1_adc: adc@8000 {
> +                       compatible =3D "qcom,spmi-adc5-gen3";
> +                       reg =3D <0x8000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       interrupts =3D <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING=
>;
> +                       #io-channel-cells =3D <1>;
> +
> +                       channel@203 {
> +                               reg =3D <ADC5_GEN3_DIE_TEMP(2)>;
> +                               label =3D "pmm8650au_1_die_temp";
> +                               qcom,pre-scaling =3D <1 1>;
> +                       };
> +
> +                       channel@28e {
> +                               reg =3D <ADC5_GEN3_VPH_PWR(2)>;
> +                               label =3D "pmm8650au_1_vph_pwr";
> +                               qcom,pre-scaling =3D <1 3>;
> +                       };
> +               };
> +
>                 pmm8650au_1_gpios: gpio@8800 {
>                         compatible =3D "qcom,pmm8654au-gpio", "qcom,spmi-=
gpio";
>                         reg =3D <0x8800>;
>
> --
> 2.43.0
>
>
