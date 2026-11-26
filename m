Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658763;
	b=Alu38zvN9sYvh80UWci1hA09CORVBSIWjJv4bg2gpciDsduE89Q0tlJHMCKzaqlg74Iy
	 J4M0zIIpRsAeUQd9Hvum3crKCDiZWD9wwdDXs3V2dkPq6yO9LK/idXOQLHBvLRXOZnLai
	 LdOor+h3jPyvmCqPmCjYrDc+oeYW/g+LRrYO01L7IZ3cPn2iM8NUcpueLetbFhefYlwsh
	 OTcpGzAf3B+lEsnYdm58lAre1+uXMr+aDhtJkf/M2nhd8e8Dj3zKRQGLb6IQd5X+eprhR
	 12jijcfS+B7m2JWA6nlXCVc/RhlnNM/l/34KzYzcmWm1Kbhr1o+881x638uYB6Ohvog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/b5P8aBtknJREY6k7Wt46OhNUtKqfrHWMDv7JLZlVT8=;
	b=OK8vvGbB35+bxX9DhY/CHI86gzqRgdg6tZDxxyUY4G3iO0df5zuvoayMwPe8lYKNNxTd
	 kZhRvJCNSvIrVNAzH9inTfwf5PIIxLGHuaxD0HTYiW+4QJ0LncA5SYi5cMgm2ETvUuzvf
	 wLTz1bAW/bTxxXLPZ6Zg5e7EkG/zJ+IeOZjdM+cnhtNlOddRiruBay2PAgMYlKbQDBhuR
	 dtGtvd4mRFgiwv7X10kSqmMrOLFheKxyRQlviIpjtQGToRnmzVh9ck9UcEne1TJ1mZadi
	 x/vCWmX98GJuuHDwAxuGc+9ew23GXjOKXFdIUZf/bXgg6GVnvc4fOrEfxeJm3JY8oGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jN/hw4JK";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiiFHiU+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74550606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74550606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jN/hw4JK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiiFHiU+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB2Ru648809
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/b5P8aBtknJREY6k7Wt46OhNUtKqfrHWMDv7JLZlVT8=; b=jN/hw4JKk4BoSUW4
	dcbuiG2S1evKw4xUaVDMbmCCjj4fFQDtFWwu8dKNqeUT5f+NpYOJtWXwnY0JsaUS
	gvkecHqHoT9zHTnX7YP57qtGe1QTrbasUM0r005Z7sSiyHQ7DNj0Anp4qgVV9VUR
	FNmn8c7N/ygQ/evRr7k6ztYgy3arOPYXXqGyJbXbYwCOBi/kkYBG8meQFAKmL0KX
	R1aTTSP38fm5f4mW202DGzkG1wug4YFgmB2v8Q010uHwzOvCTobdi7Q7kzOHArRW
	R/VKh2i3Vdj4OixU363JAkcY0904qenRGqo4zh4z8zSSHJJ16DfFi2wvdw9SoWGg
	i7ytUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61aht9fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:06:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde75c957a7so3298105a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658759; x=1796263559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b5P8aBtknJREY6k7Wt46OhNUtKqfrHWMDv7JLZlVT8=;
        b=FiiFHiU+Yj8oE3RByXTPH6hsTe2Z5N2vMGucfp7f+YTJp8GjBBjwERIV25yoDiOa7K
         FWhogV2WXkNQszQtgZpZkrERgdswP5Cf2zKUa6oLZPVpRZsmy01CbpBzEFNsl/libhBc
         Qw43hG01ULaDgiWrff6eGZuHAGnzoAla9pzAkzhCdFuJDR5vudq1oyZ0ZzzXVilAPdDV
         1EWp8jkwV3MZAa0T4meGZTXpRQfy4P1PFKqHVpMGL8Uea9R36S2FOngEATKUH8wAp93P
         AbKq/nTy4zXNTWe9Rvk04eKrXOUcffmTNqeIe95bTHwMnpwA88ljrwIUFot7JigCb0Mi
         xd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658759; x=1796263559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b5P8aBtknJREY6k7Wt46OhNUtKqfrHWMDv7JLZlVT8=;
        b=d++uRIbPxbzGgkrf9K0QuPmKN+vUhCSPcUOOZg/1m2YZWavco7pvsMfWE7raTKHI3F
         A9IGgO9VudyhccjzN/M19xTK+2FCS3wx7zljIyMFO08a271wzcoXLUEmoedVSo9Yngwg
         gxkIkOm0lrMdRxH1s5A/AiGliM1aaHRlyvFhYhwRndpeVle4OOrxDAZPaGM4xARxEgED
         edtB2ufqM54L5osqGT64A8Mi7nze0EO4nybG8JVzbwhqRBBJG6sT7AwsxxnskMszBS6u
         RPmVKEia9dXov9Be+r4/iPaU9KQ1fs1LqC9DWIoPjD2Y36gn8DJeFBUU+Ng9kkheUNgX
         Ocag==
X-Forwarded-Encrypted: i=1; AL+hErHuYVoEzDDBjQrCETwuIeiRKWA+jmhm6wnSsF1+SGFmMxKxWhOmN1MrYb2n09WjrqALCsvtXQiKk2c3@vger.kernel.org
X-Gm-Message-State: APuU4Z82M7OY+Fs7XhTshO0VqPF6yvNpR6e3WEjUS3fpaKTHdky4Qvbz
	8b+KMClWbjuXFZo2mvaTDpGoaKzU4tHYCeWNEZ0U/r3MwoZhPTBLf2Gd0OPhriXuHMzNveeiNvA
	C+Z100V0YWeLPT2+9kB1swq2abQeQyFv97TtARw6Ofo54yCfqWQIJ3b2kBRtiIY1/
