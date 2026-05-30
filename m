Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58CE1DDC1D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149479; cv=none; b=DGg/R4zmmiAAJUmPcPV1MktzSUY7m6SxeL01yuzrUl3guoGVZr9knqoibig5za4l3TKEFtoJ5j+WZmusJs7qrGM9B5VGGRAGSwdC0Nq+yRZOfYhgG571mKWyZdTMRQqgC4PZgjNnoGKsAUTxP8D/jFiT0V/7OogOAqPcFu7kH5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149479; c=relaxed/simple;
	bh=3JkTCQgiH3LxrL3vazE20yrW65gmotpbptgLugSPFxE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DL/nb1g2mfxJGo4iK12lRVtGAXz9TnL9p++vLJTvdcwT+bXL2OC2JIFhMAs+vkyRjdSl9Pir/m7mMnfCUzLkpdZ4ywnUXk4xKulfsiIaCiU6c9FTrGEnMxUMqWGlDOnJz/y9YYHjVE51oC7HDMDdbqmDUuj4N/TXrTcE6xVxYLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzxEthrp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+rSQQBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzxEthrp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+rSQQBv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3PuUi1399279
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=; b=bzxEthrpwQ2pHhnC
	mXbdLD543QfAL0YPQACuqoLErzbiPmGmLK1F83dQzicPXablwtcUpB0CmOzQ4/Ej
	/o85P/EnhUT5Jr72fA92EBsbLovboI69RstSVEjSaYjawP5owiUfpEqtVP3itFkT
	bwBpdTqIm/sCLD+ffq0iAdOe4fjaOmdL6j6iGg3NZAgKGtvVQ0GQxgd++r2ArBKY
	Uu6FNeoStb52siXH9bVGNIGAltQwkfIIjzwD+Sdr63BrQtsanHiQEoi9AEA1OP9H
	5AxM50aPa4JS8+ibUZgElClEFOpcel7BFu9ssKSsSfgRmMGN/zMl7yJEcWhpTRs7
	TjYPAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyus2et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 13:57:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so2488674a91.3
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 06:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780149475; x=1780754275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=;
        b=I+rSQQBvJ3WKQ+26x1mt+Js0Biz5ceGMCMUCkO480Qnwh1+O2qbxld1UnSXu6zrHck
         KKEsvY+8qyqNEcG6dbWJZqWHzg1UtcgfxBU42Rx/KqDyGFexfNZE5DYw0XfPawMBAF6k
         O1RiPXfiGcWmr+h8CtcMEIV/leYCCivNfY4k+O0KM0crkwNqznsx729WRTVAAQf6h2tY
         WTNQm+XluEMr+4FRmtMVgs9tKbD2LYUV06tr03fMi7KurMKz/lPTSNYSfHljla5OOzwx
         nuNE6DD9rrThXOPcpoXkgZSQ76zNONmDb80gbTMpep9AqoHR875RGjyW54BFhPOFRfw9
         RDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149475; x=1780754275;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyfGzEjL9T0vealm6OZP5o97m37ViNP+EY8gC06YbN0=;
        b=FIH5rGwLCZZQdkH5123ceSJ9flxeewkzZW+wZ2hvDKtXs6+cgS6HL4gOeCN5McC+FI
         JhKm0N2in8/9qgkdOEh2zoiK1FWAxZ1fdD+u3sjZN6T4Mt9DRfZPyEC7wN7QfDjR/ME9
         B5x4C1FtunJo64GXeQs1nATN21GmNrwHo6VZprd0i0/aimnRxh6ood7aZyuUzNj6eKya
         SmQPA//6TLp73zQVYTehPplivioQLj+OBSn0QuMdyuZYO+XSgvlEgTJkTVl4mW/9fuwx
         OZaPd0qTC1c1u9duegPmdkjurPxBwcfxIfkYXQnYEnBqluacSmDFCZB06eQ05ajnjZ0c
         tF9A==
