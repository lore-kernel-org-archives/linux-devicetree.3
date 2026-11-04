Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796285;
	b=lSgG2pF+lj1YunAO1NYOt+zLJRIDMY2v9Uy5cCY04MbS3nEexViWnDX86B6ekuHzBHnu
	 MrzKOOs4/744hpFwcUvetVVLnrzVr2TI7hjeftLt2aLqrlI3nCtrNJvHbwNXwuwJ3H6Pc
	 xLslHLW0MB3LSsYxqM9CtF4VgBSQ+W0gGNeq0Dbv3r9KnfHI9W2AkAJoVzIT0jcq+dOZE
	 5G8TPlQSl99DjC3tjN8GlBp0iYp2TejmArzTdvcsNEhTJdtKgoeO6ysUdRYjfo6NCi8/j
	 xQm7yvWdy4sOUbvF3brIkQIbZE7JdLKGizFz9ubrLqlpK1LipUBfAesocmhQCHNTdFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
	b=uz05VpUSDhcVZdBsnsICBueFtw3ZUzqsv4qArG5jy8/7HNLj1TjYKXJY9BWIQHenM23/
	 rRl2L17Thl8PCigAptdvITYDdznw6T42hOcfGaFdJpTxIHcWSFx4dTXN8PcKPGWldsOEG
	 VRQ2jYmEzvKTSKq/Ig4SeYZXBRr/1EQLme3ZM85WFQBda1Q4WndH61NKj6kfUgvl/M9LO
	 ljERyI0zw1T5whhz/oy6f2oVOaxUZ/krYG3Jy20xDDVtWnvcsFCJAXSny1AZlJesefNCO
	 zx3sxegWOKob/ocrOV3Kc/LtRaqVeZyjbgpQmpfi1xWsj5JZM8j0Q0LQ6RmJVQdS6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIKOv8cM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AE606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963AE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIKOv8cM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZtBq1700396
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lpw21cJiJ9wruQZ4XIkQa5Wx
	AYUj9rrJY9kVvdlbygk=; b=VrzyRa5yJxKjF5oCblD4/urpQd+MDemmYa1H0ioS
	bMMwosTxK4S14FNlA5omekOFPhDLypULjSJg4XTej+4KbSGwYudvfFkLypNQYL9A
	Ag77eCy9U2haTWbsANJlDXeSf52C47b3AQZXb8i/8BfXvC/cCiuLcbK9ztiVXO5l
	6mUKXPpumdZOsQ4aoLtfMLVgzD4MtP3ScIcBORJyzx4JnJPWICgAplP+EdHV1o//
	zm7wVYhoChgnhF/er4ogwF28SYaG3YKXkqeeVzDbca+RwBSTtin1QphAnokxP4vP
	yb8sDkP4C5vmGYiLSE7hz7/8pzzSXnIYu7DIEHHdfbs5mw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pygatr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:44:43 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so909203c88.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796282; x=1794401082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=TIKOv8cMs59SLInjeoHjWErjkqcFC92AT01kYBuiGMqWtzlDHGLrvjFQpFwDvriI48
         E72mUF+0lqXwts2apxF9Jb0Igp2w95pdxpvdJ6x9Zki9tfuAY06WqBN6OWtgCpo1+OoT
         z1WWlOxFP+Shr1z9wTxsDSNv6sGkQfEw8qfmnEzqHccrF3eMBbIbe2wqCC+ytZVn6QFT
         y+7rksuxrVtR+/cpbIyNK/cP3Jz45xbTs6IhcZyNDr84WQC+C/KUwg43l0su9s8I5+gi
         KKidJBpDDQMwa2ZM2MTizyOxY/rNKSz6gEPMkL02p/VqukcJ7mfodapkS+8BO5zfsjDW
         qFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796282; x=1794401082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=GNFVoqz1590LaHxM3b3P4xOq2/suX3GzlA0A/5yL4M7GTkPrvDjoio//a0sQT5v+2l
         HFUHCmXLyNXtmB3hRogu8DtBNRZlB52cc8ha6ADT6TI5TVTeUqv+byVwKgCFaCogcV56
         en2+FkV2j7nmawcW1lILRjHgRDzEWDBy/QZCZfzxGt+1THLa1gJm735GcTx7VQNso7RE
         bU9D6ggH0l1uruL8wAmWP6h+3XuZPF2iN2zHjY23BJrvOv5cYIlp4ai7sYouw28KQav2
         dfkKQd5Qjcm4k5zS/EeRJOO2U31+GTG7+pDISbkdczoQ+e54zpaC+qkyjlS5ZqEMG/WW
         qzRg==
