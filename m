Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1252DEA86
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128407; cv=none; b=ofRUIosUicX6w6EZdC5K5fGb/gpkFJzGZtbDvcsfAPmOc+DrXIrZhl16GATGx7Hbd0YPEHydPO9i/tKLTPiZ3qpilWMeDz0Y8ZORaBiJaatOOamyxdJIGPWxEUBtFbtGGX+8PBvMZpMs6typxYDx7NxtXrQX669tvy6XwqlR8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128407; c=relaxed/simple;
	bh=VaLYOkDwfsHGnG49Q0RK7wCa5ND4A8N6ApvIj7aGcVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSFMe75ErBlR7HCwmdKZIoxESgY2pLVSWvIihzpPiWfJcplauQydJbBW+esTA4OlyxvNErkHqFMH9CYthjKzZN4ferTzM/QpZ4Q5AdQXIss8tByWDBNKtEIjDzl4neknkciDC36e7VdGU9M6qAGg4Qtemskp1GJUb7TSZph1DIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJc6aGmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj1SWuTb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJc6aGmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qj1SWuTb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAoG74941147
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=; b=YJc6aGmwqa09l1yU
	NoSodAyaBFmy4S6deDm1CD+Xd6V1wIqvQOTdfaB1PQbQ4uhrpMTwB5rUDJpx8uLm
	b3aT2lViJGlb8bLZmN23saTGK+2poDEUGzqttwd4W4uL32AD6gvWD939sPPwLLC2
	T+cP7vqlYSAy78nfhAoK0em2nZJFo2lmNTwixKOGH8b7yCjM9wGb89uGOhB5htHJ
	AlISQ82jqrJkyyJJB2qKv+QKTDCEtkNZGDcRso92R0gz9J7iIWx/ytZ01NzP6nDC
	fWy+RY/NY2tlJnPkpfEVpBnNB/JnSjso6gy9hV9Cdye6MulzVO3Y1SQAUGCUYXoE
	PYuheQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb86gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:40:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177b12d7bbso6153161cf.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128404; x=1782733204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=;
        b=Qj1SWuTbQPzfU/h5GurVl5Lw+dIhRJZ6azFZZ75CsAonaGsV0PV+dzWkHVekWPqAA7
         5le5PSLTLplPhdEJzszgL4QYoRwJwrXBXgfoMctWviJ0wuHAC7hzv3bUkS7kbEz96mFm
         8NCjzy55rhWlzbhThrxJ2jel/Id+duKmNYzrf54CE90u7dZ5Fw8jsVLM0bd1FQaYjSeW
         xc1L7wVAjye+aM0wSD+78ViDEYkAHNPIzNXUAXzThTKtXlyHdif0bl+wJ2ME9DLkXcjd
         Dv06ZhscDtEt3r8mojUrI6FatKbr2mfZ8sflxAmhM5Mb5TrU0iiVTAOBsuO2vCFW9uxY
         /8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128404; x=1782733204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=;
        b=Tq2CqWogLzNCh0AgXKh3tBBDEsxCnY2DDjCaOYJ+Dw+6EslNCHH/k0jrD+WUEPEDAu
         vdXN4v3sjulCrn50S8a6Exh56B/sPBhXCAQu39tS14/DwLh3mAMUNsGpBOSYu+Ji6EP+
         wquYzQ2UXSXef0ysBuRt3cdZoIRdQ/puRzWJUcnN+k03DIKV/uqBUk1nX9crJIIzKe4U
         Ex0RAd61Uj4AW8e20DLOHQnxpywON+jECXS8XFSNEfJbSJJEa8w6s5Gmbl8ja30W2wtH
         28Hi07Zq0hJmk3f3yccnkAsZJU87KSCTq0PVcFL4JaHr86WXnjR+POZs1gZCzRN0hvQQ
         8Jjw==
X-Forwarded-Encrypted: i=1; AFNElJ+HGwjjAWiOJCwKfePMPGRm/XZAj009WhPkpNKnRt9J9LaoqQc3L60YxmKBez/4FirHsQnwCveGrXnj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm7WCHCyU7IVzbEK91uJK7xLjPInq0/MB4DEX0lGS4Wr9CHrAB
	+GFIZxDdbNT2aheWNHuzOU8dvwoiJnr1lLez2k9X9k1kjNl0sFx06UHtvg5193AhYof6VnBYzIP
	pz36+fd52/92iW+xvJfFju2ppeY+ZPSOTDfoPgaS26w//k/gpFerBQ+9i72GOVEqm3s8d2PK1
