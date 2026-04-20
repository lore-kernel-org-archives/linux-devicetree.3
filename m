Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320A3822A8
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776672364; cv=none; b=fDBw5b2eunqKmSIZY0FJpUTO9Mr1PAzqJVZJ4ha3dP7CJW4PUZi31BxLzfmhL0YFHtygDX/rbHGDMeu3+xv0w34+PGaBstXoFbuX7LRXeMk/dsB11tUsVa9vXnFyjsUlJI9342TOEYyW7MErD6K0yOtZLwIBognpsnMYfxAvo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776672364; c=relaxed/simple;
	bh=txWTYpu9LvB1Jo9JfaqRGAVwewz/x0Y+VLCDe+rsCe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC0RXSSpQBCnO/0McwlQoYpFnQLinylPJamY6nrhzPcObEN+CJifNck9rptTOC1jT3j8IzI3oUtZ//C6wu8wMH64WicvUtat9VKWa8Iz4M/uu2cyFbMkKnSQMT2crRDIkRp2Pq/4lV6Xx2MI5v61UGXjmHSYo6Bm2Snfe+bq3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJl5C4ai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AqRvqqwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJl5C4ai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AqRvqqwR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K77Gbw1489887
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYwCDlWBymVYKNSYIRfmXGr0gWM+WgtL1s/ILUpH/N4=; b=JJl5C4aiTxDhs92P
	xc0ixS99JxFRq1BpnUX55w31AIoquqnrVoez/PkWgQQFc4Ed2zxIkjUI4LhAHglC
	Cp7H+0kCuYnTtijrLj0y/fF+gFamrWJ36nfcZ5x+iY81zMXJ64eJFpKXNYvvxgPT
	Jc7resEqRpoeXJZ7NjmXd3qOVf9jEDcW6prbfgfQ30nRM79QE/fc99LvnYPNN+Sq
	28gqhzEFP5nuJ6JHioyreKcQ/+7WkxGyc1r7I8d2oIdLH+at8AmRERSXaohOX/kL
	dWroS4svQONCI2iR1Y/aYlGbgIKRQ3yneKvHgvQjZrnB7rUCFlQmOOEkoUOdpUSE
	Z84tOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b74uue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:06:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b465bf993cso28328485ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776672360; x=1777277160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYwCDlWBymVYKNSYIRfmXGr0gWM+WgtL1s/ILUpH/N4=;
        b=AqRvqqwRM/CLuQ2riXZul0MFU+l4BLcLdCAf31x3jq7zK8kkjhjpVafih6CWWSQc7/
         JG8SOyL2Kw9BdnmLjS4QGHBV5ijF9O9xo1PMgIrNT6xy3hSo3AxcjRJLecYjYm0sYj6D
         QDsmNPzDS/taHYTJk0aWQYSPJ3uk9jKOV6mz8USSoR5BSaNcxYAH4WlhYYzKdC4+0kpi
         nEPeB8MZUzmOmz6bvfJoyA1ck5yX5asDkdQ9+IRo88dnCzUjXcKS1KRkNVTr/OHevHrv
         IDfP/BTmjWzY+eCvrjMsTQbtGqXgGqZDONpMpI3L+r9Oremq55lLk/4D6OggSJdFx09d
         yxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776672360; x=1777277160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYwCDlWBymVYKNSYIRfmXGr0gWM+WgtL1s/ILUpH/N4=;
        b=jQatbN+jT9DHN75J+Bt5XGOKU/i76BoUtOzBQDyij9HlhK11Ipz2qB23w9pBhcvBdd
         yKbBSJMQC6JfA8x/OyYxoQqpzLtacAUaXDOK5/3jxS9+xjgWL56zCD3X9jLqSZqvEea+
         Vo5WAxc6Tm/RS8cThPCBSNy+4tQxHle8XIqCnUVXMjYnS4bj4nx7Zk4SWEvBtbMRcn21
         rphX2RVx3SDInx609d4eEgqtfR39fbQPIDFXWuUum6o7198qXHhSI0G50ofyFeM9tWiC
         S9QOR/YXTpN7lwTMIaUYcuN+d9F8WvqCt+5hgpJN5FAzSENnjW0Kn1eivRKclCAJXctU
         nSsA==
