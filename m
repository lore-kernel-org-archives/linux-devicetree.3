Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD0533ADB9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367569; cv=none; b=tMeWrR7zwQpyH43m29sfUB0AZM2Ku96oDMcBhPgFjSMamWglZX/qUypChvaimW8SYuynzsm1uwuWiRrURA22ngQe3GPaV/1+OYIObuomAxsX7ToT72fB4io0/7+o1MXGoPbMIM/E5W0V6Zb7NgLA4IflEbX+rQlaydyC9flePiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367569; c=relaxed/simple;
	bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5XKejok0nABsLX/bUqWHGM/e4VL2qw6ag+xYeC2J1KxY23PyBW3B7PF+kq4LHjaGV6szXZOlypv5e1KxY3sL6aGGi6q9q81rI8STNnWNlT29xIXBqMoQnw/J9xXeJH4dTiUbCQMe5UtTo052lVSjuG2IoNcj8Owc11y4OU4NCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bb5E48/W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9EVzJjU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bb5E48/W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9EVzJjU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S60o8w241140
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=; b=Bb5E48/WHkMcUQN5
	qTc3Y2bO0rNm4QpiICkyhIxbVSQZ7j87CTqWYfkkF3R6sehoF7awpWWV0dpH9v3Q
	JZYe/+Cl3SngRS20Qzim4iVJk+oyj2/9NJRgKXl2Z9aRZ7+kPjw5I/ZYEdZruxuE
	AmjeivTQxK89DsB00ofLhTOta1/BPjbXjx9n7+iki7em6ZV1teecxIaJ1Q6oYT3c
	/90b+TqoDUChueM7Ohao1+8nyv5ZO8n9crkSR4MRqeprSoviufuyGH69G596DCuk
	3OyXJA48gVW3zbsxnGDVOay/GDcK38kKJcK9mNJ0qRnaWwIDQ2OKNhMSa6FsyBLO
	5uLtLQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946uyde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:12:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so5907633a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367566; x=1777972366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=V9EVzJjUemFEExHHNJ2VwarSNdhHC4xRGTG5NjfNPBCzxI9XsowbdtaQ2WIRnw3rUW
         J6aHoHg50ef4F9zLftA38t5Ux2aagPPx8dtEfQ/JLgln/BMP8qDFez8/0Hu2xkB0ioec
         ILqIeEOpPP5PTXzzxwm6TWC99OUYBA999d2oeKFFynNCGs6nlTdO1xxRtb9X8FGKmv0+
         aS6rwigY2ZklQqtF4yuhY0+uoMktroKNS3RYUfDM1uKSqFumFoNrDg/AnUlhTixgyYVy
         2JaO+/FkW5ehQJ8vQYq/+jK6iHht3eO5XUVLNOKI257CT4qdfBk5v+QZEL5if2SYO2bJ
         a1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367566; x=1777972366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MF6Yl0cb4sJbEESk0My1jj9Kp3v8QAV6KskeS18l3tw=;
        b=Kne1gfvupFgOk00APzVGrNeBa47t4lEY+YulDENms0Kr1/+0AcfmaDHbOU49s4qLjW
         EpQhje/JZxIUgNzs8AL0Qwt+imDb9mvOJj37PQ/CmPk8R24yMkUCGLua6APeEiXUziEY
         IeVYKBx4sXaTeKY1i8Qz7SQlRJv1J84pb5/bAEjcCIgUHFAo+OBdZdkol/aOeECJlnqh
         9BtV0lSFAnJNu4Y0fsRaWyrLyexH9dt6i9jd/6L6To7qUQq/tLjtiMb010W6TwlK2u+z
         K7Q9UHKg1nbWJazc7P5p3bISPcpBFMkE9Nx+s0NQVcy4PJKYDsI/kkjfq7VglnS684B5
         K8cQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pWQbiSpG4Mz6MK+XCuoxyHk+FaXNot5Lg/A34+CMB4nnF17ELrjKIScs4nO0sRKuHZVro2ZY9nGk9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQN0obHVU6xSKQ2i2KA6Xo4tWJM3KbHCmAV+J20VFLtgJ5Ib5
	wIxkTIpLlWonw9KxGaVILP9R+mAu3mYVv2zEYsduOSSWe18L8W9uI9jxpg8O8OWSbMFcit1+Q70
	ti5dwL3lTQv8EqG4R3K4QidSOR/FzD8imXXf66y0u/pmtIrPDcKYRJq5Kekj0ez7J
