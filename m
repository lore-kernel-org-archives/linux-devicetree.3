Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26B48EC67
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814486; cv=none; b=JQY4GeVxtn6NSkVMrHGlRH1biTgiDIRyU/S7PsU1VV2p/LwJ7x197Jjx2RoKp1u/TiiNCtLLhYJPiOg7fsl8gsu1lRDe2pZELYoIsDey0oKdALnuPuS4EizunG1wLA5GscrlPF5M0XCJiaRHzvoHTMS6UCUb2i7enfxvUpB7DS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814486; c=relaxed/simple;
	bh=c+V2rvnHGka/QwjolRZdd7ZWn8ElPcoAgnHHSSkfYo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmuoPXRE3Dt6Xz9yYzvV4lJfrCgVep8P7K6ChgbHNS4ZTU0c92UqeXm5zJT+W+8ohWRJ5aXt/J+AZP915YFqKn4q2+nr2HjAMDXPi/U1VqOvHmn7i7r/oZCq3+rXat79rD0U2bYf7Y7M4yAYAeBmuYsBBRxGhwJwSQ3L+OzmAcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiycZsQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQOhOfnO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiycZsQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQOhOfnO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08jD1933224
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kU1BXbG5eAVNm1ed662mBFUuYr7gu2449G9dvtQFfP8=; b=jiycZsQIxw4+afhP
	MI5cOIgXQPbq7i4K7nFFsPn2QSP/y9Sg1uVBprUVEML+Q/CrlMq6NEWntcGsP8Sh
	8/jFOw31UGPI492ovcLhUiXbxXDRjWf4flAUg1bnfHhCyVgkQl6u8lPGSLYj8oBn
	v6PHGNIOK/6B+73ptPlUGDMpi8SIg1sZ2YlY4x2yB7jtYa4a4QxVhkCuouM15cm8
	vaOpZPEIvVhiJr1IBBEtZJ26SOnEDryi6xYg8KVOLRy22kS8y1DyKEuo4QOCr3jZ
	PYAqT6aJPIKUfpdygzvCNCZnK5UcvK46SzmTtTUQy9LN6WqbzcOuo0mirgXYnoC6
	ZhwDJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjjma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:14:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so18928185a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814484; x=1792419284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kU1BXbG5eAVNm1ed662mBFUuYr7gu2449G9dvtQFfP8=;
        b=IQOhOfnOGPufQMmqzBsgvMRLpWlVYE/qbgOrkLDZxMNJbEE3gNbN/POmuRRPIBSFmj
         +hk53PM67E7V+INEOmzMN1kHokbd85OcRK3x/c/QadnJWgcfNwmmK3mi0B0zCtM7iJKc
         OeGCDeDeyFKVtBATgKsNY5vuJOtCy/uhxJLGWZHxBXJfz/3MYw2THdVloUwepQ5CFPqe
         sG0LrB6RkyTfXME35vrEIGG1LLF2OjbgK3nvP3lYYDTEe3UW4Vh3fyPYPURcEy+DYhnO
         aZJ9P48KOE7BvgzvWqG9ezswH8QFuqu6Cdk3jdMfhXwQgrZwCjEMVJs7oZUmCRxdfbos
         Hqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814484; x=1792419284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kU1BXbG5eAVNm1ed662mBFUuYr7gu2449G9dvtQFfP8=;
        b=MPVRoKvqHs3XV3gix0yTp2Ib6gaWqOwHZtTePpZuS7FzVw2KBI+ZBaBFS0tDILYeXt
         yoEn0InG6Djv2uijj7Z9KUEAXO5mDjoIpEn/fDT8Erg6d7LbVIKHaOSh/Cch6yZXgDB5
         vyR403FLV5f9cW/GNjrxs69aI4iIxtf9u2I0T9VCSpqx9wg/2SZFEs0+k9y1+d3QjA3C
         N1TzfY1U6S0Qun4R8dHas0/C4WmrHFNA12Kg6CNs2UblkS3RNsYMsFa2D7xOQoHBzndS
         Ih02TyY9WU5ihUt0Pjyqg+tQQcq70J08n70jp6g0d9R0VuN/IIthbCy7M2N/QvU9kP6K
         a58w==
X-Forwarded-Encrypted: i=1; AKwUvBz2nYv6iUprIUHHJP0wQ7rbEkszVhah2ezDGzvBSwYkEl/Qc9/AXRJan/zpcdEI7K5a6ia4pyELln2Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLcaLU5UqZJPmcQgVhCn40wm4nv5udrBS93rwVk8xZg18HsKumD
	NS5NQujRJ1KIz2MVEQ1uq2eZ2+gKVoaW5lpOBQJaiRELDiFaP/vaeeJ8hNQldkwRLDi7ybTJ0PR
	W28pxkNK480sVOTp1zURDPTv7V7HXUtMEIgl7d5JEhU5BjdHBAkD1kc0+hz9ev8MOzQ6IpxRn
