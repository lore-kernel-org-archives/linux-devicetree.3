Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D7E377AB2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101990; cv=pass; b=ZPs1Ytk4AbPWAc/jINi1Wyqik6qzU/HKWqZKLBiKdRw/Keqd6OJHOxmecKWBIuwxttquwrgx3ROCWT1CQTlEYl1aicoh3HePUZygrGKDVkKCnTw15G/lOkz2St5GCsJB4FRNEDW+f6cIPvAs28LQgVpasFBEW/ywSddaLIRbvnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101990; c=relaxed/simple;
	bh=9YX4dE+yfNDLsdJvZJbsFDglIGvjVkjjw2Mk4BuFTmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx2ra2Oob2m3j+DuwBN/DsppYhy9IJBvdm1VFtx+fi/7TtYomggdEu0GgPwtLUJE4+VKaPv4ODMI2uNUs+lTfthPGUTJn8RNKGENJL7B56r8OuAz3rtn+T9jBk4zESf3Kkmh/Cc+LBad3Ujr2yuOFC+/jbysbmq4BJTzBMdPfJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sz+G2/VC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On5jnowc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sz+G2/VC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="On5jnowc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l2tn2372700
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=Sz+G2/VCYAbYlEVg
	GWsJHKNm/x1ElQWVGvbElyl795HC6WCN4WOhRCllGM8MOAU9YVPnUWr8nfjcAj6i
	AfSomJ/oRUOA3Mpk3ehnz7XD8cWUfB+0uWBqAwm3idNoqVq1AmKS1wwbYXZGoOFr
	r3KTmwK91J9i6vmnou7C9BY4g2JzkWu0XEGw7BC13GwG8SLrMptnde32Ho1XXUGg
	XA+F/DEH3kkYbV9gzNSVNTxYbS8tG+fOBnscHcvIuEqpcfffLy2HYYhbUoiu8Vuq
	Vd7b2v6BncOCq6mdqgj3DU4gg6I21hUDnOF95n2wcQAb4eMkyvFISLWK1xBypWod
	pKDHNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk3xp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:53:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so733891185a.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101981; cv=none;
        d=google.com; s=arc-20260327;
        b=M6rYynbePv/FoC5NGmhPC0cvmMJIqG1/Smq0RFgPpb/d+/toVNixSho+Iaux0rQmVD
         Nakrm+Kls4uwriIWRbzVmVzTsGWze4ZZTurEehDpIqkP4y7fjNMhmd8/Ue81scF840Qn
         HOkNqUb68WOElZkLzFva1kR/pOCT/TlLPdYwu7v/8oNxGURzEhpXCc5kTXW7KZRUw5s4
         kiKPI9g6OZFEbXMPpQ2BKYU/jwgnpYzid7KSEiMs3mMj8FER79iavqjpMog5ATY1PGbc
         nbBSPjrPf7fGKKbYwjmw1EDLHVabu1XkMECFuflBrxRW2oIy3dhA/8cGVxldTq0PaorN
         HnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        fh=bKm2VBXWOYSyFKdGdLuZ4ZhciY5tQjH6rSfn9hsl49k=;
        b=Yticds1J9UdfGrk0E1Kxj8VdWo3aa27R0iTgof+2s6LNsIuTNTyNYKal5YwzSbxLJf
         klkZtbirUT4BE2x+WyXI8asCfT6Q2ac0RBPHre5SxZnTrXVp21xtK2FlQPkLuTDXSgOo
         vtGJM/LcsoEk8Y8aUCj0AWtL+Thl0zXQ1idTfon8bDFOne7DfPxSPorBIY5Ipt0xI6bp
         fE+aO2TEH4EJzcLwT2GLvshySgUx2CL71v7BRsroo099qEXqqzKWY9R8l4kewoivLcfr
         rmDfZgc78GTPFAKDW8F6gXZUOHJ0VzpshsJRgNWD+qm8uXBNV39/rYBslormMYHKHsa7
         cMeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101981; x=1784706781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=On5jnowcUAQW73FA5VrP3yxVX+/XHWlfM1SEUeBmnd1R8K4gYWN8ghzWSgDI7NIMMS
         Xgwj9HZkglErjevBoVEUaEivjtqUG8/QfmyTZM2Vonjk8OqDcwPfchFIT7jsLLbIuRCS
         dgIrA91vNAeBmEUygv/pCePQU6ucCwO7aD0SM7bpNAG+M2uC8LtUVtNtSDnavAARGRB4
         lqKT2sf3HK1d+JOwVJQs3nQONXcMgkp59O8KV7tP5593C4pjzB8An5cguWD/P4my6Zhk
         9Gr+JCw/dx89izTe89MK0Q9KYNBEF4G1WER0b1eNJDHekfz2eYhGnSfB85V6p1Ae2Wkh
         oCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101981; x=1784706781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=kFoq/nZyOBMQOxgCYS3EdpsU6HEGXueRYj9cwGRrqi3lHeEBHkSZ7auNtWOKUFrFlG
         Wa+pVK1MXejWWwXoxVtjO6rNzUw68EpcfimjmyYtRMD0Z0KYPxJl+Dsv7ng+P+1sER8p
         HmXmNe+hC5cXMsDpd5kPYYko17Z5xrTIKHXR34fHGq8XFlgJZOChZBF7IE0UK8EBeYkR
         q64Dt12TemnTezsME4+gmLaz3bk86qt4qp5AgkRtAvTqgIK08lZYEWwgo6Kts8K8sRXY
         cISMQd/cUN9QDylE5ZuICKwRxE1QpFZHvSBqYrTGR9iKgt6zp6Jg4d6HpdfWT9uuuIWn
         odzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLQjgeSLuM2TqJg/4JFpFTwoyHLE48OksVyMTog8ilOEBLjAHnx0sI1OtttleFNYFk28sXiSbZF6ck@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2WAS6Sa7GGKZZabqCRQ3RfIWLh6zO5y5JYMbSN0FJn5Kmot5
	zEmLxu5MYzCbTRq7/Nv91Y1RFKQEMaEDXPvUTW2Rb445sDqsNNfG5l9J/SJvI21UY7qwkn+gpNR
	asSlGAzTSqqsuiWlVCo/O+LW70oXXHX4h8Voh2FSWqjq+zE99E7m59LVxA2y9jYEel+ZpwAcLaP
	hKJlZBByirR2Hkgru+rbqW0wwhhUDf8JCP/A3daHQ=
