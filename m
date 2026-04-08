Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38939C003
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642251; cv=none; b=IV6slCBXJC1yF6oSbEsQMBmn5fJb4I/++ZIc+NBtfn00TvPAS8Tp2mzU3FiEHdeZnpKDaijo0AdUxVJ9KiEBzcoSX3ASQR2zTOJ8KI7+OK5PMFzzjh3HjuWzdiaaLtxnyBuWYFmoPFr++U6TILQsaE+9lsQz5TqVHYKtCXUZw7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642251; c=relaxed/simple;
	bh=NoIm8krg9jh1SqK5nLMSLbS+BKP3R9lVQkw0L9N4lwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBsznaTWd3PbEEBQ+2iNyNtjh1WPERS1liKbqjEQxMYwjY5E++1Cz+JkpR60QmphfAlQ59wpDT5ixD3WWgZ5Wvj0zmipVLRxze+z3tayPBF9aOERQ2mlJWFO/PX5aKUbN9wr1VO4g3iGk9BIEZ4/CK6oHcZNbiANjufbPNaBPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUlM9nOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=itxHdmcI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUlM9nOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="itxHdmcI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385k6lG250047
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=; b=GUlM9nOx7tmCii4K
	9pkwZpUlIIUY3jlh7kg4xnSF9qJ1GQdZR46baq7Uw8ODMpqs0VKxTdVS6GHr4NbF
	MIXjF19loWUyWCU+4zNnF5gQT4tOOutDfYZ+Kxdmr5qbGV8QScSzbKQFRS3+BnLh
	19lT0IeW2NRR/1hD1c8SfWiFkBibGYtaQCCNiNd5qJjwoalCfgXM64+ZMkXe0sxW
	XKGwf75+Td2CgBCHM1UTSYI42FAczRLyVeYDs6ObyrL4lGNdBUMvNZYefvSrNKA7
	iLZsO9UfULBcmSOpzk4Bd2q3VnVtPLNuyWfpQG/R4JaXyQ71LnrNbNbLeEvhAJug
	YEciXg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8x9afpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:57:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd541c0edso32956276d6.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642242; x=1776247042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=;
        b=itxHdmcI/LT0MAP0M80ixmNUoXfE6qNcSGWuj13TdK8yzHAeCAgmgMUCslA9wLWqPu
         enq0U5wa+qdzB6z2oQFgmJpxXfi2GZIi5Ofx18PzxZY6pE5TYdd4/Xmjui8dQ7VzQh9O
         aOMaUMEkzSFGqM09BZsmhIsbGiOhExiZkw7TCLHAUSwbsGETGmLwSXqLQUE8+W2gfvNs
         9SK6998Y5eJKgZQc6iPFlh+cVIXbiM5xFjno6opluD2gUrL2RgyjCCd1SHjr69hcrm+u
         vL4g7LK7Uo/WYSxO/vcVWnx1FQPQ1thQMiZC66W7aTyXFRbws8WCua+XmwT/QZyWqfrz
         hHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642242; x=1776247042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8siExC2LFuLzbzXih4f3s4VK+lHb8ea8rN79TCW1Cbg=;
        b=mYmEecpC0Oumluv68aGAQjkgj81s+qt/fNroxu1fcKDec5BRQN5DKhtoo+9Qsig++U
         Ao6mgHrl89vLgO9bj+RKz+9I70gxQI5r5qZ4WX9prK81ax1eerf8Wd3FxxwbTrxQrmur
         BSN9zz8qj6x4CCV0ltzJtM2XW63qqNXw60SpC+x3EczCqHeFYa+PuFE3DWUANM7Ehn+6
         eMDRdCRhORrkfdvpOR5kA9owWMc+m52HXAfZeXYmlIpFgPikAN26ZMaSVkwptz4ay12b
         wqOBczAXWKLpHTA90GpJwgzguIa9RccIjNc0eKC9Odl5Rrft7xVTX+FMSEptGYP2AyfO
         USAg==
X-Forwarded-Encrypted: i=1; AJvYcCVb9N6H+tAB3ViA/qsliyUL2PNA/b/mt/AXES6BJtovcQdkf59ZQ2usVb5y4nXpiMf0GZKKR21jXHMx@vger.kernel.org
X-Gm-Message-State: AOJu0YxktfIhWxr3QcgrVFvXmh3kqy2EctlbIFU3lcN3LCBroEfZoy8+
	/dVCMgm3bszWJ6ZgSJYSaS2x7EjFg3A243bDJj1zushhohTd7Dah5J5U2nysnH6u9a06TUI4YUx
	uNKgVK3JaWA0hu7U4oYRMjkwpyHVqe2Uvxsm5DST374bbU50Ts0mMncz4eDgOgomA