X-Forwarded-Encrypted: i=1; AKwUvBw5+FCJmUg9ErqX8fuNchW+tDPeYMvfqaYexKq9hhKXxOfP3R2MoXw8JYGD/EFPMC7ZBTmrFltqmSMG@vger.kernel.org
X-Gm-Message-State: APuU4Z8zzyw6gc6Nt0RtKzeOWWfY+CI2xTeEha+RO0Mo+9w5BGniAWX0
	ug/GL8kmanibAnRCmutrvz7yBIz0Sabs3tJ5rKGBbHgg+pIKEosJ10wOmYgON4UjNNf6bAYLBzT
	osFm0mO28BQ+H3xyeF5V6SWGOJeDlzHyqfMELv180+JdfOQ+YOM2+49NVesHmiGT5
X-Gm-Gg: AYBFou2rIuS9tfhiTehW3GQNxyrLfLnczgHp2y3Dnh3SuEe7B30+huXrbHUR1Ai0POv
	RyK7W4JzZ9wbLsgxpg7LgD8NxB3ukW8nKjlyYm/IvnkGyWwGp/+HS5V9F8BdrOPKjyNPi8PEGHp
	Nxy+BhmeiS4Gs9lcmGocjz792gtBmdBNcoZ8AefcL/THOValv/zo4qiC0iGxJyD3TfRUStvzywv
	gNeN7vfdk9ChIzcowY4IL/jaThmgl9jwcS/K4fw7Fhaqs/qDiyQCVTlapMLhI5vE6pL5B2f/JUs
	hKcjQre3dc6VyKBAkdexNLFtt0txuJirHg2AB8TnnDowLb/jt0qBo24DWAGwBllaY0255LXTFi5
	sAD9x1a2jConyozmY0ljx88jFxM1wG16whDrAamhzPWMmsqM5Xh6H0II8smUvwdtWmWM/S3MSSL
	GjHaRARO2DNdCqoQ==
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221948c88.29.1793796282371;
        Wed, 04 Nov 2026 04:44:42 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221898c88.29.1793796281578;
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8110251c88.13.2026.11.04.04.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Date: Wed, 4 Nov 2026 20:44:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
Message-ID: <ausos--t6wJVzI9g@QCOM-aGQu4IUr3Y>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
 <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb28bb cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apQYb0sKy1KnhfKHRK8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX4itlWNYSf6ny
 7sOhWXzaogT3J/kXvI/udlTKO67SfX171iQm7pnQkpPtwKVL9tK4iQ9hJd+QO9yk7lC4teZePBL
 /fJq45do4MmshneYnsg3PNzxDE8hLtzLo9ZYPTDy/a62JIqdJZ1x86Y51XQsWRWhfQuYXkT2/hH
 inBsjn4BKqgTVnS6xDSoY6Uz+9oMElWJqrI7j8py9WIf1XvhhW/H1tVWERtUlPNb7Ehz7XOfimQ
 knFBMgLrpihAbtldHwx7QEJI1G42V0xMjaSJCb0CdenhbmjFyOAisIgZv0Y+qFezlCCvfRyaFLZ
 Aln3EqqQXxWKHX2heBFk5mj9TzgCe8lSxY0FfFEaIhI1a8v0VPAPF5AzWtgofUzEUJZhDDGjgVr
 AV4EFnuihwnoiYRG8W/TQdvi5zAhFDbdWy2GtbXtvVF7iIvype/48j0/mtAKg5A7q5Amz/UNHs3
 ZOIQK9Qjbh6GOB+7h/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXwSU9knizY9Ew
 BW2fr0HvAyqmjRMDVnkV0nhHNebG9U2NqvNnxXCcaTq4i356/SoSax/1fSkPBxqwRqDFlVUe8R2
 EjvnDNynaV/u8IRdfAbMWpunA5aahN8=
