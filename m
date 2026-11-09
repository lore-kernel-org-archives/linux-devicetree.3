Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794214031;
	b=rTC5Ab0zixNu9pi36aJzybLywwQWjIJ4MekHpA1m82lajuuwNY8rH0LQ4xuvDYpVvfj8
	 6BEa2V4CIVlX4fZK6goNlQY496a1PNsU2tBgilgvX+RSKrZ12llW0en4PUTe3L5YHpFNd
	 7gv9IImA+6/bD8Lk6L9DQnxzZdiHBKn6ay27ntAvm2fSUGvjpHQB9OxLJ5YynATz9CNXB
	 kPkEaivc/Ai7P5XaHerODnTmavTxIiV7sqPCtaGSqq3vTKQZAwVo83bfkgG0GruQLNOyA
	 dlv5vWle0pn5EdV/TpVAI6zHd2L0JqbzqMFffPGgshxCOtIKhMsxNw89icWGT5DRDlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
	b=0ACRWaxU+z6K0sv80nM3CZQKoeGQ+amwJyC8m4RL4jeNb9vS1LU3FVEdB60J81W3V+ly
	 9z7mPNaFbHiqrnE58GvmwT0hQzEs0muG9AOgKvLutS/t1oDbpfP3zGHHoAbpCM5U7qBvG
	 TEJSGE5FhWzPH3lC2DhV+jGd61G0jjPwzD46fQ0LS7d2Bt2kwWHZTvPQSNyyNgjH46/YU
	 QYc3I0kRMd0t4j1ctUrubhAigVXszcCwhtWx2Rx8Pr4TWpnpAAYPQQ3NIb/QWpDm/pnAA
	 4DzpZTHQFuEDI4m0N//M1zdco4vJsFyxh4V6pXtxqAUYobJFVDF9kqykBo8+EOqgYIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHb2JPx0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwWDkKwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DF5606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DF5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHb2JPx0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwWDkKwy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A0K53580985
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=; b=WHb2JPx00Cy/57oF
	CrqkVCuSFPS5X6IRALFc5yWGdrl7uXknMMBfwJx+Gzq0FeJHGmt5s/pEuyHpj62P
	NYogZ0p6VPsTkkOTHaHwomX43ar87nSvghaz424nMoLjLvDsA+TOQ5W+/SOWysIg
	OHGClLyTB13GYCwVKgojewl1v/b+pASLJc1rhNBe5APNahB/8aLn+7kSKwM6k5Av
	1dPPdSN09sU5kt1OLrSBW7imJeqWSMafbiWElueOZBuTBnN8yNQjH8C5T+ZZNVsy
	9WvCjhnUrjUiL32dQDPwr3c630I0eJlg99kTLZXBkzKCNruHIqxw+B41fCXn7vzt
	BZdD1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735em4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:47:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94607500fb0so119220185a.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794214029; cv=none;
        d=google.com; s=arc-20260327;
        b=NidFFnR21Le+Y3QFFbcixMRNbIHthITrjog3DKvKgp2iY8k3YkSiZFthzjPSwDLrdN
         Un8gJRo4o437xOKbPQWYRTnSIHmSpGFgAnEalXZvfCL4tJOk1iqEA+u1+2T9UdudVn4e
         K0EL5JcpmCCl5SnBrgr1ygk3TIwvbHEKrDsgIMETlJ6bF7O+2lGm7hLEcGBPrIIsY59k
         /tusOJoBsPOMjHd70tsjGabiHUbymsqNH++JSEed/XTcEiCsAny7CrvoGwN7+uwBW92U
         sJ3v9R1S2Vd+m3Zh2TiUk4ag18ZUX5EcKJvlnEiJF8G+00Tx4Qq/4PHxS99Ri/ko0Vgb
         9GVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        fh=dessYJm66C6xggPgpH3trEIiz6uo2UJNDeG/YOMj+rE=;
        b=bFqak+NabUKjh4b23QmrR/xHWYcmJZRUd1R27sF4RE0F8Sy2aCwAnZWzR0S9NEdBNZ
         S5qUQL4NkF4qR7lB2GIzGFi5mlfHmSgdz8qoSi8D1tbk+zQik5SOicsuwiN0/4KUUDBf
         bY3VXZOyZElmY+LyWUmsetOHbJmTAQv+3sFuTPbyc0XE2GRqJgcItMQ6BrbaM8fWiorp
         gDZ6356mTCOlPnSHbhyqdMvkef6jghP6YZGCSEA1i4QhNjH8uAfUfFjrsngO4aBuzwRL
         U9U1GSMt8cmPEUWefIM7dTyCtU3BP0YLkqUGWLOrFzUZrhfgNzyxgY6t6Rn2jzEQ/1OY
         joGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214029; x=1794818829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        b=iwWDkKwyAtT4HS74ExdfTWe0rXOC6Bz5MFmKOMILWuhgJWsdunAz6TnePeeo6+Qp4Z
         lYA8V/pdcr3zm6XZ5BtztsQ/0dXON+1R+Q2oBl5eALxBRJfuW2YHvTq1EIvyoAGzkGx4
         xV4U7oloSEMJZv2KHfq37TQDvUY0w98xSPcl01EpijSKUtWyeMfKHXu5iYU0QiN2rrny
         xrnPaCF9HSnHQF2muuUoOtPAp0P9/ySKqkgLQqMX13DQugQY9gzUBKX9dDU87hff15Yl
         CU4ZlHOQXo9aRpawxU+3qWj3Cp/jW/mrVWAseaF3RoXpJDiGtwf1qYnA6m6XEayG/2gw
         Uz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214029; x=1794818829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=su1u842g4FEjFQofZRxAIR939LIBDxrqAn+twPelgng=;
        b=smlijDfs0uifL9IRCeyQktLu7cjgDiWQShF4vmaXK8H3Gi+KfoYTRRMhYtA334YqIp
         k4BXWFrREf6+z52OCNPPFnPHR1ivetL6mYxJDj80JeFiBZgP2wuLHGKc7EkDxYeyV/LB
         Fzn0retOMs1IhP5S62T83HdMg55amUrYTQxsnDNwsBA3sF6esWpzoCO8CKPYTQI8wDvf
         pg6qcOgF6evCkVdXsfYyJKgGeB6dK9qMg2i1h7zcDPbMpVUBE6pY6ADaR6SNTK9nPjft
         9SuNMKc9AmIbtP8y51dzSF/x6wk0dKW9rSyk6RrlJAAQv+s0KlnSbPjKX9zh+htmSfb1
         /L5Q==