X-Gm-Gg: AeBDievXImoLgcii9H8uukcDJ1a4zz487mxoUqAze61+oXrDOzoITvTRmnllaOr6b58
	iwEu1U0SKYAmfYB0K79FitdvhX4KWAjcKpHaxBEulJvRJs5KyslU12m2r+W5pvVFIa1xvlXccQd
	oj82I8n/n1ECgZV9jqaL3QDLWddtiywEMzaaKhIcaoKS2KuV/pAq00d5gKwX9ZfxrxZRl9UBwNQ
	CV2haQihofGC1M8fjIqFsdrbJyuICn1Ppu94Mxw5vAWq0HWnFhTPAJYfEP/MyZfjC4pIb+jFdZh
	ahtkJIAGOxgS7edxpimueByCJyLXaJyH8YNnClA5q0ebnYijexgTA+xBWhADzL3seko51lXXIhA
	UeQvtJA8OKBTnhy7s9SYy4DS/22B+irHpVXH+ZyhceZa7oJflfoaBU3d1z0dBDXroWRFGoZgVpP
	2RJzw=
X-Received: by 2002:a05:622a:250a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50db017eeaamr33913821cf.3.1775642242062;
        Wed, 08 Apr 2026 02:57:22 -0700 (PDT)
X-Received: by 2002:a05:622a:250a:b0:50b:2972:4bec with SMTP id d75a77b69052e-50db017eeaamr33913611cf.3.1775642241626;
        Wed, 08 Apr 2026 02:57:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm4833458a12.13.2026.04.08.02.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:57:20 -0700 (PDT)
Message-ID: <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:57:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: jsandom@axon.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rr716imK c=1 sm=1 tr=0 ts=69d62683 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h77gEMGJAAAA:8 a=HSvSKgW-rJGLGYoCqIMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX1E+EkB62qTN3
 VO9UxxyUnIdbHMe7eqw0rYu5RhmtdnjmsPVSgFZMV/VMuoISkAFWD2b3HRs2de4DGupOj2Ny4LQ
 GOYy16v7t5/qyk/98nOpGi3WhJ2l3WTW4LAdDo9MHMuzwfsvVrE2D5nEtaOsLaCMQnF32UzvqFE
 dA8/++24yr5L2kRVmjgAC38xRQCWoBcaPybyhCpKEDvx1pqcnk3vPR3QwJgdypYTniqqXRCjyl8
 EnFmBicn5jaGpaTqK4wlMja0gm1gUnBonXLlsdtWrMzRL8bR694V4apyqSRhhvZ2/PCFtR9QbcD
 EnkaUYLUUC9/0K4pz0DHgnbGwmbkYgPp/qJ/SlFzmA0YFbMEIOKtqbw9ahEnYC1Znpy/VmLmzjH
 alx1KCKH1W8lovgeQfDNHE2cdWjmGznXv5B7GE/XvUC8/EJWZe8GINPcqsJrH3VUD+XPB8+Bx2X
 x16wuImV32xTW2KBhnw==
X-Proofpoint-ORIG-GUID: HCZEJwcX-kOsdRSSbfeS76E7fdljSM8B
X-Proofpoint-GUID: HCZEJwcX-kOsdRSSbfeS76E7fdljSM8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080090

On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).

[...]


> +	/* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
> +	/* Workaround is to use bit-banged I2C */

Interesting.. I was under the impression that it was only an issue on
RB1 and RB2 boards.. perhaps we're missing some magic register write..


[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_en>, <&bt_default>, <&sw_ctrl_default>,
> +			    <&pmk8550_sleep_clk>;

nit: let's keep the order of

property-n
property-names

file-wide

[...]

> +&sdhc_2 {
> +	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&sdc2_default>, <&sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep>, <&sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l8b_1p8>;
> +
> +	max-sd-hs-hz = <37000000>;

Are you sure you want to overwrite that? The value in the SoC DTSI is
set to half a MHz higher


> +
> +	no-sdio;
> +	no-mmc;
> +
> +	status = "okay";
> +};
> +
> +&sleep_clk {
> +	clock-frequency = <32764>;
> +};
> +
> +&spi11 {
> +	status = "okay";
> +
> +	can@0 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <0>;
> +		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&clk40m>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_l14b_3p2>;
> +		xceiver-supply = <&vreg_l14b_3p2>;

It may be that for this chip to actually be able to communiate with devices
on the bus, you need to set the new 'microchip,xstbyen' property

see:

https://lore.kernel.org/linux-arm-msm/20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com/

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <32 8>;

Would you happen to know what these pins are connected to, and if
so, add a comment (like in arch/arm64/boot/dts/qcom/x1-crd.dtsi)?



> +
> +	bt_default: bt-default-state {
> +		pins = "gpio81";

It would be best to keep these entries ordered by pin idx

> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio82";
> +		function = "gpio";
> +		bias-pull-down;
> +	};
> +
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio40";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		output-high;

You shouldn't need to assert the GPIO state in the pin entry node
- the driver should take care of that

 
> +	};
> +
> +	ntn0_en: ntn0-en-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	ntn1_en: ntn1-en-state {
> +		pins = "gpio42";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	upd_1p05_en: upd-1p05-en-state {
> +		pins = "gpio179";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};

I don't know if pulling up an active-high pin is what you want
(there's some more occurences)

Konrad
