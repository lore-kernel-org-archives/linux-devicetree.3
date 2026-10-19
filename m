Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0F3F6C4D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411527; cv=none; b=sBc5fihmxTdWVoT8b97ydJo+n6dVRM+z7Lz1QYmqHA30bhf69maAi7/7QIeB7zARH/9sIrd2PG+N5m4CAg28yN3STYr3hkZEDhYtwbeEjEWDG9791g2QhijHVBReNVsJaxry61w3srtNZzdOfEjsXww2PfpAdw862pLtDnp/z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411527; c=relaxed/simple;
	bh=t+2Sjcc3CJYX9gnbuGThRPjbfxPqVr+U/bQ0Vby57uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gr1BhFBpzg+/A5s4/6E19snKUQCiJk3QHlrMCSOCCGEaaoagPEIEpSD2WD1cOdYulLZwMuPpQTcW+/IuCVyHryps9R0CEYZFQlgAqfHr1EF3xy95Xl8Dd0CKIyVQ3qanWCRY1NjqeG2JVEmnyoOc4vW72aGRJ9UVs9FzrJ8hGyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UV2mtenz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJZYTINp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UV2mtenz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJZYTINp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OmHF2234210
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7PduYI4Tzaf1zqS1KtjsVUZm
	BBZtwzNJ1fbj3zZ1iTY=; b=UV2mtenzRppun/5JpKjkdxO60gkzaORvtHcP9BfY
	WfjqYpWG4wM+a10M0uvlO3rLoURjq2hKpHRfnef7Lxg9WdoZZ0tTanyp045X6B9t
	A1RqLs9CQ8KnqcYtzI/x3F5yA7ak0Z3FNayXKKJvcETO+sOgsnp/9sTSDAOL7qya
	ActXbEk81Kt+LzLB6A1XT44e9nYXEXTdcehrJlLdm9eN0pHWgI8aD43h/c4h46tE
	1JVvUcdcRmRaJAVvw5qHdinHEq/zn6xYBqDEG6l/Sui0ho5mYDcfOYc8/M4U2BBN
	1krsiU9T+YEzjZMFQERtUmRi5uxp2hJCrjuvbNlm+x8o/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x900a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 12:05:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so461394885a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411519; x=1793016319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PduYI4Tzaf1zqS1KtjsVUZmBBZtwzNJ1fbj3zZ1iTY=;
        b=EJZYTINpp1xUpeWYgPdcYIzA2Z15i5o71UPCix9An/WbeXdDxuuHmD5RTBhonP6pNG
         Ck41SsxUlUEHkraWZH+8R2s7CyxZqEiw+Mff287yiyZOygVprNFPfF542xacW89DnJ0s
         Pztb3EzlTzZfhY23cFSSWFsOvtQd2K/XgScQPFJHYwzPM3GgVnaB+cJxei7gfMkGeEzd
         fXoYLJ7zf/QEkdF0bVjz8YMWNf4ggJGFcptNkmV4M0UDwH2Ow872bJNQtNlnLk105Faj
         uUa4TTS3OW7w3gpgly8HiRL400246CExA3pPQnwxYa4kpqGysMXViFMRkR8psaYCNLj0
         DFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411519; x=1793016319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PduYI4Tzaf1zqS1KtjsVUZmBBZtwzNJ1fbj3zZ1iTY=;
        b=p2xZ0015CWhfDbeM78YkkYqBLiPcSyHUJadM4p/Hx1Uj/DgQ4Lb+v9VqzsAz2xdbGQ
         e9iOxrZekFuaH6ferWAlq5co+ooAzEhfTMD0T/6v/Yrbo3fzDJi3i288hL/Ujjnqlauq
         1YY/B4NclSfEGnQG8rjR0VpIAnsyEe/kCK42WG8Sg9lgEvSOAI3SRy97pn2WeZfoaTeS
         1LZEl84cEPzwKKFtdf4PRsdhSxa91EqM0RpodLRSKNOiUIAr/Mmsr5OyThIikml7lRiY
         tHr5CTsAETsD2lGmE0gSl01Jv0Ug1P0b431WQx2+8KGW13odv5YS0ifXsm+xjlWkBGm/
         a1VQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOtFMnsSFVG/E8F1QVpERmTpqCcK6rtIz6RyAnRfEj+VrZEWxoaEneZeiP+C1dwXbaHno4Fxr7VLQM@vger.kernel.org
X-Gm-Message-State: AFq9FYKxarvxgTdR0Zcq4K2sCpCFQHeJe3/cLLVeODZWah86aTuuAi1s
	y1N2gPlfrAjxa/fa+GarlC0E9tDBBBPvP39GvdoHGZYnKaSvypyhCW9suyEBGc5qgnsMlI+4tw9
	IdP9rprbtOvtfAiow/oiwiFIz7+CV2JgMXNIk1+UCnXCCvImEorCuuvx1rvwjaCux
X-Gm-Gg: AYBFou1KQLDMh+4Eo8h00qBbL0/mtsF/HrjdvG87x83lrPlXrk/ssla0RzeC7YZ4Cfh
	TeZzMTRlRx7n9hsKkIdlGEHhAkuhxxH6LcjrE7GiVQBTxc+meosLdyic0xo7HBs5ym7CokpLPo1
	Cpd/hEfJDZ5qOw37KqZD18XjEJlpVBocQBgnZtBN1ararGRI9e5+PStq8tWiUK0oxWkaeqC8Ayu
	QdByobOXBtW5LFwvaiukM5gfakE4dVQX586eJa+cyTHLM6VUIEpvnyNaygrk9cuQ/Y/FoWkgyF7
	/p+z78TZ3fZUR0l7TX+MYU1FhwBBT049XHCMXJk8WvteuVGtKGfPP7Vt7Kps4iSIRge0pJ7WUlV
	Qo3mzLx9ltyCHcsZ7gfe7kWC45auHHFqzOutdI/NGK+csQyNRkWSZuGgN8sHIKdQ4qJUF0ucBTl
	NanNsvozsvJKNG