X-Gm-Gg: AZFdTZf6eJiQKIhowhvH2PNSXNgom+y3+0mv8NIS33UElXGmi21xDOoWUpaKZ1P++uv
	Wixr/KVux51sT/z8ICLKcKBoeQSmhewSsWJaJ1yOPUtLyjh0+mVsUZ4d/Rvt03t2zJjRcNjJq2s
	KuMZeu3ABO+oQJdAJ27rffA3rHO+NEIdFq86qtkQSgxDfmUfz8tnIYv+S4EeJQQixpeP2Ko616q
	sWiD8eUvWbgoEcPAz+LcoTA2ZmzA/j9A30CnF0JF5ZSswaNReb1AaL4B2vhmkh5E190s52JDmpD
	H7Lk2pLNzFjewlwHzMNxMV5mCZFP9ElDwQg9P1kDCpNOUJGbYFDM0JaYexFByajRnLX19sZmwDM
	tGsebGqDzDHnhxSmDKpeqFSbVVVvDPO8aor3xE39H0FCwKpMchwbAXusQM15OhzV6iIL0miBlUH
	QZLwpuj+4b4nXs6MmdVRccnYnexp7e8SqDOJLSPxo=
X-Received: by 2002:a17:903:298d:b0:2f0:3dc0:9bbb with SMTP id d9443c01a7336-2f03f2115e7mr139472305ad.34.1795658759165;
        Wed, 25 Nov 2026 18:05:59 -0800 (PST)
X-Received: by 2002:a17:903:298d:b0:2f0:3dc0:9bbb with SMTP id d9443c01a7336-2f03f2115e7mr139471965ad.34.1795658758492;
        Wed, 25 Nov 2026 18:05:58 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c42b1sm94541435ad.17.2026.11.25.18.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 18:05:57 -0800 (PST)
Message-ID: <f7bc55b3-8a0b-4090-b992-5bfb55ea4763@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:05:50 +0800
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
Subject: Re: [PATCH RFC 6/6] coresight: tmc: add QDCP ETR sysfs support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-6-b1a730d2c57a@oss.qualcomm.com>
 <f0976910-4de6-46fa-819f-fffa3866399f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f0976910-4de6-46fa-819f-fffa3866399f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cjrAYIOYFTdpXwx9NMdWVM-Nin9akGPF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX1uMU35NE3COe
 2DSSTqcIvjMdj6KWLLac1vm/QfKy2JypeUV493Y7jj7DmKlTiHv/iv7K6gkF6DGlWmCLtvR4Z2B
 WagMbtbdHgfu4qLdEQ7bbP+aF5vwxC4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXw3FUAsYfYQsf
 byzkRRkJt7cyI/HXWUfZ7j3hoSzjyuxcc4SelHF6Lns/49xiVG5NfvCZ+Yk/nVyabsttfv4lH0W
 ypseVZpUzraw66gXOHg+Q0TqhiS9rl7oenvlYEsp+vPInPZ0+JAE2iiTbqrbpjjVEg8pJtfZPV3
 trXKVjKXy/y4QVxL4lDYNcdteLKirSU04p5XaMHVdxk4Dj9NwxC9meBEu4PHl5NPpcNNiU9HzSD
 qNGhFdVjYydXk2h9UOwyGotHio1yM9WYrwbjBisvOZnNnRGXwYYgzk73mPD11pQj6wLMowCmPHp
 /PNgaN+Gngx6lZhN56uSxGAyrindw8YoXAywoFw1MGTYcqkWRKrHeLJC3cpEsimfyCvS6Gu+nnG
 SuCyGx85fTm7ShiDVC1fKTYX0GuzqxWiD7twsxqpnvF7J8ElqFUsP2rLd7FtEy0pHEdmfZXenX1
 e00jDCVHB6eC+SopDnQ==
X-Proofpoint-ORIG-GUID: cjrAYIOYFTdpXwx9NMdWVM-Nin9akGPF
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b079408 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pc8ZXi8rGzgy6xVcRggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007



On 11/23/2026 6:38 PM, Suzuki K Poulose wrote:
> On 19/11/2026 09:01, Jie Gan wrote:
>> Add support for TMC (Trace Memory Controller) instances configured as
>> an ETR (Embedded Trace Router) whose control registers are owned by the
>> Qualcomm Embedded Co-Processor (QECP) instead of the application
>> processor (AP). Since the AP has no MMIO access to these registers,
>> probing, sysfs sink enable/disable, and RRP/RWP/STS (RAM read pointer,
>> RAM write pointer and status) synchronization are carried out over the
>> Qualcomm Debug Control Protocol (QDCP), a firmware RPC interface,
>> instead of direct register access. Linux still allocates and owns the
>> ETR trace buffer as usual.
>>
>> QDCP-owned ETR probe, buffer handoff, sysfs enable/disable, and read
>> prepare/unprepare are implemented in a new coresight-tmc-etr-qdcp.c.
>> coresight-tmc-core.c and coresight-tmc-etr.c gain the probe-time checks
>> needed to detect a QECP-owned ETR and dispatch into it.
>>
>> Firmware may write into the trace buffer until it confirms a stop, so
>> drvdata->etr_buf is cleared only after a confirmed stop. If a stop is
>> not confirmed, including after an enable request that failed or timed
>> out and may still have been executed, the buffer is not synced, freed
>> or replaced. The stop is retried on the next enable, the next open of
>> the device node, or removal. A failed RRP/RWP/STS read invalidates the
>> buffer contents instead of leaving the previous capture readable.
>>
> 
> Please split this patch, add the infrastructure first to abstract
> handling of the ETR operations and then add the QDCP support


Will split the patch.

