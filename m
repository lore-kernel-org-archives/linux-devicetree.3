Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA4435CBD6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174266; cv=none; b=Ur83A32wJGT6gWg713QIq7nn8n5QE3mTV2ubjO40XfVhv6q/3/Z0cLCVBiijRXQBVbsaxzbEikJDUKV/4DOnovKlpQalNdl9yAKSGJg7MdGq9fEP3nOlffHRtNQGD/wG/n44mHd82BTKJ2A9bQQabEmMxLFO5aaQ3Y5YNx9QM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174266; c=relaxed/simple;
	bh=SLxDXjrIL6iecKw2dITuFW5iAt8aytHnHu3Mm9uiiRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdI6HmtaeAxfk2fpL3d4sggY/EJJ5cFGb7p8AIcjwwW2ti91vtops3rMLKp4vwACfeq79AfG440QrKK1KHVfX5Fhi2Or7arj65NbKfrEtMvWaYwA/9JR6AT9W6G+A4fpeFMjwFQnmUeOXY6NnRhACPY1AvIBwobQASFgrYsHoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFZH9dgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVbaUZY+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFZH9dgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVbaUZY+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xCeM242694
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=; b=FFZH9dgwWkxTBnGx
	8rLe5O7oimmieFnYnob2ZY1JehYl4EanRI8M/JNn7Z0Ui4IxilRYc3BgGY9EZSao
	wNNOOyjXMdbtvXrIvlFtJbivMgYm4xEZWPDNBv3XnXVr0RkMpw6i/mVPunBlqzKl
	DcvRPqQLOy22KZMmcsDaU5DnYNhfWQIOx2lGziO11Z0XQdd0pO+8H+OHi9t7fuKB
	AIoU0U5tGl9QNicb0Q9O//W2FhjMhkeEjJn8Cy9iCGDOYh4Clrp1IhQ6O/nBanpO
	dSZsku8gyTW7z/SbCEIMBihPjTzb0G47fO7dwDH0SWVuA9Xv+JzJjz4X7OnxKDiY
	DgNvTw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7030n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so25794741cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174264; x=1781779064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=hVbaUZY+ySLMFH4Eor8tDvmHnM4xl/yCKYmavydgx8ED3ForWzna1ANGUvRbUsPybY
         6JV1la664ebGHesNRjP5KFSPi9pQBBvTExtqn+3uHQ5E8rgvbWfhRegur/E8WKM/snEv
         USoI6MjnGQ7zWfCKZMOjkNAhByFxm/Old3SiR7md//LMb67PMc7Et1iyI0HUL/5Mot6H
         6HPAfSKcDKG8Kx+2zFxhqU1D7fQGSiP59me+3Fq3bEUfzmyF1D3QX8Rp4VdwqBg3G87j
         hi+Zv6uQfYSfY5uE1M12vsRS/Sijwf/1Rq6koJ8T3tzLmMB+DTc8uhT4okJkApz3fKB9
         T2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174264; x=1781779064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=r8TWNj1pX+ac77CR5ibqQwxYrl6mb9LdEARpSy3DX9UAgjqEshfYrDjjaqjtVsqoJw
         qfu8j1A0KshMAYMmcRyuyt2L34MI2iEN2ULniDEh6o8BQHpXATTN3Obs2U6fEgfYPwQm
         e3YyTE1gZa724sPrv19FF7LNyOpMS2LBnIBxQ+XwrDWTTSwFdjomEAzM1g2DERETLw7I
         28I1x86Sv/T6eQr4HxHOHosUs5kvPUlj9C2A+vk/1H/7TNyh4U1F7fHHzaIqqUulsDEo
         AZ80g2UiDCZT0KnxoIT1GifRc4bGr+HV1+J5rfx06PwNRmcCM3AVF3BEaUCm5VfnvK5U
         dH4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8g0vDgISI0m4p1nPldzoSuxh00fdkOt1OIP2uwZs+JbMC4xeYH8ACpnw2qhMp1O7yFaHyp4dL1M0tz@vger.kernel.org
X-Gm-Message-State: AOJu0YzVmdJt6sfma4j4hh2P5h+QRjhkuNDCmtLndttdXXt+Wtl7Z1Ke
	dM6h2XR3HlZErTOb0ZE/f/RpYaAl1vNHwg2kZnrdjpJKQRkq3ShYZ+Ejlfic5jzJhrdDkVSj7Op
	sA97KWk+qj9A2p4uHlDGBP9puSzIuCrfLAhtn235T4iDm8q+vfDYZxDDPQEppQSGc
