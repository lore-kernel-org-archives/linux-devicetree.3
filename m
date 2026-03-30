Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D788B3A7595
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907538; cv=pass; b=VD6nBCylKuYjvjOOz24OhNpvlTLRwdJ/XDI4QQlJBTjBNaO5nc3eeuR6ntdDuT8+qij4qBV2SaJ4C2JkT+L63OWzIjpY0kYz30lLhuv33cplqTg7X+p0xcIS3QzbMY4va5yPm2pebhTfml+IUzEKIwHKRWSNU39pZJn0b/ajzQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907538; c=relaxed/simple;
	bh=5skPz+dm2mJPiqcIC/IzeT131Uv9zufab/KpZFE9+b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzReVH9GezGzaNEhhJbvvqzQqbz/QVSdq9OBAVce+gFIP1jbL5lwzUMbA3lMU1uHVWGCZvWPTWBSEigu/hggBDzO4x4/25YOUzr93bmdBsDrLQjKHcwKV7ll13YfH++sJorxI1AbOkRTsmfmgH3p5FDTSTzhY7T0WPc6ediwKFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFAXvZzt; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFAXvZzt"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so5724539e87.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774907533; cv=none;
        d=google.com; s=arc-20240605;
        b=HMp8IVrQFp6IrH5su2UuXFoNx58sKVc8BpZabDgRa6ygqfPLNRmQWQWeB6ChTwCYZa
         AB8PITVh+6y/PsZ/hoXS4uzVVBmeouPhCjUqgWfn0qZFFj/GiqKOx+pWtFviBwWsYCuA
         wMfY2TVNfXpnkH6HBu0vKbzQgjTXN0sxRo4ePa3sH4yVxneGGiQhdbOcBIdhZjqO5j0V
         kTuQe9mxq/0YjiqKeZkSAjT1Iyrc5SEIBAZFQIRt6x1zequxkPepGClxPhdnn91Q8RQy
         fnZ6Uo3nhVaAsChMHPjkrgUQoQE0g4HKBTiB1YlASZslxjjvoSuwAbzs0tuRbz7HuQc8
         iQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        fh=+tVeLrbhhtgZws7bJ7tNwZTRdvEcRTGLt5lyaxN//Kw=;
        b=jncjgkDun51TdvC5KmIJPjvCgDZIJ7C83J/JFAn1ikmICyrGIAlypjx3I65c+E5l7o
         I1g6bMHbKuZNJcQTIEnYKqG7r+WyChHfSXGkmPkHRUqHt+MLZ4qnWtMoXtFsJ5AGjefy
         xld6ZJS8nFgLM3YC8z98w7k4TThl8pEhjC6jjtUcwkN/L+1opvxneGflCKT/dF8H2vD+
         mq3EPmkZ0X2dPr7ajeZ2RkVLgE/SAHHAmOmPu+lb2n1zx8JRhvwoKZKnpW1yso9N9CAE
         HJUreGVK9dM/dGuh4zmFPNT5IpUWZaSQyVvwCFeShACxTdf9b2AoGOl0rY/afnqnajtC
         Saiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907533; x=1775512333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        b=GFAXvZzt9SUl7DheUeJFgL5OOpLHwxuma/KAx5OPZc+E60nJF2slbPnC/2PsU6B8u4
         OQT6nOClaY+f3WrqZ0gEipPG1cseEgygX3bY1VEdyTWN9C8OzCCZL/2whwHC70Dxn4Zv
         eKoOOqBx/kDcn7bN34c1G7Eirt4BhHw+Wg4usMVCvASmfLw4p3yhoeFAg9RGZLQjfiIK
         timtpSNe+39JC4/J8HYe6gSEWRo34eQijxitVE6dFf+xAwyzreHUHLP1Vao28eGip8tO
         hHX/62piJwBBd6LVPvNNH/cb8Z8NUYVG2Axv/2Y0okCz55HsNMD9m03ksRJ2zCm95fgK
         oRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907533; x=1775512333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SG2By7SJ8ahbrRksQlxh1xlnOX6AJjd7EKuFZuGmfS4=;
        b=WiknOU8NPJbH19Oxojvt+GEn2vgY+z2Cqahg7YneNUJfrWQpz/H8lvcwTMk4kxLVxp
         0bLarVM8Q1K6MJNgPaEQd6PdrwyFjkbj5JubjFk2nvpm4S7J96LwcnaWNsRxyqwlY8SF
         O5v4Bol//7U4M497k6MlWr8eHw/VL5AgcdJ8FYvYLlvl1PYksT0x19pvJi3RpFvsmhtk
         BVc4PocfzkV0oSyok0dX6N1zCXMRaQNeFH2eVRdJk/UoayPX9b8csQudgRUrag9ttaYc
         ykmeCP+5rIOAKceyaLw/ggIOm9nrXJoz7GlKswr2ogREDkCtSlWD0bzESZ2SpIEnMlbs
         TK6g==
