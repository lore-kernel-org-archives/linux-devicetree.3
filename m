Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBC526ACC;
	Thu, 30 Apr 2026 23:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593563; cv=none; b=JwpiAfDZO5jIDO3c8UPEoQ8hr4nl40K4kpNaYomnYH/aRIjSnIhc3pCmqDFqkjbGwyYzTGMDJl8b8ptdCVpiWhiJ+h/X++rpqLjZuCifuz2lKv0dewaSWYzxU7MEDlvORfrDDAuIX7nvABzov02p5Wm4BYQTpW3lCT6Adpk4VNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593563; c=relaxed/simple;
	bh=69IY5DNP84ktIAJpCd5BYlr/Qk0JwQo5oigeV6qG9n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L99Z0ZxIevqHv1Kfd0ieRACNETFHCnpxwj/oQ7itDmB/X9apMC0iJ/hs1shymsSYgDGBz358ghykdbTBKdv19PC9YjDvMmlReV2k34akL6v/OJDH/vHeawVYxh5EgTVH7filF4y/eYGlxDOuSDpr8YddPkuDyGhdqoZM0rRykFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=UmQKegrB; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="UmQKegrB"
Message-ID: <51eb35d3-5390-4f3b-9cb7-8d289151a650@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777593558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R4x7B92IayYCVFuQQU/7cTcEQG9TXQ+mSKoT+NbYYQ=;
	b=UmQKegrBRGrSLO88Ah7CA7JWlc5RcBmrfWU2/+hgwktMY4ND6LLqYCDKZ5JsbTYLV/a5kI
	Im6F5I+jfWlewl20wwigjlITsm+DmeHT3nQ6ZfC42/BaVednF7nj/9JSQLP/aVpih2MjJ3
	K08c8Au0A9y0oSUGDc0OMwjEXLxNnocWbjd87V7qqw5GyLpdeD4wiMZBIYBN4xH7/8z1Ao
	j0s06BfVDhkBWyHa8ab3sAswsZ+IIeeqhDBlYov1kUSqGlN6ETEg5TKCkWOxCWlUj5XJ/2
	dIhVisrqyq9QhWRaNF0aWN/XqUm41Gj8K0PxelHp7h8HzadxDLphiuUrCwRK4Q==
Date: Thu, 30 Apr 2026 20:59:05 -0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
 <20260430-ayn-qcs8550-v7-3-591a96735fa3@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260430-ayn-qcs8550-v7-3-591a96735fa3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 4/30/26 3:43 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
>
> This contains everything common between the AYN QCS8550 devices. It will
> be included by device specific dts'.
> [..]
> +
> +	/* The tzlog label is required by ABL to apply a dtbo, but it can be on any node */
> +	qcom_tzlog: chosen {
> [..]
> +
> +	/* The arch_timer label is unused here, but is required by ABL to apply a dtbo */
> +	arch_timer: timer { };

awkwaaard.. Is there any problem with requiring erased dtbo? For phones 
that's generally what's done. Having junk from random dtbos is best avoided.

Also according to the pmOS wiki [1] at least on some of these devices, 
there's no need to boot from ABL at all! There's also U-Boot and you can 
switch between ABL and U-Boot at will (sounds awesome!)

> [..]
> +&i2c_hub_2 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	spk_amp_l: amplifier@34 {
> +		compatible = "awinic,aw88166";
> +		reg = <0x34>;
> +		#sound-dai-cells = <0>;
> +		reset-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
> +		awinic,audio-channel = <0>;
> +		awinic,sync-flag;
> +		sound-name-prefix = "SPK_L";
I guess there's no real standard/convention for the prefixes but maybe 
worth changing to the more readable "Amplifier L" / "Amplifier R" that's 
used on e.g. the fairphone,fp5?
> +	};
> +
> +	spk_amp_r: amplifier@35 {
> +		compatible = "awinic,aw88166";
> +		reg = <0x35>;
> +		#sound-dai-cells = <0>;
Also #sound-dai-cells should go last, with a newline before it.
> +		reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
> +		awinic,audio-channel = <1>;
> +		awinic,sync-flag;
The awinic properties should also be a newline-separated "block", before 
the # one.
> +		sound-name-prefix = "SPK_R";
> +	};
> +};
> [..]

BTW, do these "just work" right now?

If so, I guess you're lucky and the "firmware" / register config binary 
for these devices configures a 16-bit 48kHz format which is the one the 
soc driver forces.. because the aw88166 driver, just like other awinic 
amp drivers, doesn't negotiate the format stuff at all and blatantly 
lies about supporting multiple formats :) I'm currently fixing this for 
aw88261[2] but eventually we'll probably need to actually kinda unify 
these drivers..

[1]: https://wiki.postmarketos.org/wiki/AYN_Thor_(ayn-thor)
[2]: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/


~val

