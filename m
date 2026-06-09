Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2541362C
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007965; cv=none; b=kyJxhfAdU1UkTVascebuF9hu9rQrp5gT8KGjwefUhOAHLkf5N7yfZAmywqYws9c2PmNL4QdCftqllUyiPvzyP32s1LtUHhC/al1Wx3iBiukKO2yxLqLplaXzDSag6s248P1kmZt6ZI8tZZztAWkiJzkc9Om8ChX5eohOc+BylOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007965; c=relaxed/simple;
	bh=Ts2/FF30nKpmBcjGZN0aUYdrj2LtbrxodUaLBGi4zIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nmsrM+YWXZ8o9UhL+82pg3r58bkb/aiZxdnUrwCyWDU6QyTMOL4GdXyqrsiQHKiK4JUZ8kx2VsigVvOE2wcl25qyyIXLet/npqlQUQRUZayuNk9hfCWigw0jAaqzsOV/iaIFiSWSGhiH8VpCLU+3j9b3lm4E+VBry3rmwSV11No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc3akBcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2tO+sz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc3akBcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2tO+sz4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Bndw52155577
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=; b=Lc3akBczV43yjUbM
	X0EyPi6/uvJyn0f3w5Wj29bV2WhiLYmeb8q1rdk17fleqDyS1tuKDglqpD3kkqF5
	rZ9cwOR4i2RKsyIhGJprctORhHnH1Z0GcjD+CHk/QSLhGDDbLzm16WAQUs15ukQW
	2Yk24Vg2ymIVSxKta5H9IOH+86NRMCnGiPGK2hZtfCPq15m/zknwnc5Zf6ad5IYd
	tM/yngbnSjfDLWXm75viFzzuT8Qh61SPVRUUoZL99QxG784Lt9pYQ3vO0yG+WRG8
	oYjxT/86GgD6be1BwBem8GAzRzS8WVO9btR+ivLCW/atCrRGi1fzC+966mNq0bRP
	CX97+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrqsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:26:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso149146485a.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007960; x=1781612760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=;
        b=E2tO+sz4ugTHr1D5+z7Ck/AZCbSZnhrj1ilHnAEFa6FDCBljqLZiSGw5myn6GcuNBm
         AmiA1KTTQ011P0f4bweFz53irObLEYt6A0Kw1T2c+aazFyt7afmK4dorBxx02yyludCN
         bloqDSNJM5ikDEZyj3Kq/nXHFlKvmXp+5ovI19+321BIMHd61A2UYq+/cP9O1ySfmOcZ
         NNnx135fbSCfAzebxPZ09qHByVRICGMsooGxQkE20yDuQT5BJFz4bEFOaIw4JirnW1e3
         DB41l+/tWL3n9SHN5EbdCRLRVcHr09eR3IF3P5IPXYJqHgscDbMdnShr2/ssH7I4BZQC
         8MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007960; x=1781612760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7P+3n7+hHYd59il+PzNqQYdlKI3EP1oX8aavZ/2jfM=;
        b=HiCVyi6okgagiQL/aKK6Jkr0lWfmYnqlc06MhQ143fjTSJ9ynKCplwQ3owocFLzoy3
         0CLJtnT2v46YS5SdFzwpAuBg63IJ+AQpEzVGYaW4u0+GA4AC4EBGmz6vRY63rws9i0qk
         S1SRz29PZqtk5DSTaqTIKZlC2GQa2R6xM9IwWSBnTvHqb5Kp8hCTA2sgJxUvYED/DYoT
         8mdxG5a0/FLdLrbL+DHmBlJm7C6YOOiqMX6V1tBAO51Goh8s1+idsVJ/KyD3meLOCGEE
         wPA4V8edqL3zqFNyu4m5aakUcNOaJ17FyeuNGCnZ5DRl8A/gvYyrB4K65DSWKKF1txws
         MRAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+g1Q2o+zPhaA78GpzpgSMw2FZ9vgDusIcnzVI/IoJ0HGbTU2QFA8lqyL619b4+9OVZ9UtptwSF7Thn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1YAc1I3A12EO85OwJSDmof0X7zraFjnqExM+E5dykri06SVdu
	AE2+W1iJ/2hAOl9GOwzux9dVvWG6rtd1+lIF0Xra67AXms5GhuEsObhVXL/s5P9ivzdUorivUJk
	yOlDxpMnpK5Ktt/YN4IxmfQL1mgO60Sts869gtx5NUepb0g0fwtS8/qJ2mSzPGP8Y
