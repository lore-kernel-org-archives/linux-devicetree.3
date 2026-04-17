Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E73B38B6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776436249; cv=none; b=n/snJ644nktzS5YLeA9aVAIyg1oOXJjNPb4+uYR0Fc9X3hmxW+70tqlCa2X34QgXNLA0XmP9+QS6YDtjJatZDXhGlE1QyKIC0bs+mswBS04Nx0WEfF1/zD+AIOZGawaW2JODpaW9qFBYQSYyiY99xbiOp7baq5mDU1IrfxN2/Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776436249; c=relaxed/simple;
	bh=+JRJdp++giiBU4BqLJpcTVVgys6fecySNar0jj6IAlo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pjq7ncmTPcMPMqs05xuvOj9LsKVGE9DS9/lNURJWnyW2PVY/VUcquJk5+DGXDlxP7FsceKMQZqNUYPbrVqCJUl+K/VwcIaqThTJd2nz4/mqPA8m6Ilmnd883zx6Z/0Kfy8qpgWdoW24VAMChVCuDp4GtaSpQ8WzWykNxQ6RdRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGr2DvG3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/Jb1ht0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGr2DvG3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/Jb1ht0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H8npWX3100156
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWMBmmqoOHu9o4QHidJGbHGd6w2hq2f1eWB7D/Lq0qU=; b=oGr2DvG3kqbpL7yS
	l9oFzY/YbB4bbCRP7cLn+lY9dIZ+VIRGnG9QZvtbYagNt+MSQ4sZp37BgFGd9mVD
	dyl/QVYVdPzRn1z6egNM9K9feXegFONRszLiQItLurStp+kBzlqg+XOR9r8GEG+6
	nbrlXz9AcHamPWb774YuoZaTMva5yaOMkzIQuHHStFY+w0Kfd0e/MJSdOr9fjkpK
	YZUpHG56aBFAQuFzB5d4slQy8BFovbjWj3m1QO/BwJ6rzJTEZtAWcCHDARQyXGxt
	I94LayFa9ctPMgsVCOwv6P8iKR7qTa36hdiC4K/p09HJeJ2DXqG3pVq3iZhRDll1
	wgvrWg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhpu14ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:30:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-610478c6ba8so366494137.2
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776436246; x=1777041046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tWMBmmqoOHu9o4QHidJGbHGd6w2hq2f1eWB7D/Lq0qU=;
        b=i/Jb1ht0FSY3cDDyy4KRXZDgTRr13Mu+AzyuUUq2L8SqkYskZXeM3QDjU8PvotHXfb
         kcKw5FpXwgss5WH4ibiUpZoOWinj0FCr/sFien6SyqGnIDl+joeSzIBxAeAHSByUtnFc
         whSIzUzYPU9qRpg+f3ZVcGwQpZjwlbIk5n/3LTEU9nYxAMwI60w0EpoIwy9Re16Y20Ao
         56W7o+EuNRg0hIUyUXtJdadYe/H7Q4sIJtqXsKZynwJXtKmzGd6cYHPduM0ZP3mdE+gg
         KQHiOtfoCwymAHb76BjgI0yNjAO/tJZSZmoLDwBdAD/Di6jwqQU4jHWCMErCDU8SLgg1
         nxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776436246; x=1777041046;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWMBmmqoOHu9o4QHidJGbHGd6w2hq2f1eWB7D/Lq0qU=;
        b=d3qeK/KRA3304pcExh3J7ZHpKHFMZL2l18lMmcTKEdV5dftICejJkQs6F+MN+io+RM
         JoCV3+14RGLrjQgMTSdwtq/82aenSC1ol3+kTPDP8TzlPPVXm7ZpYFKuU6nmUHSvGtry
         Pe3RyU0/bs48H1iIxhiLtuAVVKXPQY0Ng1G3YIGUSr6SHntctQazRGb/9sIG/9QQD4Ui
         0k8YJr22gLkMy45mdCjPpJ/Aq5YC+dddcUNbtG0u/tseaSZ2l2u+eolj4k/qAj1SMNh1
         /x02qvGQl0ynmePbaIzZItHRDoP0JcSK7x7QXmPuZVX88bvihxguRLuZ5hWxACN+9Wen
         Fn9g==
