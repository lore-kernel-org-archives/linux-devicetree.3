Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936524;
	b=fthMH5B8J83VOObgc29PARf149suiyqg4P2WjpeCXVqw+RgFANbZuyihKoJ3+GnpyXww
	 VFqZ6qSWjwIk7AxiUteO7wlA72QIHyrfhjLdIEkr7wVfnPEwWzzDqp0d2YDIDHz9bz3ku
	 JhPPMGJLuyhEW5N0NXf6JfYUixfg9CxEkdCV/uyLbPoFljicr4nwdHPO6GwBH1fxUbD+c
	 qKRracN/KuyA0KBmXh5Omlpz2pszUhzLkPAJbghASOZknAn94xecymquXejDxE31LV059
	 lCYjlAelS/upNchmU7DoHdKXfOXNQ29avj+YwMmqIjkqtYTW9UMvSqfdQL7YufhFg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
	b=F+04H5Bl9FnJoEMt7mYsJ6eRzejA1qXwxwJoooZHV5DEWx1ODNG8ZFLccZa6jIF6CyAh
	 T6FqlAVrMniGSXOXNqDK423AYj2oeHIJ2wqiRYCrn7rRRmmouui8XaeYnUTePMW4ulr3g
	 IZ64fFh1pNAUyU717Jh1Vf+4s5AnMH95yTp8Ulsgp5deuJ2JrXdwqhUVjkix5Z2RIAxIo
	 EwELJPouvb5mZTO9nScXv5/vvty3d+OFDTUUiJDckx+9wpczes+nm3BMtIlJ9NFWqhyhD
	 hSsJ8Cf772PvCQBuN9AyodzIQbkxvqoPmOMybvEm0d7cEHutf9YOQP+UB7Jn2ltaIJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfUGYUI5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A07606A33B
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A07606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJnEhgb2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HfUGYUI5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQM3M923286
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=; b=HJnEhgb2bdQlZQjE
	Kj3chHu8kiRM9GDtJyJ5j9eKdiU34ayyp8yocjjJ7NzMEMGXXjAHYO80adE+dv9l
	IwJTnWmRmS3mqivaKRAv9BWXSSNRwn0Eci4Zw6+gFmIn1QNGapJWYw1ipIMM0yPw
	5VI1WASclYFa/UEoqv/95IlFHkMNgNduE46RommRNzv++Bb0JHJm8tTK+i+5VjlG
	l1OZ5l9tfLTzX6DMAzKpXp3SRPqmjcDZqfU7P6Fj4FAavzqznt9ERRV7m7wCH2a7
	ZaARfp83EReIFAkOvHx9FYGgaBTdXWf/HkRLwcrdjsnoFJfmNYWzS0BTL5WYs3OK
	EmOlfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms16fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:28:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so136206eec.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794936523; x=1795541323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=HfUGYUI5bLGSt3P0OKF7qFC2McEXz8w6uzdskEjdT5/RqHjki+Vjwd3M2kPzFpYBJV
         ljJVhcQe4DA2GBubeOI8ZPUFuFqF12BS0/zQ8VfNUAmINC3Va/KJWqvU+BJaU5U25XxW
         jrXZwkNSvSayRf3EjViWZt01FpPXEo2C2SWapRr6/NImR0peKh6v2WeI1EE8OtqC6uu7
         IG2xJ9/IFl28qN8CfmUaCbJF2NHWiWi25s5bD4luOGMY9vA6Kizpr4z0RUGmttVrIJTW
         IIHm4ueWzb0r4h4y8X2l0zM+acqJG7+jGUFMcqckQL+3ekESITrBJFTTJWvNssDsztsJ
         tooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936523; x=1795541323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m59IIPBua2w7sRwklChTFwkcB8b0jQnLsj1mDH8BTZU=;
        b=v/ZvRYABLhlq2CGL9W1gwY6c0lPYqhhEYNtKCPQcAWV+cKicvVEVkma1jLbd0CSp9y
         igcqi4jRbLPJb8weksPLXMOggG8X9djW7PULGLnOHwSryw9vsbqkDbPdEAvGmTNZ5GhI
         QMEmrnq0HY6txHiMGHtSG1wB0fqpmBW70gPCiuMHhv0sdxHSxtWVHs86cf49AajUvsNH
         EdVcJkmB9jqPxMC1R5TUFZtysMyJ2INSeL1QjySTCEKXGDt8pTBYJ9ZM5VnaEtK2aIVA
         lzs3ambdUfSHnI17I5jea88ltwYjBxHrExg0boyTSG5aXa2y8x4z+HF9IOlpegmpLAq8
         j4Ag==
X-Forwarded-Encrypted: i=1; AL+hErEsnNfV+eAkGp9OfnC76RAMQxPP69psXNFzQCFSdoIMKCA/1ymTQorvqlFHy8q+rp1e1tX0xvDLGy6x@vger.kernel.org
X-Gm-Message-State: APuU4Z+WKecB7CCimGnfHu//g5vn4JeSRyDoPmwoGM6ObasMCCxdCv+3
	q3wHhpKCdFUtaJMU9kEOkw88+comk+kaJycq0+nNojGuxMXAUu4RjX7gl3bfvTLRg/YsI7KdXq6
	Q2kLgotfyYDGzV7IWpWkn1+xy4ZyAUHrkP+HDSQHR3UJQcm4l/YCXH22+KZU3I/AN
