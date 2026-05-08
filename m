Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FFA3EC2E2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249029; cv=none; b=QR0rs48fTOUhme+vbtEplue6arrhfiVbq284X35Brqz02kcYbGbgTE0MSgOzHLNAPHe2nl9bR0eB1xbdcYep3UDkdjpliyUGuR39w2qaocQIxRes5SiPpX92AODftSHd7n1rfGXaQWeY8UYklZFRnBiLgH3Vehy85Bt4t2+vDoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249029; c=relaxed/simple;
	bh=tVLN9H4wXbxCspwoH2tS6QtKKtprn15Te8BRG+V6lVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxAMFwsWUzsWWgbleY9TBbydG7ArewJh31Qe7Buvh4XTRXwp7tEHEl4oXxSnaOKa0znHO+kpI0jBgpc6A1D7R9qA3tsJGfuOx1UUEvD3FeuYDQXfruIlygfAkJQpArz1cm8oZBG+zYJABchT8GQFR3TSr5r8OLLuuZkGfqP0XbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/sY6KHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAgxulmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/sY6KHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RAgxulmI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648D59C51062071
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 14:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=; b=A/sY6KHYIFcKhS94
	NhiWomB1DvClA0fBtyGO6SgZcMfBuYQ50w+MPtem2yUW8HZxGwFdM22iBWMXYWEK
	SPLwfIZ7yqcelZQLTFFzBrIEfpTVEPX6pSmM8dQ0fLc77cdDpBzRCkgOnUQXs5xo
	hrvbnHXiC1I2Yf+kaO2ruFaVnrfojf4/+Rk9k5No29B4iwKmlAjb0mIp4lYGLjHK
	jMfMZHNnUXlr1+m3x4NrTHDxRXBgOprkfUICLIXLX2sj+tPP026KpsDia3MPJNCK
	C102f0AIeG6Q9UrWboM111YS23g0oJyYeng21kCsv3dqgcJYLEx5N+4tbmCl6Ftg
	KRL3NA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1b3fhmtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:03:45 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dccb22cd54so513154a34.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778249024; x=1778853824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=RAgxulmIV9ITf0LZ0rgjIy+Y16/dkHdgdyAIufxSZKriKDoKOSsmzlbLh+ncsMyfio
         l+MkwJ/xTaIFblmmAnw5HzLRHeHxPnibebOXl+2N7NVvXFR3VK10pfFCWw4RlT2gYq1s
         5+eCTX5FmlTtX67Lx/eY+cTysulXK97B1iSDWTEbDH3N0BU3Sk5nZ67bny/eY6ssvwcS
         59Iq636N+RssjJhBRVfuZ0oD5jGmdv1YJZlIqUnUrcCruRlsvnORnrRN5pRlhc9/TR7p
         rVcUmGhMnJDaRalPmFgb3ngd0aailqCqqzWokZh2QlvE7/x8yJ3qvurDNQM0WxuSkXYM
         fzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249024; x=1778853824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PaLrzZ/Tau/BNFGUX9KOBZJHsqcYNs5C4hkDbabRvQ=;
        b=flntd7rLgXwBr1c+70va9+oVEacLG0rav22+YDYt6bjV9ZMsnpkvcQy+0Myvucqnoa
         NfOLgWJK5qqqXBkquQgrqZzp85Ic0HzttOylyJ8RHybYyuDbr58K6vhQClSeMLKIc+ha
         dQmS2OSW0XayTNhV8hPWTLCrJcOEHt8u5kpAuDMEnwKkiqAFM6XOOXzFOWrcy+xJ+4Mf
         Y5SR+6q5kwkMPd0jYaaPnAxzQuTBQ6awYBZ0yZ03JCI3zKdI0hbyFmoDdJ5m35w9LAtN
         pP/rPa3nDW6LL6xX+H2UcWXEb19AUdjBcsBf0ctIaetCp34kwwnSQ4S10erjhwQ6mg7A
         X4iA==
X-Forwarded-Encrypted: i=1; AFNElJ93O+s8q8Ueck0ulFsU0N8v+6OlJxqV6p2H+UKzKde9mr06Jn3p2bNEyNVK1etFhor/Ru0UWBH3Dizb@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSOMfiYH/9f6AmOA2ORRvQpP73GxnNI4dBztmbgrIpbXAz2vD
	YcwcmeHhs6vGnVayu25sTJ6xN+0d97VzwIk+8/HnbwsCXVFnIeFivF4TwxHUnY7D0xxXQOH1taK
	DIJLSxB6RWxBNbEzyt9OiCae/jRp/51lD05YTTZB8p2QXInrR+gELPDEnQ2KCIxdI
