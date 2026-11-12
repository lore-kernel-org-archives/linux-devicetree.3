Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491346;
	b=wKXuLlgJmBI77ouoSXRm6s6kKPk3jdgIXbK+fR/pjeUAZEP8xIeEKDNf7UeeuHbz9Xm9
	 6tJUa8TV70PLLBZa5YVNFgDbuq5ciMMwOYfGVsVVerY8GUpxQn1+aHCLJ769Xll+Wf4BK
	 a1D3dzXJdx51QYgDDY3Z4u2Vs9lZm728YxZ8XcIAMCjTsjVDYxS+HD5DV9bNfVdFnVoYa
	 8JcMABnp6hhRevTdKnK6cD56CsdsMoM8WABS5mXvqvEVmPRcEHEYybBdY18ZBrh9iXTgc
	 kshzuhXivzdR5BOxvioOcLSJ6pXR/cNu8HXqp//JfP8PlnffsQFpbyDrBU9Qsq6HInA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
	b=Jb3wbRBENNQnEKNC8O7JPx0snLjEzfDHI01xli0BXqxeJ9IeFwjf9G9Zb2pM/3J8Cygp
	 EB7C/dJz1ruGdk4/NS8pGJGzCU5qQa6rNsVzC4ZWLzDyZHHB5HIaeuDifN7zebmMpEtI6
	 zBigwTU6CpsftnEQNhWoEmcrwXKf0EEWAIEIGwJbYDK2oS5NBBn2Ovvjhx9x073dLeNhF
	 U1os+NCIzxlzOkycfY0MFpbFoI5i4yeG5TMUYy48DxZHDUb7+2L939LvUVnyiUjYOI4Qb
	 Vypq5bQlYKMuqbckyuJEzLEf+h+XmlffjNkzIMaxws9AnbhIBXrHmL+1S0Hmul18g2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LB/XrMTV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78184606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78184606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB/XrMTV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACDhAJc2818579
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=; b=dS9ADkxb/Kfrsqbq
	kcV7+R5mEVT1gMPTFpALmOlGY+TRXp0Y6aTe3royqRmSFs++2bvUIRJEfwho88sr
	P78psjoAlCnf2p6/FJwQ5p9/GZFRCAt3tz7rQvtbs1jlXaqd/EdhAKRoUM4Q7W+v
	ITiQ+3WrMPGFofw2UQtRSkWg1swqsBtkcGn2Qb2Yghny+OipKvvsaC7rsXotkAch
	9Joi6OWaY+kA55TfWUGDkExP1TAJm7yi2IfKIP5l4h8qLSnv5ruSl0iQR1RArp8i
	v+c3mUnhAlBzsqYWtuL/Ece7rVZFnJOAg0qh+w1mF8+lHe+5XYVvSfZvA9FWnFOq
	Co/2cQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1985m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 13:49:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso972976085a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491345; x=1795096145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=LB/XrMTVAom6eiU4jL+d6VIQK88Sd0mAAKGHBIbEb+L8PX0H4E2ahkdB6YuMLmKwlR
         SSRGEjGhC0AzfcWCy2YPKIfJakX15K85/YxKuq0GohCJA4PITS16QYbvGK1341tOApef
         m+GwpU3i1Q7h2HJAmaf7YyWXJ8CoM+BunMyEEYAwrCmrcFxf5OHC3HzJyJj0spL/dWmR
         T9hDrluoh1T9+d45jOH6pZXZ1AkR3/hkS/YFP4P9WF3GdLZ2Igmd0xOoCwONT11BAh+w
         nIEKRv00eRl6EQV2o3JLAusZrt4mjj6qjFnzDuQRdFSaKNSNN16AANDcu0VkaxiUC9yB
         fPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491345; x=1795096145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=VxImdrx5ZwEi4pXSayLddLo4RPvUy1z5hpj/kkZOxH7pHbq4n9+YY5bx3HEvFBfe/h
         PUWdvU+Z4kHdFwV0Dh47u1DXFhRJKrx/GS3p5mx/giH6B+O5NT4GYw0TxPlPI0UD1axN
         O6e8mBassYU7Vxyew/uOtBUtI6OdjrmDsaeKCKzg1UiVjrCVnaiXr9An84fp7xyKB0nB
         Qid2zOYCdWxL1cvnpl3CM8UR5b7Kg1of1zbsgBpjQIgcjiJOJovKnJsojrmoKbQG1Btz
         aKOa46oWumG8/2eJbCrilphA2/2xSz1+81g05JCL4M0kr0Jzk2r2c4rg1wu1uOxqOX0N
         uMxA==
