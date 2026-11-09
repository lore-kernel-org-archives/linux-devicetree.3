Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235421;
	b=RikNH8Nd7d5J5Vk8v9Jl1/3h3tEMfJ8If32TtXCKeI/nWbp4RAy0nEQcyZlCWtS0ypg/
	 KZI61p6boGTe9La6UFmFszsrkh+awdfN8d/g7H5G08S01je4SBYOk5M+KOxi/IjnzeasE
	 XkxkDWjl/qNVIfcppePFnBRtKT6sp7AGtRbEc0Yz4pLouCxM3sQfW+QsTH8PAkHW5xeL6
	 kgJCgsJ5QN0NSxu4otpzQg806XNAUlTUmL8qIZJxdPKQZ8MQuH1HMF87NBniCj4TRxJgL
	 d5PbmYCJQ14XHKxZt5z89z3vtjxQmP1rejIQqn52vpu9OLhiMW7O9dCDUqRolo4Gfyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
	b=aa+Sit0UXCmn/aZtdd+sQCsMH3MAiLnpMLf4wIahjL/fu4xV6lxP1XeIZ/s7wZzmKKjz
	 v0ZQHjJyHxF3d2V++warUyu2XPDWx0mj+FOl8KH0IULmZ9mauiaBUrfzPCw76Y9aRObKm
	 sxpiU8qfwS7i/fLW04ED5kAHrrQbx1E32U+5uXZOCAyOSnO05vpMf7D0bMgTNdF+2/T0L
	 qJZBVRqcM5bfIu7w5ZEkGhLfmyrCPyT+wnAfbetajOtBDek3oR+x9PpIacaVUhuj1WCR0
	 4khV9CMuW9BYoSIMz5EFzXYSQ3iU8EzvNnslwm9QqjtZ3F8rHRvQIh7/H9QZKCf6UPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA3bYcBw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kF1vO/0c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF78606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF78606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA3bYcBw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kF1vO/0c
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFDah310894
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=; b=RA3bYcBwND/tNCjZ
	cLdRZZiLcq9T4Tklbl+Dt6rOJWygToA2gxZOesvz87r8YJ5purBXw4hmnECJLmV8
	JNno1dtpA/shkpgHDlc0nPGYa2QnJ3eMkSd3uPTk6NA55ELLs2fu8GK9g6gZLpIX
	mia91lxuavmbHx3G+WBQXIpPXFOizggz8ZEqmvj1/2dB/xcO5gdF8tzSs8dp7i0E
	Otwdmouv2odcrSLJErRe5e901TkYItRjVrEH9Xo8/67C9qKwprXM8suGai1rEOwH
	xuW7/FbPLLoiln6bhPuywPK80bb5LRlwVaYzY9ljbx6O7ux/5/YvlTD2kAqxAILJ
	DtxdyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8uqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 14:43:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso110034a91.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794235420; x=1794840220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
        b=kF1vO/0c41w+oEce95lRzdSo/125zmTTbMBK/gEKuWnJ3AUUap2TrdhtvZzIwnWJNq
         +Bh0UI6BjZTqL1aINIuusS1WG9ScQb1bAgOt78eCox2a7Ee5tfgwAJ0r0GVoUxEQU8V9
         SdiS6pFKiu2oxxeDMwMed028B39dS3KbijljM3TSmCpvoY8XwzeTqZ6njpsM9zRuAF3P
         jbvDIlqm2RqEzy3igVzl6OyJkkEq9Upj6BjSEfA/0++X3BRUlnjPNDGMWhf7y03Gw/c1
         GR5DhKRrI+GrLT1N/+RlcAyPuDoQTsgjWJud3hm9c1bnmXID1T0hTXuCPDJYuXzlqSo6
         1A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235420; x=1794840220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=js3PUCSX9RGe+iWVpuwLPjnKS299ziJYM/TNs2sZ3KQ=;
        b=pGYJTgmVQbjiHGnn88Gpp8ksVgan3WTGdnm6lXYIJOrhH3yXglQzze+P9O1i1kr/Ur
         dg6xavaw0DJEWhxlgbAcI91XCtvYbFbJM+iecC3Kv/AwIoJqk8m9nVFgEk+NqOXesThO
         YEaCJC5pymp5AvucHs+4AabZHcu/+YeaiEb+3fgzurgobRMGVDWcn0t6MmjPuTQNkqJp
         FErPKfEo7S3ur5BWfLbtQmQMwxrlv5itXFAZsLeihxT5OnIrSQcH0LRCC4mVPcJE//Fp
         HnMHhdfZz8k5pWwNvG4t3h7lz6icwNCW8J9j4YlSUQk1uUfnYdTsOq98cgj70f1uOEJa
         vL8Q==
