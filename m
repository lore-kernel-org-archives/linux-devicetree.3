Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3318248B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269001; cv=none; b=EqhnXtDXwCN3Nofjy7BBoNb06TRPYnp6pLHLXcHiHHiVzVQOBCxdDKprn4IuVizdpXV/TqwqLm3HpoWznxZigWSFTLY8iEgK9CjpkKSg2WK5HQZtvJP+ZP3YGCDtFTryn9+NFx0yDUNM8X9m824Q7m7cytCVBBeVC8Ol1DPcJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269001; c=relaxed/simple;
	bh=BIvWPicuV2iWJ14S2btq9YUnV7/9UjuIG7+E2qxadXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKWy06Mb1Zbg1J8c5GIZvrB9G5/rES7j/0yQYD9gKOtwAkvEhltVnGxUy49RLWkKOS6hI65q3Ao39m/JysA096gUK7aGDKGkYeHkhQDe6l9AtBH3h3k0MCutmuU8eIzjEuaWoNTKJzPrMjrQ5K48roC59hUldVc2KKWe/G86atk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqlaU/y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkTI2Q5C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqlaU/y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkTI2Q5C"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCil3406525
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=; b=pqlaU/y5IhnmH8OL
	SpzuEtRad3J3e8wEZJvHvoKfOyYf5fT9FKXiKlNJErmwM6zJYI3e2zrRPPOxUN4x
	BnaWC7SrTB+DEe6xHZ7xm84fa298hw8djONfpPZabpCb2zCYM5XBfsozwZPPVvdw
	9BdbXSn+nuiYul4lm9kE7jVNQg6dnOYTJ7XwBz2MuAbVOq/nUozlS564F/88UGD9
	+Wb3AaklOHIQCdYHAlXmg0sWqHVMG2OCVxejJbrNpIItaq9dMSjL1gR8T0nQH0S1
	NLvdqvJperP0DrwAhIYYzj1MqNiowIU+3N3ZrUakoVLMg/epeAhxwxeZ3xooRHrv
	WUVQXg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu1qup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:23:19 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so121239e0c.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268999; x=1788873799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=PkTI2Q5CJmEr01wfc/aK5Qt3f/8/mATlMJqawjGqc/3oYPLDNaflARpHzN8p0aAE4A
         d6YyNev1yBuvs+gwEA1ipzNlR1xRajjpdZsa0s6Ffr4JKUWgwjKZBUjp/4oCjh69IPoK
         oc7Mc921K4t/i/R6SP7KJMdKtSlEPwPZynovQMCi/Itm9iUNwlH8lAnYEMZPCKa6GrVY
         USZC2tcTiHueZQPdIKoNMV/Lf4sPaYlr2aMzKzLTKXZ50Clo2FTj3DJwsUqv0MEcO3+W
         VX3qYwDRovqOli0B0Ryne4a+2TrGpq2uDL10BYGREFqG5yf0uYtnT+dexZmbIu/UDI1c
         jWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268999; x=1788873799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LY/qFfNeXTWEjEd16ELP0dtmcJY52hrpFdmEjsFcgBM=;
        b=VTtdB+csKKq9FP4G6tRTITlfWOxJ/ttMZkYycJjN8rfdJHLQNtxIIzMRZHYHtErXWP
         zABL0KazQ5ENZYaCAAQj0RubZtAxqU4e9MrjYqRaMN+5DzpGPlx2VqWXfcaZzNg7ZSy+
         fz95I0EuzHGgTshwfByim0u54QJDFP5CDPm+I8WZcEDcaSkNgAC9OKvgBRAUoKWjGn2d
         bI+m6yRP0O6b4eTVZCOGd/FFxxAu8Rhe6qqgw9NKvt5G5LtchoQogG5Frpb8NmL4OKxc
         wsgcIrm0VpB+6+7kA8UkOBNsrZ7KY5DUdAt4NC5zysn0m8+VaT/UM8QaqYLUIFlVu4kD
         mm8g==
X-Forwarded-Encrypted: i=1; AHgh+RrHHZOTguHszYczCN6+d9as1xU/VBZvbbjvkeSKi/p0OlQOAK/v2THObY7MtpwHScvvdH5BiB7WtrSi@vger.kernel.org
X-Gm-Message-State: AFuF++nVg2cQa6U+i32d7FhnPqc8MIwjz6zEOcOpn+UiorwHYCytHGyv
	4nKtZ6AVTJDst4vRDRd2eGOL3np1Wtjtl1EMYBHDZUDUBdgMXu7He6NCneZuGlnw3h6Lrm4VJD+
	pa8XEhiQu3jGkXf9oFYoNXs+BSkwGSxKmcODBDYsmfevRoePQCwhhWhP62ydFk/Xa
