Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067010;
	b=TgR4f++B0ycQZBEzTgoLjKnhoOmInEW8cH9HZD/6pFKatZWKi7NrLZN4Z0MdGrx67+g8
	 hppGMi9YX+qRzWLt6XiqMaGLeBYc3WphkDNuu8w2cRNBZ43nOQF7A9aTpw5inVKyVisox
	 kWYah/Z1ufkNF8z/FX9moshQacyFeDdv/4K9hkNZKP1/XIaC5r5x7izrCdyE30leo02J3
	 2wTuuVSCUa6x1Y3AD6qfoOW7ypxL+prBzgQt2FyvgMX0zEKnMh4+zlyfnkKbJ577ZpYtt
	 R2zvB4ois0WN0C2W/OAdWC/JA15esxO1nqOJ55WKVZkGr3m0hhIOMTx+5LesnMJ4PUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
	b=sHCTCMjgxmeDYn23C+oOn3R6VacqCLuWC7YcPV5Be6E6X7PeiV2gl7ojhaaKHlTRZqQE
	 lLuNBoI3NWKzxUbtyYEP27DvVikHja10mIUOxiCDrcFQnORUY+zAl80lxx1ibZvezzyxg
	 HawPrweSLkA4ZYusWE/7tgdn99BRupZeVrG8H3TWD3UWBkXu6TJwCKnInoau+ipLcrPer
	 EUS06f9/60Il6SolST6NDxgGvdKmvLpQvmtRf5tV8WHVCXkwTTDNScL9J1BAEq5VCBtW7
	 74JNSprZnY6er7c5qzORFMHzFAryTkX1NhoDkEasRlRDCaeyPyp3lKtBtsIaGwEtQKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AE0W6r2+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0jW8hCu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83AB606A325
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C83AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AE0W6r2+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g0jW8hCu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ5Ua4B1368216
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=; b=AE0W6r2+ELs8FiQL
	ZgE41vGtWzAT9iFkFlY/MI0sT33f8JFKpmq+kP0j/UapL+bLUcjNtaYVb1hhbiIu
	GA2/bGqHsIctN2OnEGaheJSoor6W1a1wfJbfyyKx4342Iqd77JxdIQLtzxcNOydN
	giACQPCfMHThDQYfYQ+8GuztP6QlDItv+BBGDLu75tCIb1uPELVj3kFNhu6SXt7b
	MhFNWOqXIWPhGieHm3F69Kmc/Fk/3+jr8EVoRO8/wgwq0FYRLbRxrxN4TF6+rlPD
	PhrPp8ZALYmEE/UM+EwVBXp7z4x3YGsoZzPbJOWiXtM8yUMbV56lURzVtxTX3y/r
	hmDCRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg31uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:43:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2095116a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067007; x=1795671807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
        b=g0jW8hCudr550nYjrmhsLCLEVuHJTsyVGlpjdWlRlJtrtPdq79lWQOidC4u2zFmg1b
         Se80ZdR+L1602vwoduRfH7NUZKlsisnC85Kuaq1/KF4HDeBPAigsSiAu31ow+vIL3ef6
         9+agKGJMuh3eebD2BAXGt/6Q5M0cgicia88/5pFmH8SdatxPXOUEiG+H426t1Ybl2h/9
         QttBg3vNmIMTF7uoQrkO062gFMfo9bsQQiTZyqypQ2nOEDR/TFCpbStb5pJSFO+bChvj
         kn2HAg7p1cFXMDIrzGpvdDLOuxjHydtGiODAGuGto77fJs7bDsTpM32ER7HMfAxmY7kN
         hHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067007; x=1795671807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZgfSyHaB36piesAdmGG0WUOo06mxWQMWE35oHKOsDo=;
        b=ZcTVL6fkVzCke5bMpj59N1c0FBUGCzaTgxGyz0ETmQNuDTc40m/QCLWcd3+KYiXSlE
         nB2eKjET26SxJ27Jzm4G30CKkiciA1jJhi2l0o37OUsYylyimk2pavMA69Kchzy8yDsc
         lfYvKXVivQ6hLGhPVjnin30jQ1uA2xHF9qIjTCm0qsyUlJXUvmwzgspA8cKiLPnSM0Bd
         tDwFUST8zNfaDRAsyKu1qLeA2Ar7hF7BRx7lcXANOBEhCzAkmmLUzZsMAmw7Ezwju3bp
         d+1GpdKDUAL2gS9K8TOPb16B5C8U9vXEXR9gCg17xzjFg4TOc4KCFcT5ZBcWjEh3gxFz
         cKTA==
X-Forwarded-Encrypted: i=1; AL+hErHzEGN7+Q663Lu93RRQyIB4o4EEialfo7V8VJdf3Qr68o93AYjSfnT67ADnd6o3vVwrBk29xln902Ww@vger.kernel.org
X-Gm-Message-State: APuU4Z8cVhPS8QsSMKf3dUcz9dc1ykQIqxDybuTX+PcT69vzbClf7P40
	+WzYSwJYlhbXnTr37qsnvAjawDYSr1GwuMoYz6xrX57CBgZpt+T/3CIhRb+jnkYXILmQPAcwDJc
	es0rS70qxfYFKeHNUnOIoLsXP2Nvr687UFlcAjaXmj4gxBO738rMTHVUMI6jEGWFH
