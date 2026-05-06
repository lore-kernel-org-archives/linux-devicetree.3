Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC573EDAD7
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 11:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778065637; cv=none; b=HmAAnSvsMWlsrKW8BdzPKajKf8/J4U68CZcTjAuK0oQPZZhGdhVJH9irwLVMrA+mjLCJRl/p3wLaaVF3fGFSiqlQWNB5sD247ILaIIyUb2jMBvE7KVaWmcljsXljLyDqdRBdrGfubrAE8RYtP8JfqnFb+b9Hj/4Pshg72DYeZQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778065637; c=relaxed/simple;
	bh=VE2loX7GEHkLBIkfThKrvN6f+NIyZbdVKwUIZSotPoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+yo1TkNsg1T6w4eBu1b9n/Xpfqh5tv++kMXOMkhkPK++dO2H5ETYzKk4ujm8Ims0dA/YDG+FxUSxgDTItg2p99q6zfzNJZSz3VMLgoqcs/b7MM1dNRUTeQgTowP1qURbGKdFf/jefAFdz9Fejs61vAr9MHF8uwwlwtbtc++Ri4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyEvSjlJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyEvSjlJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a86e4b950cso2744433e87.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 04:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778065635; x=1778670435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aSXiRsYq+8taqfodn6O3tOJPun5BIE/c43g1ysDqCow=;
        b=jyEvSjlJre2yiqI/y4H+nmHEwcqNWsZD8J9bzWDM+Cf5oJCuMg/FzlrwdjrFFO9ii5
         UJbxyK4LZ0SbHkNzipLdKBoaxdIMdt+6SC1RyGiOMsCNO0sAZpPBsgyTt4H5dPUrwCtD
         J4zBIAzusHpgp3hgFXkxma3Yy5Fcd3fL79pZxLkUjsYgQ8kzPGsoP/B8dtu6V7G378OH
         XcKAnZNmJ5XyjAKkuNCHCrDf/mPr36ONlA0rVvFfn+LnvYLupSe/E6K38fK8lQnro4ZR
         xKrmSBCxYSlpKvRLGUBMqFEymYaEf3Gwmva2sfteRAKY0lz6qYYClB4piASTMgWDEcN3
         I7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778065635; x=1778670435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSXiRsYq+8taqfodn6O3tOJPun5BIE/c43g1ysDqCow=;
        b=HmLROz2h91XJS8msw+NfTdHaRT1sfibWTCvExss74pCkHZhU0wJzOJsLC+PCo7tgID
         0CacsCmiwzx39/ji3v2B0PoUOFd9z+0NApEo1Nr6chiF2vkBKi7Al37TUAgIVGqFvDWS
         f6U8hP2SIWziINt5yjNSSLDXLgFAA4UAEPrSLEYZ1qXV1s6J4uHMbYBn+tsfpBDCBkOh
         naQ6SLlimz/yU6Y3E3hgyPl9fXIun5qSZXzeNULb6g3kvWRcdb1ur/PB0EgkoIAUxaCT
         xXq3iA6VCd/fnotiP29n8FDoNV69rHp1C3mSq0ksogg4+pmtrbhFBWpMF3B1kEeeUwoq
         xThQ==
X-Gm-Message-State: AOJu0Yxi4wGt0tQcRL3+RGT7R+/T8NNuLlt+Z34YTBlfJHl+D1spHb1t
	XnlKNf2IsrJofreLZ62Wo3htce+uHn3bZ9L4bi2lf1lk2ZuSDfh4/2EY
X-Gm-Gg: AeBDieshGak9KGxxCiX+fA3GQLlj7K2tR5GTLFVh/Y+Zz5LwVKPK4T41pLXS79Dv4zU
	Z0btKk4ZCSIURyf3egMytodebFG8ORvs9DMvhVK4OzCmwf3gqu/XlctWPTAVhmV2RfvWXvmABFE
	tWw/dElX7XV9AWKUwiwBBwHVSCSDsQAeSXWyFu7gKQuwoZdWN61lyT3LoCkQzze5zfWOTIvt4KG
	yW4yCY57w7ghvpn+vipiyfkgoqhvwVXjWi0ImIojUMhFYsqAPZvX8guQALorOL03K3b3F6x+W0F
	MnHA5w5oEb4DMzdE8ly8ypYzyu47rIF1EK00lv5SAbGqVnO+h/t/uSrJqjIY7GElwFTgYeNbQ3h
	FFEEQ0VMTmXqq1JXgWwcN/cTWGPF+xR5L1mMoNtOj+35QeU/uBVlTjFOJl4eboFWm6jSb8Yd90B
	LXcyebmkJ2qDp5RrgYZuIivPMIwpnkoaSXKvL+f6DOLI2FUgv7ikRonWwR
X-Received: by 2002:a05:6512:692:b0:5a8:707f:904 with SMTP id 2adb3069b0e04-5a887a9a8abmr1144133e87.0.1778065634368;
        Wed, 06 May 2026 04:07:14 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5a8616598c0sm4343635e87.83.2026.05.06.04.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:07:14 -0700 (PDT)
Message-ID: <5a3615d6-e203-4728-b062-4dc827d370df@gmail.com>
Date: Wed, 6 May 2026 14:07:12 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec
 jack detection interrupts
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-5-ivo.g.dimitrov.75@gmail.com>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <20250122164129.807247-5-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

It looks like this patch from the series may have been missed as well. 
Could you please take another look and consider merging it?

Thanks!

On 22.01.25 г. 18:41 ч., Ivaylo Dimitrov wrote:
> cpcap audio-codec supports headset/micrphone detect interrupts, configure
> them.
> 
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
>   arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> index 83fd58157579..73e27b95105e 100644
> --- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
> @@ -69,6 +69,8 @@ cpcap_regulators: regulators {
>   
>   		cpcap_audio: audio-codec {
>   			#sound-dai-cells = <1>;
> +			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
> +			interrupt-names = "hs", "mb2";
>   
>   			port@0 {
>   				cpcap_audio_codec0: endpoint {