X-Gm-Gg: AR+sD13qEgMVxjsCd/0JRqW4fSkzHjpFkmhOHuFOKZtus/JTVgfX/CTrp1mzJ3mik2a
	yib/KcjoWTgE3QYKJP7W49bHF2yhrAsTWWyCDvhiQkeW6+x4AKkfYTS7/+UQU/BHNkNJ5ccTxxv
	G6JvcjErhQYI3v5Qos45gdWpY+nhkGaYJYas08Iwj8rrC+5/cohOTknG8zamtidmRtaxvhnceTn
	0de3bS3HP0uQ/kiXrLnGoJ3iwAHGcSDLWf4rdTu450B9DeoxsU9M09o4Ta9Q4GoTiTKjxtN7oAa
	37X2+f6QHfPccHgsJqteMGsGwRYhWuStqHvS+4meGH9x9P/gp4+E+kGVE9NHqArnDoEKXujLuZY
	fvNHLwGPP/ax/UU9AJ/CvMQ==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830127137.1.1788268998807;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830117137.1.1788268998314;
        Tue, 01 Sep 2026 06:23:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5b34sm2867117e87.3.2026.09.01.06.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:17 -0700 (PDT)
Message-ID: <f328d93e-2df6-4c94-b7c9-cc0ad6158f46@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX49/+3s/iJceN
 mWZYN/UJvwq2amy0nzK/Xlmr3aAuNUEnrsTlFpoL6UKjJI3zt0k69m6yHxaoYbjBrlbCNEXKxsH
 2OG/WV6Ebbt77q0UzbmDKZ0yZlu8zF+4GDJu65Ntxsj0J87eqweyZNuO7D2YyeucdzaVRWuXWAi
 0w2wUNM/MuDgsvBxuO9PKgw8BTY6qZrPvSQD/wlUye2V3MUM4S1578yM0opyVBCRQwkqopsDmro
 dg8vTZiwNhU3EZDPctwuQ8PUTpJtegb0DkMtLOvNzMB6YV8raph2hQZ4+SMtozLSjmRpT5pRGWs
 EOpJDI//ITDjyoFe3EuUj5EXLuhuWRNDLe/BGksBjBK1DjAyt+Uvx7VCRsQK13eEy9He7Hj+5rd
 W/DdmeSIRjleRgAo4paVVYeOcpcq8bp6HqmjYgnLAC7v9lnZYrZx28682gr+aDDej0a1KUYjA29
 c77zK4GRS+F+gzOj3sQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96d1c7 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=B9jzo3DVsI2-tMNqGVoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX+uWR82lzshzB
 d+uKo/65reDvPsuLCaYlLlq/CE6S2vTzH1Q9JQBsFlNoj9osPTJt5rGMwcUgblISgLlQYcOrPkR
 dxWo1+CwQOK5Ehks8cjzq0Lm5Pk4khM=
X-Proofpoint-ORIG-GUID: dZzv5gQGCeN0Wd5uiyYvA9u77iH2a6VN
X-Proofpoint-GUID: dZzv5gQGCeN0Wd5uiyYvA9u77iH2a6VN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.
> 
> The PHY outputs a 250MHz PIPE clock routed to and gated by the GCC, so
> register a fixed rate clock. In addition, add the register/value pairs
> for the PHY initialization sequence.
> 
> The PHY requires a 5V supply, so acquire the regulator from the
> devicetree and enable it on power on and disable it on power off.
> 
> The code to acquire clocks and resets is the same as for PCIe so no
> changes are needed.
> 
> Power on/off sequences for PCIE and USB3 are similar except for the
> delay timings and USB3 requirement for the PHY supply.
> 
> Lastly, the PCIe and USB3 pads are muxed so select USB3 mode in TCSR
> which needs to occur before the DWC3 USB3 controller resets.
> Otherwise, the SS link doesn't train and remains stuck in RX.Detect.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Let's register both PHYs (#phy-cells = <1>), but only make one
accessible. Otherwise, we'd need to alter the compatible to access the
PCIe part.

Konrad
