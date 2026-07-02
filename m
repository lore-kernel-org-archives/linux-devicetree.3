Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE74247A0CD
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996290; cv=none; b=VW7O367ptTICg1yQgcBBNOuPPDHHv+jlwCIRAFKZvQwc8bILUz8BaDbxdFgyz/bW0MDCZtxtjNRg3sDhqMkYom6vKMU/oiZQpAYF46NsaGaCu24R3/GOTwK50EgI32fGhrH8a2r9NkQN4+mFG8GBhbBecnJXGKlzJxygTTDAApg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996290; c=relaxed/simple;
	bh=M3vT7WHrqcyejJBhB2rh+AJHUnKETdP4JrfL0b19uc8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UE+Zj0Ndzt+rOzUP6ZPjIXaAaeth2m+fMVPJDJ8Rp2baNjN+e27n+U1u3uBBzZGxpQg6LBdnOdqVAXwQT8WxAjdQNM854DyxNtD/YpwE77AWsuWQ/dUPqjzp8I2CeIDsqbfinRL9ouKPwisV9rZZZY1svsdo7g8EPRoDqnJU13Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofOsqDiF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzTUQ6kA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofOsqDiF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzTUQ6kA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662C3f1i389807
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=; b=ofOsqDiF5W5H4TXF
	PKVn4pHc19o2vqLMRkQmtkUMhC8SrYqHjoehuBkMHQZNpSJMDYeMzOTpFZ37c1gK
	33LcQhjatOM+TNUYG7pCnQzlJN1MApA8hjGRSog1gEuJVWMqfBg6PTXrcatth3Zi
	9x42BtelPEXrT4B6bi4Yy7TDmwgUOewYkJS7cUg+CrXRDJR8wR3aUCmJ5OUPGcD2
	nDiVhv+yfI/A3zntPheW0dQM0D0OJ+ltQJHiEG7C66tZexPu+kD7DUssgHnFuMAX
	NFA/jJFo/X6rFvqsXH7Du3dukrTrRBbMOVodRIybwT8qmHVK7eEoscilcKu5HqA6
	d6Iyog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp85wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:44:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e57e56ce9so34856685a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996287; x=1783601087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=;
        b=dzTUQ6kAGfYVLq9oXIcbTb60ynWvg62EXPBtth63LLTqoFd8i2GZMyg9EI1AT8x9HR
         TzQz6JV1mvDHXI90e0d1zuJCoI6uhhBnJDjVVdcBoDkGTONRZBnbwBhkP6qE4gfAPD5h
         dnplvLaziJQAJSROG5+U0oJ/9S7XANIFG728UZY5suC3cl/O/mA7lEGUttfWdCo/PC/C
         3aeHgo9IMqaaFMG3VKSzYCJpsTU53jWc7yVs0kxWDeoNYgy/i2JUyraFjiIliGEZeHwR
         70LKJNb7HXe8Qr2GqccfWPLq6fnvVSoqEb4UzNBucRrgCS1N8JZjmEyBfVCxmK6a09BZ
         Hv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996287; x=1783601087;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1ZbIlmrnZBF09IpMi+cBnqnyYuuLrnreaKCM9hEs4M=;
        b=mipxLjD/lRzo2epKZRRmYaPOzOLVxJ65dMOXDZvVgbPY6ZDo7qfBr+kOR9+GFaeIVJ
         E8knypOWNo+8ohpkBabQiGygTCAFn7HtAM7nb4gmftCCNaccvQxUYQBUvgRD3ClG4Z/Y
         m9Bkk9kRx/DTAwnajVjy7/mnj8BKzVvJJ6/rOaE5m2fFDY9eGpeKDGNinjz/Gq8fGX2O
         sOP3HJLLqLT0kFM/K9gatcQxtA3JYroCqkbbrZl9oZZxZ73jYw2kVHIWTHpdfTFMCN/J
         GLoB0duHo8yR4w+dtw3Bhvdh3ItlW6p2hfYrPCX5fXroRD45vKLVN9OkgGprF6gX/VB4
         khHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xQq3zFDG4e8673d0dCVwws3hCwq72A0zRq7HGxGsioeSNW0rk1M752WhDmKgq1ZggZKDQrmiETTuc@vger.kernel.org
X-Gm-Message-State: AOJu0YyKgGjf0p7Hgl1Y3HP0zb8owG6gGFMA+5+IzuNmzs+alkcotKtL
	bUikCxM7iidE/vFkLSPQIvZWcxK4x4DgkViyFGcM26ZgosS4lirATeMOQUc83so9pdgJD0Lid2K
	Ll1iPtiT2N36WAkC+tpZdo9TB0WGXcnHg02YgmHzvhYQ6rFAhl9ee0gTuPWDrRS052U3Pwf2S
