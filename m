Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C7C428838
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607864; cv=none; b=XOIiLQ8rIU9YJvB60fjpoMTzXaWXIj0CwAEmxsLX/aUC538pYX9hfAqGMYHnghq0nIjLUiBVf/oxqSTnSVxn2pd7tBnvsKCvBNcP15iOioRVZ2IiwhCequfnRPhxrzp2SSKUnqZ21VOOFXu7xou5auqpazIjBjkfxa2MPfj60UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607864; c=relaxed/simple;
	bh=vIEZ1m1WpXM09pbOXin+8s65/YNE5Q6ZCrNcP1lErZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GynxymVRxe2qExHVyM1XE77SLlA7VcGVrsjK3VOZpWIHCmLCX2b7LavaMqRMb8+hc6LLoqkkSdYJdlItzRkZUEV+zU1SJTvybs5B3//zdpLl3WoA82N9epymg7VgOBIPyvflejwN43+lYCXAP/A0MrHCeXfqsqhIcJSh5OAAP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSTtf2jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Amu7wNX0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MSTtf2jJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Amu7wNX0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9jPE2799422
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=; b=MSTtf2jJqGmJ0Ukx
	Ftpajts/fnajSBz2s6syg5yldd/kLiOjRXq/Q02I/E7qzqlMIutN4L8pldwoPjhU
	17eQiyUwhChLF3pF5VfzroY/1immOrNOHteXBrDMw/OjZ5lTYRNuxIYAB3Ob1l6o
	6zJ8++Oy7K7beyRaW6E9E96E+7zT1xgphL+1detKEltqjb3iTvNKWSnIvhEkzPad
	cYqeC86XszgKhRfyLDnPf659BtsrnYnT/4WPtD73UFbqVp+M2zXmpuP2WrL8w6WM
	kK+e6L9+lIM46dJEpe52k20J6z8ch1oSRbDnnfLmRdasfo/PJZnu3+QrhGPlg3Rr
	CuLUcg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7set3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:04:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccd69b9a10so9761326d6.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607862; x=1782212662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=;
        b=Amu7wNX0oMXs0b9WgC3Sjv1ASYX+EZ5X1UmNZEcQvA8qdj3kKe/TNzUc53s5fiGRb0
         IitSObA3VHpai+IJy5pVw9Iw90C9jy+cc1iE5uov6J4XdUeJqFpQUDBWB8TwGgevttAd
         O29CLGH4nNPdk8QcOLuYW/nNprsQPXTCgkmG5HsP6G2lgtsXZmZNhltGYaN2fl47YRaj
         uprMawoSHzaTQsvsEBHqn/4NVcQZg2O6CwmmctcspqhoeRNjHU4SgjMV9FtMYzv1qDJq
         VPHRM9eNUM+J7iIkNkwA/RJ2iRM6zEsmXqjWSxpsImwBxU5szD4UXv5r6oEnrwV4OGp6
         pRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607862; x=1782212662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=;
        b=A03//VU4fyNwQ9cmml4NxPwBllJgIqVFJ+JhoTJglLP5uZS1wHOuKVBsffPTklkQjq
         DEP0h/lZs00yy3nhb2337BDXfQUUSAba+8xeH1cHylYjibk/yransaqPSMf0lz14T887
         53dLo43Alax0MSVNSmPtkcjyKyshlbf29+jeL4Ctfu3z7z6QSC0I+LKnZVTY1lgINFVQ
         X1wo+TEV3RaCCqch+JJI+I/2Vway4x8JNOfidqkdf4e93l8ED61KXQWJ2O2xO5iZW1Yc
         uTtuvXjBu5KODKvC5AZP0+Gv5sxzV+w8t6DmRd9arX+idYeUpxqyu1QdKCcK9f72uSHd
         RuZg==
X-Forwarded-Encrypted: i=1; AFNElJ9uP6lx3oRXJFkswoQMjRJwLnI1R7dPIVn3af/CnZLoRcj/epVynqU0zNCaiEKHp9OzRZjGeZN0VCNT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNOORplNj+u9dw4pIW7yKb2ohibh345OVWKErS/1q038zmpyh
	IuxY08iAFyBlhUHqBNBfMUNHKhtmZkUsei6WswQfXYKdSqK0S4fAeYCUWyNoisayG5zSkN7mp8W
	/b+DECvxfcYxBYaYkQyfsTfDJeg4ct49Nivsmq1jw/Sam/O4soILthVr6/yvuQwLL
