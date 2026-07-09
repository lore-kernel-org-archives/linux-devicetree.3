Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24713F1AA6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586097; cv=none; b=G9ROa/Ounj+QHuCd/hNrUmfdNNXt9UCpu532bmIDxIyJfKi5sJ6JocVbYtmCUL26ny3+mz+P3cNxeBY8sm29NxSRqHwgqWAzDcthvs4yBICLy/fZgHuJ1yZqJQXIJ7+tAKqTzqUOYANqgcLCBFw3xqaCwQ+GdbS77SRJz1xXgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586097; c=relaxed/simple;
	bh=uHeEFphcgQohAkDYr/VqMWOeeqX47QSuP5logWgt5a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVwU5ak8u6KdWdm1oAXaJPlkLMndSC3KAZ7EQb4zPkv7pilX/N9sTN9rRsNErr64JpEu5onIMf7rHVYjpsq4uNrHA/A+fV5nc1G+UbP0g4WYMgmhATZM65JHINYJqly09i7FZSYEyMIVnj1Y0irOJlO65BIQEjP1wbK5mJ0P2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QH4aKFOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BuXQsK9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QH4aKFOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BuXQsK9p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GIT749745
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=; b=QH4aKFOALyROa1dJ
	Op4o9GswvuRrGVtMDVlQYqO/7EySTe76uunAUKFGppQr9QMa1aUYDs7rb0S3iBHL
	ppZx1ot8Oon8YOpcOPHOVbDTxNl6H6jgP9DxmktMpt8bQij4JTO/NZ3vDrgOqazl
	MBRjpLBPe1zDSHdZfVIq0yfWr1SVyRrY5bxKQ8xL3kBARRf05mv3OyhhvOJIQ57J
	IX6VrkGh/zpZnOJfGLzaAeXvAs22Uh2qFLR55c1+dS61ycYdFpbkjGfrQpB2Hlee
	2je3aWcjV597bdK/di31lsE9aJjsr0K2dRp255nm1d+kKX2FyjH7q9Hml/pOANwh
	zDrG5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft5ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:34:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce870a060so17649175ad.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586093; x=1784190893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=BuXQsK9pnVSnCmzbna/Rrdy1UO71qWfXkf2OrIWBmB20oN4FPCnI4Dvceqoiwt4B/e
         IVqKq3A0/IuxEe/30AiXWYjdDs8bvR4z3mO5MCnOTN4maYPUvXRwCIVRww2abCwertsk
         6f/GHpegp+bumuIBaV0s+XoPqZixgx5cG1v+isAmoR3BBElCHGw1GjsoJA+1yvUSJxut
         XAO2h8TBmzgsmdTBRpux0jhG+Vz1QSE3HupxXhfWjNIyjf4jy/pgOUI/aa+S2FP+LD9z
         eYmzm7ZKqIKQJV9spN5KklviIfd6opDHGARHI8sdn5/RAi5Wl16m+KokBgH0YJprJ6aK
         yOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586093; x=1784190893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=c5shnfbvL0Y6Iun00Z+Ckq3z8J2Z/5NEGwuBDN/olt79RiToGJTUN3r542T5O/6U7n
         5AEk+zzELvVAmbsMgZokZa2/5j2ZUJZslBiieDPFJPo3Om0A9VYW0jXtyLTtxGJ5F0Dl
         d+cOTcqy9ait/v1V7JVX6SZzGPPwKtYmKRnS9rWdGe31C8nSYyqKSZDhyAN6hzczPqhN
         Hm7TNhzy1eAKvRSGmb6sopQx00u1eVNgZ2GbuC5pfI71DHV7dQ/pUjKgeIg0FrduaeYz
         59sVml0XBAkAMcjGeu4xO+/F74A82KfP9O0lMe6aoBZGxl/4yYVA/N2toIT3envu/46h
         9btg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4BkffeUu6hDBzzEPGeQRq+N5aInuUJkc2r+AnZ4s9ycDjpDHQFGvxyGna+4m0sMdTA7G8SHsRtMaF@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9PywqXac2Q4CcJvzQnvZ053BqOPisBTJSYiKILnTMc0ugigY
	W7HH1ewfTqnck2B0XZO2Pc51e80RhLoH++KmIDGE8yFQAmxTQKpoQZnvj3pAYP1BFD3STi85DKL
	qHYrGQg9326fc0E+znn8vRNkHHM2Hj5XMVwTBUSX3yw5bFst6JlQrX3pK42shX/QK
