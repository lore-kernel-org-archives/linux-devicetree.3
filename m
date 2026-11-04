Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793770599;
	b=mGriM9niFJ9O96SIHJGGV3xiZbmmKpzqkaJdy8SnCt5p9u2A1cjDvehrIA8KNfDUEV6K
	 VPz1u0nh5LnpiYM5EuJzYF5ARv5L+JyoUgGxReW6TGIW7Sdc7cwofU0qNjHPmUbzjWpCZ
	 1e5e0Z1LAA0VsuyJDTh8KElIv+hx9mI2Wkl/X2s/B+mG3Fg3xaBin1dVm9UaY+0xpgvij
	 TXlfXdebLLRKapVY4KBoIf0Q2JI5jk9Q/YuZrWbgHz6b1bE4ySgbt1+cZceZ7GLfiTl4m
	 HDd2wEjksbVCSyEWyClA5D5VqfMH/cCm5DfDCUjd4oFrv35iQ5LS4yb2iLa4GlzjN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793770599;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
	b=WzdrqM2JllaqBMWrbVGoX4aISx3XTWj5GUbkY7e+4Ea1+BOda3CrDWgQS+MzGyGAuGmi
	 dqomTGGz9TY61q0tdyat25/7AsU/JG2h3iqc/4iZeNJaEuLDMMvAYSxkD3Yu6Sb2nlNXh
	 1eAvaawp+1yryOY1bysofN8Shz6xbk/VrQ+O+I+wwK+KtCYlsFs/Ho126nh/cxJxjmF7A
	 QB8yj8J+fBTg1VynEBULbrltRfkDQ0DlyFM4kqoC3YF5uB7KnV3xgB6JmvylhFxYMU3V6
	 2jRLOC+xbCa9RoLaVmNIjB82igCSQWACMXkEURO8vK5TUY8EImMy5fQpPSu6Te/GbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A79606A328
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 05:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A79606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A442CAt3300268
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 05:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=; b=UvGAnR2yTFvuEiSw
	VK2U+znlfnOxWXNA/sPLMZ1NvNeoEYyZfLohFWf6402MrKOxpirR5l6qz+HQjSW6
	9Ir8+EbrRj/PPAoTK5sSP/4KZ83OTyt33oFzaAU7xvyFfcLG/AVmaIo7/vZgsKfp
	GzmYawkDAPPojLLGcmddmpG+YwbKCPMRUY0ghh99m5QJIthd+opu84sC675D1au7
	fbuFQlu5kF3NydIa7L7khV3B+J87nkBlcmEmRUvGLlUITodRGlXC4/bKqpP90bYX
	hmhhRJC/KUl/Y2+SZwplJsbbmw14xFaGdc6Eu9iy+fbmKqdiq6DOgEVPJ9JKY7Bl
	IUhj4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb08av4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 05:36:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so432341eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 21:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793770587; x=1794375387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=MkZs77EHJP9hOg7R/kyrEOWa3SYMKLPGYpf5SPwH8i6G2OT462WG0xssw2CJi1AbtT
         vjU6wFJAu1415Amyx85p8lHmr9R9DqRkbQmwPxP51lz4Pq7NpNtvfnkKFq+YaUyUk5vY
         4mfHdHHdGUyUp2gccw869msOKLpACP+f4QAFeY1il8MPSHqeQGMFQF3puft7FIqXhPb2
         x6+oojj7z+7Ds2qpupa8hKU788YhV/Q09vYLVQmDlCCmlfgOWlof0q8mVQ57wxTCtRdm
         rtMw032Ww6ArH+al3zUlPhsprxS1eUcS2jY4wrkvJyiKS2ulCk4Z1wxULHy8546WMYAK
         ckEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793770587; x=1794375387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYtH/SnSy9AjEKHDiN2nuLd+EI4m1HjRC8v3W6Xw+00=;
        b=I+u2IbniD9qr9M4AVaXJg/N9dd/2YgQFf0CHrpYawki8B7R038cYtAY23A1s7S1Txp
         GEUr+G8rdYT+td+ukcwFF6WQFevK6cX5lcX7KYbeap2PUZmyUURRthv7SFGePMp0nBhm
         04gicnTdS1i6ZtvXgW+JN9L+tVp1pgBUxHkDxKg07D6jTsE0WVAoYPnzDQXE3I2DFrTI
         /Po9mj7bc/mlL5y6TBak8Yo8/JtjqomnCGZL0HdkF2Ff2EyqAifjUoY16ZMJp4EdZ1Gu
         tOD3weLie17Obj15PqMlfp5TM0SqOsDwK2rQ92+2zNE/Kogvo4eJ6JSRgGG3lRiHKfZq
         /F8w==
X-Forwarded-Encrypted: i=1; AKwUvBwnCrhxDSA1VEPsVebGfqMTXK615XSZkaPhYYVglPSMD0qoPiUlIYfy2+epaGm8Xj6sf8zHbpl4DSDW@vger.kernel.org
X-Gm-Message-State: APuU4Z9CEW7NJLFuc5K4X9xY1ttmadWrizkMnRd2I0Dfeok36InX7m7n
	MNbU6LE9qG+mA8IPhBvX8O3rxOqJANJ2MZOTWWLqUVQFJg7H2hrsKIuFX60i7uaIEGGbwgse0Tj
	FOlukdi12HH+DGTvMqevQJeO0VTq81vgC8y+o42Cy4ho5ylB5gAkiIvRLLDip/16N
