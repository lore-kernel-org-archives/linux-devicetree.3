Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51AB287268
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011545; cv=none; b=XG5+hBDzWJGBEN5HUKbDjV3FlCkBNE9s1J7tnlSFQE8WNOztdJD/83nlLCsZFCYSgDKq+9gz/SYWjTjD2kVNQH98yc0+JOMtMjzyiK/CdOYILZai4QoP/w7uDgZlqO9QfVTyiYjBjqvGNhVECqE9FW08txfTEH5eGCZF18KNI9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011545; c=relaxed/simple;
	bh=jzhsn/O6XyLp+WT3Wx18KSisIedMV1JTeNkm6Z8hpCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFdjjnfTUbGgBF3qkmLX4SjKBOmuExjVl4SpDA0FrDkj/P5zFrGDhKhcwVOK4fi44iXtLvwIfeMhN4Gb9B1EMhPYNu22PET8+1O9Fxi5iaI5lEshOOg8hO8bFIy1trtrhZGY87XykO9eZYnNCmZjGNYUwGT+Qdw2WNCv/mHVFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACMT/mhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pa5IgPyW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACMT/mhw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pa5IgPyW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClKXe652203
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=; b=ACMT/mhw7ad78tP8
	FPByep6d3VxI1PUQn0qxPNEsBga+zLlT4gewTXiGazFLW7i3oUlylKRkjSRF7dy1
	OEF07umt2JG1RPsMZ7GuR6hZg21f5aHhbk/PCNeGefuQlz9OpdopG5YeH2uN00oO
	VphH9gc4oyDxlIvBk4C0hnmJ3tGlHfoG6T655JKHwApUH8XnB2O4yk20rgAbsAMp
	Z9LqNTckFJd1Oi1g8QyufQg4CCyceO+phGvZt0kxjMBg1GvWWGGpKbtfIDEJs+D8
	a5wB+F1tevrmK7gocF18t9o3mudVrlR3lM47JhOC6aGOP+wMFT6E/4LalcJVH7Pz
	tiiMAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0ssc7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:25:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b12d7bbso9841611cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011542; x=1781616342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=;
        b=Pa5IgPyWEh7GD6cjpscL8WIQ0Zak7kzEftkACvHABAAmV/LVM6pSBN9auGU1kelb24
         GfTa2iu1Fb3RDMNRO1vgfDKCNveMfe7QlFFfoMcchn3wuOuLlwMgkqVp/pFGnBJQxFiL
         ngohcyct+sebqHwtdggebh2FcV9Aqn9q+hRk9Kd/SKeiQJzJ6qdwYThvNcz9it0nKUkk
         /5h4PEt9XeRQG4/e7cWCKtakkZSqaGPraBWZNSvTUfGp1REZG/QGHp1n1ZThEoIaqxvU
         JxWKY+l4OfFkbUNXP7ZdWGIioPScMfhuzPul7c8lV2N/2qbzLwH41QbD+dIO7BmLKFG+
         YsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011542; x=1781616342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4il8q0fdu1RbUBbkZZbrP3BbzW/PKmlpDX1qefse54=;
        b=azftEczd6SiQ1NAUl6qgT5EFYBQ5gys5ed2VrDFDDFurroxJAWU0VkQAwY6PQXD0Pb
         eGh1E5wvv42UvacNJGppPiu7PNi0XR78uWF8oOkbFRYzEYYHtiyk4cm30A1ZNsgspKFn
         l7a7mYraD6ftt95VA0BsSvsBZz43i2dhlNkxUzbLY/1RbqPHXTo9R03EqodHmA/KjzXt
         qa70grJlpJHvSfpdoEk+mWLu/6npd3IzgwiVYsdKrQTgW65JYCeMKh4puMK4cseUfjRS
         AUCUhqPPc4w/C71Hqf0YCG/QJ4FMQesuKltRcu5n22TuPbL7tgODEt2WMQSXR/gz1yZ6
         AX5w==
X-Forwarded-Encrypted: i=1; AFNElJ+HHYRYYNrercLFNHNhhv1WljMMPL8wwsMbvxJMTceAZhSxaZoPfOu7tCOW3tEBXrKCnqivKffQJpjN@vger.kernel.org
X-Gm-Message-State: AOJu0YztN63aeVPLMdMmdrIyqfyx5UBPPPKlLz6xhs5EbKKovsJ6HsJB
	QvNrmZ59Zdn9M/l63dFYjii6vh+o7/xWkq1MGv53tkuq45mOiqRALn4OB1XE/8v+vJCVd7l3y8L
	zTuREsNBFrwsC1fgEyq6uDsmM3CsI2xsPxxdgGAcSZiwAetxlY7G9seU2tuhgcM4hTHwwLdRW