X-Gm-Gg: AeBDietjTDQ6MGssUeHK597cyiyvOFarWXkw4WwrxgGzMjFy20+iEse2d3Weh55/URX
	Pxt/toxGbE4eG4tdKrncbvPEsNwEXTpatW9QKdilDLKSQvq3KPkNHMrcgcvrUw5IaNl5/njwOB1
	ekUyMo8mVrgAlRT2J0hwrzV1igWb4q8lYqRksLR+FQcnWa+ReBjo1g/fQ2yUymLmYxduaype+Xg
	G9ATy8PmzUAhNR7oWft+SFJuB63yTpO3/s6rrgeAcLKWMxUpRXhGtY5j9MTyhZp9+NDf3V8HHm8
	HBJOJ+1X5cpe9gXJ2vQtNCkQUyv9zKRDZ66bDAvMwm+Il92XJ4JBsbu4/Hphnd9gDtMsffBtlpd
	7I7hFpUlXrJ6Ztxk2hMTVCPup/WUKAN9E5ju3cPdTzhmWLS2RxZqZX6dd4SerhD6h
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2019047b3a.3.1777367565618;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b50:b0:82c:9c90:6ea0 with SMTP id d2e1a72fcca58-834dd246ac1mr2018998b3a.3.1777367565123;
        Tue, 28 Apr 2026 02:12:45 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00e40sm2480834b3a.12.2026.04.28.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:12:44 -0700 (PDT)
Message-ID: <6ebe28dc-b8a3-db92-0e66-3f0541e23e13@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:42:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
 <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
 <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f07a0e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=H8TGg1LnFfWU2mlYB9oA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: M890GpzY1NxAAqaMX7BaNmGCc2WjNLU9
X-Proofpoint-ORIG-GUID: M890GpzY1NxAAqaMX7BaNmGCc2WjNLU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MSBTYWx0ZWRfXxM/PSdll/FMm
 Mq93q0tJnLNKj7KE9GxqciJZDJ7raI2VsY0oiT9X71MjI22aVcOUtk6WaS4a03vosqYVBLO+38N
 nF7fZnxw8EeXeqgYVIfATPHSnZ9nUbwPKU+6tNzSSABiExQa7FbdPe5+vhaTqLP2Zdx2VuvPSRb
 Qa81TSpPr7Mr/Rxqg3MTe/IBTYDuaYh/ZOVHb8VlsZ5OMjAGHUChJp0qbzap1/hTkkL54fED2HW
 e6FmpKc69YUrq9MS1Q8rVq/fbyzWvfuPPI29tPwyz4BGOM23OE4tdZI/S0jssyglkjqm2CPzX+a
 HBTm3SsBH2yWdXOyjn7/iTojuJ73k+MRx+Vf6GQq6sTM1J/TyJ95z2Up/3rnCiBfCaZjhsZfmPS
 yI+ZevB2k1F/lC6QfNUB+JTxY05QorHCDt/S+v5Sym67Zm436Rxe0f2rwY4JdsnX6QI1EPsKYeI
 0lPqwEeuvymNbzr0abQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280081


On 4/28/2026 1:58 PM, Krzysztof Kozlowski wrote:
> On 28/04/2026 10:08, Vishnu Reddy wrote:
>> On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>>>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>>>> is a new generation of video IP that introduces a dual-core architecture.
>>>> The second core brings its own power domain, clocks, and reset lines,
>>>> requiring additional power domains and clocks in the power sequence.
>>>>
>>>> To accommodate glymur clock and power resources requirement, the maxItems
>>>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
>>> This is a very confusing part of commit msg. You cannot relax the
>>> constraints. Each device MUST have a specific, fixed constraint. It is
>>> your task to be sure they are not relaxed.
>>>
>>>
>>>> binding to inherit from the common venus schema without duplicating shared
>>>> properties.
>>> That's obvious. Why would new iris device schema not use common venus
>>> schema? What is different here then that such possibility exists?
>> Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
>> requiring 9 clocks and 5 power domains. The stricter maxItems from the
>> qcom,venus-common.yaml takes precedence, making it impossible to accommodate
>> glymur requirements without updating the common schema.
> But so does every other device, no? So what is different here?

The difference is in the resource count relative to what qcom,venus-common.yaml
permits. Existing platforms like SM8750 have 6 clocks and 4 power domains,
which fall within the maxItems limits defined in the common schema (clocks: 7,
power domains: 4). So for those platforms, referencing qcom,venus-common.yaml
via allOf works fine, their resource counts are within range.

Glymur dual core architecture (vcodec0 + vcodec1) requires 9 clocks and 5 power
domains, both of which exceed the common schema maxItems. Even if
qcom,glymur-iris.yaml explicitly defines maxItems: 9 for clocks and maxItems: 5
for power domains, the stricter limit from qcom,venus-common.yaml takes the
precedence, causing schema validation to fail.

Glymur is the first platform where the common schema limits become a hard
blocker, unlike all prior platforms that happened to stay within those limits.

>
> Best regards,
> Krzysztof