X-Forwarded-Encrypted: i=1; AL+hErFg6ssAUySG3EAuHEVRX6PSvD1OtE9Z2fpCNInkuk4XcCopqAGm8MLAJByDy1O7+jSGxtYCk496yIbQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+TtehWRUTfuJm64HQSI6tpR9KG2cdetV0H5ujydcjRbUW626XW
	sa51CPRXAZFHNnHjHsEX9NDKfGYRLLIBeu15SIsB9z1OXaxV6fILjhPR820roVbi/7hVERY5RrF
	4Z5PWEN8Z3xv7aCSNt4SqArMBjneve5ZI1FUgUX/kBW/HV3tz7fquM+sY2LMjbSVRbZ0eCTTJP1
	0zcPIL5Pud/dzgdRI8oY4Ke2YaAyL8hAH/Vddr2io=
X-Gm-Gg: AYBFou2JQ862aFOJaMdApH3Gb7UFMDTdW7FiJp+CmSJ2ZzIEMbbm7dSRy8aC4LBOvQ+
	PLXdCmU/QuMyJtEB7f/tdt59g4Hl8OkHQcXHtC5NJfJFbW7TWZAIqyr2jt/fYicgOZTrbYj7ik9
	IBBxbhYTDf+8AZ2OXAZ5bUYj67SorCfNwAvthnh9zw3X2V323ATU4KXL/of02doqTlrRxQoF2/e
	Jll8wKzvrrCm/wSfyfm5Bqrmfi8+T5EOEfQ0VSwFFQFxS7UsnlqPOtmOWvaOSTU4wgM0GZpCKY=