X-Forwarded-Encrypted: i=1; AFNElJ96JTJ1sWTSM8KO0rSbTq2+dal4hAJqzQHvHIDNrtdFPzcRTLJQPqoF/phtge1IQiSi/QPcnHcnKu7a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0e0cA7SAAb+T1xYmGZv/2UTyEVk+B+FIR8U9pptjbgm8nA6wB
	jRE7m3kI404ZTpIfzmwnEPnuNPgsdVMrEgTlersO7biWHg3pYUZd75vIWZWT71m6vUt+UXvg4bQ
	Ha++bTdfuMdX+HlO19eFwqLriMh/JxA15LLlzxtX4NtJMiYo4PrEWzGhpO1tAA826
X-Gm-Gg: Acq92OFE5DdSzmRi8bqYlSfemDXCL9Batej1dUycMCDq5aZfTgUqyRWLqbj0Q6eU/Aw
	FzuXvz3OUM4LxVG/CPpElAVnKGdqeN9vblfiUjaNShuxf5umuscEp6SyuZXq/2Pv90BbgQiXMIi
	Z2NBo0mPRr99gju3l9IagarulX165ZfsG8XrI9XQde69qfKihoP5ZMiba1mY9532t2pkM5dtovb
	nil38SQyJtu/QpxLpPciYKWfbp/YgWbT+5Fo+ETuqVq5Bp1dK/uzeVoq/MWrVVNbJzq/mzYNj0A
	RMqaqWTJxpmnFPtoxsYf2gaefWmmw+1HnEcTaPl/gWCfblpnCJgq3Xvxl+nqqp8lY4OImlo2gQq
	siOROHMekvzFCeCoh3N3+vAvbRmTuylYdZbx3QsR37Hpdgo+r/YrboWEKcMbe+x9lUkb87/B35v
	HMFY+MXUqGi/na7O/krc+U
X-Received: by 2002:a17:90b:5704:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-36c501ce691mr3673549a91.17.1780149475479;
        Sat, 30 May 2026 06:57:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5704:b0:36b:9c4a:e05d with SMTP id 98e67ed59e1d1-36c501ce691mr3673524a91.17.1780149474988;
        Sat, 30 May 2026 06:57:54 -0700 (PDT)
Received: from [10.133.33.28] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbffc1879sm5653053a91.5.2026.05.30.06.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 06:57:54 -0700 (PDT)
Message-ID: <dff3c74f-0c46-4ac1-914a-9ea8bd40316c@oss.qualcomm.com>
Date: Sat, 30 May 2026 21:57:37 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: ufs: Document static TX Equalization
 settings properties
From: Can Guo <can.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org,
        linux-scsi@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Zhaoming Luo <zhml@posteo.com>,
        Ram Kumar Dwivedi
 <quic_rdwivedi@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260529113338.984301-1-can.guo@oss.qualcomm.com>
 <20260529113338.984301-2-can.guo@oss.qualcomm.com>
 <20260529-neat-bright-shellfish-eab5e8@quoll>
 <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ada65ce2-6736-44fe-9396-d3ed632274ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE1MSBTYWx0ZWRfX6ErULeuW12UN
 eM8TS5o3MCPgCkOF1TFMsdiIdFLa483mooVTgeAjgWa2lT/kvnKxCOr41RdyYx8foj9ldF0+2SC
 uFmhTGp3M6w/n4tWSrqNbRwCOsfu/2ObFvt3NoKgMNpSKm7JxPeDXxKGjfnUORhzECZ9sCSz1qW
 ZnZB1i/IooMQgTXHtxwobJqQwCx/ZObkovPtuXRsASiWIDlvmqrmHCQFBIFIVjBLb5b7QIOn1iP
 DlWC+3pgc+LzTz2y8njReWTC/0PcyTNwA1xv+trGTTsoxzVY4Xsbt1NlYJOxHnjBQy0WiCU6sGn
 KzjtyY+gYiuIz7ukcfM7NeUY2m+IyL1UUbFMnLusBvmOU9tuehtrmNm0RWdZGGP4WrkywoskReV
 j7PhAvZu4djsTqUr+RjzrE8nQOKxVqBDqc62THMIJnB/1BCSc9VUpdGW3ORidawQvp/1BSAHvhu
 ZScZa3yg2f3xBzJ3eXg==
X-Proofpoint-ORIG-GUID: 3JvmQYm3fIf4Lo02QJYal3JxLY81Wgh-
X-Proofpoint-GUID: 3JvmQYm3fIf4Lo02QJYal3JxLY81Wgh-
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1aece4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=PY6Zn8H8AAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=LJiSo-RwSUm5TJ8LWggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300151



