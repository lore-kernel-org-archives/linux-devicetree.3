Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A93AB48F
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906964; cv=pass; b=iF5CUL62/VJ2TbSWfJBzZbPK2pQ62iechshwouxkShS5kfDfLU5gyT7+2W4aJXv3wwhQjle9gwdwXXJ7FZKdUimm5oOI0J/wUYGn2iwqccDe3oaMb/UIj9SDFG4+uwr7Oo8X87SK5QuSogr/o3t9aSQUb+Vzn12yRpLL9hKso7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906964; c=relaxed/simple;
	bh=vtWNS3npdkcAslK/SBBMO1SRfQSABiKbV8HThujbXD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlis7EJdzIVLYiG/F/v9oApfCc+sMz2o0nHfVt+2+x/Yu5LKvKv1ZmuCXX1lvKbaIwJGIIsKndkV/nTMdZWBDT9iklWks470ZxDDeSOuhAPU6DjtStlXliQqw6ayyInwfnlRfc0jJivQJeWlN+bT8fD0NnmTBjq+kQNjeW333Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6lLaA8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dcIp1Ups; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6lLaA8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dcIp1Ups"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Ok1o2347122
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 08:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=; b=E6lLaA8qN09yGM+s
	c+LUGNc/oB5k0DXe8dZ6ZZsQPGDMTMob4DRZoWJLiZdUObBzjZgJJgQeoL/XVOgm
	OSH6M5XIugSvBr16h3HG6vCUKQGG8DY6Trjf0knwsA+CN8DIxSrVu1eEplln7Mj+
	C56Fu2DvVxiV0A9U5GcQsroffiLpMkXjmY1xD/zAveUgBW+fVu5KX+0OgaAab8gw
	8SR6n69zkCoWI+E3ZZ6IV88maTxranZUJUvTDn0AWSoY4Wi5lLu85j/ijRJWCJKg
	RsIm4M7+yLDQxv/+4fy6Hbm+XPBQPN0WVWKXr6RnVqfOHFrtGaWKrz+8DwpE/zQ3
	/XNh2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emagrf1tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 08:22:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c1997732so303986685a.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780906958; cv=none;
        d=google.com; s=arc-20240605;
        b=GanDZxRnMLWJ0e+bduMZRr0xIdoh38GeGrlgBNTtWHNZFzLs5UWdbiU3FItswQuvCH
         U8qzXIqIV018pXOoOAyTsPZzL7jILJmkEBaDdd6LoxXTwqwkR9pdH5rplonlNw64EDaz
         3YiDZiDxZplrFt0d07FF9fjlddkRfiPEEpWpJiUTstXtrJMIWYIgAU40RsGvhf6B8EJp
         103VfeuRxfJ9j6zpYbvxckLppW8XHVwOPku+s7ZNqja6QG/XQmp2v9+7qXZ396EXMkbm
         FQepN0oUMuVlTptMI15D0/8i3yDP+GiN2E0fXeWcUnjC+Aol+VpNnk0rVtefvDcZMdS9
         56HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        fh=D77fp8SyueZ2HfFUZJ9TqxD+p6LXHlPZDzpWNousOas=;
        b=bsXzdCuIh1EP+G3F97UgLW+Wowgr47GrfkPe/z6o7U4ky/QkkvSXJreRll4t0PdF5l
         k82mfg4nd1Ov2YTNnyxDRvveTek33UoDyUe731WXyMJloI80e5uIy4EOSpJ4c6eYDr4B
         DZh4+z4kuRC7p9GXc1/3jowp4Zy9js5y8QalXV9eXNM/UniWyO8tKtG9Bht9Lbz0reBX
         HJ4YoPks/Eioei6XPoGO2LpHqXQGAL+iqkob2slMJdLqvTodCBF1h9NaG9sfiS59+1+3
         2lDI17aW+MtIbIpG1DBjF+DBYTRgLcu6JFdh68GZPE7K5s+jI+vnppxs+2OXKUPuMUB7
         qs0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780906958; x=1781511758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        b=dcIp1UpsVcwo2HBMwV6XcwuN1/QDxFNzp+kZq8LIS1YNTAAWIiMA/NoM3sfzCJyYXG
         cJOOJumMMHX5nEsY03btyD23HgeYl3tbN7YomVCkwnzeeYi1Pv8fzH6fAdxoUQzs/aVL
         oEfyHj1WfPR7LZVf4QklFzPoiOZ97YwXxQJDl77n4WIuvOyWCQbGlyCwroDTaspfLTQN
         sURLhgNrffLs21I/v1/DnRZhKvhvz4yhJ6VIhwfIZloONlv+Fl1srQB2O8giNjPjHGmM
         muE75yhkfvim/VOWZXMF7OHoNaiux5eBOofswmlXJiinYUZBJZBG6GtY+jKoju71sass
         GT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906958; x=1781511758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9wGRM2G7GFOfRieqrdglkkypXPcFdrC7Gmylel9Y3go=;
        b=EA6bO0PIH34r+PaQg2NUFUlR5e9ZG0xjfTBB8dS9Oh5Fl3QUoAV4oUG/CgVaL7BOtn
         Yr0YZV7+BdzWO2evusO8sjLGTq4gYZACjnRV0mdzd7oNinfZc/vTj7rtKeqEwOE65llY
         5pkxjnJ1UmgoRpTKvVBU2T3s5djLVEHrMeeiKUCBKpg/ew1QIu9gCPnJBGGu3N7g2kKh
         sIPy5AWzLTvg6DXoOHHax78ruo6FELy+zRR0ZQqKMXpyc4yrqbpBw7wdQ0iXTu5gBRYy
         hCB1b93e7WUGbsUmuqJFlUhC3Exfn5pCbsvpQUculEA4caiOzXlajlOMTogABku3rOcv
         cBNw==