X-Gm-Gg: AYBFou0DzMoRX7mcJ6NE1WcArpQAHLzra6HcYOg8szLGEnVFC3bJfsuAtCh0SGsZ90D
	k7yK6D+WbsQeoRpn6452HTpG9SFYA34A3wkgih3zwd71MeZ2Q59dRJviUqcbtCE3fIz7W6i3rBC
	jUQ2mmQzmViMzUl3U03IrAKSZfrvbIhY1q07OURlMiB5jN4lb1jpl4ifwgxZhKorurv+mgL5Sy6
	hYaDD02/cj7ucbi6kDm855e0m06lMMexbLNuLnbf4cto6sUjYLV4Yyduct7+0WQ+fcdL35o5Cko
	vhNzTQyCyDFToZoQDASljbnAgkgd1oMixXLrzVYzJ/M8phJzF35h+Du5JD4GaMYzmLl4ELoDZKp
	3CYxmSfT0ZwqBEvdvyYOQh3UFv+ZmX6KE5Ju9WZJ3N0BsNwP04A4YvAL68Yrm1sxiroTi7Y3C62
	uZZ59ljsJEgUeTe99p
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93341eec.14.1794936521205;
        Tue, 17 Nov 2026 09:28:41 -0800 (PST)
X-Received: by 2002:a05:7301:188a:b0:37b:e40:397e with SMTP id 5a478bee46e88-3827ff7aef9mr93316eec.14.1794936520694;
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Received: from [192.168.1.66] ([103.172.4.28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d269asm48943359eec.23.2026.11.17.09.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:28:40 -0800 (PST)
Message-ID: <1d294300-0077-426b-9bbf-35e42861236a@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 22:58:29 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
 <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
 <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <4060e67a-553b-4e1b-9e17-e6a742e62a3a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfX/bquJG6/Bvee
 eOJXQVDcWH8FoxEEOb4CoQ15qqmr/mGu9+iQkOnD3Tx0BUiKyRb3kBqZViyj/FjshrhDLb1Z5FB
 VVjpWEzEBPm9kC2ZI6Yx/TmcinqtqtM=
X-Proofpoint-ORIG-GUID: LNSRPP24C4ViFK0siUrnhRtJsPInuq9d
X-Proofpoint-GUID: LNSRPP24C4ViFK0siUrnhRtJsPInuq9d
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc8ecb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kYVgg70FI5gtGbgwxQSixA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=rBq-xhpCJJ2lye-X4V4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OSBTYWx0ZWRfXx30nToT6opvB
 6avQt6vxioH1Q5lx8EX3dibuHabp4Hg/DKC0UmRRgh+zYAmKfUhXnIVCSfL9SgNASsBZp7Nm2+c
 roQRFWKFQoaG31a/ggfq3JLSkMdhK6hyION86UU3dWwxsIoQUC8Rd4HC7zp2odVeApD/5fqAiur
 21zOFNNiGi0nW1zajHNiYK4Fyg/Fvg1Qb0odjRtt4Lay8XDnMhWamdsEHRxpfMnA0VXN1WslA7l
 LHqKIwOjEXDCLlf//PwH7lz1rrdRkOrw0DELKVOLyZfEWCI+PaB8ceo8zoqBBP/ZB8KI6tQE9T6
 hFvYIsBYTfOhkZtkYd0TAf++6HdwApDJkAaV7utJ+nIV1Akuux5AUkJOPh+MdOFspahXbrZ11F2
 kwEZPzRyDJs5RTmtSjMv2k4hBH81YkivpiOfoiT0SD+yBzTSWnb39Vo5fPa8n0xCwfA15NWg9pO
 mhpFIVYixPWFKDx/HuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170069



On 11/12/2026 7:26 PM, Krzysztof Kozlowski wrote:
> On 12/11/2026 14:48, Jyothi Kumar Seerapu wrote:
>>
>> On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>>>> +static const char * const protocol_name[] = {
>>>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>>> Why are you creating holes in this array?
>>>> Hi Krzysztof,
>>>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>>>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>>>> 6–8 empty.
>>>> The added NULL check rejects these unused entries before accessing the
>>>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>>>> ID 6.
>>> And it should be 6. Just look at uses of this.
>> Hi Krzysztof,
>>
>> The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
>> This enum represents the serial engine's protocol IDs,
>> rather than consecutive indices for the name table.
>>
>> The SPI/QSPI driver uses this ID to request the appropriate firmware
>> and validate the protocol read from GENI_FW_REVISION_RO. The firmware
>> loader also matches this ID against the firmware header's protocol
>> field. Changing QSPI to 6 would make these checks expect a different
>> protocol ID.
> You miss the point. This is just a table for Linux driver, not what is
> programmed. So please explain me, if firmware comes with new protocol,
> e.g. OSPI with id 10000000, are you going to use that as an index?
> 
> Really, why are we discussing this?

GENI_SE_QSPI is also compared directly with the firmware header's
protocol field and GENI_FW_REVISION_RO, where QSPI is encoded as 9.
I therefore propose retaining 9 for those comparisons, without
using it as an array index.

Can I replace the sparse array with a switch-based helper that
returns the name for each supported protocol and rejects unknown
IDs. This avoids holes and remains independent of the numerical
protocol values.


> 
> Best regards,
> Krzysztof