X-Gm-Gg: AfdE7clJ3djPxvr5FQ+3DKWJqHP6vf5hQbUzuCmMdGz0rANqe/bw3/Z9YfGDj7wYQ6O
	2tWWl42P6mrOrNbkvAbmVkiSEA0d9Zrje2xVaN29npD6DuXSuy3FCGP63f/aVWB/l7dKzdeAkKG
	ZPqbXG4+m4izdj7a1G72hDfKt2RS7Z/m+ZPG2IABLaqFDxZBBNAK/P98dYOvCj437nTF9NoAq29
	EDexejfNos3BLiv9cFeSpgcpx5Pw42baGNJYAQWPSTDMwtz9otVmP15SZcpFRygn+btAaK8WX7M
	hpKaIY3tWbEJkAPobAamLnXRPaTMEoRWR7NqlC6tk+wrDl3L4JXJVFDTXpW18P0PXJtxJrWTxHv
	znknA/5MlgK+WR+LzAkIb+TS/b2A/zRbFXdU=
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr46905731cf.11.1782996287032;
        Thu, 02 Jul 2026 05:44:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51c26b42202mr46905361cf.11.1782996286440;
        Thu, 02 Jul 2026 05:44:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16064sm936580a12.2.2026.07.02.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:44:45 -0700 (PDT)
Message-ID: <6fbc4521-15d3-40c7-89b3-ee15ad673ff8@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:44:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
 <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
 <99eaf1d1-fbf9-4336-a13c-ae8ab789cc99@oss.qualcomm.com>
 <CAH2e8h6aWW_=pD6JAuFB-VqEZDj9x8gZVh9TdvTCRQakKzm3pA@mail.gmail.com>
 <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c3922558-dead-48b9-a49c-7d0d6a2dde7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX18LVjYEBmdx8
 f5THq+f45/L1rsOvjRnZn48Pk3V7MYSmI7QR1UlGAFtwljUYZkaq3OeYK9wKoLh0BlW3buFeg1W
 2EtBRMJf/+PGL9fq5Hh1iymrRfMyoCw=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a465d3f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wzztfOLjYvU_j_VJg8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXwKfdBf2IqHbT
 frSOGs9yL9nv8MtfbaU4ndCgYcWYr8V5JCpqr8402Cpeyr+p5o/dK1ag1hVGawNetvjtu3fUELc
 Qs7kF+1Op8/udsktfvvd21kQ6HFCX2yzJToDwPXPhCA1e3eoxdjaVSHCKVHRn21Xl5Br8pncmHq
 qGBaFuPgkyotg7k1b3p+7bec+8SWL0bNyTLrp6GXmSeiAKXZNRjbr3P5ndNeYBnPDDT3e3dOdLx
 p9j+9V5iC49OSaVad9mR1H0ygLF6rTimeafXmiALAOrTVGyDLYCuGsVG0stsBa0RH88vHyPUdnz
 AaQ6D560HSQfzokn6y4s12smX8bIsZkFNoXyUx53R1a4F/CF7upPG9KGzROrTV/5JnCeHYWbVeM
 oSjBsxFOtNLAJVbXYBXilgXS+ZsFy4vH+XQ0sZQKmP7hIYUeQ3CjuuloKS6nuJQW1U+3/SSFtvk
 K4DH3L8Sycc03G/OoCw==
X-Proofpoint-ORIG-GUID: JazAMRHldInj4Z86fKhDyS9b_yrAojpk
X-Proofpoint-GUID: JazAMRHldInj4Z86fKhDyS9b_yrAojpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020133

On 7/2/26 2:39 PM, Konrad Dybcio wrote:
> On 6/30/26 12:06 PM, Pengyu Luo wrote:
>> On Tue, Jun 30, 2026 at 5:52 PM Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 6/29/2026 1:33 PM, Pengyu Luo wrote:
>>>> On Mon, Jun 29, 2026 at 1:36 PM Mukesh Savaliya
>>>> <mukesh.savaliya@oss.qualcomm.com> wrote:
>>>>>
>>>>> Hi Pengyu,
>>>>>
>>>>> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
>>>>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>>>>> also support GSI mode, which is highly preferred for certain
>>>>>>> peripherals like SPI touchscreens to improve performance.
>>>>>>>
>>>>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>>>>> the controller into GSI mode during initialization.
>>>>> Why to force ? You can directly configure in GSI mode. Note there are
>>>>> some configuration done prior to Linux bootup too.
>>>>
>>>> Sorry, I don't get it. how? I know there may be a qupfw, but it is
>>>> impossible for a normal user like me to generate one with GSI
>>>> preferred.
>>>>
>>> If firmware doesn't program in GSI, you can't have this working in GSI
>>> mode, its going to fail (and work with fallback). if it's programmed in
>>> GSI, anyway this will run in GSI mode. So why to add extra things
>>> without any usage ?
>>>
>>
>> What I can confirm is that fifo is not disabled on my device, and gsi
>> is definitely enabled (under windows, check the register
>> SE_GENI_DMA_MODE_EN), forcing the device to enable GSI mode on linux
>> works well.
> 
> What's the value of se->base + SE_DMA_IF_EN (+0x2004) on this SE?

I'm sorry, I read the first sentence only..

I think the enabling of DMA and the disabling of FIFO are technically
disjoint operations, but shouldn't be. The programming guide mentions that
FIFO_DISABLE=1 is set to prevent malicious software from snooping the data
from the RX FIFO while the SE is operated through the GSI.

Mukesh, would it make sense to make to rework the checks this way:

if (dma_enabled)
	prefer GSI, try SE DMA otherwise
else if (fifo_disabled)
	return error, misconfigured SE
else
	fifo mode

?

Konrad
