Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F33390CBF
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874712; cv=none; b=pKhkP8XnhMcFhcyTfJlpTrpQmHDn5XgsTAslX3J+/ZAdeGedjNVl4ifOaxuTrFdyOzKSuIQOUDRf39B1RsbC9iw3c6QsNdOrd4UglTCjkVkTCUZurBvy3WkuP8xrKkL3hs7zw3bPuo+fnma0aoMtSx9I4sLcHoRiMEDxCont57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874712; c=relaxed/simple;
	bh=rV8w+b1ETZv2QN0XAg1ZP/q3v4ysXMEHONDN++Z9/eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEjXsNj23I8op6WTclIrfR9Kh/0lzLMPIYRallJPSA0kC8WrKcj8Z4qJOHgiJswHOCg5Jq5CXo1XQp3tMjGXt26rC5/tWFZztd9dcmKfjIrg4oTfZRk6CZ4onLYHdCcbB4uGG9He4u8MA6xVVvE6TUt9VngrTmhLnR91+HFzFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhDzh1u/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQcjDlPb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhDzh1u/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQcjDlPb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Q52I4033812
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=; b=YhDzh1u/DX2ScARI
	+7uyZCHm7I7/USzofbrw8WWCjyanL1ePGFpVvan9J9rH3M4GiZTG6G4jJbXFzVR1
	Apsy0IS8tJiZxXayP8FKGVkcaBHpOiPhWmnyYtt3ghzY5TyKdNVEjYDDhnqaU641
	LA7CsHq60Gb+o6GHC0fWSAnMdm6bNBPUVLD3OuRhtWBgQlIH6fUiMACyJK+J56qM
	CfYRpZ9hnRKpeBqVCZhs0w3/ZaBngVBk09Y8stII+nTZ+gx3cdWlWwhPrXWNcB4N
	OlSFGjmbBdCsGAliB6BNnrdjG3YE0K/1BioGReuRUG6HTztSrE3rb8LS1Y3+ieay
	vIHaeA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sba5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:11:49 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso146030137.3
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874709; x=1782479509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=;
        b=NQcjDlPbT7prGkwz1WmdcZUukRqNT3hOAa0suvpf8IxzPUZk9/8WjNiUPBnx+EgY5o
         k86BjJroNDFxlLFDzjRvpWTMzks8BhpQPRRXv0KLkTHScHEhDqwYnAxYBidIUCKmJjWm
         U/xxmNpt+ZI/iGTE+lhaozRwojLBs+QNzhjLL455oFtjRvhll2A+Hc1yLOBypyiDYwGu
         8ttztIjS6HjtznRI3jxzHkRFqpo4sNNPPM29qkNLJ0hqKWUf9HNawrLtQU6qmfMBV+kQ
         eBhDe899sCSKZaRmEQMPX0l7lPg8lP2Mhsb773SkEDRa+3zls80YbsTaTRUJ3Y3OFAQF
         w7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874709; x=1782479509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=;
        b=HQntbbFaq71sQV5v5yR/kTZIakwuYIhjRUsiLfnQeBzkyIPsYAokHcqSnh2yNozNvX
         +nEq8u3fztfKRPwB9653jcSroGhThkCAk59QZThaXnqP2xX08kgfIDa/zB/dUMwC0aiJ
         0WMeESkB2iiqfeCIua9cdbj8vqxnUK8Ena+PPpqPlq17hK85KG6e0d+P8F5zmFtbIbVs
         6Sj+MkQ1amj3ixyr+turkj7k+uNDupMWyo5IntCW5CjNyAbroNMVtgYNRfMpquJkCeHr
         Dd/vTn2SxlyoV9Om8dF847wHjSIuGUqwMmsp1YUh0nnlEfm6Sitv8wmHwsrWA4s6xt/E
         YVYA==
X-Forwarded-Encrypted: i=1; AFNElJ8TJAzLSKk5cxQbSNodNiJRz45ICS1VAmjsEHs/wC9u3Xygy635YmifouIXCDRS+1uAUA57uNCF0kHM@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/o7RtJgPLfJRN6HKrNZ3n/MN1G+jDHgsfuHU+p0CVML9V5Mg
	RksYksWpA0YBlyO1J2+qAhypX63u6VHUXyikLaB+eNKsZ0ZkSfAVg0PqcpOGCcUYmx1nim/9E6B
	4HpwQkt1JRC/Cb2WQqX/xYzpgIAxUIFezZhsOuzfauLmYJOfLN0TgsUfWnMzFjEbn