> 
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/Makefile               |   2 +-
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 145 ++++++--
>>   .../hwtracing/coresight/coresight-tmc-etr-qdcp.c   | 379 +++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    |  46 ++-
>>   drivers/hwtracing/coresight/coresight-tmc.h        |  46 +++
>>   5 files changed, 570 insertions(+), 48 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/ 
>> coresight/Makefile
>> index d97e334fe1fc..4a5ed093d226 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -32,7 +32,7 @@ coresight-y := coresight-core.o  coresight-etm- 
>> perf.o coresight-platform.o \
>>           coresight-syscfg-configfs.o coresight-trace-id.o
>>   obj-$(CONFIG_CORESIGHT_LINK_AND_SINK_TMC) += coresight-tmc.o
>>   coresight-tmc-y := coresight-tmc-core.o coresight-tmc-etf.o \
>> -              coresight-tmc-etr.o
>> +              coresight-tmc-etr.o coresight-tmc-etr-qdcp.o
>>   obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>>   obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>>   obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 0ef4b817b297..9b6871c51057 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -565,10 +565,27 @@ static struct attribute *coresight_tmc_attrs[] = {
>>       NULL,
>>   };
>> -static const struct attribute_group coresight_tmc_group = {
>> +const struct attribute_group coresight_tmc_group = {
>>       .attrs = coresight_tmc_attrs,
>>   };
>> +/*
>> + * trigger_cntr has no QDCP equivalent: the local-MMIO path writes it
>> + * straight to the TMC_TRG register in __tmc_etr_enable_hw(), but
>> + * qdcp_tmc_cfg has no field for it and no QDCP_TMC_SET_PARAM
>> + * parameter ID conveys it to firmware. Omit it here instead of 
>> exposing a
>> + * sysfs knob that silently does nothing for a QDCP-owned ETR.
>> + */
>> +static struct attribute *coresight_qdcp_tmc_attrs[] = {
>> +    &dev_attr_buffer_size.attr,
>> +    &dev_attr_stop_on_flush.attr,
>> +    NULL,
>> +};
>> +
>> +const struct attribute_group coresight_qdcp_tmc_group = {
>> +    .attrs = coresight_qdcp_tmc_attrs,
>> +};
>> +
>>   static const struct attribute_group coresight_tmc_mgmt_group = {
>>       .attrs = coresight_tmc_mgmt_attrs,
>>       .name = "mgmt",
>> @@ -676,25 +693,18 @@ static void tmc_get_reserved_region(struct 
>> device *parent)
>>       drvdata->crash_mdata.size  = resource_size(&res);
>>   }
>> -/* Detect and initialise the capabilities of a TMC ETR */
>> -static int tmc_etr_setup_caps(struct device *parent, u32 devid,
>> -                  struct csdev_access *access)
>> +/*
>> + * Detect ETR scatter-gather support from devid and configure the DMA 
>> mask.
>> + * Shared by the local-MMIO and QDCP firmware-owned ETR probe paths, 
>> which
>> + * differ only in how they obtain devid and the unadvertised 
>> capabilities.
>> + */
>> +int tmc_etr_setup_sg_and_dma_mask(struct device *dev,
>> +                  struct tmc_drvdata *drvdata, u32 devid)
>>   {
>>       int rc;
>> -    u32 tmc_pid, dma_mask = 0;
>> -    struct tmc_drvdata *drvdata = dev_get_drvdata(parent);
>> -    void *dev_caps;
>> +    u32 dma_mask = 0;
>> -    if (!tmc_etr_has_non_secure_access(drvdata))
>> -        return -EACCES;
>> -
>> -    tmc_pid = coresight_get_pid(access);
>> -    dev_caps = coresight_get_uci_data_from_amba(tmc_ids, tmc_pid);
>> -
>> -    /* Set the unadvertised capabilities */
>> -    tmc_etr_init_caps(drvdata, (u32)(unsigned long)dev_caps);
>> -
>> -    if (!(devid & TMC_DEVID_NOSCAT) && tmc_etr_can_use_sg(parent))
>> +    if (!(devid & TMC_DEVID_NOSCAT) && tmc_etr_can_use_sg(dev))
>>           tmc_etr_set_cap(drvdata, TMC_ETR_SG);
>>       /* Check if the AXI address width is available */
>> @@ -712,18 +722,38 @@ static int tmc_etr_setup_caps(struct device 
>> *parent, u32 devid,
>>       case 44:
>>       case 48:
>>       case 52:
>> -        dev_info(parent, "Detected dma mask %dbits\n", dma_mask);
>> +        dev_info(dev, "Detected dma mask %dbits\n", dma_mask);
>>           break;
>>       default:
>>           dma_mask = 40;
>>       }
>> -    rc = dma_set_mask_and_coherent(parent, DMA_BIT_MASK(dma_mask));
>> +    rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_mask));
>>       if (rc)
>> -        dev_err(parent, "Failed to setup DMA mask: %d\n", rc);
>> +        dev_err(dev, "Failed to setup DMA mask: %d\n", rc);
>>       return rc;
>>   }
>> +/* Detect and initialise the capabilities of a TMC ETR */
>> +static int tmc_etr_setup_caps(struct device *parent, u32 devid,
>> +                  struct csdev_access *access)
>> +{
>> +    u32 tmc_pid;
>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(parent);
>> +    void *dev_caps;
>> +
>> +    if (!tmc_etr_has_non_secure_access(drvdata))
>> +        return -EACCES;
>> +
>> +    tmc_pid = coresight_get_pid(access);
>> +    dev_caps = coresight_get_uci_data_from_amba(tmc_ids, tmc_pid);
>> +
>> +    /* Set the unadvertised capabilities */
>> +    tmc_etr_init_caps(drvdata, (u32)(unsigned long)dev_caps);
>> +
>> +    return tmc_etr_setup_sg_and_dma_mask(parent, drvdata, devid);
>> +}
>> +
>>   static u32 tmc_etr_get_default_buffer_size(struct device *dev)
>>   {
>>       u32 size;
>> @@ -786,20 +816,30 @@ static int __tmc_probe(struct device *dev, 
>> struct resource *res)
>>       ret = -ENOMEM;
>> -    /* Validity for the resource is already checked by the AMBA core */
>> -    base = devm_ioremap_resource(dev, res);
>> -    if (IS_ERR(base)) {
>> -        ret = PTR_ERR(base);
>> -        goto out;
>> +    if (device_property_present(dev, "qcom,qdcp")) {
>> +        ret = tmc_qdcp_etr_probe_setup(dev, drvdata, &devid);
>> +        if (ret)
>> +            goto out;
>> +    } else {
>> +        /* Validity for the resource is already checked by the AMBA 
>> core */
>> +        base = devm_ioremap_resource(dev, res);
>> +        if (IS_ERR(base)) {
>> +            ret = PTR_ERR(base);
>> +            goto out;
>> +        }
>> +
>> +        drvdata->base = base;
>> +        desc.access = CSDEV_ACCESS_IOMEM(base);
>> +        devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
>>       }
>> -    drvdata->base = base;
>> -    desc.access = CSDEV_ACCESS_IOMEM(base);
>> -
>>       raw_spin_lock_init(&drvdata->spinlock);
>> -
>> -    devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
>> +    mutex_init(&drvdata->qdcp.lock);
>>       drvdata->config_type = BMVAL(devid, 6, 7);
>> +    if (tmc_has_qdcp(drvdata) && drvdata->config_type != 
>> TMC_CONFIG_TYPE_ETR) {
>> +        ret = -EOPNOTSUPP;
>> +        goto out;
>> +    }
>>       drvdata->memwidth = tmc_get_memwidth(devid);
>>       /* This device is not associated with a session */
>>       drvdata->pid = -1;
>> @@ -812,7 +852,8 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
>>       }
>> -    tmc_get_reserved_region(dev);
>> +    if (!tmc_has_qdcp(drvdata))
>> +        tmc_get_reserved_region(dev);
>>       desc.dev = dev;
>> @@ -825,11 +866,25 @@ static int __tmc_probe(struct device *dev, 
>> struct resource *res)
>>           dev_list = "tmc_etb";
>>           break;
>>       case TMC_CONFIG_TYPE_ETR:
>> -        desc.groups = coresight_etr_groups;
>> +        if (tmc_has_qdcp(drvdata)) {
>> +            ret = tmc_qdcp_etr_sink_setup(dev, drvdata, devid, &desc);
>> +            /*
>> +             * The TMC control registers are firmware-owned and
>> +             * are not accessible from the panic handler, so
>> +             * QDCP-owned ETRs have no panic_ops and trace data
>> +             * captured by QECP firmware is not preserved on
>> +             * panic.
>> +             */
>> +            dev_notice(dev,
>> +                   "QDCP TMC-ETR: trace data not preserved on panic\n");
>> +        } else {
>> +            desc.groups = coresight_etr_groups;
>> +            desc.ops = &tmc_etr_cs_ops;
>> +            drvdata->etr_get_state = tmc_etr_mmio_get_state;
>> +            ret = tmc_etr_setup_caps(dev, devid, &desc.access);
>> +        }
>>           desc.type = CORESIGHT_DEV_TYPE_SINK;
>>           desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
>> -        desc.ops = &tmc_etr_cs_ops;
>> -        ret = tmc_etr_setup_caps(dev, devid, &desc.access);
>>           if (ret)
>>               goto out;
>>           idr_init(&drvdata->idr);
>> @@ -864,7 +919,8 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>       dev->platform_data = pdata;
>>       desc.pdata = pdata;
>> -    coresight_clear_self_claim_tag(&desc.access);
>> +    if (!tmc_has_qdcp(drvdata))
>> +        coresight_clear_self_claim_tag(&desc.access);
> 
> That brings the question, why not add dummy methods for csdev_access()
> or even add the QDCP calls and do the right thing ?
> 

Shall I call it static TMC with dummy methods as we did in other devices?

Thanks,
Jie

> 
> Suzuki
> 
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev)) {
>>           ret = PTR_ERR(drvdata->csdev);
>> @@ -881,7 +937,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>       }
>>   out:
>> -    if (is_tmc_crashdata_valid(drvdata) &&
>> +    if (!tmc_has_qdcp(drvdata) && is_tmc_crashdata_valid(drvdata) &&
>>           !tmc_prepare_crashdata(drvdata))
>>           register_crash_dev_interface(drvdata, desc.name);
>>       return ret;
>> @@ -932,6 +988,16 @@ static void __tmc_remove(struct device *dev)
>>       misc_deregister(&drvdata->miscdev);
>>       if (drvdata->crashdev.fops)
>>           misc_deregister(&drvdata->crashdev);
>> +
>> +    /*
>> +     * coresight_unregister() does not invoke sink_ops->disable(). An
>> +     * active QDCP-owned ETR must be stopped and have its firmware-DMA
>> +     * target quiesced explicitly, or QECP firmware can keep writing 
>> into
>> +     * the trace buffer after it is freed below.
>> +     */
>> +    if (tmc_has_qdcp(drvdata))
>> +        tmc_qdcp_etr_shutdown(drvdata);
>> +
>>       coresight_unregister(drvdata->csdev);
>>   }
>> @@ -1041,12 +1107,19 @@ static const struct acpi_device_id 
>> tmc_acpi_ids[] = {
>>   MODULE_DEVICE_TABLE(acpi, tmc_acpi_ids);
>>   #endif
>> +static const struct of_device_id tmc_platform_match[] = {
>> +    { .compatible = "qcom,coresight-tmc-qdcp" },
>> +    {}
>> +};
>> +MODULE_DEVICE_TABLE(of, tmc_platform_match);
>> +
>>   static struct platform_driver tmc_platform_driver = {
>>       .probe    = tmc_platform_probe,
>>       .remove = tmc_platform_remove,
>>       .driver    = {
>>           .name            = "coresight-tmc-platform",
>>           .acpi_match_table    = ACPI_PTR(tmc_acpi_ids),
>> +        .of_match_table        = tmc_platform_match,
>>           .suppress_bind_attrs    = true,
>>           .pm            = &tmc_dev_pm_ops,
>>       },
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr-qdcp.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr-qdcp.c
>> new file mode 100644
>> index 000000000000..db94bce76f15
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr-qdcp.c
>> @@ -0,0 +1,379 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Support for QDCP firmware-owned TMC-ETR instances. The TMC control
>> + * registers are owned by QECP firmware and are not accessible from 
>> the AP;
>> + * Linux still allocates and owns the ETR trace buffer using the normal
>> + * CoreSight sysfs buffer lifetime, handing the buffer address/size 
>> off to
>> + * firmware over the Qualcomm Debug Control Protocol (QDCP).
>> + */
>> +
>> +#include <linux/coresight.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/iommu.h>
>> +#include <linux/mutex.h>
>> +#include <linux/property.h>
>> +#include <linux/soc/qcom/qdcp.h>
>> +#include <linux/types.h>
>> +
>> +#include "coresight-priv.h"
>> +#include "coresight-tmc.h"
>> +
>> +static const struct attribute_group *coresight_qdcp_etr_groups[] = {
>> +    &coresight_etr_group,
>> +    &coresight_qdcp_tmc_group,
>> +    NULL,
>> +};
>> +
>> +static int tmc_qdcp_get_param(struct tmc_drvdata *drvdata,
>> +                  enum qdcp_tmc_param param, u64 *value)
>> +{
>> +    return qdcp_tmc_get_param(drvdata->qdcp.provider,
>> +                        drvdata->qdcp.id, param, value);
>> +}
>> +
>> +int tmc_qdcp_etr_probe_setup(struct device *dev, struct tmc_drvdata 
>> *drvdata,
>> +                 u32 *devid)
>> +{
>> +    struct qdcp_data *qdcp;
>> +    u64 value;
>> +    int ret;
>> +
>> +    qdcp = devm_qdcp_get(dev, "qcom,qdcp");
>> +    if (IS_ERR(qdcp)) {
>> +        if (PTR_ERR(qdcp) == -EOPNOTSUPP)
>> +            dev_err(dev, "QDCP provider unavailable, is QCOM_QDCP a 
>> module while TMC is built in?\n");
>> +        else
>> +            dev_err(dev, "failed to get QDCP provider: %pe\n", qdcp);
>> +        return PTR_ERR(qdcp);
>> +    }
>> +
>> +    ret = fwnode_property_read_u64(dev->fwnode, "qcom,qdcp-tmc-id",
>> +                       &drvdata->qdcp.id);
>> +    if (ret) {
>> +        dev_err(dev, "missing QDCP TMC id: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    drvdata->qdcp.provider = qdcp;
>> +    ret = tmc_qdcp_get_param(drvdata, QDCP_TMC_PARAM_DEVID,
>> +                 &value);
>> +    if (ret) {
>> +        /*
>> +         * -EAGAIN means the QDCP QMI service has not registered yet;
>> +         * retry via probe deferral. Any other error, including
>> +         * -ENODEV from a dying provider, is a permanent failure.
>> +         */
>> +        if (ret == -EAGAIN)
>> +            ret = -EPROBE_DEFER;
>> +        else
>> +            dev_err(dev, "failed to read QDCP TMC DEVID: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    *devid = value;
>> +    return 0;
>> +}
>> +
>> +static int tmc_etr_qdcp_get_state(struct tmc_drvdata *drvdata, u64 *rrp,
>> +                  u64 *rwp, u32 *status)
>> +{
>> +    u64 value;
>> +    int ret;
>> +
>> +    ret = tmc_qdcp_get_param(drvdata, QDCP_TMC_PARAM_RRP,
>> +                 rrp);
>> +    if (ret)
>> +        goto err;
>> +
>> +    ret = tmc_qdcp_get_param(drvdata, QDCP_TMC_PARAM_RWP,
>> +                 rwp);
>> +    if (ret)
>> +        goto err;
>> +
>> +    ret = tmc_qdcp_get_param(drvdata, QDCP_TMC_PARAM_STS,
>> +                 &value);
>> +    if (ret)
>> +        goto err;
>> +
>> +    *status = value;
>> +    return 0;
>> +
>> +err:
>> +    /*
>> +     * tmc_sync_etr_buf() returns without syncing on error. 
>> Invalidate the
>> +     * buffer so a reused one doesn't present the previous capture as 
>> new.
>> +     */
>> +    dev_err(&drvdata->csdev->dev, "failed to read QDCP ETR state: 
>> %d\n", ret);
>> +    if (drvdata->etr_buf) {
>> +        drvdata->etr_buf->len = 0;
>> +        drvdata->etr_buf->full = false;
>> +    }
>> +    return ret;
>> +}
>> +
>> +static void tmc_etr_qdcp_get_buffer_addr(struct tmc_drvdata *drvdata,
>> +                     struct etr_buf *etr_buf,
>> +                     phys_addr_t *paddr, dma_addr_t *iaddr)
>> +{
>> +    struct device *real_dev = drvdata->csdev->dev.parent;
>> +    struct iommu_domain *domain = iommu_get_domain_for_dev(real_dev);
>> +
>> +    *iaddr = etr_buf->hwaddr;
>> +
>> +    /*
>> +     * etr_buf->hwaddr is the DMA address handed to the ETR/QECP AXI
>> +     * master. When an IOMMU sits on that path it is an IOVA rather than
>> +     * the CPU physical address, and QECP firmware needs the real
>> +     * physical address separately for its own bus/master view of 
>> memory.
>> +     * Without an IOMMU domain, the DMA address already is the physical
>> +     * address.
>> +     */
>> +    if (domain)
>> +        *paddr = iommu_iova_to_phys(domain, etr_buf->hwaddr);
>> +    else
>> +        *paddr = etr_buf->hwaddr;
>> +}
>> +
>> +static int tmc_etr_qdcp_enable_hw(struct tmc_drvdata *drvdata,
>> +                  struct etr_buf *etr_buf)
>> +{
>> +    struct qdcp_tmc_cfg cfg = { 0 };
>> +    int ret;
>> +
>> +    if (WARN_ON(!etr_buf))
>> +        return -EINVAL;
>> +
>> +    if (etr_buf->mode == ETR_MODE_ETR_SG &&
>> +        WARN_ON(!tmc_etr_has_cap(drvdata, TMC_ETR_SG)))
>> +        return -EINVAL;
>> +
>> +    if (WARN_ON(drvdata->etr_buf))
>> +        return -EBUSY;
>> +
>> +    cfg.tmc_id = drvdata->qdcp.id;
>> +    tmc_etr_qdcp_get_buffer_addr(drvdata, etr_buf, &cfg.paddr, 
>> &cfg.iaddr);
>> +    cfg.size = etr_buf->size;
>> +    cfg.sg_mode = etr_buf->mode == ETR_MODE_ETR_SG;
>> +    cfg.ffcr = tmc_etr_default_ffcr(drvdata);
>> +
>> +    drvdata->etr_buf = etr_buf;
>> +    ret = qdcp_tmc_etr_enable(drvdata->qdcp.provider, &cfg);
>> +    /*
>> +     * A failed or timed-out request may still have been executed, so
>> +     * firmware may be writing into the buffer. Only release it once a
>> +     * stop is confirmed, else keep it pinned for a later retry.
>> +     */
>> +    if (ret && !qdcp_tmc_etr_disable(drvdata->qdcp.provider, drvdata- 
>> >qdcp.id))
>> +        drvdata->etr_buf = NULL;
>> +    return ret;
>> +}
>> +
>> +/*
>> + * drvdata->etr_buf is the buffer firmware may be writing into. It is 
>> only
>> + * cleared once firmware has confirmed the stop, so a non-NULL 
>> etr_buf with the
>> + * sink disabled means a stop is still pending and the buffer must 
>> not be freed
>> + * or replaced.
>> + */
>> +static int tmc_etr_qdcp_disable_hw(struct tmc_drvdata *drvdata)
>> +{
>> +    int ret;
>> +
>> +    if (!drvdata->etr_buf)
>> +        return 0;
>> +
>> +    ret = qdcp_tmc_etr_disable(drvdata->qdcp.provider, drvdata- 
>> >qdcp.id);
>> +    if (ret) {
>> +        dev_err(&drvdata->csdev->dev,
>> +            "failed to stop QDCP ETR: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    tmc_etr_sync_sysfs_buf(drvdata);
>> +    drvdata->etr_buf = NULL;
>> +    return 0;
>> +}
>> +
>> +static int tmc_enable_etr_sink_sysfs_qdcp(struct coresight_device 
>> *csdev)
>> +{
>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    struct etr_buf *sysfs_buf;
>> +    int ret = 0;
>> +
>> +    /*
>> +     * tmc_etr_get_sysfs_buffer() takes drvdata->spinlock internally to
>> +     * read/install drvdata->sysfs_buf, but every other QDCP path
>> +     * (read_prepare/read_unprepare/disable) serializes that same field
>> +     * through drvdata->qdcp.lock instead. Call it with qdcp.lock 
>> already
>> +     * held so qdcp.lock is the single lock protocol for sysfs_buf/
>> +     * etr_buf/reading from the QDCP driver's point of view; spinlock
>> +     * nests safely inside the mutex.
>> +     */
>> +    mutex_lock(&drvdata->qdcp.lock);
>> +
>> +    /* Retry an unconfirmed stop before the buffer can be replaced. */
>> +    if (drvdata->etr_buf && coresight_get_mode(csdev) == 
>> CS_MODE_DISABLED) {
>> +        ret = tmc_etr_qdcp_disable_hw(drvdata);
>> +        if (ret) {
>> +            mutex_unlock(&drvdata->qdcp.lock);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    sysfs_buf = tmc_etr_get_sysfs_buffer(csdev);
>> +    if (IS_ERR(sysfs_buf)) {
>> +        mutex_unlock(&drvdata->qdcp.lock);
>> +        return PTR_ERR(sysfs_buf);
>> +    }
>> +
>> +    if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
>> +        csdev->refcnt++;
>> +        goto out;
>> +    }
>> +
>> +    if (coresight_get_mode(csdev) != CS_MODE_DISABLED) {
>> +        drvdata->sysfs_buf = NULL;
>> +        mutex_unlock(&drvdata->qdcp.lock);
>> +        tmc_etr_free_sysfs_buf(sysfs_buf);
>> +        return -EBUSY;
>> +    }
>> +
>> +    ret = tmc_etr_qdcp_enable_hw(drvdata, sysfs_buf);
>> +    if (!ret) {
>> +        coresight_set_mode(csdev, CS_MODE_SYSFS);
>> +        csdev->refcnt++;
>> +    }
>> +
>> +out:
>> +    mutex_unlock(&drvdata->qdcp.lock);
>> +    if (!ret)
>> +        dev_dbg(&csdev->dev, "TMC-ETR enabled\n");
>> +    return ret;
>> +}
>> +
>> +static int tmc_disable_etr_sink_qdcp(struct coresight_device *csdev)
>> +{
>> +    struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +    int ret;
>> +
>> +    mutex_lock(&drvdata->qdcp.lock);
>> +    if (drvdata->reading) {
>> +        mutex_unlock(&drvdata->qdcp.lock);
>> +        return -EBUSY;
>> +    }
>> +
>> +    csdev->refcnt--;
>> +    if (csdev->refcnt) {
>> +        mutex_unlock(&drvdata->qdcp.lock);
>> +        return -EBUSY;
>> +    }
>> +
>> +    /*
>> +     * The core drops the path whatever is returned here, so nobody 
>> is left
>> +     * to retry. If the stop is not confirmed the buffer stays pinned 
>> and
>> +     * the next enable, read or removal retries it.
>> +     */
>> +    ret = tmc_etr_qdcp_disable_hw(drvdata);
>> +    drvdata->pid = -1;
>> +    coresight_set_mode(csdev, CS_MODE_DISABLED);
>> +    mutex_unlock(&drvdata->qdcp.lock);
>> +
>> +    if (!ret)
>> +        dev_dbg(&csdev->dev, "TMC-ETR disabled\n");
>> +    return ret;
>> +}
>> +
>> +void tmc_qdcp_etr_shutdown(struct tmc_drvdata *drvdata)
>> +{
>> +    mutex_lock(&drvdata->qdcp.lock);
>> +    if (tmc_etr_qdcp_disable_hw(drvdata))
>> +        dev_warn(&drvdata->csdev->dev,
>> +             "QDCP ETR did not stop, leaving trace buffer allocated\n");
>> +    coresight_set_mode(drvdata->csdev, CS_MODE_DISABLED);
>> +    mutex_unlock(&drvdata->qdcp.lock);
>> +}
>> +
>> +static int tmc_enable_qdcp_etr_sink(struct coresight_device *csdev,
>> +                    enum cs_mode mode,
>> +                    struct coresight_path *path)
>> +{
>> +    switch (mode) {
>> +    case CS_MODE_SYSFS:
>> +        return tmc_enable_etr_sink_sysfs_qdcp(csdev);
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static const struct coresight_ops_sink tmc_qdcp_etr_sink_ops = {
>> +    .enable        = tmc_enable_qdcp_etr_sink,
>> +    .disable    = tmc_disable_etr_sink_qdcp,
>> +};
>> +
>> +static const struct coresight_ops tmc_qdcp_etr_cs_ops = {
>> +    .sink_ops    = &tmc_qdcp_etr_sink_ops,
>> +};
>> +
>> +int tmc_qdcp_etr_sink_setup(struct device *dev, struct tmc_drvdata 
>> *drvdata,
>> +                u32 devid, struct coresight_desc *desc)
>> +{
>> +    desc->groups = coresight_qdcp_etr_groups;
>> +    desc->ops = &tmc_qdcp_etr_cs_ops;
>> +    drvdata->etr_get_state = tmc_etr_qdcp_get_state;
>> +
>> +    tmc_etr_init_caps(drvdata, 0);
>> +
>> +    return tmc_etr_setup_sg_and_dma_mask(dev, drvdata, devid);
>> +}
>> +
>> +int tmc_qdcp_etr_read_prepare(struct tmc_drvdata *drvdata)
>> +{
>> +    int ret = 0;
>> +
>> +    mutex_lock(&drvdata->qdcp.lock);
>> +    if (drvdata->reading) {
>> +        ret = -EBUSY;
>> +        goto out;
>> +    }
>> +
>> +    if (!drvdata->sysfs_buf) {
>> +        ret = -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    ret = tmc_etr_qdcp_disable_hw(drvdata);
>> +    if (ret)
>> +        goto out;
>> +
>> +    drvdata->reading = true;
>> +out:
>> +    mutex_unlock(&drvdata->qdcp.lock);
>> +    return ret;
>> +}
>> +
>> +int tmc_qdcp_etr_read_unprepare(struct tmc_drvdata *drvdata)
>> +{
>> +    struct etr_buf *sysfs_buf = NULL;
>> +    int ret = 0;
>> +
>> +    mutex_lock(&drvdata->qdcp.lock);
>> +    if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
>> +        /*
>> +         * If firmware does not resume, stay in SYSFS mode: the core
>> +         * still holds its sink reference, and the final disable()
>> +         * drops it.
>> +         */
>> +        ret = tmc_etr_qdcp_enable_hw(drvdata, drvdata->sysfs_buf);
>> +    } else {
>> +        sysfs_buf = drvdata->sysfs_buf;
>> +        drvdata->sysfs_buf = NULL;
>> +    }
>> +    drvdata->reading = false;
>> +    mutex_unlock(&drvdata->qdcp.lock);
>> +
>> +    if (sysfs_buf)
>> +        tmc_etr_free_sysfs_buf(sysfs_buf);
>> +    return ret;
>> +}
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 361a433e6f0c..c53a1ee8b1fd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -911,7 +911,8 @@ static void get_etr_buf_hw(struct device *dev, 
>> struct etr_buf_hw *buf_hw)
>>       buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
>>       buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
>> -    buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
>> +    buf_hw->has_catu = !tmc_has_qdcp(drvdata) &&
>> +                    !!tmc_etr_get_catu_device(drvdata);
>>       buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
>>   }
>> @@ -1019,6 +1020,15 @@ tmc_etr_buf_insert_barrier_packet(struct 
>> etr_buf *etr_buf, u64 offset)
>>       return offset + CORESIGHT_BARRIER_PKT_SIZE;
>>   }
>> +int tmc_etr_mmio_get_state(struct tmc_drvdata *drvdata, u64 *rrp,
>> +               u64 *rwp, u32 *status)
>> +{
>> +    *rrp = tmc_read_rrp(drvdata);
>> +    *rwp = tmc_read_rwp(drvdata);
>> +    *status = readl_relaxed(drvdata->base + TMC_STS);
>> +    return 0;
>> +}
>> +
>>   /*
>>    * tmc_sync_etr_buf: Sync the trace buffer availability with drvdata.
>>    * Makes sure the trace data is synced to the memory for consumption.
>> @@ -1030,10 +1040,11 @@ static void tmc_sync_etr_buf(struct 
>> tmc_drvdata *drvdata)
>>       struct etr_buf *etr_buf = drvdata->etr_buf;
>>       u64 rrp, rwp;
>>       u32 status;
>> +    int ret;
>> -    rrp = tmc_read_rrp(drvdata);
>> -    rwp = tmc_read_rwp(drvdata);
>> -    status = readl_relaxed(drvdata->base + TMC_STS);
>> +    ret = drvdata->etr_get_state(drvdata, &rrp, &rwp, &status);
>> +    if (ret)
>> +        return;
>>       /*
>>        * If there were memory errors in the session, truncate the
>> @@ -1054,6 +1065,16 @@ static void tmc_sync_etr_buf(struct tmc_drvdata 
>> *drvdata)
>>       etr_buf->ops->sync(etr_buf, rrp, rwp);
>>   }
>> +u32 tmc_etr_default_ffcr(struct tmc_drvdata *drvdata)
>> +{
>> +    u32 ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
>> +           TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
>> +
>> +    if (drvdata->stop_on_flush)
>> +        ffcr |= TMC_FFCR_STOP_ON_FLUSH;
>> +    return ffcr;
>> +}
>> +
>>   static int __tmc_etr_enable_hw(struct tmc_drvdata *drvdata)
>>   {
>>       u32 axictl, sts, ffcr;
>> @@ -1102,10 +1123,7 @@ static int __tmc_etr_enable_hw(struct 
>> tmc_drvdata *drvdata)
>>           writel_relaxed(sts, drvdata->base + TMC_STS);
>>       }
>> -    ffcr = TMC_FFCR_EN_FMT | TMC_FFCR_EN_TI | TMC_FFCR_FON_FLIN |
>> -        TMC_FFCR_FON_TRIG_EVT | TMC_FFCR_TRIGON_TRIGIN;
>> -    if (drvdata->stop_on_flush)
>> -        ffcr |= TMC_FFCR_STOP_ON_FLUSH;
>> +    ffcr = tmc_etr_default_ffcr(drvdata);
>>       writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>>       writel_relaxed(drvdata->trigger_cntr, drvdata->base + TMC_TRG);
>> @@ -1180,14 +1198,14 @@ tmc_etr_setup_sysfs_buf(struct tmc_drvdata 
>> *drvdata)
>>                    0, cpu_to_node(0), NULL);
>>   }
>> -static void
>> +void
>>   tmc_etr_free_sysfs_buf(struct etr_buf *buf)
>>   {
>>       if (buf)
>>           tmc_free_etr_buf(buf);
>>   }
>> -static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>> +void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>>   {
>>       struct etr_buf *etr_buf = drvdata->etr_buf;
>> @@ -1232,7 +1250,7 @@ void tmc_etr_disable_hw(struct tmc_drvdata 
>> *drvdata)
>>       drvdata->etr_buf = NULL;
>>   }
>> -static struct etr_buf *tmc_etr_get_sysfs_buffer(struct 
>> coresight_device *csdev)
>> +struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>>   {
>>       int ret = 0;
>>       unsigned long flags;
>> @@ -1927,6 +1945,9 @@ int tmc_read_prepare_etr(struct tmc_drvdata 
>> *drvdata)
>>       if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>>           return -EINVAL;
>> +    if (tmc_has_qdcp(drvdata))
>> +        return tmc_qdcp_etr_read_prepare(drvdata);
>> +
>>       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>       if (drvdata->reading) {
>>           ret = -EBUSY;
>> @@ -1963,6 +1984,9 @@ int tmc_read_unprepare_etr(struct tmc_drvdata 
>> *drvdata)
>>       if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>>           return -EINVAL;
>> +    if (tmc_has_qdcp(drvdata))
>> +        return tmc_qdcp_etr_read_unprepare(drvdata);
>> +
>>       raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>>       /* RE-enable the TMC if need be */
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..bb30957af1e3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -13,6 +13,7 @@
>>   #include <linux/mutex.h>
>>   #include <linux/refcount.h>
>>   #include <linux/crc32.h>
>> +#include <linux/soc/qcom/qdcp.h>
>>   #define TMC_RSZ            0x004
>>   #define TMC_STS            0x00c
>> @@ -166,6 +167,18 @@ enum etr_mode {
>>   };
>>   struct etr_buf_operations;
>> +struct tmc_drvdata;
>> +
>> +/*
>> + * tmc_etr_get_state_fn - read back {rrp, rwp, status} for an ETR sink.
>> + * Resolved once at probe time to either the local-MMIO or QDCP firmware
>> + * implementation, so tmc_sync_etr_buf() does not need to branch on
>> + * tmc_has_qdcp() on every buffer sync. Returns 0 on success; the 
>> local-MMIO
>> + * implementation always succeeds, the QDCP implementation may fail 
>> if the
>> + * firmware transaction fails.
>> + */
>> +typedef int (*tmc_etr_get_state_fn)(struct tmc_drvdata *drvdata, u64 
>> *rrp,
>> +                     u64 *rwp, u32 *status);
>>   /**
>>    * struct etr_buf - Details of the buffer used by ETR
>> @@ -245,6 +258,14 @@ struct tmc_resrv_buf {
>>    *        (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *         Used by ETR/ETF.
>> + * @qdcp:    QDCP connection state for firmware-owned ETR instances.
>> + *        @qdcp.id is the QDCP TMC identifier. @qdcp.lock does more than
>> + *        its name in struct qdcp_consumer suggests: QDCP enable/
>> + *        disable makes a sleeping firmware RPC, so it cannot share
>> + *        @spinlock, and instead serialises those calls together with
>> + *        the csdev->refcnt/mode transitions they guard.
>> + * @etr_get_state: resolved at probe time to the local-MMIO or QDCP ETR
>> + *         {rrp, rwp, status} readback implementation.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -275,8 +296,15 @@ struct tmc_drvdata {
>>       struct etr_buf        *perf_buf;
>>       struct tmc_resrv_buf    resrv_buf;
>>       struct tmc_resrv_buf    crash_mdata;
>> +    struct qdcp_consumer    qdcp;
>> +    tmc_etr_get_state_fn    etr_get_state;
>>   };
>> +static inline bool tmc_has_qdcp(struct tmc_drvdata *drvdata)
>> +{
>> +    return !!drvdata->qdcp.provider;
>> +}
>> +
>>   struct etr_buf_operations {
>>       int (*alloc)(struct tmc_drvdata *drvdata, struct etr_buf *etr_buf,
>>                int node, void **pages);
>> @@ -339,9 +367,27 @@ int tmc_read_prepare_etr(struct tmc_drvdata 
>> *drvdata);
>>   int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata);
>>   void tmc_etr_disable_hw(struct tmc_drvdata *drvdata);
>>   extern const struct coresight_ops tmc_etr_cs_ops;
>> +int tmc_etr_mmio_get_state(struct tmc_drvdata *drvdata, u64 *rrp, u64 
>> *rwp,
>> +               u32 *status);
>>   ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>>                   loff_t pos, size_t len, char **bufpp);
>> +struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device 
>> *csdev);
>> +void tmc_etr_free_sysfs_buf(struct etr_buf *buf);
>> +void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata);
>> +u32 tmc_etr_default_ffcr(struct tmc_drvdata *drvdata);
>> +int tmc_etr_setup_sg_and_dma_mask(struct device *dev,
>> +                  struct tmc_drvdata *drvdata, u32 devid);
>> +extern const struct attribute_group coresight_tmc_group;
>> +extern const struct attribute_group coresight_qdcp_tmc_group;
>> +/* QDCP-owned ETR functions, see coresight-tmc-etr-qdcp.c */
>> +int tmc_qdcp_etr_probe_setup(struct device *dev, struct tmc_drvdata 
>> *drvdata,
>> +                 u32 *devid);
>> +int tmc_qdcp_etr_sink_setup(struct device *dev, struct tmc_drvdata 
>> *drvdata,
>> +                u32 devid, struct coresight_desc *desc);
>> +int tmc_qdcp_etr_read_prepare(struct tmc_drvdata *drvdata);
>> +int tmc_qdcp_etr_read_unprepare(struct tmc_drvdata *drvdata);
>> +void tmc_qdcp_etr_shutdown(struct tmc_drvdata *drvdata);
>>   #define TMC_REG_PAIR(name, lo_off, hi_off)                \
>>   static inline u64                            \
>>
> 

