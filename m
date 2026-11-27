Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789299;
	b=IdWubozH0vaOzkLj8yi+1i6Vh4PYSvTdHXTHRespqd1tJQpYFV8TyJxV8zj/EOtMk/6G
	 WuloXqFdfhFRs4k28IQdeTC0pI+p5mVQ1gYW1j5xbaMa9hbo+P3MPNLdzBIXR8y7Fp1OJ
	 GgYji62hdmYs8HO2/DMXoQUfazVk8VXdDDiNuyh3G/ruJTTdvaOeo8Tz4aQnXfxwmRZOj
	 c9N1v2/6Y+qLUdFzOb9iQETCND7hr+3gd6pN0tlvnCCcPDe21wdMjT1aCoi52X4ehCNec
	 OMc9dMf+DDCzWnvqybJho1KR9+KPC4gHvTLg/eeMQ75JdNPmm7MZFH5k/0qccAQ+I6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
	b=toLPWvj2gP1616LXSSvur2rnj4/tAwALhDJiNqhZfhzHOvdzSnLVsH9F/Fz5Y5XNDDCe
	 eYDSS51+vjDND3LHSoZyS5PwKvIwmVjIcYUkUcwTZxWITzX489Iuqme2JkWZ2t7hGf5ir
	 27ZyQR74+3lEEjDhke1fSFaT479AvVnuX3OmP2MnxmZP3xVeg2Xx6gvRqvKwm7E7NHnKQ
	 kmOui83J7Dv8bo0+dDoQP5zV7kvIOhq2JfkxIJ/DbLCSTLNcSILWpeBUt0ubu20WyKekr
	 2e/iX+0q0X+9JhOzd14914WPSBppYngR6uMnd+Jq6ogFiR3SuwAtXK/9TqDN+pcERGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6kqByXm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFdgliJg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B16606A332
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B16606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6kqByXm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFdgliJg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1YSH1971366
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=; b=X6kqByXmxnmpb0Iu
	Q709ps0DBL+BlYlm+fYSmtBH867c/HQp8jSSzm1FnHZK+niMlNQcs83OsDH3KV6m
	Yj/19MSAgQCLZetRAFkoIS4Z2kEqnt8Mzvi4oVmSDaDtu/PoC0KojEGpKl3L64Xk
	XtvLc9zvOBHwyY3Vz6vpdScY+U1aHbh0k5X+DsIVopHmjEFOBE5Hta56MVT/EWMM
	QYrCx4q0LPLIfXIY9/wMwAy+LgmrHGKOXKdF/NYzm2b9KLtmsPKqUr8m64tuX/u/
	4YtTQGA+HklT/P4mDxyezWuGMbooITyqAmiaMapKIDrvqQAkJVQDXzDaHZi42o4z
	8LnVeA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ub91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:21:37 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4b74253ea47so1226395fac.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789296; x=1796394096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
        b=KFdgliJg6BZ7jxEg336DDHNG+nl5Dyax/a+3nUDLmNbRL4j1XBoCq/3zGFP7UIFqk8
         SjhSGkqsrYqCq9JAiZAF79QzuyVt5JvZLdYgcA37F++6z2BnQw5NRT1IOdjUNERmBPhW
         Gws1O+ZIG7DrHQarOo7BTjl3TNGPzxCUtyG9H7qdLdNv+xyhNG5M0gpsa4LvAc8U1JdC
         7XVumd7lQZEh3h+oWej5JC4OaOeB8HOLVQ9zulttZtRg2amvYqbI/2GljNRxAd7edG3s
         gNG9qE00+3aCTJBX6ZzlrHSYXUWJL31EceWKjiuNUWdfleabA3uqXMHTm+s7IXahG3Mk
         9gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789296; x=1796394096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hheRwFD407BGXCo4pbyWm1UajgkkTJck4QroOzyMn8=;
        b=M5YFt7nosXrOQrjN6uxgSAZRphgnncQGgDWONsuKcke/AD7vio6KhM/b57aSrsOXRp
         +NITUwFySxxspngSdbZ1P9a4o6gxB87GB//vo/A/FXkGCr81UQ9Ur8mDLba95u8G8AjU
         8FpImdItqeXKac0zNfcMKA0lKJ0hyn14vbe4z3bdHRPoDsCOH4rzh9lN22d1CfGr1By0
         o82EK3goC5KvKmePkVOlCfDENVo+O+WlBWlDPs83tj+LskAk1H3vDj6Al5PjcoL0aPH7
         GG9byhRe4SCMWEOSfAI8kOeC0a/7HzXMz3fj91SPkSt+PyETQS8W77xqvBiBJEk0rmdX
         sZXQ==
X-Forwarded-Encrypted: i=1; AL+hErFuwYMb4H7VG522dLG/1HXBOnfPJtjrCxKMgE+mjwZV4IgGFrhCXdG/sbEexmbgZn3ykV9GYhz+6Zas@vger.kernel.org
X-Gm-Message-State: APuU4Z8JqJ3c8A52l9l5lqZ4nl77LXPx+QO/b/0aZxJnpG5hhhufXJhB
	3hJ7oOjFEPO+CD0vDIVx8tpmEDp4up6cNj9HKe+FSOEdG3Rx+ufkJN/3Qgt9xAYayp/Y07uw0fe
	hd7i6EP4EFdKqXHL+0NgTjYZa0XkhBZ7C5fG0rEez4bK4Ye7pZeLcP3aIB7z0y+Fg