X-Forwarded-Encrypted: i=1; AFNElJ9HO+AGuQhPwpDzvCy6ZmnO6I4D851d2Gaxa8OMtv/cHxn3eyyXpehaWFuZa7qwCJPyWqjywj5Cfu4q@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsOKecLvFzMlv0kTpixEgs4iqMuD2W7OwtDOvn9TjAGaS86Gp
	F5FdFXWJlO/M1CGm0Lpgar75mZ2+xCZaIx9MGQ1Ck5aZmEB6gQAYrKPhi1IaRF+uny+QKKJ28vZ
	CQxOVkZBko4E6AZQixTOdSlnZt4kBtzGApyihjxA9+5wCmNVMK81oFu42cZtPBOLXrNCx3ws0so
	8YuGkCnZfyGDBfflhUv37jweT3YkTiPrYjoHAkrNM=
X-Gm-Gg: Acq92OEVp0i9np+dJcMG/+QHFEOAt/HJ/i6EP0RhEouseuHavWXrC0iUSWiJ1oHu0XP
	Hl+cqH/JAt53UxnGq/SsQi5xBhXbTmsXRR9cOu4y5jKeuP1BPS/jtKD0O/MDai0oGXvtsSeEUHt
	CUgvzeJ7Q82ivqFfEk6cQ1TkpaMZ06bIunVytf10WBiaslIp9caaft7Z0rkb9ivSDcUNM1QfPyU
	QvOYy//OYXitKAb8+g42I5nqh7ISwaFx1Ecz1vuiLOP7JuhtmAu3otqwW62Kdeh1wTPqZ6qd0pR
	VD+Jrg6+WQ8ru4X1R0OQRCT8el8KgtnSmALFCTNhcxmcBNO3leWtnblAm9wb
X-Received: by 2002:a05:620a:f0d:b0:915:931e:5e8c with SMTP id af79cd13be357-915a9c7584dmr2385826585a.7.1780906958028;
        Mon, 08 Jun 2026 01:22:38 -0700 (PDT)
X-Received: by 2002:a05:620a:f0d:b0:915:931e:5e8c with SMTP id
 af79cd13be357-915a9c7584dmr2385823485a.7.1780906957558; Mon, 08 Jun 2026
 01:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
 <CAFEp6-2rT5fXkWaa-Fd--h8zuJ7kQqPyjedGNXrGvco79yMJCg@mail.gmail.com> <2f963239-e1f3-4966-b442-7d44f372ea3d@oss.qualcomm.com>
