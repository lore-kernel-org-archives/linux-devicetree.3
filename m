Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154443CDBD5
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693594; cv=none; b=cBt7jT8tJmgT+txL5NENn6DDIQxHJpIME03AK2P5PHuwsxZUhQFCQaTLdq0J7hbOBfoB1m/p+NXhp910mW3hKV5m6x48yGYtwQdBXRLELwefL3liPE/RYAYVjeAuYCZMXRh6XzDhmqyHow15Qwamy31nAoCFEGYeBIh5n5Fh3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693594; c=relaxed/simple;
	bh=a5gc0uCdQe9/5DFJrAShKQrfw81He2Dn2U9WGVp3XB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlMnJUTVnW+9uj6yejxwSYOr2zvCseZEWiZRMk7W7uleCKsMaqmTAOseFAon4WWQR/q1h6FdM/WJ1T+IieUQ6Tqi9rku/5JfQDMEZzQVbW3Y4zirNf/7rv6sfhLw0jC9PZ5Pve75UAR+qDeGpXDxNGEqqTpZcodgy6ojc82fNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxE51Xik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwWsFulM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxE51Xik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwWsFulM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OMI0ZO613105
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxI111Tk2C3/6cjEtvMbYrAZgT7NZnITlSROWVUr89k=; b=LxE51Xik4Aff1NH/
	sB30QEUnEG/p4C6471ZbfEZJ7FXfCuZGd0xT2GhjgvPHQS6QXTVURoJ0lKhZK95A
	DtAqqsnSQ5aPZoZCVcel+Z6ZkA4du16hcxsHO4WSPMY40lZIZe8Ten5TfAfhSzlO
	cVIQaDtGWv2z2diYDRxpVbJnnbnMYrqHE4od/XX7HUA2PTJM9YMaCJJW9P1zPe0v
	Kq7LKonaHl9x8DHaMWu4/bS8/Ht2jEjH3WDR5ddq3bNxXVO0BMnv+Gkd4tfglzWd
	YoTuCCZBLbosCDAH7hYGEOcuWBl2qo5R3GjYbLJHm17Mb4vQOmzcomaDnIbvWklw
	m7A04Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9nc6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:19:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so208366035ad.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779693592; x=1780298392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxI111Tk2C3/6cjEtvMbYrAZgT7NZnITlSROWVUr89k=;
        b=bwWsFulMwiSuCfIq7Og4lqHNNLE3dcbJj+pLNEiINZuqX/lY67YCfuAZvKpWNos6XE
         ohWNZQplmJi2OP8iSoG59aIZLHCJAc/UZe5X+Iak/hPoC8i470b93d75H+p+PSaYZFJB
         MUYQ9b+zh2fPP6DHM5KnqUo6i/3zGASZlDTyg+dLsd46HtacSN4snl6z8Aj8Qt0vwQZi
         DqXX7lJ2qcte3UWNVmOnEUZw+g4m2B1YQJS6If3iadDcC6wIjzTKrIZCKWYTHFkRIMTj
         jPdOdv3D4xMDkYLXvaDqz1J7XjPblhCdvDZAPNdNSQdy+SrrWKSGB63tRdxOTIzYQaDC
         u/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693592; x=1780298392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxI111Tk2C3/6cjEtvMbYrAZgT7NZnITlSROWVUr89k=;
        b=cl4+8kI+29MRyzoFk4uVoG8vGeGaH9Llwcb0EqhQHuLVSIfseaxMPnVoRcWNDnXb6C
         X++XbT3PJ730+/UuBNnKGdnGtXedJhZsDQnb0yL7SHUtYFrNbmG6N0ac6mTJypUoCReg
         v1X2UR1Xg1THGudYlTgBUJrqHORiQeHNRj83yXncg5daMqU3jfV/0OVtmHJ+jSxlpscf
         y07pHrGejZUJvaIkjuFxvaaWIjQ+Tt5DAefiqLeJvTq/NP/rzr8Qw+H6IwEOeGzTIGdL
         LDnH526Rqghq5J3lPobTnB6mvNBQ4ipV/iLmJ5jsm7LnsHsXm23FbMbpaZngAN+rCPdL
         20TA==
