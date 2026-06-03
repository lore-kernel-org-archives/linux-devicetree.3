Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2899537C900
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495464; cv=none; b=Yvihb+2nvpkGnAK2qNjZoodV3VfDnsBt9J3465lcRu3kwWdK/zjEsybXeLjsFs6JarNaa7ZVf2A3xbw6YFBsTuSBwswVucbZC89orjkT8s7LtHusFLTc7DOC9M+nEi0WH6cB3nzTJEdE8t16T74yOudnhxx0yAClPDXunWEcuzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495464; c=relaxed/simple;
	bh=xYkbXhu7MDhbg/KOcFclCa+1Zm4Y9NpS4pWis5ZBpkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u22n5jYMDs1lC/qw+aPFh8f/FROpIV6GPKNOwgzwuioX10yoJRdqybQV5P0+7d94UknmN04oQqQ3dD7UXB1jbJV78SZMiNA8YBmP7FVrsaT1uRUEsoIvX6QBdEr2Fsh4y2MdUKLWnzvNvNP8Oeml5DZAtwikx8MzQJAKco3gWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFGZv6Pw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQ04PDYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFGZv6Pw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQ04PDYc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653ChKst1946609
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=; b=KFGZv6PwieYvHGIJ
	U2qQ3s3X4/PejNKI/Xd5OxgGLEAHRrKdqc+bbVd2VcG1hA4Ucvi9nxXEp4xBDxLv
	VJ/y1L34uzYZllelJEuxGiF2WkYEjQ5elrjfo+ygImnct/qwxPA8/3FJbEeFafIX
	dYhDiY8VhhqcDWqMzBTv8L8Oue+LhmY+UVVuXMEBtopVLbFTaVkBjuOgJiIwVi9O
	5dfNLcO6W5EzSeAGLFT15uOvkWZEBgt2Li4/DLPXxgjLDecItNs3K5J36UkW5dfx
	zBjzwnVCyuP74+nsx9xz2UdEGf+MCwF6q+9U8fJosedgn+G6N0Y9ZauML5cA62yj
	Z3Foig==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgjsw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 14:04:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4853eb6fc29so2107883b6e.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495459; x=1781100259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=;
        b=IQ04PDYc5NneEttXLZcQ831lruqg1X1PRaJ7ycpOsDONUBt5A5EyV9Ndyupy6iGl5z
         gxeDQ2e5TNznKtEOCeXqf8SCSLxkr2qLep6qF+upaNQcBKyMvc5nTAFGGLJQGgnHtt6P
         JJyEqZfI5r9u3TJrUZWfXo57cTKKz5M8VCbUcMbMGfvRWs8heHW0shXkofRqDsvbI/GY
         8xr0d4vDXtsIeY4IgOI7Vi9eMPIuJ8qp/5ru0V/lBctYVGQljb2P1kkMgb7TDFy2nwIe
         JS+8uHGWH1JlLPrP3CTlZgBEBzvHkI4BJWIH6IIzpOkcE0GZIKIh6Wd1kIkcpvr6iapR
         j7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495459; x=1781100259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOMKa2J8SL3wZtOufHuOjFi4CgBpP5AYCYvYXdxBH2Y=;
        b=BKBbzLxsdhxpCXNBsox0CQETbxzsyYvTEU0hbbtsMsfPBwPaYHk5HCWpjaWdReJrOX
         SU1no5wIEZL9vUHo3af2hBfny5f7icpfR3WoHQHIqteIbGeajHzE8p6S5StqNICzH4hC
         CCCi+9FHNLH8w5lCLSdBeh0WL4QMglORqIwZpoC+0RhjIBKJNdOGFz1CeQBrnlFm/t8V
         seUv14DXceEwKWJJG6umGryh4D4wHG+/ku0rE5xreEH6KwotDSWGtw3hDpeVSlM1FHY0
         0u2cMaWUz/4qZ73sjYmyQuO9+UfT09CBqTqhexP87eVciEAKNe1Fd5ofDOTjjMkU20jF
         +MPA==
X-Forwarded-Encrypted: i=1; AFNElJ9JJW2f6eOY4BX144W/qBCJRDs7PIwBCpMKfjwQPvSYbVOjn86KVIYZ7dMwIrumb5cyuZHJIP32Uvmv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKw4PaT371CN3BT95odDeFxLOTVmUcTk+EzdqeOkPONcuIkdM
	Twpbs9r0khd4O/b8H5Mt/8TnvQUpR2s9kIA5P4tmYI0YQLkbsyb7fxaPhHOnEAOcQj0gcfHaDlt
	o41G9kcddqPOdw6gTIfeR/TID0U97znU5zevIPZ7dUWjMtQ3vGRZbOCWdQmv6Oi9Y