X-Gm-Gg: AfdE7ckf02UB2OYYyCNkpE6u3giNKLGLq3+9QkR3UbCWBDbENFUv65rCu06MP1Z761a
	hrwLYF2gEbKVmHV88YA8fA6Z2rUrtlWTEh51am5qjvvCS3NKh63SfueQh581nq5GSfLeATjbL9U
	MSEfQdtkB61aXlfh4NEzMFdA5w9pU9jeYsm2PYwaGyzJ1fcTR3CqLrgW+OuGfY0PRmV2B/MPzUP
	IOIc+Q0OzIrqo0tArnqwgosRjtkQIQLAZ3VpOgMDP+Av4Iwp/NfvJCS07glZL6iKBcM8X1KhlVO
	DtEChM8kIXMH6Q0W+dpPvvoI4UFJ48nV33TFU/MCvUbIXdGulgw958sVQLxPPYf4O5+vPDOmo08
	dg1rADvbkG9iJbPpdYMeXENBEhYgiiR4m0Yo=
X-Received: by 2002:a05:6102:3311:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-72b16170536mr153060137.3.1781874708862;
        Fri, 19 Jun 2026 06:11:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3311:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-72b16170536mr153044137.3.1781874708367;
        Fri, 19 Jun 2026 06:11:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490b104sm88203066b.14.2026.06.19.06.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:11:47 -0700 (PDT)
Message-ID: <e8a752c0-db26-46f7-ad5d-19b00e0c30c1@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:11:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
 <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
 <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
 <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
 <5621f70b-984e-4a65-add8-a9bf42e6c0c2@oss.qualcomm.com>
 <9434068bd7e69c92fed5382bff2479d4fc0e4bf4.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9434068bd7e69c92fed5382bff2479d4fc0e4bf4.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rir6a_51t60vBi5fklCRO4a3_rWtRzHb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX0HWlsvwqiWwK
 DQbGqN7q4vU4yyEQ/Cw/tder0xEOZI4ZiPvKF921UliDJ8Pf6jav4Rpcu6BlbrlLSitnmSIe4KH
 PhOH1Pcj8y3GozsUNKx6wM85t6Ic9Gja0cKsIV7eLENIP/gqt+xAO3d2f0s4N8aIyV4UPbXUhRB
 IABJfVZrUsT6XFR1Zitha5KPW0lxzMvlhUcZicocXJAqMSoNSrkWgaGEMlVGfvWmhbBOhVjM2bP
 eC97Dxd42wlFXggLD6D43rxyeOBmBm6nsJ0E6DtYPvRFp49gTEArAGA42Th+Pr1lQoEHTZnTMo3
 z1SkT8n9aRWwLHaFRH9kR1zevCpA1XLYQOm5XaA0ESZzvyy9odm3SQ/cMOrzyh7YHPVY23EsAZe
 kuHPhpGont0U7RvCAZGLbG2UKiiMVjguiJui07Mpw0GiFOXwhhqzT+P1bIMiH5MgJS0pTTHwgyU
 /gr0mrUrm0kqeu/R3lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX9kT/DWI/qwHm
 lU0//XbhCrWwP1rFrZbQy/4bB3U7cZQzR0o0lfD7lK8YozOdfJu648j1TSxnBWFFoR2bMvpyzJ5
 Kv6vTUYLf1Cop4cHrUGmgIW0bQCb4kA=
X-Proofpoint-ORIG-GUID: Rir6a_51t60vBi5fklCRO4a3_rWtRzHb
X-Authority-Analysis: v=2.4 cv=KbzidwYD c=1 sm=1 tr=0 ts=6a354015 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fGO4tVQLAAAA:8 a=6gIg4Y3sYP9ApIHZztMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190124

