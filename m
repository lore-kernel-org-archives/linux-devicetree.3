Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33943445AD2
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980350; cv=none; b=OM0Krw2XmdjBpJ5MP5JwW+VeTpiIgwH+2tQdN++rLZjm9UVgLRq483VNSpUQvE1KJWgkwEnZzu5DhdE8gbXXuRl1ZHeVlO0o9cjyO2qFVMDsrXVxpZhmeOFvqJcSaZoaOCVvyu6Rj0xllHqSWNN86kQbwcZlj6Ls9OmQUZ2jilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980350; c=relaxed/simple;
	bh=XBzFWhcCyZU2yJ+/3TDI4fZANSR2pFhRn+TRORSTUgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clQluKORsx5i5wVgH8VC1YzwJpizJeTbyrcun2C8goeBFIGI2PynM8dQJov61qWIZN+/chA8if1It3Xw3iJwgaPjxUVj1/0osy9prVMDxVvGqYMWn71GK+DSM0VoBLezcDgXeMQgAkMWJTRBAZFGN6KpIKiODLl5pBHf7jHPnIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9gFdM06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HivnAMAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9gFdM06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HivnAMAf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5iSq1510855
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=; b=Q9gFdM06eRE5sR+F
	MBzVMIv2b0Wkf89NeQBw3SmTfXt9vyrpPReD75/C3+pKgN8bRPMczR2fTngt6sdb
	dIt7jIhgQEYYsst+WcRWRdPeyJNiLOujTGpb6fP+K2JXP3iCe6tQLJwojKSHp0D8
	/M9dXkG09McJM521PbGuy9wuaowRyYUDT8IUT6Qt/yfK5aBtC+CS4PTPv01VrVyJ
	g9ZTRmiM8VVThU8U8qrGxS9jRR1kBohqdOqIlaohDjKAU8Wky3Brp5j5pDHi7Chr
	EoXqcnYUK8XRa6DJb0PUrKCnPf/Al38p+h1Uou2ynOUFwJmjwNNW7c8nyawo+PjP
	XLCxRQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30hsq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:25:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73966c839bfso84712137.0
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786980347; x=1787585147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=HivnAMAf02dMsxbfhbmhhVVFRbuw8CE4WPk6tfeTwsVdRQvalVCMQS9lpU9XvRUKZ7
         4pae/UJW+JC/zPoqJ1aFN04yXTv1HcRRb8rBLvQOwjq3kLpXQCBoeD7cfpboV5WgoREr
         S808WDzb0lWTz1uCUwDDbN8gO0RchmkPRfR98ahKXgEDPMLr/pFwuhJJngsl7dYKvemC
         1fGRkREiKE9wRLQXcR/mcQxR0jbBYn3fqqvehZ3DPI0Ul99wZOIGeYt5YphbU6COMKTt
         Dn2x2i3zTa2AeLWj/qz3PoPyQPZAgpV96NHYfXJwMJzKytcnbhJOF9dLTnk4FWBOL3K9
         wnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980347; x=1787585147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gS0QNQ0WhZ8xM/8ZNpfDM+xJH1jiqfGWfnkppPoW6TY=;
        b=AI0pzSJZeueExRQbseh6psLOX3y+bTVlhE9BlycXdLXZffbq7+H2Ce4BW87qe8SMO3
         y/QIX/XAd/dxhI0aw/507PANtvVD6BC8zrXYX6bl6Zy1R2HeinZM7K4gjR28lf/ZLtzv
         WU/hnI6Ieu/g2GTAz1k2c2brAEmbTI2Cz2Gk81GjK8IYFOkdiSOGAQ6HRomoxdVeP5FM
         3ECnbY9B7apiL6zpGrpUyOk6DYhbZ9aGcFcQ2+rh71so8RzMQBXH3a/I8TC1LD3dDwIo
         HnBvJZLtU6SC3Vd7wtoZJr2Lz7IGR2F4si9KVwJNyoxQV0SWvCVDMFkpljCwyiO3duUk
         uB2w==
X-Forwarded-Encrypted: i=1; AHgh+RrD1JDDgTnNZWJfYwmdjhDBueshchxIJNL1CCSQ/64mVGXpGijx7BgIU0vrQsUkTLRDVxwtv42fdIot@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5Kkf4UyrxH/a7t34UC97Z5FVqaLGElU8IRSSVLzvcSK0oaARS
	gFgE34DXU6HvxO62ppl6I1VzxRneevE7oSoXXLVxXFs4Gae6kpl7CAHqbD6jH3uDfPuiA92P4pW
	ETUWaIQmzYZ6bRON5bb0NoTC5d1AtyZw2buaZ3k7WTCaXmm2T7gsHW0eFdHB3HceU
