Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090088;
	b=EEVqYfMIJ9l0Hfz2Z5G+14F7bVz+p5LJLXNb71JW5TwP7J1/fuTayVPzKa6CvuAaM0N6
	 0OtuakSJKxsNKUKC1RW0jdMLSB8gNycE/uDsNlAkV/kZH+0qqzB1C4zXTjJKryiG143DL
	 iPg9CkrwSsoC7EnVpyCWu4LK+xHwcYAcnBFrWrfttWi5h6IbhElZcnnAkDmsRaGsCWZju
	 o0683joakfV/Eq3H1/f80Kjdv3CVNfC56R5xIAXsLlufYS294qCziRn0/TM4NpGv45UOZ
	 5P+DH89udtpuBci81Fd9oMsuJ7ttGafgrvsroMf150X4emkJjLrmhnpmT9UldIfNaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
	b=WXnKrYVo5jy5txqxrC2ArvtUXBmCMgoi3PUByrnYN8JNudlrwsyNQDG++n7GEtQ6yj+u
	 UoLnnA10aCGm5dpqQ0I4i/jHb5okwakTwbnkeZKjarnccMYalX68UPMAU92XvYmZvE9hK
	 F7NyzDP5VtEtxKkMKh9+/wZO86zDD2FHWFZBzlv2hOg7hhtx7wFiSaI8IVbIuoFbE/udJ
	 XQ5qEn/SHz2pYmIE83DeRhOE3EkXhapQs+Fh1qlm/+MlrwZ1mxJC2XEumZ2JcvvjwHYSL
	 7gnXHVtSISlRvhFPtRy3IaUK/YQ1Ox+M9xSCQFocObgKRQoY1MrSKvgQZC0JbB3M5ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klLHfoKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHVCLHZA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC3606A325
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AC3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klLHfoKF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHVCLHZA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YuSm2349829
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=; b=klLHfoKF8BmaNqEz
	yEIeYII2y5MPCQorGsT245BdxARu/K4q28tYUSGO9xW0LFDNe4J3Kt3R2XfySJUw
	MJfAfNmAmDkGyhkGXTA1gdjxudP7ncfdDkrmUvFgJyMbGwozvYHRHtNNgUnANJik
	vL+m4p4RhT3TrPXQrrPuzBo62tZ/EqP2K9sp71ufT/KDreua3wsJqCBfSEyWBDJG
	G0TRzHwROdHc2ptR/MOD/h9RoHvpTyPCqtGHDgjEbCCqgnew0PRh0xcAGe9Aq0f/
	nV1wSm0oJjTPJIjQ611hNf1du+phzSMnaMIZkQE0QoYaEGTT81XdnR+X7BhyOYT2
	hbGTSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919hng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:34:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so14025241cf.2
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090086; x=1793694886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
        b=PHVCLHZAo3WY8VEP4+kU1I/7MHHDj+FYG/5IXiI+SKdNpCFrGtWMDc7XtJHwnDRlaR
         vV/6i6GyX7/4EjlNXvQT7ABaScxmyGCZvY6+V+ImKKrboUZYpWIrno+zVYeBQ56MfTTA
         JpOTXOtsDDl0/2r8ju1cFdCydhmouqz7H9FomMbawu9ABO3CnPCFo4mmnJWHUUurQogi
         VwDP/eYP13RFN5HDftTesXqq83EQQNTeF7LHGVXwLI6RX58PUCt2fsN/2Rm6ybxQDxTi
         RJNjL0SLLi3/2i+2KeON9mxo1QcxeZEBDykt5mEko5UmH6W7vRg6PkG7XfJx2So7O19o
         B8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090086; x=1793694886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
        b=2B5ewLMqh23j6SOJwZh4PwR7X1MpDlUuo52q7lcoQwZaI0sDtrU8nSGjr5EkES/8Ml
         LXCqY0kWr+SKtnN32QbDgL251wS1DmYinTl1Vo1VyaS/8+P3rSXk7oWE22zlKEIckdX/
         Dvmmn//ol8eWx9+BTy4ZyfFkKlzgJ/CwNDat33wQa86ahxShMQzVD6mtrQk35otTYz8P
         3xHItEpW98AaDaqVf4RCkb3aznWq/yN6E+H0MNnYLIdqQH+pZUeXA6qgUEHvoPYg/ABB
         PwSw8242r1vjpL18Ha5Ge8b5tWLtTwIa69Ys3KE6Rsvd7C0OZXV+w1mUnmpv3CWlUzNY
         8F3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQNGNhTKkON2JPgsUVxIrGcHqCuicUnTymaTa9+6PZzeHOSB110QpSU0/v+B+DnXSFej5AV4pWQNdJ@vger.kernel.org
