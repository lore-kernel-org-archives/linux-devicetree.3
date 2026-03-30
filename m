Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3F20E030
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845866; cv=none; b=RZc2N4IIzp+QvLxF28BtdA3ZI2zM4ITU4vi5018SAeJ68u9ywNj8kob92H4Ep/QBuKbTK74Mx0q1w51bBbrZmsGKQCdyKpUOWseonKyLTCHYi5w3Q5ZMmL8kC/pNxCbYFCnnbVTeRUydrj6UbZ0PSORMfm05RCqKOUWSjXmSEzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845866; c=relaxed/simple;
	bh=uyfQilYdCCjAPT8/So/ShWe6NNCP5J9ta3jF8nqK/lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nA4BmsHh5bzRIbJAYJbE1Y3oRY1C/aFsUNulcXFmLuBBz2JnOaHpzfBKI7FEBd5ey8cA7piyMnCqFH/loO58Y7Vo+3Iu70v+fgozaRw7ITB+wEh2V2SEwxM+jwZi7IKRUQyFH1YSH8+epVhGYOnZnaI9j9cVBGDB+2nfFBROxWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAU+51BD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7r7ncy+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAU+51BD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7r7ncy+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U3HVYr1615941
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=; b=jAU+51BD/H5ctyI6
	hEfhf4aK7TC7Ml4LYiUzHWuvbt8BdcZto/8B6oTEjgXZOUoeN6+khLSoe3RPDjtH
	jSi4Qcuc+K1mhA05zeEWywJ9BOcUldYnYk88JBZzZXaBFCjnVJm1eDUH5RPGQAjS
	rPENex1dHDQWxt28Tc31XoOl7qVq/vEBoi7fw5IwHI4txUkBWD7eaAvf8h8VXFEB
	tOlu9x+/0MjC0mJszMGwIqF7by4zfzO76pMkRLPn1COpg3/PABNHYLMlSgH6hjo6
	qzqd112FtWBk1s3yqXdTc2Qf+3YWYtajI8zPJlrfWf/Y/8q836+K9QN+I7wfa1O/
	1scEmw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672ucd9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2454fc131so41232055ad.3
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845864; x=1775450664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=;
        b=e7r7ncy+YtCRCDxWcY4H+K/+ts7MZ/DD9rctQ5rInF31eK+WtzzpmiEcVGcDlZYYwv
         EUJxQBrKLnm6Q7z7uANoGCEGY69tPUWhgMqOZdd0bBtJDIIZCU4IR8EnV7iUn1B0VOVw
         L3zHmNz8v9ONpTysGQDjZXHhmUoX0H5K/1cm2NSUJEe+yloejaFH9rHGSfNLVMhOWlUF
         nvcToyvwhBMFr1L1xEjyIDgysL+W/F6Q/QoXouJvnI4xRLfOgiQYdjJCoqBwVfdYTGaf
         /unTXDVP+MqH8Sgz2NYS9nDMOOK62sQ3/Yp/W0X52APlLiQyrKmfQqFiD3VHOw1m3BFd
         GZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845864; x=1775450664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRwWQquz2DyYJPWRUFS4WTKAOMFffdNJez/Sd08E0pU=;
        b=pknASF5KvRx37pw7ApkaJQbHikIf8ClmP3NBWGyHnKquzHwmH89GBJqKIWhZzldM+m
         olmMdSyk29U2h0CeGqyW4iL2oEh7EMZQyxix3YrPsNLib1aXUU+BJ30+5Fe5XGsIvMxT
         Ehi7h4uyNYgdIYnKTcDY6CZdzLdzCmgjXUSd7bWo6VyxxTeSCGvtYID7lw0L5hirefPv
         hbjnciuTOpY0hV1OKT2ikdZ1tlBe/ysvHTU51iWYLSgmUAMP+YsIDnOyrt3/4xBot6T6
         LGnefpUGnkHwWZpG1dAQ/7nh7JsM5Di3ORVpoY9qeYQf5DYy/lHQWt06T8mMPMDtgXei
         r6/A==
X-Forwarded-Encrypted: i=1; AJvYcCXzb21P8dfpC1iGNzyXqXeuFZLcz8NoWqdgjlQ9Z/MeIt+SBkjsTIT45zRf4ZqRd7LqLoVo/1urenNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hZ5K/vjlWrmCU6mnBEGNDhMmLMgeF2PcRhHjBIuDnluGslIU
	shPJuafE7GAv3iE0KgO/n4F7i43oCqksXt0JnisNKwYgM/lg7WVqg8Ddd3CEGCI3nmPF1wGHXFG
	XnEOgAdwV9PsTs5IyzAudQbh8vWXLOjrdkrNYN7hfNNttWkPGU1sx8BjSx30PiCzH
