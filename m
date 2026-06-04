Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D463D6CB1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555150; cv=none; b=F+0ABZtlW+KGNWthexhRcI0nI3x/LLNbUPpsln5rltMYpo2PptvVafBgl3oQPW0WmoEtExX+V84VtfIC/coMvC20zdLuvXGQUCR0YpZmruvUHvmLo4m6d+Owf61snjZmqrlsSJ5Hw63pzSRBQbVO0PLgoSY6EU4qEdOCIwLgTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555150; c=relaxed/simple;
	bh=RaeoiWH7Uun9nxt2b6Nvp78PFkfwJ25ykblxc3Xp0J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FRrsGDWCgoB1dMGOSZoyvBtIzfxavfQhFu1J4Xb1f3y+IffUiYMCQ+0sG5FQ3t1mszgiYcuy1GBTiS/WsEHHSqQ5zGf6JHp2IwvC0wFYxeQlyFuxjzOya9qP0kr3evbXiUzw5v1WziQ4BbFm10tj+cVXdVpPqRmBNIXKZ909W7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdVTgoO2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEuNBgVt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdVTgoO2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEuNBgVt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543b0Vp3233931
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=; b=NdVTgoO2lQY9HAMW
	bceRRxyiVHKXuuIpdj+fyBb/fnbGH7EvL5p+tnTo4lQHcZlTS54Ihr8vAUQ1+uRf
	8gadpLf/GyGxNspTt8KzGglUCBBigBC7go+asz3V1L6n/dP3WjDkqvvRBASbaCmr
	nHO2ycIC00kzwQiTz1BRxsi83g9hfOJxm4F9MjWXgRgXjnQ4S67Cj+LImSj6O0Pp
	Xf0Fcdf8DXS/+CAoVkp0L7abxxxX6/BQc4fE5maquWwqQwkdEWslKutDWsM3a95w
	WyCNiMd0i2jCInd4NdBex/55UpoIhBoIefAvtyREsNSjMauUpBvwi9PyYGE3ATMl
	Z5/mrw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s2bsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:39:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5175bb9d47fso8073591cf.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555147; x=1781159947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=;
        b=GEuNBgVtA7wyV7QbfGBAWNjW/WLHcsp2GYgkIaXqokz3MNRGbsUpI+Gg1ZGhvvzmnU
         LwRlrL32nsdcybd8PNOHwUWWiP6IIrfUN9SMYZf7wfjPU/vVU1RDBq5lEcwYUmsrOIG9
         79LY+4PtM06Jh2Z2SBX/UStDSL8QGhWQwVfbeA7YNoZiVcJQ4ERp2DqGpmfB44MFWmA3
         17a95IqBtV8yHfz7mAzJm7QDNL/CaGpYdfaQgj+HYZkegySKkKrvOm0DGv5m2Or4NrgX
         Cxxd+LCdpjeis3mQjT5Esjl+drMu5x2eJsVFN+KzIjcW3iH1LhIhfbfgugXwo1NK+zbC
         wPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555147; x=1781159947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vjgpy0mZThcuqyr29c0w8qcQHkkM1zFN58HHnPnYdxc=;
        b=aXFPV1kHR42c2eol8Y9hMVwRKcKZZeSvPKAoj3/I7EJK1y0uvlIldvEtgsNLmH9HQO
         JPsr9vV4IOOz4zkPkr4/IGdZF57YzfdFnuDznevdXWSWwVy+NwnhOqGwh5yhO4n1Yo+O
         I1mIOVxduoVyck8Ax6ckx5sfZq4wtgE37ahlwnaYbzioBi1nz1lrJr8SFieIkyxqpzph
         0eWCs2OfMa7Nh+Rq4bb8qCCIS9DDCHPL+BBa2hi/yG253WyBwOYN55QgGtulIcc917RY
         m5rXJ2jxRmiU92oWPZT1NlOXEQ7mAGvxGUmWtdEWWBVQ3r0pxGJez+3mHZ1srToYf0jo
         bErg==
X-Forwarded-Encrypted: i=1; AFNElJ9xyFIzY8i3wPQ3EhTxR+CB/gvfAWNQ4SJ91DjPdZkPHvtjTH0lYSAI2Vh5vWeR6m+ZChFtAsgUULIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZTHCn+QHV69LFjj04Lv59CxLPGz0eeGg4zSFh0YlufzKE6pY
	t/cdEVseXhyXROO9/DiuPLnQqFIBkjl9IXjj/en1G+8RnI0eV5lC3hZv7LHVdvpYuwFlQG56pkn
	FY390U947sE+tKSvbmwOwvMXfr/JyQUFDu5moYDbsi9iUe6/XJp8z4jwvvbmw8HaU
