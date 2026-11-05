Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793867844;
	b=s0pwGTIP48vS3Cij7gmKXMj7ADleSZSrkNxoV/hGCD3hcQlGPyJUjOTUHjCBbACjSMWD
	 7t+GIHNSgVfKUBVUVLUClpm3gQiVqAkGkh02yf+j/yiCqljzZu5G36L3TnVjRJd2E8MJ/
	 mdktqe7yFv0sWZ+M4t8bzq+mhS3CT/okCSoO7uFPY5dUkn/uwQgNy5qyMJ5FB0gxak4kO
	 Xyr6rS47yKPnC3KPCv3PhgYl3nl9HabEhB/w8f8ljBPLxDaqyZahU5PdDaY5RzS9h9S9J
	 ppC6lhd0+QKCHo9F9YqXU0goOw7h1jtSsnVEsESpP8kGl4BhPgB+3vqbHJ9qXO90nsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
	b=2GqDLPT/3WJfgqkPbP9dbXNee4lujzNS2ks2RTbV3/XqIpOyX8TOCN8Uim7UUx7r+XWe
	 487MDct9e6aSLCxO8MuMQz3dgTUNR76mSI2fxOrtrJHbTdxGAJAFtp85mH03d2TzovUys
	 LvLWF/mVmBKtEeuqIeLQOkPJC5SgGUm1omhpOci/a+YbMm/dwWp9TJzRm5kmwTQrhjsj8
	 mPuepmJg329y+vp36yH9xrF5K/MgW9YG/l+nZRYy+6fktKW7arEDRhsKQJRSgsmcvGuVE
	 UM7hfDEXf4U5i8Xqevo0LeH9sEtQB9nIW1uCy339TDrjUV+YyGWJ9fK9r+/3uMgSe+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMDyDbB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/U5PgmB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5F606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 08:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B5F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMDyDbB0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/U5PgmB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U0Ew4169339
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 08:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=; b=cMDyDbB0LgxiaTW8
	cM7R6wjoaEqsXSsiAQu8qE7hEnNM0+BtlesvfzAVxSCPM+oGVsNriN23eFgMnPYl
	voJ07Gty+6y4OOWnUYpQ2VrFSMmVOjDPT+6iTqxmz5D17WkAfyxDlF0KBtz5P1vd
	1cAPpbEpiXU2smRTebOQdtL1WmEGjCbaBplFxK/A8WSKSjy9M+liyzclLVlQNUIf
	r0Pwe0Pmmqx5irb4ayKt2TUojynAEPzMgPpr5jz16DAq34Wlere+HjE9jAJXt86P
	RRTf8e+QNaXcCFGUARXbrqs2535xcV5F9b8bX6w5bQRPa6njwtr5I5fAdE3Lle4d
	MEZ+zA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8hd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 08:37:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so412150385a.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 00:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793867842; cv=none;
        d=google.com; s=arc-20260327;
        b=Bt7SDiR8Hw1GCoTyU1H2KIWn7YvufOwo3VbfrVU6wwkEmFQl1kuhh1JRoXdEOx1A1H
         5+WqW5Dckm7FsA9W+013pQHKuQrBLDq/VU24kyFmXsxQhzc4PhSBirUIHH16GdxcJviI
         AHUpmVSmNEWzI6MT2M9NDgbnQd3FkSdrU179m2OXkjuGX7a00+Eo1+JNkOTmptGU0j0h
         8Z5mmRsEmsLVk76Bl5LjNacbzoDQ017WdFQMhi3vpa1l83jeZNt6LuO/tYMO43r3ADGm
         4e3NGT+AL2+78mUyCa8iTN86JXYvDjSlR0ueAdOUaBf8kBBQZV1zEImggHaLcfNtE6XT
         Uxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        fh=TAENhkt0jhUJ5yHcrm1ipFD5HhNGTm84Rl4RYiX16k0=;
        b=i/lSsL0TAqIit2fdm//d6T8oGLAErk+nze+SQnLTFYgDchWOK8+Q3RkMSRZUnGeKPb
         XZJRSi1S09zVltCTC8UslMRl0NDQ53tR8WJ032TsHGnz/zBsUOp9YDbcAU6Kk4ATN4FP
         SmH4XAlSo0BWKoaeNWUsHz0GhkvEWrRjkewwF10zLUKgNSo+1aWCC+U5kH72PTHGziNs
         VOxrgGkdhLvd4lz2G/y7oMt8Vr1cCbuzBNosfJDI0Y9hVXn3kMAmSxfzbq5+vvQ6ZC4g
         EEiYxtExCr9tZd8R8maIN4lPjlUF9iKl/UGoALAkvl1U8AgRP9VmY+CYtqgwUzr5Of/f
         wb1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867842; x=1794472642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        b=c/U5PgmBuK1v+xeiJm9605kgGCQHj7G7pqrwFRHuX5cyPzUMqArUWMPyZSwwgbuYZk
         dcaYC1VgundSk33L5ycO3u3+KtTib9fASFRmYSitJR7scgMq9oO5+gI+2/cdu8xO22nL
         SsyMgUmQBQwdciq18MbMTbg3VsWyWWGmDkPeYdJ+vDPEuDove6VwiGQqlx7A+hQHQ/jA
         wBWrTpE1nSwd56TyQCRnSXgw5tpcLXXGEjXwJ+pzzfmyayIGiDqsSOWTNTXfJ/5vig30
         d4ZXJybSpn7sLOAsejjZu7OmMyQmo0oHef+kCh/0K0yOkDC1CbDJZhyudJqFC6OYcs4A
         bOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867842; x=1794472642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J20C0Q1ik5zVeSf4dk91N9VOzLrxCbR2J+L4l8jiJe0=;
        b=FrHMPkMUzEHc+gx/wZrNFpKtCXTYwvQJvG2hanW0A+PaU3AzQq1NYFCm5EVquCJSbA
         5w5rDG37scobs5I6V/jVrnrTwewUipRj9m3Lm+ho0khMpTs0klb86us+FNHAsLAOAUPw
         aubqYcgFn74urqQse7ZPQeHjupZnc5BtB8TeV8pB1QPvRJTFGgMJ+Yeaemrq/phwDena
         epY70yXL8tgJnRhn/ynGv6m+n1uqtuZ388rQcRHvJNFXMcdSOZceA51jMtICP4AwoMQB
         l3tB59a5QkyCvMmPHgyP3uMrtCtcX/K8w8Wm1rzMXxlwFH1j5azIqMDLNEWD888WAy63
         LV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3Y+4CdfD468RDTjylf+vRTxonMhOtYemShjs+45silk+hMi7bt8r8iKOFHLFSKlLKqs7J26iOl7QT@vger.kernel.org
