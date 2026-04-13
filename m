Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CC033985
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044405; cv=none; b=Ab0WUoDskX73X19u7wK3EUYSARwitxuYMjMaQpg+p43ojCRvL749hrQ3zylP5FgNCVwVeBdPc6LyhjLtwi0nSerFvNkVp4F8EJtMfyoyAiFSrr2Bq6r12nMRc6QIwebtEbvX3351W8P8/2YasjjHrb8te2R0eDEnwk/oaUYR0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044405; c=relaxed/simple;
	bh=oe5t3AcYJshLQ4JB+AjItC0rI4jaMbSgcmPuVAa7/Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCR87LRuVGUR8yzHc/UNrXZkiBna892e0Yd76JcMH+nfUQMxyzyiNHq5+YWa7bTs7uZJj9ClJziyRcQeH1TaIuXKu5zyZgOTknVz7yoIfs34fuSP9TNbvlwrclNPEFkz3Fy/vR8OcCmN6Vyv9cKVsOuMXUTld8lJ36Ev7u6Z5e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7nJj3N9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hW9qXqLP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7nJj3N9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hW9qXqLP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CKSFeR1305286
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sOIIpswc3A9XR5+Qo4s2YEtp
	1qhxMWOqiWUra7KCaGE=; b=a7nJj3N9yWvZ/o95QNCbUeK3kUQnfV+2ZaQbfSn1
	6l/A0TOFMpnaS/W7JvhYakRxr2NZpr89qxl45dqWcgmnmy0vUrlrdk2mNx9maYC8
	b0vgrMDcQLFXUc+1mDdopnlbLyPbFd6rCIM1YBA5SBsOYJ8UogqgHRH7faW5Tr5u
	04gBFehc3mcldOs2xObnAWEXTS2OfivSNFSBQp6auynsc+HjNL2Crd2Qr1y5me3P
	4oCd9hz0piARZVx1Nigz4MppQqQMd2QCCXYmC8H50Xp/qCFYl+UXn+ySlD937N3+
	xiwh6AjA8QaFiNjCLaQ9fIAJYzoJB+NhcJCzrBpb48rfaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bba04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:40:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so149368931cf.0
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2026 18:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776044402; x=1776649202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sOIIpswc3A9XR5+Qo4s2YEtp1qhxMWOqiWUra7KCaGE=;
        b=hW9qXqLPs1r+a4ad5LpeqnjKNbypCSsRXC585XXco/ZPzgnd29B2VgKrrO2E8Z4B36
         iIHiNLp5Ng52W0E411s6Ent9e76pcy9AVB02xRV/+fmp6pZP90nUxMAz1ZvubvC538EY
         ylhAzcZAfiEHiInzl9K0qGGSg4Lj9F3SKDs8bDgmsuWHOJHQKBHx8JUJdESgyb/H4+fo
         lnWkdbptwoD6+ZV3IIGe68xG+KqK/AMgaKQ0i/tfELXwObOUAD+ll3A30tFv7XZt6Rqv
         xZzje4tDl+mHwAxPElTEPqsxAcpZABQ1sBGcuWPbDuDHkbKCPgHfvGY6VwozdzxVaOnm
         dqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044402; x=1776649202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOIIpswc3A9XR5+Qo4s2YEtp1qhxMWOqiWUra7KCaGE=;
        b=OogROQRkfS2jUoP6BWrGexMfv2JtKrCmPsNEkrL8GJ4Br97DEJHUfQPgQZsMcYCdyu
         7WUq9A+fkOWje/M55ZpmOoQq69kHWXdxIRL8Qu3RGc6wRTEkT2WodyS2iY+yGNR2CZ7y
         692L41jtL+pQIOayvRwQoV1p8is5C+lMF/FcBdkrzmwLm9UgZtEz5u07ra6J5imlEtV7
         v3lvlTJTYCNTQIe54JLSuroAtHZ23DUIrIWhCZZ7J+zrd/n+lQ5R3qkp0ZeYXETfZwLd
         zSP+qrlWozAeGiM9b/D59+8QVCrpu5rfDj0nzsmV3hzfgBP9CmQEBoJgKNlJLKVjiweY
         a2fw==
X-Forwarded-Encrypted: i=1; AJvYcCXcY/uhfJMp29rzfCwASlpwVAqbmlUY5smdOMwVNDEytYu/x7MAqgWrtDqyJQJ5JTHHyOGgit311xL/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4k8+/DJZfXrKzx+ygFqt59PI/daqZ7viUJoeRDuxdoNwB101x
	GRKaEfCYFb6nEaZwNksrXSONvVneu5kfebxiNi6JeWxJXhnIyNM1TIAZacfeE1MhkentgheHHDC
	s7OGcM+D+b3PK3yCkHEXJWXvsKu+fUV57LYoi6I1+vB13JWAQaT/6GJcQQdGF3tay
