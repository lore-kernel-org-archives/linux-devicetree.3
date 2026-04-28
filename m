Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F53D6666
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366635; cv=none; b=N9SDT0qvLdWu/Z5MiJf7zg1RACEVYonD2Wgvr6qWnMMF/V3AH4cjwXpJ1zz1f3b2/15SdgBU+h73u+RM1zRwwgBgF6TGxjpSaUa8GXxXK2C5g+KW6jhDsy50BwBmCgxhr6wh/5EHz+isQMl1MTNgUgFbQvteBSltsFl7BKLsOaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366635; c=relaxed/simple;
	bh=6/kXOpIPrMyYeAZQVyerbvyBh4ZULLVmilh78gfeyXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8dVAOXYchuzm4My6sIEdnt36Sio6bUoWcmcVvWaaTQ6cuJ3JVQKsKn0oTnxSy/cp8K0PSqLYOvlZOTKWWH4+WAzfKTnL/NEx6CNZBoGbll2a/v4Twowmt7aKJrQsPfDZAdoPiKoahJbPBGI4B98wgxGtzZ6kvc6FKo2d5lrCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnbT/UeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVErJX6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnbT/UeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVErJX6W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S47YFu2383065
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=; b=SnbT/UeZ9SYbGdo4
	0WzyD5jTFOmk3wtQ71JvXsSaDGkEc0WhrOO4rBTVFrbs2Yl7ChxzVnYs27d8rjla
	2TjFrPGnn5N1LoADoXEuDPOtk+9uipRVs+3UW00ztwBfY2kPIHgkz29//pU8JcQZ
	MXkwcdp+jr0K5CJWJcK6ujQRx3eIOb+2z+CSNHsgX/U+J48VsApo/HMylPnJC0G/
	AnbW5wQlEMYHWK6c2Mg2AtJrbCkMbaEPQyAI4UyBFqP7AxfpmUp52HhvcIVkr0rd
	SZg4gEsCY78pPaBtnklnmMkvBfuUcDmIxPHoWFIFPIRoKwcwB8fzQRgV6KJR6S/k
	xpV12A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xv6ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:57:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a016b99579so39537966d6.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777366632; x=1777971432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=;
        b=YVErJX6WuBg9HU1KVE6h7PaxTFMPUmZOqH7WWlUcw2lv/K72mXj8S+Aj7IPG9godH6
         7RQFGNF+W/I7eW6CPMeDqg8n57jjUdFY3c5ql9KfL3jsvZbSIg39hTjsS1I+MxDUaIHQ
         iYP992ttS4iNYSqXrWpg28F2k2W66/YREZjud1BxOlgjlWjnGWTUrOyFr0g7bRDh9+60
         CmIbPKqoqLKqJ53AHzK3jPwu4nk/ZDJ5XtUhdcLODnOfxQpRYGTbKbap4akzB+t7F6NM
         lsZNN+TaTO9j2YJwYvbJPHx6854jdJoM6RYwrRnDAIIZfz3eLdxB/2n+UFh3nMzsDnBy
         91aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366632; x=1777971432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZrIv032C0RLaUKbrdVzoDDiJxw7RgWufz1Fjh7XtFuQ=;
        b=Rw8hay3SmYTNhAcOUmC9fhPzBKVljGdO+iaeNuzQW6QQ9Edycqip0m/HYqT93IVKmd
         PmWmQ6gIPYmxkhNLhNhwo04eqTpqZzPA3ltKAxZq9yz37XHalxzaJDYBWYq4f/WhF3a3
         KbQzURTE4hez+NVyt6KV1O1l3LStMrwFc0Y3hr8FzvU5M3rVi1kl5yEw2xJ3epybalv0
         pho4Dsy0HyKkNZQa9DVtzXgtoKhcMSBa6cuJ9h/s+mv+qwcEhWRKVacoBh2y4/69j1tu
         WmYYSD5tafb5RoTc7MNlUqqjEpvR2nE9rOzbpE+FOMPwzPZAmQHC//PK3mcfiWXEBRHp
         CByw==
X-Forwarded-Encrypted: i=1; AFNElJ/A90x1sXFyrasQoiEg4AkPQ4FFvAeSxUfVGrwC0VXaYr3bwy5NZjPPW5DKwtqiez+UAeghrvUuRnkg@vger.kernel.org
X-Gm-Message-State: AOJu0YwX50WJjonXoobPMFurAqQeV64gvq0qUVgQkKK11I+jVlnXMGqI
	y/pin7BHlidh3rD4oikZR37YvyO1Mek/qODia278I2fyjAiwFAm5uXzlbq9qD1Ug0RXeYtBOBEl
	Q4Ag206DTUWpnomyVOpfffoYafc8NAf7WO+0wpdC5SR/t6YgNABf30NkDxuy0EqqR
