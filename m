Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570027;
	b=V69IsfCKAjZljuUwJllt8fx9Lk35wAdgpyr7yQWcUaT1DBRAF7z0eUiJuIIPWIQ+vO2J
	 dDOwc95FrYaH/MTcg9vf7sY4p+sKmgcHKbLTG3JPKK2oSNMSoyWSG0KSUDpMBrRdIADXl
	 FWv2o5Mqzff2KZ/kWaUkACmDxox9lnNwQkkhYbF+ODSz1lCUMsQ7Q6paCbSLklkZr2tCe
	 ip8Fnn2STkV2QDWIaVBtqFY2gDAoTudCNBtatcYF7gVMuFIZmtwo4exWvHh5vT+s9GGr5
	 9jMG1TalHmvcUuSnzkgt7my5+nvVSSVFtwlbgJy2VM1zGi7yfZsfrcbUmM6A/NR9O5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
	b=DGDv/ygMv8tuGcOCryMJKlHljZQg8faOrbj3FL7HXAwufMOE53Y8dPlByREXHsjeWyHT
	 AZstkaHILdpR9bqA/zTmi4wGFGokLHaVoqJSCxZVH9nCMnSjktzjRIAfNfLvs0F+w0/sS
	 bDDjgwHgS+D89/FFjwMCcVJQuhVgzBAnR1NtGZU4fjP5k4rYZTQNVDli/yAnrISdyTOrn
	 a0cQ0g7FBeHtYTC8XVI6c69HZZFhwOBEQmHQhg/OwKxNwACUByfcjRmvkELvH/XPGUNrB
	 x9qmzmWwwIcQjQFVnffbdvubotwq2yvI+lRhPnt13dsWHxvRTDudZlZ6IHiUhvF3M1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71698606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71698606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D469CcCT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dbed3YSU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2Jm3926577
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=; b=D469CcCTYrCmjf5e
	kTVMVJaULrG6V/52/UBW+zUCeEHYMCS23FR61DZ96Zi+KVMtk4LceZ29x6hhnSYO
	u7g7S4mWz+7AVzr8ffWfGlLqmwwSbZjyHQuosD5fgfEGn+bTD11d7E8QQ/o3KI5n
	NB3ZJebwsi7GSYNA0aRGmSuR0emoZ4GXTvB3lahe9bJ192bC75gKLtpFK68ivodd
	o++Qs+GexfZMcacEu3JnMV4CIebit1pYaui0judywSnMRu6DYSJv9n3vY8tg2Sae
	byiXnqXIR2QcYJVZurzj8a/kHE0l8Ug8hpryf4l2a71O7fCPKEn1WDrxWUqc883T
	As38xQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2c9t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:07:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91bf35c4c78so1289616d6.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792570026; x=1793174826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=Dbed3YSUsOsde+b26ZkuvlXrUqVe9wqvw/2pafB51IGGl/JxdXiH9qSBP73EFYRGNs
         NbOOsbGJcNB9wUqBNThytp0xJJOLJLtHVzf3iBK9gAZJSgI3/oDLtsK/nby3/7FJlS9v
         hffhn4GspvtC185St2XQyvTwkiDnXepoEomueOjqc8xd1GiMc24Agzz3atjARzsBsQJg
         Zmuzsv5ih46LCe5UYCPdsmrynID+Ey24t8q9xuFQta8h44Pa0xG3j968trSHcINBQxuc
         5bt0L5OMDAD0DoHgb5x2PPouBPnkix+WbL2x+u4IqOKPPImmiq4rOfkUcRVrs/wAwUwM
         elog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570026; x=1793174826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+yqJSxYviGEzUWfX1sO70Vpcyk9lvgESMBpH30SQXs=;
        b=rWKqE7YBOGWly+M1me10VndsyoXBR+gECAFx/RCam0ZO9nXqQ5Uwvf7lsFIrxHq0S/
         31RLb2bZRdcBwpKRWSpX3LjfJnOMAvhbSO91SMoI8Ip2fobxkfqJrtB5CzZ6Sb9YBEMh
         TS9yNUo+m7jzk7Ml6DvZqn5DQ0UlslqBuOuJy4jWqtrIa+StvW/a+Zy55B0MesQfCLkI
         B/+aipV4S1oAcDF2Jr4zsLlnS8bW/OlyReyt5RuZVxC4EIFHMKZE9vYiXyC1TUhC6y5y
         sNEJyn+gkEqWo0RKySj0D0Z0WSurjClO1XQUUmr2A/GrKjn0KE2OVh2ho330fqFylJ03
         utOw==