X-Gm-Gg: Acq92OG5ArHCXrzXENRRmL2Qj1Dv9Uh8AFn7+3oCqI3DXnipXRlXDRE2CmDirWpVYiW
	L/fxBfSi7qZ8u9q2cM6ZLjaqx21Tk+sV0cpO/cO7CnJ9sjI6RZshBO+gs0FEwkX5rWm/5eQLOBl
	XvkSR2C1A2G/P82VFlCnUnKzp6CHLLS8V3qhfdOXGfmzaCEq9n6jdBsXJXrgn0sBK6phAUw/q/X
	gL9L9mcyYJ0R94XLmIYOmujfTya+KzBwM4/bV2I5rnIXAY8FSjSYbXq6aOnTMcVRx14DDXWLDTJ
	tuClRmbpavfZ9Vih5o9PuVMjaxXeRO4KY+nLLyS3/NY9SEJx6h1NisQ+ZlJ5q0XC+4lNmSzJEdf
	JmZD8Df3ltDpgiPlDC6F5OEu6iU7q6YZVtwv+065xwwrM8w==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1628988985a.7.1781607861845;
        Tue, 16 Jun 2026 04:04:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1628984585a.7.1781607861139;
        Tue, 16 Jun 2026 04:04:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c43a6d9csm4226714a12.13.2026.06.16.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:04:20 -0700 (PDT)
Message-ID: <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:04:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX2UYRZvjvBOsU
 T1lwW5094Bp7n/743eMlW5W4TGNc2UuLmjq6O496vMTIumAUO1op6C7k2RW0L1D/g4CKaKKuYPJ
 IazfZYmnO0gGCffAxcmgqDh8W3aMo/A2Q0/8FxN2+5NQnf8Y2DGXm7w9GzbaEXpZy2/056LY4kv
 EJvYyGSv8Y/26K+Ou8QL9So2+tK0L3RbirqXExM42Fx2xSo+asF8+tOaEc7plxDJfbXJS/+1dsx
 sB94c1+EHd3+ERYT1ZXgx2Mc1TDdB/T0rhLKiYpQ9G80Z9MUdjGhRJm8mT96Dpoy9qSWyXliB/r
 SCSRROf/IEh6MKuUxm+1pao+KYt68tOMdgB/cE7rE15PcRykXgBt7DQSOncqEPm/wV6cpWvx+gH
 wlU6j2E/fRcLeMuWfha0FMNlrUi9AROBhvn9nKPZURo1e1pNVlRRjek8ddFfraC7tdl3mkZ/ito
 lEqt71LIt1nU9L1pTcA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a312db6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iFyFSK6nKW8e_JCYEZ8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 2NtUWsGLOt6haD_CEX9k43q8gsFbgU4p
X-Proofpoint-GUID: 2NtUWsGLOt6haD_CEX9k43q8gsFbgU4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX7yoV6N+fJW/Q
 pqsJ+IzpEdSGxVjvUtgviuix1gu+FqJuT7vCZ8ALbFo2DHFg+5USYGG/5k0qnkmtrYZVtrYU1uo
 qI271dEMOT3HRO3PXQEePVFldGjkn2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111

On 5/25/26 2:46 PM, Hans de Goede wrote:
> Hi,
> 
> On 25-May-26 14:29, Konrad Dybcio wrote:
>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>
>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>
>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>> correctly show mem blocks matching the EFI memmap:
>>>
>>> 82800000-829bffff : reserved
>>> 829c0000-83efffff : System RAM
>>>
>>> Instead of:
>>>
>>> 82800000-833fffff : reserved
>>> 83400000-83efffff : System RAM
>>>
>>> before this change
>>>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index de0f2346cb38..5a2e84365901 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>  		};
>>>  
>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>
>> FWIW the reference memory map shows a contiguous block of:
>>
>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
> 
> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
> aligns with the EFI reservation and with the dts reservation
> after my patch.
> 
> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
> both EFI + the dts (old and new with a different start)
> having this as usable RAM.
> 
> The 0x83f0_0000-0x8400_0000 area seems to be marked as
> reserved by neither EFI nor the current dts...
> 
> With the first part of the reference memory map aligning
> with what EFI shows, I think this patch is correct.
> 
> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
> range though ?

The logs in your commit message suggest the UEFI ahd already taken care
of reserving that bit

Could you post the full output of `memmap` in uefi shell on your device?

Konrad