X-Forwarded-Encrypted: i=1; AJvYcCXwh0HFOrlZjE8VOhjBPe4DFlWA5y1amiX7eUbP8Ci055/4XdeRxe16g30VmHa7cfQ+As96+8nabi+r@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDMfnFLIfMHlrP7mfoIg350cg+taOqQWbVSkCA4Vyv8RR6EBs
	MNh+g4IpzdfMnOh1EZ6f0LZGnGSuKapHrQbvdbH66AZZKY3UUXMpOgAUt7/0jDteEc1dwuWSEE0
	HrKZcPhklamUlzBdOH5mtyUNqAXuEmlY=
X-Gm-Gg: ATEYQzwEg92Lxu5P41Dg+G1jLT/RLB78Za03svDTLq/kXLwT3bU6UQtD5rc5HNxzsE3
	kXjY/L+jXngL9yRzERE/OBGV2etXw8Ei38Z9KpXmDge7MVww1CEYFQ1C9QI3atRXBtvdQSVuLLU
	doVSLb5Xos6jYIhIw69T0vyKkHUrqPJZZsYGRHT8usZn7Zptt2W73dRWFVgsYhCJH5IRkw/chKS
	AkCS6mTYd+q0oiPRejN0TTthp7tBNQzEMqTeBCj04xNAfgx68wfHt0nlWPViDodOb0Q2phBo48l
	sBypLdrHxCT/RQAOcUpeFlf6rJMtlZNHV8Pn7imoFevVELjM6Kh/h1kSFTvZ3pQyFp3b
X-Received: by 2002:a05:6512:3b07:b0:5a2:a70a:a87 with SMTP id
 2adb3069b0e04-5a2ab5fe37amr4693752e87.4.1774907532840; Mon, 30 Mar 2026
 14:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <20260219-sm8550-ddr-bw-scaling-v3-2-75c19152e921@gmail.com> <acqJWzQHi7ajuzml@baldur>
In-Reply-To: <acqJWzQHi7ajuzml@baldur>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Mar 2026 16:52:00 -0500
X-Gm-Features: AQROBzBSprTm678Bpr5Zg3Zy6uWh15uCsDK4vtL0BXfr7GyuKBhCujxCY7eJ2iE
Message-ID: <CALHNRZ-tOk7m+JJLU3gm=bM-VMP1LCdcNQUUhHBPsbbQ-mW94g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8550: add cpu OPP table with
 DDR, LLCC & L3 bandwidths
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Georgi Djakov <djakov@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 9:33=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Feb 19, 2026 at 10:07:40PM -0600, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> > to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 ca=
che
> > frequency by aggregating bandwidth requests of all CPU core with refere=
nc
> > to the current OPP they are configured in by the LMH/EPSS hardware.
> >
> > The effect is a proper caches & DDR frequency scaling when CPU cores
> > changes frequency.
> >
> > The OPP tables were built using the downstream memlat ddr, llcc & l3
> > tables for each cluster types with the actual EPSS cpufreq LUT tables
> > from running a QCS8550 device.
> >
> > Also add the OSC L3 Cache controller node.
> >
> > Also add the interconnect entry for each cpu, with 3 different paths:
> > - CPU to Last Level Cache Controller (LLCC)
> > - Last Level Cache Controller (LLCC) to DDR
> > - L3 Cache from CPU to DDR interface
> >
>
> "8 out of 11 hunks FAILED", it seems things moved since you wrote this.
> Can you please help me by rebasing this onto linux-next and resubmitting
> it?