X-Gm-Gg: Acq92OFFII4h789BeOeE6YFUaHOd0JG8jDq0NNGej3jz7gyr0XFE3siQobSQBry5bBC
	79f75+6/G5QI4/wrkkoYR84Q5E9Fs8D9WK5Sav9YOWA2N4ZLvO0/sfP+Z1qhLS3NK4e5SQok7Eo
	GeM+XfvR+REkAFIsVKgQ92CNr/RuK7+Y7N1rZLGmCX9UJrEGefxhPoEhg8qb1saSEKxyjE1AQd5
	ZwA597EgQ2535+z/nWxoRrNtScvNyufCcI2TI0El+LL9/FTHhsVCjh82qStaliVOLt8JeA3BYD3
	BlOrUEcXy2aqwKFT6X6tXt+ZYScwufnSLQ9o28Qtw6CmB5JqbshNEBj8+Oq+XL3ARrQpGrrPh4o
	ijJD/KIM6kzg6KHdeBPhP6hvgkm4onCh4Iz1cZajK8UV7hmeu4Dt7zRhx4vG1BReIJ04=
X-Received: by 2002:ac8:588a:0:b0:517:5afc:ff92 with SMTP id d75a77b69052e-51778748c75mr95741441cf.58.1780555146960;
        Wed, 03 Jun 2026 23:39:06 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:517:5afc:ff92 with SMTP id d75a77b69052e-51778748c75mr95741251cf.58.1780555146520;
        Wed, 03 Jun 2026 23:39:06 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.249.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f97sm273228266b.60.2026.06.03.23.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:39:05 -0700 (PDT)
Message-ID: <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 12:08:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Daniel J Blueman <daniel@quora.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Ppunog8PIBL6vnGkQZXX3G9mIzpvWpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2MiBTYWx0ZWRfX9OUnMSGgndRC
 KZ190o3YPJoO27sRarGHV52+fgYXaTa+f3VisvCRN6vQiBbpgiUV9aqvHcvwZZ20OHX3hzHj8Q1
 xrDAZRlzn/ShdFB0Sut6GHi+zK+oqmw//150oKiMSa9zT1UYXJy0z1M1B7h8EZwAMbeEjdhwpq8
 6GGmZMGYXBut0yBDAStZsUWFdEY9ioYwVG8Fkr49xUFpR3B4oyDXmTNn5Ut65vrDJWOFVu2ch9Q
 SLgOWwQtyrt9ThvqaOHQmL6BmW7y5hhq4zmAF5N8a8iRd0Kkpg5Sbow6aPE2QW/IBGRL3RAExe3
 luoakl0forW77MxvwKOCD2Y/JNxNSl37qWwbmR5HqNABtngUVSaYkVNAbdVWzP4CPz7BlRm3ht9
 DPVr4iUtsLhQ0TqvMHppzUv1yCgnyPkwsykSahi3nU5nu1oBfEzYHDNqGU+NVHUnmDGqLcGpKjD
 /TCZY5iQz0O84Cplunw==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a211d8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=QLLTW4K7kuvKcNWOCmVsWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=BHWUBWSSduhnyAuw9wkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0Ppunog8PIBL6vnGkQZXX3G9mIzpvWpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040062



On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 01/06/2026 05:13, Daniel J Blueman wrote:
>>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
>>> triggers unhandled SMMU page faults
>>
>> How do we know that is a correct address - does it come from qcom
>> documentation or trial and error ?
> 
> @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> source for the different stream-ID <600MB behaviour, and share
> specifics, eg if silicon, firmware, or driver and constraint, defect
> or otherwise, so I can include a definitive description.
> 
> Also good to know if my workaround is good for long-term, or on the
> other hand handling streams <600MB is important/useful.
> 

Thanks Daniel for raising this patch. Did you also try the memory fix i 
mentioned in the bug [1] discussion ?

Coming to 600MB, this have been the VPU hardware restriction all the 
while since venus days, and since address could not go deeper all the 
way lower than 600MB, the issue never popped up earlier.

Consider the memory layout split as below (Iris device range is capped 
to 0xe0000000)

|-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|

0-600MB range, VPU hardware would reserve this to generate different 
stream-IDs primarily for internal (non-pixel) buffers.

0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
601 - 0xe0000000 --> VPU would generate non-secure stream ID for 
non-pixel buffers.

When many concurrent sessions were tried, non-pixel buffers were mapped 
into 0-600MB range, and VPU generated secure ID for those. Since those 
were not associated with the iommus configured for iris node, it led to 
USF (un-identified stream fault) and device would crash.

Keeping the region reserved, makes the non-pixel buffer always in the 
non secure range (601-..) and avoids the crash.

Downside of this design - It would eventually reserve 0-600MB un-map 
'able for all buffer types, like pixel as well which do not have any 
such restriction.

Forward looking design - create devices dynamically and set reserve 
regions for those specific device using the api [1], instead of applying 
one reserve for all.

[1] 
https://lore.kernel.org/all/20260119054936.3350128-1-busanna.reddy@oss.qualcomm.com/ 


> Thanks,
>    Dan
> 
> [1] https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> 
> --
> Daniel J Blueman