X-Gm-Gg: Acq92OH+zuYQi9bAiEqjPcoHbcln4WTs/tyUmyh3nmFyAHVVscWRc04lm+U+sLBvvor
	zKudBBqONfcM2kibi6wxSEaxi7M3FSv982FM4P+8KOwLF1FWeMmMnPWGMPc0BKZqb5ZgyQJK2fv
	rMMvPu6eKT7GhV+6WRLcZhKFsuMYPABRzJjw2lb0B1uvqBGSgL67FXMvswmSqnIbkXfMRGe3oeI
	Xx9pmjgIkBJvo+gVk+HHP6WQ62TPehbnWT9HUulW8RcXjbAz7a/M6FuG13kHBAFsiuY+cW7gPWE
	PxyrYQKQqRZ4kR/x4EF1daLIVXormj4pndyEsJzk4rnvdBOcU2+1JmzfVyDvq7XE71LKGtDdOJB
	Yy+oJSDrAiODlAZRc0P8BdXlw7hMIqn6kbO4SU//Fxw4XoB4audWsXSdt
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr1973571785a.8.1781007960151;
        Tue, 09 Jun 2026 05:26:00 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:911:295d:59a1 with SMTP id af79cd13be357-915a9e00b2dmr1973567485a.8.1781007959707;
        Tue, 09 Jun 2026 05:25:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051b8c7efsm1021314666b.14.2026.06.09.05.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:25:58 -0700 (PDT)
Message-ID: <271de410-76a3-4bc6-ae78-2054fd7b8480@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:25:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,gcc-msm8660: add CE2_P_CLK,
 PLL4_VOTE + per-clock annotations
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <20260530135731.185313-1-github.com@herrie.org>
 <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c36dcf40802d89a4b43255394386fff974a6301c.1780197117.git.github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: URxrG3C9xnUo3zehC9P5vwi9aDBW-iJp
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a280659 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TTKJ41doIbe5-gzaxsQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNyBTYWx0ZWRfXwhYqrscnsCCi
 IU6x29A+CYr5OrTAq0jFDWF+s3pPGxdLck6+IAwJwiOHaR/bOcJli0nfbiM7zg6sUDKVX8Y3O3+
 gHgLRqXNf1mgJ6LlxoNvCXqJrqTf4A0M1LBM7oG0CY4g05fjHXw8jQWsBRdqlCv46aaV6DjIDeX
 tpK8IyrIIfuf6LcoQa+89OGGJWyx+eHjhb91DBg9BrXCtRuZ1T/GhnPZ/+T6fcGXwfsydFKiJNY
 18qNfWb0AfCHBz6uQuXlfXTPZK+Ddf7OmBWFpJf5SFD0O+auNmxvAHCGwApRQhSGgQYeoP1n6wL
 E446pIP35A4d+dwdlcuANizgLRhbOYj/HKMCjQMhd0kJGVSW7ylFK/byyJDRV26vymmQrLLyVXm
 UvHNRIj8l6bP6fjUNx0eZDaMwLm6pv+XBN0CJpCpRWE80+xXCQ0p9lFEwWF3VX+OUY2RhzTiPZu
 ejNxPuSSYcLACxEoE0Q==
X-Proofpoint-ORIG-GUID: URxrG3C9xnUo3zehC9P5vwi9aDBW-iJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090117

On 5/31/26 6:08 AM, Herman van Hazendonk wrote:
> Annotate each clock with provenance and consumer information cross-
> referenced against the GCC driver, the downstream HTC/Samsung/Palm
> sources and the legacy TouchPad / Pre3 vendor trees, so reviewers
> adding new MSM8x60 board DTs can tell at a glance whether a given
> clock is wired up in the GCC driver, in the device tree, or both.
> 
> Add two clocks that the in-tree driver and downstream consumers
> already use but which were missing from the header:
> 
>   - CE2_P_CLK (Crypto Engine 2 APB) - needed by drivers/crypto/qce
>     for the MSM8x60 CE2 path that the qcom,msm8660-qce binding adds.
>   - PLL4_VOTE - software-vote handle for the LPASS PLL4 used by both
>     lcc-msm8660 and the modem subsystem.
> 
> Both new IDs are appended at the end of the existing numbering
> (258 and 259) so that every previously-allocated ID in the header
> keeps its current value. This preserves DT ABI for any existing DTB
> compiled against the prior header.

Is this claude talking?

If not, while this is indeed true, it's something implicit and
definitely not adding value in an individual platform's header..

Konrad
