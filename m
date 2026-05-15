Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F323FD95E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859400; cv=none; b=eXWUJnXMNueN/AVL+rOpO3leXvPctXjbK6xI5ENszuCWNGqDogPo3IQaDUz1tgejVe2lvNF4QTWRlsRD/3C8zRQ9oUejY7bE7EE4SrkjpoOxImeX+R/qn4WQCPT0AyOYGIcGU709/PPzwOhYMqy/Dye6dZ5epWo3QEUgjZzblUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859400; c=relaxed/simple;
	bh=Bgc8kTKac6/LGbaUjbVwDFKjsjZ76Q3ddXtL3Xs/XCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uwO3T1Wt/kp1xdZ/SxPiLUPsxZgHDn0/y0E/R5DOb7AucoUc+j0CNdraDhYIzV4IGMFIbWCn5nURnZ8YsNwvs4AZG75T92taaXy25ohcuFdN1BmND0CVy3jj51Eg0Ab4G3fGqZvWAKthIO9GPOo8LHYDBncCFb5awvLcbyBYR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8Vx5k7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fobWbc4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8Vx5k7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fobWbc4a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB9QH33671116
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rsaGzOjLUFY2It8a9XtlX327ezydEMR58UXIEf39RR4=; b=n8Vx5k7EOihDTmZX
	7DOdHH0etoziH5v/38ebKig5B2J5oXo3bA1nd+ue6B4HaJV/H2TI0aAqZw36E8j/
	mVX8fltNd0AdxCsN4bek5nOuv1c2zdEAZa/5cwRaP0So1LG0YGIsri4zoK/p0iu7
	Rjxo2uYfQbSesp2p4PnDMEfDJ6KKOYbEcZLJTFmpyp1Qz0+kakXt2ZoZS6o0xSml
	eNbRSHfmb2+RTWTmLG66vBga+CMx0CIu2SH5APCr8Kr82ddaeLLGTjuyosgpz6UJ
	asJpYkUvKxTFWkybYKEzByUnNrLfEWguj/qiI121HQCjrKMmlZBxjCbN3WzIp1sG
	J9kwKg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s3wa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:36:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-13312cff948so16770376c88.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778859392; x=1779464192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsaGzOjLUFY2It8a9XtlX327ezydEMR58UXIEf39RR4=;
        b=fobWbc4aXlsdY+Rab+iq9slX8M/7gY+2nZBFNpru7sSi72vP5q7epySkI2Ft1uQCfc
         BEn747FxhMvQ7EiKTePPUAA6Ps7c/HrkQ+RJF1otBdjMiyLFxfJwgybJ+vDnO/S5Ip3r
         LqmLlO+Ex3D022T9vCfjX7+Y+lIJ2yUDoBLv1MWd5HNS2zQ+xwbdhKWUeniSgjwLPc5V
         zhmx1TPNOJ7JLl4Hi+3BNS0c38IIivRLhFksi8pA5KrUYypKzBtpJQkFtWDjIE4L2scN
         lizVsEXpzQbbWtiVpxUoesr7FExS0smxGXIUmziW6MS6P/hcavVMDazxv4hderZ5/DAh
         LkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859392; x=1779464192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsaGzOjLUFY2It8a9XtlX327ezydEMR58UXIEf39RR4=;
        b=MvaYm6yv1KrrYSeRrAdXhC403MOyVYamVL4U3nLsA3ihzKxfVHnBUNmV9HB76rp8I1
         hXs7wNeXV++3QG+h2iRRQYH/idH5VUQjdMFhucooGnPRxIgKeg70Ot4wwdQTh+RPNmi+
         /BZ01HWlCQUm7vCkqPrLbCzXNftPf972c/rA5xUBAk30Weh+3hvHjZbrhTkyCef5vnkR
         L9LjXX4rZp88NozplDikfN1ozNQlhN56rny1yQd/MedM7ZkRobR412NRsLuZWxsO4n6A
         MoYjrvoVuP7RgHFgYUbflUzRiKegLq6CdiJQUq+jsEJrJs9/2W/mcmOx0XKQDj8c3YN8
         MSHA==
X-Forwarded-Encrypted: i=1; AFNElJ+Tu18eQqmDIXUo9F7hXGh0OuUlQVKVL6oBxIm6R/szfUM/gKt255ibmTryNDhAgREN8Bhy+Mlu6XEW@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxBLKJbOMdIrwSo45seJwjknxl86OtRmtHcuvn6oNwRHGHcjh
	3TbKpI+Lwci3wIKi9N2wpgVJ5RaU/Z9LCNUP/5PRK+TvkdkwQckkD8aPI2dCYPsJqEp9nbGnxv1
	DcXYMt4dIPWjqu78aco6nnQcTotWfG7fxhqMd/VEbonP2jCakp0tGVM0QYNR7vCtq