X-Gm-Gg: AfdE7ck6HGt32FKdZn834wgRUwfI7UJKybmPYj5ty/fVloGGUY/0olYJ5LrlRGlLW16
	e+xua33PWb0LqXfLRC+nuGfFhC/87KXJ555lZEZZhHGj6+4TLN9ZBpFlcwWq5L/h2XcEdw51qAe
	zeWJ5APcJGuYBPjDoHqnUHD2HdD/FFh6AVL/nCo7cc9wZEoPOcI3mltiQ/JkPVkUdqW83TZkJ0z
	qxvgTzOxPizFuaiI8CVchhh5es5GIoJrK2meeu/rytc6hKJYuzc2FeatPTPOWVhYrFuUCNCWCBK
	FbV0JmNTYqB+HgvlC8yQoZny6LOVW2P52hHd51ZOtXEgOpWTRvu2+tAJqWQj8k6b375LAF+nLMI
	jKnjDs60IbIaD2OvoxkZ2H9E4yyKkCrdhVF4yJ13R1Vl0mAUBfYZwvMM2BWHLuFR7C20iZPcoZO
	Ln
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67471335ad.21.1783586092831;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67470935ad.21.1783586092330;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm40865795ad.39.2026.07.09.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:34:51 -0700 (PDT)
Message-ID: <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:34:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfXxFwplNdJb4AA
 T4KDw0UVZcqYiRLnVgAzQJ94wenOTan41VnuhYlrgtCWAUBLzFGEtWHMz6q9MH6Z1H7DwUCjQup
 6+uEUR0ONlNKX649d4BHjTwHhdSh3gLFj916pYGCv9P+2xwYSL2hrKcO56g1547iF5YCAXxrdwv
 YWW2qoN6w+MYaVkpD2bWVXeFHohrHq0cTd8bt1R8G0T9hJ+Juq583ZSDBqpRlnJJJ5HGuCdZPRi
 rBr0JO7WavfQ+6+E3A99RJjakmapnvtoq2I0SZc8gDA+H5toUYDyiVYQ3t7jyVCfHoe3ekUDQOQ
 jUrAVNYyLUjRNn8OdxKiHuvxHx93U+ZTpHzoXiw7AjkaGBLb/MwKeBndBre+6wgM/GMgNzz5abu
 HkTcEZxOPiXry+aRLlFrtEAOi7zK5C4sUSGY0pzqiA9KhZ6jl2gpCbtoTq8OLzIecJHeLxlQ8rY
 sPwNgikpgZ96H73w4Fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX9PgimjAGpznA
 FVcKGWhc79gpBTc/5vF8KU0gOIePFOd8h/16A98lj40Rn9AFEf4ebH77JxiLtY/iCPb7tDwSio7
 +rkGo7inLLjNAg/D96dDe/t38NCB/u0=
X-Proofpoint-ORIG-GUID: kMo5Q6f5VzufLdxD9AIid-wdJG-iciTN
X-Proofpoint-GUID: kMo5Q6f5VzufLdxD9AIid-wdJG-iciTN
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f5d2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fv-GP7Tdd4dwdnXjSPsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090081



On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>> The TNOC compatible previously required the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>> "arm,primecell" entry, so the device is created on the platform bus and
>> bound by the platform driver through its compatible string.
> 
> I asked already: this is not a valid reason. References to Linux
> structures are not correct here. If this is your reason, then answer is:
> fix drivers, by renaming or doing whatever is necessary to platform bus
> to behave like amba bus.

The issue is that we are not allowed to introduce a DT property to 
bypass the AMBA bus validation, which reads the Component ID (CID) 
registers. Besides, I cannot fix this in the TraceNoC AMBA driver 
because the driver is only invoked after amba_match() succeeds. Since 
the device fails the AMBA match, the TraceNoC AMBA driver is never reached.

The solution proposed by the CoreSight maintainer, Suzuki, is to define 
a dedicated compatible string for the Aggregator TraceNoC device and 
have it probed by the existing platform driver. If the AMBA bus cannot 
identify the device as a valid AMBA device, we should not fake the 
hardware description to make it appear as one.

Thanks,
Jie

>>
>> Drop the custom select block as well. It was only needed to avoid
>> matching the "arm,primecell" string on unrelated nodes; with the single
>> "qcom,coresight-tnoc" compatible the schema's auto-generated select
>> already matches the right nodes.
> 
> Why are you describing the diff? It's obvious.
> 
> 
>>
>> Update the example node to use the standalone compatible form.
> 
> And here.
> 
> You got comments at v4, nothing improveed. Your commit msg tells useless
> things like what you did or you want different Linux behavior.
> 
> Best regards,
> Krzysztof
> 