X-Forwarded-Encrypted: i=1; AFNElJ9JdGPSxjFYMvBeZNNRlIOYGnrSodvlvm5R/jV8yAY32zy5NQap8V7WfYNi9tjNjJKCSDnIcUasMGz6@vger.kernel.org
X-Gm-Message-State: AOJu0YxFmmcCxXGpOJSQ5f42tYLY/3+/ZaRfk7BTTvB0luGSvdzcDM4b
	F4yICL8wIHisCuFlTTIr3D2AYaKga/6V5in9jEQSxS1tMUKJodYNawZMapBZ9nm0g8AM6B+6YDS
	Y25KFOdPZSxjt4jgk+TOgxZobnkfu7mNQCNwI/T4eBbd2u648bB1cskd3Y8hv9Xbf
X-Gm-Gg: Acq92OEYivTpGi/qsoaBeRaGlFkaMC8q0ConnqZNbat5ebF//VBK+Lz30Rte5Avk5T9
	tDNgWtzF2haL8GLYBXqvy1YkMmJLj63GntXfR1b344OoXGkX6hWL2C04tQQNGCFWNueI5ci91Nu
	DFhGiTSjr/qCoi8PvIIq+nIo26q5QXcEhU4kA/3ZFHXFVDfpngChlkOBQ46amrJNZjL95hM6qCV
	SRth1E2ueHTky4i8ksnpRoHDLoM/qxrx3Gwb3OE1IjbgnnOy5aaPaiP1Rj9oF9mZXHoAwa7+zXu
	6FhaO1DtIcXLFGrkxzZOCxDttv0W+Xry6aHiY7UamAwHYWoiXh3t1PewVJmWPXeC+GHA0iG/s7n
	nkA0oXYRQ7eZ5/rYTUGX2khXUoMhnKYAfvyVjMxLmfbqnRonKcSIEew==
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr150386765ad.30.1779693591583;
        Mon, 25 May 2026 00:19:51 -0700 (PDT)
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr150386515ad.30.1779693591010;
        Mon, 25 May 2026 00:19:51 -0700 (PDT)
Received: from [10.92.183.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f54sm87935705ad.10.2026.05.25.00.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 00:19:50 -0700 (PDT)
Message-ID: <fc30805c-b9e0-4fb1-8769-c7b995310556@oss.qualcomm.com>
Date: Mon, 25 May 2026 12:49:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] i2c: qcom-geni: Support multi-owner controllers in
 GPI mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
        Frank.Li@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linmq006@gmail.com,
        quic_jseerapu@quicinc.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
References: <20260423145705.545552-1-mukesh.savaliya@oss.qualcomm.com>
 <20260423145705.545552-5-mukesh.savaliya@oss.qualcomm.com>
 <ag_Ig7aQNNakiry_@baldur>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ag_Ig7aQNNakiry_@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bPMcpGEWOXxsTkPG3mGVma-ylhl_Ew4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3MSBTYWx0ZWRfXxxOygJjwMOWZ
 u9KBCdFvPEMyBAMiT8zZyoyI8QFrLPAX+UJC2lXaYZ/Q+8b3NswKRqZPSdMsL+n2Pl0NpHyjRO1
 mvtLPhr7X9QD56AF3f8Nc8jWNjWr/hV2z5iI6Sr4KrBNqNNR7gR7rl+4HuVQ3U92XQr4VHmBqmz
 hS/VwWFUGiC831rp5PosgWmKN0LHPggUHw8jxwGILyacg3nr22nQWgKyj71Z+5Md2iVhQHxkxNF
 5WyZETsEtjktVy6MldJ6Kv8DAqCgZh/pdc7TljIbwSw/sLYAEMeBw7B3BlaXHZAidKQExJW2ysS
 O2WuL01tyHPunE5iAbaEi8pkpFVuYwnC1EIHseRHXJLEMLqdfMaCkTc93oRVCF3mNPcDJBDyxfK
 ho6BY4w5BdIA6ggBzdFDl3aTb+bK3Yw52SEzXKRTq/9RcAL2KiCua0wMto8ViZABivynJSiptkg
 K80FMXOwnkwtfG3BrFw==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13f818 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7O1uvCrluarMPFSrEYwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bPMcpGEWOXxsTkPG3mGVma-ylhl_Ew4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250071