X-Gm-Gg: AR+sD11vZa1qpjOZUM0L3LzBqBXzMh9PPaPgR26KPcLhxGKOUJIZid9Bi2dXqfBUTWU
	eSPAOx4/LUl9wvZgj3ao4gCRDrprcm6fBnrp8szRDaZbT0V8GlSI2dOwBRvaAf5+TRdRP2WJgAP
	ubVsNbNyBsDKoXbhlbjLxFJm6LLG3iwtNpje6hJf7WUMfgzDnh0rTFIM9rgx5ocOzgrSfH6yp9I
	Amj73RV4jngbEpeHqvd87SH9pDLO0IoM5i7E7bAO1PDUXwuTMHYUAd09ZGV2Gqru9SHy6C4eUe+
	229oIncjon0pMvYXB2XadM+VfurnvDQfbyRVVRormri/7E+rR2mDjPiNfYulZ82pdS5AsIARiun
	BGWsjKPMhGnxmlqgAESRaPEXe
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631481137.2.1786980347237;
        Mon, 17 Aug 2026 08:25:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr1631463137.2.1786980346780;
        Mon, 17 Aug 2026 08:25:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e1a2sm75279766b.14.2026.08.17.08.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 08:25:45 -0700 (PDT)
Message-ID: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 17:25:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfX3MH51urcqE22
 XlkRYIKDH6GNpVpEyzQ2Tg71UaoH+m21hZer1kTB08izH548nHTEQWvzU78is8p3F/djvQ5eoLo
 /7D/r6QYhOQh8BjOmuJLU6l7WQa9pSpDFv/WQZ2vFEIlmItIFd+1m6FqnMf09W3bM1nRWqfCX+h
 R32wZrVVx1xT70oPzb3PIT/cDxBT5F0aLNuFL6e5q6BMmtXLwtesh73AcoF7xc/AOibsOHh0hBU
 t6D/yEhLUvH01Ne08vweFZaqnlZpOoa6qvTDqeOLNZQwzK8wA7wdcY25EQStF5Vfa4WJx/2Lqr1
 eNnbAFJFQP76X8UjEAAVb+VTHysll1SWpjdy90qVT8ktIAnGoOBBR02ayXx0IBxbCmb0h2IwuEy
 GOpw/Yg6W2dYdFetWvX8X+tw+5xSDE08w9y9dt6tp1k9JsiOgfoaVZv7NjyybrerZF7QD1XBsvM
 3SzTRf0ehmaEGOVsoZA==
X-Proofpoint-GUID: -TkC38GPnfBpA7G5SxLtGY4kcM1Uz40a
X-Proofpoint-ORIG-GUID: -TkC38GPnfBpA7G5SxLtGY4kcM1Uz40a
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a8327fc cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2hgIxXGGQldiWaMEjnoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDExOCBTYWx0ZWRfX3YYRs2H97P1b
 Vx1prGYu+vEDu3S1z3zoFKquEx1OTwtjorF1NmySTEi1OAQeqpGjIByleCNMFo7v/w0iZRJi5pj
 iNWBBTMcZSo97tN9ffC0ssXNdXCf2gU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170118

On 8/17/26 3:42 PM, Hardeep Sharma wrote:
> 
> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>> interface through the common pinctrl-msm driver.
>>>
>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>> Function3 can't be selected because of repeating names
>>
>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>> Perhaps there was a longer name that got truncated?
>>
>> Konrad
> 
> Thanks Konrad for review.
> 
> It's a real qdss_cti_trig1 line - the in/out
> mirror partner of funcsel 2:
> 
>    GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>    GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
> 
> Both map to the same name because the driver uses one coarse
> "qdss_cti_trig1" for the in/out mirror variants.

But these are physically separate functions, even if the mirror feature
makes them seemingly one and the same

> Listing the function on both funcsels is the normal sdx convention for
> these mirror pairs - the in-tree drivers do it, including the same pins
> on sdx65:
> 
>    - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>    - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>    - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
> do it.
> 
> Only funcsel 2
> is selectable from DT (first-match), which is expected and matches those
> drivers.

As you described it, you found a bug (FSEL3 is not selectable), please
fix it in all the instances you've mentioned.

Konrad
