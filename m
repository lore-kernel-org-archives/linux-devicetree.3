Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD83546D8
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773343; cv=none; b=OwwlhuOFnz9iXd6oujp12NcLzZL1K0Yb8TWlPrrAnP9hDdw3z7CSp8MtnrpwAMlUURnpzeFFTZXx9jOlbYbcz2+NyYRRNRbvs9ZgaiKF5XUizYX0ml51Iuqns1T5yIjH3VYBw/vdd6J0GOnts4uYuOwGmhKUYHmzclbYRkhN+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773343; c=relaxed/simple;
	bh=rduQ5cDDUs+1VxSVyf2EIpzvLr7nMgBuKcN0Q/MsFTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1qwTIc5TnBw+R5zH7ecfp0Nz+m/q037pdemkBmlBShGoOwR/+Hv1PI9O2yjyk+SKaJs4eRFmYPcH6dYe8QMwFXxpXCkvevdgaOhapoaSIElFgnHhh02DraitfJuS1dpobXHFPixXibJp/X+k8ZSBJAtIizSzJy/GzAobnegLOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXK/RJ5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUmJOjZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXK/RJ5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUmJOjZo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DOAx3399723
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=; b=UXK/RJ5OMv6vsWJH
	ItapsX1fNItw3vIt5kJ8iv6jyQxSoLT9Brt3f8zpp34FWPTYJes88D2R8CYsVTGz
	OKaW/ehMv6ALgiQ+Es7ghgb7jJWDJtzxGuNfigSyP4pIuP6dqMBvLV1TUo9TpIuM
	XWNjE+Pb6IcZZrPY3Ejyjh0Vj3WUZrwBreeu3/7iDB2bxuK2tA4fmP1ebMljDcny
	qGBjjnTc4cO0rcfOnKCO9JUEGYhHhOCSfAih7OkrTfAM5fiaUTUBfZr09lZN3Ukn
	hG7osY77jGW7V0R4uqqNb44gDtt1Y2JFprIKqrkE82O6cJ1dti7nwBMfOSMOYB75
	Nmrc9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0vk2nbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:02:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157263095fso19199785a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773340; x=1782378140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=;
        b=RUmJOjZoANfzcXs5HtZ4gNaYTegOz+r2rUGO1cBt4Eoovem3jZBdKPOBjD3cOrvBAz
         1KBhYUYo5b6JLvvpWBN0FPj0a6lXkVay+sz18XTBYhToX43ocgpFF62w2jS1wUF/6Uwb
         sRxqp2mg8Peur/1TWLa4ga4Em8Jl/E8KWHhkS+wf+8kHkkTpHl6D0h+Wa9D8KGKrV+g5
         zK6GsK8kqEaxY5VgpoeDxuj9ZCVmwJYM1JnqwypJ/UqHyAdOHEbAY/wD3Y24hqOzwDfU
         Cso34F7+Y9Q4wSzWHQMQBvLla7kNDp6SHnpnVkxGmeLLK+ge4c4SvAM3a4V03nW6o9NQ
         MZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773340; x=1782378140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG+uYr7MKERBLpM0IqjmUHCsQpSpbWlGR+RiEAniXaw=;
        b=UpDRRQA+NEi+WgcAIZq3BIY8o8un/7Nkr3QXRxWxo5sqLRAapuVL/pJlU7wxCDqpw9
         n/Fdmh7uBEfmoy88T7bTLlQOgLEKRhG2Qv6adbTtyQei/oM8oEWuBdYalem4nN+gb5G5
         1WPbEC5T76wioMbhIYaroNzpSEgtCXbgRvCn4JplYrk17KWFET3uDGH2xBr3eFJdF5Ct
         a2XRqEHSXmpWuUHqEDyeU5Gakkd+D8G119oxALpgMYztlfdrVDzs4J3wvqlhNwkW39Qw
         Aqz5tw9hbisfw7U8929dVGAevhIziDrPOU43fbyBeQQJ88fOeVneXPGBS9SEH6D5hmn0
         XHRg==
