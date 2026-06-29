Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DF83FA5D8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725597; cv=none; b=BANDTBJw0JoQK9SNGFJ6ZNi4DDQaRrsjhsS8zz0Rqo18ns4X/88Be8m0KapaU+D8yCbx7nFzkzM6w0mkn1oS0hIHRkbLI7+BBKCVjgMZOylo19VGSKw/82HawaI7suSv0bq+QQUb8UWY3fhxcKU9Jrqe+k+UpA8rQCFWS77Rs+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725597; c=relaxed/simple;
	bh=IlpjCZRCdbVo7YPpGA1N3P03RLxx45CqmKYQek3qI2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TC6cqIs8WvqmzfnkY+lc2B9HInRh8hHhqcSwGY0ttV+AP2EcM5eO6Kj8a83LJ42wwTv4/aiGpyfQERCLe9a+IgmFmJu9yhlSgIcXYoWdRNLBCu+BDi6J0O8GPG9kL2/EAOXCGwodGvDPWDgQ5dFx6T4oFSvWqSInMaaMljYEL1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYtP6Ywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cU+Ns3/l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYtP6Ywf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cU+Ns3/l"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r4hc2088844
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=; b=SYtP6YwfzpxMokjB
	+1TYOaUWRBGQoqltDuhXiJsa2qKmnd/RueKNdBNMcQ9KL8LtyWQIbD/KrGHH4TzY
	cKQVjK11ysFgz5FGwEze6LKun7RNJAiEIGfK3QEFhO6WEfw/UPZQlL/RVG9HBN8r
	TPnEhakvSg0edhj50HkWjI0KDP/gta5NJMY0NLCToIBMVLl7XG8eRjm90PYBoVgH
	RAczWZl5lCqouVQI92cgcTVf3ovClpTKsVmCrbjiD+PUWYtONtVOE7WQ8X/rOW83
	MZR7Vi3LG4XbgQQFhcRVSBN9Ej/sen+S446AZTHR6R2jBSHVeegAsaSBLOeTRUZo
	TDFoxw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vgywb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 09:33:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7386e55c63cso31774137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725591; x=1783330391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=;
        b=cU+Ns3/lxu48zs6tcDSp4zbc+7NvUGwabxxa6urJKvl3yi4mPs+rAW/fgnsCMwmA7Z
         fdEy/HvitfcqdjaV4NNiLEOV6pZjUvOLMJNX9cogMontN4PI5slhT0+kuUI0qwVqt8r0
         hrDxDCAxlu/crobt6EKPqkY58SqwxHUcahcedNL+M/cihlSi/vN+wJp+M+77XCkyg11L
         dxgvavb4vNMGk96lhfklc6HYt5mdfdAD7j/Qx6iA9a3jworOB6LIU4zHW5ZtKGha0oBH
         2dijWirJkuWJEf1S2jkf6CELTtrjkzyQpmckQUCLBcKf6R5fGi//Ky3+g5VbZEIwSc9f
         uZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725591; x=1783330391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW0/MDArdyFPkPH3268fce+2kIUgkUe7KVWoefwoJNQ=;
        b=OTHxDr9vOtt1jFqyxX7fkO8WjOTMxU3O7HxUe7pB9+AL/CynhfAC3MLDem7vdXS+jd
         86sqfvEjzdOAF7SywwKa/Ik13NseLjK6lD1LvnqFxaOx7RgFB+w5C3QO7uXMoR0nAwaD
         4YX8S/otKSnjNVDfOLvDwiYQfuTshV9shpilJWBt6q6LYG1HXd3m3aGOpXsQo78coafx
         gxSDPUR3K5FRw0tI3dxBPY7RqWr/FIHbjXRCk1ASwCAGmF8ZfPa48tQB7ubR6kDnGYxa
         VLX3TJULVS+SWcrZCZvYKmAgWO1GoARIotHfhz6rxRwxWRrTfwXCpnId2LY4eDGIRbQf
         0oaA==
X-Forwarded-Encrypted: i=1; AHgh+RoI/+pciVxsSFlTQXZA9Hkny1A8fWdTXtGZyL+fX4EJ07qwnJWMVunJM7k80Bso6JDZ3/We+cZ5xq8q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22aBqJjkXhGn436F6DQbknjTZRWbNUHotWQsARWSIq79u36ey
	D9HbjfLRj/LJ1hhDRy2DhrHQqfy9HI8TIdqnc9LsU6+V3+NrpMc7AYSv6Dk/rKCRU2CYd9WBUPl
	aQrPL/CPUL1JwGDb6fMTScLHBpBIjQQN14PvmtUFFIbuSX1rAv7tyhr/cS96DqnMN