X-Received: by 2002:a05:620a:2a06:b0:93f:3120:6c82 with SMTP id af79cd13be357-947842b77b9mr459160985a.78.1794214029379;
        Mon, 09 Nov 2026 00:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93f:3120:6c82 with SMTP id
 af79cd13be357-947842b77b9mr459157485a.78.1794214028925; Mon, 09 Nov 2026
 00:47:08 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104230529.3040285-1-vz@kernel.org> <20261104230529.3040285-3-vz@kernel.org>
 <CAFEp6-3x9P7Q3+RESpMo7mKNYqn6ed0XswSJhhr1nFyHg-w22g@mail.gmail.com> <a3be2e35-13ee-4e8a-b231-5aa0326f6933@kernel.org>
In-Reply-To: <a3be2e35-13ee-4e8a-b231-5aa0326f6933@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:46:53 +0100
X-Gm-Features: AclHuK9zw2alH4oLwzChdmZ5Pav3qFoszwduIqZlWs6L6xUG87_aNWF28AoD7cY
Message-ID: <CAFEp6-00odwOgmhx9hjLUeCWJo1XSFDB_rKMMinF2frRTcaq+w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8350: Add CCI device tree nodes
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXy6pDxDATKHqq
 fdCnlMey9K+RwiL7yYEA2zJt44rgT7V8T33LWAEsitsCJjdv0QbrlFusUVBIT8bpTWqA/ehDQtG
 13Qda41emIG6AGQCtbvk4pkojH/K5AmcqBBAb318uDz6MCMjjpaUK9PbBQDyZOdXKwSDfWbD0td
 pXLwN+66VzNGvuSbKVZeA6QCGJQdVWk9gJGeOrznwRQQNY49lkKt8rTTzVC9qiIjPDaN9z4ZAIv
 QXqjP3G7fR4GD1E1da0p7ElvI3jywXlJSlany456fUEah7llknhjL4TSB5wzYzmSn+eFsLujCqd
 ANYkyP9QJctVgyUfJUkrpm7Qs8Ps9/so+yA0TUAKMnelYed1IoMLgOHlyQ+7Fzo7mmPQu+jUMV8
 CVBGv61k3X/u4J1RNxUq3YKqtZ9m6Qhf7SuykbpWFkyOFaZBB/w6ccwhlEhM0bwAcG4+eo3/+m5
 gy8rwKL0ViAsgoixXaA==
X-Proofpoint-ORIG-GUID: MKdM4n3kWPBHekqOUd1DYzIq2pRutwwg
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af1888e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=5RSu-QFQllxlmxuUrqoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX3EJ2xmSGn2Po
 rRcWSveaOShrVloA+mhPyPWQceTyJb0s0qVJm5g7vrHi9QsBzAi5t8BtusI0BqQ8qC5VnMAhSdl
 tucIHj2xokLAJqVVwxt7rJZcVNUjryU=
X-Proofpoint-GUID: MKdM4n3kWPBHekqOUd1DYzIq2pRutwwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

Hi Vlad,