X-Gm-Gg: Acq92OGywt+tTA24z/iB3YcF00gBmS8ZCPWHIXCqpdpV7b0FPY9R1O/mshocXHG3Zmt
	qAt9KV6HkqdEydjezkfednxA+Cz2Bml++ORgmnqA8yDwoD9lElqUNAG3en3KQIsHAufHYm7SA1j
	Ekjh30BHqnRd9vkbvx0mqXnwbrWW9xDj0iWusAhlbinLo5QeXwsI6qK9E6QsuubLNZaewCyUgx0
	DKk9olYtN0a1Q/jD83Wo8oyzUArvcuvjzSuSQtdwBrbLbG8RJnFCcjUxaOPp+Z7gn0b+VawT8uf
	qzLIW47tg6kaWX/tRVGCLvEMFUesEtdoEJ4U7/99TytOA5sG/HAVWjPLod6Lq+CFz2VUmdUFzzf
	KSiDU9tOIZj3D3FzDJSJt6Vt6jtxKtW0vTG76g1QAudINUplyff5XdkdD
X-Received: by 2002:a05:622a:650:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51795c6ecdemr167578881cf.7.1781011542089;
        Tue, 09 Jun 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:622a:650:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-51795c6ecdemr167578321cf.7.1781011541522;
        Tue, 09 Jun 2026 06:25:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1051546966b.11.2026.06.09.06.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:25:40 -0700 (PDT)
Message-ID: <03ec182f-b1a2-4ebe-8e48-9e88168f7694@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:25:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX3WN3apO8b6Cp
 v0fqXI1XFTsnesN3QGzPF/XRw1L9YIQ0bqzZGqvfsfbWeMaKHFjkREDQlX9sbODMzPE5O8U0zYC
 CgbNm7fK2DmIU3X0DS2y4lkn06Nc3PsyZTEOPDYcOr39ICfwrKPH6ssl/YowFiJVaAnpD4YDHWY
 i58oyLIQJLUjXuherA1iDGFkP2GPPctTmdI0UlSfO+bOGFvtagQ/s6scpj89qwscbK7Rws0fbka
 6hNBA2Cew6X72AO+p5rGuqJvF1jyBH+YPdRpBntyo4sQ0fWda4wafZuGQBduk7sPI5rSQyYpCa9
 MvWqvo+8LdeT2hoMsOTKB/LYa/eUpekNWzU5padkcM9p/sSN29HoC602ryrXNxY5LckBqKz02M9
 //xWECsQKFeyDdD5he2AqLw8ysCLZuYaD1HU7VesXJMTBgYrqaJgFKTeeMhuvOVzVR+TStxeenW
 V5yXSmANfJWa7Wlf0hw==
X-Proofpoint-ORIG-GUID: kEjxvZdFNuG29mTwNNcyOTpcoeXqAR9e
X-Proofpoint-GUID: kEjxvZdFNuG29mTwNNcyOTpcoeXqAR9e
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a281457 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5seiv-aHSsnqfVfbp2gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090127

On 6/2/26 5:21 PM, Taniya Das wrote:
> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
> clock divider. The hardware generates a fractional output frequency
> from a fixed input clock (typically TCXO4) using the relation
> Fout = Fin * (M / N), with duty cycle controlled by a separate D
> register. The clock output is routed over a gpio controlled pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]
> +  clock-output-names:
> +    maxItems: 1

This should be deferred to the driver

> +
> +  pinctrl-0:
> +    description: Pin configuration for the GP_MN output in the active state.
> +
> +  pinctrl-names:
> +    items:
> +      - const: active

I think these 2 are always allowed/defined

> +
> +  assigned-clocks:
> +    maxItems: 1
> +    description: Parent clock phandle used to set the input frequency.
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +    description: |
> +      Rate for the parent clock in Hz.
> +      Supported rates: 19200000, 9600000, 6400000, 4800000.

Likewise, we could simply set_rate on the GCC clock which is the
parent of this one, via something like CLK_SET_RATE_PARENT

Konrad
