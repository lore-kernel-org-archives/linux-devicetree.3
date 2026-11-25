Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613406;
	b=X+3CuWdZf6aLqNWz71ICCXL7zI9TJUak9S65jPrVfT2kFUGfkPYcwkoa5MlZ4CmlGn44
	 yclJZyq9aKG7VNK8knUIlG1XW8iRGs75NYIQxGROwsIO5pfZIcEyAafu83maSkY24n/KS
	 ZzrBOxeUBnzC0sQQoiGcfX4dyBciwl2EgjwgD8Nz/Bc/n/G6c7a9ib2QYmp8qu7DKBO0A
	 0rD9yKsBGcx7jHp/2wx30AGVjAOAFmjeKSK8uOqfu46/rHpo8kwDarouTJBcZ5WGjPgOP
	 bSeLvv5og2qxODbu7Mkja1aVwtykI+uRLafvuH+zudY4yxdhj4CAOwWFCXJ11wDYQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
	b=MNAlHakRC8dMOoizupk8iXASPH8E9eJ6qkJSkS33geBpVtl1nPlMBjkNpuF4H03scWA9
	 Id7Wf4kEqKMmp9OsRBIvpdci7aE5GyfLy6WoItM2/JwxbAiir1fqm9YPD/LeGx+ZSVoyf
	 Py4e8LDXYcsZK6Ww7/edCU40ETbiqpjO4Kap/MklgU5H7pYRCkDLLfQSSGd6FHdh7fDvW
	 UEn4GJAx796nodtEbFUbGUH87qU0hGf2R1YK+pDyCi8NQtUCywyUSk5QwP2hCIt+EIbCX
	 AjlL4AT/fhwMKJuSq3LKf9PZjque6FpfKKas85wtaX2BZ+955rp+9zXWIdV+9McvUiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858F606A337
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4858F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9nkXB1505235
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=; b=F6sKIbB1nsAton51
	paC/HxwfC9i0kGF1D9KX0zAFIRfCWqW2aeJh9oyVLl0UnKGQcq3kwi+qrTkjRXko
	zuy7pubBK6K7yvaqsAVvB1Lpu7Fu0BMJrnCf6lJ4/ZPteXflK8hoOttyeCZbkk4G
	9BQ1YFw6tsrIilIRMmFEdGgX1ZFihlDneueV0zmo919xxM/HU7rnLLWvwBvhDGTl
	26VgkQeU4UtPIsekC9HB9IIu5SQJfE3WDZMGxAetqDZFxeYV9EAGeIlq9RbIpjAf
	0HgZwofUi6zcUB3xXDdYGCh5WMRYq6bNDo0eOJy2UClk4BjnSZ1BK/xVVSP7jCy3
	N0wVyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2ad96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so1007568585a.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613404; x=1796218204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=dF7U4VqUeXP89S/oo+7JKc7+IRUJEeScod58I4v9l/XRffoYx/uBuVa62RIhf8XOsB
         3tzjZBCqUyHD3P1/KheTIPn0m1XbkRj3Pk8a55CRcy+lFuCVua2Jf8VJcYSnv4G0zSRK
         bIqCvOH7ceLXVsM4lLH6CPr9LXcR78bWU3D835505iEBXx6/ilHrPuY4ShyHOmk5b//V
         w9kaWNtWe2bBA7mRbNvqU6UU2bEOL1jTLDLy5BjIrhWFziaofRjWa1GUtXWsaoNWBKy8
         q9WpJtCi61vHchhGTRxaSpXvJshgVKqs1EHhCr7uA1jYvdbh5O/A+pgzcSTWdFLAOAAY
         1qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613404; x=1796218204;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=vVrQfLA3SjMqe/7RZkq2LC1GuD/bhTGpr5DzG69w3fhK658qISCHwBynQaPK2qPUC4
         h2C5G9/XWurwdffdRgHGD2rmS77IEFKS9A7WoYoHmuvypcdcRqGnKbAV9BM4s3a9hEqC
         j/hATozYadsqtM9TmVC0K17YqMUjGlLGZsMt06bbHskunuMOcvqmN2q4nvZT6HkK7UJV
         1CevlO+3b4nIIGkIea/HoV3NwvwnCialkCD8uPsWtwRsNQynO5Jy8VajycQgTZg10+YR
         H38apw4bQXw+H5qIs3DEyOh7D+AZGODMjDqotZ9IQNXCHrq+oozbBgmWKCWCIX094qmK
         wS7w==