On Sat, Nov 7, 2026 at 7:12=E2=80=AFPM Vladimir Zapolskiy <vz@kernel.org> w=
rote:
>
> Hi Loic.
>
> On 11/5/26 10:37, Loic Poulain wrote:
> > On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.o=
rg> wrote:
> >>
> >> Add Camera Control Interface (CCI) controller device tree nodes and pi=
n
> >> configurations of the I2C busses to SM8350 SoC dtsi.
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 147 +++++++++++++++++++++++++=
++
> >>   1 file changed, 147 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dt=
s/qcom/sm8350.dtsi
> >> index a51942c99f8a..41dff3736061 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> >> @@ -10,6 +10,7 @@
> >>   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> >>   #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
> >>   #include <dt-bindings/clock/qcom,rpmh.h>
> >> +#include <dt-bindings/clock/qcom,sm8350-camcc.h>
> >>   #include <dt-bindings/clock/qcom,sm8350-videocc.h>
> >>   #include <dt-bindings/dma/qcom-gpi.h>
> >>   #include <dt-bindings/firmware/qcom,scm.h>
> >> @@ -2830,6 +2831,88 @@ videocc: clock-controller@abf0000 {
> >>                          #power-domain-cells =3D <1>;
> >>                  };
> >>
> >> +               cci0: cci@ac4f000 {
> >> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm899=
6-cci";
> >> +                       reg =3D <0 0x0ac4f000 0 0x1000>;
> >> +                       interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISI=
NG>;
> >> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> >> +
> >> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> >> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CCI_0_CLK>,
> >> +                                <&camcc CAM_CC_CCI_0_CLK_SRC>;
> >> +                       clock-names =3D "camnoc_axi",
> >> +                                     "slow_ahb_src",
> >> +                                     "cpas_ahb",
> >> +                                     "cci",
> >> +                                     "cci_src";
> >> +
> >> +                       pinctrl-0 =3D <&cci0_0_default &cci0_1_default=
>;
> >> +                       pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
> >> +                       pinctrl-names =3D "default", "sleep";
> >> +
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <0>;
> >> +
> >> +                       status =3D "disabled";
> >> +
> >> +                       cci0_i2c0: i2c-bus@0 {
> >> +                               reg =3D <0>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +
> >> +                       cci0_i2c1: i2c-bus@1 {
> >> +                               reg =3D <1>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +               };
> >> +
> >> +               cci1: cci@ac50000 {
> >> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm899=
6-cci";
> >> +                       reg =3D <0 0x0ac50000 0 0x1000>;
> >> +                       interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISI=
NG>;
> >> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> >> +
> >> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> >> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> >> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> >> +                                <&camcc CAM_CC_CCI_1_CLK>,
> >> +                                <&camcc CAM_CC_CCI_1_CLK_SRC>;
> >> +                       clock-names =3D "camnoc_axi",
> >> +                                     "slow_ahb_src",
> >> +                                     "cpas_ahb",
> >> +                                     "cci",
> >> +                                     "cci_src";
> >> +
> >> +                       pinctrl-0 =3D <&cci1_0_default &cci1_1_default=
>;
> >> +                       pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
> >> +                       pinctrl-names =3D "default", "sleep";
> >> +
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <0>;
> >> +
> >> +                       status =3D "disabled";
> >> +
> >> +                       cci1_i2c0: i2c-bus@0 {
> >> +                               reg =3D <0>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +
> >> +                       cci1_i2c1: i2c-bus@1 {
> >> +                               reg =3D <1>;
> >> +                               clock-frequency =3D <1000000>;
> >> +                               #address-cells =3D <1>;
> >> +                               #size-cells =3D <0>;
> >> +                       };
> >> +               };
> >> +
> >>                  camcc: clock-controller@ad00000 {
> >>                          compatible =3D "qcom,sm8350-camcc";
> >>                          reg =3D <0 0x0ad00000 0 0x10000>;
> >> @@ -3348,6 +3431,70 @@ tlmm: pinctrl@f100000 {
> >>                          gpio-ranges =3D <&tlmm 0 0 204>;
> >>                          wakeup-parent =3D <&pdc>;
> >>
> >> +                       cci0_0_default: cci0-0-default-state {
> >> +                               /* SDA, SCL */
> >> +                               pins =3D "gpio107", "gpio108";
> >> +                               function =3D "cci_i2c";
> >> +                               drive-strength =3D <2>;
> >> +                               bias-pull-up;
> >
> > I had similar comments on a different platform, but why pull-up here
> > (for SCL/SDA)?
>
> Here the setting was literally copied from the downstream pad configurati=
on
> of CCI SDA/SCL lines, likely the same has been done for other platforms t=
oo.
>
> > Do we expect boards to lack the external pull-ups
> > required by I2C?
>
> The I2C spec requires pull-ups, but I believe it does not require externa=
l
> pull-ups explicitly, so there should be no contradiction with the spec.
>
> > If not, enabling the internal pull-ups seems
> > unnecessary. Also, what is their effective resistance on these
> > platforms? Aren't they typically too weak to meet the rise-time
> > requirements of most I2C modes anyway?
>
> Likely you are right that the internal pull-ups alone are too weak to get
> the I2C bus functional on higher bus speeds.
>
> What's your preference on this subject, do you wish to see 'bias-disabled=
'
> instead? I won't have objections against it.

Yes, I would prefer bias-disable. I think the pull-up configuration is
an unfortunate setting that we've been carrying forward for quite some
time. It would be better to use bias-disable in the default pinctrl
configuration so that the baseline setup supports proper board designs
with external pull-ups, while avoiding unnecessary internal pull-up
'interference'.

Regards,
Loic
