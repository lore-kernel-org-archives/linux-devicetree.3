Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8323328FC
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618626; cv=none; b=NEucBMDDK5BSqJ9fV2Cji03/vP0PzceBC1QXEy8GMD/id45nulslWQwDAU2twJ8AXEi2w7/+60Lbf2saz05Va/3Avqf2XTUhgB6/941gsqO7UCOVAoStpVgfF2Q2JYcbj8lm8eKqHy4AaekGjwnu3Nf+O06pjroLqIqIb0kLC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618626; c=relaxed/simple;
	bh=07lR9MD6EOL1AkEoRnSi+a4iCatPD8y0LurVYggkT9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFeMWehQiiUxtOntIrki36pjSxqMPwn2nE+S+iIzAnCrtNOw1xW6ttVl1s6WEQlCT6K1jJWa3aA4TFh2EFggEc2EJH0eWL52JmP0vwqz9otRBBTEcj4cgVs2s9UYMg/uQL28sfSXUOoz1u580BG9vZZAvjDHVF+nkOXGWw2SPP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqHFBSfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e0/5u3/m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqHFBSfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e0/5u3/m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GDxcwV1934839
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=; b=GqHFBSfSERhNjWwq
	zqzYOC7u/tCyvVkh4r/rD+u6WU0mHxFtihCHqa4sTzb7VHtAiDkGuzVep18fBJpT
	/u+zu9kzjxaYyKw0/Tpgqdqxuxzok48ht/wVlkOzQZvXz/8Sk/cUVPi5e4uBCfPd
	QqtHkk2CO8bdZhJvGoLGEg/JTI99W5V5wgucu4cfKYWz6a5JORl0MHUF7+3P3WWH
	OwnXb14GBAoM7UwjF6Nr3em9rLpv28gP593am8+L0Cefyk6p12NLClob7mMrwSj1
	470GIhFPznzSHM9H+HJJpZTPV/ghRl3t+v5lVHDF92HcKaVM2fDHD9bZHwXyCdVm
	NqfZzw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct1amc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:03:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36c4ff06f0aso1069122a91.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781618624; x=1782223424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=;
        b=e0/5u3/msxH8IS+djVqCxpyaTixQRLCnfHp+izYfxlHd+aR9XbNWtkMgXF5a+GLE3Y
         7An3nvxikZTpNF8ab1GabzY04QLUWzOReJooPNDITlx3N3pjuP8EUyDsPQukS+OFliHn
         rNK1AOS1QdzZCSEhCtN4mgfpmPr/+H2MLjTSyIBLwVjJQXfaDr0jvvksJuHMVs6t1/hg
         Z3OGWzCsTNR1fH+hwXFau4jEJ2u0V2QSYyklZoCk5vSrIWs2coLyqDJoA77sjeYL7il7
         2nevlvsn/3IUtYucT6tpXoGKKc80O1BIPtBLQTFhphUslQKimzrc64rJtwP6/T4iDlOc
         mWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618624; x=1782223424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILLa29a1him3F6rIENk8jXqD7HDozP0gg2rbGt8zmMA=;
        b=s1AbymEJiaizdN9YSsR4/MbZ3SOiD4M/Jw37el/JoOMdHlkka53c1HP7fJhHNYNeUb
         e+stZ3mZOAStDBJR1C8ErJxPWl4xHHbP3K+AF0Awwbanzz2odbzUVp4kUMQiAr1rDOgh
         s9QRDJAARrtxKevWp3wufPyWFQhM7+ix9WJ2tm58mIwi5gvA07vAgBA2hBa9XfFUDN7y
         zGOiMPMafiWgUXAyuRN6ZChYIS4tctgRZMuf/fPdRWDhrIwcyjl+R0PsXGBpuFHGNdP4
         IP9uVQPaa4Z1NiCxPnw+Bwwo+mor3xL22V5hIcqWBxNi4Oe7WL88I9JMPFQsMmAkdBWd
         ljTQ==
X-Forwarded-Encrypted: i=1; AFNElJ99I+0h/olvA8Zffdi/G4iAFa40KdnjQWyxBTDftWMaF0TtMjPbU5tZipkwPdcfLVh7E6BR5R4zeRZp@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxG40o3Thyu/VHcxntwVWwouMGLThwdD2Xi0e/b0VAUakZvQm
	uY6SlR0NsHy6kPmp/VQ856pc8+YpCwIGsDmPYzZuTWAa/fESRpa1QM+cBTGmsByS8Hhpy4nP+A0
	wPDSRSYLWFEhRm/AujnyUyz3nWjSrVBndqN72KGgHdfbCHQ0drqafhRg4hRvWHdEr
