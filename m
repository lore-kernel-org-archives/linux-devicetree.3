Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65015746F
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886630; cv=none; b=Tz0PwvApb1oJu/6vfnQbUZmE8FDxu/amk8Js7xGnibTWoU9HsqClsHm37NZHR/0p+uWD0/Th2ICseZNpGX2sTbqQl8NFD1qHaCK8rbszr628GZowEp6q3P1PI6cKIOIgF+DT/3XOcIWB73XgmocJgmBHWEUEv3maxmj7yySIJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886630; c=relaxed/simple;
	bh=HgfOYVUmqK15tK1qAZjGuLmszhgYJK9TaV4k+O5nopQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CTV8Iv7UPrto40ry73M/o0hKEO1RuIlsWUWCOG0+vRceNbfuZVoXqKiTOrWjsAJu5cAp7yyLYNyFTU/0GaQ80l2Lh1yG2/vBYcOyUMtJJ7iWd3kOdgknn4xW0CAAvRDG7NMltr50FDF+I7ofskm1dGalyT0+TqvbeTv4zd7VXhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uAdGDiEk; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uAdGDiEk"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so2561751a12.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791886626; x=1792491426; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1nANBNsyQWXnn8HGzdSfGCDeYeCmohBuEkqclHHM04=;
        b=uAdGDiEkXuKLYoaaVIT8Xsf73y7curREzVjaWEX6gSY2Assgsa2+Ro3Zc6A09Yna8T
         j39I9MRjdKbuxOdSHC7sbvc4MU8mSdgjjOfhVGOpOpAchvjDMWRpPOlPQXK5mH4iXpJr
         g8VMtp4ix3EtRELtIRPMklg/7UfyQY0TWqSmcgvAb3giEuYQihxz42DD4OVJbIFzWMtF
         h+8rTrYYWCKKKJozBmDgVG/b1F9FJw9+x1/+ZTAk3vGO5fgLsfY5zyM+YHFeyHaV+0Hd
         yzaN9y8xc+H+CUgKsxpSdyF8o0OfN12iQvD0hQ7OLVNSeaGA2P7Z4QFOMYL29HvmzqJq
         EMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886626; x=1792491426;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1nANBNsyQWXnn8HGzdSfGCDeYeCmohBuEkqclHHM04=;
        b=wOu4DvSTVjY/wRxIIErNbO0IrTeQLQI5c+Kes9+G/rrfb1oCTS1CMTKzalbAiL1Vqr
         wRDRGLs+XqTkgWkYkiJQR01JGtSGMi6L7Es2iQ+KiqpYdePOcWwyaxpOst05om7uUuYL
         kjBHkllO0SMcHfdP6cJdkZ4qWGF+kYMBzvcmHwqi6bjZrj/srbtnumjqD7u+H34GA+UF
         CvrZrDUuHI4nhTjpCnAmCpvJYZv5+BTMDl75zY0aHngBvidSd7m1uLeHxZuRkijnsno5
         hzIjsQGPA81zlJYbply2sOritfEK5ErS8J/pQYlQBiQ9qySQQMFJdrVPeMHC8NbdPLV4
         3a1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgdp4WZIr1NSs8mYP85XunmUsUqR2WdScZHVuyeYL0C6PagXEtG6APh9qIFxbVVd65K+cGyanGRLkK@vger.kernel.org
X-Gm-Message-State: AFq9FYJq/nLvBYspyCvRzNYOx67i9m04qu5XDR4m54HZehX4Ouo89/+J
	xeXPOHSmT1DjAAs+YeUDzZEftLXAFGhsbKnLEZqM2kxMBwRcqNM3Zm3ThPFvChbIr7M=
X-Gm-Gg: AYBFou0WqOyZ9vgfmAXTtRW/q/fjoDzV+LmlWFK0KOgH4QIXtrNt7H9PZbsaLa1WRwq
	/31AY+gdVWnVEp3OjRFBvSHZwNslN7dLFwgiiN9Y/xWr0w5Nso3XsyAD6a+3nBJGWqdYMOjC7w5
	PrhXP/aIcujptNh4+Wk7EfbMLBsgXxsqo0I/m9Hp+Tp+aUdkDa96D2Eby+4VDFzmh0ZxVWZoERD
	NUCTGtHbi2dAjUJEbYleEL4KZrmlmYyrFYv2SZeqb4qwtZ1d8TZJMK5Je3YB7biiEA+abDIwyz4
	r13+7Uq40i0DUZWd6z4YiEz7YD4Ws35izFIHK5cw/p4XjIQEd8de2R20a05j5MCmmfrpYAruFoM
	GDk1RLuUUVzJYRvbgv9BFunCuFRY4q9G2ts21Wjq1yXViXC6+icKQtYXrzmMpS47MrXZQHo3hV+
	TpAPsRkA9wX57FPsRgp+HZh5t/pxtLZh8ZrRrhSvUaSVkHTW5IOLKTO7xmsHiF9DZvwwkkeV8Rq
	BPJTkP1ckusUKL+nbg62k1YHPL0j6SBYuIPy3o+bm4jGE3s29MOzA==
X-Received: by 2002:a05:6402:254c:b0:6b1:b9df:6001 with SMTP id 4fb4d7f45d1cf-6b1b9df64e8mr5421183a12.6.1791886626364;
        Tue, 13 Oct 2026 03:17:06 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm6018180a12.36.2026.10.13.03.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 12:17:05 +0200
Message-Id: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
In-Reply-To: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>

On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
> On 10/12/26 8:11 PM, Luca Weiss wrote:
>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
>> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
>> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Good to see the Lucas are in agreement ;)

:)

>
> [...]
>
>> +&pm8350c_gpios {
>> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
>> +		pins =3D "gpio7";
>> +		function =3D "normal";
>> +		bias-disable;
>> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
>> +		output-low;
>> +		power-source =3D <0>;
>> +	};
>> +
>> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
>> +		pins =3D "gpio8";
>> +		function =3D "func1";
>> +		bias-disable;
>> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
>> +		output-low;
>> +		power-source =3D <0>;
>> +	};
>
> Drop the output-low, the consumers already take care of the state

For both enable and pwm?

>
> [...]
>
>> +&uart7 {
>> +	/delete-property/interrupts;
>
> Let's add a space after the '/'

Will do

>
>> +	interrupts-extended =3D <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +	pinctrl-1 =3D <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_ua=
rt7_sleep_tx>, <&qup_uart7_sleep_rx>;
>
> And let's wrap this line

Sure

>
> [...]
>
>> +&usb_1 {
>> +	dr_mode =3D "host";
>
> Does OTG not "just work"?

Is this a feature one would want on a laptop? On a phone for sure, but I
don't quite see the use case for the laptop to be a peripheral? But I
didn't try it, the USB basic setup was done by Jasper

>
> I'm assuming there's no pmic-glink on this device?

I'm not quite sure yet how the USB stuff works. For sure from
observation, USB-C only works when stuff was plugged-in at boot time
(UEFI?), and charger also only supplies any power (but not actually
charging) when plugged in at boot time.

Regards
Luca

>
> Konrad