X-Received: by 2002:a05:620a:288b:b0:93f:19c2:da4 with SMTP id af79cd13be357-93f29d6dc2bmr1161707585a.70.1792411519150;
        Mon, 19 Oct 2026 05:05:19 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:93f:19c2:da4 with SMTP id af79cd13be357-93f29d6dc2bmr1161701185a.70.1792411518459;
        Mon, 19 Oct 2026 05:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2008275e87.42.2026.10.19.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:05:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 15:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
Message-ID: <3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izujusebhw@fkrtjiqsnvnt>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: V_LDxmc84ReEchMObEZ2mi-x5YwCg-kU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfXxzFE4Nc2bjOH
 Q92SyXs65Kj9ZqsncGxSSUWp1nFVs70GCM0yfjD9GNglYiHvwbev7fW/ZOZCF7y7xn1fmK4vrnt
 j2YdL53Tp0Ok3y4w2y5/yIi33bpwYvo=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad60785 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8x1eZdSFF9BeWPnRFlQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: V_LDxmc84ReEchMObEZ2mi-x5YwCg-kU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX0wNqka3g1Hdp
 7dnD5qzOVKwLS04jzekP0dl82YyQ8pAfKP5jN8oUOw3h6NCRrx8vCXutAGxm/YwRPJJiPzdmFMn
 sHKebayYWHhv/WXDaxQanjsNMWCRG0vZZWIljTe/nP5JM/dg1fOadhgA4yaH8dL5Q6fiTKIdYW2
 kvwJwsL5ZDRV1oolGSyA4P9h7yM1BqLMigQksR6oQAsJTpF7kk4DVG0PuL0dNH4hQNEVWv9w7Vo
 iX5DJzK+NbAWYrOPFVYztRU2H7wf0jX45q+eoaDWWKv0CB+qeWWnOGZpm/RbwGi2JQn7slV9/lz
 jHWnieaffaY8BfCV6mYr9KGzpt/JQb3JZX17jjoTVQihbvbfSUL6gd4ikaH0YyyFFBKMY2j9NCP
 jEAl5aXSQBllK1l8gDSVkRQolwwB4b/nwxOgqRwk493Q/n5KZHoV1F1vTB5j/fPq876LZVsZixU
 DfFWNKB8V9GJPY6/wWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190048

On Mon, Oct 19, 2026 at 03:57:34PM +0530, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
> - EEPROM with MAC address nvmem layout on i2c18
> - Native DisplayPort output (DP0-DP3)
> - Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
> - ST33HTPM TPM over SPI16
> - AMC6821 fan controller on i2c4
> 
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   5 +
>  arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 543 ++++++++++++++++++++++++++
>  2 files changed, 548 insertions(+)
> 
> +
> +&i2c2 {
> +	status = "okay";
> +
> +	expander0: gpio@20 {
> +		compatible = "ti,tca6416";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander1: gpio@21 {
> +		compatible = "ti,tca6416";
> +		reg = <0x21>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander2: gpio@22 {
> +		compatible = "ti,tca6416";
> +		reg = <0x22>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander3: gpio@23 {
> +		compatible = "ti,tca6416";
> +		reg = <0x23>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	expander4: gpio@38 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x38>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +};
> +
> +&tlmm {

Please make sure to sort your DT file. You have 'tlmm' node between
'i2c2' and 'i2c18'.

> +
> +	dp2_hot_plug_det: dp2-hot-plug-det-state {
> +		pins = "gpio104";
> +		function = "edp2_hot";
> +		bias-disable;
> +	};
> +
> +	dp3_hot_plug_det: dp3-hot-plug-det-state {
> +		pins = "gpio103";
> +		function = "edp3_hot";
> +		bias-disable;
> +	};
> +
> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {
> +			pins = "gpio8";
> +			function = "emac0_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet0_mdio: ethernet0-mdio-pins {
> +			pins = "gpio9";
> +			function = "emac0_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	ethernet1_default: ethernet1-default-state {
> +		ethernet1_mdc: ethernet1-mdc-pins {
> +			pins = "gpio20";
> +			function = "emac1_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet1_mdio: ethernet1-mdio-pins {
> +			pins = "gpio21";
> +			function = "emac1_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +};
> +
> +&i2c18 {
> +	status = "okay";
> +
> +	expander5: gpio@3c {
> +		compatible = "nxp,pca9534";
> +		reg = <0x3c>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "giantec,gt24c256c", "atmel,24c256";
> +		reg = <0x50>;
> +		pagesize = <64>;
> +
> +		nvmem-layout {
> +			compatible = "fixed-layout";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			mac_addr0: mac-addr@0 {
> +				reg = <0x0 0x6>;
> +			};
> +
> +			mac_addr1: mac-addr@6 {
> +				reg = <0x6 0x6>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {

More of the nodes in the wrong order. Please go through the whole file.

> +	status = "okay";
> +
> +	fan_controller: fan@1a {
> +		compatible = "ti,amc6821";
> +		reg = <0x1a>;
> +		#pwm-cells = <2>;
> +
> +		fan {
> +			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry
