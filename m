Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC483370AED
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754723; cv=none; b=m9FYHgW6oSdLb8fU8JzOwx9kcheWd/w8RDUF/Ku8NZxf/9pME2b5wcvsrrhG3q7Q+O6kWPnCX0FZ8FzbBtE+9AbLF1E8kZY+ca+hCiYWtDvmoKWR9O4XcC/qYZn4SblBw8RVQk3yAEdHWUkHhs+0GGlp3mMzUh/m1vAlgpwRrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754723; c=relaxed/simple;
	bh=ztLTOarPSKwpkrfT/8tWfJ0OoEwaqQVUu2vFTA0Sh9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUU13VGhqcbMqY1HvfJOrHsS+tUGVyW+cSJwNW8dVZRDGSdrCr//55ur6zjkZOrsQviSZ96PEDaW+wXvPJ8Ld7dK8TNz/FTooUUdC1k1V0zvmwaAR5ur1LKZWrt3yg9TzSc10fSJAPq76d010qshJtzjapWWfB3VmP5GqsIKDCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UimpYpDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahWnRip2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UimpYpDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahWnRip2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736krVl4123774
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYYhPtjP/duwSzxMsoAaDgqOBpost4BcEfUADmQwM8g=; b=UimpYpDFN7xAFR0D
	mVjllVdiC74I648aHJ6v0SGZi2OkQwPGwXJDW39/slXW5AKqaMF7u36wWQUhlLXt
	N/S0YA83ksir5TdiZJYyF0E0zjgj33g3usb3tYkHBVdaXLnLTvyc4JhYjIr57y5R
	vKsL2XhpK3hRmq/SXMjQbCf0ijWriPMHhzNSI6XtGIFiSmqLRlYvRp4IOXo8l6Ka
	icNejt5x14ySfYesHTrknScbvzA2cs279VliL/15l3U2HExdqKsW08ToCM8IxLo2
	8QQ+QNrZTQs94Yu/TgdG7DOW5DuREER0lh4/J2UME3bqKVnmDpo1szXvRFAa5/Eu
	i052fQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp1692xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:58:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so3146730a91.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754720; x=1786359520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYYhPtjP/duwSzxMsoAaDgqOBpost4BcEfUADmQwM8g=;
        b=ahWnRip2X/bKFK+d7Y/6xgaL++QMTPJIyzV/3j9zLIuBqBv8gznjiTq8BoCxSl8kSf
         ofnDO39lf1mfsPWOoF+i95NxMSyLsT/UBLwY+8q892NlfcICQBG8jzSIT/nrED4oMcFX
         jbik9GYh7ArfTzn2luafVPrkkH3Yx+llRQ3e+jovOkI/MsQss1TahWBjg8IOP9LeSnRD
         DOAg3Dffsn6zOClbYhMMCQ/45aPNgumoMo3M5kjG2dFTt+MoFSTSNI79IJqsQKtlXpUM
         X1VoXKYrExTDshexfOn4SUfx7lMaTftaOgXUAuOvAR9cdO1z94S6uMtmJt8KjGKRbzCo
         gvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754720; x=1786359520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYYhPtjP/duwSzxMsoAaDgqOBpost4BcEfUADmQwM8g=;
        b=OjfFopKxSVHIsg7PFRXj76e1baDu21LTHTOx6C58T9xDAlimDTxqDGE85bM/P/w44s
         sZe5uNtOJT1kqxSNcMvLQ8kmBv/cjLtGxaRotR5S7nVzW31rWAN7c8b13zLah73P4FU1
         xIY0KcOhlcYqTNqIb0SJmSXhb332x2dAlWwMeP5j5KYqRlDfs/mmssF0bvd94wkdhS6g
         bnolbKjpJ1xnlpp6reMHsUVr1I8XcPK2mwsRgwAjU7LEx1nheKl1zWQDlORxtI9r/cFh
         jfMZuLsUADfW4BS2JLPQhxWgw0ORaX+A9lmsJWwWHQZUmtw/mVXbmbWwzkluol+MVLX7
         h9uA==
X-Forwarded-Encrypted: i=1; AHgh+RqMgN82jna2X3qyMNLyt/M6tEjMRY4MGlJuBGrOSKPbF6Eij0LzNoYpbcmG8vFIS1c11SQUtKgSMyso@vger.kernel.org
X-Gm-Message-State: AOJu0YznftIl907sInJfxuJwWTVUHIGoP/iyo+IW5ooKWxjqpvQf+X55
	QPB7VtEdQfCpPYOwDtU0ODWbl5QGI3j08UW/VX+5UI+tVpq4FlOxzN8JW/S/GPnztjVgsXEa4bd
	YbCWkElKHIrswgEI1F4yYbXRl3fja5Yus2t3ZA2cG+bnEfOmtdKdeSmvReAsk7tmA