X-Gm-Gg: Acq92OHCqC8C2xRW9KGgHENH8/k2/5euUoF8jm3KZg+SLcd+zbkJOvJBZ3E0frewRnC
	0ei3Kru8zbGksqsmqRcESGfy7ADoGh/08CGNPDs5kzY/HXRQjJvOb6xE9XjXAnsdIIrzb0GeEBc
	d3W7DLilpipDpgMWsrM/cOc/sfke5KBMr/7V/eRCB5BdcDUSgnZ7vsAT38Z1a+DwjrgGmnAmk9v
	KZOsUl5/Oo/Vj7+53EsT+dqMkrR86U1XviFo8yFiN1b12kxRQ0AFeYjnWi9Jlg9RpWWoA2Na89/
	bEtJi1yp6AcvPABrtmJyiDKBkrzIYJ8Q9jTUNmQZyztWx3pW9NOMB28xmu3Xp3VLkmrs5iLzZsC
	rC4LR5vH1yP1vWglniYXxmVsF/QXopWXUKuSrMGu0xdyeiA==
X-Received: by 2002:a17:90b:3807:b0:368:e6dc:eee2 with SMTP id 98e67ed59e1d1-37a036e9f9bmr10217650a91.3.1781618623542;
        Tue, 16 Jun 2026 07:03:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3807:b0:368:e6dc:eee2 with SMTP id 98e67ed59e1d1-37a036e9f9bmr10217602a91.3.1781618622921;
        Tue, 16 Jun 2026 07:03:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4d1b856sm650766766b.20.2026.06.16.07.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:03:41 -0700 (PDT)
Message-ID: <5dffdbe0-cbb9-429e-ba15-0afdf6f20fba@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 16:03:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Add glymur-qmp-gen5x8-pcie-phy compatible
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-1-269cd73cc5d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a3157c0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pC5mqZ74STFJzzCMHh8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Eg3uIqSy1U87egUUOhR8ojxtYTjE0IrX
X-Proofpoint-ORIG-GUID: Eg3uIqSy1U87egUUOhR8ojxtYTjE0IrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfXzBC5zxRNheU2
 UOq99v4W+waaakKKVESF1vx6WiOHpP3W+gaSD6GSD0FxxHPxR53+LkSMl5TO+c0aatAf1Uy2ige
 r+Gj4ktomZDWj5Y+kQKVGQRPFVvHgqJsj0QopMX/bcznQx3vt1JEbJG7q9MCt2uxn405jkBGvEv
 vSkipEgByo6l26gdg/4iXx00HwLI9TAOhUr1uYYDIYDUHd3FfxYuVyzgy5MCoezi/ywELapAjlZ
 zoyLVmE+a1X81gp9GHzl+Eh8T2tkqVU/Bddek0nhFe4l+WZPi3o8UkPSRNyyVxuJs3O8bPQ+T7+
 PYuLcojQLzJIEs95m33trGIvrhJNzZqXFYgxqw4mifncggJ3sp6LtF67v0uyOmL4aNAEvUpqEzD
 R8tMXhCFcLmaFTehHw044Oq1v2cmNNReZ62+khQW7NUNberDGEZCmNixP5ZRfyRx+vde+un7ju1
 M4/UWGLc5Xh/1lY/qfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MyBTYWx0ZWRfXwsDiNVUhAMAe
 mb8OsMaEUs5nNdxI2r+pM1urktA6Msui6pA4jVOzhZv8ND+KOg7rya58tfT4psK32M2Y8Jt7Yrk
 +zaA8+yKPSZbYzUz9hXZXir7Gpy6XfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160143

On 5/19/26 7:47 AM, Qiang Yu wrote:
> The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> PCIe3a/PCIe3b controllers. This block supports two link modes:
> 
> 1. x4+x4: two 4-lane PHY instances are exposed
> 2. x8: one 8-lane PHY instance is exposed
> 
> Add qcom,glymur-qmp-gen5x8-pcie-phy as a multi-mode PHY compatible and
> document the new link-mode property, which selects the active link mode
> via a TCSR syscon register.
> 
> Document the required clocks, resets, and power-domains for both PHY
> instances active in x8 mode. Use #phy-cells = <1> for this compatible,
> where the cell value is the PHY index within the active link mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> @@ -68,20 +69,29 @@ properties:
>        - const: ref
>        - enum: [rchng, refgen]
>        - const: pipe
> -      - const: pipediv2
> +      - enum: [pipediv2, phy_b_aux]

I'm surprised to learn 3A doesnm'doesn't have a PIPE_DIV2 clk.. it does have
a non-div2 one though.

Seems like it's specifically not the case on Hamoa and Makena, so perhaps
it's better for maintainability if the Glymur list was separate

Konrad
