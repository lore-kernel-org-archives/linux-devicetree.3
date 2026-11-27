Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768307;
	b=unGAgZAoLBPF9ZKqvMZu3kfoZ0M5RqwahauQH21SVgak6LGFovAzVJX8FsuOVYC3Da9r
	 yiwT0F0vCZKAqPJbO82/ClveVQb4x99NJl8UqQp1pzRT4SpGgPODgA4UUPCmQSPw0bYja
	 EC8DQ61zORuEAc7f4mF32sBhFYr58ajAr2cZrG3yse+KKaRgOkect9VnrCz7+G+h/nbAO
	 1HSnACO3SQsihaG/8CF9ftsj5nH9jde9UyZWInxMvnDWHVMGZTwynjXIJlNWWgUWBk14Q
	 Eb5vq6HQJsF5/TgiJsQxSuRrcKRm+y++qiynqI+bYX8p4VUK+DpfaQ5r+G+4HyfnsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768307;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=T3JRsePsI5O9c5ehwpEKTpRAID64ByI4bpnYu60TJTI=;
	b=3e7BJOpkz/Nm0pYXFtqZna2vWztmY9xjuVwmGbUfg+JTiTiTTHMiHG+bEOzCyi4+ZOs2
	 5RWHJiAFHOiI2OYGD27oWdxb6ziePZdchVrA7NMCt9UDf8tJbWQDOcr5JZMgfthF3MduL
	 OZF5quLDtfyM7rDhN8EpScRTNf+X+NF9Dl8HVQ61QbOCwywf5Y0de+s2kVN37lv6L/mZz
	 nQ9Bt48zYNQIk/QpUsCYPy5LRAYgZptIcXZDWyBPTn9ajMjMrqeqTtOhCIP3HfcDumw1n
	 K47Atz6rzfSmZ9KzuS7asK1lTwM9s2okR8ltE68R8jK1XjalPFPoMQafWxbt5US0/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89977606A31C;
	Fri, 27 Nov 2026 08:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89977606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1795768272t4b518488
X-QQ-Originating-IP: XjVtevCzh7+3jY/n6XA24JOwPh0WvZ8QMdFxg0M7Ets=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 16:31:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2578010382317610991
EX-QQ-RecipientCnt: 11
Message-ID: <A31EF798FBEB36C7+17454013-501a-429a-8918-1087baefd339@radxa.com>
Date: Fri, 27 Nov 2026 16:31:09 +0800
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
Reply-To: sophon@radxa.com
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
 <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
From: Xilin Wu <sophon@radxa.com>
Organization: Radxa Computer (Shenzhen) Co., Ltd
In-Reply-To: <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MWdgP8+gtiFRmzvIErMxHEabx7xJLhK9hv6GUlpJw+f2avNaqYm6oHtL
	58gKDrE5AXuKoAroX5pLpataOy8bH4RnqD7ukBZWS5+f/r54L9uC1uSqC02Mq2yQATV08Uu
	XLeY56KKIaMuhXx6JkO5CJ/0YVr2Xtawy/lYpg5hMr1P6Jr+v+t8TkIHH2zs1vhs0pMIIpZ
	A9kOv3HJ44HQ6zdNZxn+Zksm/DrQUcJiFSiX4QE38v2ngZtuw8nrM755yXWB+YojDc2jmvd
	82NKym4XJgZSot5+NRR2ughoU+cwtjCn4zPHlAkR75urWYzvSyPanxLfoQj98J4jSYcI6Ye
	HrKklbQPe6TcDzCIx1D95NRyhXTnzR2pZe0L7CiXngH+OTET27uD6AN5mW8HZsvdpk3FIUN
	Yn0We14DYitZI6fe1KDEJ9tAtrgVDOdfLJpKdmtQQybUBKmDyUVVVre+sE8+HvDSndG4Sfb
	lMKcWrZUGcb/fGlWm5ru0H6B6BvMY8d5mIcQ23kcK90AySyLir7MzgTWj9AAjt5dDP5qIZT
	r2gnV92BtHgA4nSo4kgJAQ8wvQ53fWDOQ4hIqAahIhla2A/i31XC66ribJF1vYyCYTdxz7+
	kAOBQ88vIot3yHX2hoGt5gPRwaBGSVbya21wgDq3rugSi9ZEqdF4ar8Rz9/d8lF21/q37ue
	azY+z9DBOIMYLnD/GLVtBMWthCOQvw/w10Cw8E7lUJZr0DuES1f43WhU0mB/4JbjEIciAXU
	Fmq9CyRPEM08b7NZ/9xq+T3SnUdkek5Z7evHDxm1tG6WCdOZkk75SGgw35vk5JOrYeM1epb
	KVET/dBjuHjU13KN2fSNNKLgcAgTgkGnqTi9G5kbTyWzVUBGdUePJaUkAfxxt60BCzXcX27
	P7aoV6kUu+JnEes4iPhYGRN+pKswmLFzvWR968tZ69wGIuNqejgoX37wLmINsmyxmwhcagz
	GQCuwYI72C2+5zFsoF5Xirqf+IpqoaUazIST/ABD7O3Ym+zxwPuMWo4ZdV3wMbX9qG80KX2
	RWnOczyn7SL0unhKgIndOQ/iNAVF7IwFJksdYYymDAPMsCoEy1ueExCXb7CAF5s6Dm/k89m
	A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 10/30/2026 8:54 PM, Konrad Dybcio wrote:
> On 10/29/26 5:14 PM, Xilin Wu wrote:
>> The Iris VPU on SC8280XP can issue memory transactions using stream ID
>> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
>> transactions are not attached to the Iris IOMMU domain and can trigger a
>> non-secure SMMU global fault during video decode.
>>
>> This was observed while decoding H.264, where the faulting address fell
>> inside a DPB buffer mapped for the Iris device.
>>
>> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
>> the SMMU.
>>
>> Note that the issue was observed using Gen2 HFI firmware.
>>
>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>> ---
> 
> Any chance you're running into this?
> 
> https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/
> 
> Konrad

Sorry for the late reply. But I don't think so. That series is about 
context faults on the non-pixel stream when an IOVA lands below 
0x25800000. What I see is an unidentified stream fault for SID 0x2a07, 
at an IOVA well above that boundary. This is from the TZ log, captured 
with a minidump:

   SMMU:>> 0x15000000 NonSec Global Fault: NSGFSR=0x80000002, 
NSGFAR0=0xcfc03000, NSGFSYNR0=0x2, NSGFSYNR1=0x2a072a07, NSCR0=0x280406
   Fatal Error type: TZBSP_ERR_FATAL_SMMU_FAULT

0x2a07 is the VPU's non-secure pixel stream, the counterpart of 0x1947 
on SM8550. The Gen1 firmware sends all non-secure traffic through 
0x2a00, but the Gen2 firmware puts pixel traffic on 0x2a07. No SMR 
covers that stream today, so TZ resets the SoC.

I'll send a v2 with a clearer commit message. When SC8280XP moves to the 
context bank subnodes, 0x2a07 would go into the pixel node.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>
