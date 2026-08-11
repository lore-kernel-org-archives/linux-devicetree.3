Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CAC43711B
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444470; cv=none; b=EVjqKGWdLhgDFo7HgL63yuoz94I7l4J3poc05Veyu+AE+ccuRsZ2ti88y7ZN5ZHn30NfwJnatP6StXYpzyk/t+M6zvjfFary9xnr6It2IRUIy22ljtiABqH/JR2XekNP/FY+1zhHAVtUgBCS4VgKpJ1b6CJSXGHFui0eH4xXlrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444470; c=relaxed/simple;
	bh=khlQxXBFoIYgGCKdLKHy/O6Ag9LzLbpRU1Mf1asnSLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5oDnHLFVO7hukp5BmHPjOakRiwDCc2/Z8b3qwj/CLBvpWncW9gtVsrH48peGyCBZq6YWaS9rSfru8bqG4cv8OT6IBoSm1ptALTAbcleLNphdid7112ZBFFtOlmLVPkhMeGa87wLEovKTPhs5WS83K/nwzsN14TlECxWRfDNFFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHL7C/FA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrmIEfkn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHL7C/FA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrmIEfkn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAM7pI267703
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=; b=kHL7C/FAhKGInXCO
	zA3KOpoL1jYxsGz71CjF5j6uWbu02n6O38tEQp1ZcyNkVkB0zD8ljTGeGYgiy7Cw
	7y9wU+ofY5nqQrE41en095MaX6weRe0DVl2E4bPyDrVjBbqDo/DsIVbCTbQeAoP+
	VZzr6pcQx/2VyVShuYjMR46nBtyM5FPqXLzTbCLRbyc43hYTXxgc+wU9Q6NkftV9
	lK6Peguqszx/rCxk+DG9Ic4LZ0X6n0MJxe8+0FyETtGIOz245k5SksLmb7lwUMc1
	hGf95yZcZl15lfE9FGT1TrryvSPispZXkuPZ1UF7nOTLnc/jI8dVj/zrBLmufgRp
	68A9gg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv3my4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:34:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce14a21faso13678515ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786444467; x=1787049267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=UrmIEfknFq1aLfzZDf1aGkY0QiiNMT37pNmT7HpKVtgf5SRW69JMyNFDC2W3dnc0Z4
         4CcJcqBJlZFHqR4fR2grAInyPdDUOVvOAjX9OzumqKp0kMu1XxyL5PNX2eRnEiIUqmEQ
         KmmC93oAfXjaFlXM6WlzyqsFZB6r89HIurpmhhRCGf4WdVtPJZhVcAE8Z2GFQQXpx5O8
         bout68ADxNBaE1JtZaHIXtnQMEuZWZBNbpiIpW3N2oRD/Z7y++WszJ6+18GX5ldNJ3Tq
         4WObu04RYGRYra5oD53RdCBhRTYDi7VWFSugiipjssRj7d9Q+Wvsdxh1OGAMT0NJU+Oa
         Z8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444467; x=1787049267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=GepACMuCgeW+gww1nTz3mOr/Fevjo4RQAwB8avblXE+3h7nMPB1M/fyNRhFrzZLPSt
         za2hQGQKUMSWVSD+/eaZDJaqtGCG3eVOSYqZv8sgy5m+2Ds+rE2KjWG/eXqbFBEezVCF
         Pp9ilzbDQd59B7Jep6RCN9XnNJK8SRSR/287xMxWMqIhO9AIFqIwFoi1ZXm3tBQQqCtF
         ROq2gbI7PYGccPDTnbXgki+wtahzTmXHCbW0hz9gsIkbhbDCS8/Uc3ivdc38mRnWdc9R
         Bw9ZxqZqaIyYvWnJeCk16lGBJ6zbEfa7HhHNBb8Qy+kIQvEZ/f7aHoLEGsVv4mOVoZOp
         fwZA==
