Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5DB2749ED
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773566; cv=none; b=MhnIK+/fb0hYzpieOGG3UmVeOXPLzC2V+z9ZQ9C16MZT0ueT4tg4bu8ST6PL6qeg5WUkie8LXpwn9GOmZ5elqylzNcr6iUXLe9Bhy1V8W9Ngwyg0AA0j/nzhwOsJfOIkVqA5ae55Cu/6jk6jtHaBO5RzflZkmmD8bvy8SP/Cj9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773566; c=relaxed/simple;
	bh=ipBwd1OaHjRf9KgZ0XZZ3TUbh2YaENN1SmkJ1hxii3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjSjCaZWgKsU4N8OnthC0bVNlA+Qst9OLLrW+Ia4zTBjIm4Cz6i3ZwvgkT8v4XP/anC6WrF51YZ+fVlNYvDuwTy26fRVb3lfSROQp9pXimoRChKpU5QnbGtzLcvWlvKY407RA6ESvodpyku2CHbbWTxbWVGxjZGBVGOB4tQaCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNk9O9QM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSnCmlk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNk9O9QM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSnCmlk1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DPPS3399733
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYnqEyIyY1rhAFPbk17ZE4kEfuWuI3hjE7hU9UGJs5E=; b=mNk9O9QM1tAUy1zc
	yp87MXc+IctIuJdL/hN9MfZI6nXdqBek75xzn6l7nHjZSpqf++EjdeWn5B9cw13m
	zQMdC9r4ViyEIZ64s622c4YTLlye58U2Y2x7dRGspWiI3LdGoCDELBGnff+9CcQ9
	0h5LaX4IpZeCWjSMUVN63j1FlAlKtk+bnsCeI1Bt662XATHXVXWfOu/kXvygpBc2
	xVfzo0Et+MZga6eUXie4r+Y1PBPhUB8mXYbj6Kjmv6TT89eIFqZNHT5/s4xK/beq
	6Y6TCT2VFAiFLTl3ZzFT2iNuxAshI+MLA837KFg1vJzONv4tyHSJu+vgvkk3k9a0
	TfAEmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk2nux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:06:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso21052885a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773563; x=1782378363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYnqEyIyY1rhAFPbk17ZE4kEfuWuI3hjE7hU9UGJs5E=;
        b=aSnCmlk15wpOx0SYkktbolavdHclvn83iecL5jbJ+H3i8X3uqsl5VxsyBCeOQpAaFt
         bP3jxB+XgiUnYNljmtzknuiFVkThVSpQ4+Uy/gneHEFY3js9y3j6ZSZd2H4upJ+/+JkZ
         YX8Mtl5N+l5BNF0Cjmyar7eAGfoF2mVpk5GbF6w/J7/YQV1o/XF0Hb/mewq6NkR1zibr
         iUcY5k5U4ivo2H1k+t1O+eu8JNEwENjQQuqNaUtm53WW1jw4ejtuBXLwyYz8jaOS7FH7
         r83PWUmrqDuwCLliPV4ZJObIOIEt5CR7Lv37Gbk+uUymdei8cKYdJ8u8qvzyUrtl28Bt
         1BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773563; x=1782378363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYnqEyIyY1rhAFPbk17ZE4kEfuWuI3hjE7hU9UGJs5E=;
        b=JWKMuAX7H82+IDcH6YvGcAhJxgAHo0vJDec9+sqgBY3181ZIwOXVjjfeMwbXvcR2Xw
         Y8HptnusB9OiACBX9j+MIz8Y59w3YBMAtp5e0yGJY83Jo6+If91l/6bh/+QCLjL4aFwJ
         q5sVGUG3WW9cGcz9FyqwWB8VS8Z/d+pzxrW2WPsdg48QbvUk+/eTdn1qN+YCHbaKiNPF
         Bphe8VvHqCYet9S1gEk559uK0/DyCLe22mQLsm77Csnmom+ipVLs19Jw0G6Tn/BB/An8
         esXAGgwsGSNE327aEjYZn0Q2RXRabPqKa5DZGnhtsfNZ7hhg94bEHXKj1zWtWVhGTiwt
         0InQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZgG3HMzFIj3jjGKCCyX7xr7DjePqRJbDEj/Ik9kSUMbu/1MApzOha2teVFGte9ti5x0raVGWC8lXp@vger.kernel.org
X-Gm-Message-State: AOJu0YyclgOrgoOsw8FtEkK9dKPrrs2CYc5kdUCJGU4TUe/U8pUei05b
	CTYGNKzLesSxAP7hXakxtQWQV8a69FF5C2qQV3pfMNweKI46LuAszlrL3aEIdcra4M4UwWeIpof
	rgHggQoy+NrzDGKzVvEeb/krFHD5oyxCaZEsXrAj1wxE8C8sW7ee+jNGBW6XR30B7