X-Gm-Gg: AeBDievWphEpEu2FTu2pF7WieVRZMTHtnGYZZNA8DoXjso+zlDEFpDybA78eA2bQCjk
	CqRGQHNe17Sk4XDdgjSnysVo2EddP4u3SeySlB2kf6pyascJiGzjulLEJVuNFeKq67juRYFFUcu
	WkqfUSvNKjGeT+60pFWnIygeYwFcagLTMR9R+g+UnEQkfLnHrn2djLgwX+y9g6ePj2CQq+szupe
	5dWEnqk7OMXgn95I6qxTHpIOnSeNwZ4llx6i54WSz6JpK8ets1XrUy/BN5qrbfrpLtGRRBinkL4
	zzMQ+v3JQigzBf0533vu9xIRquOJhyV/ziagpxctFigxCfXC9BEviUkZ3VV4svZ6wgCJgfDUgQ6
	E9iOE9RBOAmhTMCQuu7+xEjY/VSchSy385jYmNWlxy9jcUdDKAo9RrFUPuhJ5wqXIpZ/2NnPWtJ
	chTLf+R5Lzft8oRg==
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr27568776d6.8.1777366632257;
        Tue, 28 Apr 2026 01:57:12 -0700 (PDT)
X-Received: by 2002:a05:6214:629:b0:89a:4741:2147 with SMTP id 6a1803df08f44-8b3e2a0dfa3mr27568606d6.8.1777366631761;
        Tue, 28 Apr 2026 01:57:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808a35e19sm70631966b.16.2026.04.28.01.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:57:10 -0700 (PDT)
Message-ID: <97969bf9-8eb2-4498-90bd-9973fb2bd638@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:57:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-mainline-send-v1-sending-v2-8-dcaa9178007b@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69f07669 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=J1_VKfl4AAOAIIosoXcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: MWXFwspBJbC52qYRx_CCRLUIj-fEJU3D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MCBTYWx0ZWRfX1FURjQjeDpPv
 phiZe7G/vFsyxk912OtquclRX2nmxMOabYpPLnnHykmgHcI3+wt0pWQnukao9RNxL23Cu+5qyCI
 aEbquehh7DxmtirBMDxEiGCfOboxYm4KOIgbeD/DQDZBPv+aYs8Vt3O7ikiIq3y84WjI4j58djy
 vzA0GyzV3yhM+s3z0yhV0RZG8V3wGpSu2jjPaHTEZn/SuaazHQsuC9yt7/ETF2mXOanJXmUZnBj
 bO7UpjB8DggnFAY3LDhbgUrEpXIs1eq45Gk4BevNHiCPyblHWXJFixe5c96Sej9sXofoK0MsAMn
 ahqM9EPHygBv/aPO88COtJ7beJ0bNgsyK7sK6Gs83QDozXLpFahwgdS4q+BgH0kb6A9Ize2bTlP
 eKlV1iRFd37dSTGj21GSMiR/KOkM5647ukMQtcgZ7vX2DDe+GOQub6CeP/zEmlpvrylw1XCOidH
 p0ztCrNX/lRP6KM54tA==
X-Proofpoint-GUID: MWXFwspBJbC52qYRx_CCRLUIj-fEJU3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280080

On 4/27/26 9:34 PM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> Add a device tree for the Samsung Galaxy S4, codenamed jflte.
> 
> This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
> covers UART, USB peripheral mode with USB networking, the front LED and
> the physical buttons.
> 
> Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 485 +++++++++++++++++++++
>  2 files changed, 486 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 32a44b02d2fa..c23c961f79e3 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-ifc6410.dtb \
>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>  	qcom-apq8064-asus-nexus7-flo.dtb \
> +	qcom-apq8064-samsung-jflte.dtb \
>  	qcom-apq8064-lg-nexus4-mako.dtb \

'l'g < 's'amsung

[...]

> +	i2c-led {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

Have you tried setting up the I2C-GPIO busses as GSBI devices, like
I think I suggested the last time? This will potentially bring power
and latency benefits, since there's an actual bus controller
connected to these pins

Konrad