X-Gm-Gg: AYBFou1s/PLBXeg9hGvQviMVmbN4iOFZPfXzqF0K+TH1MoDfnC2E5YFapfHoUZ0sCiD
	KkJhn4d438K5dWg4nLzcDxF6cQVPVXtvP7KaWRcly19YOQ37tkSjk5gr/6zJqPBwZ9r5t1eK2iX
	tL7HsPWcsidLHzp2kh5ZIBvqmT8gLI2k4n5I4BjAkdh0SJXYaTcoDHouUXolOsTdcBKdZa+gV+U
	8/+lmFuVAnsmo4u3iI91NPKq3SpMXpvTxd4PERhVkb+4bCWKYK8xLqXWGGRTX6nQDn+nN49QdKa
	z8T1StvVO6WAGk6ifUqVYys8OUvlVO2rHqGwTyK3n6Zw3mHd9Q/jfevuBwyvwsT5IpGpMcLq6Na
	R7ZgWIsCO7mjiYAjqccCEvQ==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr1645071685a.5.1791814483619;
        Mon, 12 Oct 2026 07:14:43 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr1645063685a.5.1791814482879;
        Mon, 12 Oct 2026 07:14:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3626dd09d2sm39916266b.18.2026.10.12.07.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:14:42 -0700 (PDT)
Message-ID: <2e3c1082-e5d0-4a33-ad3f-272dd74aa54c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:14:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: Add support for Samsung
 Galaxy Tab S9 Wi-Fi
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261005-gts9wifi-dts-v2-0-c3ac9b0f9ceb@dxdmail.cc>
 <20261005-gts9wifi-dts-v2-2-c3ac9b0f9ceb@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-gts9wifi-dts-v2-2-c3ac9b0f9ceb@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX3gS15vCiXhpp
 aNuLhqeFx24n6n+hb0l8To1/RBGf6diNLKzC1RZuyFZs4Z0mT1PW1r+xHsKpppI97OUZXYS/oyL
 bxMdUhy8aUynEgizbldjUtu6w5sbf2FlEYuWyfjxp92rgLmyOgdVKVeW3Xvg2F9MWJvkEDpLCh/
 uiui9Nvc3qrhtntDs3m69uYfQhENTWuj7CEH9l6vyef2YEk9zbNtDz6byRQjvwuaqSTnKM0un4N
 ETj/ygaPv88W6lwEnRdT4x7WO2PH4JxZwdVHPRXy7XT/Hci+TbKg4SPnlcwMx3y/weH1bkAea/3
 Gd036RmzNN57MgmI/o1unIhVHppOFX5unrHAvD8Mb7ps5HwsBWrKVHEpwL2hGjmEThdeU8xP+j5
 DG3H8pdYefzBJOdOYwc5TsNgk3054xuJxm7trFmG160Xi4xuvvGfedixzs1iCEnaeUZ5gO9vSnF
 ZXqAheMoUBId5bFLLDA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acceb54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=AqZmfHzJsoaMp3Ki:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=zDk8rvenn9N7faQbNqAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXwBMUvyuIN+kA
 wc3mv5boRPt79AiJbJG/kns44OPE2TXv7TdM/3xjDDNoVueZDZm2RS+/mUOTstdvJWfkGfBcBBN
 3IwMYjN95/Kx4M42MRDpG37s1LiQ85I=
X-Proofpoint-ORIG-GUID: iJjwgglopA4wHKOAA3SVUeqtsYJ4-QkH
X-Proofpoint-GUID: iJjwgglopA4wHKOAA3SVUeqtsYJ4-QkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056

On 10/5/26 9:47 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Add support for the Samsung Galaxy Tab S9 Wi-Fi (SM-X710, codename
> gts9wifi) tablet, based on the SM8550 SoC. This is the Wi-Fi SKU, so the
> modem memory regions are removed and no modem firmware is referenced.
> 
> Described hardware: UFS storage, the microSD slot, USB 2.0 peripheral
> mode over the eUSB2 PHY with an NXP PTN3222 repeater, the
> bootloader-provided framebuffer console, power and volume keys, the
> book-cover switch, GPU, video decoder, ADSP with the internal audio path
> (four CS35L45 speaker amplifiers and the VA-macro digital microphones).
> 
> Tested on hardware: booted via U-Boot on top of linux-next
> next-20261002, with the default kernel command line (no
> clk_ignore_unused, pd_ignore_unused or regulator_ignore_unused).
> Verified: UFS storage enumeration, USB 2.0 gadget, framebuffer console,
> power and volume keys, the book-cover switch, CPU frequency scaling, GPU
> (firmware loads, render node present), video decoder (device opens),
> ADSP booting at startup with the sound card registered and all four
> amplifiers and the VA macro probing. The microSD slot is described but
> not yet tested; audio playback and capture were not exercised.

Please test them!

> The display panel, touch, pen digitizer, cameras, battery/charging and
> the wireless module are not described here; the latter needs additional
> power sequencing and follows as a separate series.

Wi-Fi/BT should be a low-hanging fruit, see e.g. sm8550-qrd.dts

[...]

> +&i2c6 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: let's keep a \n before 'status', file-wide

[...]

> +&tlmm {
> +	/* GPIO36..39 are owned by TrustZone. */

Do we have an idea as to what they're connected to?

[...]

> +/* Without a Type-C controller driver, keep the DWC3 in peripheral mode. */

Is there no pmic-glink in the firmware?

Konrad