X-Gm-Gg: Acq92OHwmeqTmWvb+y16B2yFsm3FVdBYCNSezQgUP3v23TO+23Cpi3f7+7sXIzmtdnv
	PJVzsz2pyZosNT7CBygK/YUCmJ0ejcjEJcipsu+eXPlcDa7a216Megl9THY+SDKD7j1fYC3teaH
	AbLLkuLZe1F+CqEH8JR2r01WPK/LCPUnDe/qKzcDzwPGbSm48fZ5jwz0lRd6fFC1323uIyMpZxZ
	X9BwfTzUOAdAHt5p5ziFmv3pmlSY16o/WMNfyxSE2dkFZVVoi1XheT9YFLqR58fd1wdFRvebMt5
	1+CKi7RgxrU/v48PfjKDI/p9pVpECP02rFiB4qZdHFCrnVWrdtDOfP4tjY1x58euWLpk1UuxAsh
	vKmaJrMVtWvIq2HX8CpEKcwVV6nsIM5WBnIfvA3TJWMX0PnegYxumHuRL
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156441cf.6.1781174263460;
        Thu, 11 Jun 2026 03:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156111cf.6.1781174262936;
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14767sm48355366b.5.2026.06.11.03.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Message-ID: <2365c393-c6a0-46a7-acbe-72e6d52c9645@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:37:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oliver White <oliverjwhite07@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
 <20260605190638.GA4188454-robh@kernel.org>
 <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
 <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfX5RDHKyle5qTg
 DYI/YF5bF4zYO1CGAUfkHbzh9K1kUuwI1KDZZ4/xFXVesSPSxB9pT4unz5c8lJNzzIPZORrCTFs
 Xdm1wwqyp1YcebpcJWqsGM2Gu2feBfdyrM4p8LlnGlIfOnrGXWIKhAjFBhrEpXYQOSEMDd4cOPe
 Ob72fz/yHhmtQQr7H6c8M8Hmy3Ak1P99d6Nnji0/Ypez2pT4234ByKm2JvvRhdGdiCDSxQhk9N2
 ggQ54f8FR6b1oenpFb3/xrVA5xP7/fu/MIuE32qG/alif5mcBlcXzRRy51YV9/66uQEHsmyqpjJ
 hmEQZc4aRy/vqQZVNo6GD4szH+5KlPocDh6DFuWLm7GNlUER1Oyd8ynoJwjB20R3zet1XWa41DZ
 qJC9WiR87u3/M3+RcjBwgpqSMXxyguM7/thxuJo+PWCCNwrg6Mod23wuSz3cFHEq9c28YYVhVt4
 XHIWsoQqAI1tbBt8CxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfXyWhIrgTnboY/
 qTPnlfyNZ+CWXWsmFEW++xEZkuQpWD6uP+S98hW7RDl13UF4dUL92ycdEER/rcxVOlnSasP+Gjl
 ITznXp3F0tZj1MObPD80Ajik45cuzHw=
X-Proofpoint-GUID: 7wEV8FiWP9EHputaeRqnsYxboOsQQFcX
X-Proofpoint-ORIG-GUID: 7wEV8FiWP9EHputaeRqnsYxboOsQQFcX
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a8ff8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Adm4HkoqiFglUZcFbxYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110106

On 6/9/26 12:00 AM, Rob Herring wrote:
> On Sat, Jun 6, 2026 at 6:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
>>> On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
>>>> Add the documentation for the 'snps,reinit-phy-on-resume' boolean
>>>> property. When set, the DWC3 core will perform a full phy_exit() +
>>>> phy_init() cycle on each USB2 PHY during the host-mode fast resume
>>>> path. This is needed on platforms where the USB2 PHY power domain
>>>> is gated during deep sleep even when device_may_wakeup is true.
>>>>
>>>> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> index 6c0b8b653824..d12f6ae81ab8 100644
>>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> @@ -212,6 +212,16 @@ properties:
>>>>        When set, run the SOF/ITP counter based on ref_clk.
>>>>      type: boolean
>>>>
>>>> +  snps,reinit-phy-on-resume:
>>>> +    description:
>>>> +      When set, the DWC3 will re-initialize the USB2 PHYs during the
>>>> +      host-mode fast resume path (device_may_wakeup). Some platforms
>>>> +      cut PHY power during deep sleep even when USB wake is enabled,
>>>> +      and the standard PHY runtime PM resume is insufficient to restore
>>>> +      the PHY register state. This quirk forces a full phy_exit() +
>>>> +      phy_init() cycle on each USB2 PHY.
>>>> +    type: boolean
>>>
>>> This should be implied from a platform specific compatible string.
>>
>> Platform as in the "root node compatible"?
> 
> No, the SoC specific one in the node you are trying to add this property to.

Taking a step back, wouldn't this point to an issue in the PHY driver
itself?

Konrad
