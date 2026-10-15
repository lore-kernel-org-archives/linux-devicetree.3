Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3420251CF6F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074073; cv=none; b=Iyo8fb8/kXCXOeaj2tzB3r8lEIbJbI5VV6uomKvi4ONonytzwZ36TpOMQkSjevIXS96+1ll4wqLthsZqepM83EQ8q0hOZOq1omTNLW8ig9MGqfGq1OGQwfgK/vktttM6QMKNvgqK7BuAsdkHaQ1X+yYzmS7emaw6PeVJe/gHnsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074073; c=relaxed/simple;
	bh=ncDYfni7DHLhnhuLavWrwx4tMg5ek5DmP4StCsrX1mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9fS2o034zx1qtQVbPrAbS4S53Opk3RScHXrgMpCpl8ShGrFaCjB3yKT+K0VCqVZLspPC5nTlGL15vlwBvmdnci9ESxBDXSpaa/NAJyvXiajLjzlEFHpxwH3HtOcOtg9Izw9jyfmCcoVUSy8kOZckAzCxKBwS8OPWcrp1y9+Jjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5lgK+Md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkXhqb1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5lgK+Md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkXhqb1J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSrg2662666
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=; b=i5lgK+Mdhr2noejV
	lbup9Ruf9vecslKnIR9ccO/RcsFDmlHCt+gy93g7gRw3NxdsrUQTXw9zbHyVyEmF
	MbRkrXogAAEW4NI4dQInEECYglLaSQw8+08y+/KndmN/jt9aphEIWMcHrifDAO7d
	+9yLdyDIhKUJSEiApIZUFU5BaRWd9GSwHfEx86d19iDsxtxzAwY56mEDteiv7FiT
	h+Eiv/L/t43JvFY7OhTVXcadure7zwN61lKlMwVi9vyzUxYI4pzhaN2un/VRtMcj
	Wk5QB/rkkelkh2t8A9Jg6CyCS7vQxGR1ILZF7WoLAi0LN0G565U18Vw3r9CBRzo2
	NlMmoQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda2fmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:21:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0e22fe64so22429137.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792074070; x=1792678870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=;
        b=OkXhqb1JL6ct8cyRGApA5MPuar/TG+aBWM/h9aL84pyxW1/2wV7Ssasjft02jWjWLs
         Hw94nW6u67i2Wn2sJLNo9V14RAaN2f33FGiFk9rhJ891pSdLNnCev+sLf0mk+Yg+L60q
         iBKuQvn0AbO7evkQnnRVNPIUtQWraiWEaHjpaQbRwA/8A888Z024UF43Ut0GmJpx6DhG
         l0FhBzvoWFMBylex7IW479ywZFe/bZbD26XToxOwXr0jesJUawHXoKy989QpK+hRJvB0
         +WpZHaKBELkwPGGZdARA6FEojHN15jQGMTnuC3cEiOSxu3jzyVU4CpzRl76XS3s5I/dF
         LHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074070; x=1792678870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx21E7trA4uc9e24uzq3Is8WazplAsmPmxUJydtCCrk=;
        b=oMcLiFbz5VHSvJYVcNO/Ld7pCfZ+aX29tL1DfpMzTPXJsFdoOYOHQL9hAqTJxH+f/3
         OvCdPTEL3cZXbQATEngOXQesVYvSfJiOzLpe4rXnkwRPXJWgcOd4O3qOGBVGa4YZdrnc
         +fnuJJmIlv8xKYE994t8bF6m8SBUH5RZnNSSkgGfoNOEasJ9AmyZxi7/FygRIz16XuKx
         7z3pk0wClUXHX1heO9QVcic+I1a8Buqjk+shj6x4Lg36k0Xt8zTd4mPcTzJiHV1s9wsW
         h/aui40bnYYTv0gCcRDdqHgLhu4OnA0824jlTt+/dozLqLH+5PBUVUvivLchdEmjW+17
         kj0A==