On 5/30/2026 8:45 PM, Can Guo wrote:
>
>
> On 5/30/2026 12:58 AM, Krzysztof Kozlowski wrote:
>> On Fri, May 29, 2026 at 04:33:37AM -0700, Can Guo wrote:
>>> UFS v5.0/UFSHCI v5.0 add HS-G6 support (46.6 Gbps/lane) via UniPro v3.0
>>> and M-PHY v6.0. In these specs, TX Equalization is defined for all High
>>> Speed Gears (not only HS-G6) to compensate channel loss and improve 
>>> signal
>>> integrity at high speed operation.
>>>
>>> For HS-G6, M-PHY uses PAM4 1b1b line coding, Pre-Coding may also be
>>> required depending on channel characteristics.
>>>
>>> Add vendor-neutral DT properties:
>>>
>>> - patternProperties for txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6]
>>> - fixed property tx-precode-enable-g6
>>>
>>> Each property is a uint32 array of per-lane tuples:
>>> <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>]
>>>
>>> Accept 2 or 4 values (x1/x2 lane configs). PreShoot and DeEmphasis 
>>> values
>>> are 0..7. Precode enable values are 0/1 and only applicable to HS-G6.
>>>
>>> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
>>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>>> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
>>> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/ufs/ufs-common.yaml   | 45 
>>> +++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/ufs/ufs-common.yaml 
>>> b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> index ed97f5682509..d90cf25adfa5 100644
>>> --- a/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> +++ b/Documentation/devicetree/bindings/ufs/ufs-common.yaml
>>> @@ -105,6 +105,51 @@ properties:
>>>         Restricts the UFS controller to rate-a or rate-b for both TX 
>>> and
>>>         RX directions.
>>>   +  tx-precode-enable-g6:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    oneOf:
>>> +      - minItems: 2
>>> +        maxItems: 2
>>> +      - minItems: 4
>>> +        maxItems: 4
>>> +    items:
>>> +      enum: [0, 1]
>>> +    description: |
>>> +      Static TX Precode enable values for HS-G6 only.
>>> +      Values are specified as per-lane tuples:
>>> +      <Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].
>> You need to include them in any of applicable examples, otherwise
>> nothing here is validated.
> Hi Krzysztof,
>
> Thanks for the review.
>
> Since no UFS5-capable SoC binding exists upstream yet (the target SoC is
> still pre-CS), there is no vendor-specific YAML to attach the example to.
>
> Is a synthetic example directly in ufs-common.yaml OK to you?
Let me update qcom,sm8650-ufshc.yaml as it includes sm8650 and others.

Thanks,
Can Guo.
>>
>> Why values cannot be on or off? Or even better: why you cannot just list
>> all the lanes which has it enabled, assuming disabled is by default?
> Thanks for the suggestions.
>
> For the "just list enabled lanes" suggestion: precode must be configured
> independently for the Host-side TX and Device-side TX transceivers within
> the same physical lane. A lane index list alone cannot capture this
> two-dimensional per-lane state. The tuple format <Host_LaneN 
> Device_LaneN>
> is the minimal encoding that covers both.
>
> For the "on/off" suggestion: the on/off string pattern is used with
> single-value properties (e.g. LED default-state) read via
> of_property_read_string(). I am not aware of precedent for on/off as a
> string array for per-lane tuples.
>>
>>> +
>>> +patternProperties:
>>> +  "^txeq-preshoot-g[1-6]$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    oneOf:
>>> +      - minItems: 2
>>> +        maxItems: 2
>>> +      - minItems: 4
>>> +        maxItems: 4
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 7
>> What is the meaning of values? Nothing here refers to the spec, so is
>> this driver specific?
> These are not driver-specific. PreShoot and DeEmphasis are standard
> features of the MIPI M-PHY / UniPro stack. The range [0, 7] is defined
> in the UniPro specification for the relevant PA layer attributes, and 
> each
> value maps to a specific dB level as defined in the M-PHY specification.
> I will add the value-to-dB mapping table to the property descriptions 
> in v7.
>
> Thanks,
> Can Guo.
>>
>> Best regards,
>> Krzysztof
>>
>

