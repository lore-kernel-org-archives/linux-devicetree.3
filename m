Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9655935AC3D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387286; cv=none; b=RWTTHI7qgzHWym20JqjCMt0YXMsUMtNROCvSGopjoUQQpd7FtDAc7sA2GTpU14ITGa8Ndze1QPBjUeQSiONwsA90R9mkxgSRFIUjES6MJR9xVolNNe5mxo+ocmVYxOstje1Td8qjuZo/K9WK4/5gCgXT+O3fbaQ/BQ7+0tA3l0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387286; c=relaxed/simple;
	bh=X5TqivP/mzWuCDSR3clNcA6pGI7KNYgeFKAM8z9kWu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKUQYeT++Z5BcZ8lUb1z1xGgEV5sV7IpkJxYGheqr0aacwh9x/e7r6dQJZiAa7AjuDMxIfJehz1EJwDnFpprYwbocIeXt10CxaVBdJDK0XsF1hgeIAXuVVlMK5hrn5qrKUIt69TBSMXNRNHeCI0+MWjVhWaTwhp/Ff61Bi9rc1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO23y/td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRApj/Ww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UO23y/td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRApj/Ww"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCxmi2340490
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3FlVWLTLrlb7q3MsUEt7+4a
	cg5XbvcZD8bNL6gYowM=; b=UO23y/td6R8s5XAVb3aYpvq0RCAJpjAN+0xiNR0i
	udK2hvHP7x8GtjIz7+P+5vcjxtaBYpQzahKLUWGfJtzXzzUEolA03bdcnTdsZblN
	Hes7aOJy0WqMEI3funjFNjwiSG4I8KVBTR4mTV+sWzZCxu49B4mMV+Ak3Uywd4So
	6HXaOdam4zBGX4S5EU/jxoOgeWL03grrFFCxrMvyVvZh8sw1XN30mop4qYC2HThV
	KAf+7/Zn/JUjuoG3q4Vlcwc4WYGTXZZq4nzRptTHdH0FCj1E9F7xc7kWW7kDGR15
	oGiJMl2lYMP62PGdHWvYZaSnbDQKF+0cYufGs1DqyPqQWQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw429gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 21:21:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso299428931cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774387283; x=1774992083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3FlVWLTLrlb7q3MsUEt7+4acg5XbvcZD8bNL6gYowM=;
        b=NRApj/WwZ3KHEQXG3dQ1xYTwgeYXePCEark5uHcojhb8F06oSq/P2IovWd8ETq1nRN
         UwwqeIRGf18cP8+nhKGn+iVPwwCg8H/SsvpARvkd3N9RDl+Znadp2Vh4tb4GONHdVfuC
         CSSraRq81MYfHqAJKqVznFI4Grurcc/IrPH/7gaaG3mIxtOeWBhOyeg8b8jPH8YiHgH4
         IoLbf6D2HiY6/er3kadIYAw70bGxn0GeK9zdckzN+2ZVn7y6r2nSxd4JQ7HpnxrFkQfH
         W1paPk9l+y4CeZMkDlKyw8/Y3vBHbmakonvNI6Gtoaa9MUkGyZyd66WAZQS2R3/3sLYS
         JW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387283; x=1774992083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3FlVWLTLrlb7q3MsUEt7+4acg5XbvcZD8bNL6gYowM=;
        b=TKs4nUKanVVnXit+advebJrEyVSwuS+5vwUNIF3NwikQWjd8ITib0bMKLBoJasvKZU
         VmrVerp8/yiW5QQnRpA3HwCKez3ayjOPblJYBa7L0aNDavKvIXcpXT92rXslILyjyO+7
         G1xYqDjXwt0uaOfBlFK2NfwHeNCExejfAsR1GLtOXYvjO0M3t1hgy2DjW21gUaUMrPQK
         4qR3RhcUo+Yxba274Bcm/R0SGiFZQMZV4fRt/AYX3MXsayZrrq8T+xc3VeT3Ml20TiHL
         txeCDXoPyfmUJRuYF+1wkMJg+iY4633wsiWPKCgXQb/l4Krq7g1Lx9Gfk4tFPPxv/2XY
         aqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXkF96ew/pk1VD6ub+w+7YNFJfpoAPjQ3VYAb6N+diuOuVPqCfVAjIo4fec6MBtnFpPj+v4c7QNw1fW@vger.kernel.org
X-Gm-Message-State: AOJu0YwA26FqR4WOat1UYcFN/aio5aSdOLL+URa/aW5dKUD4BTav0B3H
	DlbZZv+CE+D5l5nWedIkqfApOCWJThF2550WTeAFf1R44WFg60FRqZ+5pWZPBDqAwMHnMLDAaIn
	hOywtM2TLHVJ4zGHvtTPUAwTp2T9pT1C/UkQFFqByd7WndqHsjcZOrcMEURGotnBv