X-Gm-Gg: AZFdTZdfwLHihh3zlXvPsBPNGSYiM37ktzL+d78WTVvwxdj5AavideYHvZ/Bv7PJ4/2
	CL1lplIkNN2wt6DZV08R4MszA7CYATs5Yvd6zTULtyIMoJvSAbZ7GL0I2zCW3zMOSovJQjPk1Z2
	7kiyFgK1GYt2Kbo6GZgd+/YyjGCRmkGixXinmyqRLHZzhQweQ/btgyU2bwn1HDAlgamiUu5MnR1
	ws4Fw4/dsE8A8l3LKzErtYwzc9Twtq27RsTvfyPxT/dbDfQR7727O1LXBur7dEestP0Xp7VqwCn
	lk5vBVCFbtR6K2wW7eJE8/ICQbHTbiUtcHhQ+3qHCl7Zguvu44mXiEc3XDczOFDP75oXrgDZic8
	Ao+tkQV/IhFy2z5ugQlC1Yl4wHgRLodp4SgHAOpo8dS51g4Sz/P5gWwbO7HAk2rRPLLm4oRg=
X-Received: by 2002:a05:6820:a513:20b0:71a:ef18:ef3 with SMTP id 006d021491bc7-71b390332d9mr21903014eaf.0.1795789296395;
        Fri, 27 Nov 2026 06:21:36 -0800 (PST)
X-Received: by 2002:a05:6820:a513:20b0:71a:ef18:ef3 with SMTP id 006d021491bc7-71b390332d9mr21902959eaf.0.1795789295841;
        Fri, 27 Nov 2026 06:21:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm11114209a12.9.2026.11.27.06.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:21:35 -0800 (PST)
Message-ID: <8771620c-3ef4-4d8e-8c7b-cfc7681753c4@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:21:33 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: sophon@radxa.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
 <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
 <A31EF798FBEB36C7+17454013-501a-429a-8918-1087baefd339@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <A31EF798FBEB36C7+17454013-501a-429a-8918-1087baefd339@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0DbdN/A5Xyb7
 t72lfYyxcMyl6OT/whtMoPtFDrcOvksdiFS9Rohm9+2G+L7q1sjhZcW2VSfslSX9EdEyEQwCNGV
 vYAGe/eC6LX9rVXyHfpVHmrrikQNYxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzwePPdB7u6ZO
 WANt/tJa+AxjDX2sOEaCNNAnzB4y7Kqo4EbEIEhcJSX0nhy9YaFdhrdXC/IRfKKzc+N8e4wrrdi
 tXckOKoXDetXhvW8dLyU/XMDlqJs5zfHVXyKbh3/Emg5WRDfCPrgUabehfY37A0W+4aNCA5mxpP
 iMLiWVFsivRHW/NYSPM7CqCQFzvz8zLf4Wvm1GCFaYrotMj99xTTpZGx7Z7ChSYbBHtBz23/jyS
 uMr2K2lMB3ftmQpv+cs5F4Tg0TTYVEliUYeQfKC2YqTH/oT++18LD+1XhF4iKo9+xT7G+UkAR8M
 u4jQmSI6gobUtWTJr4F4DpEpz3rS+5Sa5U6luSivxNTlloJSKFV+ciIpskjUVDs5lwpps8MRZg/
 VqJvb5gfypR9+FkQy3Vbf3fN2dWbF7GC15rRNz9IEWZuTkVCnUjpkdXjv8XiBLs2ndekqlQMSyv
 NjZMFl90r9DtcohJdqQ==
X-Proofpoint-ORIG-GUID: APkqB3FmKQcsDt5GCXh9zuNRcJW_QDKh
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0991f1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=ci648DB7tXjaz-gxRrQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: APkqB3FmKQcsDt5GCXh9zuNRcJW_QDKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/27/26 9:31 AM, Xilin Wu wrote:
> On 10/30/2026 8:54 PM, Konrad Dybcio wrote:
>> On 10/29/26 5:14 PM, Xilin Wu wrote:
>>> The Iris VPU on SC8280XP can issue memory transactions using stream ID
>>> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
>>> transactions are not attached to the Iris IOMMU domain and can trigger a
>>> non-secure SMMU global fault during video decode.
>>>
>>> This was observed while decoding H.264, where the faulting address fell
>>> inside a DPB buffer mapped for the Iris device.
>>>
>>> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
>>> the SMMU.
>>>
>>> Note that the issue was observed using Gen2 HFI firmware.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>
>> Any chance you're running into this?
>>
>> https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
>>
>> Konrad
> 
> Sorry for the late reply. But I don't think so. That series is about context faults on the non-pixel stream when an IOVA lands below 0x25800000. What I see is an unidentified stream fault for SID 0x2a07, at an IOVA well above that boundary. This is from the TZ log, captured with a minidump:
> 
>   SMMU:>> 0x15000000 NonSec Global Fault: NSGFSR=0x80000002, NSGFAR0=0xcfc03000, NSGFSYNR0=0x2, NSGFSYNR1=0x2a072a07, NSCR0=0x280406
>   Fatal Error type: TZBSP_ERR_FATAL_SMMU_FAULT
> 
> 0x2a07 is the VPU's non-secure pixel stream, the counterpart of 0x1947 on SM8550. The Gen1 firmware sends all non-secure traffic through 0x2a00, but the Gen2 firmware puts pixel traffic on 0x2a07. No SMR covers that stream today, so TZ resets the SoC.

0x2a00 is the video non-protected stream
0x2a07 is the video non-protected pixel stream

I believe the subnodes patch will solve your issue too (and also
guard against the iova limitations)

Konrad
