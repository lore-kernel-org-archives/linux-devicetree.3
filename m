Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7823B637E
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867029; cv=none; b=hZ/QYavFv7Afn/cMnDSvqTRIf7LJib4IeX8M08H5S58rxQJDK7un3DslMeCnWOEOsRPUYVx20a4gbnWa/WCZMjOLfj3m1ssJcK1/ZRP1QiiuhivBz5deexzbHJenopa53/vrT/Y65IBRDxLSHTw0X+83YO1+HdS15qSjB+AWAu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867029; c=relaxed/simple;
	bh=PH2rf7NU7H4QZ0yNX4oZF4lcydxQK2AJuZ7Vi+f7mJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kg+Y9YqUHZVs5cFJHjWm5VjpjR66SZ2KGu1EEsYeDKpgWf47RcH428Gt920FBR3dO2Sd6/2lqdSoqYN3Cq7CKVonzI0nG0Yu3TWOXAc0Y3AtKzHjYcOZBNM7mifnMjv9FvqTxEGfQHYgE+MwF0Zl9FLXCG5gjiVYQPCtS5bVrPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3ypco1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS1p1B1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3ypco1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS1p1B1T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6Snpb2525265
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=; b=C3ypco1n6kElFmha
	S67qHbM5Qo8zJA92+x+fKJqdd90pl2Roij793QhB16fZutzv9lRXlHk2zS+dVjyP
	X/lBSyfgbsmGeZiTlA70gbaVmZp7iTGd9QgPjGn4zIWdGKMjbtKkMuyuUlnfRGOi
	dpNUvjsiua6CGDCp6x0etBAinN4lbD527aMLbSNuY0w5zUNbXhPE2V4cxgq6LQqu
	fZaKt2/usIhSOppWBOz9d+K1Pl4S9or+J4smLyjV264WbG7AexPbGGnUf8v5sA7k
	iVqLR+75JY2gtI5NvRRFTb5TWCW6QzMtz9cWrQu1elbvVeOS1D/Y88yarAToiRgS
	meeTkg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmku6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:37:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccf10567dso21657686d6.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867025; x=1775471825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=;
        b=LS1p1B1T2+3UMGk2eZL3NZfsW3rIwrziQT9Q+1nEITvO0cHxifm41oXrEodWzwvhtm
         ngT6CEF0aBAMhZbjv6r7EzUCjNKTbz2MbH67ZiQkDv17IRd87k8IpiIbWYDY91zDLUBk
         KmcmESrIv1cG7zmmMImxgJlg36+vft94V7tqZvS8CV1ApcpUSS7WW9IVebaivOAwyjdM
         rGZ1HpwvmRJ+0WoZGJfT3M78NVUoIa0FIBfnBUZxplo8r35MQx3h3eamfILryPXoIGSe
         CE0nbcc0YB5Zmp0hWU+trrij1WrwG2gu0htFc7r+hnvX3m5gDMTjecxOElSGqYLQ51uh
         TbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867025; x=1775471825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yvk2IGgI2AVf5dAObXEYM+8zWQ46Pknu0lBsdwBj8rw=;
        b=ZGqh0IDvrtx0zPuCAyKdiyOx7qI6eJwlEfe7TOiRbUbWR3ni/4/B8qh2qJe/DtYOry
         MM3Yfgj1Nb1kJ2nzeJdZb0k8jb7r9tZfgp0uDRtAq6CxnWD4G+TsaRFD8/QNE0NF/LLB
         NdjYi99KKjulWYIyE7bSVXL/mqGg9XjlLz2cGNbJANFLnazTyOlIAjoVtSaNn0YFeL9U
         rj73pVztJ/lUgK6HiY1kuZfGO09tVM3PHXcfy5vBC83RRjZCP92kDLm5NfSiiYpQufAJ
         iKUAzRleIDfQf/5/4Sij4qSdQgd3QdXczz8EQQ59mtLUaddPXsH9uVztlovPGs9sxte7
         0Qhw==
X-Forwarded-Encrypted: i=1; AJvYcCWhztkC2pzzCPpzMd2slOGQrofujsHCtrriOHrjDGnG6hXdZpDb2OiPSR09B0rK4gUavi8LAubSDQMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PQBvf+ZTsJtMzfJCzc28TLh08qzbhPKppGWb1BsCLQ/5IDkE
	Bi10k/9C8pUgvmamnT5Wh8ogXSIoaWogBL+3IbUpoNUeB+Vx8w1uksrM//8tlDnQWiZOG3EqIQP
	A6F4+ltZezhBxt6XjkJEUgXvoc5EXnniRVREs31c0R4zOHudR44KLBn+L0Wq6ErDU
X-Gm-Gg: ATEYQzzpp+AdiG7AyIhu9zerdiby8aa0Z0FZXh0nzPZpVg3RTvaUDbWPqqK5epb9cIJ
	yasvZytMSZdiR5y6EqyjdK5GkWGa/WfSky9EzUUTw2oPxpRsPRAd0pQqT1gmnU78Ieqihcjkuad
	GXnwURSWV0/FhkZ5c/teiiBpOBB4qL94svrQzn1sDdWD9SVfYdsjMfjS6e0MKr3eZvD0rvN9hIw
	BH4ot8KiJvWJ79qSkW30Ja7x1eotvtKsnFk/kydlIyKurNQAhcYbC9cUn4f3HCwsP0OxgfGp50v
	yJ7QRYHhXROh0LU1lHmpt4+L9sugJD3GfWganO2eteav0OzWpJ5x6YaXX2e7WqSUF6UcG5bhar1
	YaIytGBq4h4TBTmuG3UNITlK6Nr3hywwZfctIQKNFfUtPu/VllEO9ZAYTizrI8syDL0OrbXfJfy
	jp2Ho=
