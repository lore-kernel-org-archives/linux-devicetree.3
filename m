Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864563AE190
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230984; cv=none; b=VH2lhc9z41PV8zhhpnrL4b9xaJVb/ldohBMsLJUM0nrbhy6Who+voenD4R0meSJ5XPJ8LDX0V7KjiPR8EtGakjIvYrnFpd7ZL6SNOeqv5s7P/d6rZPrwQNq3Cv4rxzIwDYaYT0Uzpf+UXKP1UYuzXT/s/MLiHo7RNYCugyVOBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230984; c=relaxed/simple;
	bh=DIxSGZ8DeYjNjy6dHDVKdNmqwxDzn46HxwIrpPxP1HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxZAO9eLn2OUJhvUO+JS/ptcsp5cjUEGoZugzfZkC4ct9YPPCgE6U28dF8bKzr957rVxYjwrI3iBuVXkatskM1e+SYAJvuzK8jJiCjUf7Q/xgYHd24AVacgJHgwL8vkDhY/Tm7FcNdsvLZGFl3ioeArx0uF7fv/ls8m1loYPmu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzhmHREo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b73G8GqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzhmHREo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b73G8GqP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9qY772427
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=; b=HzhmHREo0hyXuSgc
	tWfkaF/CedPdMucb69PB8gQR/qu6FpXrsaeZQSLwyKnH1VUQ5KQ2q1aZUtAlHbc0
	OA9eBvpsdeb2knUaimhvPLTMYhplTBILqSwYP8eyifCkhjbM9lXZEkH/koqjFZ+H
	LHfaKP3YX7i/YI1+0ngroFLEhHxYvFSIOcvasUyaP8hTD62TdwOIgWjxpxXZBCBO
	5duEc9SlQWLGHWnN0TdZQ2KvFF95+NraXIcCLpBh1g4bGsx9991VZzHtO6yMkgyf
	Cfe4ujiA/7ZkseK/cIZhXSJjDlbgOo6Vvew6RfpuqVdeY+Ls76lhgEqIJ2TmyF9P
	2A1atQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr909a5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:23:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso1095127eec.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230981; x=1790835781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=;
        b=b73G8GqPH05guVITNpTUbZpw94uZXJlER4VyxpFrUA/uEBq7Ql54G4COLeOQafQZtc
         +FI6gBA3E17A1hGwtzlKtnml1m39KxMB5GNan0g4EH1oLZ+fN67bx3o+gDq2Wpis5S+4
         lAXIu3AL2YQG9ZZ5SvWsUz2VbF9bg3Oz6PNE8BL3gJh+yl2yBqLHpnVscOZk4YZYiU4e
         5XTNhlM5cR1FOoZvO87/SOi48U1qUsysXHunavXtB0Dr4JHixgEh7LN4eWuLmRDyj3ws
         b8dKV7Et7pQPKCtgy4m//KyksqLcGZm+ipyUVsleG7AccQ+1pHI+O/iv5iOAfyZfLhKW
         E+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230981; x=1790835781;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PA731byDGeXSZbDTVW2VGa/gXS3hFkz79wPYyybQKUw=;
        b=Y1rQ0TDZasyFpa6zHd52jaqLPgkhWncj/ezrVJQioxSQEcKL1xfY4HtEIeDE6UonQS
         pMi8/evfQm24CKTG28smP8KxeFZXkbePwvfh/kRSDPO6SJkkUrRixUGeDTtdHDzuRNLP
         +dB7fRzEmK3y/UYlg/69j3apXJCNXW5ywEEUtY8JD1jRSDg32rnccNswgV/wS6Z4CY/e
         /7X1jkGXQby3tXbW9tIltPfu3SWGqKhm5U6zkEwzmilwvh44pbqWKfE9wzSxszZUWeLF
         t6l4BQm/T2MQ6di3XeuZJUV3/uYJlchv/5UxF5C8muxDmyGu7so3UqOuo5CopFry+D/l
         SgtA==
X-Forwarded-Encrypted: i=1; AKwUvBwFn082LM3BRoFJ4LZU0r1FV4P7hYXrbJCC86R4oMZTULEUHcoSW8To2PBnfaq8EUfj1mOn/54MYItd@vger.kernel.org
X-Gm-Message-State: AFuF++mJg6mMgvh+MFfAEiVDo5shSKeQxPR9PaVlHC0e5bkZRiJiuC9+
	hhsufmpS/zgCOPS3/w3wJ+yWH3w3jfEiLctln6HQ7yyKt8nlPCdBHsQ9u69fCKHo+me2WDghMee
	MQI7n0CohTWEF0Kl/pQAWQEXHCEAs53cHG4S0NWnHhr7ORKisLZjj+HTHgNOrjj8B