X-Gm-Gg: Acq92OFqZjfVcyAMc68RQ8Tyw3JVR9MjRvyQJ9FSJlTUCPukatlkz/s1M/2eugCaXVi
	wlOOu8PCHF1BqhF0mf/Z+WY8fDptlxqO6SPlVpUCyacnIDkRqUe2/qJfoQJUOY8LnRM1bxuzNer
	u9OffSpm0wi7JGSrji5rPsMO0sKYkpN1XUM71Xgd/iGkTnjy7uT2p4Cv3jmP/j1icGHV+XJtIcG
	1lTIcqnzzCVlppnzvSh/wkfKTSuIIpvi9J7eIr95Q4AkDQP2nlNf5ZEg5ymmAUfFWKgzU4ZG6n3
	Hkt5RWzHuuLsSe+HbSWii7/kk0+enI8y563OsCgkGe9pH+DLMEMTFUbwn27WV4bPLKSyp9znwLn
	6JJndqZgHAaCal6tqCvHgaIzyE2Fw9+Ls/t4=
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr269591385a.0.1781773563556;
        Thu, 18 Jun 2026 02:06:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:8d7:ed38:8189 with SMTP id af79cd13be357-91f24ff5a51mr269587885a.0.1781773563058;
        Thu, 18 Jun 2026 02:06:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b458sm7800528a12.5.2026.06.18.02.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:06:02 -0700 (PDT)
Message-ID: <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:05:59 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p4b48ZUlF26_TlO3jI-NTACYCDLeq2il
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33b4fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fGO4tVQLAAAA:8 a=33-RWtsPU-0aYSPvonEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: p4b48ZUlF26_TlO3jI-NTACYCDLeq2il
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfXw41Ps2rsK0v9
 Rc5HEMzG6CbEe5eU3gXB8j7oaEN6OYh/7TpVJ1FuD2twhFs4wn0C1eXL/GkI8N2Gux3FBftVDiw
 yo7LK7/wGN6Vr6vwcVLyCGfxff66mlc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX7OX1oRwmOFDm
 /nbG86R8I1NllaqCG7d+3I4keNPU+AdSekM19ciKIWB51/voeK56mV8xrBqj0cT+tlovEsWtldW
 xs38Q6s6Ij7TkHDUGXs3JThqIb8ioNSVkKJZaz0sChmkeUA5MLTSTkSqFWoU3AC7Z9N4MTXya1R
 Ylq+atHCsIe21JYLtpP1dMOgFd2yEGIRWCSVSrsXev3N6nfLNY3iYdP80wsTS5FMPTywsjIEV6x
 Asb3++mbkBryzNLIpdpCdWXW5HhxbjzSIvsmLa2c1ROOS14RF0otWzktIDHgSQ0qVAkiNHT5L6A
 JK+DaIBfwoe8fObnmI8WosnMOAT6xmvkEVWQX0akkqkI6dUbVc8C/1ZsqNi3XWr57Ri1ALmVICU
 wQYmHVTZI7lyBlv7rZiRtuWA9PSBmaIlZTTq1jY5V3o+KRXE7NGBAbzWwlhoTBBimjV49Sunwiq
 nxoAgtuREe4y0kgTo1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083

On 6/18/26 11:04 AM, Konrad Dybcio wrote:
> On 6/9/26 5:54 PM, Icenowy Zheng wrote:
>> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>>
>>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>>
>>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
>>>>>>>>>
>>>>>>>>> The magnetic keyboard (USB HID) can't be connected
>>>>>>>>> somehow,
>>>>>>>>> others
>>>>>>>>> are
>>>>>>>>> fine, such as the spi touchscreen (not upstream yet),
>>>>>>>>> which
>>>>>>>>> utilizes
>>>>>>>>> DMA definitely. My config is here
>>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>>
>>>>>>>> Is this a defconfig?
>>>>>>>>
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected
>>>>>>>> too
>>>>>>>> for
>>>>>>>> exhibiting the problem (because there should be "public"
>>>>>>>> GPI
>>>>>>>> DMA
>>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>>
>>>>>>>
>>>>>>> Is this still necessary? I checked the fedora discussion and
>>>>>>> your
>>>>>>> GPI
>>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>>> peripherals as
>>>>>>> the
>>>>>>> binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml
>>>>>>
>>>>>> The devicetree without this fix seems to be still incorrect,
>>>>>> because
>>>>>> with the device tree fix even if the GPI DMA driver misbehaves
>>>>>> the
>>>>>> system won't be stuck (although it will iterate all GPI
>>>>>> channels
>>>>>> and
>>>>>> then fail to function at all).
>>>>>>
>>>>>
>>>>> Back to the start. You said some GPI interfaces aren't available
>>>>> to
>>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did a quick
>>>>> test,
>>>>> and spi6 consumed it, no stuck or reset. Could you give me a
>>>>> unavailable channel?
>>>>
>>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>>
>>>> It seems that 4 channels are tried on gpi_dma2 before hang on my
>>>> gaokun3, but as gaokun3 has no known serial access, it's possible
>>>> that
>>>> 0b100000 or 0b1000 is problematic.
>>>>
>>>> (The reason gpi_dma2 is checked first is because it's the GPI DMA
>>>> controller with the smallest address)
>>>>
>>>> BTW I just took the values from Windows DSDT, which is quite
>>>> conservative.
>>>
>>> So, with DMA_PRIVATE set, is this series made redundant?
>>
>> I assume technically the trustzone is still protecting some channels,
>> although the system stuck issue is fixed.
>>
>> This series should still be relevant, although not so emergent.
> 
> So now we're down to the case of the TZ reserving some of the GPI
> channels (presumably for locked down/TZ-driven QUPs) crashing the
> device on access, is that right?

i.e. now, is requesting these channels through (wrongfully) enabling
the devices in DT the only remaining concern?

Konrad
