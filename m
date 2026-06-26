Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338D39F190
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782487111; cv=none; b=fqDcCHs2VRqNcVH5Ooq5dghltIv/vcZs9Ubx+Hw2Zuofxj2R5Djfjqtr/ZrLtfOsdMneKkn17bfb50q8QYX5B+5nQdB0Ws9VXtUVFpH4I5rEqfAnzt2/PpNz2rotCiUmxr4UFresuGMz7b/ezzMBsVu3eStyqNAu4CM41D0VSxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782487111; c=relaxed/simple;
	bh=T3qXbzmDv7ZShLGSjVqPtOhzkb+ITriPGNwUsyKRFuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j1x+NFAAkYR4mK19nYWS8BFgfe+fZ/tvTkttghHqOd7hc7UJvzbRohC7UK5FEBcT21pE6N3ZrKjg8wrwEwyRuzda+sS+goiKAqCmIVt63zr/jOvloYQJR11MYbfvw6q05tahzu/m7bN0LdiaP/s+fYM3JI6SeZrL1uaBJnyZj6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAZ9mCzH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlaZvS9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAZ9mCzH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlaZvS9u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF4CZk1658490
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=; b=kAZ9mCzHreAtQLjl
	FON2+t3WD5Dta7QsFF8E9ZW91QDn/kOj8D7Xf6Ima8fRuy6fb5pHp5Q1ofN6oKBE
	H64isH6ozhDTFl5fCKnmKRp+6UQcdVLKYsEILbNSr9jSI4Ifl2wtSy+hhsGropqV
	mEyq5bMcd25R+DcGlhTsXEjlPty6/LlN2cZWjurRZYFl4Q3S6E6rvdMLMrNx2Itw
	jKIa3tma1RWAD5Ur44sUP5fdxumaHDBoubqCkIK7WfvIwhrJAy85LxII4DN+15A8
	zaAC80YQfmAkgSp/HJ2xZ4LEJ3e+TETra4xbUQEAIaOtyMf1meV5g1I3eKHZBiiR
	Cz4WdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fctayw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 15:18:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517796be724so788841cf.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782487106; x=1783091906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=;
        b=PlaZvS9u3E19knCJ8w/wRiYGACSz79V7AHXvGBELgxtcYeVMztFK/RgjBcrCOWJwkF
         wUi3kv5wsWlx+jgkaRdmITd8ptaeODBzdQffbgcnqs+ayX5ItgBGJ2OQF8pXMSxYxfyN
         grFgqy0OPZ6H0aPSlAepmQUK6AGQ6Fw/Rb2OYrotvTzVT1FaIcyLd3TXRAENboi5S1qU
         sxEDY0dJ1QCWqH7KMxfgCAPciWc8wGU5+VJXjcc+3q3moSBhARxko+zHbSZPKCPhLJo5
         9vpS+VBdZJKfJmrSEAVSNRzzM+L1jzS5r/lYWYiXRl1EwpfQfF9GJiN7kY9eqdNB3auI
         KIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782487106; x=1783091906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSr+X2cN+chbZ1Kgz/n5kJYhUFjvUZy9dsF/AYkHna0=;
        b=EZyOnJ5BQY7Qw2oUe6FucrjF1hgXj2POwL8kEcD0MeUCH4jM9BzY4kGJIQQnqaY0ln
         ozcl9yN5QtIFdzPhsC9kTbFvZ8tboopf3MLU/zIDot6sOA0CcGFDRX5hU+hRxvvk2zHm
         J29tpBArLJcobuN3HKPSnSggk8e6kxaOPUHG1GhwrZuKgPtI/xaTsc0VrFv3Uwmsj+oz
         hwf3sAymBmcuSHmRrC+shf+8DcA9Knbpex3ojDwd0lxIhstatIpRwJqxvMobETYBRoXh
         ZZt7PKd3aLUyMsBex3jhhxm5pjc8Sm+RvqYXUKV/ExXJ/bdgH0Fkiwk872jz2nYC/1Wz
         qj3g==
X-Gm-Message-State: AOJu0YzjBOerBCZqmDMI48PMNQslZMiVdJA1pFWPSs/43R69n7JrLDNv
	HsCwmgew0bf3ZdE2aGrGnbFZgqi3F65TxmUh+5p5rlFj3tJno51UeEoaTwhW8XCX6wMNPzCg73c
	chCyRCs6HVocJGS+lIZInOK5dqzW6wP0pKOJanvS00LTIr6s693wqEByuDxv7IR97
X-Gm-Gg: AfdE7clFOrI66K/lui93vq3wgePuJ0RgbZ5o9zXGp8R2hwRMXNih/DUDJA4wEGy3wFK
	l4skhjXkfmbbkhRwE1fclbvahVuJ3FwSe9MSlBXCAJ9kDY7CYhKv37ye6DElZ0PA4ykQOlXGCkz
	GgeKOQX1DFaQHdO7TzVzQfA0J4bGdX603V1uYQ9CAgSfWZjCpK/mYka8Jj/NTuJdWAi0hgUaXVs
	WkP33jTa+P9x12b4v5+ylR4F8kP4I65yVSi43fJTGXGsmonbFQbc+RC0FC2xZFHSWLqBhCBceh8
	0b+L30Y+xpqlAQ1uimGTdZ+26axJuYGiA65FLFNQP/JPXa6ZeoVcWg4xTEGmku3sZnqXgoh1wuC
	efmvHe82TM4P0+1CB2gM+riNqlEwDj1BPyCQ=
X-Received: by 2002:ac8:5ac3:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51a7277e873mr64259931cf.2.1782487105576;
        Fri, 26 Jun 2026 08:18:25 -0700 (PDT)