X-Forwarded-Encrypted: i=1; AKwUvBx7Kyk013UtNyLWOs82tvfQKUvq35mTg8LqzJdvQ21DRyKi4oQBvUbhOxQnk6nRpGVCqZN4tu+6QY2q@vger.kernel.org
X-Gm-Message-State: AFq9FYIT9oDPGQNAHwpJ9704wNUZ989FGPVgnKIOf0HjH3xhae2Ri039
	+wIxfG88yWSvWwuid8UWHVso5T6xkfJAZnBlHZmLC26SUSEI3tOapjNDvrWiFBmnXw3Ltml0pFG
	cHPKh9y12NuOI+c0gdZwpykMp1tjXJMj/k/y7P6MZBLH2/nmAaYFsWovc9M6Q+0h7
X-Gm-Gg: AYBFou0uVS8+9Os+N8KZ7bS1u4rTrMD+hnHjFkRur5xEFCN47WJ1GA+JJ6ff7EKLPom
	lrBKpLCoubg5/ml41l/u3Fq0gJreLiS9V9EVGNIu7cUDzqiEKyUOGCZ2hSYs9/v9nhGfQEsa71L
	kEpdBeKjGTCGhfuJBLWfODMVnrNVQmTWe1nCBawc8fVVayY89qtc/ow3dtRnlRmncXWf74+WhaE
	IdzsGlEghlJ7gABlErO3blS1gnlf3TtNgUk/NOLKnrDPaUnlUnIsr6qCGponpe9bmGHbBe8oQ2Q
	b24zuJmoD1+koVPlvlxVqxMnYMIKqAvUVsGm26HaDhcgaiXZu+SapZwHvC5LzAQ2iqD8pznWOnG
	xLstYLCfXv0YVBvwo8CqAvQ==
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr4067407e0c.4.1792074070259;
        Thu, 15 Oct 2026 07:21:10 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5e91f576816mr4067389e0c.4.1792074069533;
        Thu, 15 Oct 2026 07:21:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6bea942sm131088866b.11.2026.10.15.07.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:21:08 -0700 (PDT)
Message-ID: <7a6ef006-cb76-4e4b-bd31-886af708b375@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:21:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyMdWC0Xcb511
 zWQ1A0/kszWbzgfej7gxl3BDQbo4OvnQ1eiAdHR98B1Lm4WMBGhz1RpGOyUgTRtRwKNfHJZMbd5
 v3G7uVRFTwHmzizukTWzVS0d0grmwj4=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0e157 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2d2XUzBh9Lae0zXQoI4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XwjuSPRiBp4BYF_LWV_UkCiNP31Z6DSd
X-Proofpoint-ORIG-GUID: XwjuSPRiBp4BYF_LWV_UkCiNP31Z6DSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXziIeKxErAEz0
 yDcHeZsFDnRADoTWPoxLuJybTtMZQGAxlZZLDah33rxKgszfmdVxkq5kzDqkTZZpGztopkTK6BL
 eK01yNpzAjUc2MtufjGpYrFwTGaBWTavvErwRgZrqHKyhrO5WA/XFisoBAtupKPzUqZNzZ6xLUP
 DROcWk/VVjo8j9949/CLy2WYMaIXXVC+QeffhhvhltOMOia11nQLbMaNOpVluhgV3XqoM3oeKHG
 BmRm7GDS/3xenbSF4cLZA+R+5nxsAheVFKK6qdneA6T0CZVPNM+T5qTM1cUD5o3t7CeBvr+3wMY
 iDwZR484MPxuY3vWN2J+hDsD8s/vf43KV3QWf7UiIgiEiDwYUpFUUfLOBbj/9GoDxV4mxvJP2Dw
 Fp5AydaOj1v/qcZ1UP/u2aTYIIOKghMV12agvcSswdZwJ035Gfe9MMzW6+awU77VpyQE6EQlvhV
 HQanXtFUJ0NGskfK+Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

On 9/23/26 9:21 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
> +	 */

Nit: this fits in a /* single-line comment */

> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);

Hex should be lowercase, but preferably please define some sort of a bitfield
that this value is written into and run regmap_update_bits()

You should also set `.use_rpm = true`

Konrad