X-Gm-Gg: AfdE7clT8I5q/OeQDUo9JDIG29l0rtIiJZmvY9eBhtoiXFPRif/HAtaLrkU8mFcsfo8
	1eJhpz0ZFqNJD9iYqPJfE6I4yWxBY0HFPiJhwy1xJstaAe1KrHpkVEsIWkK9KcbJZaONA2rdZbG
	txweCusIzzd0SYQrf8PwSdvtq1/Zhv37PSAxx0ByB65RVcxvRvlscdAwe9ZcyYmHrKk9Yp5ysQQ
	VevHsS+eXhV/40hZ7KhJc2W9znRGK2dAG/7ZwNa+lKntVQjr/VrzWkuqLEq7zyt57bv66DQqhVn
	tLL+JNKUq6I=
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id af79cd13be357-93086bea55cmr545858985a.56.1784101980988;
        Wed, 15 Jul 2026 00:53:00 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id
 af79cd13be357-93086bea55cmr545858585a.56.1784101980599; Wed, 15 Jul 2026
 00:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com> <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:52:48 +0200
X-Gm-Features: AUfX_mylGXRGoAJ8WLPXjHG-LrYjgeK28hgV3O_EXafPt2RbMf7pLiI-38KOrs0
Message-ID: <CAFEp6-3MrGLyTQ5+qaZ2nF=EWLgOhepTB41CwEEQZwJ6zQh8Rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: OvDpgTycUt4XM6bZA8B5KNbHBlSpD-F7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX48kPF6SPjbCe
 venAsWmZbTJ1gNNA8Rfe6n6+loekrxWC+hvMKfL2CzbZfmSrZSX9bYPaEDBoeRo0xWpkZbCUo2h
 cgCXGtujmAJLRpDQtR9A43FWdKe7bU2uFNyGpUJeS7jjljx9ITAs2k14v19NyKhfqE+Juk6ZSsR
 yCbVJeUbRJUIzo0Wtln42ClqiH8/z709Vc1eAhHNiKvOSvHN4ANjYTzs5Pb6veU+1Lm774MIVVZ
 Q8wuZGw+H7t7xulwORW0c6maXfFRFY9glSnnrr++NSDIhU+TaSUDsOfcRgxLlbzVJvvoe7wV74O
 4hPBKgcpsvoruj9A//BaYFmi6bHogVg7G4VkqRrl7QRoQ91TAF9oX+OFTdJHvxhGasosG8hycPr
 uRDEIpgY/PeeJDfiigJtWrielmnuiuMLv9V9xUmnwlTaUP7FgjfWMS/AHcXGxOu2JDbNc9Vl9W8
 KcCrw+Phq9+ygxQhZmA==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a573c5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=U2PIo7JDszhCzVx53KgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OvDpgTycUt4XM6bZA8B5KNbHBlSpD-F7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX6hUOxYNrB46p
 TQZeWmPrheyjbgHHq4IrK9nygQPVgYi+dhnvuGXFEiQVfds2sedHJHG53hg7/wCQbClt1xUZkpm
 U8waflQqTbdRkplmAbIfv2N37agtIRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150075

On Mon, Jul 13, 2026 at 11:29=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eac=
eac796e342efd16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
>                                 bias-disable;
>                         };
>
> +                       cci_i2c0_default: cci-i2c0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c0_sleep: cci-i2c0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci_i2c1_default: cci-i2c1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c1_sleep: cci-i2c1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc1_state_on: sdc1-on-state {
>                                 clk-pins {
>                                         pins =3D "sdc1_clk";
> @@ -702,6 +734,44 @@ port@1 {
>                                         reg =3D <1>;
>                                 };
>                         };
> +
> +               };
> +
> +               cci: cci@5c1b000 {
> +                       compatible =3D "qcom,shikra-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0x0 0x05c1b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING =
0>;
> +
> +                       clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                                <&gcc GCC_CAMSS_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci_i2c0_default &cci_i2c1_defaul=
t>;
> +                       pinctrl-1 =3D <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
>                 };
>
>                 qupv3_0: geniqup@4ac0000 {
>
> --
> 2.34.1
>