X-Gm-Gg: AeBDiesYoD2cdKgbv8wHv9snhJAzXj0Q8EUYlBPyCABINJ3VEaUEM5QmIVWNvxVQrTc
	i1ZTpdav7QzoQWRKo16Nq6ceQWdvJryPCs8IGpU3lvcsVg8x90ruvV3ywq42bnHAyJmuk9EfmzX
	ukUUCl5hMS4BkWlnRcj5bDXifsId8M1cAPlZaXgM/sycwLkz9h0Rjuz5riArp4oIXogs8kdSyX2
	YtCbFHotlCrLVLv3GBQtwz4yQxv9hcimpSH6To3EYCrbf8ooiDv0ePBalREVhnC/zzB0hIezG80
	QtCjUmhdIp1+/V1JHXQizNZPYfAmEZTB/XllqnU5lTtmcmLTMgZk7Et+hEedaI4+kwgYDkHf9eZ
	syEbuN/jGM59xx1zhgk/Pm8tDUc2wMTsbMJmvsmnh7lbjoHWfBSWop5aCs5880v6s3ZviHOqGJ4
	IXAXI=
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435657a34.4.1778249024147;
        Fri, 08 May 2026 07:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:2b29:b0:7dc:c31e:7823 with SMTP id 46e09a7af769-7e1df018fc4mr4435567a34.4.1778249023494;
        Fri, 08 May 2026 07:03:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4358cedsm87169366b.47.2026.05.08.07.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:03:42 -0700 (PDT)
Message-ID: <01d6ea18-e022-41c7-a642-ac0321957923@oss.qualcomm.com>
Date: Fri, 8 May 2026 16:03:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 12/12] arm64: dts: qcom: qcs6490-rb3gen2: enable
 TC9564 with a single QCS8081 phy
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, maxime.chevallier@bootlin.com,
        rmk+kernel@armlinux.org.uk, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
        gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
        a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
        boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
        chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
        julianbraha@gmail.com, livelycarpet87@gmail.com,
        matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
        prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
        rohan.g.thomas@altera.com, sdf@fomichev.me,
        siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
        wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501155421.3329862-13-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7ru67FVJRBEAlis0289ndYN6x6lyEbAi
X-Authority-Analysis: v=2.4 cv=YMOvDxGx c=1 sm=1 tr=0 ts=69fded41 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ee_2aqc6AAAA:8 a=lW0hg0oAPnnF6MRRTAsA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: 7ru67FVJRBEAlis0289ndYN6x6lyEbAi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE0MiBTYWx0ZWRfXwnp3QIxxvuIe
 5RFy3eeM2iwgOS9kVG+5N6jd5PtshZ2nTy/XgyUT4NlKv6w/+MiN/PKjtsMYbe98xri7LdZ7qB7
 opyrsO+ePxbNwPAdOZd5UxVhtkbhfSqm3gNeUY0lrw8WxKOHukod8Plqx6UQ3R2N9VOWKrWrx2p
 H4RI9Mayh494DIHNnzy0GM0HlAsZXa/jgRyqO4XwfnIB6yUzxfKjDngShdbz/TCQA2wb8j8SvaJ
 NWV2vZ1+mpYcNspF5v2FKDR4mlPGbGh13ZVFnhVaaLAvSrJnglT2gOIwzimwG5d/cv1DntrQJwT
 3nIFjFFyE6jvCCz79bPRAYhBXsG831SSwMm1qvtczcC0SdZsSDhD6nob0PfUQjIiS5k9SMzyeAn
 q+SwsIppdUrYKdgBAe5RocjLkiQ2XYULWxLt6aSmEjhBH543yWmMic7RMNe5qUsrGyYHnhK5tvs
 NjEhEvez7XOh8xVj6EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080142

On 5/1/26 5:54 PM, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> The QCS6490 RB3Gen2 includes a Toshiba TC9564 (a.k.a. Qualcomm QPS615).
> TC9564 is an twin Ethernet-AVB/TSN bridge with an integrated PCIe switch.
> 
> There are multiple builds of RB3Gen2 with components included/excluded.
> That means whether or not there is a phy attached to eMAC0 depends on
> the exact board. However all versions include a TC9564 combined with a
> single QCS8081 attached to eMAC1.
> 
> Add properties to the existing PCI nodes to describe how the TC9564 and
> QCS8081 are connected to each other (and to the host SoC).
> 
> (Note: "pci1179,0220" is documented in the "net/toshiba,tc956x-dwmac.yaml"
> binding, but checkpatch.pl doesn't recognize that.)

This should probably go under the --- line

[...]

> +	qep_1p8: regulator-qep-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "qep_1p8";
> +		gpio = <&pm7325_gpios 8 GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

If I'm reading the schematics right, this is only required for the PHY
- is it collapsible, or does it really need to be a-on?

[...]

> +	qep_irq_pin: qep-irq-state {
> +		pins = "gpio101";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;

There's no pull-up onboard, should we use the on-chip one?

Konrad
