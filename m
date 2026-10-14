Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B252FE42
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988420; cv=none; b=RN1QJ30IzEP0SCISaKL929Uyfxt+YLXkFDhkSjBukWg+FCTa5fkrEzbltudBVhapnY5OjC+FDcoejJuDyEhhjjnQMXo+2etSuQ95yGAzj6K3T+ksNOTt7inoEAxDzrNooO0xb2vt2/262M2GBa0CFLWBLDhVOVIQ0zMFacGOJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988420; c=relaxed/simple;
	bh=+5PLPrr9n0KYI6GRH3NRijC+PobyDKxOrwuWi3GiuDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjDMON4G1N3T0WB0h0UfOwuD/u8XBKRvh6h6zVTwQgTUI+Wdebo78DnXOiNdO8LrS5jmpEQj0E9vSdn2RpHeOn84q2q6SergU2IsMjb6GHm46XD4w11uyKDc5PkjSdoL6hj4+xg3hj5qjq1YaotDjEk+tn3o4S36xMCKWfBhXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2c23bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX7H/eYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2c23bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX7H/eYg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBbAqv2685707
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=; b=KX2c23bzOARDMXps
	aDYzFVaiUvLyi7xGKrBCvoWp24tfaCh5uRO75xF3e2JMSyF7SSWoQRUq5AAk4nMI
	nRrvwDu/SuH8fVWXBr+GLhhkgIb+y6Y2mbHEPhmr0/POKZ6Jz/gCQDDHmcUBRFfq
	q29dctfIpAb7ZxJYDid82GOg+Wx/DgV8jBG9k0oHFYVzHwTbRK2g3WqRjwVd9W9b
	nHZqWxc5KuyvPxwfLU0OODmPfSvu05tcbiAQ4j67okej+WwkJQNczPMR3dZk62nb
	Sq7IkqQJ8xMkbYKp1pHATkCZgiM4cG/YeIkCx3HA9V/QzMPX327ZWFjzfW9fytv8
	JtwqFg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u21mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso149773137.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988417; x=1792593217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=hX7H/eYgtBHh9Z0UjEShY6GtOolAhfb2GEhEteMz4N0p+HAQwZ9ZrORY3cqyZmcY2s
         s2DKrFOG5Xf5Hfkg5/d4RjOWtFdPnhEET27qWGOluEzbbkk0v8DhHYQDMoGSyDEAv7Fo
         9krjTKEYewfd2w/3x54Ui5p0rTlVr8s4J2/6yh8ihqkmf0bm3Y1UfavtzVzHzAIwlCnW
         jZFg3SPFn7D2CHwI9xUsOFQcXh9z6kAzowD4HdC3VFCS1kD3C/NKXNLMFT+Inp23hRiv
         gYfB8B4jNTghIU/hiue3APwC6kaH0TRqIFF6lKiV8iwkAGRpgrv5usFKi4X0Ix/biR/W
         b68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988417; x=1792593217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=vsV20xlNfMLNfe2nE0lZnbppPCg8hhz7B8SeIB/FowovE8plVxCdY65JOsUJ2/x5Y1
         9X0B9HajK4JiWJYDAp5q+hahsKr8V3QYWuvN8RF4BfPfXEmjmuIPOxfi8NI5IOh6PpP+
         34kla+g1CSEdQGRXJz/9lw0y5lSBEteJM43AjUcK8akp1xXrM9gzj9/XxSMiCeFV9M1K
         paSw20SmNxxz9vu6x85jd10l9KJ06fSNv4XqDthXn/PWrwUrptTELssvtJPMKIv+2Inh
         WtU8x28VkQEXJzKgXPEyyG37tUGqWRSA5Diy3MO552X+ImbAsV0Wolsq9UF8FSu9XCu2
         hgTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9XMM488vACZHBivxI/KpGiSgDyZpAvoX/AVUYYyRHxyEoGCOM8ZsMLf3r9msK208Roij3BZyq5Uta@vger.kernel.org
