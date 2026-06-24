Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA593074B1
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303017; cv=none; b=rgf0g01mY5JRlIfAu2lfrs9gQ1S9arbKX+gb1jXukFTb467/Bf3cYP0O7LiE+Mb3SgbJiqfloHB6DCxbaEl/AH/H3jFWZCasbFm1iWMTsuX325XBgGNjOa54SiSHYYf0h6NOKif4gI22WJHs7Hp5e/k5PE0eANvraehvMmiGzY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303017; c=relaxed/simple;
	bh=2HZp2JT9DhRDsJHSxYxJaK9WQOpNgY3tItvlO3AM2L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FV3bRIAix/+ykcfEhxNE4SHqX4/MjOLijxHNeU1iwv2C3QMrc3Dux1hUMvQtD0mF9gRy9GeJmvxqJyLEy4sgqSQuqEaX04ndGd6csDQzFpF4HZkIPorzdq9YUAC4II5jvUFLR/Pri+3vkNfYw/v/L+1B8rO0beNtEVBHgeHV/B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LRzC8JcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fP+0hIxl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LRzC8JcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fP+0hIxl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANjdp2585878
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=; b=LRzC8JcG1/q1Rtda
	FFrgDWx/lkeAfrDPvm85ZYBQH/rKin1tAvlb45wtqlLVbDFHhQm/CblfdKSDpME3
	nQxAeIUIzVN8ZWPpYBNSV2NOrqFz9sJCTDFfE1Ot2JMLPUEgkK2h/ZHrEyO3q8pT
	HqzqQGIFG6sIhy4KrqXYAsqr58tu64rO1WzVjxSB+advWQ7c0khm6detfr5UDqAv
	MRNkXkGlJk/YBmq/nPlRJU+Y5kH30w5x5FMi4Fi3at7611KRo50hSPGhHgNbYd1n
	46sKFt6VoLL7fROw109cDikRL/6HOHjCaG3Vo3ps64hfjT24fiopQj6bhaUKbXXp
	miHiBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqa3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:10:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9229581de9eso21610385a.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782303014; x=1782907814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=;
        b=fP+0hIxlSj4SsHHJEqTgkSpwHJy8195VBkK5MbJTGv1T29p/8qsaE0A0UaWS/uSfUB
         K54xgxxPgsrBz/G0KxYdidIplmpmWTGq3+CBbxoKYPtSOsRs7ZR0yaP1OI4W5CP+aGAp
         8lXcOr3Y4peMqOITdEbeWaXK8ARiylBbRa0HLKLue3m+JMhVD/Dh9fgTEaS8umsLieXv
         8FOXjhpXqLs7a3yVMXnDDSWCFxjPd6XwKGrlqjpQzguFpsNAo4QWeVBVmrF+B0pDhrsK
         cE/NO/fhnuodq0UR4NcL4BAu3ZuCQmsWg+gy1q/3p+k4dXn+Mu3z5adLB2GI6gpBFSgB
         INPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303014; x=1782907814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svb2pofDTe/NUHQV6a8z7yIDtgbyrcfcpozTS755gfU=;
        b=Tw8rjW5mY4VEu56BNcsY9OiahUpNenNkWxRJYY0b+lb+GkhDIM1eU3+05tr9/nkwy8
         F+fso1uD5qREQZw+AYw0cNFcMjL/vYK7D4ffTTrfaEchmYFigxEQ+GBONt2w7eJGh8Mg
         xOOEP5+z5XkeW2Zvuo5NGsTgeTCp2Yzsiw3dVAwu2j/ilo9pw7xVY1F3ncvHzzpAyCTn
         CmGb367mKhEJ9GZylqb8lurXMHJJAJm9xlrQw7YS3uWpXMAaVPxB/nwKMLetQPtDJpof
         LEgqzz/JtjDesN7hnYrDCfftaO6XYJc6WavtcLOqviSBe8ptaut/+1UbCS7oTHAq0Vfe
         57yA==
X-Forwarded-Encrypted: i=1; AFNElJ9s5NFs5kxvLVrz76lABYlnr/36eKgc981D336uSzXbRAzMd60bVpPF6MICzdIMRBJoJmVUXeF53tZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxMu/ygb83I6zbVb265PYFo0C2K20/A4WCTJ2UfKQE0tFPTsfFd
	3PO0z+0ALTAjw1LNWgnc0l5gCW88kHCcWiuZG+glxSNWsTnor5IXARhGSI5vecJuWVmPLMqut7s
	8hvqvi3M5Axun0oWMzeDqP+4dM/sZYQFC1DGZA8Mk+HaypZ8Vf9PkKviTDZusbfT5