X-Gm-Gg: AfdE7clTURrP+Vz/ZuCBdas4+GmRpT9ymE8GLnoJlssqWzDX3JmShMGsrSijF3pQje8
	a+sUtWt7P77Gk4rNSF35bZD0N78JaTAkb050jmmZ2Bznhd/5X7uLFmZmCmltFyU8vf83BLF5ytC
	8jUBdoAiEe//NvlGc+7w1snCiLIsr6NFM4LndpqBCU+k9TwUSGhv89zFBy24pvHk1t2kadSYHmV
	zQRhWKg0fj1fhwENtvhpoODg6rERuyIVdd31KOtjTBa2NXjqTVvupPMDMahcibsmHnR4KglJJ04
	4O6+HTYAkdznD7prznkQS7DjoFI1LLuggGDsV+haRp2JlFBdRAN8UzNcmVYJMm0JiNUez3eWegy
	g9jTI89NR/hyHekMOUMZnCgp0efmgbOcpExM=
X-Received: by 2002:a05:622a:24e:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a4f4d3658mr1037281cf.3.1782128404360;
        Mon, 22 Jun 2026 04:40:04 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a4f4d3658mr1036931cf.3.1782128403701;
        Mon, 22 Jun 2026 04:40:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e998d90sm348405866b.17.2026.06.22.04.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:40:02 -0700 (PDT)
Message-ID: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:40:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_598E543ABA6624DF90EE8492CB23BA904505@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_598E543ABA6624DF90EE8492CB23BA904505@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfXzyGRGjn92mCl
 YnHDer7DKrqxTs/lbs0by7wyDI8NH/6s0FDl57B5oavORpIFHMJaavpH/B52CLVWSu+S0jtmdEO
 gRIAiwg8tGvwA1WKm/8545X4y+h/nJg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfX1costI+ry3KB
 DiEzgshLsIDhdYWLilZygC+sD2XxlXVb0pqY4JpoHciKJnMjDIlMUSUqXEQSB58f1xSGn9JzG/k
 aIlRG93OwXUmoog83i4Xhw3+E5n7md8Jwj9ofrknOz2K+RJgWHrUxMKFc7ioLe3qyQltuizv/yo
 OsVKtLZ+oXjGyu4iyxSLD+nF2G1e5j8JXziZ4mttCN78hdaZNY4H4D2F87PT+2/0/n8IUeqrDFm
 IsVU8gNRxN/+v030bZOxp0Gv7Z3bdi90Rhue+3jDBdWRwRXYKNMYam+HgFNSAKJljrMO44robf1
 i6/FzvVwnROC1CQQf9K0vh+Nq7cJsWfKSfiM9Se1MmXPtYDF13ZkJ9v9vgogRdHHHuLp/SbKWcF
 olUH64sdrxLzZwGwbkBl3g9EUCJTuRo6Czq8oLDG6wXhUnpcgB4514X0JPstK5OQ2tvDLf/4jHJ
 28+wIlZ/vkioiLwE0+w==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a391f14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=dZbOZ2KzAAAA:8 a=6KmFjNX2lQqt7PmtP9EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: cuOckexsJZDnNae6qqauYTzokySeulJ7
X-Proofpoint-ORIG-GUID: cuOckexsJZDnNae6qqauYTzokySeulJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220115

On 6/19/26 6:07 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index 51b57c697a75..2687a2a8dda4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -599,6 +599,82 @@ fuel-gauge@55 {
>  	};
>  };
>  
> +&i2c15 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: please add an \n before status

> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";
> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <84 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_RISING>;


> +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
> +		vdd-l3-l4-supply = <&vreg_bob>;
> +		vdd-l5-supply = <&vreg_bob>;
> +		vdd-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>;

property-n
property-names

in this order, please

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1152000>;
> +				regulator-max-microvolt = <1152000>;

Make sure you verified all of the voltage ranges vs downstream,
as incorrect values may lead to hw damage

[...]

> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};
> +
> +		reset-pins {
> +			pins = "gpio76";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			output-high;

Drop output-high, the driver will take care of setting the output state

Konrad
