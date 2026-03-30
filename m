Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6453CB2C1
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876778; cv=none; b=HJpmX7NBlyV1ZgztuGpEJjxH/SpssTiW/ODHgZ7bt19XhDjvwuB1cQauFnI7e6ep6UbjB5gcDRuk4UN8U0d0ha+/4oyPUVezC/iZVgHqJKuNCeSTaEM2VNeuScCLyNcsA+koiyG48Xw5R5QNLhtQuV4xU+jtGhbk3w0M/8D0TiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876778; c=relaxed/simple;
	bh=fa0YDhKwhZ5+jDZZzT8LMkH3gOrvByVwmZV0YEiz/uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqLtUkfKJJ66oWMYk4nDUnBPQULS6/2GWMtkF/PlRgF5KXEXYolw8rMfLds+kfmJ45VQLJiHXLz03UZghNOr964ccDvn3XeNv3u6Xhbj3t8Yj0ea0ych2ssnzr5YOC8Q09XJoukp3x91oyT6patYOyAJq1aBkyzGFVXZLmAvDuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2k1iVls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMMkKS3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2k1iVls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMMkKS3A"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UBZZMN4013507
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=; b=B2k1iVls70uAYgIk
	snrpdmdAwIqq5Ojpgb5vsRnNgpo4fqn4ZmsyTwxCfeX/nPSyMl12kudsfhVzHIKS
	SiI+xOKGVgq4E7iAMRWpLAUccqXRDmaIa5PnMfcp6rXrNo0UIgTOd+oKkcnDLpc8
	3743izqBfYbNMM7NR8eUXeeIUW4ky2xY6MiyPUfCpIaqGnsODOuUAlKj+1MngQEE
	GDHXLTtVPvjC6kiEAuzeLGL6T4W2FKAE+rqv/3IZu/VUjgssMVZpGOWCYEmUzvO1
	2dVtrZBmYaf7GTSGl/qmoYi4Qoyr4PoPV89I8d3GHUjSjuKGEOPsQv9/Oquz9+yV
	UdYbTQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7regrdey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 13:19:29 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-953a3a63509so26422241.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774876751; x=1775481551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=;
        b=cMMkKS3AcTvUhMpFBh9tvpDQnK443y+t8cMR6PEZbv6VOE/CMmD+r4QiFIlkkcpFYY
         bMRVEcfP6EcAKe2KZo9CgbkoIhepk/JRq8rf6htlmPnPY/xfMtRfDHb5xbegXRs0h5Qz
         aAziCFMeWdh+olLqRU4CjlDD8gW/0HvN0a9umMrJ+OYPE4j2kroFHufJyJSTqKQSpDim
         TWvTZCuy+wGIO2oPasiW4OKAfqg8Hw62P3kVpLJNE1ERI9UEMwMmloXL0CkWh3W+piNu
         h4B8+KZWfQo6Nu/TPxip13FT2oQVxrsNBv68ts8vaMEgph3419uZAcyhDfJFFj3G3NzA
         Gotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876751; x=1775481551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gp/uAhNpvhPnAUsObjj3qF3uuB/aBnDtd70JcAQP+kc=;
        b=P/zZpAz+AML8oB5W9+cvRHWE+EhjKD/IK7k9cjPDltsL38ZB8HOgu8/gg6+sl7XbVo
         DQUzjJu/f1kBRAr0b3sBR/WyE/MdDojSc6+Gq1c7AQtIgwQx3a/5X9lnzpm53n5IYMZ3
         ca9mfrLhbQrVA2wRVX8TzarHrqmkICYgtjOl+7oGZqyD9eq9BR9/ABjYEojG5/4AM9Y0
         +XJ+YqTRVQaXHisTMnNap3mLU8qd0ocT8IdVpj+Lncyr3DyQBIWDLrq5w3R3xn0g1JnI
         uiQO5PNzzbDrIDeDi7HIG0tD/gu4Vl3O0JWDKhsh9LQB5p+foeQ/LUdkZUuxCNPlSuiq
         RB8g==
X-Forwarded-Encrypted: i=1; AJvYcCVNwOzAU6XH9NiwYIr8gK1ur+IrVWB31BZ7A0fSb1jN7lepda5Dx2Oryjl1zEA57g/l0ltTJ5YSyw8+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3RTPM+4dlWdPe6x4EDr8NTzDo2UbKo3r5gBPpuIYNOiAKnadI
	gjFK/D84YywWIlrAyyvbb4F6iozL47R+w1pmM7ZReuh1mz2HrAbR2ARH0S/b5+r/7fcxzVK/8Rb
	ivWP7toWAToXFQh+sYT37Yr6DdfDjNheASl9FY9QTX0Y6riB6EjYMNEB5zs2uIGRJ4xNzD9c9
