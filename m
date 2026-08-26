Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8283F58D9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748781; cv=none; b=DqLE+27s8JIdkLMah16KC4MOecWu/PFFMXKbaCLFG9J5aZANY8DIPaF6toa5UUm9h0RgzVYRI51Z4WGER/biKeMvsQlViD7TKRqDMxuvDQkWBVjDI8RnKMgcjkn7Piv1E8T2HW5OSXsSXW5yh5QqrjSw6VjFEKjtUT38ZIeeBd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748781; c=relaxed/simple;
	bh=WKvODjXitmfFPfAG/gy9D4hMRVexb8bj4k8N5J0scWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQ4FWm1jHJ5ZmjsfbGxNOCW620lw6k+GI3W4SHpyu7n08EWEHIhNYpyB6QklRUunZdP20SfBlasqKljR8725Dn4KsSf2MAOjKQVJerQYyWG7CjA9HDTyogQM2sHot59UnWW7UY+ZHAitnqrVDaVGy/45JfHP/1AJGeTGj6JnP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDUIZzOL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AQ/3cOCM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDUIZzOL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AQ/3cOCM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCNFZ1295703
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=; b=MDUIZzOLG/xaNMuS
	Qs3/6xV2NLRxJQYybM8+X8E8uG+xngf36QVohX5IIJAfC2+MVRzUSOa1AqKX5TqW
	p3G3jqPK6t3wutGJZEN7M07qqnQ2U9+yxRRLiQfCu+YCu/fgDfPTTOivfMC/BVK8
	2M9vobhrBPLluIFI09N77/dzT07uENqfbQ6DOSuhi1K+Gqv8XKf3R6Grt1Hxi75Y
	HxVBGy5pa/AAPZI2um+/zXpCdGkGsy9oSZBAmXkzpDRr5LjPYDwaZN1uFX6NHQVZ
	ATESggMM0bo30mrsylr4BGxT/llqUl/KJrtRm/eLA6iC4HrSx3tUM8x4LW4lP+Xa
	OcnG+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u038t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 12:52:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1422510a91.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787748779; x=1788353579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=;
        b=AQ/3cOCMS6huLonu+BgV4+iayDWe/NUPxFMuJE6qNjEtEaQxsIXFk3YCUYe/08Ho/H
         2ngyBNLk62I/VvLS9kaorzARicRgmrMit0rC1XzNqy8bNm/SVw4fX8A09n0fBC84Klbt
         jDWpOE8TSYHtB76XgKiKFlpjM3H9llyTGhk5CepcRWdlC0mpL8HWnTlI1ZNH7SHjqklQ
         b6yLHBeU5/t6dGWvzQ6k8wUcI7zUAyPkpRKNDn6Bra7lijYm47rraVsb4fFB6s9xK1vB
         BS9QWG5V+HAN+l23wSkvTgot+4GTn6lRIh8MPzipFtX89Pnv0VVk8NmlhDMSKD2FIuox
         jmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748779; x=1788353579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNQy4Y4QWEwkxWzbv8l3UovuMLGmgUb0gTLe2xWCdfs=;
        b=Md5Opvyq86ir2LeXqG5CQyxJvZNC5DTgXb77ReN3b0fKcbZ1UJzD+0Ygk/oC76aKqX
         2xsis+WtUbV7zVVir4z9EJv+28s6BJ+qIExMuRIBIbbDwOp48Q3g5e6k2+CKQEE6ZUvt
         E83U6ExcNNIjoIyHbrM7ptbAdfkTff/+jEPpNC+x3fp/zynnuivylPrET/qyNweyvlYD
         0coeiT8Kl9OIegVKsoFVUklI3C9zMe2tASSI994pCtzNMZ3oZScGvdg0s3r0baChn2E6
         1c+Arwby1i/w4ktGYs7Y3Fq1aZl98X2xddZcFtoAOGvBTYSMK0zXt4pzNuf0uxWskrIx
         MHMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCjUD71Ws93E/RmdDpi8AjnxYRZ08Uq5T8rnvpJH3yA2R+7r34Khp9PSqA+tlDaagOPxuyI8JrJIsS@vger.kernel.org
X-Gm-Message-State: AFuF++ktYtt+iPOa3+XU34NQaBrrjlzvDHYePpuP37ntFFNvUFeN8sLd
	rDCJMSttQDxite8xr7wXxjOHalyYw6wN2p1IajticwgBinTxY69dHa4dvaN+Atg3Atzxfez1tVX
	I9KZKLwuAfv7AcDTYQH6/UFighfnjC9q9t6qpz0r9q98qVoDppeKhbhfd/j2Zr7Lj