This was a conflict from the EAS patch. I have sent a new revision
rebased on today's -next.

Aaron

> Regards,
> Bjorn
>
> > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 367 +++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 367 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts=
/qcom/sm8550.dtsi
> > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..de4d43f7b8d2416997db70c=
98b0fc36d25f3c2a6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > @@ -17,6 +17,7 @@
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interconnect/qcom,icc.h>
> >  #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
> > +#include <dt-bindings/interconnect/qcom,osm-l3.h>
> >  #include <dt-bindings/mailbox/qcom-ipcc.h>
> >  #include <dt-bindings/power/qcom-rpmpd.h>
> >  #include <dt-bindings/power/qcom,rpmhpd.h>
> > @@ -78,6 +79,13 @@ cpu0: cpu@0 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_0: l2-cache {
> >                               compatible =3D "cache";
> > @@ -104,6 +112,13 @@ cpu1: cpu@100 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_100: l2-cache {
> >                               compatible =3D "cache";
> > @@ -125,6 +140,13 @@ cpu2: cpu@200 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 0>;
> >                       capacity-dmips-mhz =3D <1024>;
> >                       dynamic-power-coefficient =3D <100>;
> > +                     operating-points-v2 =3D <&cpu0_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_200: l2-cache {
> >                               compatible =3D "cache";
> > @@ -146,6 +168,13 @@ cpu3: cpu@300 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_300: l2-cache {
> >                               compatible =3D "cache";
> > @@ -167,6 +196,13 @@ cpu4: cpu@400 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_400: l2-cache {
> >                               compatible =3D "cache";
> > @@ -188,6 +224,13 @@ cpu5: cpu@500 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_500: l2-cache {
> >                               compatible =3D "cache";
> > @@ -209,6 +252,13 @@ cpu6: cpu@600 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 1>;
> >                       capacity-dmips-mhz =3D <1792>;
> >                       dynamic-power-coefficient =3D <270>;
> > +                     operating-points-v2 =3D <&cpu3_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_600: l2-cache {
> >                               compatible =3D "cache";
> > @@ -230,6 +280,13 @@ cpu7: cpu@700 {
> >                       qcom,freq-domain =3D <&cpufreq_hw 2>;
> >                       capacity-dmips-mhz =3D <1894>;
> >                       dynamic-power-coefficient =3D <588>;
> > +                     operating-points-v2 =3D <&cpu7_opp_table>;
> > +                     interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> > +                                      &gem_noc SLAVE_LLCC QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&mc_virt MASTER_LLCC QCOM_ICC_TA=
G_ACTIVE_ONLY
> > +                                      &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ACTIVE_ONLY>,
> > +                                     <&epss_l3 MASTER_EPSS_L3_APPS
> > +                                      &epss_l3 SLAVE_EPSS_L3_SHARED>;
> >                       #cooling-cells =3D <2>;
> >                       l2_700: l2-cache {
> >                               compatible =3D "cache";
> > @@ -397,6 +454,306 @@ memory@a0000000 {
> >               reg =3D <0 0xa0000000 0 0>;
> >       };
> >
> > +     cpu0_opp_table: opp-table-cpu0 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-307200000 {
> > +                     opp-hz =3D /bits/ 64 <307200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-441600000 {
> > +                     opp-hz =3D /bits/ 64 <441600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (38=
4000 * 32)>;
> > +             };
> > +
> > +             opp-556800000 {
> > +                     opp-hz =3D /bits/ 64 <556800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-672000000 {
> > +                     opp-hz =3D /bits/ 64 <672000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-787200000 {
> > +                     opp-hz =3D /bits/ 64 <787200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-902400000 {
> > +                     opp-hz =3D /bits/ 64 <902400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (84=
4800 * 32)>;
> > +             };
> > +
> > +             opp-1017600000 {
> > +                     opp-hz =3D /bits/ 64 <1017600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (94=
0800 * 32)>;
> > +             };
> > +
> > +             opp-1113600000 {
> > +                     opp-hz =3D /bits/ 64 <1113600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (10=
56000 * 32)>;
> > +             };
> > +
> > +             opp-1228800000 {
> > +                     opp-hz =3D /bits/ 64 <1228800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (11=
52000 * 32)>;
> > +             };
> > +
> > +             opp-1344000000 {
> > +                     opp-hz =3D /bits/ 64 <1344000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (12=
67200 * 32)>;
> > +             };
> > +
> > +             opp-1459200000 {
> > +                     opp-hz =3D /bits/ 64 <1459200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (12=
67200 * 32)>;
> > +             };
> > +
> > +             opp-1555200000 {
> > +                     opp-hz =3D /bits/ 64 <1555200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1670400000 {
> > +                     opp-hz =3D /bits/ 64 <1670400000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1785600000 {
> > +                     opp-hz =3D /bits/ 64 <1785600000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (14=
78400 * 32)>;
> > +             };
> > +
> > +             opp-1900800000 {
> > +                     opp-hz =3D /bits/ 64 <1900800000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (768000 * 4) (16=
89600 * 32)>;
> > +             };
> > +
> > +             opp-2016000000 {
> > +                     opp-hz =3D /bits/ 64 <2016000000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1555000 * 4) (1=
804800 * 32)>;
> > +             };
> > +     };
> > +
> > +     cpu3_opp_table: opp-table-cpu3 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-499200000 {
> > +                     opp-hz =3D /bits/ 64 <499200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-614400000 {
> > +                     opp-hz =3D /bits/ 64 <614400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-729600000 {
> > +                     opp-hz =3D /bits/ 64 <729600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-844800000 {
> > +                     opp-hz =3D /bits/ 64 <844800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-940800000 {
> > +                     opp-hz =3D /bits/ 64 <940800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1056000000 {
> > +                     opp-hz =3D /bits/ 64 <1056000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1171200000 {
> > +                     opp-hz =3D /bits/ 64 <1171200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1286400000 {
> > +                     opp-hz =3D /bits/ 64 <1286400000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1401600000 {
> > +                     opp-hz =3D /bits/ 64 <1401600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1536000000 {
> > +                     opp-hz =3D /bits/ 64 <1536000000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1651200000 {
> > +                     opp-hz =3D /bits/ 64 <1651200000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1785600000 {
> > +                     opp-hz =3D /bits/ 64 <1785600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1920000000 {
> > +                     opp-hz =3D /bits/ 64 <1920000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-2054400000 {
> > +                     opp-hz =3D /bits/ 64 <2054400000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2188800000 {
> > +                     opp-hz =3D /bits/ 64 <2188800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2323200000 {
> > +                     opp-hz =3D /bits/ 64 <2323200000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2457600000 {
> > +                     opp-hz =3D /bits/ 64 <2457600000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2592000000 {
> > +                     opp-hz =3D /bits/ 64 <2592000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2707200000 {
> > +                     opp-hz =3D /bits/ 64 <2707200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2803200000 {
> > +                     opp-hz =3D /bits/ 64 <2803200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +     };
> > +
> > +     cpu7_opp_table: opp-table-cpu7 {
> > +             compatible =3D "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp-595200000 {
> > +                     opp-hz =3D /bits/ 64 <595200000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (30=
7200 * 32)>;
> > +             };
> > +
> > +             opp-729600000 {
> > +                     opp-hz =3D /bits/ 64 <729600000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-864000000 {
> > +                     opp-hz =3D /bits/ 64 <864000000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (547000 * 4) (49=
9200 * 32)>;
> > +             };
> > +
> > +             opp-998400000 {
> > +                     opp-hz =3D /bits/ 64 <998400000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1132800000 {
> > +                     opp-hz =3D /bits/ 64 <1132800000>;
> > +                     opp-peak-kBps =3D <(300000 * 16) (768000 * 4) (72=
9600 * 32)>;
> > +             };
> > +
> > +             opp-1248000000 {
> > +                     opp-hz =3D /bits/ 64 <1248000000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1363200000 {
> > +                     opp-hz =3D /bits/ 64 <1363200000>;
> > +                     opp-peak-kBps =3D <(466000 * 16) (1555000 * 4) (9=
40800 * 32)>;
> > +             };
> > +
> > +             opp-1478400000 {
> > +                     opp-hz =3D /bits/ 64 <1478400000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1593600000 {
> > +                     opp-hz =3D /bits/ 64 <1593600000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
056000 * 32)>;
> > +             };
> > +
> > +             opp-1708800000 {
> > +                     opp-hz =3D /bits/ 64 <1708800000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1843200000 {
> > +                     opp-hz =3D /bits/ 64 <1843200000>;
> > +                     opp-peak-kBps =3D <(600000 * 16) (1708000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-1977600000 {
> > +                     opp-hz =3D /bits/ 64 <1977600000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
267200 * 32)>;
> > +             };
> > +
> > +             opp-2092800000 {
> > +                     opp-hz =3D /bits/ 64 <2092800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2227200000 {
> > +                     opp-hz =3D /bits/ 64 <2227200000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2342400000 {
> > +                     opp-hz =3D /bits/ 64 <2342400000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2476800000 {
> > +                     opp-hz =3D /bits/ 64 <2476800000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2592000000 {
> > +                     opp-hz =3D /bits/ 64 <2592000000>;
> > +                     opp-peak-kBps =3D <(806000 * 16) (2736000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2726400000 {
> > +                     opp-hz =3D /bits/ 64 <2726400000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
478400 * 32)>;
> > +             };
> > +
> > +             opp-2841600000 {
> > +                     opp-hz =3D /bits/ 64 <2841600000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +
> > +             opp-2956800000 {
> > +                     opp-hz =3D /bits/ 64 <2956800000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +
> > +             opp-3187200000 {
> > +                     opp-hz =3D /bits/ 64 <3187200000>;
> > +                     opp-peak-kBps =3D <(933000 * 16) (3686000 * 4) (1=
689600 * 32)>;
> > +             };
> > +     };
> > +
> >       pmu-a510 {
> >               compatible =3D "arm,cortex-a510-pmu";
> >               interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster=
0>;
> > @@ -5437,6 +5794,16 @@ rpmhpd_opp_turbo_l1: opp-416 {
> >                       };
> >               };
> >
> > +             epss_l3: interconnect@17d90000 {
> > +                     compatible =3D "qcom,sm8550-epss-l3", "qcom,epss-=
l3";
> > +                     reg =3D <0 0x17d90000 0 0x1000>;
> > +
> > +                     clocks =3D <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
> > +                     clock-names =3D "xo", "alternate";
> > +
> > +                     #interconnect-cells =3D <1>;
> > +             };
> > +
> >               cpufreq_hw: cpufreq@17d91000 {
> >                       compatible =3D "qcom,sm8550-cpufreq-epss", "qcom,=
cpufreq-epss";
> >                       reg =3D <0 0x17d91000 0 0x1000>,
> >
> > --
> > 2.52.0
> >
> >
