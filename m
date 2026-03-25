Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388E2EA72A
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431159; cv=none; b=Ik2w53kJV9AyISmmoRYGSaSp6P+WkFLx2U4yCKSHtK+1nG0UPNhT5HZbt43I7i/W2dg7bs8AnYNsKDF6eiLi5Hvs7p1+dLDIAwbySlKgNqjVoFDyrNPEumMcw1eDJHAybnI9glyYrVievvzvGP8LMtKX55pdUtMM+4u1oHCzM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431159; c=relaxed/simple;
	bh=fSUL9igBA3KN4gm9BjiayxKw1TnmPlLVceGWkB0osq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7iCL6NM6vvA3LY9nxsh7IU2cl9FyfVm1xJzlz0dCwHlgSsAK6MT6jZf2dLrPVTWCwo6u3/NloT0Ztdg0Tr95DXQ6Vja/Qu0vaXMQ8Aui+XtMEh0W+XTl8VYXSLbiVVFjvZE7ttRjGaZ0hSKArC+bPwknv2r0LaiKZwLrGhliV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvpx+3rB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4jsUSwT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pvpx+3rB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4jsUSwT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P401Yr658753
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=; b=Pvpx+3rBKH6CGRq5
	Kq3BLyUlf5QmLyzMWs5tWe2hgeQvRlM7uvjnAbPhhsIUuF4XXct21C0kN7IyALPT
	nAgyyttVxyIeQ5Z+qj/+Y7+FHQHLohgESbxgB5phhFklO79nUpnTZbz1a8Ddz3k3
	1AMAwK+XmFWA/eOQMSXCTAVExsxz2hFRwc1Hymh3urAygOmIQ/HCadXEbvh2wq7B
	SXe58CC6AlCRIIYVB1LWSKnS9Qd6jcXD3wqcRFue4+DDLIWbcpdDmCOVKxwr/DPt
	mguiPNKmJlGEzjp4nz/S492AgJycvDcThaFbfjFMNrhzFmtUcofRImMjhBKMzXKT
	g/dXLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489wh3g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:32:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ccf10567dso880866d6.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774431156; x=1775035956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=;
        b=R4jsUSwTN4HMuo0IVU5b6NfkJ42QTx4qnWHnOz4wDvNMY9VpsNtMFyODsaP+BxS2LT
         bWzfyq53zScTayH4m0SQcKvlhnBIMMEba8CtQlHf4sk92dBiTxDA4ETDRCRNyikqPebU
         ycAf7+WxB4BZCrbUSAluZ2EvG2WJlHe08OP+wpAdo+BGoKBy+YT1EiAD4JQVzdh1T/MC
         rWadfL1EjDP5gjv7HBl2mVPprDuxvruHHvv4PRfqkaprZtYVVJTIJZlppreRIi5+nIXv
         mS6ZNUwQ1xSRdBbsWoRJsob81hWERYNN/HbRzDryqNhVkc+sRcDKXjTjgeY09xA25x52
         Yv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431156; x=1775035956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJUFvWx22X5sgVS+otV+IEBw7LizmRlEPkfCL66YKKs=;
        b=KbYciC3hU0URu/4n9qJf//WtLqmSFDeXqwQFXvWkYoFQhCvCbqaXMCt5vlAxerq6eT
         GWoxO0EH/uX+wWwE3gdDl+yQ7EJbhmjcupBuHFdWaQL7ah3MSIAuuhM/1fMs5p1ny7Ci
         8gQH1Dx2B3sB9QpmxVn2Y/ayN32Kv+/LN6xZjT0dP+79/53xkJvpwXUU6C2m/H3eeGbo
         NfSiD53eIWc2Lu7xyvguzn9c8xw7XHvFJ4mSTtO+cw9DrZGoQaV+0jqRX09yzoUlrXCy
         GhJbIKzf1kyNrpHKv8tk9uaQcwZ2rUREFj45BiVF+oNS8LWDGhyvn9abwJl+HLEg+h5U
         147w==
X-Forwarded-Encrypted: i=1; AJvYcCVXljC1uNwBnHZlIyFxfmbt8hib+fIP4HKmaViP403HgxIe21MU90qlMJmDkuR9W7CZgv92tJeT9FRD@vger.kernel.org
X-Gm-Message-State: AOJu0YzE2KFi903ZDHpTVBibKdzS5k+OxM9cEap4um+eOZ9awBiEeNx7
	29UXCCZ4C7/PklHDGIf8Yq6pWF8q6YcHl4YAQZ5zHdThVOt/gYxycZh0f4OhQuO27CdVHBf7WWB
	jlw+s4iWjx6JvCcW/ExvEBmSpvTi8kMpe76KYBVxqVAzJbDfmm0jiglarX7SrwCEO