X-Forwarded-Encrypted: i=1; AFNElJ/GPCSWJbAKR4nUELS9C/n0KSQ+wKTZCw9m7UyiFhcfWUAuUvre1DMUNqCpNviCmlFJDRIO39TI9TpJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYc0+UDyOY99RS/zzNy98MYll/+Cfg0eXLuhXlO7OLvM6jI9W4
	JaE5niuwYahoNOd8Kj+xt17KMtzpaQyv4SvPXhB66A4WNN/1VXfL2h4/epY9vaw4Wwv2NWnDxMC
	G9nPpC4A+dPEQFsHLSQBDWNVBOOJwKZP7j2tZSH9XHzuDm4ZkInTn0lF9ODmkpjsK
X-Gm-Gg: AeBDiesz8r0KLyI2CeepaAPhDASNAhoigk8cpfO6vErKUjE7rrnL7/Rh13A+fEn16o8
	egdw2hnrt0Gwnuc/nyKPFb86vflex4ovMau2qaRcXdEG/S6XIxkFaUQLckC4wBAmu05yMOcsCE9
	4mlAFmbAp/HyLXlEc6xooLOfTtVYt9jWJwVDo7WWeCVNNFjxUEdaboEgeRz31QhbOol9TBfQxhg
	k2FJObfz3v6W3WxEwkzBLf6h6o86WkeJ1oXiK1qfxsvEd28hG/7iQ6Ors7X/g+SJx0D9COH9qEJ
	wBmyfSnzpFT9XqGZ3HyYqd7LxLSuN8URDFWzBg6PmqcAgux/G0QfPkT1B3fKLdPrelKWbcKOkWv
	x/3iHGSrlHxe+dzCkB7gvG6xXM8Z7s2tQVH4fdwGEy8s9TnCDSefYTSdKlOkiRg==
X-Received: by 2002:a17:902:7c0f:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b5f9eb2b36mr93181255ad.13.1776672359731;
        Mon, 20 Apr 2026 01:05:59 -0700 (PDT)
X-Received: by 2002:a17:902:7c0f:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b5f9eb2b36mr93180915ad.13.1776672359159;
        Mon, 20 Apr 2026 01:05:59 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4bf7bsm94671725ad.81.2026.04.20.01.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:05:58 -0700 (PDT)
Message-ID: <840133b0-6e6e-4fec-bb00-822bcf43b351@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 13:35:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: johannes.goede@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Udit Tiwari <udit.tiwar@oss.qualcomm.com>
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
 <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
 <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
 <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
 <0d5bf2bd-b90c-4814-bd2e-126a9bcb82ce@oss.qualcomm.com>
 <cf8ba27f-2c9e-4c13-8c28-4e1e22e22479@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <cf8ba27f-2c9e-4c13-8c28-4e1e22e22479@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5de68 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8 a=EUspDBNiAAAA:8 a=WqXSJLEMAAAA:8
 a=9QHSPmZLdci2C_p0ZdMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=CFiPc5v16LZhaT-MVE1c:22 a=XN9CkKUvUZsNBwEnh_OE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NyBTYWx0ZWRfX72hjqgjHRDE5
 NyhjMftGOe8MVGW9tdNmY860DraHXUcww6WVf3Y2hwUYg7pQhVFSsru4L4MxsLA0Ic8jUxoqjmP
 aLKShXoJk+57KeIOub8hR9X+Uwi7pkmBs1Ik9VBCu1Phk0THzLezoLdMdMpFFJllWoeAsJDoFqb
 W3c+4Ney4e03hx+exQGWXy2zQkKmpfv4t0G853GPfJCbGIyHMDKItGyay21+/Kd1APnrcQMNSoN
 tbaIzKJDnwsB94sK9sv12CfeFHJt2uT5iB1kStTwa6y64mI22NY3b+sVtiht30SfXU/yvyxi38Q
 6UP4Uzr7SVr7GDRMT7+mOozNd8vPjMcnxdnFZKGTpXG22bzjB1HWHNt312wRT8yFqB/N4DWlGYH
 F5dUS9C+E9zN5BA1z99b8uo7cj9Xz3G8c/e4F9kCHYCi6GBTMFjjTQjsjxV5O8/y+TtLrsMX/HB
 bEXI5sU1qzZiPwfGFPA==
X-Proofpoint-GUID: B-1L5dre6hDoe7RdpblSGzcS6WFVQB1q
X-Proofpoint-ORIG-GUID: B-1L5dre6hDoe7RdpblSGzcS6WFVQB1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200077