X-Gm-Gg: AfdE7ckA/x0Bh4mL2nF6xqa5qWOlH83LoYkl5wNgySOdxELhVcOcubTKzr3KE+4Y9rK
	WyYkb1uS0bzg/xUKFM9wrlXeSbRFlgCuPUdpIxtOYXI6kHrhpTGYFkVtdUDgIx31cXvPiI5MfRM
	f0QtE4ajlipm9JhdaTd/34qVARh9wD/bfNbmqSeA0/zHPVC+0eoZ3u3ipoc7K4PJEOAedhyBHmS
	uKRLQ6uSqvb7GuxybNawhX9VOFNSEe9mZ0iAbQE/M87A2Val0+6phjfblXMTQ72v1MkKhdY3ZAB
	UyyOSOl1Fx8bU58vnLlTSEvwSmyy07/smjNHpdDg4Tk0xM5D1jYA+8g67y6FwQ05tmp2rge2VCr
	Svrk5R8jhMmkMP9xMwVx27bMZlhVdSiHMzt4=
X-Received: by 2002:a05:622a:1813:b0:517:71b8:ee37 with SMTP id d75a77b69052e-51a4f371215mr90458481cf.0.1782303013827;
        Wed, 24 Jun 2026 05:10:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:517:71b8:ee37 with SMTP id d75a77b69052e-51a4f371215mr90457751cf.0.1782303013008;
        Wed, 24 Jun 2026 05:10:13 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5275sm639417266b.45.2026.06.24.05.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:10:12 -0700 (PDT)
Message-ID: <2aed327e-abf6-401a-a05b-ba3f4a5cd7f3@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:10:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14
 device tree
To: Konstantin Shabanov <mail@etehtsea.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260620175210.19563-1-mail@etehtsea.me>
 <20260620175210.19563-4-mail@etehtsea.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620175210.19563-4-mail@etehtsea.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX042BSFA4abTC
 C4aP7OQn4v3cthW4rp6H5pFIkMhgaz/WWZApPDzpgasuUgFeLeeit4DERiOYMwHZPf1xZSVnb2j
 UXugNtktHa63vLT8GBl1+dwRUTMGNnA=
X-Proofpoint-GUID: 0BRmYVzx8-sOqui1acFD0vXRG2TYUqgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX16T2Axrl4JyS
 cunrrli50BuH9RXJ+30NKOD+W6T6gQ3YsDMl/2LVJmQRma/tzCcTQ1FAx9hVIa6J0x3nRmwka3t
 gyjvZFoI5bZsxk3Dme8i7VoANZEYexNB79q/MnkORtQ1YpX76LepsXeXVWhzGuAJSEwnfNLyXjT
 2s+RwaFs+KfEwogFskVJllamf7Rr8V4R2nrRhBkwG5TWyNJH6+nCqBdjUqsMMQnQIdg4JaUiQrd
 WESPnltYyPitsPxIvfVO55MpBPfrlNJiTU2Zn80/29FDu68sk1lMGWJybAk/jQwBOhMHqSGTWrO
 iLiBDprFN0J8j9dVJCEYzWzyaF8nlRuALcJeS1JNXXBR6czsBvpjZvBazlNhxmoMqOrdgxSBjfl
 nqObtEYqG4OkhYtduZpvU96c959cAQ==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3bc926 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4Qiz8VOyNOBCKGrP_ZoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0BRmYVzx8-sOqui1acFD0vXRG2TYUqgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240099

On 6/20/26 7:51 PM, Konstantin Shabanov wrote:
> Introduce support for the HONOR MagicBook Art 14 laptop.
> This version is based on the initial work by Kirill A. Korinsky [1]
> and Valentin Manea [2].

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/HONOR/MRO-XXX/qcvss8380.mbn";

Is that a model name, or a placeholder?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +			       <44 4>; /* SPI (TPM) */
> +
> +	hall_int_n_default: hall-int-n-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		bias-disable;
> +	};

nit: pins would be best sorted by their pin index

[...]

> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			output-high;

not a nit: drop output-foo properties from TLMM pins, the
driver that consumes them should take care of setting their state

[...]

> +/* MP0 goes to the USB-A port(USB3) and FPC */

ultra nit: add a space before '(', please

Konrad