X-Received: by 2002:a05:6214:2b06:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-89ce8ef7aa7mr130720956d6.8.1774867025026;
        Mon, 30 Mar 2026 03:37:05 -0700 (PDT)
X-Received: by 2002:a05:6214:2b06:b0:89c:c7ee:fe96 with SMTP id 6a1803df08f44-89ce8ef7aa7mr130720676d6.8.1774867024499;
        Mon, 30 Mar 2026 03:37:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae527d6sm287911866b.19.2026.03.30.03.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:37:03 -0700 (PDT)
Message-ID: <3447efbf-2720-4c9f-9a74-ca9baafa96ad@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:37:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: agatti: enable FastRPC on the ADSP
To: Sumit Garg <sumit.garg@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260113-agatti-fastrpc-v2-1-b66870213f89@oss.qualcomm.com>
 <acoCFMdKRviiMZRp@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <acoCFMdKRviiMZRp@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX3V2Ad4LIrQ0Q
 9uZOtTF1zJAcPTFWF4bh/5YnNmqeShfFbw6LSXxS7LE2za+oqPEGv5n/WMvEnTlrzXsDdiSLFs1
 Fwduhnd/hIIpRezcv8mBQb3B4nD9se2xAeO4U7GJmJob5NaKTVN5bR+lAf7tXzut4qGbwfxZLki
 VetJ1Hl1NvVEoEE8cW3p4yitUXlLxOSLuchMKycEirNU9uzK8XO5RkGDEhe/lLTCt+7Y+RulB5X
 /oo3hUmc2ZUR8WJEc/HMPyuXrnk0a7ChAYQAiMNw8hpPZQxUwThGo4YMv8fpGwTB2MTl12LJL5b
 HFCZpCpCpCCRF5KsWXva4yKJaBsPpcwgbpR3CB3RqRwUpeyTyKfxBffkXZq/u9nSwgYV4cAFp9b
 K+yE7+zhsxDWkfJN9UMesjhppcgg+UlDt1jwnmRPRZiYjsLq1Qz3LZArFJSbTTtKSoM+TOE2Z5t
 xaNqdujKZyQ2W/KsF7g==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca5252 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=CYZpdnPDpq_JZXBEtmsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: G2pUIztint7sSkXTJ3Iya3heU4n2hhHi
X-Proofpoint-GUID: G2pUIztint7sSkXTJ3Iya3heU4n2hhHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300083

On 3/30/26 6:54 AM, Sumit Garg wrote:
> On Tue, Jan 13, 2026 at 06:41:59PM +0200, Dmitry Baryshkov wrote:
>> On Agatti platform the ADSP provides FastRPC support. Add corresponding
>> device node, in order to be able to utilize the DSP offload from the
>> Linux side.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Add more FastRPC context banks (6, 7)
>> - Link to v1: https://lore.kernel.org/r/20260113-agatti-fastrpc-v1-1-e210903ffcb1@oss.qualcomm.com
>> ---
>>  arch/arm64/boot/dts/qcom/agatti.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
> 
> This patch causes a critical boot regression on RB1 as per the CI test
> report here [1]. I see this change already landed in this merge window.
> So, either this commit has to be reverted for v7.0 release or an
> appropriate fix is required.
> 
> [1] https://github.com/qualcomm-linux/kernel/issues/359

Why has that issue been opened 2 weeks ago with no action since?

FWIW, copying the broader log from the LAVA job:


[[0;32m  OK  [0m] Reached target [0;1;39mBasic System[0m.
         Starting [0;1;39maDSP RPC daemon[0m...
         Starting [0;1;39maudiopd aDSP RPC daemon[0m...
         Starting [0;1;39mAndroid Debug Bridge[0m...
         Starting [0;1;39mAvahi mDNS/DNS-SD Stack[0m...
         Starting [0;1;39mBluetooth service[0m...
         Starting [0;1;39mD-Bus System Message Bus[0m...
[   17.318840] qcom,fastrpc-cb ab00000.remoteproc:glink-edge:fastrpc:compute-cb@4: mem mmap error, fd 11, vaddr ffffae380000, size 262144
[   17.327877] qcom_q6v5_pas ab00000.remoteproc: fatal error received: SFR Init: wdog or kernel error suspected.
[   17.343248] remoteproc remoteproc1: crash detected in adsp: type fatal error
[   17.350567] qcom_q6v5_pas ab00000.remoteproc: Handover signaled, but it already happened
[   17.358869] remoteproc remoteproc1: handling crash #1 in adsp
[   17.364730] remoteproc remoteproc1: recovering adsp

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
<ded>

It seems like this only ends up being a problem once the userland
daemon starting poking at the channel - +Ekansh, have you seen this
before?

Konrad