X-Gm-Gg: ATEYQzxCGH7zL/MFclwWaYGLEM+CF9ayImq1wr1+WOwcAnJ0TseS7kQ+WN8/6eexCfZ
	WoFXAmQLdZOiIMx+7o+5d9gWTU139NPc/5L2yg/hx/ZNbiIqqUTR52gZcE9yGgiMvZ3X38T/+YF
	hUj94CNMpuee33bLqQQMGkqjMH8OvBLMxI3fMnP5YW6g4j+54LxmG5ZyaTU0doTSeBJrt7MEVMx
	MkR1TJTeiMBHoFhZDAhv5EOuOByR/ENrs52pyRbH3xu15y/MAXLNCcXZCmxRu8kGfGWCnf5cLCI
	fqSDBFv8/NB8e2mApJGmt+hknxbK9W8HQaB61Rz4NsP+kpzcrdTR9Loq7hQWE4OCHS3tzf1x/Ng
	DvbLQ7M6yZlMCfvLMQ1xIMP38lEC9WF5zZZOwFOAch3kiKbTb8BUMvQ==
X-Received: by 2002:a17:902:e74a:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b241a99166mr80322895ad.23.1774845863925;
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
X-Received: by 2002:a17:902:e74a:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b241a99166mr80322645ad.23.1774845863429;
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24266e487sm63551405ad.24.2026.03.29.21.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:44:23 -0700 (PDT)
Message-ID: <4659529c-c3af-43b1-a5e9-c65b968f098e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:14:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] arm64: dts: qcom: kodiak: Add QSPI memory
 interconnect path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-5-3efe59c1c119@oss.qualcomm.com>
 <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <i73fny3nxdljztry4qn3rotjtrjnlau7oxzjfj2bfsox42ylti@lllrvsc4eyum>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3V-yXOJS6UROyi4yckpf44aJ3spZOLGk
X-Proofpoint-ORIG-GUID: 3V-yXOJS6UROyi4yckpf44aJ3spZOLGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfXxj4zSd4DBiD1
 uiPuzmcr8Uhp+Nkp1mxqDjdieQ+31WcF/Jv6m5XdWgV4aBFUWwhG8NQrlg57QPrK7rqDMx30rgB
 lPdJke91Co50gez2QYy2xQfZMV3G5F8A24fYtshzLOofJTYMZa81GiOhp/ibqme1QwRmXkIrubT
 PJ9I6amVuQ+hu12z7gTelPk7Hpt67DLcpEOEvot95vcAXc5mQiLBkdi+hb6NjXYOeZWsNlAfGEU
 dbeu50VhT4PgzFpzA12VBdaFYXlOJqGvQ6eP3Esg11w5C/6w68/JIrESfL0JPU3zhoFJF90yTR7
 rloYzd1Mja+xGePFqufMjzeCyzNFQKFVsRPXZViHK2tBj48C4q2Nzue6OrZRkuVLK5lAAk2f7ek
 PhJgM3pVq62GDmYhT/zw5BC3xLyZrT00AxMqK2Ez5XkDyVpFXkmVoQvm6U4YGJ5y9uVq2pnNftl
 AARrHjIx2TYAjBBdkQg==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c9ffa8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jSZtOnyutIQV87HTN0sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033



On 3/25/2026 2:24 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:22PM +0530, Viken Dadhaniya wrote:
>> Add the missing QSPI-to-memory interconnect path alongside the existing
>> configuration path. Without it, the interconnect framework cannot vote for
>> the bandwidth required by QSPI DMA data transfers.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 6079e67ea829..9a44bb3811a7 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -4312,9 +4312,10 @@ qspi: spi@88dc000 {
>>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>>  				 <&gcc GCC_QSPI_CORE_CLK>;
>>  			clock-names = "iface", "core";
>> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
>> -					&cnoc2 SLAVE_QSPI_0 0>;
>> -			interconnect-names = "qspi-config";
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QSPI_0 0>,
>> +					<&aggre1_noc MASTER_QSPI_0 0 &mc_virt SLAVE_EBI1 0>;
> 
> As you are touching thse lines, please also switch to correspodning
> QCOM_ICC_TAGs (and I'm not sure if those should be ALWAYS).

Sure, I will add it in v2.

> 
> 
>> +			interconnect-names = "qspi-config",
>> +					     "qspi-memory";
>>  			power-domains = <&rpmhpd SC7280_CX>;
>>  			operating-points-v2 = <&qspi_opp_table>;
>>  			status = "disabled";
>>
>> -- 
>> 2.34.1
>>
> 