X-Forwarded-Encrypted: i=1; AFNElJ9C1HJ73v998oUB5/EavcP8V9+J48QjRvZdbBR+Br7+QJaGNJQ7w28XuJR9EG7/9XsXx39dgHhhJO3n@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5pb/eDo3OMYGibSjN4keYdtWu/TouGevk99+rqKfNhD+4nii
	Q46igUyM5U7usoRIoZERQCwKqBhUI3hnwow4g2LsNziwIy4TPgt3Og3uBuH/nV5R51mLIlhl8Jp
	E6jj7UMJKD+mlHu9SmuztZ+OgzGjp6w0CMRq6LRuZ4ojzCtlnL7yZCm1y87JBAcJl
X-Gm-Gg: AeBDieuzzSSTIESm2BuAgto92yVxinF6GVjJB1dzUcMvEsz8tFfcvvy2AfL8tNQkCEV
	7JaqCisCjU7Y7CdVJnFf1kjz6ldUkLj2d77GJ6Ri7dwd7TIUXdJjDYLZaLwFbOlVbIe1YxA35SN
	uj/XFH8nTr1s4CGQNBwd+1SqsPh46qJLbAwP4iBFQxhLTwTLrPTxGg6MXGR3m5IVJR5lNyWL/3A
	fj5t1XtLKK0IB0liMw/0zieNl0O1pCEl8U0gy9+62y3IodcUlgM6NtxKGTLm+lDTEILmk7WC+tt
	b+ValZZvwLi5PkvcVL6hMHo+y3SnsBp5/Chf1wII/jvIeJEfQyA4nxxnkWic/OCZf0xfdypwL8N
	BkPw0fUxhcCbX9XHcwitP/K7UIAXJsnt6nRI0fdLpnfdcgeVOcSbrhs3Pc2ogLiZfTtcc9NdXjW
	Hh2guFmnHKMfKRXkijWQCvwG0PSDXVMICCDRt6KPQjM2J2U1YukLrmmR/ILx7bk6ynX0iYlFJxJ
	d2OYrLmsATMajyfccdNIXwI/fM=
X-Received: by 2002:a05:6102:38cf:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-616f772f67emr1283414137.19.1776436245627;
        Fri, 17 Apr 2026 07:30:45 -0700 (PDT)
X-Received: by 2002:a05:6102:38cf:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-616f772f67emr1283340137.19.1776436245095;
        Fri, 17 Apr 2026 07:30:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512113d2sm60238866b.11.2026.04.17.07.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 07:30:38 -0700 (PDT)
Message-ID: <cf8ba27f-2c9e-4c13-8c28-4e1e22e22479@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 16:30:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add crypto engine
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
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
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-2-75e768c1417c@oss.qualcomm.com>
 <653fc8bb-295f-4f1d-b9ac-a33e0d8a933b@oss.qualcomm.com>
 <b8f781b0-f7ba-407e-8603-ca504535a894@oss.qualcomm.com>
 <82e0d347-9ac9-497c-bc67-0db9206c5dd2@oss.qualcomm.com>
 <0d5bf2bd-b90c-4814-bd2e-126a9bcb82ce@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <0d5bf2bd-b90c-4814-bd2e-126a9bcb82ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Kd7idwYD c=1 sm=1 tr=0 ts=69e24416 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=WqXSJLEMAAAA:8 a=DmAKSUIzpnf1Jbdcx_cA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=XN9CkKUvUZsNBwEnh_OE:22
X-Proofpoint-GUID: qRHTR8Q8Ghtur3xujWqo0Ruyc0Q278aG
X-Proofpoint-ORIG-GUID: qRHTR8Q8Ghtur3xujWqo0Ruyc0Q278aG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE0NiBTYWx0ZWRfX2u5e/+QbVUw7
 gi3nzXy7ubNq31H6A9J95tOIQJTIBKqGKcwiPdEY45JTGhfVMD247Gl/T/i1HusBdevAeG4zR7t
 XhC/3IMtkuAoZM/NcV6YPTKCNUmCLWETW8nVgHr8OsNUgNFNMLDr5xN/5ttATPXKI+OJjEPKJBS
 DmAB/5ddG0TWKRy/6XGENlq5qkXB2Y/Yx93dpjTfXcOBuc0jUy3MvMptwHYgA7mPMvL/sDhpVJm
 lNkTO5LQWiNtHbfmPrUTVFhSydMEVkdGncVQ/BX/JeEsoiKlq7fomdeRLF1dARlGmVjMRd8E4Hl
 /68oV++brRy0/6QKiS5atAR1AJLngcEzBun7J/My5EYNQKW/OTGNLWzYSO9b/CpTgtfWpAROE51
 b9VcN6WZxbhJuAktQ1FG4hHxGsnAYITHWXBDBDKrGeI/RtYlYIbuwwrnjrUrms7QzOVFujPCSI1
 PZ7GjhCROJuaisxe2Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170146

