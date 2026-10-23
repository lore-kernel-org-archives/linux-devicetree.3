Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764138;
	b=vdqRzi8WbbRKqBeM4/LoxWmxFGegkpgVmAWXZFmppkchgjo/ljxSguYu4pc9S9pe9xkS
	 6vVm4xDAJr9Q20225+P8QQYudrjn/zJq6E2iV7QtFzRp4SW+wn2lg9ejFSP6daUlB1I+B
	 OjuTSCQtr5NCOLq7FPSP3CfPF5Lw9mgKTc5AuM/BOlJDk6zRZJlQtenq3WZwrkW2c8h+C
	 tsi0xYipIHyEazLwRk4yv/lri1peiDB/NF9HYs5k/Ymhf3Bl1zcjmXD3sJlMYcNBAeOE5
	 1ynmDwhtwG+YT5PfDDm+2YW4PNJ0O7ZuSqSnZlC9CilKK8f0RfVyQeIqqv591J6cFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
	b=fI9OQMMcmnZ4fDk2n1eR0GfHCF/Iy/BnhQSCXWbPQw4bIWW//uCF9g7aPKwu7Y64qjos
	 MLJPb5VKY/AJC6gIRgBvLMVj8tULE4/a+D3e51OU8MFICCWTqBaXN5alymY8SdOqnosVv
	 tmYvCtu/wKBliBiodvlNXYGZ6YxxoCNJMs8Xr21amjPPYVWUf1J/E4jHl8XgKP6l7GldA
	 te5GRsfXo17ds8OlkLz6ZaAXVzaLdp6PPaCeYl60Sbtudie6n04rdNBFzG8JnZcoqNhL3
	 I/5Kfm5FKVWHWtVfbSYnbTGcq2yJ4bqAM5+ASBrP+WzDV5RtQjUZ/E3R66icjsqYSsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5B606A32C
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A5B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg6h2ZMC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST6mbG7i
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZfv2509114
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=; b=Dg6h2ZMCLLsc/yP1
	I6qTTMVxn0gHmzaeTvaOGgud5bFVkeJocoTVCav4vqqdigQvcPIuygrlLDH2EIxe
	F+TGw6CKOac8cyTs6zr1XNCYrnoA+aNBnWo5jbsqL2U4MJIguL8QtS4PdAyxXJL3
	tzi/lByzoafs5QJ2whEB/A1L9sd1k+sxRfoQ46vJhdhtOcmQZqEOIjV51vgvE0ej
	EgJYrK8vcdyW/OaHkwSfAIfACEegabPswmbrzPsbvCXm1wt/e9CZkODgh2aTStbs
	z2pJclQcrIb2EWusOmtMfJgP+oYsJGA7HFyXYlCJkpMma8IznROzhB44kzgRqP50
	N9XDVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbdhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:02:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso159967eec.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792764137; x=1793368937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=ST6mbG7i4M3s7DOpZVaASZUvYLEdViCqEw5SoAQmM6Yn9ENixSn1N9RlYYLBT+sM1n
         OUSc5Q8QBzIgQoHSuewVwox8nf08A9br3eu4ZocwivDB5VCSP0ijudwtzvvFiLI+07Lg
         +ZPPIhJ96tNUjeDDnQqhYSQ+rImFHtPpbkb8MEZALdms3woxZV/pRNNr77ZLzP6cN3OF
         rtVeGKA087k3cXi012uhq35c1oGh36Dfp+5yMbxPMUw9l9zgOkMu1DXKeOKQzX2UN8tm
         PMFJ++tG6CRibbs6QVtw8xPy1qch0crXaOsxxmi26mgf7Kfrvs6dkl27AGAtzTaBrKoo
         Dc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764137; x=1793368937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXyWGToeJHvKTRRZq3XwmlkSnt8Y/hGNiIq9DpWzezc=;
        b=1b7JrL3G0iJGhzwnM6WL2tQJl5sItTR4Y7fVbZUBeMOjTJ9YK01u4WUEPMn+bVlEsR
         0S3y11ReeHeI44IcCSvQ8deQpGp/53bWt37FR25uamGJf8eTU10Vmk0gfF5Ew1ceEye7
         2t52yKBOEQwQd/IU2LKwW04ODyFHRA8EIMTMmyi/1Mnf5XVVoJCdrHmhMauS1pKP87gz
         SeGzyrzNQGEomwPGCrIbVtJlhfpyZYcMGigvOb+Ub0+a3pBeqkGKg1A1Ybvij3GdSPH5
         gRUZhfrLJXuHzCzXPnBlilERq28gdgRsywwlq0SDDsh2Eao7QgxoFkHz70jDTJohGjr6
         Mdhg==