X-Gm-Message-State: AFq9FYLZoNObh2TZvJw4APy5cZ0KSTOzgGzsddRyZ7iV7y5esohMKfUy
	yjl7CuEMzw2XdjI3ZdUwZLOvXhhgO7FzkjnrISQ9GVUm1akPbkSme5VDO7Elah0DqjdoUaDS2pB
	tC1QsXl5vhzBMhqCJKbT1wyO+Wgd1ThwH5ANB0XZN0Vl4K2++2xoy9egKq8mPTz6F
X-Gm-Gg: AYBFou2EgANXVxfgprHNS6ILMyjhc1LBmfGeqm5cupYB5T3NrQSWfwNgkRyffzVer5d
	YuGRZaQYLh/JX87AghadxDRnEi+mygy935ilpR6CWg6MePA0OX0wtyV4HC7uMEtniNUR1qWqzgd
	4Ejt/O02vXiE+YM7cLTdpQ8kQiL9Y/ZunT8n7BImpZ6G/9ZwbyUdgN7rGAT0ox9/ZNjU3eaS2Eb
	QKbItM1P/SmiwEurf7RfEQAkSwbfp/rrgq21fWixmN0eECV9SYHeI9+fEVPLv+r7/OE7I+5M7wh
	qg7wbI47ylFxzJusQUK1oBukg0dIMISrw12ddT79MVVJrY1e6OoZ4Sf9vn/YMlLkjWtuKzAwYV9
	Ki5ZMZXLXWtG2EUuJn5iAhg==
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697081e0c.2.1791988417510;
        Wed, 14 Oct 2026 07:33:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697064e0c.2.1791988416956;
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c356f981cd3sm327141866b.83.2026.10.14.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Message-ID: <0d448a75-6fc6-4f38-a871-7a5338ee31ff@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
 <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXxwxVIOD5zJg8
 Yncz9Tlr106Jj7hHwwhtdqESPeeAi4wGbfryzKPiUlmjbKB6GqRU2CmlE9cRDiZ+aOEZEx425ZC
 qrrJH/yvpOmcd/8jfwryz1kvCKcFbp4=
X-Proofpoint-GUID: fCMwMtgYicxNRYwsX1hiqGKyk31ChIIz
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf92c2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eDuGKJUQ3iVb9g9TkgsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX5Bm7lRsQtzMD
 KcOCiWzkqooRhTjp66CYURY+tuzWBR5v0jpoJh3lMulPsh/RW9v36VGye9u/C2hMacs6RGraOtd
 b0ymdLDCMpDuJ0G5rKC5WD+rg9f3R73Iyh6R5qfiIE3Vfn/Kb7pha1FLlw3eLsVhccsS4+zn+B7
 8RekD7aFXGiqCPR9dnO53z3RUfx5pJ4aAV/GEuuUXkPlm+Rz7Jiv3/Cx5o80xYL+oisegR1pQD9
 R7QXtAgdMpweVd6C7TkCM++yJd0pt87BCFCONFXz+X5oleRx5L1rrRBxMvwlpybCH0MRqKCl8st
 +vXDMij4goYPBoxtpEc3E4L85F23Xa7jRxapgzIYLphcOl+TIaq8c9rsHeAIGLQFbH0HHu5IOWu
 zEDiYUK1b2fCLgJD3plP8O7tfvvZHDg3BiXf2LkwFRBp29oWDFaamz1HA+rNrS0CXv2J7YaouBe
 Oquh//yJqYII0aWFuGQ==
X-Proofpoint-ORIG-GUID: fCMwMtgYicxNRYwsX1hiqGKyk31ChIIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:23 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that the clock controllers take care of their power requirements,
>> drop the required-opps that were only there because they previously
>> hadn't.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

> Can we then drop these OPP tables, which only have a HZ entry?

I suppose so. Unless they should also have interconnect values?
(depends on whether these can be inferred from the bus freq for
all protocols)

> 
>> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			iommus = <&apps_smmu 0x40 0>;
>>  
>>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>> -			required-opps = <&rpmhpd_opp_nom>;
> 
> How do we ensure that we can access device registers? Is there a clock
> (?) which now casts a vote, letting us access USB regs?

Yes, the device driver turns on the GDSC and enables the clocks
and the clk-dvfs layer ensures all power votes are in place!

Konrad