X-Gm-Gg: AZFdTZeRdk+X+KKzTdh3fgQ1UKdeTDcDhTjmMRXACUtlVeOppxm1svVf+pApJaWa1dx
	5aLdathj7cPavpaEqSUhktJIWUzq281K2q6I2eVLIHELP+dAOIkqEDpd2DEKX5GCYi2F/ZFAMHA
	hxmR7KIP8AraZt7Ipu+whSgItO48OAA0gxg9mX4D1ScNG2eBEFRWsL7Wt4/0FeH0wVmfiRpiseZ
	G6f0aF7YojTSFP1dD4phSVJ3iKvif4vFKVxJPeg0dxzHxxkd59frZi8+vQag6s92qLYxhM5WWRS
	WisDyN/fDfJetrYe08rdN6T5R37mibPKzDzVraRi6eKEYebaAJPzjdXkFwkL0pRxzRuB1NX538I
	qKWVkyJErM9y2PWv3GrGPIB1+BSb7XYccC5SSaE+w7qRzK2btxJ+38ABZxx6c+ZIw3zIOXzDtm6
	jNfmhxnZuxsY5kL3LHN1XeixrQIp5ClQdVkqgGRXGKog==
X-Received: by 2002:a17:90b:4fc5:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b3d06417c7mr4902390a91.2.1795067007443;
        Wed, 18 Nov 2026 21:43:27 -0800 (PST)
X-Received: by 2002:a17:90b:4fc5:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b3d06417c7mr4902369a91.2.1795067006951;
        Wed, 18 Nov 2026 21:43:26 -0800 (PST)
Received: from [10.133.33.81] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62a9d47sm24455345ad.69.2026.11.18.21.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:43:26 -0800 (PST)
Message-ID: <9d2bdf05-cfa8-4493-aff3-2d424aaebe77@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:43:23 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: maili-mtp: Add WCN7850 Bluetooth
 support
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-2-18bb1b059a17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qoTkWo7vzQXcjA5K_JkGE7IkDhOZKEpl
X-Proofpoint-ORIG-GUID: qoTkWo7vzQXcjA5K_JkGE7IkDhOZKEpl
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afe8c80 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4Dt020n5HOJ40EmIzQMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX2XXI5Jcwq3jQ
 Q8CxfamZ+vFWTdbOYgYCxmVG/eD/fNtRemtWo3fEB47EcaaLUQxQDGyqSf8iLc055LT5L1EhEN/
 bGx/BnEOdQt/JkSLu0b4pjSwA9WNj98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMiBTYWx0ZWRfX1v7u3L1Kv/JS
 Bw1keKK9hDTkwf5UJz6APQNbKxsOab21RKLPEYdaLCorKlChXpoQtbEt81z4JHUQnNLGcNUo/7r
 D6vQkatH8FmbQQwp69IwRLwCKFIXFNVliZ2savAbEQmmk0Q/GOFPFQKWIkNfG+4jzbX4hGMYdEw
 1bPKz1oUxJSwPcUNnwsWGJH8iLYUroFB1KQoFAnBSWU18f0LvoTQYid6E4Wt+j9QKz9iqgMkj8P
 hYYmLNuQkMYG9ne832HrNyu2tlNRO2vAM9tHD60/4z/78i3KRovBXThQxgI5lpHzV+K+dJP4AsP
 g3nOZABzR1u2cCWoQEp2ZQUZfzevKu2XQY+aW+1hy4rLs3xK4ywnyZXDYEtVHHGEg3QQ9E8vgRs
 jZiy5Pnay4jTgO++2U+wz8EZMnYrtYYMuX0I6GadUHQhEOtTNYxErHWyZYoClr85Po7pH9TqEcN
 rBu6TMUZ17Uct7JMAcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190022



On 11/18/2026 11:33 AM, Yijie Yang wrote:
> Enable WCN785x Bluetooth on Maili MTP board.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/maili-mtp.dts | 35 +++++++++++++++++++++++++++++++++-
>   1 file changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> index a3c2016eb9053..49fccc43c9828 100644
> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
> @@ -146,9 +146,10 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>   	wcn7850-pmu {
>   		compatible = "qcom,wcn7850-pmu";
>   
> -		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
> +		pinctrl-0 = <&bt_default>, <&wlan_en>, <&sw_ctrl_default>;
>   		pinctrl-names = "default";
>   
> +		bt-enable-gpios = <&pmh0104_c_e0_gpios 6 GPIO_ACTIVE_HIGH>;
>   		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>   
>   		vdd-supply = <&vreg_s1j_0p8>;
> @@ -178,6 +179,10 @@ vreg_pmu_wlmx_0p85: ldo3 {
>   				regulator-name = "vreg_pmu_wlmx_0p85";
>   			};
>   
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
>   			vreg_pmu_rfa_0p8: ldo5 {
>   				regulator-name = "vreg_pmu_rfa_0p8";
>   			};
> @@ -872,6 +877,16 @@ led-1 {
>   };
>   
>   &pmh0104_c_e0_gpios {
> +	bt_default: bt-default-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		input-disable;
> +		output-enable;
> +		output-low;
> +		bias-disable;
> +		power-source = <1>;
> +	};
> +
>   	wlan_en: wlan-en-state {
>   		pins = "gpio7";
>   		function = "normal";
> @@ -996,6 +1011,24 @@ sw_ctrl_default: sw-ctrl-default-state {
>   	};
>   };
>   
> +&uart18 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +
> +		max-speed = <3200000>;
> +	};
> +};
> +

uart7 < uart18

Thanks,
Jingyi

>   &uart7 {
>   	status = "okay";
>   };
> 