X-Proofpoint-ORIG-GUID: PsmYpxRw_Ed0vN5CP2mYlV_3t5yOknqw
X-Proofpoint-GUID: PsmYpxRw_Ed0vN5CP2mYlV_3t5yOknqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

On Tue, Nov 03, 2026 at 11:42:00AM +0100, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
>  2 files changed, 237 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 91c97a55f2787406b104650956b9a511a6a34c23..96a54f32f0eeb16dbce9802e74eec82622ecd35f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,18 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes0>;
> +	phy-names = "serdes";
> +};
> +
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes1>;
> +	phy-names = "serdes";
> +};
> +
>  &firmware {
>  	scmi0: scmi-0 {
>  		compatible = "qcom,scmi-smc";
> @@ -3218,6 +3230,24 @@ &uart21 {
>  			     "perf";
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08901000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi7_dvfs 0>;
> +		status = "disabled";
> +	};

We have the serdes node for Embedded variant as well.

        serdes0: phy@8901000 {
                compatible = "qcom,sa8775p-dwmac-sgmii-phy";
                reg = <0x0 0x08901000 0x0 0xe10>;
                clocks = <&gcc GCC_SGMI_CLKREF_EN>;
                clock-names = "sgmi_ref";
                #phy-cells = <0>;
                status = "disabled";
        };

Per Nord discussion with Konrad [1], I plan to move serdes nodes back to
common DTSI and let variant DTSI to supplement or overwrite properties
as needed. Does that make sense?

Shawn

[1] https://lore.kernel.org/all/ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y/

> +
> +	serdes1: phy@8902000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08902000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi8_dvfs 0>;
> +		status = "disabled";
> +	};
> +};
> +
>  &ufs_mem_hc {
>  	compatible = "qcom,sa8255p-ufshc";
>  	power-domains = <&scmi3_pd 0>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> index 6f19064997a4b50525fdf630307b843604368645..2b3c9e90802bf89b91354039f0e6a24941fc95d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> @@ -14,6 +14,8 @@ / {
>  	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>  
>  	aliases {
> +		ethernet0 = &ethernet0;
> +		ethernet1 = &ethernet1;
>  		serial0 = &uart10;
>  		serial1 = &uart4;
>  	};
> @@ -101,6 +103,179 @@ trip1 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-handle = <&sgmii_phy0>;
> +	phy-mode = "2500base-x";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sgmii_phy0: phy@8 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x8>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi7_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +
> +		sgmii_phy1: phy@0 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x0>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi8_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +	phy-handle = <&sgmii_phy1>;
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup1>;
> +	snps,mtl-tx-config = <&mtl_tx_setup1>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mtl_rx_setup1: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup1: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
>  &gpll0_board_clk {
>  	clock-frequency = <300000000>;
>  };
> @@ -145,6 +320,14 @@ &scmi6 {
>  	status = "okay";
>  };
>  
> +&scmi7 {
> +	status = "okay";
> +};
> +
> +&scmi8 {
> +	status = "okay";
> +};
> +
>  &scmi11 {
>  	status = "okay";
>  };
> @@ -162,6 +345,22 @@ &sleep_clk {
>  };
>  
>  &tlmm {
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
>  	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
>  		pins = "gpio1";
>  		function = "pcie0_clkreq";
> @@ -205,6 +404,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
>  	};
>  };
>  
> +&serdes0 {
> +	status = "okay";
> +};
> +
> +&serdes1 {
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.47.3
> 
