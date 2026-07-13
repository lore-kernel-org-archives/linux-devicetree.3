Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B123F6C3A
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944765; cv=none; b=Rx4jZcyTnm7QG14HTmuRpN52lcjjJD4sALYVub6o/Ecf/BKfX5WoysA46s4xARa3Sez6s3cc2hrGwjV1yHdfYiiMFc5EoheBzvsLhoUQkXd7sNFQW6UGlulISZ2aVZkAjk+VbHL9RzCD5a3xTOxhYdcRj+PA4j/yrrGJ6kbnJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944765; c=relaxed/simple;
	bh=ybDLYdUPMbEn1xsPz/d92AYDTgsy7VuvGcjIKAzxt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqKvjioBXE31k8ijlAKxmePnt7wuo2A0UO7jj00zoRyTjq+GT1Fq6rFS6XOJLzhoZzFTYoRo7EdSg/eS+ydJ0yv0IL3rwgtukAMUhYyAPV92XjzCzYS+ta5CHe59ivYy87Tsntt9brI4Ue5yagug3E83oUB9vdd4B5p+h2m9or4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbmv5xIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZEEbSLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbmv5xIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZEEbSLU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7YlGB794236
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=; b=gbmv5xIBX/Njq++R
	iRXPlMlOYA7d3/Pai3cLOziDd+nsEvK2+SmfltOqiDPRcAEd0OrrWfD0qPBom4Hq
	kzKQ56zWAZ6Big6THOp6+jYpH3BjyyT7peT53at8rLIKeowOqONFoC+asZhGWp9m
	x5rfSAxsUorpjbW2T6L5hKaSvd0O3ItBtsDEHiOXh9F4EyptTn2uNvSCYkrtqzr2
	vofZohLU8DbcqPnWhgZBC8Yn8n0o2GUgHcP4AM5otxNFgNhpMqrdZvq91tIcAuTz
	uJq1V+7p88qbWxqA3CUovuUqDR+QssWjeJ3GKFDIHulfOkZHZb3C/KBLEDOkwuPv
	wW9S2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn102q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:12:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38de0739ab6so1323033a91.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944761; x=1784549561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=KZEEbSLUCL7GeXLFUmIxySnlqHg3jbVjUsSDEgxd+0PuFOMmv3uL4Zh2b9UWFbqTZQ
         U3sVfSTsQXWFzMaddH9BB9tzDAsJm8P/2ZueqB+D65IsbJBibGYZMau7Wq/6cLyMQ4sv
         P4ieC7qRw9MoA3RHSVkxbD0cwh9e2dLbxebpH/7OtCl/8znYS2BunFQ9ROol8Y5SmIeo
         RuayoT9PjgbET3cU8sIlnahyitBKgBBpO+PUMDA5vx9ud4tKoaq1IprSJMN4ubnQHt8m
         RRuoypRnv3cuE8XYd2XrAQck5XcluWNoTc/Hf6q9zsejEk28IVGw/2b1JODMtRYYC+to
         j6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944761; x=1784549561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVltYfMT8TEkshamGLWBM3q5K1GZcVnd0fJhRwy1ipM=;
        b=RQ+QZ6GIWPAlJuk5IQCmiXIEFtQYWtuox9krMw5XCNx95Xagfet/3cqpRT7X1Vqi58
         U2regM5UliWG8dm16OpC+2ZvTMk1OWtobfKe+keiiJz5HHf0Taq9JIh/L7Hx+DdhtiOs
         7/ujkH42KYSPC+w0s2IVj8k13dSkagS0uLgNYSiI8YJZ71vEvuf43jZqrIWzS01DyWjf
         fgivF2K7R0YBvjXGAOOKTqnopa8u80nr/yHXJXQDz46Be2uy4RY4nvnLTIdmRTjXM2e8
         R41DaeC9Z+OlGo7/uRRGOBVMt5ackPq8VJ5XmHbZ0wLznhxns4HI8MHvSBQ0GOEQ+GRs
         QggQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiFNxRdpQ2wYrbzdkg7WBRH/Sgqv7xchJ6o0pRtJ2F2wwSRrKUuK4Fe7wac7kt40oKOxAeaA72VOyi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+8AbKaqliGBQ6jbyOY7eoM/r2L5XEV+03YmR6xZzHkiYk5tu
	EcHVsYjhcQKrNsJbz/y1qq8gsJQV94iClblpA1GkS8NpZcSIBEhf7fTMAsIj5YTEROfYFu0S8Ae
	fjeGo7ipKtXorj9iAnAMslhmVwi2AXEmMDRKFF2CqSDFqMN6XciAihDZ799cVoWBw
