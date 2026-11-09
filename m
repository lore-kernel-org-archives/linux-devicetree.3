Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208212;
	b=aezGBJpxs3lHY5LMCca8i5xJatABWD+58HZ/q9Z0xkuVCJSlmYHOR9uC+rUVD6W5uJ7u
	 vYupZepMNICIBDNlETyTQ/2RxDJc6jGUaYeJDwos01gWzohYCZLEktPfr9e3d8WbmEf34
	 jospRcPSg2i80go1DtDh7HETJgZ4Fhe4vCFp/xib2QJrchP5lHz5WRzAE3ke6xMztM5Nv
	 SimwbT2vR5Mx9XJe46Wzh871Tj9rZ6ipYz8UDC6jul1LBctE6PvzLA+Fc0/Mnao8O9jn2
	 JEnNEv9P4pd7wWwO+uxFWxazXPTGS41KjgOYC/o9M72PwVGW9Q5M7TKAFhpKHhj+Qmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208212;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
	b=HDcfjjPy7VMbqrRGijZOt+CdKv3esCw6kNwsNzK6bW2VJKTyKs1KAtmqQhAQN+PrWNEp
	 Iuz5wPnMZnUgp3PS/9vu7/+h1iUjHZPxuCWqmV7fmdNswoDOsQGV7nCzmAnxTbEKtrV55
	 VtOarM7BAT9RAdzlOdjeka+50+jgelSPB6lrnmcXmuUAhsDeY6Z2YbAFIaI/pCLnMbo33
	 bKNnlO0QhzmjVkzjYMUWeY8Vc2c4lYNbbLATVE/s/qRvjidE5NWzxeN2msvj2641st3YM
	 TomFIdmz9MApKrkEDP6yF77EajtTxOQHyXeTWCcEdsdTx6IY+n/Zmx4x0E6HAkVwuNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40A606D807
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 07:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA40A606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ejBy6W1k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGIcPeD4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A3Ro2540088
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 07:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=; b=ejBy6W1kN3yns1U2
	17zJeRDHK4VWzF15HXswJ5WLq+++LvoYsgJZz45PV2ySKkNzW12sgxZAdZkZb7vk
	FiGzT9m0wxaQw9Yq6Vpn9THhsAaZnBxkS43MFA2hqsbW+n0Ri+ojzPQOKDILzzhP
	474tX/AZztr6UGYNcFnmuKFK/hKBn6XV/CqLMgZgG2oswRkw0zlchhrxZFKPIihv
	PBaqkzVUQSjJe/Q3D6cTwrRC88OPOytzqKbeg+rBWJ06mDMm+RhxxLjh27/7nhOF
	+X5GK5luwYrkpBaGAeLNZYtrXvOJvFUbOIa+/Hpfj4J2Ayio0ZtAWA81JI/zZuN4
	ML5Tyg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6n4f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:10:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so642894eec.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794208210; x=1794813010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=gGIcPeD4+YT3mxAvVzH1WR+UR1gtJZuBkSGwlwYkIn1tZWNt4bC0+wZz3bh7znik4T
         chdgs/bvEkwBPwZU0aXP6DhDSYXIB5L0sCot7XcJCLmmMLimhMV5vxU6c8h9xcZ8xX4M
         Ne4n1BAr7oQ/zJQ1GEo2hX81UhyLaPUpTlUo7HHuXOG2rz197sDc62kSymZYA0NarDf8
         qspTrBIMl50tbJ3U7cPvm4lWhb/JRMCn1DvWw9evQAzLWX4D1HnuHLOUxNasdvOrDZYg
         sQ8znDHAghb2Up2ktRT6wzti+puqNXXo2VrIm1KD3KPifVvsDW6j4dNhVzgTR31vQgQS
         /72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208210; x=1794813010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np7bEj6m0lRUiyUr1l1RlC0cc90sTu683s4JN4gPYMU=;
        b=ubpQfGP3mB3jraOKqi37Ioejcg9Hrn8mwCtBAaaU44PMNEXUompGBqeYkocprX16F/
         AVXGshV7P981O8fyxZcSTLLHe5e9s2kw4yLNOztnbjdhqCjjJFJoNnUrxLuhB7PpW2BQ
         o/rWptQbpbZ6jDnEcLuKSOYHDeaMQoT3BlBMfHY5OziBEdrXB2lShpJFKWSPdp8LGONJ
         PpV+S+5PwbvnEk4FbpcnDLNE5TObULeKP/Ll+oIlLo4VLhbO5QRC1KawAiNqXyg5vPFJ
         Qh9+IhwTAvA98sye91BVlxKJVWTSmJ8/PHIzjXdfDffCIHp3OIilycjjIt0b5FmzfcTj
         snpQ==