Hi,

On 17-Apr-26 15:38, Harshal Dev wrote:
> 
> 
> On 4/17/2026 4:36 PM, Konrad Dybcio wrote:
>> On 4/17/26 11:22 AM, Harshal Dev wrote:
>>> Hi,
>>>
>>> On 4/16/2026 7:10 PM, Konrad Dybcio wrote:
>>>> On 4/16/26 3:07 PM, Harshal Dev wrote:
>>>>> On Glymur, there is a crypto engine IP block similar to the ones found on
>>>>> SM8x50 platforms.
>>>>>
>>>>> Describe the crypto engine and its BAM.
>>>>>
>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 ++++++++++++++++++++++++++
>>>>>  1 file changed, 26 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> index f23cf81ddb77..e8c796f2c572 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>>>> @@ -3675,6 +3675,32 @@ pcie3b_phy: phy@f10000 {
>>>>>  			status = "disabled";
>>>>>  		};
>>>>>  
>>>>> +		cryptobam: dma-controller@1dc4000 {
>>>>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>>>>> +			reg = <0x0 0x01dc4000 0x0 0x28000>;
>>>>> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +			#dma-cells = <1>;
>>>>> +			iommus = <&apps_smmu 0x480 0x0>,
>>>>> +				 <&apps_smmu 0x481 0x0>;
>>>>
>>>> It seems like these aren't the right SIDs on this platform.. Have you
>>>> tested this patch on hw?
>>>
>>> Thanks a lot for catching this Konrad. The correct SID pairs are <0x80 0x0> and <0x81 0x0>.
>>> (I hope I don't need to pad them?)
>>
>> No, you don't
> 
> Ack.
> 
>>
>>>
>>> Unfortunately, I could only validate driver probe on my limited ramdisk environment:
>>>
>>> [    4.583802] qcrypto 1dfa000.crypto: Crypto device found, version 5.9.1
>>>
>>> I was waiting for Wenjia to run the full crypto user-space test suite once. I'll update the
>>> SIDs and wait for a Tested-by from him.
>>
>> Thanks
>>
>> I think you should be able to get some life out of the crypto engine
>> via CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y (which btw +Hans
>> mentioned reports a failure on Hamoa)
> 
> Sure, I'll try this, could you also point me to the bug report?

No bug report yet, I was asking around internally who I should
talk to about his.

I'm seeing 7.0-rc# QCE crypto selftest failures on a Lenovo ThinkPad
T14s gen 6 (Hamoa x1e78100):

[    1.357020] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    1.369951] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    1.443143] alg: aead: rfc4309-ccm-aes-qce decryption failed on test vector 1; expected_error=0, actual_error=-6, cfg="misaligned splits crossing pages, inplace"

This is with manually compiled 7.0-rc# using Fedora's default kernel
config which includes: CONFIG_EXPERT=y && CONFIG_CRYPTO_SELFTESTS=y
with the latter being hidden behind CONFIG_EXPERT for some reason.

This is a regression compared to 6.19.y where CONFIG_CRYPTO_SELFTESTS=y
is also enabled by Fedora and it works fine.

I've not looked further into this yet, other then a message to fellow
OSTT team arm64-laptop users asking for tips / whom to report this to.

I would be happy to send create a kernel.bugzilla.org bug-report
about this to, or report to email somewhere, or ...

Please let met know where you want a bug-report to be filed and
also what information to add on top of the above info ?

E.g. these failures trigger a WARN() and thus log a backtrace,
do you want those backtraces and if yes I presume I should run
them through addr2line  ?

Regards,

Hans