X-Gm-Message-State: AFq9FYL2NTE34TlknpCZuTeFWsFGApGfHg/rtPnYP0vft10F1rziDINp
	fqPu5gpUeDpTlhj3T3yFPchT8ZJ4OIMg+BrrxnXrz+vbLlaM+pFLcYQ8cLb0t3VHTj3F91XN6X3
	7CH65cOV4htceFARubO9J6o+DhqhKGgNAgF0WOwcwHKu2AdKKeHvgmFXxNxmVYoqZ
X-Gm-Gg: AYBFou2PnC9sWPX3wHIsE97HeZ+zRVUzA54D6cGQc5Rc8BX6h7A9q/yQXbrCesHRGIb
	IQktRaVBw3fFimMHFT0JdMP2U8IFsa1qfktOQ06ITCXXZft4Edl5udYcQdQXQoZ1/C7464NPC/z
	CxEycAISw+WAjg0ca4EdpUfrhWPHpjXwFhUsJCPwPTjgbS4h1ZfYEL7el4lFbSxiS6avWy0rD0r
	Qo+6TV3ULB2ih508Vvlg6wk3/07H95FhQ7JXsLSoBE0qO9oBgi10br9NhN+BgUI90/63WR+Yf3t
	JeI3ucQhIo7mO5BIM7NzsPOQdwtRBmBYxqLZeJDX9K5IsFEXbSynyI9hRmmZoRn1/JeVIaQbmge
	O1dIn/fRW5BWPC5BUgHeQyQ==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1398844085a.3.1793090086135;
        Tue, 27 Oct 2026 01:34:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1398841885a.3.1793090085610;
        Tue, 27 Oct 2026 01:34:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79683csm408994066b.69.2026.10.27.01.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:34:44 -0700 (PDT)
Message-ID: <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:34:43 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-3-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JHkd6qKBug55Q_RLdmTTSkIhfocR_SB0
X-Proofpoint-GUID: JHkd6qKBug55Q_RLdmTTSkIhfocR_SB0
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae06227 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=pEmwrvZP9X6ihHc33VMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX7b8udvotIrEE
 HvYuXixWZPHPLPmOkFCVZ/q3AvQ8qaQIKt7Bx+ILH/ubs4t6IiTnGAtpGBAf80+Um6Tvt4RYTB7
 /CnTKlIIcDNa0UIQaO6nyJ9iJCqJfb72cPhzlt6eVL2kCXrcFtoBHB+ggHpQSyg4nN9kuzXA/Hi
 P9puSIKk4fzrLq1sl+36U4ckF0wyCfa2f6x+pCGuDLd4bAgTJmlhkPIMMfY7qSU+VZuNlttQkgo
 G/CaX8ub8I/n3bx6gLh4uKaW4K3x8B6ueIl3zjpQs8tl52ddOESoCIPcewvSxoTiY6693nJUn1w
 QQSycHAb5b0vW3/vRR6W8Ms2OkpXN2SNOX8icjwu+O9xeOWNhog99IYgU+h4xdBxlISpz6YyGRF
 4JeI42HXCU2sILZyDZPz7QKCHd/3YFhBGWmc2Hd1FMFH4CqMdOu4Mr9oosx2dTaYrT8TQ0VhAPH
 4xk2eATneGOyHeIlNhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX95b3RaoTg6il
 fP0hLo36F8sGjJcbrNBrfdSNZCCAYuuKFCHgfLafBirqjvyWGVrBph7HJdxmRhQY9BWru0mmehM
 ipMRTh1bizjG7yym1qrpv6sHL5nc9iA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270034

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has a video bridge chip LT9611UXC
> converting MIPI DSI to HDMI, which hasn't been added
> in the dts, so we have no HDMI signal.
> 
> Add the 1V2 supply node for the chip and the HDMI connector node.
> Enable the i2c port of the chip, the display controller and DSI port.
> Add the pinctrl of LT9611UXC's RST and IRQ pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

[...]

>  	vreg_s6c_0p88: smpc6-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_s6c_0p88";
> @@ -63,6 +75,17 @@ key-vol-up {
>  			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	hdmi-connector {

This one is still very out of order

[...]

> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l9a_1p2>;
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5a_0p88>;
> +};

+ the status properties

[...]

> +
> +	lt9611_pins: lt9611-default-state {
> +		irq-pins {
> +			pins = "gpio1";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +		};
> +	};

These are best sorted by pin idx
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Konrad