X-Gm-Gg: AeBDieuE818oo0f7AhSDqtYXjJldVALM1zq+2mPPuIJnUxtwGPyO+49fVDF+PJ62xPn
	cmilm41v59xGTCSABhzCTspOP6fJp74nkzY9hHVDpC4tCpZrEVs8b2kRBiaL05m9+lRij7RruQa
	1zgyzToOid5vFADZPYIjCJIFty5V/hML7FLY15BH6Ni5VdLubTqAe53xPXIGcGf72Rk5II3doqR
	f6bOHZsTMP3dkNRXbcUS671BBNY9AR7mK8s/dN/LlZBKdaiSfPTy+wUFyUVkJ6oAdDEDeeSlZ7h
	bnjKOi6v/UJajHKudoTboXR4VMogIh64m8bTeZ4GknFzlhXvG8LxPUgzJKqG4evD/ecKixbpMj7
	p8a6ckQh0JNAAzNcolU4TtGu6NriwzmTx5J/ePSuZhpAuoYyxm2Un2wHeoB+fKIgvWjkQualRYK
	H/oJyTMiR+xF9ZITgi6dmTfV+Td6h2dv8QN0E=
X-Received: by 2002:a05:622a:4a83:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-50dd5d16905mr172559251cf.53.1776044401714;
        Sun, 12 Apr 2026 18:40:01 -0700 (PDT)
X-Received: by 2002:a05:622a:4a83:b0:50d:71aa:6b67 with SMTP id d75a77b69052e-50dd5d16905mr172558671cf.53.1776044401220;
        Sun, 12 Apr 2026 18:40:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee938fasm2241602e87.34.2026.04.12.18.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 18:39:58 -0700 (PDT)
Date: Mon, 13 Apr 2026 04:39:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joe Sandom <jsandom@axon.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
Message-ID: <luljw64s2p5kvxe5itn6zwbjaugkj7a3hndfn6ff25wbwqcwv2@numatjdny6ho>
References: <20260409-rb5gen2-dts-v3-0-be736355d4b4@axon.com>
 <20260409-rb5gen2-dts-v3-5-be736355d4b4@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-rb5gen2-dts-v3-5-be736355d4b4@axon.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAxMiBTYWx0ZWRfX71LMI4BB2g7q
 e5zOZiBVhdw65dTLxrNIKa5Ofx5CGDrGaorjYg2Mf4SJnwQrmLKaf95NAW4m6Esl+uldRQQCidP
 SYGHjEq+T29m75C88AXivSRAuKfMeqJMyerDLqbG44r8QwfbWlj/wjVaGrCYqKmEABvi0oZI+Xh
 KA7gh32wd3s27igsWRUR7aUwd1WF2v31iYyR3s68rGZkKCn7W2UNWHSHcfZVZPhtQzcHbRtAXzT
 cLB1MK+XWCB/Lw03gm2lr/hphCwhYkRPEMyDn6Jr0bSDiez/bBApPKWQqzruG+lampWHI7w662s
 hKOWPD1J3OfPARGikgp2aACHryI5HKHTRxXbJBBqPx/AiMCtp8dQmRL7N30Q1OSne5jWwFQsHoO
 aWzaZ8GdNn0qHppEulDHKkrNB4C1dwnsjInAtOxnvshsVkhW+fHo7KwclJkkPnQulZa0b7lf7fn
 gsOdtGAjmsLWyW0mLRQ==
X-Proofpoint-GUID: cyWPOlFYXB4XzNc2KhZc9jY8Z6NmcYO-
X-Proofpoint-ORIG-GUID: cyWPOlFYXB4XzNc2KhZc9jY8Z6NmcYO-
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dc4972 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=zpOVymEVAAAA:8
 a=8n8SyL_cAAAA:8 a=h77gEMGJAAAA:8 a=lzSV1cQyCp21EmyH-w0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=LCD48ZUe64JR9pieE8wa:22 a=-K6Y0kWoOJXvxDHPO-NO:22
 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_06,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130012