X-Gm-Message-State: APuU4Z90MppQaTWmb+9OM9EGMlZ6og0Mr3k1qhNm/qgLdR2i6yon6wHf
	S5wNbWRwRsvLulOp1LTGf2W9ArVABPHzt2rYaz/0n846J0n/IXecLBmZiZea1UEfG+Zem7y2W9t
	cf5Tmi5rWSogUylIqA7LM61WzQ34fOCtSva0nz6xmYvQ6yCo4B8tZ2qK85JmdeykVJ1G/7leiDc
	wskEMSMdf08Aqfw5W8fleqAlhjcQ9kKyQ8e4mkLPI=
X-Gm-Gg: AYBFou0OvLmARJFWXdnkLuqhVN1knO3YeDTnFCEnnm+Uo6PPQldH5xx65VZLgImZ9iq
	K+sfOOhhozvjNlU9dVSOpa4AGUKPT/Pip8+SCvV/yqpFppqkAW11eP/1G5eaINYc50rnFXOyOMa
	t0wBp5S/iugHDZtADmqEAYHtl5B9e5Z8p481dFWm/fW1xlZs/QsTgIf3lKUXzIdF8+EewkEfBS9
	YJHP1StPhB71z//530SWD+i7aXPHmiIXn6GK4lWWTPKmQQN0F4jPW6g8TtYMZqxOIl3c4+05I0=
X-Received: by 2002:a05:620a:4109:b0:940:f2d9:5f51 with SMTP id af79cd13be357-9442156a727mr3192324685a.12.1793867841555;
        Thu, 05 Nov 2026 00:37:21 -0800 (PST)
