Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657932A3EC
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616358; cv=none; b=XD/62GFJfhdwi9A1Jz+6K009B60FoCc2tPD56RpWsJo3K7UPKQFM3li/+j3HtdrP9TwjXoQsqwYETDSMAdsRb+8BsXbKjl/2xUA3fOyRDympA/AhJm/ZqKuZsKoeSdL0gJrdG6acHseNtARKv6zZQqIDemJEdqY1hG2CiyEZQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616358; c=relaxed/simple;
	bh=Ioea2Y3umLF6KJsfs6zmlpUj+peP8XvUMDhOYe7LilE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDNU2Hfm2j/aQeOzHOxeruIHs8LSyos5SnyKDsUAmswuQEW0E9kmK50bhXnwmd9f1lg2Zwfal2+tbgOa6q9rc8N9sYLcfGlAzhiQlGpaoVz+oB8A8tziisQlWg05v4QwJqFg7u+EcJd9GkKepBZWwMkTBYVakMH3OFmW7zbfDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYo9RqbM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARvP5JP0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYo9RqbM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARvP5JP0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABRhV3224489
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=; b=hYo9RqbMS797uCiB
	/BtjaAezFPZN+3L4jWIj/VY79XiFj+X27I/Toe8k0yupi2+jkIB+e7FqIbh1bsgp
	1Dd0lwvfbng5qskjlg1eUd+5FNo5ZfZPGz0khBpmqMl4XAdq5PjulXHtv6Kl2Vr4
	AcM2AW71p2HjfW08bjbEdBekSI9gquZ9+qg9tK50VOMLiq/lJmGJdzLHfuG2KhHw
	zkzWv4TFzTs3jpfdwInL10WvnakotiRvOcXOICIbmAbOQi4jVEzxl/cpAVn8AIAo
	n+wi8IqUL05KUcTHJ9y3Fa2rUK18bjuG9aHlKheT1INWR2lR/0bYEBFEXTplv6cc
	6JjjsA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1yssfv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:25:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c9239a1dccso153319137.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781616355; x=1782221155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=;
        b=ARvP5JP0maEXTG/Xsqk4lbDxr46E8JLtMbIJVVlhEQoOpPe3+lljzOPLcySsc3YBrI
         g7YtMvrl3LM4Kt4E+84SYFRmhCGFTnp702CdH/E6uUCIY+A1h+J0XhP8ADe+RSZJlwsN
         MH0PVrjnIkpAEAiP40DXibmlzB2H2iS6F5hMGFClDaUy0h8SbRLj/UQVeAD7jrQqkM/B
         Tkt4uiZ5XfjwBy5OO8A7u3DeGm9wtJUHY6sjsgu05GcnuZmTEoC2TPGBB78xeFfDkxNW
         LIAecNkVxlQrDCgg4asMe08F0uFpmW9JxCIzRBvQ4HxjfLsp2UsqYLWRzbEI3XUmhRjz
         UHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616355; x=1782221155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwjvuYt5+PoE/3vS01HiYTn+yCCieemIIEOSQmhKM4w=;
        b=iFe7OzKahwrZtVepoQsTm/3cgX1lyoFrflnZxYWN/NScSn6gilCiN0yuEmeR3zj4vN
         SVOhzD9KcLmB0SpIg19XMKRStWGh0wJhmSw7z7VpyR+S9FndyAP6lnSWdfkB4cvIVbUD
         H/PHceVJ/Rz8o8E2MpzWbWw8xH4WWPjR3BDEDkfoZ1fZ+cRR9MX8Sap4Tt38aVDAN+2t
         AfT1QrsTojZzZjgkJ/Iw/ntrv/QLfdImF7qGu8UoaKqEkZyfpZLl103IQbLWTwRhvFB1
         nQzdSTmqNERp2GLf3GSO5b6HRhv1wZBpmCAZwmrvNSlz2K0f7K0Q04Fmm83lp+e6yfR8
         03bg==
X-Forwarded-Encrypted: i=1; AFNElJ+pSMp0FMKg6xedBWbUCImdhstIlKYeTskqyzqKYA7QEVHdCBWh6A7w3ZDncTQMw9P7Mn6I0wue1Ff9@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTIc8TnwBNIsZz8+nDzer7K8csJBuBxt/8Q8SUkqa+QOy0mvv
	BISksbRwtSVqf3BVPRLlDlQDmJCRqhsk45E8Dy9E21oOGAWQ5uPio1senmMo9stHWpDsSKXaWtI
	uAkcBt1/BmtbJCBGrF3d8RX2pgfaFRZhrjnsKQiSMAatxZF1xGva9kCZ1ATrOkfXc