X-Gm-Gg: AfdE7cl//WEl+Lf5CjLquurVF+I946+34Pe4/kG7OtqyPruYcC9RamsifLbHOYgkRJU
	9XivpaEKa1gZkDadaL7OXnbVybbJ4+ZuRfQ3neZXHw1/z/Jg95su5qYMnzURBLqcQxLwaLn0wfi
	GdzpcDh+MU2ETgQ7nHEpMlJEFsP3GND2yQU4CR0OtaxooymCeAWgaNnh+NadNLYtf4HG49bkVEq
	AE0vc+gzplqwyvz/uDxwDCotHTtMVb/DuMBlnXh/OelLwFEcVLLMJuCEBlmL3jA2BDSYQXZ6IVZ
	jpCSB4k/qa/rBqVuQ/2IpqNNY9C35Q00nosvhCF+l6unuFJrT2iIi5Qu/T7e6nP4cORx4WEJxP7
	/X66ZQKbHNEU0AXNgajtTGAHmgZfA0Nbsuao=
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr159432137.7.1782725591290;
        Mon, 29 Jun 2026 02:33:11 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr159426137.7.1782725590811;
        Mon, 29 Jun 2026 02:33:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ae59f1sm6605839a12.8.2026.06.29.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:33:09 -0700 (PDT)
Message-ID: <b652b6ef-9f37-4b1b-a590-864c78bb5c20@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:33:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, valentin.manea@mrs.ro
References: <20260628172640.23167-1-mail@etehtsea.me>
 <20260628172640.23167-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628172640.23167-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iUr3FFNMkntDo_gzbAEY5Uhlk8o_rZRE
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a423bd7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4Qiz8VOyNOBCKGrP_ZoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfX2ZqQA8JhY73q
 WYWRPaRrKuubhP2TSiquhKeXAtTWFZWjI8lN/XGz8zLY5mCcD2I9ZIdHBMphDlylPIa5wjcoRlp
 WcYWFTS1slPcybgDDy7D9OMHCVWz2pM=
X-Proofpoint-ORIG-GUID: iUr3FFNMkntDo_gzbAEY5Uhlk8o_rZRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NyBTYWx0ZWRfXy0PHQsE/kVkV
 jRlB4fXG6sEj3fGO2n+8TfwvsVUlYhJvupEKoP17mpCUu7D3Hb4VELKfRDMdp7MNqeEKdawhMVT
 fKyofb7Ndawk2lrqRjlI8sdiiO1PRqYGpZNCJahurjKcKfBqidmD5crpeJQcmAdzM9dCyFM99+I
 Sb/hsh2Z27H/wEuRXLBfp3UWMIIQzIHR2xhF20Xxm/y/8kUCTlJ3qgNGjf0A4HpjsLew3SzG0nK
 F6U8bEoAv22SCc0rRRYlrcgfPoPD2nIyooA1zBKLecH7wKAzjWFSL5wu8kGEfHpSZ5VopfzFdF0
 B4hzzdYuRbHM5bgFezywcSm00N/FRPO/zv6a/1mNHRFxxMIlgK5Ae7wUoq0XyJTeuxLP3IL4j5d
 vRoPPGStNRZO+anWbOg8d0S6dOmK8ue2db1Fz81NzCP93BwTn4U/nqmBsn2xdJT92xqwVFnulj+
 wg57Udw2O+K0LLK+Uew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290077

On 6/28/26 7:26 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";
> +
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcdxkmsuc8380.mbn";
> +	};
> +};

'gp'u < 'i2'c < 'ir'is

[...]

> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +  wcd_default: wcd-reset-n-active-state {

Seems like your editor played a trick on you here!

[...]

> +/* MP0 goes to the USB-A port (USB3) and FPC */
> +&usb_mp {
> +	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
> +	phy-names = "usb2-0", "usb3-0";

https://lore.kernel.org/linux-arm-msm/5b3559ba-7c69-4418-a0a4-c5fa614830c4@oss.qualcomm.com/

I would assume that UEFI powers up all the PHYs - then, Linux
(effectively) doesn't know they exist, so they keep hogging power.

You can copy-paste the supplies from another laptop, as they are
dedicated to that usecase anyway

Konrad