X-Forwarded-Encrypted: i=1; AL+hErGN1caaNgiuLBxwytjAZY9LYjU2cxrvf9+ayVcjz5foi/SuSg0pdMKak5Ht+iqyH4/yVklOTO3aQ3Pp@vger.kernel.org
X-Gm-Message-State: APuU4Z9NC6mTnunM/kS0sfhaLYIyGAggj7xtEaum7KRpfnhWWf9B4dA2
	FEEqD4p6trP4MApzABwhh2IPq3GREcXRevWBuJUfrd2gKZd8mmtMBDMjzLFmWJ3jlfi6vhjqM+4
	NjG15U+yjK2jOjZ9bIn/W6apuMonMke/A9sENG9kAPhkskduWfnDdyFGAXtJcylD2
X-Gm-Gg: AYBFou25nBgHfKTwlyKxeLhbFxh4rgbCte3Td8lefW+eEyDd+wz232gM7ZDa9ZskhU/
	BwrW8wUONknIRCRz+SU/nio0aGSvZcP8OwqE7o68IFpZDRFZAo+RlYEemxfxQ8KpiM7+FAWPYrI
	MMmybe6s33iWvz+/qWRx6NjYyoo1yo11NCbJztXfs2xYDgSz9oGujFxOjHHDzB3sFzT533GgJoK
	Yi3XLbYPaD3TpVNc1HP6jUPpWUQ27+4qU8Of8lgFsT9r+riWOiB+iZ5tnihIpEXbck2u9tBiUec
	ljIXirYGgCFqJA7hZCJiuU/lURqcF20obeQAqfwrs6kgKoCkt+n51gMwEkFxsXf3HlD+gedCTQ/
	8Q6X9SdPbo7CtkKuQ1ZWYx5d5cMLF4S3XBob/M/9QzbGe+9vGeoc1APp5gw9GM10pI+g/PXLJqT
	49cZ8=
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964783185a.13.1794491344725;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964779285a.13.1794491344206;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae196cc72fsm10673721fa.13.2026.11.12.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:49:03 -0800 (PST)
Message-ID: <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:18:53 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX6iAcZ9zxwDfz
 lc3QRaDYpgkuVyEFrw70JnXV1MmnXVqI2whSoIUCbeJqCpGJVCMbzWbk50VAthy4DmGpr4tLRHu
 sc3aFyoRmxB9p+YBna6mcrr64x7UCEzCAv0RD05pZXJuU0EcaoaUDygbuY+SLC4avCZOfCMfS1h
 /uualbeGnWj4Xm2jY1EMIEsQVFmfq3c4tzwxO6tEB8s7Ruf1uh6NPQwODJ4MKjMRepDVMDC6EBj
 3axImtQeSV5PkKvc676mszqlr5rTFqPiUp1HfaPoCl3TXBo9Kk1Npp/DQ1dsPBXC2IIwzbNpWMn
 l4Ui3mwxnE8jdz++VsdhlCaKv9r9NcmNZq5qwFBTXfp5gcOAOcHhEU5J6JwSjYUZro6o+skm3ar
 belkJbNIvP3s0yw61MIzrIKvLu2Lax1teh/2ed39Q/iAPXj+kdJewlahu9RO973wmSDhXvdRwaC
 giunR77ilsbIqZ3Zdkw==
X-Proofpoint-GUID: GPo11KSV4cTiJplwkGxHpd6NN53JbTqu
X-Proofpoint-ORIG-GUID: GPo11KSV4cTiJplwkGxHpd6NN53JbTqu
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5c3d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DN1OgqIxCIglqtzaC5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX9VTSfk/BfzJm
 bIWlmyv0EXSKQ+nHUwxxwx/v1M1aAPb6P3lRTU7Q0KEEBDJkFNouyj7SPvNQYQ5Rf+8IQELQS4k
 SrQLlm9SW7iBdZB/COVpCTmd8ezvy80=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054



On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>> +static const char * const protocol_name[] = {
>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>
>>> Why are you creating holes in this array?
>>
>> Hi Krzysztof,
>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>> 6–8 empty.
>> The added NULL check rejects these unused entries before accessing the
>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>> ID 6.
> 
> And it should be 6. Just look at uses of this.

Hi Krzysztof,

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
This enum represents the serial engine's protocol IDs,
rather than consecutive indices for the name table.

The SPI/QSPI driver uses this ID to request the appropriate firmware
and validate the protocol read from GENI_FW_REVISION_RO. The firmware
loader also matches this ID against the firmware header's protocol
field. Changing QSPI to 6 would make these checks expect a different
protocol ID.

The name table therefore needs the QSPI entry at index 9. I will
clarify this requirement in the commit description.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

