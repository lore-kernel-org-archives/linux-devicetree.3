Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30AF3B71B4
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135094; cv=none; b=ObDyufCNUVbP3TMj1qvXsUuhzwDaEqMU/59k2ALnhhiuPKgUv8CsuRSRQxld8lGKU9Ktvj/pMEBxVV3Po7ObOFn6TAKuN7rZy5pW1VKEzEm9QAfh2lbHuBSgpsGPaHJKjYzpi4OPGBlmBWdjOoGNG/G448Zhelu8V6yBEJ8bDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135094; c=relaxed/simple;
	bh=mqNPBpW5DKpud7/HAPxwB+AgX0tvOHrLtdUgoYRqgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XrkuCksY+wZ2kh1pAr+yN0beCB2qHNOeZSbj9u5SMx/BoReH7bnI3cUuZ0Q5MBc1ameMGWQ4MSdPLU4udEBYB28IbBSgL4v2jQ1bF/Nx8Avw1WhFwH9W3ft+v2A5zpOHES1NGMjOr7u6ebHabFG5yWPtE3F/0AJoHyFvj2UY1C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3WRrSGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ils7ASIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3WRrSGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ils7ASIG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFlUF793121
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XexZ6PYZqHiFAxF4MblvIRov
	HQa8h1fFE3wk9u09j4Q=; b=M3WRrSGLoxM2kM6F4XrZckHx8xzHUH33HdfkeZWm
	tJDQqhuVvC/tl65u1O0bFpclPTRCs5Bdh1PCaVneDO7pMIXAwHCMb4Clf13NB5AX
	dLrXozOuKmkgCX1pfBrHAQmCVhfV6lf0cH9W5r3hQmuENtXRzzaEyiLLe23muSoE
	qnyOXffLs9tACv/+NAKonIJXY21ucIFF9s/LGIJyADWTv0P9BxDU7tktSUnRsmpt
	KxrLDdAx1vGfzXOFfI7MRZzo4ldZoGxtrZkLl4k9giRHHLgf43WdtTvtA/tu9hQc
	1b5nDQ/ZPjCgEn7wxlH8ZqdyOfRPMO19HLlIV19QI9MlSA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq0jv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:31:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso8022437eec.0
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135084; x=1782739884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XexZ6PYZqHiFAxF4MblvIRovHQa8h1fFE3wk9u09j4Q=;
        b=Ils7ASIGGZiwv1P5Gx2kmY6WTMNb/IDoirIz6sWK4+QSoDwdpNgwvs+499ceqVKXWC
         UIqqmw0mHj88IZh7HhKLCQJJJT+OL44oq0JDNB/6hrxPZ8EHjtNhOc6BUtdM/GfHl+oV
         Pk/K7pv5QYBd2rp5hreeN2MXTX0J/jWmr19Ir/mM1Qa9AWUiK5kYPEK5Mq3VddYTWQY7
         myzfRP01qw6ttfMHx/eKSxkMgoy0MpGT22GDojXIOIvhWrPADi22eW80e9Sq1S3nuyJr
         HsAxOFU+K9++6KwH8h8d5ErmZLpYxLguF5ZXcoZjKP9YfBb49+90LWKaD/Abs4ZB8CuX
         nSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135084; x=1782739884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XexZ6PYZqHiFAxF4MblvIRovHQa8h1fFE3wk9u09j4Q=;
        b=iVi4YL6NAG35QgHZUBLW5I+WElrrcbBzTGjlO3JUmVFAZUy0hNuHSg6RZPVNyXC59G
         9BjpJNDKPtZx/JDaldv8yw+1SUylLjki4qFO8bpurlrce0p7PjFpBNJdFgwxsfJGXUI/
         DKrN3dYhFujVdZd9DvhCNCrPYp2TKWomosSvoBZgiLJRKG+Ucp1AKqqfhdOflORFWnDa
         MAdu8qODUA75SzNDeB+W7PenosF4/2xql/bjc5i6yZnwXCB+Z4Wdp0JNqF4Eq1OD8Duq
         8FPMZZRrrl0GhikvOAuYQ5HiXCvfrxm88sgHL+xmsu+3N24xFqyoYNX97TX1q+0TdGmd
         YE2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9roHg1Lq3n6YURJKpT/W6mKdhtRsETK5NfSSQzdlOOhqueFKsPCozc+/i6yeF2JrW8GNH7maDiWR9k@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdcgZv1IyBffYlSYdZtHBl4hYlS8eqOx3d2a218B6xoVNSusA
	EP7PVNXP9TUlL6/BV7N9nePa9MRnpR7y2emxa47h3mVC1yKFqqkXjXfvR0Mm6kNdOXUSyCz3YM8
	vmyRD3Vc9cjbQlROcw2FTLjh7a5Os4/159dHsrbCB21PkPJoHUgnxyNKjAbcCuO/k