X-Forwarded-Encrypted: i=1; AL+hErGpSVSZohruzmT21NayggStEqV8bXXon+7u+l+s3rYCMi694A/p1sidKPdbrZqZnJ0CecbImweO86UM@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zs+QUAT+TTcEf+7+kLyKCZBE/sA2e/cgiX7/yVwIxi54/XJP3
	LdJ5N0StgtR2Xy7y0R2VBSTXsqwkJ72Z5c5VLEaPTk34ZbOA9FOp9c2P0sfLCxhrSV9RJKJH2wd
	/xqlut+Y5ZsgOwp8XwiUq1OhjNzKi0hegvLfr1tYSJ+wsRy1gTpeqLNQ4yKQ2iJpp
X-Gm-Gg: AZFdTZfYp27FX49IdQVnsWKRxkUNzvNa1LOkjq3CniU2pXfs0vIeGY5Pu7FHzdELzIx
	6NS7Z3lcd24AMsbnR+KjezJXjDiEULTw73c/eNSJnjiMxmO8NKIUlbP9CjW3tGHYFFsGjGEPf6o
	UMH9MkDE4EBpW8c6W6zUfXPWFpxclo0KcQTWQyp9VemZ4ROF5yxmLpiD+exoORBWxeKbJynmuE9
	/V0K8LBh1YRAHmhu6TPU6j3/AiWYROnVmBCc5RXrbiKe/fhHE5APQa7xD8T3+2Cgl1w/Db/ZVtB
	FXBLj+DTQLMCWQaVUrpAeN6vOKAPQudGs9jeBxHi56FuhAkTUlZg8+03vMDNo1MtCY3yKaJk5q5
	Cne2mydPmcyr8cnuj3gsnSNqJp/+LXSY2tx40oHv2cEZHxCJ2eTsJziibpeL4SYDb3QN93ZkutU
	WDAPLtele+jxYZOWSVFcVeOF705Ojue44/dqDOSi4=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328609085a.36.1795613404422;
        Wed, 25 Nov 2026 05:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328600785a.36.1795613403766;
        Wed, 25 Nov 2026 05:30:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm519677145e9.15.2026.11.25.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:30:02 -0800 (PST)
Message-ID: <f9190246-ea4a-4dde-9ef7-e29cbf6c5908@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:30:00 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
 <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3tTxVpzId2qvjnwbK2QlVKtqZuaveuMS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX01B4aqXAVORV
 lxwlldh5x00bikzpwN0bhnZtXpC6ZCrHYfC7336OfYJSzTna+efOSMxdNeTQFTk8ilT7YGL51YJ
 NAm0xEJuYvSEMPdSH1Wr2noTticif0Q=
X-Proofpoint-GUID: 3tTxVpzId2qvjnwbK2QlVKtqZuaveuMS
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06e2dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ks9rPHZIzW2PBVneSSAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX/pMb2Vrth6TB
 LHGFPaM6zobtJ5iPYHDrD5k7PnZ1ZEb4yU0sRJRUyZtxBz07zBVfRDgFklTRvOqcZzrt5W805oX
 Z6VeP95OgZXlz5kl3+Fhn3/v3O84EJgtWFqfWi1lhy/zFCWA2UNb88G/rGwBJhVPtgLfcYRHri4
 dUWEeFUl5YndTCl4pow3k2CsOtolH2GMfj/tymY7NwBD8kO2EcDLSjM/xihphJzos2iuApCL9sS
 3Y7OnHzLTHSPDiLNBpmKrU6ZO4vywSOegUjEkRSxV9E5D6YU9hc8UHu9e4ufNKPuAg61Q2t05BE
 gezUOmi9J5ti4RUlaSS+oCb3X0xJ+kFgqc2xP1uHQAC7D48u7medzjM08lzpCZg87c7/8Gfilb+
 Qo9tOmNe68JSC+vBy8AT82xQJ5L407QCV0B79yjtTGp4X9Yyb8VvtT333A4Cx4Dnnub8wuoHuji
 kMGTz/KZHxSHSOQ6r3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

On 25/11/2026 12:14, Konrad Dybcio wrote:
> On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
>> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>>
>>>> True, not ABI in meaning something agreed between DTS and driver, but
>>>> the values are used by bootloader, DTS and the driver, so I would just
>>>> leave them as is. I rather care about not growing this for newer platforms.
>>>
>>> Right, but they are compared against a hardware readout of a
>>> well-defined value, not against made-up indices (i.e. these are
>>> not bindings). I really don't like this ending up with 2 files
>>> doing the same thing.
>>
>> Not two files doing the same, but one for legacy and one for new.
>>
>> OK, let's drop the bindings, but then what do you put into the drivers?
>> Hard-coded values duplicating another hard-coded values from DTS header?
> 
> Or we can have the defines live in include/soc/?

Then DTS cannot use them...

Best regards,
Krzysztof