X-Received: by 2002:a05:620a:4109:b0:940:f2d9:5f51 with SMTP id
 af79cd13be357-9442156a727mr3192322085a.12.1793867841058; Thu, 05 Nov 2026
 00:37:21 -0800 (PST)
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
In-Reply-To: <20261104230529.3040285-3-vz@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:37:07 +0100
X-Gm-Features: AclHuK-nN5eoEkZP-jg7XLdtYcXHlRVNa3PnAeXUUZCqyZmoNrEFWNQhhqo9cK8
Message-ID: <CAFEp6-3x9P7Q3+RESpMo7mKNYqn6ed0XswSJhhr1nFyHg-w22g@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec4042 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=PI_Vn2BwocxK6LkTr5cA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: W2BluDiff0gZbUFFcmfZR__bYNCEp-RS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX1iCF+raIDSmT
 z73osZ8XzCFIO++CO+IPQLI7PzqP3rAYtqhWT25/mme/bV+AvDor58xcLGdhHQKF3zDKnWTTUO8
 Q74qwefI+Tof7/CKaB1hes9OFk2P9oU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX/uBLBfBJiDwz
 tkDmi6XHw+tAWWyXnBd+XT1ubrEEPbJVzaEkLVk9GSrfHZSMo1pJOJtGEVegv+/N/OTp97CBmdm
 YIFGuEMRlEYLUXfWsXd3RMGYStvYiA09bb/pTywpXO82CQ6znOuPfPlr3/gXD1r6Kxl2RjfT2wG
 s2taIhwzvfccuIFlp+YQQ20L+Qwek425rvvDZL7qy9q9HuJFzxOYoBX6ASLhPddOI4x2Bf8T3pu
 4ijZRdxVvJ9XchwcOMLzvRjSaHbx/lcL42qL1/LKoXrxZCJbcKgIW214IPlr1/69Bl0ne3qWH3h
 RkdFrQWX06K4QMsjcrwfVJXAoBOuX+/S41LsPDgxHqSMtBid9nnO9n7zQHHdUR5TYgIHk/LZ+xH
 NEK+qKb/Rhc2y2zhM6ndtEa+TI73rRMPt1/jpB3I0Qz70alhpBGu0nkf6EyU6xNM3VAqmWXJeCl
 oAFnS+zkd0F/cy0esTw==
X-Proofpoint-ORIG-GUID: W2BluDiff0gZbUFFcmfZR__bYNCEp-RS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034

On Thu, Nov 5, 2026 at 12:05=E2=80=AFAM Vladimir Zapolskiy <vz@kernel.org> =
wrote:
>
> Add Camera Control Interface (CCI) controller device tree nodes and pin
> configurations of the I2C busses to SM8350 SoC dtsi.
>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 147 +++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index a51942c99f8a..41dff3736061 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/clock/qcom,gcc-sm8350.h>
>  #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8350-camcc.h>
>  #include <dt-bindings/clock/qcom,sm8350-videocc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
> @@ -2830,6 +2831,88 @@ videocc: clock-controller@abf0000 {
>                         #power-domain-cells =3D <1>;
>                 };
>
> +               cci0: cci@ac4f000 {
> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0 0x0ac4f000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>=
;
> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK_SRC>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "slow_ahb_src",
> +                                     "cpas_ahb",
> +                                     "cci",
> +                                     "cci_src";
> +
> +                       pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
> +                       pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@ac50000 {
> +                       compatible =3D "qcom,sm8350-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0 0x0ac50000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>=
;
> +                       power-domains =3D <&camcc TITAN_TOP_GDSC>;
> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK_SRC>;
> +                       clock-names =3D "camnoc_axi",
> +                                     "slow_ahb_src",
> +                                     "cpas_ahb",
> +                                     "cci",
> +                                     "cci_src";
> +
> +                       pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
> +                       pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 camcc: clock-controller@ad00000 {
>                         compatible =3D "qcom,sm8350-camcc";
>                         reg =3D <0 0x0ad00000 0 0x10000>;
> @@ -3348,6 +3431,70 @@ tlmm: pinctrl@f100000 {
>                         gpio-ranges =3D <&tlmm 0 0 204>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_0_default: cci0-0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio107", "gpio108";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;

I had similar comments on a different platform, but why pull-up here
(for SCL/SDA)? Do we expect boards to lack the external pull-ups
required by I2C? If not, enabling the internal pull-ups seems
unnecessary. Also, what is their effective resistance on these
platforms? Aren't they typically too weak to meet the rise-time
requirements of most I2C modes anyway?

> +                       };
> +
> +                       cci0_0_sleep: cci0-0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio107", "gpio108";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci0_1_default: cci0-1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio109", "gpio110";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci0_1_sleep: cci0-1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio109", "gpio110";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci1_0_default: cci1-0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio111", "gpio112";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci1_0_sleep: cci1-0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio111", "gpio112";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci1_1_default: cci1-1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio113", "gpio114";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci1_1_sleep: cci1-1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio113", "gpio114";
> +                               function =3D "cci_i2c";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc2_default_state: sdc2-default-state {
>                                 clk-pins {
>                                         pins =3D "sdc2_clk";
> --
> 2.51.0
>
