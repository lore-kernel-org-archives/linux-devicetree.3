Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BD43BDD4
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444251; cv=none; b=bpcidh2k09y5vyokcVXB3HGs3R6VK80NkJoKHMDGj2Gg3y1cYVU4iq+kbszZwQh3wAYcCGGxgdlNMFLSEk6eQiqGhUXbPpimshBJS0fvv47dm1dZphd8HyKAIwtk/W5Xlxj/2TTXIacYmV0ibrzpVPxH9gdS+vqNP09qfKii+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444251; c=relaxed/simple;
	bh=zSSE4c8WdY0hIx1oH0FPclPXKRAEWt3XovMmVmjcW7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+124JMF06qQgrPJKSSjpbZJqpwj+ziafSlyMCyTIj4YQ1XxQhTH0d7idVhjeBUHB8VigBKSNM9bHKFeNFK/WckRGOy2iVNT4mGXsquyxy5B2tHISOsPugoTPNu5yb0HLwT8oGodIbEPfYV/2qS5IvNNwEaz1DWn1e8jqRQqhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXTVW7QF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrbDU5nD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXTVW7QF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrbDU5nD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BALeHN341046
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wj2C0BVwsURNsVVymfeg+W5rRrD1Zwo3YpRGGfvBc0U=; b=WXTVW7QFt4hJb0oB
	4gF9KvPEStERyHCJV06iCxZOmRg2yb7xuQEkmQ1ciL5KMqEgt19uBWZD+JvzJfGw
	DVYgAQKovAzZBNiy+MdDY/znnUyQ1t2wNO5QSTqYnON+vC/zHEr8IVFMGu9PPUJN
	IyJqrduR9kSASDoz0675bhPfLihA4JovzF+tFwGgtsSmZqBYBX2NS+FKhwnRXlt0
	dcFFt9H7WA72L3MUeHJNPI1bGiqGESDGaQvanNPpQcHONnXLhvnjmtIYdR6Jrw+s
	HWRh4AIC710rbs23zTmm6Dxviuwq8FaTCO30cWnhVU02GelgnZAyQuL9yHUB4Bwv
	esPFgg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q102gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:30:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so686616b3a.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786444248; x=1787049048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wj2C0BVwsURNsVVymfeg+W5rRrD1Zwo3YpRGGfvBc0U=;
        b=SrbDU5nDhM0q2hhalr6jhshxfR4HpNKLNo+tDok2FUZwLTMD1ib69CkRKwukDSpBWv
         CXTuclDzGojhetOwz5x6VABPOe8DeFpCfnD53uhHuj7yRDirox78n5yB4FL2VHvpTisk
         YF0PE+rpRETGDcGG2nkCfUnVH4ErTQYIFyjFkYceCU3Jcmw0LKlMe0zfgyqdhcmVv3Uc
         gLb8kC7WOcctQ5B8CCBjYTE+eMjghDmd1L2gMa7lwecKvUmTHH9hKLF67i0YiGtRecg/
         VIcqCB6XrdeQJIyY2qhO2c8EvWpLn7WpYGFNCza6u4YMUq5AAz4iEykbS/UCG+jw65pF
         0Qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444248; x=1787049048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wj2C0BVwsURNsVVymfeg+W5rRrD1Zwo3YpRGGfvBc0U=;
        b=UfNfWugecMIhFoQQCx0AhB8dlbNl17eAsMmcS25AoKzoJnoyZULFESeWL0MfF03UEM
         yB5BxONiCWuiKGsRFv0YF5P6sf03qYwExKxhuK56q3qMBHgv2RZWLh4SvYe7wz26AaVO
         WwUwVWMzzdLRy4yCVo29+P76/ro/9We0htfyFZsgzOaiPxzeZIk9w/LknIwpmsx68a6V
         QdVFsi9vx8W9Q2QV71EBq6AyZmGJKhepdkAyytMDXMG1r5F73d+6dKDD2QufCNCdR2FH
         jBtY3Wtrb3o1qQfp3C09VkBaze+EUYliPcuuyCVVJc3EukD9AON+7T4T/meB6EFJHLqr
         Du+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rop/FIG1wCziLevf0RLrdnsjR7aTSzMRGskkKx0UMl0G3MVu1nhSBJEl7lJ7mKvgLzcqa0w8rp7EKgn@vger.kernel.org
X-Gm-Message-State: AOJu0YxGiUpw35KSTFMC+0KituTIoq6+RAIjCHY7XBSjK/B2CnpJ/as/
	MXzc9dgDPxtQO4qgx1bseOXqxPQxaIgsYF3O8lc77imUCe1r+r2SaGaKQlWS2GzOKGR/ZF4K4zm
	LKcyNZ9hd3NIwv4PM1CbPzjIiZRkD6lS5dBAYaHaE6FX5vb9MILvHCCLffY9T4mhV