X-Gm-Gg: Acq92OHmM8AJw90mQxitggwwGja1XYw77uAdLytnV6QRnLBvn2ZdpWXyz4Wpugx0W8e
	Z2eSj7NvaEv/hJzkyAjwv97l7e4HbGVdGTEE5eLK/SytCGWcPvLnMyAe+5QGevSWxq01Z0TSezG
	hsCYrk5Rtvzpc1SrOXVcpQHZ/7O+bh16PinqPHwG4KWATZc5+RHlaRplOTTCF/Oko2bZAcBIOWw
	UaEOcp2I4N4U89epQFEgex28lXY5FZCWlJkXYR2ppXvD+2XiTgu72hD5nlarVUfIu7f8VkQz45V
	jqF+r26ttM+6MVCPttb5RmRZLHJHv2pmx7WfsQlddsqrc3K7Cx5w9oiICdzJy1VX1/DaJC12S9F
	owS0+7zdWYy8fSAUsCnby6PgzMJIdUgkiGMFQ3ncUCe4xZ94MRMuVHIZF5Tjq4Q2kEVrLGkCq8e
	fiFavA3hycGFyKHA==
X-Received: by 2002:a05:7022:1e11:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1350484ce0emr2086006c88.28.1778859392224;
        Fri, 15 May 2026 08:36:32 -0700 (PDT)
X-Received: by 2002:a05:7022:1e11:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1350484ce0emr2085975c88.28.1778859391617;
        Fri, 15 May 2026 08:36:31 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.241.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm10393355c88.5.2026.05.15.08.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 08:36:31 -0700 (PDT)
Message-ID: <34586ed6-4f78-490f-a916-baf7657cca7a@oss.qualcomm.com>
Date: Fri, 15 May 2026 21:06:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add
 support for Shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
 <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
 <20260505-gifted-salamander-of-prowess-5107a6@quoll>
 <8cd564af-9646-40c5-a8ef-c7197fb3cfe9@kernel.org>
 <95b567cc-b83c-4154-9520-e624555f1882@oss.qualcomm.com>
 <29571bdd-23bf-42a7-a9e3-918a28c79700@kernel.org>
 <62161822-2365-4ec7-80f7-8660bdadb177@oss.qualcomm.com>
 <40b5e0f6-bc61-4750-9560-bdcc268f0fe3@kernel.org>
 <d52c5039-9431-44ed-9f3b-bb00d03ae176@oss.qualcomm.com>
 <5baeeeed-7c18-46f7-82a3-5bb299ba05ef@kernel.org>
 <42ba6ac7-306a-419f-96b6-3427c51ef567@oss.qualcomm.com>
 <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <9ed7c714-07c1-48de-8d27-cbe24356c606@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE1OSBTYWx0ZWRfXwonPDG7w/gmB
 vaygxr21B8/Amc3GvYvhU2fyxVq5paj8GhIMBklCF0VOblmbZ0Oni0fmOY5xmfhR+vwS9r9G83I
 tMBKYS2oxxiyJD38SBUMaUvtHyWZIrrAXfwqBMoDR49B+uOflrWwMdQr6h6tiEXXH4jUjw0Bm2m
 HL1R4lXe0cbAZXyDBv05WXaSH2SLt1cGDMIdcFOKLkvseZJ2ENBuSBKT5IaeIYoI8oJau235/fC
 XAbuuCo03IHbPWu+qXupuvR+3etpfUkxWOBmDa7lialfwHyjlSHB905bbDv0+okb6kx3h4NvXpX
 3taRaJGQyukwKtMNnaQDD8uTf9UH5/iEiVjjE+8SeAxgFNyicSzYu9E7SSQLxsd8gvZLfWyjTo8
 /1Rxn/dOfEfQMbljm51FI3Km4kRuwhDBPCONvtvkq160cNEn2BITeTDESew2k84wa0iOr33fffw
 SqwWighgEYtRnBu6syg==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a073d81 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=3kx7GFP7sCMRTT5SgtpHhw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kYkthLK8IOESzKOdJy8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: DZjtVk7v9uA5Knhaa1CbnbyG-s-JpMGI