In-Reply-To: <2f963239-e1f3-4966-b442-7d44f372ea3d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:22:25 +0200
X-Gm-Features: AVVi8CfaqXeEW7_fGzZ87WHqiQ-n3gAVt2qJ12GlDUzulGzVwqZJCRnMLkCi62M
Message-ID: <CAFEp6-0xpsNHn-Dg9LKLvMbnPD6DBo6fi5iEo6DWR8uosVxQfw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NiBTYWx0ZWRfX2AdAfsGBiLBu
 wDQJF9uHAPo4FRFo7YJSc3GL+n1ojrFVaDtoEjXE07x/mVaO8F/00kqfvL01ZVqf4z8Trw/ctJk
 PqWVrwPD1pDoPjHY+KWhW2WX2SQxmwLJwdbkVoup1kaXSCDWljHxp1jMlQYr/zzgqlZZoJ1Ajer
 Qq1WGaS19dbBKG7WINxbwvY0A03ZRGNDdnzODuBcqffT99SmDeyt5WGcm5YIsBllb/uJ9zPPLaN
 XGeqzubaxDAMuPCunRxrrM9rsE0RW287lnexQQVHm6JHWEfkJz7kIR+IOfU2E2SHlPm+AtQ/tvT
 oZvWUKhk44NOZZ8vuI/7z7a3TMPiIqYDFp+C3b2hhbAxfRbWBIah2CvePLuwNoa4LUubFMMtBif
 GOEG9ifd7nepwzXq/64lFMqBXpIOJa4cvp1M7AUcoXTRXc0s6YpqGD5Rjm/LaEiL6UuzskCJm8a
 tvn4dm9Vt5cjuNid9Cg==
X-Authority-Analysis: v=2.4 cv=G/4s1dk5 c=1 sm=1 tr=0 ts=6a267bcf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=gccCA3bCN5zK5WmTdcQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: r8HOdjDwVaCGWpGnR0R1vUsSv8b24XJU
X-Proofpoint-GUID: r8HOdjDwVaCGWpGnR0R1vUsSv8b24XJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080076

