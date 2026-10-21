Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599076;
	b=rQ3rCSMcx7g8Uqg8bU1PGU1wRnZAgJXgv/hQNND9ArUGd+i1DN87/3qA7iPY4uVyuLXB
	 WecWsa8d9u7KHQPAUPgr8liHSPfTAI3TcZAto83HoyXxJHKz0QgD+LBPgxvIDPx9niDOX
	 vynF1OANpXsccCoiYmQHVZ+o9IbUXyys0hD4dD0hIKBaQs9F9/NSNVKf7ReX5Muh86euG
	 d0kG4Y++/J3cGnImCyKDNx6yeMH4jUJJ6Rzxk2UX52Z2g+/dbwZZthO8CIR0WEl6eiNQ4
	 bykbyIYuGJDtjON0wmckVuvBMuOo756X6oqabpze1XLq46tnOD5rjxTRfQhh3enl6ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599076;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
	b=3v/8igBY35B0dMhlqfbWx+wHZ1DhlMIbKuFuz4esMPjEQxqmdFWJAP70cnyikI8MLmpL
	 1AgDxENsNf7HCm/AUQft8L2bc+5YahIMbdMLyPaqYLXLmZCEXrg15UEIA5Tz/1awpiiE5
	 nZG+5bF+hQhq8+n5n4/IQNc2fXdD6VXDj0nsFH7ixbfAoKvG9H8nuEBTt2UDQLntQQmck
	 ZDP6qVNd129b32Zp6uSO7+qDJCh1TtxXskhxgCsuVj2xJcG3GAslHng9/qOeJVHcoIGB7
	 MPOqefUCI2PAxQ1gk8BhWSXagSlol+ql+PpMZZjFn4ksYcIOKNGlDju8KWjn/QTO3ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5AC606A329
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5AC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V0ihCasm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1l9lRz+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFeuCT1016331
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=; b=V0ihCasmkW/aMZhU
	sJcKm5nYfBNgtmimC6O7UbcbXBSTyusSedqc2yEm3bxa7yo4kC/bwTzn6LtAiUmu
	AeT1V8nos2qZSefaZ407+Xb57Cqu4fP1LhYtXy0jzYOOiDnTFYP64nFLSJJbZ30f
	gvGmQLRMS8Tu/KcL7unDk5qS76Xgpv4KRncYh6RxVaJLdZ7lmUqxvMp31bI1OCfS
	JZSEOprQ+ZWwAPZFP2PXPW8nvdtSxzSK76NM3OKetaWL4LvJimIjkmk0Z0uSTdfr
	FFAyJzzOm0e7Czj5+SBx9B1KD7CHqZI1VgsqiECI9iEK1vRTB9EWwnjk1gpHNyPt
	CtddPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r3y1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:11:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06da65d92so643742b3a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792599069; x=1793203869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=F1l9lRz+st+JFp1wukMvXHgwN6aZd/ZBZdwdPeP9xFepSh7WUVfwWv0LH9N7FuiKqN
         zR0p51614FH6rkClZrCyaSSuZHfNQ0oOPrqAzaJq5ouZVRXA2Myoe83fTIe26jEmZzYU
         f5BBfWvzArScGXlfoduJEgUm4kKDK5Er8DjRs5XVBlePR3olBVrJbYMmS/Ak1+h/2K+m
         NzTeycTF6RE6jr6jmYa+Y2zHCIeIB25xpeGplHJfX/wT/UIQxytGG+RA3O36Ub/Fx6PI
         +c09xZZhtSOoWej9srmOmCeUrx+7zfYQJ3fcnvblJCDtmbPcDWNq7aNmWkhX+Pb2huY1
         b/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599069; x=1793203869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJfPE0GpFpxw/va8n23Mh9Q3M+SZXvOdoCpzTeiresg=;
        b=JpjrU+h298W1HoRfngYXeC7lo11Fq4qsjv9COO9Qfrz/q6OBc/6h12xcPafdJjARkd
         eaiPgkIOfesUMuBo/qTChaMV4Yk03XAgmzatR/fPaZU+qpU9rhsV0S+nt80vQM/wkBto
         s8F1vf0d1q3w4LEKfSfV/KNvOzITDf3c8WwpcKCkFwcw0eHtMgs+9M3kVilFb7vBKKB0
         N8REKRjWEj2UkQ0BvYv8YzrvWy+0jmF41IHr2mDCSOUl7gV09LY/18kL8Wbze0UY7pUn
         ogKPA/k4oS/8yQNax+HFUiC06TcqNSD+3oSqoofAN9YZlERqYgeS2f2kz/k2ktXIxeSx
         5FxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHD/Y7Bih+9M7AuEyg55stsxAa21P2sxZ7ktK7ZtYX99iRWdaP148Q8jKCikw088n/R5pgTGzpb4ha@vger.kernel.org