X-Gm-Gg: AYBFou29JeL/LUNjm7dO9GDCgHyYG1XA4MchExhUNZ9gNDO1GhOw+hrhPdwZcADEor+
	cWb1dPeG9s6Ka3YAWK4pzWZch5res9wVySbGzrXOEKMvSY7WHxOU2yALh5gWg1WbU4UMT/8Igvi
	V8JtsBOQi2QyujttHlCcSiPDI4sAJZhkhxNs11rYwqsDQdkC4KfzAqr/zHF1EpiKx270Rx3pQq3
	LcjfpHr0rmoRyq62vsWhlk2hcf6SOaC5wGGezIOCaDLc9+cHozRCxctRFURrutsTD59fmpMg5tg
	J9ZnPCA7ehQHcyzAuk579T2FmmCJu83lTVL57HisoXGbLz12DViIFmecMdhDPD2/uSvL2HHbcgZ
	e7n8vzyKe2QlrM8lfzta0dgroxfgHbvY=
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1650024eec.9.1790230981001;
        Wed, 23 Sep 2026 23:23:01 -0700 (PDT)
X-Received: by 2002:a05:7300:ec0a:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34004b8b5bamr1649979eec.9.1790230980341;
        Wed, 23 Sep 2026 23:23:00 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm10403751eec.14.2026.09.23.23.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:22:59 -0700 (PDT)
Message-ID: <82ff93db-6478-883b-7afc-ee4db79d0353@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:52:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Content-Language: en-US
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNyBTYWx0ZWRfX+cs1tM+Yw/lc
 EVSNVJF0mnku8Wgl/qDWWKOKptbbKynzW6bbynaY9DfGYRZFqsudg4T1sxqZahQWbj/6a3DgJBf
 /9PZnwivtqp/1hOlsuk3wIeq2UH8CNI=
X-Proofpoint-GUID: 3AMx7QR09_acptP2R-maBYaqquFuc6Wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNyBTYWx0ZWRfX9uWX0dJ/nuFd
 GfbZyHtXOMLrNYIUbA2OHzWy5iRIJ20X4bT/BG8aHpM7u5wd1OpoCoiZQ6GX3y8ugjVi75PSh8T
 iJ9f829kNsnCzTC20qnjj+55iw0LdmMhFEMS9tUyK0So2WB4tkZCTDjMb+LQeYNcvnKCnp5rhJm
 ZdQKXazF/fUYOuxtonFIpYft95VivTPwY83MFVeFw3llyuaLjnQkuxYMqeM7MU0o+hvIxE4DlM5
 wnB5jtgdbj/AbaInPv+Q/tu3hyqFi/xi4UNbPXmcJuUA/FhptT3NeCFGUOjRuF0BJWwDvP9bj36
 +BCcdQtVV5pNauQdk8xjQjdrhZpn5rheQwACu3CjhMa3sdc+5RxkXsCgi8BFhIPTdDgYErgL5OH
 9xQU5YloCaRgolzqkT+AQg/ZYs/H1LOpkJE2ZSc13q7puqKJGgAjjj5d+zd8PTWzuhAB2+JzE8a
 axYKVJIO8EC7ca/qv0g==
X-Proofpoint-ORIG-GUID: 3AMx7QR09_acptP2R-maBYaqquFuc6Wd
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4c1c5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RCdEPBNKmkqm1uLn_m4A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240027


On 9/23/2026 7:17 PM, Shawn Guo wrote:
> On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
>> The nord platform integrates the Qualcomm iris video codec hardware,
>> which is compatible with the glymur based iris implementation.
>>
>> This series reuses the glymur DT schema to accommodate nord iris
>> support and adds the required iris device tree node to the relevant
>> nord device tree.
> [...]
>
>> Vishnu Reddy (4):
>>       dt-bindings: media: qcom,nord-iris: Add nord video codec
> The binding should go through media subsystem. That said, this series
> should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
> patches.

Are you recommending splitting this into two separate series, one containing
the codec binding patch and another containing the three DTS patches?

I can certainly do that, but could you elaborate on the reason for preferring
that approach? I'm trying to understand whether this is due to the expected
routing through different trees/maintainers or if there is another consideration.

> Shawn
>
>>       arm64: dts: qcom: nord: Add iris video node
>>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
>>
>>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>>  4 files changed, 131 insertions(+), 1 deletion(-)
