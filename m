Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479687;
	b=ynVdwizEn2Jq/ZZkushmUVuvDk3BHXSEA0ynVHR3hipNiKz+mUMT9zvmAFMJuGRS+D1I
	 nUMZjXVSLxfDCmBsNuXoGb7BVXbyQdu2yspA+K/JIpApfqXKTkXQa91uIMmHT3l8NBTxN
	 O8ik08/PrLA8PLaQCdVbqA7htql9nwmFfLjl6ALCRnPHqzZ+kS8PbS/73u5/wBbvXoh1z
	 c+e5iLKfZxIZZHFSnEp8LC6lZ6sUQDWJ/ynTLZVwZzP2SKNPuas4zQAukQiw+pmDB0GSn
	 kbizCIE8SZYjIl936Yzu9VIeuklfGB9Wlo3ZAUevzsZyKh/7+yKuMKTuW5+LAy8aV5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
	b=LqqLTlx8NTzSqgSF4aKGeT8Ofkr9Q06jsLp63mjdZMY9XuXTYC0UpCZnNxIBh3sdQsdm
	 M9gSIC3br5XgbTj2eLSLcEVeZhPSmSC0qdwHBkIolug6DvvkAyzoT5pv63etsnfqZdM6J
	 +D/F+Ht09pvT2sqrJy3jq3mA12vB63k2P4735V+h3HIQJznPFcqRy5+liEV9bm9GA/F47
	 SsF9gBOMFpge+ZioZng4VaX4Sd9OR9DgID03O++HNPsGTOcwOpLJU11XCtHhbT4IZyttl
	 rqYCcy4KCftcW24AzpTC4h+DNfGNjSgDjHz52H4gb0tv4Uo1r+ut3yc+K7zBi1mxgDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8L0qOPQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5015606A32E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5015606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BuLAlDlf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8L0qOPQ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t4Vl3485589
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=; b=BuLAlDlfzU/52Ipj
	vud1Do+m+MWPCF6KOAKryai1uJDwWpOaacr1VwelR76jsOIR+Ci0sJ8Sb4dECQxi
	4wZqTMqwrfZoeMQ+PcoUbiBCMhkgBS0w7iXbPWZGB0Vii3p1t+3Lt6Buy+9rUgcA
	/xcDv08qSMmUPF98ue1hHB2ezAYf/+n7YE6T1pFWVt+GxaJZwZhfE9Wtir0jafS/
	GrulP77SOsYzaHDBOAsJYv/ZpQQOu/GurFqmBAArgn/dQB7Lr6VPbWT5f5sCJxno
	tkeVWDzirRA1LNgFfxbPcc3E0z2xbReevoPLX2ziBof0zeO0ivND+N3DylUuOsZX
	Oj5OTg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n197k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:01:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c798d76so66410137.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792479685; x=1793084485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=e8L0qOPQb4H09r2jFUwYL7NzhZFQRm1IBV70Ons0P3Vf6zHSKMX63gtCOsOModSVsy
         o4HBYwAD2d+rR8GSSRNYCIURyo02ofps86Q0lUsJAecsiFKT/6CVxSNtl9Siu5Ew4G5a
         q8eS1XEu9NnzEf48yNxIc2G3o3IIwr98AUd6XQsdgvVCNtRreu8u8/v0MXyhKOJPNgRy
         LlzR+qQRJFZgJ4CJMTevB54/idMEz7gVZnmvtIN3s0Ui34r5USWsF4y/sH36/CugdEI8
         LW47ijRzbGfaVwYFtkj0hKACiDY+y8fKl+ebgQWAQvPdXZy9fDqPONRODfp9C2K0WLcw
         UIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479685; x=1793084485;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9lYMV9LMEy6Q2GjtN3qX2AF7perJQiLdC6rwKMiiDU=;
        b=m+T18N6r2HUwaYfhEaQz+hZY7OMxwB5xbfpw8nOeWjk/1JrPd5ydSSnvwlznhwupCA
         I6bjQWkV6Va2WnYrCjzBEotiJFQFMzcESzqFzKmQ6vKCMQe5UNSD61nHdqFhrRnA89AW
         ZekkLDW0abF2KIQLF/lCYKq7S2dxRnVE/qHP52PBXAKT/qo/eWxXrKzKL5edhV7ZA70u
         rM6LEzc8YMSuf8V+k4SMtVqLfEJMZwTYOyFPjN3+37Ex5i4LMLyKioWf+w76GIN96Oot
         sKm3kkfSf/pB9OaObZg6RPgW5kqyJS/RoHV8I/il1MZtl+6PH6DPnanqZIR3Lz9Estwn
         AjRw==