X-Forwarded-Encrypted: i=1; AKwUvByA3J/rvxgBoGYqveDjlv4J9OlNw2b1q8qvunt3yiOP9ErXATD3YvPOegkU2ei6Jl9jeQMzAH9HDsde@vger.kernel.org
X-Gm-Message-State: AFq9FYL344RM9qdbGSbZ7/FvOowgyDho1emBNoFF7uWiVGICSqz2AjOX
	M7Lyrg90SiO1PUGGXgmAML0O5mXZfuq8rjWDWxeJlMhqu89nEXw3alHZ/ahrhZelu+U9jM/w+64
	oLQP9v7E/PouxR6ctKGV1udNWX3z/YDzHyl34rUPBLpAGcQDf1cwNvfZsOiQLU/yg
X-Gm-Gg: AYBFou0gsWMMemz5GVXUBcYseaf9PzVfbWF+ZW1ynQ4ekMnAODhSuiyJkMGQhPZTSMm
	EchVubBuO6ixOuK8MKq/91J7uuBdrVqUOmCd0Lu6TkhrNn/rXvrZqE7lpxMLu6F3IeXDE7Dbfp0
	wAWb2nlIburl6ey72empQzLf0EL26XkrxohHsQrZZTrjyvAALhy5PvPlrU+j+11cMJqLQ1ImN6y
	6K40YqptgZsQZ67xt4xVjHfaSUQ1qlMIxq9WHmS8qRfOMBzM1G4IYMNMSWsYvzUHZAqMVGVG28U
	yH0QKxAJB8L9DFQpY0mDGxQziQLW17VGvtue9uftM0mvYQm+PgvAxSzIZEaEZrpx7HrilDxMjgJ
	yJZ8JWOofmHhCxjKY3snzcQ==
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567436eec.1.1792764136786;
        Fri, 23 Oct 2026 07:02:16 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c7:20b0:369:d85a:d416 with SMTP id 5a478bee46e88-369d975dedcmr5567356eec.1.1792764135935;
        Fri, 23 Oct 2026 07:02:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8d3a041sm3976866b.68.2026.10.23.07.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:02:14 -0700 (PDT)
Message-ID: <d237678c-9279-4bd2-9d72-b98830db5d79@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:02:12 +0200
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
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1792761470.git.me@andrei-z.com>
 <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d1bd2f947ad986ff3c3fca1ad367aec2f1cec6b1.1792761470.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX1jJDUgNy9SMZ
 DzvwSZdQ7M1i2Bat/qbBebmW3Xoztqxb3aYvxLwvqI2N475hiMDZLsO3ErgJjCLR4EYZcpoAqGm
 P8zg/BXxcP7AMoxXUhh5I1j4w0lQ+Bpr4E5EazQKxqD8A7cnSK6ZfoDHt0fEtIIbbaoEUSHocGD
 j14iQ+P9o/clkT0o0KfcStjfxyEhZfPA+NlL7baurnUDhO8wzI7pS04udjy4pPA3OTPtBWPdHew
 QmrCSDbNYGhZAn/nFEBBnAa3Sv/B6oRU4wmEhRNYVdThQSkL0/c4Y+4g018oChdk9XnYvo4a/Zk
 nuDZ6XMQphfYYefYtoPDksX8LjSOnOLRWanWd0DefKU1efg2hCGDVdZZCTcDIcsFUAd7JK7ZSmA
 G4RQcMOgxPCtdhedk1wDhoJEfLQEBCJxR7QSqZnvxw4Wfr1E7L0smKTOSDrtpj9K83Jc00ffyMZ
 EiMhj3g7iTjsJ6rEIBA==
X-Proofpoint-ORIG-GUID: BAuqNVjJlDJI3y5IWe18M0gWK6MeZ8AM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX6ylT6L/QslHY
 4enL8b4xC+T4VcPm1le8cxB9lMJpweGuA2s23iby58SAdDikUGsZ8Y1kWpfuvFgLhaaA1HYdEDq
 M4lcKHvAeh4280HP2kJpuNxhlVv6bSk=
X-Proofpoint-GUID: BAuqNVjJlDJI3y5IWe18M0gWK6MeZ8AM
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb68e9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=J72pobsmAAAA:8 a=EUspDBNiAAAA:8 a=5oLZaV2ftHNI1lavKEwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=CEj32ImPKXYnrW9rpEIO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On 10/23/26 3:37 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:
> 
> - SoC: Qualcomm IPQ5018
> - RAM: 1 GiB
> - Flash: SPI NOR (boot chain) and eMMC
> - 5 GHz: QCN9074 on PCIe0
> - 6 GHz: QCN9074 on PCIe1
> - Ethernet: one 2.5GbE PoE port, a QCA8081 PHY behind GMAC1
> - Accelerometer: ST LIS2DH12
> - Button: reset
> 
> Describe what mainline supports today. The Ethernet port and the
> IPQ5018's own 2.4 GHz radio are left out until the GMAC and the WCSS
> remoteproc have bindings; the LED controller and the board MCU on the
> I2C bus have none. The QCN9074s carry the calibration variants their
> board data is looked up by. The SoC dtsi gains the pcie1_port0 label, as
> pcie0 has, for the 6 GHz radio below that root port. The vendor QSEE
> reserves 4 MiB, twice the SoC default.
> 
> Assisted-by: LLM
> Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