X-Gm-Gg: ATEYQzz3AYnbPtnnC4M/ItaMFcPowJ7guOfOdz9LfG5d9e358TzONcZgP7PuZsvY9hy
	+EtoHg/PGkoKFTEFy5eJfbzRkCtjer44MwrxGhBoKUo2yhY9AiAqaieykqplVj+8k7YpwXe27Mm
	2PU2GKwkwryKnFaCJWSlndAQAGXfpdQJNsKjwAkvCc7o07+LiaYudpIB0iPHvH+qI7kKQlwDopL
	51O8SskimxUB6dDVCtqpC5obWlCC1JAUZ5zFZxKHstUgRn2XvOUrqvaCmN9637cRxwLmeNdFJF3
	kJSaq993788NkVJINC5viibT+dUyclFN4fuLrNhxrRYZkPpwBifPkMqcA9iRRKTEsaPYdXfEoM1
	8TmZbiWKUDysuywArHp0O7m4c4i6vE2LstLg9leCscDWcJL2jSWHKQuOoLZ5VFEUFzxthEMG5ag
	9wMZk=
X-Received: by 2002:a05:6102:5cc:b0:602:9acb:64ed with SMTP id ada2fe7eead31-604f92f2a6dmr1649197137.7.1774876750971;
        Mon, 30 Mar 2026 06:19:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc:b0:602:9acb:64ed with SMTP id ada2fe7eead31-604f92f2a6dmr1649182137.7.1774876750536;
        Mon, 30 Mar 2026 06:19:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838e171fsm15451261fa.37.2026.03.30.06.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:19:09 -0700 (PDT)
Message-ID: <9214ca24-77a0-4597-9c28-12574452fdd9@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:19:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
 <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
 <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20062190-609a-4977-99be-c27df90ff321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G6wR0tk5 c=1 sm=1 tr=0 ts=69ca7862 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_JphER5ef4O4mSyQYpUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMyBTYWx0ZWRfXz5qgfUhL+zZm
 dywI2o8uHs/yGNa/CDbri0RsaOI5DYl5ZjUFGXXTQn41L4UcDqgaLIGtn9N3fRjetSTrtubz2ZL
 A6r8XYMo4XNMxUGkaPaAXuBi/fTSmkRYQqr1Z8lG2FzRYcZTTj0gZEXyTQEC+B5LSusnqx6pfCB
 BLVx9vjQEyMUO9hBVI7Bvo7D1He1S7W7qdZFpMN3epNwx36sSJBF5fMGQD22sykUPDWMqaNmCLP
 0/sydu18R+PE4dx2U6jyKdPXNrXV/6wZnpQDjIfIty+znKVIjCp9guj9mUMmKm1Rh+K2PDqJiu7
 LGHSPE/6yzw/tiNEWxXn/eBIP9PDtRKCb5wswaTH5tuHmXrPjCa9ZiM/Ku0zV+cUNaFcDCek2OQ
 YqGqaMBKF6uyhnex1420kp+QLHMjGKNH4PbfLm/zMSExluHskH3slNLgjyEu5byi0P0eYHXNrFZ
 TWmRc1396pzN54Ls0VA==
X-Proofpoint-ORIG-GUID: 7lIvIzUx8REWM5pb2-cU0fbx44IDaqrJ
X-Proofpoint-GUID: 7lIvIzUx8REWM5pb2-cU0fbx44IDaqrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300103

On 3/30/26 1:23 PM, Viken Dadhaniya wrote:
> 
> 
> On 3/25/2026 3:02 PM, Konrad Dybcio wrote:
>> On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>>>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>>>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>>>> the QSPI controller node to enable support for this hardware.
>>>>
>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 80 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> index 75716b4a58d6..fd727924b8ca 100644
>>>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>>>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>>>  
>>>>  	};
>>>>  
>>>> +	qspi_opp_table: opp-table-qspi {
>>>
>>> Why is it not defined inside the QSPI device itself?
>>
>> The QSPI device has #address-cells = <1>, so we'd get:
>>
>> Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property
>>
>> Konrad
> 
> Yes, I am seeing the same warning when the OPP table is placed inline
> under the QSPI node.
> 
> Given that opp-table nodes are not addressable bus devices and therefore
> do not define a reg property, what would be your preferred way to model
> this while keeping the DT warning‑free?
> 
> Would placing the OPP table as a sibling of the QSPI node (for example
> under the same &soc scope) and referencing it via operating-points-v2 be
> acceptable in this case, even though there is only a single QSPI instance?

I personally don't mind it being in the place where the current version
of the patch puts it, Krzysztof?

Konrad