X-Forwarded-Encrypted: i=1; AHgh+RrPPbVMH662GRn7qHY+1je1CMmUUKQTVFpZqTcTNJwVEyDcABu524USP/4rhIPfL19yLB39o/SKuXC0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+kniDA9sS3lk6gN81qIY2q6YcgSPvVJuvd2gr0gla97plYn32
	lT1BWGfaZCTWVvhWnbh8ANt1y+anf7Vxh5yl1VjF+dCuSczEO6FPVjCghugjHn/+5McRelSbxyM
	wKvioVuFjtINn6tpU7Z1NtVLxuHQACcNz9c5BNYw6gak2NXyL8vWzbqPn6nd1/eGJ
X-Gm-Gg: AR+sD11fJTvpFaTJrAtnim+xr6tyi69SnG5jiRcKwKmdA5Nj0wGgmFTQGcfohamR6M5
	sKgtDuiBVz66mCOf18VhZIh9z979JsEQ5+f/gYqRAdJbvVn832vFfylx0K8ClmqebMA17NBaQ/F
	IhbmSDXRc+bAAerZfGH045eUmEvCB67Wjq5gLBDOlef8cw4IwuThsg4bgowaZceRojVxZNZtEBi
	Nza3VQLR1IRYvXYOmVfLWX6PSUTNDY1KUc1W10fmMDZQEvu6vft1G84EdIaqZ6JOG4FhaHmpq20
	8XsCVCcFgHgj9+6DsiqkmqRGiwB5tJd8M9DcwudvEY3RLsz7QzAtu7vIB424iJQ3TEnKQAW4iOr
	aVLDbV85FjBc9rV93NQg/SoCzyan939dC8gFb/8c5KQ56qejH++5oWjdPOQ5ySfR3qiqgoDnZjC
	8l6vNWbfaU8yUJuHRXRa/k8A==
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8891945ad.12.1786444467194;
        Tue, 11 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8891755ad.12.1786444466630;
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f48547sm5405795ad.36.2026.08.11.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <4bc060bf-b5ad-436e-a27c-57d5d0a89638@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:04:16 +0530
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfXxnk2rrMf3uCD
 cV7xGqNzUSXkSTtz3B3MZK4qkOSz+3dR+rVYmE5hxpf9BI/8Ncti/x9JvpsJyOefqssAtJfl05w
 0EXpeMBW/yfE4L66JxSJlKXzO/amYeB1QMyMYG+C9pdpXD7pOgnC6YhNiAs7gcMQUjG9QPrE/g+
 FzopiL6WgN1IZa33VzZBR7/XbGbY0nnX1WsFQvadOkymyS8LkyCGA4oIpa7JOQ0f5FJGvU6T6JJ
 1vlcZr8U5a6UI/FVRbvdqJLn+4jxwNbLun5zehBPUZNgtsBjs/qIFKpYNk/Z6z1DohSfg3gSm0l
 lydbxBab59eR3D61vaPIMymgcDd+qGG/VKHnkz9Pz3dgUzVDFGUjDV9oBCD8lzWcK6kPnaP38eA
 TwobMDUpcm13FfMVkM+oTBDC9Wl6uWQDeWUuPc5dvhnXiNyz2ibpaE1lfmmYZA2EtYBLpAX4t2S
 o85/H6T8+kkMiPpm/Sw==
X-Proofpoint-ORIG-GUID: oT5sZmCdRZAoGICvzcFmQE0u9hn9752e
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7afab4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RCP4fZz32dXd7NFGJtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oT5sZmCdRZAoGICvzcFmQE0u9hn9752e
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfX2rbCZuA1mXc4
 /Mns97fxthcD9WCCbYXk9OUkq4ALPqZoIW/RtlPDhieF7lqXZ0br+MXrEPY2TNLni1U/3XqfQYP
 KdIadJD9TYwUTyXY8t12ztVR07ZoNL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110087


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
>
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
Thanks Krzysztof for review.

I'll fix this in v2:
     - drop the Fixes: e10b198a94c6 tag;
     - reword the commit message from "fix" to enablement framing;

Regards

Hardeep Sharma