X-Gm-Gg: AfdE7cmxipbJQE25e7XCboopG1QuyT2GdLcG13ewlil+RdRPsQgNjt3mDUHyw+ahN++
	xIaqZ8lx/7WZdWUbYtbxPV/4lQJ+41e1d3li5MsUYGJg6L/pcfcnEcO6MD5RmpDyXGAEcsyrApV
	socbrI68drj80tGQCe4ZSAX02sQlPD/r+OKlxNUPUJ1SoQF9CN9r/9z3CMmPVoLHv0/+QTPAQ2F
	+7ti+gVuJnYJDTXx/V1jikTLBXNprJ+d1deNCWWVbpYwPvPRt38UekfZoHM/vlqfhicHOY7Grq8
	rElLZ57XXTq4yWHAbKje5SyRN0NFg7SWRQLOmz++F5MFxEHAnHfaARZKxIp/CjbiG2MCw3t7Q2b
	5wXgUNq8Q5IYLVwqGq+m8GCpy1Yv6LZNTwO4CVw==
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911257a91.35.1783944761518;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:387:e0bb:57fc with SMTP id 98e67ed59e1d1-38dc7b9e71bmr7911225a91.35.1783944761083;
        Mon, 13 Jul 2026 05:12:41 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm53089321eec.22.2026.07.13.05.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:12:40 -0700 (PDT)
Message-ID: <0e1a286e-3429-4bcd-9dbd-4aecae52171a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:42:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <47e3cd69-9800-462e-94c0-f2987066cf68@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1qedAr2dDoai3tjvzspU-_odEPxHeddT
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54d63a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=e2pIEHJfEIpJw0LIUh0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX3pCYd7AizDb0
 AX6/SS3S6GfEjW6AQcRA0sBHWN7B41ZwyAbbwTaAysVj2ItbeO9OHS0hYf4c44h+V54DZeqkj4V
 6I/k4eysFrXKpcQkH457G+r2TT73K8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX4voTcOfxP6Oc
 OxU8JVntqT6+mWZhUvCjgBl/FwShVOCdnHrAJzF56J0c0AoQQ/9FyQ//OY6R1LiYwmOkPGjlA4G
 H7CNcBIWLXZwXkwFVQjqf8fQ2EQT1fpvl9Lx6E4eSTYwN9RWP4tnzStdUVoHx9vZ41YJ4ArepXy
 htgc+aJa0qKEpTavF8cOOMZC3RDFC3b1F8UTjzdcLf97rBExWLhkB7KUzjWtgUJTiA85Du2YbpG
 VzcjLUe+/BK+WVlbqVEcAJdL90g4PgSMXyCYiPZkmxAnUfueBlhg7Z9L6VD+pyr3hGpbqzYRgCg
 RRhRXjHjwN5Fxp7llMLeL3Onwkwa9CUmQzxIcuEfH5d8IXQWztqADZsm8W9a8mJ1ondpBaT9BCu
 n6CRuLgM3GJkgLSuBl0Dy8cicOxaYFBDe0WjmcLvXIpHTfq0NaJhetWtNyI+2hNGGOBSeCrUbIH
 6cFmYSWc4gtZweYX+FQ==
X-Proofpoint-GUID: 1qedAr2dDoai3tjvzspU-_odEPxHeddT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127



On 09-07-2026 05:31 pm, Konrad Dybcio wrote:
> On 7/8/26 8:25 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>> differs across Shikra variants based on Audio subsystem enablement as
>> follows:
>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>> are required to be supported on HLOS.
>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>> handled on Modem, so from HLOS only resets are needed.
>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>> +		audiocorecc: clock-controller@a0a0000 {
>> +			compatible = "qcom,shikra-audiocorecc";
>> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +				 <&sleep_clk>,
>> +				 <0>;
>> +			#clock-cells = <1>;
>> +			status = "disabled";
> 
> /* Owned by [name of the DSP] firmware */
> status = "reserved";
> 

Sure, will update as below.

status = "reserved"; /* Owned by Modem firmware */

Thanks,
Imran