X-Proofpoint-ORIG-GUID: DZjtVk7v9uA5Knhaa1CbnbyG-s-JpMGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150159



On 5/14/2026 8:07 PM, Krzysztof Kozlowski wrote:
> On 14/05/2026 08:22, Krishna Kurapati wrote:
>>
>>
>> On 5/14/2026 12:26 AM, Krzysztof Kozlowski wrote:
>>> On 07/05/2026 13:37, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 5/5/2026 7:30 PM, Krzysztof Kozlowski wrote:
>>>>> On 05/05/2026 15:57, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 5/5/2026 6:59 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 05/05/2026 15:27, Krishna Kurapati wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/5/2026 4:22 PM, Krzysztof Kozlowski wrote:
>>>>>>>>> On 05/05/2026 12:49, Krzysztof Kozlowski wrote:
>>>>>>>>>> On Mon, May 04, 2026 at 10:36:57PM +0530, Krishna Kurapati wrote:
>>>>>>>>>>> Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
>>>>>>>>>>>       1 file changed, 2 insertions(+)
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> ... and then I looked at the driver. So un-reviewed. Devices are clearly
>>>>>>>>> compatible. If not, explain what is not compatible.
>>>>>>>>>
>>>>>>>> Talos uses GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>
>>>>>>>> In Shikra, we are using GCC_USB3_PRIM_PHY_COM_AUX_CLK. We don't have
>>>>>>>> GCC_USB3_PRIM_PHY_AUX_CLK.
>>>>>>>>
>>>>>>>> Hence, I didn't use a fallback compatible.
>>>>>>>
>>>>>>> This still explains nothing. How different clock makes interface for SW
>>>>>>> incompatible exactly?
>>>>>>>
>>>>>> So I went by the naming. AUX vs COM_AUX.
>>>>>
>>>>> The naming does not matter. If the clock is called
>>>>> "no_one_expects_spanish_inquisition", does that make software
>>>>> incompatible? Why would the name itself matter?
>>>>>
>>>>>>
>>>>>> Can I use a fallback compatible and in DT vote for "COM_AUX" clock with
>>>>>> clock-names mentioning "aux" ?
>>>>>
>>>>> I don't know, I asked what is different in software interface.
>>>>>
>>>>
>>>> Hi Krzysztof,
>>>>
>>>>     I checked with the hw team here and found out two things.
>>>>
>>>>     1. Shikra is a spinoff of Agatti and its sw interface (clocks used and
>>>> regulators used) is the same as agatti.
>>>>
>>>>     2. I thought we could use qcm2290 as a fallback since the phy register
>>>> init sequence is the same for Talos/Shikra/Agatti. The difference
>>>> between Talos and agatti when checked in the driver was the init load
>>>> settings. I checked with the hw team and they suggested using the init
>>>> load settings which talos was using.
>>>>
>>>>     Hence both these compatibles (qcm2290 and qcs615) cannot be used as
>>>> fallback for Shikra.
>>>
>>> Then I do not understand why you are using qcs615_usb3phy_cfg for
>>> Shikra. You say that the initialization is different, but you use
>>> exactly the same initialization. So in a meaning of compatibility
>>> between hardware for Devicetree they are compatible.
>>>
>> Hi Krzysztof,
>>
>>    There are 3 things:
>>
>> 1. Clocks used:
>> -> Talos supports AUX Clock since it supports DP over USB.
>> -> Agatti and Shikra use COM_AUX clock since they dont support DP over USB.
>>
>> 2. Phy register Init sequence - same for all 3 targets
>>
>> 3. Regulator init load:
>> -> Different for both Talos and Agatti
>> -> Recommendation is to use Talos regulator load values.
>>
>> SW interface wise, shikra is comaptible with agatti. If we use agatti as
>> fallback, we would end up using the platform data of Agatti where the
>> regulator init load is not suitable for Shikra. Hence not using Agatti
>> as fallback.
>>
>> Coming to driver changes, I used qcs615_cfg because it has required phy
>> register sequence and regulator init load as needed by shikra.
> 
> So is it compatible with QCS615? If not, then something is incomplete or
> confusing. The driver uses the same software interface.
> 
Sorry for the confusion. The Talos compatible represents the USB/DP PHY 
with aux clock input, while Shikra is a USB-only PHY with com_aux input 
clock, so the two PHYs are not compatible with each other.

In the Linux driver implementation the match data is currently used only 
to affect the init sequence and regulator init load and here Shikra can 
reuse the Talos match data structure.

Regards,
Krishna,