X-Forwarded-Encrypted: i=1; AFNElJ9UiOvqa0wafO86erbRSpdDuxtw5otaUzKbkwR/pG0U2lcJUOhi8/aZNBJ6kC+fLVdKEfdxZF5oIxIs@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjOiluaqX5H2XcOfdkJ0kaYCFZQTqfylYjWUZ436k1SZn9mKk
	hpGYvN8M7UZMl1N0V9YrNjA+rbIUoSZzYYE7Z5Ry+SmQa+0W3/9IMdOjEfBoUkNJT56MGKvAfYx
	QXpdXuoPz6sAbnMewplzd4ts9Ov+fi/2A2a+aB0ly3/RxUiq4tjxvATellYd3qbkV
X-Gm-Gg: Acq92OFcqOQlEy92EvwHyUE+cijAJPLW3DMEIes+rFO+YtNFERmFvtBFyGYPlt1nUsP
	UX+4F8OXtOJ0XvEenu/ZTUDht++YXO2PkV9PRHPbFzMhys4lF+sGohtdtYsu7obXHTeBoGZ4E1u
	uzbJxi3+GVlGUeW58vpbujDmK3l5AakbUlVY0oxEfuTWtR5Y1NyBgTYznIkyrpIKlYEeY8ZSlPU
	jz1OmX37N2u+igkoQnSXUJGHNco1LePVN3SPDUyPIvJ1Rb9DIfXeWlrTKt517IYH/rk2V4Uw+kc
	NtqLs8MrtPTT95Rz0sdnjjyH2UUIXwQPkRaYnt6TwQ3ikIpBWzG8RXrvT+rstU9LUP0RXxMhwYl
	hKVJapYu7YZl56uSWPvSInOWa5DnNS/pmYtE=
X-Received: by 2002:a05:620a:2a04:b0:915:e7bf:e6fd with SMTP id af79cd13be357-91f28983cd4mr241038885a.2.1781773339722;
        Thu, 18 Jun 2026 02:02:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2a04:b0:915:e7bf:e6fd with SMTP id af79cd13be357-91f28983cd4mr241035285a.2.1781773339297;
        Thu, 18 Jun 2026 02:02:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6df9bsm951221066b.35.2026.06.18.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:02:18 -0700 (PDT)
Message-ID: <9fb8f4e1-81fa-476d-93c5-b82bf40a2c12@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:02:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add the tlmm driver for Maili
 platform
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
 <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-maili-pinctrl-v2-2-0db5bfc23d64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Xio8AClBsAEIeye4lre6L93fOQGDs9v
X-Authority-Analysis: v=2.4 cv=DNy/JSNb c=1 sm=1 tr=0 ts=6a33b41c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5G9UlDZQlRkejQDSHd0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6Xio8AClBsAEIeye4lre6L93fOQGDs9v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX+TjYzeSmmprX
 j59gq6T1TA517PYgIPwAxa5/n4NS+lHd419l2jkK06qMyaVENSCFvw6kzRhApN0RFRjbsmIiu6/
 dYyT9M/sfjeqgO56V8KIRP8Ce5EEVvY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MSBTYWx0ZWRfX33unwAhJUD3P
 Yw7j6JftFjXjEnIHIVNLxBo1fam1NLRDvM3bfiL6u1PIrqPtBj6jMLswYqLKVUFJ7/hVINay8pG
 WPne41iyObDgLPlIALpu3OuMqVfzDPLDzqR1l+8pnoqkOCiiDznf5bOwNlcnAsNFnrrZYQ1ha+3
 Ey2iT52htBNQH2RHivrR1DxNixgA/GpalkPIrEQ72LNU/cu3UHMrq9k+90ONNqxsnUInyJPyvVe
 7xc1SlTDqZp3MrS4u3CLsUBpDBm9PScFu9rQxWi1RkNova3UEW1IPAxp9WXtcBFsL1FHZC+TEru
 e2DQG0hStZXgrDPwZfyNOQDtMb2Kci1VamY25GEbpWuCmg90l8sl/h0wCLubSuZjLV2jkI+bQNS
 uHoA4dx2H0omGe0LWugEu/j2h8wzhnNyIvSu5TDqs/iQQROlwuEspmK8h2fc8mlF6T9LphisrKL
 tRVzpmVk7m4mvfOga+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180081

On 6/15/26 8:55 AM, Jingyi Wang wrote:
> Add support for Maili TLMM configuration and control via the pinctrl
> framework.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

[...]

> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */

Let's drop this comment

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