On 6/19/26 2:50 PM, Icenowy Zheng wrote:
> 在 2026-06-19五的 14:27 +0200，Konrad Dybcio写道：
>> On 6/18/26 12:34 PM, Icenowy Zheng wrote:
>>> 在 2026-06-18四的 11:05 +0200，Konrad Dybcio写道：
>>>> On 6/18/26 11:04 AM, Konrad Dybcio wrote:
>>>>> On 6/9/26 5:54 PM, Icenowy Zheng wrote:
>>>>>> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>>>>>>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>>>>>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>>>>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>>>>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>>>>>>
>>>>>>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>>>>>>
>>>>>>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng
>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> The magnetic keyboard (USB HID) can't be
>>>>>>>>>>>>> connected
>>>>>>>>>>>>> somehow,
>>>>>>>>>>>>> others
>>>>>>>>>>>>> are
>>>>>>>>>>>>> fine, such as the spi touchscreen (not upstream
>>>>>>>>>>>>> yet),
>>>>>>>>>>>>> which
>>>>>>>>>>>>> utilizes
>>>>>>>>>>>>> DMA definitely. My config is here
>>>>>>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>>>>>>
>>>>>>>>>>>> Is this a defconfig?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Yes.
>>>>>>>>>>>
>>>>>>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be
>>>>>>>>>>>> selected
>>>>>>>>>>>> too
>>>>>>>>>>>> for
>>>>>>>>>>>> exhibiting the problem (because there should be
>>>>>>>>>>>> "public"
>>>>>>>>>>>> GPI
>>>>>>>>>>>> DMA
>>>>>>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Is this still necessary? I checked the fedora
>>>>>>>>>>> discussion and
>>>>>>>>>>> your
>>>>>>>>>>> GPI
>>>>>>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>>>>>>> peripherals as
>>>>>>>>>>> the
>>>>>>>>>>> binding mentioned,
>>>>>>>>>>> devicetree/bindings/dma/qcom,gpi.yaml
>>>>>>>>>>
>>>>>>>>>> The devicetree without this fix seems to be still
>>>>>>>>>> incorrect,
>>>>>>>>>> because
>>>>>>>>>> with the device tree fix even if the GPI DMA driver
>>>>>>>>>> misbehaves
>>>>>>>>>> the
>>>>>>>>>> system won't be stuck (although it will iterate all
>>>>>>>>>> GPI
>>>>>>>>>> channels
>>>>>>>>>> and
>>>>>>>>>> then fail to function at all).
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Back to the start. You said some GPI interfaces aren't
>>>>>>>>> available
>>>>>>>>> to
>>>>>>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did
>>>>>>>>> a
>>>>>>>>> quick
>>>>>>>>> test,
>>>>>>>>> and spi6 consumed it, no stuck or reset. Could you give
>>>>>>>>> me
>>>>>>>>> a
>>>>>>>>> unavailable channel?
>>>>>>>>
>>>>>>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>>>>>>
>>>>>>>> It seems that 4 channels are tried on gpi_dma2 before
>>>>>>>> hang on
>>>>>>>> my
>>>>>>>> gaokun3, but as gaokun3 has no known serial access, it's
>>>>>>>> possible
>>>>>>>> that
>>>>>>>> 0b100000 or 0b1000 is problematic.
>>>>>>>>
>>>>>>>> (The reason gpi_dma2 is checked first is because it's the
>>>>>>>> GPI
>>>>>>>> DMA
>>>>>>>> controller with the smallest address)
>>>>>>>>
>>>>>>>> BTW I just took the values from Windows DSDT, which is
>>>>>>>> quite
>>>>>>>> conservative.
>>>>>>>
>>>>>>> So, with DMA_PRIVATE set, is this series made redundant?
>>>>>>
>>>>>> I assume technically the trustzone is still protecting some
>>>>>> channels,
>>>>>> although the system stuck issue is fixed.
>>>>>>
>>>>>> This series should still be relevant, although not so
>>>>>> emergent.
>>>>>
>>>>> So now we're down to the case of the TZ reserving some of the
>>>>> GPI
>>>>> channels (presumably for locked down/TZ-driven QUPs) crashing
>>>>> the
>>>>> device on access, is that right?
>>>>
>>>> i.e. now, is requesting these channels through (wrongfully)
>>>> enabling
>>>> the devices in DT the only remaining concern?
>>>
>>> Yes, I think so; although I think few devices will use GPI on these
>>> devices (usually only one or two SPI controllers according to the
>>> DSDTs).
>>
>> IIRC there's a configuration table that lets OEMs decide which ones
>> should fall under the secure umbrella (although most never seem to
>> change the defaults).
> 
> Ah then what's the default value?
> 
> Radxa Dragon Q8B seems to have GPII0-5 enabled for all GPI controllers

This matches what I can find in the default config

Konrad