X-Gm-Message-State: AFq9FYKo3XbzkUi+RsY3yy6IbWxknaXF/004B3GE4U1JW58RKmcF0l9I
	p+6W0qMejJ0/DgYeGhksPeHcBV+Nx2CCXXtHEiZBKuc1VjfGs0rtKCctLLf8XB9WZ2+eQkW/ZjZ
	u3CSxIV7nc+rFv2qMB59ehhInKqlrn98be7gu7GFl6DIL58/5X+2ESVkPeC7+kYfN
X-Gm-Gg: AYBFou1FSH2q4t3F1h9mu8vkvKGxfcTqtubT03jj4Q0Du8KOOrqJqw/oxYLC7nZYyBz
	70oWi8v61oz6u0MX3HvpqYAPWBeCQ9BnHg74FucubwTAsWgMkOB01XbLQwj3UnZ6Ed0K2wjcXMS
	gzXUOhPFXrEKB8iAR4fVxgu7JOWl1Nrn+E65gDSbt0ryAVoa8FnSJLJZmh/zb1/vVP/2zKeSnnO
	q115dkrb2r99kE1gS0it+bz5FtoR7ad2dRksCA7prnaJdpP2PI3c/+1xkossSu9vS9ooo/p+Gn6
	5LLdxOoDawpr7qIur64vYihc0ZylkbDmlBHFCbTDbjK65VKINBfoKpjxkh2/tJ/RGKTeN0b0BfT
	vdGIh/F509izW0DUcmIqIvA==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360715385a.1.1792570025878;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr360710785a.1.1792570025342;
        Wed, 21 Oct 2026 01:07:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd5edbsm48905266b.56.2026.10.21.01.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:07:04 -0700 (PDT)
Message-ID: <c5901e68-67c7-4118-8d24-91e6881cb0fb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:07:02 +0200
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: ipq5332: add support to get
 watchdog bootstatus from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
 <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-3-e6b1ff5de841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e6_7ByaULg9I6VOrvxN38D14A3u-L8L6
X-Proofpoint-ORIG-GUID: e6_7ByaULg9I6VOrvxN38D14A3u-L8L6
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad872aa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=V2dyZ2dXe6VeIo8NBxQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfXyrb2j0vS1+wP
 R0LCZKznp2UOiwro40CzcM7d66+K4/yIL6tymsNj5nPSXhPI4QCSnsXf5K1YiyYHuxMcHiG50qF
 dzIU5VDgMEl/2EtEG9KbuECyKrHWpjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX9X0vLmLm9RTx
 BCrqeH/t2WQSt1LXlvxso3OPVhTSXchrUukXiPmU8SsydM7cYJUXVLcfiwgIOcDjhaBpEH8g1Lh
 k0tHgndPEJAMbSuNuqkhVscetuOf4jObP1HyKiWjbdMi/OmXn9e9qB0JJ2oyZ6JmwbcG2ARk0yP
 QDC7ZlYfV5jZ0ZH4y1lWQFZCh3VpXttrL4uGwlsMZQcpg22cxo3a4RSjklUXxwuMT253LO9q4+q
 hso381bb3Wnyt7dWE0KYNKEBd3ltBwHgmlBV1GLh6pz+Odwz481P16CDj4OEm0J2z8jNo6YL0lX
 wo8QF7VtDG/d12P+/pwRXETywYjEHtlJf1/wWv0vkgvhQgNlbuSKRyhI83iGVir8JFi+PYB9znR
 lvXMmm9GF9C7HeKIq4QjGzU2mpB0InD/Tkp3aKVU0+CAutQYF8Hmqv8EIXtd/r0kh417p7tcTl9
 2kYX+jDfpVbWrBkeaEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210032

On 10/19/26 6:46 PM, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.
> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> To achieve this, add the IMEM node. The overall IMEM region is 32KB but
> only initial 4KB is accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