X-Gm-Message-State: AFq9FYJavcnh815Ve81fileM0gB0TN2J0JvwmDvegcJp0CdV435IAH9T
	Ub7c/TPRn8nGo+Qzdocj2cXG00b9/XZu0qQVZ+cej5871AJ7G9AL8Nb4K4c63BP+V18TlILB5hX
	2EM0g4sHmsyLnvwkaEf3bOKV0Fp3YgI8R1OHcr/5O6/DQNU4UDyGh0DgoV0Gk5z+E
X-Gm-Gg: AYBFou1x7wFqVh+ke0qqoyJRlYQq01/eOpMrTLFq4Fi6A6jk8G2vFLUzv1GJFdUX+VR
	K1cTe8yqWmK7G6M2gGrTKY1PSIrl5gCMFg3Xo6PKKKmEX8wD3H9k9eCq6O5H/3Wo3EY8+Yw5vZm
	G8+gjI/b1WcdZVzHNix1ksn1VAy8+FYMEXhoZqANT8iMtp4fR79/ESI+sXfbBR51gu+gp/+udze
	DHoR3wGHep7G4uDm3Lu7FJQRRz55VN8pzLIbhJ+pkxbQfB/dw826pa/NkdPyH929KBSvBEfwlhL
	nY9XvV/56avS/++/ybs/1Gy5rwCkk23qtoXyUTBuKmXvfKX93eq4JZdyXVDtOyYTjCDCjYoEvlz
	saXr2VEJYJBMn7gP23E4IgaKkhK4y96cVP89NwaQsp9mq
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918092b3a.20.1792599068629;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:8a0:1dab:fd50 with SMTP id d2e1a72fcca58-8a089e1f4dfmr1918081b3a.20.1792599068148;
        Wed, 21 Oct 2026 09:11:08 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm1095569b3a.13.2026.10.21.09.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 09:11:06 -0700 (PDT)
Message-ID: <a9900595-eed5-4e5b-ae8b-212597601aeb@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:41:00 +0530
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
Subject: Re: [PATCH 4/4] clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-4-fd4c2b3cbdea@oss.qualcomm.com>
 <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <fefaa398-7542-486e-8cba-7f875ab021a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8e41d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=OgLFbhcrQp8kNKIItaQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: eF4e03OlOCWasdaYQZVheL50NY1-AbV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX2DI9cz6Rx64Y
 V7VlXYdUVUkLXpjKHYgaSs0IJz7z2/IQUoINjQSw4IBUrHdHdpwqjVR76Uz4eB6tLxZxi60t7yz
 nePEtCkIdL0eSuQuZnG0Fslx0pFdpyld7DgzXbo7s1NA66l7liG556TyF/gSQnYZy+ch/bbIST9
 BbDC6ufj3jiHJtgvM/4DKXqfEXrFLz6OAFKCeg4ecmdHnPp0vZ/3XNvqzEyDppbB22qMjR3m0/d
 pbe/b8cQKIv6UbND0TFc1UGHhZTV645+G2b2102YgoXTimfSTSJWrhvR7XWDWzrgr0W4fG62JzO
 Ma88MTiJ2kMP5UxTX49dAXYVUmd+BvOHL6adcp3Oiau2qYfTy/v17pxlXoRI9XzcMEI0LS9aVNi
 6GZMzrk9rv9+2EGYcekaPyxjbjrp9qESlT0VXuSXakAOCXAJmfM7hPf2tbYwxsTWAAiq3ZYXto2
 gwV28m2rI12HHF9GHCA==
X-Proofpoint-GUID: eF4e03OlOCWasdaYQZVheL50NY1-AbV1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NCBTYWx0ZWRfX9kREOyf7NZVY
 qfeV9WVNXRJcmYUrBcorKH0veA2P13+VakgP8Jr8qLEMo3TB7DBwqwN/Kntmohx1oCsW6jlOtV7
 N8kWNfM2aEi6Ek33nddb+AM4IZZAMUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210064


On 10/16/2026 7:22 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks.
>> The four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the
>> L3 are each clocked by their own Zonda PLL. Each clock is selected
>> through a glitch-free mux (GFM) whose parents are XO, GPLL0 and the
>> corresponding PLL. The gold mux can also select the PLL's post-divider
> [...]
>
>> +static struct clk_branch apss_silver_core_clk = {
>> +	.halt_reg = 0x8c,
>> +	.clkr = {
>> +		.enable_reg = 0x8c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data) {
>> +			.name = "apss_silver_clk",
>> +			.parent_hws = (const struct clk_hw*[]) {
>> +				&silver_apss_pll_gfmux.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Do the clocks have to be enabled even if the CPUs are offline?

Yes. The bootloader leaves these clocks enabled. Marking them with 
CLK_IS_CRITICAL prevents clk_disable_unused() from gating the CPU and L3 
clocks and hanging the system during boot.

>
> Konrad