X-Forwarded-Encrypted: i=1; AL+hErGWJtjzcF+NK9D8hrsYd/mWl4jKx9SZa8tUL0xDvwNEOrmzsUYxDvJCtcI6ciKtcJUswtl5+FEFuCzS@vger.kernel.org
X-Gm-Message-State: APuU4Z8r6WiZNylcQM6hX3zspLwrB77xU/cArBa1UUKpgH8sFxtT6Gbb
	atPj9lhLlfHllV4/f2A1UXuvRkVLvojzQp819z/6uPyEGVOTjjuAbijbZvcm6Thkx4tks8qSdtI
	1zn6c96Mfr0+d1PdAks8S/QP9hepX816CWaJGqjD2BeJMXjzoJb1PFJJnJ0gpLcko
X-Gm-Gg: AYBFou2TFVu19XnDjkaee5TjQHdLI8VPfYXJaRuu6ze1urvAg439F1AUXJxPqfL0h8S
	DU8vnkse2+7yLts5OF8MOL7+yPdJuUYyoUGwghzx7hbiEvJ6X7ENYYDHfFaz2/Z4+CqKaZX7MG8
	6a/5dHrgUuXOxxVyrhpfcIHIvZkwDJpVeD2jv+juegLgICl+0sHfnYHkHIsQF6RjM8qXW587qTR
	BMlFPp/gCC/wXN7UCuQz+LLuYzydId59mncdDrkTXfYyJXE+VYEWX4HuUR4RD2yz36FwVoWyKaw
	d2Axgkr+3+xy/epx/xBd+MyTSAaqWmgJz6xYzkDi+QRuIqkUR4fiU+0OqdaEi9JkRUvh7Qi3p3T
	+iSKZ2MmZlPuFNPIKWMZ+o4tIvtF+uhIr61OMnLSkBqVHxP1OLuov5QHMSCQAMQT7bsqwtUEVyt
	WWyg==
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703993eec.4.1794208209531;
        Sun, 08 Nov 2026 23:10:09 -0800 (PST)
X-Received: by 2002:a05:7301:4b0d:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-370f6115d79mr10703958eec.4.1794208208772;
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f385bsm11423638eec.20.2026.11.08.23.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 23:10:08 -0800 (PST)
Message-ID: <20300428-94fb-4ae1-8096-e6851f5483a1@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:40:02 +0530
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
Subject: Re: [PATCH 0/6] spi: qcom-geni: Add QSPI support over GPI DMA
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <179415109036.3711751.6859082995940422062.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX6wHkKpflI6Qq
 NemybcTT4ipRIIqSLuox1lNh+YtAuuBUbFfa+eOpMFNhP0uFRAYkxSeVZvrpKY41MrAIVMHI1V4
 p9OlY62kT8OPIcf9oL2D5TMsFZfv0IJlAuPprRafO8wSRMjUjFBPAVoOK7sDzVwT/6hM+xDZGp/
 wXX1z5Ru08isUbGjBEjGxnSLb0JXHE11jvVPh2DxgVFIcBdhAy7QjgnC+WubunpCVziND+4PSVH
 FMZCs6aXu7a+9b+Qtfz9SvhYNT/caxcReAgqZhM2aL9UwsGnfTJaQMxTb9zoWq1wWOzn+bN+Mz9
 ku1F6B+I8M92JqysNf/2cIlMQ2S84OBI9Hz3Rnrb8JvYNGW0JJVuT4k0yACT0udQ2JmaO1fjyVy
 818J+/hrSFbNvL9G9dz4boZt3QleWfUyCcdQ6Cn9pXfCz73lzn+myJHuEvzSgBTH/64fsz4Z+bW
 HjmA78UMgXvrmikAPng==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af171d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=r2-LxIRbSL4R5ck5jzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyOCBTYWx0ZWRfX2pQ8hbh/3Uy8
 +uQ4M0knwSDQ26rD9qfPs2IOmL4zKh+/TnAojson8J+7h4tNiVPR4CKqu8CerQLRf0EJ6BpRdm8
 IWL+kI8BcflDjhVbvOSbd5FkqlT0fgw=
X-Proofpoint-ORIG-GUID: KQAUnG4tRK9G9HFTI8khqFIbFxTp46Mr
X-Proofpoint-GUID: KQAUnG4tRK9G9HFTI8khqFIbFxTp46Mr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090028



On 11/8/2026 8:48 PM, Mark Brown wrote:
>> This series adds QSPI support to the Qualcomm GENI SPI driver using
>> GPI DMA. It supports single, dual and quad SDR transfers in controller
>> mode.
> 
> This doesn't apply against current code, please check and resend.
Hi Mark,
Thanks for pointing this out. The series was based on a slightly older 
linux-next snapshot. I’ll rebase it onto the current SPI for next 
branch, check for any missing dependencies, and resend the series as v2.

Thanks,
JyothiKumar>
>> ---
>> base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
>> change-id: 20261021-qspi_upstream_series-850249e432f5
> 
> That's a random -next commit...
> 