X-Gm-Gg: Acq92OGHYC+QBWssl8Op2Vz/VprzgalPoZpvFIrbYXcAiNeWjyLS005DTRGt7fvfylD
	yT+hmq4XNRvM0xadRYRohpZRvhhEXxiDVl65ItUrB0++kGQwQbkMS5G+glooZt2+GMZme6WNLzr
	p6Vli7i8r6uk3B4/kSfOQLYFMtzz59q2r1D9usOyCJ/2KYoZR+wtBRs8KeXOa8AXmxKirzhlRuj
	69FoFcOLUejLGrAXcURDJ67g2N3Ljxq4n7gVM9MTZSWD6UTecQNzIu2LMydPcj4AKvumtwWTIwh
	BNHFH/jHjZehMi2ibSNZEEu3Ii7fAY1FtWiE3/h3el9z0x1uCHwqsx2oFIZ3H3NZ0E67rXMkBsT
	zlJxM3V0JNj5Of3ZrbuWZFgkKR2mqHOQh/UmiiUXIkgxcjgE+rcCG8MVttWFgJXn9/qCtr+RCy0
	mUSxRNGwea6IU=
X-Received: by 2002:a05:6808:2219:b0:486:4ae9:f9b6 with SMTP id 5614622812f47-486574df950mr1368421b6e.6.1780495459012;
        Wed, 03 Jun 2026 07:04:19 -0700 (PDT)
X-Received: by 2002:a05:6808:2219:b0:486:4ae9:f9b6 with SMTP id 5614622812f47-486574df950mr1368391b6e.6.1780495458579;
        Wed, 03 Jun 2026 07:04:18 -0700 (PDT)
Received: from [10.100.11.76] (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm1200920a12.21.2026.06.03.07.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 07:04:17 -0700 (PDT)
Message-ID: <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 16:03:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a203464 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e5wiE9tdTxe0cX7xfckA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: Q92JgQIf7uzEFLhI7twX-OLC9PEkNrJx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNSBTYWx0ZWRfX6u7cpComHiv6
 3N6JmqsnlhtbVS+XR0GIM4rhjyZ+LRkc7xGMEOcV5NJG2jsPqyBad91ks06QCMapX1Ix7vXXpiX
 c+mTb1KVSxe5dT+Dqd+0rZVjAeFDJbsyx07BH91LCL2EgIx7ABFJ/ul3wJ9JiDrCi0XA0ro7dfp
 yggwXK7IYF3c6m63ljBkf0ZgXcqN4Y3Q1My0mtM/WFBYtqZdxs1xNZ+fbtK4n1w2HG+gN/clg6L
 /CjB1Mb+uTefHQcqrAgWJ35Et4pPOcLdGYCehoBbGAHVypuNy53aVKkJw9GG0GtIip0n2/O0vtu
 axwY8qN1CtSNXbe4rWC1+ktIQjrJ7pexRqyk/CvuZX/0T55w7pK1D4YOSXmpPK7JE17AnkMYb9O
 PZqbLkDlykrtSePY7cJgb6Q1J255HCkeyDbPMqpp1A4KqdxIwfBHPHLQzdCW8tPsKt9IXmzQeE7
 B6o3TT77p16npSdTAWQ==
X-Proofpoint-ORIG-GUID: Q92JgQIf7uzEFLhI7twX-OLC9PEkNrJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030135



On 31-May-26 09:14, Qian Zhang wrote:
> Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> required:
> 
> - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
>   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
>   LDO regulators consumed by the wifi@0 node.
> 
> - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
>   management.
> 
> - wifi@0: describes the WCN6855 endpoint on the PCI tree.
> 
> Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> ---

[...]

> +	rfkill-wlan {
> +		compatible = "rfkill-gpio";
> +		label = "wlan";
> +		radio-type = "wlan";
> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlrfkill_default_state>;

property-n
property-names

in this order, please, everywhere

[...]

> +		vddio-supply    = <&vdc_3v3>;

Just one space before the equal sign and one space after

[...]

> +		pci@1,0 {

pcie@

[...]

> +	wlan_en_state: wlan-en-state {
> +		pins = "gpio56";
> +		function = "gpio";
> +		output-low;

The driver that you pass a reference to GPIO56 already controls
the output state, drop output-low

Konrad
