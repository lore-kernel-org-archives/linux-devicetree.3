Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395341;
	b=GKLI7dhsn1RPnC90y9PK+seUJlvUIxsSaTAc20Be304XQan9WTQ8y/ajxrs+atdl/iTP
	 oOpn0QAYfOty6XILZXbWYRFiJVpl6WDdXV/JJrgCshMjEGCSJ/Z4s36Aot16e114OEsSl
	 6THvRgtqDvHZ6ScSobiU1atGDFVBq08mChwqbm2fM1iLAdZ3/7dbOsoG+lv9xHI9BL1iR
	 O8OE8W2BcOHgEmlpTEg9YBZquWNu7fEgYdTZ6OGrj8WQkPQrEBDvYrKUtog0yOddz8H49
	 sMTbfNkaGUQ8nyn6155d6L5vRs1MipRaE/VhFr98WJOQ/MOfWJY+2yyu31KJBDe/Dpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
	b=1G5cQ9sILZtK5YGKjkCvKgNN66od74T8CZai9QiDT9GiJOEyh+aU1pUMs+JfKRg5AFTu
	 Sv38Kay8E6pedGU/SneTzrNhrDzO+im4587En4etozt2T/i01WTfLD5UJqRMHMHftbUO1
	 Tb6pJ52gkep/3hMuUnXaAFiCKejTxbjNC3DL9ZPzWMC18DtkhW9imxeG9ieVxpF8l43gC
	 ABIrP1jhTzsLdm55Me5k91/LNDKHcNXHXU3/NZWXjanfYePj7T8VXRZcTgcPdxJ1IJb40
	 7+oXePr1I5HLRWqxVtzsAVhlttwePI0BMGrSvOYUjizURR8PaDdUj6TsIqXyIF6OyyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdPiRGuw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlIqlGiL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671F606A882
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D671F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdPiRGuw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FlIqlGiL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABANcg0012705
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=; b=pdPiRGuwcTbIcMax
	Tq6emJJtjaQQrkh54EI8ETC+6YJLtePSWgVq+RHHyHbk5pSSGaLVzx/7Kz44RS4T
	urDVBRqyzjAepsRPX4mxvDxuYmQQLuRWm/tBQZGQZr3KajnC8IJPn4OqhR2yDVRK
	Rj6Ww5FRbIkfpqK0O2PVewf5i5/rIcus+KR3XbIyFgnV80XBvqAhQDV/ZmiogdKD
	Fbg8wUIHQ7N2tSucPrQUnyW5fL1LJ8yldTouYtux4t+/Xa5SOwCiWO/JzcNU3Yqj
	8UDLb3D8ULEW6VIoBpzMn2t+eDhXGnx02yrknAXhDbpYAE/N7rC8z1uHlQux61Pc
	aR71oA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjr5h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:59 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d304016194so1266348137.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395339; x=1795000139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
        b=FlIqlGiLqkLbVtuECXktGNVd6fnXZ6E/vmD9r4NeS5fwtpLyLVtWevsWbrhgtpZk++
         gYKLg83kVlhtkR2D5z55ymm3s+HbdrxdpwJweRYWTqCO3z6fVhWw41DEjwCZ/g/GWb2X
         QDz9YalRjNOx/KR6R8FQFZundsXCw7b6RQ/tj1Jr4WFcErdrzjegH8XbTGE2CoN//PtM
         emQuwSPUIaNeKX6oxLxOa4y8upyAMDkttxAVreZ2EnwLYzPcMFBmNs+/nDxhkOebOvb9
         lPbcn49Dc+U2SxtGIuXk0GSPwYMWiPdQV9u2TwxYbsj/vwJZ60DHL96Jv3nlgVAZZG/d
         Dw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395339; x=1795000139;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
        b=OowphttW8+wf13oOSvvPBYTWW8A/fAJq03lZa5EUbHhgi5tBYSJGooGtPLM2kUQ+Je
         JrE6uuxYo9nslS1DghhLjCZZtUmjSex0G0jmAEB7ugQy8jDU6XO36EGcaCR9mm7LwAWY
         bNbz/bqlmwGtW05R1yJyVmyQIwiG5OnXo2zPsulBOOPIvH6NdLyjsrYISu+DzdaZGdzo
         Ah/E7DZ2Puz6dQiyBtAX3z5fTFc3A0jkv8fFtfYnaMcPoz6Bu6W4hA3RUW5MPtq4s+/N
         pw4BukIz91YjappVkwSifhlqemi/YCFHEGQ9QQTcoT8hxUAuP+y3rYPNKFgoA7bzXVQt
         +N/Q==