X-Gm-Gg: AR+sD120c8zWuOnA8+X8YO27h4HaQ46d4YxNkzzGdq4lTLxteesYpapFcFdzKAd35Lq
	0pDeXQyivDMUKPnyqOMOWOvEDN7BexXNgc7+qbJYdtgQw9cABURn9Do2W/cCkjYs6eODX3LYRRq
	Wdbdwa/3856yT3zgCm4+GANg42XIGKjoKJQfQEEz+LxaZvi007JKpPzWh9H92iCxML6HC4JqKll
	iBH415TT+BGLHxbIWpKe7zqbDFb+ZHmVkxXbtTvwjsAnSEQLvj8UWgSPC7SPLp+rZ/XMrMuHQ7F
	5aBCVvlqGikvHQl22qOlY4oBrwfrXW15CCJGwvP/U60n7cj78EHuU1/gEb33c7c0t4DnbE/ozye
	eHJXGOsKwL8EHSxeD5JDaP6JwcMM9hMWx
X-Received: by 2002:a17:90b:3f46:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3966d3d8a07mr14427507a91.10.1787748778831;
        Wed, 26 Aug 2026 05:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3f46:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3966d3d8a07mr14427403a91.10.1787748778378;
        Wed, 26 Aug 2026 05:52:58 -0700 (PDT)
Received: from [10.218.4.101] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3966875e5c3sm4076282a91.7.2026.08.26.05.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 05:52:54 -0700 (PDT)
Message-ID: <41af9695-44f2-48cb-b5f2-8e779f7366cc@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:22:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260813-i2c-qcom-slave-v3-0-1d3742e2ad47@oss.qualcomm.com>
 <20260813-i2c-qcom-slave-v3-2-1d3742e2ad47@oss.qualcomm.com>
 <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <9c8e4e57-135b-4f24-97b5-dde9c0418efd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfXxClHoTbBQf3t
 SUkweVD3A69cRHXcsAtzJqUsCCkyREH58VpLssbrXn3X5OUeO+Ta/UK+kvHTjS/BJ/vhU6LSQcJ
 exb+F9RFxZkSY0a5C0uEWcaS4AcQPAf7McTVC7vNCYNnhaTzeoHxWmKGTRIUSznRaPdRDNanwrB
 2KFQ3MBaSsDbSokgX78WfbdJaPCkzgytmHVSdzKlXyR+hhiAhJIJCUrUWxehVMyqZV85YRcWzO+
 PnlauBa9sjSORxkalKkFKKD5FRCOHnaDzPrLK03bRMP4UtrhgO4dcxvqmHlPw/GiSPfPzP9FxLo
 UsqcnFy/MDkRLNx2Tniv3iSO5L410wdyopbe9gJUay8EI0/R6DgxmuxXAaLxL0D/4+8iDORb7Wk
 QykEdPR82ERcKMTUBuJLQ10u5NIlv/l7LWxYq1MrCykktsTEJKde5rGljsbwEyio9FjQK3fXjBH
 qTJ1gLQ4E5UtLxRBEjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX8Af3swntLX29
 9zKSAZvIx9/VvGRNZVYuvc77bQFqbJ7HRoADGz9qTo5Y97DSclUPzW8Jch0n0zoss/V+38rCh85
 Lv3LhugIhQ+a+VJqfJEG2V1/Ly2PvEc=
X-Proofpoint-ORIG-GUID: EqxSWNSnr_9miLHYqQwPFV5bf5i_v5sV
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8ee1ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=jJ7N_Ga9sRvXCTnihBAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EqxSWNSnr_9miLHYqQwPFV5bf5i_v5sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260106



On 8/25/2026 3:11 PM, Konrad Dybcio wrote:
> On 8/13/26 5:52 PM, Viken Dadhaniya wrote:
>> QDU1000 and related Qualcomm SoCs include a dedicated I2C target
>> controller that operates exclusively in target mode. The existing
>> Qualcomm I2C controller drivers (GENI, QUP) are master-only and cannot
>> serve systems where the SoC must respond as an I2C target on the bus.
> 
> [...]
> 
>> +	ret = clk_prepare_enable(target->xo_clk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable XO clock\n");
>> +
>> +	ret = clk_prepare_enable(target->ahb_clk);
>> +	if (ret) {
>> +		clk_disable_unprepare(target->xo_clk);
>> +		return dev_err_probe(dev, ret, "failed to enable AHB clock\n");
>> +	}
> 
> Does this need an OPP table? Presumably we need a power vote for each bus
> frequency

The xo and ahb are simple gate clocks with no rate states —
xo runs at a fixed 19.2 MHz and the ahb rate is fabric-managed.
Since this is a target-only controller the master drives bus speed,
so there is nothing for us to scale. OPP is not needed here

> 
> Konrad