X-Gm-Gg: ATEYQzzUnxhVEXdIgCqlJV/Ck8UZQpaRSa1U+GbLAPLPdDciCMLZkBM9/nS3C44bO2X
	4a1t8x53/CpdaOrzJSs8eh77HEkxQrqCCf4+MrPxtjobGHWkN9S0H+5jYRVB/P7VpRlBT+TBgRY
	FbyvxtcvZh5uBL/nbjygbTP0ctQOfPCb6FH68ZGCEyzGvHtxFiXG5z2GV5tBahSCN/aqSVpPfg2
	w+Nkle5Ah4sxz0p9bbftIgRcXygfHC1R3Q7VF71dtFN5AJsBdfhlG7hvYLrxV9imPxSAFoV8mMl
	G/k8VElg+hhG1q8E7LoLqmnAILUTTFtwzcAnqPkEKyyDJLJ/KI84SPey9y4LsXum0Qxx+xbN/uQ
	MbDfS/ooZWcZ9NgvSwU82OSLtHsTpmnBV4Htu7FusLTsZgJC0onHsUjsa8U+LwG5xygEzMnsXGW
	lAixo=
X-Received: by 2002:a05:6214:5191:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89cc4738ca7mr29547376d6.0.1774431156436;
        Wed, 25 Mar 2026 02:32:36 -0700 (PDT)
X-Received: by 2002:a05:6214:5191:b0:89a:50b4:bc94 with SMTP id 6a1803df08f44-89cc4738ca7mr29547166d6.0.1774431156025;
        Wed, 25 Mar 2026 02:32:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365d86asm779950166b.48.2026.03.25.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:32:34 -0700 (PDT)
Message-ID: <9d7c5d36-c981-43ed-a08b-3b75c25fad1e@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:32:31 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] arm64: dts: qcom: talos: Add QSPI support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
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
 <20260324-spi-nor-v1-3-3efe59c1c119@oss.qualcomm.com>
 <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34cifkyw3pgky4nhcu4jwf2uveszre23kvesr7ksyjvmqhfspo@avsvwa3quvsp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ybDJFDTWhmLE5GTlq0IAlkv1jlpN7Ye9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NyBTYWx0ZWRfX3aaqsltAj7+o
 qdVKfb7ZvDGHfWd4aG26R8MltsvpOyrL7y2uy4nrfA7Kx6jIgU08S6KRzcP2DGivwsXS9JPm1GD
 7Vu1oB4BD1QaEABFzoOh3qEKmDtM444u+cE/EZph7Ad16iQmdJh//afc4oBa4fuJhpiNeBsuqoQ
 bDEUmcZScIJnxPeAc9elSxgn2y9IFzTSTbiuqv5YxpccnbysODRXS6vvTcj2aiq470n4aHiNXx2
 8mWodrjFCFOqH90xgpN2V+XqgJCG4bMQX3L0/nYno7VfTEKh4De7YtV0z8PiR4sUaS5DobpZaZR
 iXJUZzgct33Lx0fXZRjOCe28PKC1mvl17eIVeCWI9gt0LscljRFCAowXtsOqMgX810ky6yxuORt
 pTL6npBFATDpBbx+fwB+Onokvcg/L4YWHujFQfjJTOZJByYXt4iGUaDD5iXDbEIVwNhosZkTXDs
 A9ejm9Kokp8fd2s5nLA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3abb5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Va9S0ePWEawDROJu0VIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ybDJFDTWhmLE5GTlq0IAlkv1jlpN7Ye9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250067

On 3/24/26 9:51 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 06:43:20PM +0530, Viken Dadhaniya wrote:
>> The Talos (QCS615) platform includes a QSPI controller used for accessing
>> external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
>> the QSPI controller node to enable support for this hardware.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
>> index 75716b4a58d6..fd727924b8ca 100644
>> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
>> @@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
>>  
>>  	};
>>  
>> +	qspi_opp_table: opp-table-qspi {
> 
> Why is it not defined inside the QSPI device itself?

The QSPI device has #address-cells = <1>, so we'd get:

Warning (spi_bus_reg): /soc@0/spi@88dc000/opp-table-qspi: missing or empty reg property

Konrad