On Mon, Jun 8, 2026 at 4:26=E2=80=AFAM Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
>
>
> On 6/6/2026 8:57 PM, Loic Poulain wrote:
> > On Mon, Jun 1, 2026 at 2:57=E2=80=AFPM Komal Bajaj <komal.bajaj@oss.qua=
lcomm.com> wrote:
> >> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> >> EVK boards using the WCN3988 combo chip.
> >>
> >> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> >> board-specific regulator supplies across CQM, CQS and IQS Shikra
> >> EVK boards.
> >>
> >> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> >> with register space, interrupts, IOMMU configuration and reserved
> >> memory. The node is kept disabled by default and enabled per-board
> >> with the appropriate PMIC supply connections and calibration variant
> >> selection.
> >>
> >> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> >> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> >> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> >> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> >> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++=
++++++
> >>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++=
++++++
> >>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
> >>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++=
++++++++++
> >>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
> >>   5 files changed, 223 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-cqm-evk.dts
> >> index b112b21b1d79..c2ed0396533a 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> >> @@ -16,11 +16,48 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm4125_l7>;
> >> +               vddxo-supply =3D <&pm4125_l13>;
> >> +               vddrf-supply =3D <&pm4125_l10>;
> >> +               vddch0-supply =3D <&pm4125_l22>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +94,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> >> +
> >> +       status =3D "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-cqs-evk.dts
> >> index e62ba5aef71f..3bfd0050064f 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> >> @@ -16,11 +16,48 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm4125_l7>;
> >> +               vddxo-supply =3D <&pm4125_l13>;
> >> +               vddrf-supply =3D <&pm4125_l10>;
> >> +               vddch0-supply =3D <&pm4125_l22>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +94,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm4125_l7>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> >> +
> >> +       status =3D "okay";
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boo=
t/dts/qcom/shikra-evk.dtsi
> >> index 8b03d4eafa6d..a79f44aff968 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
> >> @@ -8,7 +8,22 @@ &qupv3_0 {
> >>          status =3D "okay";
> >>   };
> >>
> >> +&tlmm {
> >> +       sw_ctrl_default: sw-ctrl-default-state {
> >> +               pins =3D "gpio88";
> >> +               function =3D "gpio";
> >> +               bias-pull-down;
> >> +       };
> >> +};
> >> +
> >>   &uart0 {
> >>          status =3D "okay";
> >>   };
> >>
> >> +&uart8 {
> >> +       bluetooth {
> >> +               compatible =3D "qcom,wcn3988-bt";
> >> +               max-speed =3D <3200000>;
> >> +       };
> >> +};
> >> +
> >> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/=
boot/dts/qcom/shikra-iqs-evk.dts
> >> index 727809430fd1..95bd797d009d 100644
> >> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> >> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> >> @@ -16,11 +16,56 @@ / {
> >>          aliases {
> >>                  mmc0 =3D &sdhc_1;
> >>                  serial0 =3D &uart0;
> >> +               serial1 =3D &uart8;
> >>          };
> >>
> >>          chosen {
> >>                  stdout-path =3D "serial0:115200n8";
> >>          };
> >> +
> >> +       vreg_wcn_3p3: regulator-wcn-3p3 {
> >> +               compatible =3D "regulator-fixed";
> >> +               regulator-name =3D "wcn_3p3";
> >> +               regulator-min-microvolt =3D <3300000>;
> >> +               regulator-max-microvolt =3D <3300000>;
> >> +               regulator-always-on;
> >> +       };
> >> +
> >> +       wcn3988-pmu {
> >> +               compatible =3D "qcom,wcn3988-pmu";
> >> +
> >> +               pinctrl-0 =3D <&sw_ctrl_default>;
> >> +               pinctrl-names =3D "default";
> >> +
> >> +               vddio-supply =3D <&pm8150_s4>;
> >> +               vddxo-supply =3D <&pm8150_l12>;
> >> +               vddrf-supply =3D <&pm8150_l8>;
> >> +               vddch0-supply =3D <&vreg_wcn_3p3>;
> >> +
> >> +               swctrl-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >> +
> >> +               regulators {
> >> +                       vreg_pmu_io: ldo0 {
> >> +                               regulator-name =3D "vreg_pmu_io";
> >> +                       };
> >> +
> >> +                       vreg_pmu_xo: ldo1 {
> >> +                               regulator-name =3D "vreg_pmu_xo";
> >> +                       };
> >> +
> >> +                       vreg_pmu_rf: ldo2 {
> >> +                               regulator-name =3D "vreg_pmu_rf";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch0: ldo3 {
> >> +                               regulator-name =3D "vreg_pmu_ch0";
> >> +                       };
> >> +
> >> +                       vreg_pmu_ch1: ldo4 {
> >> +                               regulator-name =3D "vreg_pmu_ch1";
> >> +                       };
> >> +               };
> >> +       };
> >>   };
> >>
> >>   &remoteproc_cdsp {
> >> @@ -57,3 +102,25 @@ &sdhc_1 {
> >>
> >>          status =3D "okay";
> >>   };
> >> +
> >> +&uart8 {
> >> +       status =3D "okay";
> >> +
> >> +       bluetooth {
> >> +               vddio-supply =3D <&vreg_pmu_io>;
> >> +               vddxo-supply =3D <&vreg_pmu_xo>;
> >> +               vddrf-supply =3D <&vreg_pmu_rf>;
> >> +               vddch0-supply =3D <&vreg_pmu_ch0>;
> >> +       };
> >> +};
> >> +
> >> +&wifi {
> >> +       vdd-0.8-cx-mx-supply =3D <&pm8150_s4>;
> >> +       vdd-1.8-xo-supply =3D <&vreg_pmu_xo>;
> >> +       vdd-1.3-rfa-supply =3D <&vreg_pmu_rf>;
> >> +       vdd-3.3-ch0-supply =3D <&vreg_pmu_ch0>;
> >> +       qcom,calibration-variant =3D "Shikra_EVK";
> >> +       firmware-name =3D "cq2390";
> > Does the firmware differ from the one used on Agatti (QCM2290)?
> Yes, WCN3950 vs WCN3980.

It's not exactly my question, Agatti also supports both (e.g. WCN3988
is integrated to UNO-Q).

Regards,
Loic