X-Gm-Gg: AYBFou2o/ciCjuyGOcZfueyzFB9JVsoGbCSdAiem7TcUqLE/5x2ms1TAI/fC1w8JMv9
	8yu9qiJiCH7HepI5pA4vBQzjGbAJWtdo6wgRLl0yJUQ3g/rqTu/nQUIX01M6O2m5JjCtGvzcTca
	PN4c06DmEN9OZUj5qQawADnGHtScaWZk79gHkMRZ3ngT1FE3VsgIi595zKZQZ18ghOPxbDZBNJc
	yj9hC2+aIw9edtZB6XyN809KbgQYE8zdqVd9Jg9wl5scDFJfzBZtdiyiCCjKeq5QRa8AU9vfz5A
	YjEt/HqgQZ8++nfZbcz8i5uHIU9MJmk/H+8UTzl5CQUp5ifMUhlxGZY+CVblTTPLxFtTkPKHmre
	PViGWtDfqxiBBiqVQA3zKNG9uWREQqRkYoUf6jHHhCPrGMY4h80+SlJdfeg77V/B4yYH0qvZ4u3
	9tarHZSODFeIE9zNa9rZ3sJBNr/6G/2zAPY6Q8y1iBAlwjfZcLldgBTJ1QVxoOhjS7REueC1lAz
	+k=
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743610eec.24.1793770587362;
        Tue, 03 Nov 2026 21:36:27 -0800 (PST)
X-Received: by 2002:a05:693c:6407:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-36a7b3c4f8dmr6743551eec.24.1793770586560;
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm4765452eec.23.2026.11.03.21.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:36:26 -0800 (PST)
Message-ID: <8bed7caf-2b15-4b8a-ae9e-78f34ed780cf@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:06:19 +0530
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-3-7dd903a12d22@oss.qualcomm.com>
 <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <e27e0fd4-c072-4d88-8e3d-107fa7a97923@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX07aPNMWIHPF3
 EGJ0zTC6IrNavNU3uEeifvOXjhHyDtZQ3e8uL+6sxzBpNCfdvIR+4872lG21Oc+NejJaXUxPXx7
 yk/oy1wQNiSSx4DeUkeLSFa8EQ2DHH0=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeac45c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YwhHPVNpwWi31JhFHYMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: LHtqR1DbrmuC0HYaYIxgg099hjn3YjrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMiBTYWx0ZWRfX9pveM4DtRA4g
 ObEQ1hbxvq+3MUxtggMeBH/wmU6P/+qsmNtxDxvc0b/DwGtDOiL7re7KBjT5GGowNce+SK8CMFo
 j68FMZC+PiUEDpfRKA3FALiIGRuUnoY+xxHKSFiv92AYqrE8jQHxS/tv37qvrFmzM+RDvlOPLDg
 eMbsWK2Xvm8oblVDY/3GsBmz5ZbLhepwjNkvt4T19sE+HIQBsZ226OesqkHR63rcfSfQcXCRdVY
 mycjdIUtq/+Bu62z8Wz/V7+EC+j2fFbdEyP0J6X1zLPMMxt9+s12AH3Sk0Xw26rghD70L45QQ9u
 EIvc91By/yJlBVNOMYv0Zula+5S6yBxL2hFoJizq9Z0xE7DT8O1GmsFz4RjAbj+N8pegb8WhvID
 XGpEoxiTnC+GqOtrszgXvt2c67m9JCdvvhKl91GKhTNwDEKk3b6+cuIPvwtbtP1KZ3o6STfwao/
 RFJaLxNLVEWCRS5GQLQ==
X-Proofpoint-ORIG-GUID: LHtqR1DbrmuC0HYaYIxgg099hjn3YjrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040022



On 11/2/2026 7:17 PM, Konrad Dybcio wrote:
> On 10/27/26 8:33 AM, Gopikrishna Garmidi wrote:
>> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
>> built on the Mahua SoC. Most of the board follows the Qualcomm reference
>> design. The keyboard, fan and platform profile sit behind the Surface
>> Aggregator Module on uart22, same as on the Surface Laptop 7.
> 
> [...]
> 
> 
>> +		serial0 = &uart22;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
> 
> This sends console output straight into your EC, either enable the
> debug UART and point it there or remove this hunk
> 

Right, thanks. There is no accessible debug UART on this machine
(uart21 is not routed out), so I'll drop the chosen node in v3.

> [...]
> 
>> +	reserved-memory {
>> +		linux,cma {
>> +			compatible = "shared-dma-pool";
>> +			size = <0x0 0x8000000>;
>> +			reusable;
>> +			linux,cma-default;
>> +		};
>> +	};
> 
> This hunk should not be necessary, it was on Hamoa laptops because we
> didn't have control over the PCIe SMMU and needed a CMA space
> 

Ack, will drop it in v3.

Thanks,
Gopikrishna