X-Gm-Gg: ATEYQzyO6AXqtTtwRT0t3AIvB0M+HoAOYpcJSOJPl8TsEE9rDcpemtIO3XlxTw3cAC1
	yHZkBhe5uEcC6HbrxzdoBVdCo46ZG5ht6CLC6hcfDTl/JMsHSBDYyqu9Xv1MyQ0jOLyVhXoge3+
	mOUhqtt7iUQgHomugW/J9MWMV63D2DuUomR/ZQGnbmv3vpETfvLOcNKhtfzZsBR4fEDdXE9gU3i
	fETjw0vJFqaCVdwnADTDmXAMDXTnnIEzitbV3DKYjwEDCobcGkzjuOBK/UTe1CQ7HsAer20q93G
	3ZqcXSjXKyqm+RQvnTP0LStjEZih16Mudxg6MXQJgoJuFCCsovcstfyJ3xgp8z0xLO908/n0pYb
	LRfeq2QwfNOyOZ4qd9oZ7l5KY/gfPfJDR6h+Qo6oMNFe4nekzSniqAP04/M/kQHdouESCO8N6rD
	OoEwWnonPf1ACwIOquUBBulzuprdDaV4dhvLk=
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr13854731cf.50.1774387282863;
        Tue, 24 Mar 2026 14:21:22 -0700 (PDT)
X-Received: by 2002:ac8:4993:0:b0:508:ff31:47f1 with SMTP id d75a77b69052e-50b80e27924mr13854351cf.50.1774387282388;
        Tue, 24 Mar 2026 14:21:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207500sm3469740e87.41.2026.03.24.14.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:21:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:21:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arch: arm64: dts: qcom: Add support for PCIe3a
Message-ID: <odmf4zxf4p3luqimkbhggg6cyvjnlfhjsqsvpwpu5ctkviogrj@bmazfab5hb5y>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
 <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-5-ce0fc07f0e52@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2NSBTYWx0ZWRfX8mp0VrxZE8We
 74z1dGjcUFjDW84FYz4+fhBkzutESPoweySPuUDg5VZ3BxipFrR00bmMD6QZeNTtl5OGic5vNNq
 qIabL5jIoOGKOqM9Z1olVGJgU/tWw5TI9hDqQ42z9FW8AlvmEa+VH0kpVc10IarBgVb9nLpcOFD
 U6G+cMFN78Yso5CNTUTzyE6CGNt2yvaJx7DtIXVVOEmetrXGTyPS81pP5WZNRjsR+yr8Q6ZbPro
 FvxTeZeJo5MqxqR3MQtjngqXr5C4RxSsZqEj4teFC1J+bstC1uluwLrC2GZOE86KU+IZ+pnO1Hx
 5vMPoPs8BHfNc0e4n6iZy9DZvfyWmOSl85AovUbDeufq4wGPlA36hZNe5xcC2GNt3qT1R3jR7p3
 kKU3LaVhE0HM6A/dVf24ffKNsEJ8glRigdtThyKR+QLGvUk8MZ9RbWj5WLLU0LTPYQ9m/2VU1WM
 wsfvTTw849cnNpu+O1g==
X-Proofpoint-GUID: U8o9TnoOqz1Tmv008Y8JWqQsHP3UWuQq
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c30053 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Xl-en66mSFc_yb9iBTIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: U8o9TnoOqz1Tmv008Y8JWqQsHP3UWuQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240165

On Mon, Mar 23, 2026 at 12:15:32AM -0700, Qiang Yu wrote:
> Describe PCIe3a controller and PHY. Also add required system resources
> like regulators, clocks, interrupts and registers configuration for PCIe3a.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 314 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index bde287f645ee94116a489c55be3b7b80db3815e9..52104607a1713323fdfe2e7de710e38c1e22d06e 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -736,7 +736,7 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
>  				 <0>,				/* USB 2 Phy PIPEGMUX */
>  				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
> -				 <0>,				/* PCIe 3a */
> +				 <&pcie3a_phy>,			/* PCIe 3a */
>  				 <&pcie3b_phy>,			/* PCIe 3b */
>  				 <&pcie4_phy>,			/* PCIe 4 */
>  				 <&pcie5_phy>,			/* PCIe 5 */
> @@ -2360,6 +2360,318 @@ pcie_west_slv_noc: interconnect@1920000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		pcie3a: pci@1c10000 {

Incorrect placement. 1c10000 > 1bf0000.

> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> +			reg = <0x0 0x01c10000 0x0 0x3000>,
> +			      <0x0 0x70000000 0x0 0xf20>,
> +			      <0x0 0x70000f40 0x0 0xa8>,
> +			      <0x0 0x70001000 0x0 0x4000>,
> +			      <0x0 0x70100000 0x0 0x100000>,
> +			      <0x0 0x01c13000 0x0 0x1000>;

[...]

> +		};
> +
> +		pcie3a_phy: phy@f00000 {

This one too, it should be before PCIe3b PHY.

> +			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> +			reg = <0 0x00f00000 0 0x10000>;
> +

[...]

> +		};
> +
>  		pcie4: pci@1bf0000 {
>  			device_type = "pci";
>  			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