X-Forwarded-Encrypted: i=1; AL+hErFKnxryFWsyAn0YNWq/hxccAAVDa1LbYzWZ85RNoRmjCCCy2FnpyV602xZf5t7BSFCCcugnCuj4Z9GQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/K5SSuHL3AnQ9oqiA/ixH5+N2tQadpLgReWsXeqD9BKhZ/lBm4
	X6PljNRo6aSV5RAFrwrRNlI8SSZjhry1sNGtDhQM59xNbWTu2MrExZKyLx5IN5uOhAmqcW+P1Tu
	6lK+Ylc93U2Rit7h/pDjPd57pw9wd0xa/em9V+/cLHJI3YaZeQSt7C+3FlM6g1lf8
X-Gm-Gg: AYBFou0DLsEgbl1h48v3rO67zvXmtSB49s6FY1GDLtTBM00ehLBV3pf/M+XnlusyFcj
	3+fFGSvLSs4dGH6zkUQ9YnfAPLJijq/sFnpBeMnrZkQH78N9nPLX7JQlGAhesOiMSyx9LgP3Sua
	q1LbaKQRroh1OriblMoTAeFoqDHBZf8GcG99fjsA+LrfO/i61ou/rCYZiFxj+62xpwJg3CaLWSI
	VmGyaaTRTSoT50o2RNCCeXUEHAq2dckrzlpAfmfNL3Hz+blfdouvHKgelUYLJxn/H1TjHIwlDSi
	f9n93BkDC/MXGcNjxAh0z3Yj+TJuNAcBQO7MCihstuePWxjm9YF4eaf/1NfgCaAaQxfbnXSSGPC
	xb2Enb3g0xQxNHoHeoTEDuWY+wA+LCV98Iko68s8wCbnj6VQIeMgXXy4PaGxCs57nnq/A2J3Uec
	q/bw==
X-Received: by 2002:a17:90b:5807:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b12d3d2aa5mr3285280a91.45.1794235419730;
        Mon, 09 Nov 2026 06:43:39 -0800 (PST)
X-Received: by 2002:a17:90b:5807:b0:3ac:c98e:345e with SMTP id 98e67ed59e1d1-3b12d3d2aa5mr3285256a91.45.1794235419245;
        Mon, 09 Nov 2026 06:43:39 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm7129841a91.13.2026.11.09.06.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:43:38 -0800 (PST)
Message-ID: <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 20:13:33 +0530
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
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261109-stimulating-oyster-of-respect-620b7b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfX4IaxOZSi2VUE
 IVvT2oTWAHKfDDWpIyt+ZYFl/x6hN/qyTv3HylW1zVQEARX1DMdvNGw2MgVfUFsUx0bFzsuUCsa
 gSWhYB+7Ox2YeMXNykdjueJxzDvY+fj23S1QIQaIJf1IRt3Di2MHEybvKnctcwMxS04mqGgWOd4
 djW2ILumCp7TXHy7OWlFNsbkJTd/fsKseSTG0c6wXL8OmZ0gM2XMp0+DrQ0tXCY3ZVG0MxsuQb7
 LlqpWjS5jMNWhQrVv36MVqT4CpMYmrPKgDdGPJIlY3l9gJkMmssw/Rl+qlj2ctia4Bh1t9Ps2lb
 6vWo348P9M+7aIKXM/1A2M0pNJXaaZQXif5lynkxoaYTbW2jtecQwEBD9M/UjURPJZMCF36q4dg
 kpwuzYqhlSXmCM9Kn6arvew8pOGRcOlbUvCLMtt9X26gUEZcZFQQtDPRu/vLnWMCCtcaM3Xfi0w
 31xCKen3ebS+V82ZK1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OCBTYWx0ZWRfXz2qkDSi1Hk3d
 y8TxUmAPAmwrPZtKkQgAIWHdkZV/ySHy1ugiSS3z3c665QIdg/xa0ftj+5pr6ic4UZBq9YaXB49
 2sxgiw3hqejJbWnW+h1UXo2mRflp+jM=
X-Proofpoint-ORIG-GUID: mE15YF1TeGmVCYJxaPCO1W3Ev_eI6FiJ
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1dc1c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rLV7qYPEkEEFJh5gh6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mE15YF1TeGmVCYJxaPCO1W3Ev_eI6FiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090058



On 11/9/2026 7:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 08:31:22PM +0530, Jyothi Kumar Seerapu wrote:
>> Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
>> this value to request QSPI firmware and validate the protocol running
>> on a serial engine.
>>
>> Extend the firmware loader's protocol-name table to accept QSPI.
>> Reject unused protocol IDs in the sparse table before looking up
>> firmware.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
>>   include/linux/soc/qcom/geni-se.h | 1 +
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
>> index 873bfbd6b2b7..396f3d81d292 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -122,7 +122,10 @@ struct geni_se_desc {
>>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
>>   						"qup-memory"};
>>   
>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>> +static const char * const protocol_name[] = {
>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>> +	[GENI_SE_QSPI] = "QSPI",
> 
> Why are you creating holes in this array?

Hi Krzysztof,
The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the 
existing entries cover IDs 0–5, so the designated initializer leaves 
entries 6–8 empty.
The added NULL check rejects these unused entries before accessing the 
protocol name. Appending "QSPI" directly would incorrectly associate it 
with ID 6.
> 
> Best regards,
> Krzysztof