On Thu, Apr 09, 2026 at 04:26:57PM +0100, Joe Sandom wrote:
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> This change implements the main board, the vision mezzanine
> will be supported in a follow up patch.
> 
> The main board has the following features:
> - Qualcomm Dragonwing QCS8550 SoC
> - Adreno GPU 740
> - Spectra ISP
> - Adreno VPU 8550
> - Adreno DPU 1295
> - 1 x 1GbE Ethernet (USB Ethernet)
> - WIFI 7 + Bluetooth 5.4
> - 1 x USB 2.0 Micro B (Debug)
> - 1 x USB 3.0 Type C (ADB, DP out)
> - 2 x USB 3.0 Type A
> - 1 x HDMI 1.4 Type A
> - 1 x DP 1.4 Type C
> - 2 x WSA8845 Speaker amplifiers
> - 2 x Speaker connectors
> - 1 x On Board PDM MIC
> - Accelerometer + Gyro Sensor
> - 96Boards compatible low-speed and high-speed connectors [1]
> - 7 x LED indicators (4 user, 2 radio, 1 power)
> - Buttons for power, volume up/down, force USB boot
> - 3 x Dip switches
> 
> On-Board PMICs:
> - PMK8550 2.1
> - PM8550 2.0
> - PM8550VS 2.0 x4
> - PM8550VE 2.0
> - PM8550B 2.0
> - PMR735D 2.0
> - PM8010 1.1 x2
> 
> Product Page: [2]
> 
> [1] https://www.96boards.org/specifications/
> [2] https://www.thundercomm.com/product/qualcomm-rb5-gen-2-development-kit
> 
> The default msi-map from sm8550.dtsi is deleted for both pcie0 and
> pcie1. The QPS615 PCIe switch on each port exposes more than two
> devices (1 USP + 3 DSPs), but Gunyah currently limits ITS device
> mappings to two per root complex to save memory. With msi-map
> present, the ITS MAPD command times out.
> 
> Deleting msi-map causes the DWC controller to fall back to its
> internal iMSI-RX module, which handles MSIs without this limitation.
> 
> Signed-off-by: Joe Sandom <jsandom@axon.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |    1 +
>  arch/arm64/boot/dts/qcom/qcs8550-rb5gen2.dts | 1573 ++++++++++++++++++++++++++
>  2 files changed, 1574 insertions(+)
> 
> +
> +	lt9611_1v2: lt9611-regulator-1v2 {

I think that comes from the RB5 or something similar. Could you please
rename the nodes to follow the pattern used by other regulators
(regulator-foo-bar) and place these supplies accordingly.

> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_1V2";
> +
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		vin-supply = <&vreg_l14b_3p2>;
> +	};
> +
> +	lt9611_3v3: lt9611-regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "LT9611_3V3";
> +
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		vin-supply = <&vreg_l14b_3p2>;
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&redriver_usb_con_ss>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu_in: endpoint {
> +						remote-endpoint = <&redriver_usb_con_sbu>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	pcie_upd_1p05: regulator-pcie-upd-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_UPD_1P05";
> +		gpio = <&tlmm 179 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vdd_ntn_0p9>;
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		enable-active-high;
> +		regulator-enable-ramp-delay = <5000>;
> +		pinctrl-0 = <&upd_1p05_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	pcie_upd_3p3: regulator-pcie-upd-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_UPD_3P3";
> +		gpio = <&tlmm 13 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&pcie_upd_1p05>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		regulator-enable-ramp-delay = <10000>;
> +		pinctrl-0 = <&upd_3p3_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_0P9";
> +		vin-supply = <&vdd_ntn_1p8>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN_1P8";
> +		gpio = <&tlmm 67 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn0_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
> +
> +	vdd_ntn1_0p9: regulator-vdd-ntn1-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN1_0P9";
> +		vin-supply = <&vdd_ntn1_1p8>;
> +		regulator-min-microvolt = <899400>;
> +		regulator-max-microvolt = <899400>;
> +		regulator-enable-ramp-delay = <4300>;
> +	};
> +
> +	vdd_ntn1_1p8: regulator-vdd-ntn1-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_NTN1_1P8";
> +		gpio = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		pinctrl-0 = <&ntn1_en>;
> +		pinctrl-names = "default";
> +		regulator-enable-ramp-delay = <10000>;
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "QCS8550-RB5Gen2";
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

codec < cpu

> +				sound-dai = <&left_spkr>, <&right_spkr>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +
> +
> +&i2c_hub_3_gpio {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 40 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;

pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;


> +		pinctrl-names = "default";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs8550/adsp.mbn",
> +			"qcom/qcs8550/adsp_dtb.mbn";

Sound and GPU firmware is under qcom/sm8550/. Let's don't multiply
entities and keep all firmware in the same subdir (including the IPA
firmware too).

> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs8550/cdsp.mbn",
> +			"qcom/qcs8550/cdsp_dtb.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/qcs8550/modem.mbn",
> +			"qcom/qcs8550/modem_dtb.mbn";
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