X-Gm-Gg: AR+sD126y9uRMxQRi5TXPfbFqDVNX1RFmpNq9BGaq6WkkrP3AIzQP0GrMCqMQbUSeDM
	QhyYymPkCuOERGKowuhPvf2sd52dOakB6Ekb7lCjv6ytjdXB3sxM+G4ZDbHXEi411vo/cKT2GdA
	M5oJkn5V2YJ3IJAO174UHDm/lFIA1w0OgPRPKAExU25oKiehAe/mCD6/Y3m6E45ffH+GY0Q458P
	uEP6r2BeK6CZ9EvpzJLID3aLV9/Se6vg3xvg+aejwnj0XqAVTpdOb8a5Q8Ydp2TUXUC1RaiOGYo
	6yGSyxFgXMnU7Jf254Igy67Oz853K3upoH3B41Fobx+1fUsh018Ze8/wmpRv1dfTd5o9idvyhVj
	7FdRzDuqgiqt04iHAX2l8TKalRbzq+buvmNFp9k2cC4mOxz+UKjKAGwkBK1JTpX2lAff0WRWHsf
	NwvCsaZZypePqG/K2SaKyetw==
X-Received: by 2002:a05:6a00:228a:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84fa889d2b7mr2067468b3a.8.1786444247574;
        Tue, 11 Aug 2026 03:30:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:228a:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84fa889d2b7mr2067411b3a.8.1786444247014;
        Tue, 11 Aug 2026 03:30:47 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa956af09sm503652b3a.51.2026.08.11.03.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:30:46 -0700 (PDT)
Message-ID: <198d71bb-fa4a-44de-b985-3110b03618fb@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:00:36 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
 <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UwYs4cnbl8iFyUr_E0vqnLtBKVarr-Q-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NiBTYWx0ZWRfX4+h0laTpd3Wx
 CkMLKtxWFJhgtNZ/f9gGbqRI7V3OLJqPrxSaHs7xVIDMX8r8wxL1yA4f7PN4iIyfn+CmZ3AZVUn
 3T5AAJKPVSx1KK9vVFaLSqytTdtACFgPUeu2vLNB+OBOYZ2+Mv25stY13h/SBPMp9aUMjgiYP6/
 a7LfTNtdOmg7yBIGAHtNnIPHi9gxyhS0fK6J1g+Kn2lPVtS9emxjSJ4kUtSvZ7vzN4G39R03A2J
 Pv04HfAhRD7Yi2wiAPnyAXXgOwfhoBxHDkn1ssJ5La/DMIVBNRWXiAZesoPBJOrnTRu+e6nWg9K
 che9kv8r4hUvuclDHG7uEpdUzBgYTvlKDJW2PryN1qsSPru7eQ78dcf8XACeI20hqGV249ybJUh
 1eDj4wnFpbJnYS9cOZo8vEtGWvDVBDonUVB1SMCPuQoqx8x8jXKSvdbvWoMfuPYo3g6SmeXb1MR
 j0OYM/etODEGui6y1MA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NiBTYWx0ZWRfX9bQcnUNQjCkh
 PIPkRNGwXjJexE4CYoYzcQTxu6lpqmJHSb90L5mgQNLiHlG8djS4xNJqUpqcZenyDB1VF0pbazp
 qWOIJc0doWUtNwDxx+V2R/B6PoEy/XI=
X-Proofpoint-ORIG-GUID: UwYs4cnbl8iFyUr_E0vqnLtBKVarr-Q-
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7af9d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RCP4fZz32dXd7NFGJtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110086


On 8/11/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On 11/08/2026 03:15, Dmitry Baryshkov wrote:
>> On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
>>>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>>>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>>>> hardware.
>>>>
>>>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>>>> wrapper for its debug UART, so this assumption no longer holds.
>>>>
>>>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> I doubt this fixes tag, otherwise please explain the bug.
>
> How Kuno could be supported, as you claim in e10b198a94c6, if we do not
> support non-dts platforms and there is no Kuno DTS?

Thanks Krzysztof for review.

I'll fix this in v2:
    - drop the Fixes: e10b198a94c6 tag;
    - reword the commit message from "fix" to enablement framing;

Regards

Hardeep Sharma

>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/Kconfig | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index fd4d4ecd2df0..5b3c9d31fd7f 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>> +++ b/drivers/soc/qcom/Kconfig
>>>> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>>>>   
>>>>   config QCOM_GENI_SE
>>>>   	tristate "Qualcomm GENI Serial Engine Driver"
>>>> -	depends on ARM64 || COMPILE_TEST
>>> depends on ARM || ARM64 || COMPILE_TEST
>> Or depends on ARCH_QCOM || COMPILE_TEST
> None of them are needed, because this is part of qcom soc.
>
> Best regards,
> Krzysztof