X-Gm-Gg: AR+sD10ebABB94bH9z3PzABTv7bMUApmZoOWNVFf/Q1YBZ6NebJiA4cAhnA8L/2fEyn
	OPv2oNF+04YsbbvohO1yGTIt8kCyo8rXp1FOvdhYAuCllXWUKu4sHZ/RbDP6es1FxYU+/vxOb/L
	TCsPbyPP1zwH5ebIbXudcktpqyLsRfoc8DVfaAaWvyU1Sx+YWv9dHtrf7kNu5/dAOOpm+GbwC0b
	kfODJzk1ja5qGfV0ZoU4QIZDUaTccfLkTDhGGc/YYkGs2ysR0rojO9J2qMB0RPjYANaSrlsMMXH
	TM52VmCfhirRMtHBQUjd9MEtg34HCLboQVyStAv9q5DRuCfuKjSSpvNRJq0/0S3SK69EF31Bb3E
	Mdv5qIa7XXLHB6FDFMHytnt4YUC/I
X-Received: by 2002:a05:6a21:3417:b0:3c3:990b:2292 with SMTP id adf61e73a8af0-3c92a8f3f4fmr9269571637.57.1785754720459;
        Mon, 03 Aug 2026 03:58:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:3417:b0:3c3:990b:2292 with SMTP id adf61e73a8af0-3c92a8f3f4fmr9269540637.57.1785754719981;
        Mon, 03 Aug 2026 03:58:39 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm47453727c88.9.2026.08.03.03.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:58:39 -0700 (PDT)
Message-ID: <d7402165-e4aa-4860-a1d3-92841df7e7c5@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:28:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
 <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
 <aldiLuYib1jCK784@linaro.org>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <aldiLuYib1jCK784@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5OCBTYWx0ZWRfX6rd2TbHZ6UHe
 0d1zgGhP5yWEpsIbGvqsO52snVfkSrzuUo13naN9a6Xu/bGcECWYf338J4j3vpl3uebr06HyxQ7
 tv5DJBaxfXlp0diEI3+xf8O/iKIMJrTEAlPyNOJ9BLrz4Gc6C0wmb07nCUG5fWj6E+eIMbqFDV2
 si2fEMM5+ufqysvE+QTN2C/v4XrER5ORFxy38DfIYGIcJqLANd7/yjqYPbaUTjUWrijf8ICaXhf
 3rKlrQNgT4iuLLFRG1opaKZmCKqFWuTuiaQjzBDU4xhGgSKmfA0ndWB+6ivFawtTZyTNjZNpzZ5
 WhFZgyXn0hjOyGtI9PFPXN6XAs6Ze/y0cXYINS4pYYYnzMeYapkE1yt4y8VLl28xil6aHL8GFXd
 gTr2KT5MsDOLdW4jj3G5YVR9h08bEnzJ9YNIQLP8X0suuBVwzyz88snskwpxNDhrBNN7EsKieye
 GeJz5tX6ODWybxNSwig==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a707461 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ERnfXskPEjP3n-q0xIsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5OCBTYWx0ZWRfX/RxGasClWEPO
 r9b6r9jz+pMrFkN1dWfs22+8y8z2FpwmxkQhrqj1ArUDOICozWjUY4I8SRZCarH1Q/LDerOdZHg
 v9SjEo9afEzW0eRC80V/2Z0C7TwN0gM=
X-Proofpoint-ORIG-GUID: F4UPUaptjI0sxHsJpIBSlzOvya4gYVl_
X-Proofpoint-GUID: F4UPUaptjI0sxHsJpIBSlzOvya4gYVl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030098



On 15-Jul-26 4:04 PM, Stephan Gerhold wrote:
> On Wed, Jul 15, 2026 at 11:46:58AM +0200, Konrad Dybcio wrote:
>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
>>> the latest wake up capable interrupts when the CPU cluster is entering the
>>> deepest idle state. This is done by sending IPC interrupt to RPM and is
>>> implemented as .power_off() callback by registering MPM as parent power
>>> domain to CPU cluster.
>>
>> [...]
>>
>>> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
>>> notifications to manage RPM communication when the last CPU goes to power
>>> collapse.
>>
>> I have mixed feelings about this case. The RPMH RSC driver keeps that as a
>> fallback for platforms which don't have PSCI OSI mode specifically.
>>
>> On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
>> all of the arm32 platforms) that don't define any CPU power domains, so
>> perhaps it's necessary after all..
>>
> 
> I don't think this fallback is relevant for the non-PSCI QC platforms,
> for the following reasons:
> 
>  - They don't define the MPM.
>  - They don't support cluster idle upstream, so they don't need to
>    define the MPM. They can't reach the idle state where it would become
>    relevant.
>  - The setup for cluster idle without PSCI is essentially equivalent to
>    OSI, except that the SPM/SAW driver needs to program the idle state
>    to enter. There is one SPM/SAW for every idle domain (e.g. on
>    MSM8939: 2x4 CPU, 2x Cluster, 1x System). You can just model the
>    SPM/SAW instances as power domains to get the same setup as PSCI OSI
>    (I had a draft for this at some point). So if someone ever implements
>    this, we should be able to use the same approach as for PSCI OSI.
> 
> I'm not aware of non-OSI PSCI platforms with MPM either, so I'm not sure
> when this fallback would be used.
> 
> We probably do need some fallback for the old sm6375/agatii DTBs though.

Yes Stephan, this fallback will be required for RPM targets that do not have
power-domains property mentioned to facilitate the RPM notification in cluster
idle states, including agatti and sm6375.

Thanks,
Sneh