X-Gm-Gg: Acq92OG312+DLZTUwppWEYU9UrhErtoxJ6dNYOp3lzC+GUDVuBIcaqvWuV7Ntw0sG/a
	8xxtLNQ1CCcmP5Yf4nsLss+X6UoqdbLHKD1NsQGapiczJqZJKLo4uZYjDfztNJtE1MHneihToyr
	KDVlZt93vqnWiXLdUEV+xESz/LSn+hwkUww5+V4ZBDBgKdF4Iby+QZ0iMqECBrFX/0+mQqAuHgQ
	DW+J451v7b7y+JP8Hv/B2CR1Olt89jBUWwhPpeET6u2TZXaST2DKPMctna5Q7qaMdyII+KKrRTy
	lzuAueHyxn2NSrEe2Mqx5c1L0jR8c7vv/1aox1kuYKO3VPxgB7gPDNyxGNFZFVzH9+heObV9Jf1
	rLjEGW+XWF0rF5SeApttKDe0/44n7du/Dw1zd7zYK/pNAOQ==
X-Received: by 2002:a05:6102:3912:b0:71e:1c56:e79c with SMTP id ada2fe7eead31-71e88b60f45mr3018647137.2.1781616355591;
        Tue, 16 Jun 2026 06:25:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3912:b0:71e:1c56:e79c with SMTP id ada2fe7eead31-71e88b60f45mr3018633137.2.1781616355146;
        Tue, 16 Jun 2026 06:25:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb844060csm641401666b.46.2026.06.16.06.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:25:54 -0700 (PDT)
Message-ID: <fe3135e1-8d47-4797-80f2-e929fe59948f@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:25:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sdm670: add default uart pinctrl
 nodes
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
 <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-1-c5d51dd96ca0@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-1-c5d51dd96ca0@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i82nJ6eNwUjR98X30kmUwhGw8ozhbPsl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNiBTYWx0ZWRfX7lmfX2lEIqBT
 2EvCwxgVZ2HPGN2VjoDj5myR702nS+hr/e8MN4PRoUJpLs+9xvmHOso3kl0mgjHHECQLwl9xYPM
 xxpOp3oyUj6KdaT32aEpAy0ofCpIflg=
X-Proofpoint-ORIG-GUID: i82nJ6eNwUjR98X30kmUwhGw8ozhbPsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNiBTYWx0ZWRfX16UjnTwyzYak
 tDTGpHmpQOsT2k3JlIf0NyCs7zoUmmcBlAQGHra/ZqnDxdsVTfbkM/ArsLIxylRjUSWoCAx9MHN
 if2YqPPlQmMfIUi2t3TvKPGE6kx7UmN/XgjE2yaQSOrDx44S/OdoBeaa8g/OFHuSCcfMX2yFPXh
 M/VQV/hxoTPNVd+397Xhz+idNH+m7bGV+/CVW3di+zoctquFzY4Ck5HCi2pMFIl/vJtbbcmP6EQ
 VbDnfhL7x1FHQbZRZdFGup60/4EJGivpm37O55g/CczocPSWOFvM8lII4qZ9ufrIcXIWg79IkRp
 Z1ZyFj4bsqqeoQdfonUl0ofn7JTSlFKfA3fwfOPuY9EvIAT9RTW+2kxEFQXrgx+bRRYu7YDGVpR
 NLgfAvta9iG+ZEiNVcpjHN9Z/j+j0ygN/DGZVopQU/zlSAXMkqZbmjPbnwajNDy+vqSUAFlCj0h
 ZeGALkMN9pFHDLDcPiQ==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a314ee4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=FyMMustK1Au6H1ATeJ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=crWF4MFLhNY0qMRaF8an:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160136

On 6/1/26 6:55 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This is a pre-requisite to enable UART in sargo and bonito. Values for
> the pins have been taken from sdm845, and cross-checking dowstream,
> where available.
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

[...]

> +			qup_uart0_default: qup-uart0-default-state {
> +				qup_uart0_tx: tx-pins {
> +					pins = "gpio2";
> +					function = "qup0";
> +				};
> +
> +				qup_uart0_rx: rx-pins {
> +					pins = "gpio3";
> +					function = "qup0";
> +				};

Let's drop the unused labels and let's bring the default config
(bias-disable + drive-strength = <2>) to the SoC DT, like we have
in glymur.dtsi

Please also cross-check whether the pull-up you enable in your
phone's DT is actually necessary (and whether it's defined as such
in the vendor DT - FWIW it's not in the sdm670-pinctrl.dtsi common
one)

Konrad