Thanks for the detailed review, Bjorn.

On 5/22/2026 8:45 AM, Bjorn Andersson wrote:
> On Thu, Apr 23, 2026 at 08:25:51PM +0530, Mukesh Kumar Savaliya wrote:
>> Some platforms use a QUP-based I2C controller in a configuration where the
>> controller is shared with another system processor. In this setup the
>> operating system must not assume exclusive ownership of the controller or
>> its associated pins.
>>
>> Add support for enabling multi-owner operation when DeviceTree specifies
>> qcom,qup-multi-owner. When enabled, mark the underlying serial engine as
>> shared so the common GENI resource handling avoids selecting the "sleep"
>> pinctrl state, which could disrupt transfers initiated by the other
>> processor.
>>
>> For GPI mode transfers, request lock/unlock TRE sequencing from the GPI
> 
> "For GPI mode transfers" is there any other form?
> 

Good point. The lock/unlock sequencing is only relevant when the
controller operates in GPI DMA mode. In FIFO mode the transfer path
does not go through the GPI engine, so this mechanism does not apply.

Let me clarify this wording in the commit message to make it explicit.

>> driver by setting a single lock_action selector per message, emitting lock
>> before the first message and unlock after the last message (handling the
>> single-message case as well). This serializes access to the shared
>> controller without requiring message-position flags to be passed into the
>> DMA engine layer.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 22 +++++++++++++++++++++-
>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index ae609bdd2ec4..a396ddc7d8f4 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -815,6 +815,14 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>>   		if (i < num - 1)
>>   			peripheral.stretch = 1;
>>   
>> +		peripheral.lock_action = GPI_LOCK_NONE;
>> +		if (gi2c->se.multi_owner) {
>> +			if (i == 0)
>> +				peripheral.lock_action = GPI_LOCK_ACQUIRE;
>> +			else if (i == num - 1)
>> +				peripheral.lock_action = GPI_LOCK_RELEASE;
> 
> You say above that single-messages case is handled, but if num == 1 then
> we will hit i == 0, set the acquire, we will not hit else, and then we
> will exit the loop. What am I missing?
> 

You are right, the current implementation does not handle the
single-message case correctly. In that case we need both acquire
and release for the same message.

I will fix this by explicitly handling the num == 1 case and setting
both lock and unlock for that transfer.

>> +		}
>> +
>>   		peripheral.addr = msgs[i].addr;
>>   		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
>>   			peripheral.multi_msg = false;
>> @@ -1014,6 +1022,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
>>   	}
>>   
>> +	if (of_property_read_bool(pdev->dev.of_node, "qcom,qup-multi-owner")) {
>> +		gi2c->se.multi_owner = true;
> 
> gi2c->se.multi_owner = of_property_read_bool(pdev->dev.of_node, "qcom,qup-multi-owner");
> 

Agreed, this can be simplified. I will update accordingly.

>> +		dev_dbg(&pdev->dev, "I2C controller is shared with another system processor\n");
>> +	}
>> +
>>   	if (has_acpi_companion(dev))
>>   		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>>   
>> @@ -1089,7 +1102,9 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	if (fifo_disable) {
>> -		/* FIFO is disabled, so we can only use GPI DMA */
>> +		/* FIFO is disabled, so we can only use GPI DMA.
> 
> That's not how we format comments outside the network subsystem.
> 

Ack, I will fix the comment formatting.

> Regards,
> Bjorn
> 
>> +		 * SE can be shared in GSI mode between subsystems, each SS owns a GPII.
>> +		 */
>>   		gi2c->gpi_mode = true;
>>   		ret = setup_gpi_dma(gi2c);
>>   		if (ret)
>> @@ -1098,6 +1113,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>>   	} else {
>>   		gi2c->gpi_mode = false;
>> +
>> +		if (gi2c->se.multi_owner)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "I2C sharing not supported in non GSI mode\n");
>> +
>>   		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>>   
>>   		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> -- 
>> 2.43.0
>>