X-Gm-Gg: AfdE7clq2CsD1bhNCnqp0PZYDSlO/bRu+umoAjGbP0BmM9t7DiPdVlV+FgMFHcGOM6u
	HZJY5f6lFPh4JOgwpMLN4VJ8MQXJKloFILYENAZ99m+5MH8RvnUh3EfuIGj+zQJQ5k+4gkAGKv2
	dbG5vTo5onCoCaIyGkBraB6qjagk0fBC6QfbdSDX5LxOM6XdT/eHlbJthMHVOpuYl7+jnmr5U+4
	cL28c1jq41ab4XCVD/6TgHSuQWU6/6e6JaOmAwBbqoRemaZ/01xeEbW11380/ItdAjsjDfFR33i
	dEIGWhzFOTyZPQQO8ANuZ4sh8cvkq9/32N2eDIzQVh7h7TYEHTj+IWsUATiBf5OXvll2e5OBTT/
	xIhjclC59/cxVwyZimqAal61y2wfbSR9FKL3a+s6IkKBFYCSwBPFUxgInYg==
X-Received: by 2002:a05:7022:609c:b0:132:5d42:55ba with SMTP id a92af1059eb24-139a4eae2e1mr8849505c88.16.1782135083837;
        Mon, 22 Jun 2026 06:31:23 -0700 (PDT)
X-Received: by 2002:a05:7022:609c:b0:132:5d42:55ba with SMTP id a92af1059eb24-139a4eae2e1mr8849459c88.16.1782135083156;
        Mon, 22 Jun 2026 06:31:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm7514085c88.14.2026.06.22.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:31:22 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:31:20 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: mahua: Add QREF regulator
 supplies to TCSR
Message-ID: <ajk5KE/fEDDU9W3V@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-7-c939c22ded0c@oss.qualcomm.com>
 <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c0971b-ec41-4914-aa34-6caef51d2327@oss.qualcomm.com>
X-Proofpoint-GUID: ThBRdP3ZbD1uWvpZ5kWg87PM34p5rD6Q
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a39392c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VLUydKHk4FZoEkntXf0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ThBRdP3ZbD1uWvpZ5kWg87PM34p5rD6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfXw2gw7CGZeHzz
 1sij3wmdt7PkILoi+j7+Ptx5a8ZwOjo55b3HRjVu3Iosr3Qyf5SE7txd7f1650xsA+dfByBl91r
 PMUQ54/TcxySli52wi9kBsHuXxUPkjJ0Z6Qrdn9ryAoy/UeYCPoawtkoIM7yySD4RJiXl5xtZUv
 DUYsIv5kaaMr+qeVi09wsiaf6/9wkLyh6a4A+L2xMgeC0PCQ73Nyi5ih8A03sNQnF8MxqTVtUQM
 DD/R+8xLoKYbeov1VTr52pvg+cMYs0ItVk9PATqnFLnz7JoeHhjZUfQWeMOyrnkKnA/BntCR5B7
 gupA/gkevHJxU4eeD8T4jKo06N5yEh6grwilHSY1REDNaO8vNWY1tqsfL6vnUAZhVYX+4TTfZKz
 9nhhggwMRTz8hxN+qD01Pu5ye5vSUPw3B7T+sr9JHm+tEO+3TjbhHewIyiVBotbBREyD3AZAQ/P
 cdY7nhhi2/h95cBziAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfXw9kdaruS12p9
 qrRO1dh6dWDlHbW5wrL8E53qV80zWMQbiZu57t9zsLIPRrroSvShiAbPQw66WEcok3T7NuJUmKL
 CP3Wz+cZXSf5WnM6ZTka5vmwgNaPdb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134

On Mon, Jun 22, 2026 at 02:18:54PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > Mahua has a different PCIe QREF topology from glymur. Override the TCSR
> > compatible to qcom,mahua-tcsr in mahua.dtsi, and wire up the required
> > LDO supplies for the PCIe clkref paths on the CRD board.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/mahua-crd.dts | 15 +++++++++++++++
> >  arch/arm64/boot/dts/qcom/mahua.dtsi    |  4 ++++
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > index 9c8244e892dd..8b42f5174b31 100644
> > --- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
> > @@ -19,3 +19,18 @@ / {
> >  	model = "Qualcomm Technologies, Inc. Mahua CRD";
> >  	compatible = "qcom,mahua-crd", "qcom,mahua";
> >  };
> > +
> > +&tcsr {
> > +	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrpt3-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qrefrpt5-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
> > +	vdda-qrefrx3-0p9-supply = <&vreg_l2h_e0_0p72>;
> > +	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-0p9-supply = <&vreg_l1f_e1_0p82>;
> > +	vdda-refgen3-1p2-supply = <&vreg_l4f_e1_1p08>;
> 
> The supplies are correct, but QREF uses refgen4 on Mahua
>

The instance is REFGEN4, but its regulator name is refgen3_xxx. Do you
think rename the supplies as vdda-refgen4-0p9-supply is better?

> There's also rx0 with a 0p9 supply on l2f_e1

Okay, RX0 is required for USB and EDP, will add it.

- Qaing Yu