X-Received: by 2002:ac8:5ac3:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51a7277e873mr64258561cf.2.1782487103486;
        Fri, 26 Jun 2026 08:18:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad31a81adsm11177701fa.28.2026.06.26.08.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 08:18:22 -0700 (PDT)
Message-ID: <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 17:18:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
To: William Bright <william.bright@imd-tec.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sFxhD9Z0gZk8sJyTOydnpfuxc-IV-ZWI
X-Proofpoint-ORIG-GUID: sFxhD9Z0gZk8sJyTOydnpfuxc-IV-ZWI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX1OsYQxGfTAKe
 miBFdjwiCwqF9i5kEvK6vY4MXthWYPfPL3oTTNbHIEkaje5w2gWWGfRVom0Cs50OIlzLM9CZvLj
 P7DUuNA5txR9Atn7f+yfxb8+yyKZAXuk+5MOytFngm6JwBjQJOh79rlXIgjPW/EMLmNLrzRvuXm
 9oRZ04Fly9/DZLhdfgbm8v/1xEfFwoMgAMylreZQaeUDFvb74UgpYOkKfRuxVO+aDB+MdcoHouX
 XQmTZARlMj2Z3X7a+emYQ/2sVNsQcyqFZDdsH6vp1Ui1jMk4YmphZFJfC5QIuhxNCoZ49mGB8lZ
 3sydLkFaMwiUJepN4hqak4ByhzhiYpZ9sXKc+lyR2Q4H/Bj3seNiE2BHNnF3iyfoW/4yqpc2u20
 calBq+CA3LTXDy6qrFDVyq2dob89ywTE0RPYYyqV1aAMMCY7o1vmKvIqEe/ouRF2/c2gj/yiZXR
 YypSvqORvi1yWUTnyaA==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e9842 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=Ukjwcb9SPc-JsOuqNkUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyNiBTYWx0ZWRfX4FrYq0bLc57+
 cA8FK/I3SvB9oxeyaqe4krdAUAJe6mTZVuc/my9TkltlLtRuCZMGXrY8zVlDj25eQAz8lOE5DSn
 PCdzLJYKBCZi0qSLRDy7RchpP9g9lzU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260126

On 6/10/26 10:57 AM, William Bright wrote:
> The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
> built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
> onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
> the off-module peripherals.

[...]

> +	/* Enables 5V_PER, 3V3_PER and 1V8_PER rails. These rails
> +	 * aren't used by anything within the device-tree but are used
> +	 * for on board logic level conversion and as rails for
> +	 * pull-ups.
> +	 */
> +	per_pwr: regulator-per-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "per_pwr";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_per_en_default>;

style nit:

property-n
property-names

file-wide

[...]

> +&apps_rsc {
> +	regulators-0 {

This way of overriding that is super shaky - instead, use a label,
like:

--- som.dtsi
pm8550_rpmh_regulators: regulators-0 {
...

--- sbc.dts
&pm8550_rpmh_regulators {
	foo = bar;
};

[...]

> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	/* Zap shader doesn't load so is disabled */

If your SoC is production fused, you must provide your own ZAP firmware
that's signed by you. Conversely, if you have a software stack that
does not include the Gunyah hypervisor, this is likely not necessary
> +	status = "disabled";
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&i2c_hub_2 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: let's keep a \n before status, everywhere

[...]

> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie0 hosts the M.2 Key-E slot. Apply the SDIO
> +	 * reset de-assert here so any module's chip enable is settled
> +	 * before pcie0 trains its link.
> +	 */

We now have:

Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml

which may come in useful here

[...]

> +&pcie1 {
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +
> +	/*
> +	 * pcie_switch_sel_default and gbe_reset_default are board-init
> +	 * lines that must be stable before pcie1 trains its link: the
> +	 * PCIe switch needs its mode-select strap settled, and the
> +	 * downstream LAN743x must be out of reset to enumerate.
> +	 * Applying them via pcie1's pinctrl-0 fires them during
> +	 * qcom-pcie probe, before bus enumeration.
> +	 */
> +	pinctrl-0 = <&pcie1_default_state>,
> +		    <&pcie_switch_sel_default>,
> +		    <&gbe_reset_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};

[...]

> +	pwr_per_en_default: pwr-per-en-default-state {
> +		pwr-per-en-pins {
> +			pins = "gpio142";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};

For single-group pin state definitions, you can skip the inner
level and define the properties directly under the -state {} node


> +
> +	sd_vset_default: sd-vset-default-state {
> +		sd-vset-pins {
> +			pins = "gpio4";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +		};
> +	};
> +
> +	/*
> +	 * Drive LAN743x reset high (de-asserted) when pcie1 probes,
> +	 * so the PHY enumerates on the bus.
> +	 */
> +	gbe_reset_default: gbe-reset-default-state {
> +		pins = "gpio138";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	/*
> +	 * We drive this GPIO physically high on the M2 Key-E connector
> +	 * to make sure the module is enabled. An M2 Key-E module could
> +	 * be using this pin as a chip enable.
> +	 */
> +	m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
> +		pins = "gpio41";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	/* Force the on-board PCIe switch to select the GbE upstream
> +	 * port.
> +	 */
> +	pcie_switch_sel_default: pcie-switch-sel-default-state {
> +		pins = "gpio16";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};

Normally this would be handled via an actual driver - see e.g.

Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
https://lore.kernel.org/linux-arm-msm/20260605010022.968612-1-elder@riscstar.com/

Konrad

> +};
> +
> +&uart7 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vdd-hba-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p88>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "peripheral";

Is it really peripheral-only?

Konrad