+Udit, +Bartoz

Hello Hans,

On 4/17/2026 8:00 PM, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 17-Apr-26 15:38, Harshal Dev wrote:
>>
>>
>> On 4/17/2026 4:36 PM, Konrad Dybcio wrote:
>>> On 4/17/26 11:22 AM, Harshal Dev wrote:
>>>> Hi,
>>>>
>>>> On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
>>>>> On 4/16/26 3:07 PM, Harshal Dev wrote:
>>>>>> On Glymur, there is a crypto engine IP block similar to the ones found on
>>>>>> SM8x50 platforms.
>>>>>>
>>>>>> Describe the crypto engine and its BAM.
>>>>>>
>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>>>>>  1 file changed, 26 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>>> index f23cf81ddb77..e8c796f2c572 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>>>>>  			status = "disabled";
>>>>>>  		};
>>>>>>  
>>>>>> +		cryptobam: dma-controller@1dc4000 {
>>>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>>>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +			#dma-cells = <1>;
>>>>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>>>>> +				 <&apps_smmu 0x481 0x0>;
>>>>>
>>>>> It seems like these aren't the right SIDs on this platform.. Have you
>>>>> tested this patch on hw?
>>>>
>>>> Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
>>>> (I hope I don't need to pad them?)
>>>
>>> No, you don't
>>
>> Ack.
>>
>>>
>>>>
>>>> Unfortunately, I could only validate driver probe on my limited ramdisk environment:
>>>>
>>>> [    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1
>>>>
>>>> I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
>>>> SIDs and wait for a Tested-by from him.
>>>
>>> Thanks
>>>
>>> I think you should be able to get some life out of the crypto engine
>>> via CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y (which btw +Hans
>>> mentioned reports a failure on Hamoa)
>>
>> Sure, I'll try this, could you also point me to the bug report?
> 
> No bug report yet, I was asking around internally who I should
> talk to about his.
> 
> I'm seeing 7.0-rc# QCE crypto selftest failures on a Lenovo ThinkPad
> T14s gen 6 (Hamoa x1e78100):
> 
> [    1.357020] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
> [    1.369951] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
> [    1.443143] alg: aead: rfc4309-ccm-aes-qce decryption failed on test vector 1; expected_error=0, actual_error=-6, cfg="misaligned splits crossing pages, inplace"
> 
> This is with manually compiled 7.0-rc# using Fedora's default kernel
> config which includes: CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y
> with the latter being hidden behind CONFIG_EXPERT for some reason.
>
> This is a regression compared to 6.19.y where CONFIG_CRYPTO_SELFTESTS=y
> is also enabled by Fedora and it works fine.

Our Crypto Engine enablement for Hamoa (x1e80100) was merged as part of the 7.0 kernel
https://lore.kernel.org/all/a9a6b840-5a4f-4d27-8b34-da82657e5c9d@app.fastmail.com/

I did not run the CRYPTO_SELF_TESTS for these, so I am not sure if they were passing
for 7.0 with the Crypto Engine enablement changes. I also do not know if we have been
running the self-tests for other Qualcomm targets which have support for the Crypto Engine.
Maybe Bartoz can help answer this, since he has been involved from the beginning.

But it is worthwhile to check if something else introduced this regression or simply
the enablement of Crypto Engine on Hamoa. If you have a manually compiled 7.0-rc build
could you perhaps check reproduction after reverting this commit?
7d1974ce80fc386834e5667b0f579c2c766c4faa ("arm64: dts: qcom: x1e80100: Add crypto engine")

> 
> I've not looked further into this yet, other then a message to fellow
> OSTT team arm64-laptop users asking for tips / whom to report this to.
> 
> I would be happy to send create a kernel.bugzilla.org bug-report
> about this to, or report to email somewhere, or ...
> 
> Please let met know where you want a bug-report to be filed and
> also what information to add on top of the above info ?
> 
> E.g. these failures trigger a WARN() and thus log a backtrace,
> do you want those backtraces and if yes I presume I should run
> them through addr2line  ?
> 

Please send an email to me, Neeraj, Udit and Bartoz for a separate discussion on this.
Please provide information which can help us reproduce this on our setup, and
also the the dmesg and backtrace logs which you are mentioning here apart from any
other information which you feel is relevant.

Thank you very much for your efforts on this!
Regards,
Harshal

> Regards,
> 
> Hans
> 
> 