X-Forwarded-Encrypted: i=1; AKwUvBzhOaU1bsoXWmbEmHNi0rT+ExV3oCzVJfAfDj6hsKDElr8yottExnaTFSmnFI8dkce4RVpzaCgYDVWd@vger.kernel.org
X-Gm-Message-State: AFq9FYIRu45PFuDukUlCU45nyrGSLmUBqi6djfsCvHjIxq5p/kFvwhBM
	1/BtZNnQwlWvc+BJ02N8Ab1cDs4cqGOokPB9enm5cq3S3onfL3ocEP03/Sz0wucqPo9AA56QtDg
	bNTs03DwvWLp8IK98ry3i4oaVrXfldW8ZMwp4GNzBy88/CmgC/nfc3sJQbyjP2Pci
X-Gm-Gg: AYBFou1lmENvJrqy9dBMrimXQbeNmgj03DMyBPQV71qi4TgRD5xqHNwD9nykMARr+g2
	dVsAIzYHpyQa1+zOyZ4fAJXCjKG+xr/HsRCkRsXEXX4NaXTaaaI7NCjfLTtczifvFB/xLqikJ8E
	2+7JbHcm41mHSMAq5GIP2qOuiWZq1PsRcLtaHQUijie8G97JOLXjERyvnfBXISLh1I7Wi9m5kQ9
	SYTKyhQsve1oAYCt8Lex+Ursw+dViEi12SY84K+NStGw36aWkIIE1GkXI4PRzQXWlxZyR6hauuZ
	cRVY/AQZkfuJrzYO+HlprheMytk2v1ch9xlKie0kj4sxNx7z/3kWbogGvBPTHbn6n3V9DRE9wsB
	X4lK1qPvmrxzW1XfHKBXZxg==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535665137.2.1792479682081;
        Tue, 20 Oct 2026 00:01:22 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1535642137.2.1792479680435;
        Tue, 20 Oct 2026 00:01:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm4659866a12.36.2026.10.20.00.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:01:18 -0700 (PDT)
Message-ID: <2640c0d2-e251-4f7e-a6f8-44bf721341ac@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:01:14 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad711c6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfXytVAOOzBon32
 K3ny7nLY6ofYKYdOBYwu1EG9y5l4WAsy3r2cfJQLjz6tUelaqxt1RdpWUFvzGjX93ecP9fgvHc+
 OONNLmLYPQeDKSvM67i9WUEaNRqrXG8=
X-Proofpoint-GUID: 17Ni_OrJ78ManQVL7uIAlpBI9mh7UYwB
X-Proofpoint-ORIG-GUID: 17Ni_OrJ78ManQVL7uIAlpBI9mh7UYwB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNyBTYWx0ZWRfX/r5oC3fCjWNG
 083W8iLDd3DsMRLTMKv5kX46K7DM5dqL/OqsTVstQ590GBlqCgxrDFguij7ZKvNQxDVf/0Uyf24
 NhmAxCYeMWQ2T/qan17umJ5Im6iNPl1GztZMk0g2gC2HIrZy1s8DOa3dwilhapORmf6Sd+08cQx
 GsxcyjH7oLtLMzZl3NVylA28rwDQ3nDPAVkUCYVPwkPd7fdRTxmAI+c+y5iJJd8jL+gi4zT2wry
 vEH09IQL9IP9HWLq9GIw3HrjqbJO3dk0yueM8PDGRl50zOyozOmT1QO2+kcT5G9OG0zh08927bU
 1sLS5UdVdcLAw6XBTowZYd6HYdl1oFvbnYiro0fYq1krvOT9Ur4wOsauKhEwbkGJLBnkC/szkxT
 5Mcaa6UcRx0jaCFI0rHQjgMeC1u+yFTrvlyKyXLw4ODOcdQuXdTgXaA5NDAaN9Lt9wPtpugqOnv
 AOaEDYRq70uDiC/BjTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200027

On 10/19/26 4:30 PM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
