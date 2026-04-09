Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850222A817;
	Thu,  9 Apr 2026 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775736937; cv=none; b=nwpqxzVsDZHceycAfYjwbSoI/IFDbhxxFUeqFqX8V427WxD/g4JfyFupRZS2yybt/ccdPtrPruHHCJ9lciMIqxrEi7G7zyCWQ30L/NrvDGinuoakJyucx/fELSuDqpC1qpCewOtVQzY3lHRmlNEKSYwAg75KJIMHe9+FZcMGEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775736937; c=relaxed/simple;
	bh=LeCW2P/szJe6cVudyWtP80LMlbY6d4j0KunVlklwTXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPAI8Rzuya5KpfYnwdxcz2CpdcIFDWOySOcy5KMV9k4bdRnTGkGLEhA14aWatEaD4DRtaHdhdmXzDO/4Ar4JXcUCWdEgTWLm5qcZgJXNoDSBJ234tdKE4TXTv/rxH62Wby2a1tbw+QbqF0WGSzXpfLLk3gtYM+k7uqtPw4z2ZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cahYN4is; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cahYN4is"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4407FC4CEF7;
	Thu,  9 Apr 2026 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775736937;
	bh=LeCW2P/szJe6cVudyWtP80LMlbY6d4j0KunVlklwTXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cahYN4isF4wArBwUKnNVy5lfqA30WZJbQcrUj05txqAkLzrZMleHCmGo+CPqJ/8S6
	 FxuyL2bQycr7XVw1PlWUOg7H7xSr902/7CFOFhAF3BuxnJjO9Djo+OZjXmWqPQE70T
	 lH7Lj4XaObRfvZ5ek3orCsnIfZzs93ZsIwbTltrUmdn6TA9ul/YP07C9wsAa4v7Y15
	 dWaIE+cvkV+oIn0etM2savnaNOD5G9S68zp+AxjuxLgh2MGKggC2wS+4KD1G3Jglsc
	 3dr6vczpOA/crzXAhrrG0CfBm9my1CVkrcYLcxYvJvRI3iI3lSpFc1lqxSvZzjvPnk
	 8+K0JONjvb2jA==
Message-ID: <2aa66897-12ce-47c5-993d-e9e1d01a0cdd@kernel.org>
Date: Thu, 9 Apr 2026 14:15:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add the otp nodes to
 firmware
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stefan Wahren <wahrenst@gmx.net>, Srinivas Kandagatla <srini@kernel.org>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de>
 <20260408-rpi-otp-driver-v1-3-e02d1dbe6008@linutronix.de>
 <20260409-imposing-strict-snail-5d2a6f@quoll>
 <adeVWKcQyfkKKY5J@gregor-framework>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <adeVWKcQyfkKKY5J@gregor-framework>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2026 14:02, Gregor Herburger wrote:
> Hi Krzysztof,
> 
> thanks for reviewing.
> 
> On Thu, Apr 09, 2026 at 10:15:12AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Apr 08, 2026 at 10:00:17AM +0200, Gregor Herburger wrote:
>>> The Raspberry Pi 5 has two OTP registers (private and customer), add these
>>> to the devicetree.
>>
>> So this sentence confirms my question on bindings - your device
>> raspberrypi,bcm2835-firmware has these, thus you do not need these child
>> nodes at all. Neither compatibles.
> 
> I dont't think so. In my understanding the bcm2835-firmware does not
> provide the otp registers but only provides the interface to the
> registers. Though I don't know the details how this is done but [1] says
> that only BCM2712 has 512bits and the others (like bcm2711) have

Still the same. s/otp/interface/ so your device provides interface.

> 256bits. So both devicetrees have the raspberrypi,bcm2835-firmware node
> but only the bcm2712 has the raspberrypi,firmware-otp-private node while the 

Why does bcm2712 use bcm2835 compatible?

Nodes and properties are not a solution. See DTS101 question - "...
because my new device, which is compatible with an older one, does not
support ..." and answer: No.



> raspberrypi,firmware-otp-customer is available in all raspberrys.
> 
>> Drop entire DTS and binding patches.
> 
> If I drop the binding patch how to distinguish the variants? Should I
> add a SoC specific compatible? e.g. `raspberrypi,bcm2712-firmware` and
> use it in the firmware/raspberrypi driver to add the second otp region?

So you have different devices/variants? What is the "variant" here?

Writing-bindings asks you to have per device compatible. Why standard
rules do not apply here? (see also DTS101)

> 
> Also what I don't understand why we have all the bindings for

Neither do I.

> 'raspberrypi,firmware-clocks', 'raspberrypi,firmware-gpio',
> 'raspberrypi,firmware-reset', 'raspberrypi,firmware-poe-pwm' and
> 'raspberrypi,firmware-ts'. What is the difference between these devices
> and the otp registers. They are all accessed through the firmware.


Best regards,
Krzysztof