X-Forwarded-Encrypted: i=1; AL+hErGBIOh711YPKesHU3b70qP2FISTwVdVfGot94N80IwgSkuPB4FG/ZcZWyZur7H/BhsPKoqdHR5BndNp@vger.kernel.org
X-Gm-Message-State: APuU4Z9xYMyWeXi9SyYmJBCpK1aVN5skh1KiKjj0aEavcwxT8uInq/px
	q4u5emzNK5ukSAuvlwdMqrb0p2NH+iHVwGMer4Lbm6vF8n6WOrpdCCg1SZrssqpESpXUEb0xSX1
	O+7Iy71cjOYj6U7Xem+9WUjNYzYa6oXLNldDMQ0kXvVsec2l5lljTi+vQmbyqcj+kYN/+F030
X-Gm-Gg: AYBFou1M3PJt5uWgGJYHsOejBtzpyCocv/h90OktjQorTbHk47b9XVCG7VTFijcb86j
	/sdG3YAO1NBs6X6OstDYT5y+yommy7cVrG0iv6uPr5MrTHog1eqKMI+IW9UYKNpcLIpt39IVH0A
	9B8iZJKTZmZuyI6wopJ6K5moWfHcLblknSWpCk67qkLEvI1cOC50c/oAwIdo0DMvqbeh2TY7ezd
	vy5nbWpQdn1Gnozn/MFTAv+7hFrgDbvb47rd+lklIywq3JdFeLWT48iJ1Tc4KWdFxoQlAh8iD/a
	0B+jPSm9KpD7ZnE7hEohPoJkHYJVmGuUvUxmaIK64++gswGRGcqlzGZtE0PM8DQpBdm6ASnfMDx
	mvrceJPSvwd6ey+JGfzKvGZoHOHr+0fFTx4H0kQqu56G6KEQl3k+dyQ1vmvEYD0aKmqhF8yiJuH
	g=
X-Received: by 2002:a05:6102:3ec7:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d4fb2d76aamr606141137.20.1794395339220;
        Wed, 11 Nov 2026 03:08:59 -0800 (PST)
X-Received: by 2002:a05:6102:3ec7:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d4fb2d76aamr606137137.20.1794395338779;
        Wed, 11 Nov 2026 03:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm51330085e9.1.2026.11.11.03.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:08:57 -0800 (PST)
Message-ID: <3b2e2b31-cf65-43a8-9a6c-f5111aea8ec6@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:08:56 +0100
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
Subject: Re: [PATCH] dt-bindings: example-schema: Show example of
 dependentRequired
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261111090449.53511-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-208675@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-208675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX8xBw4c2gxmt3
 RT8i6CvJSubTf6X75jCABl41daDu4tklGAPgva2BSR0yFwxewra9AeqWaR6UYUvsoHB9bOT73ZJ
 J8erNahBFEp8QUNEaRhsQkZyIH+ROUv7JVt2ZN1axYloDb/y6dE2xeO1PSdlKqz6UYrggCl0IY/
 NcfzOfOTUcBwrVbUddvbdpm315j/rU18+Da0G3h+k8S/ktz6i83QEk9ks17YpIt6uBn5Nh25MzA
 CibupEEvQlELOTpxKX2O+FtlB6W6C1feZ7JqleoQcOhWnMRGv1BShIvKAr3Smn0m39pn9AHjqph
 PGZl4zjQsRrA94THeO1Hxp9NZ6g79ZWP808ik7r2bMV6+hCW4CtlxyL80E3lDZ+TZSwtD/Jqek5
 xBfq8cJBJUVVs5g7Jm0UZEX0NOOsr9jVyhMGTqfmMfTTycsF5G+0/8ihrR+MALWlapPEFvh1Tj9
 Aq/reHXyd5u9PJGPEWg==
X-Proofpoint-ORIG-GUID: 34qKM6yBXny-TiYirV5Z4Js4gsZjJrKF
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af44ccb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=WmuVTcnx4i-heN2spVUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 34qKM6yBXny-TiYirV5Z4Js4gsZjJrKF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX31o+Fk+8Spqf
 F13sHo279p1K/ghoq0IC8HlwmdkyNfWjhqxNBVhCiQGwbNpxedtlB3TOOuR2NBtot9YFUXxgKQ6
 EOyJ2GrL2szme/t+aJm7iYhOmUnwC18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110044

On 11/11/2026 10:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: example-schema: conflicting and duplicate
>   dependentRequired example

I should choose different properties...

Best regards,
Krzysztof
