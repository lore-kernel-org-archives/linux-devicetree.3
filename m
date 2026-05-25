Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987BD340DB8
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704961; cv=pass; b=q0Ip4WyMo1tvly8KoES1kWfbZVEpFBqlQ+vc6d0LmoyJvg5JHgvnO8BeaxRIuufdOfq1A5UZs/mq2F3cnjxtgBoNKVQBcnZSY25C7e1+0sMBayFi42W+UG872BoEdsi/xXmjJkJbCNsl0TWqpKBWwhF+JU5zUfJsuKqGKYHUr5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704961; c=relaxed/simple;
	bh=m4poLpUZSwfopyL1c/7kDTVMFzXMRL0goIzi9c66ciw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o6pquoXtAiuhzvl2tIDsTbwZlL/S1OgJ1aD0DZyRcc47BWIkyZYl6kBgJt4wKKfcZqx2XXCxM9QdNuYfE2mpYSOxwIrc5+A88qXQ+KpDyOSrrxyuim0lH2SF3OLc+FxM6S0nOBxyMl94Yx8Zd0KD6mYSvSdF5sDRDPEWdIofSsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=EnFOgH1C; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="EnFOgH1C"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so7707099a12.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779704958; cv=none;
        d=google.com; s=arc-20240605;
        b=F+bBS6YzkQIrtUIJ7Wkh6qLfUQpjZEjRYqLlBBIpiGNRAbqLxP7ITwGlJyytNddwBo
         0D20jVlPxpw18ljpIAeYGclxAMnOLV+su8V0pq86fwiMwAdhoy0DMFFGgYd/UcXlwWFJ
         oSK7fvLXN7a//TogAjPtQwJiqewaolq2Sf+QfBCCannEBTUwmTI/5FLqtAXaj95CQxOe
         UPcWaMxOLSNScAhyA/8+m05DG/ZDaca3ODGy1ZHIL5URsNIa5X6E4DyRsfr/fUPGQePB
         4WtQvWjr6eWAVfzEqWjZz6ZRKLHXVJl6i0eRxk4XFwu/2I8wuam7wZZaN04iC39yk3Om
         dQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        fh=9K8NwVMHnOJ7FpVSwbhzu7fEQ0BRBLGuf/JOaopeCho=;
        b=JA6NeqQ5aGhnWiwXdYUTiq5H/hSA8q/jbH30jG24Espp80Zyjvzia23e79vx6J7DLA
         hwD9xW9jRih6yFF1SsgVsDxGBHBoIivNtpgqAnsIHAUTYKhmenyE5vnlw/YafPBTInkh
         daMC/YONWkLxXz9aQDzy8WMgvmvMp3Zrxx+SB7q0rrML9cYQElKGYi97Zn3Y8nyCt6rm
         S4TSjQ1FyBroRQi8HgmB2yt5+m85HS/NPTVciV5gCWogITfjfn+LJWMHSJjVkmAPQpUC
         nlRhvrNd5Qlya/29Sz1mLKQ7xxcx9xnCZ3BvxXc4HcyRoztqJL3S7RTHuKS6ljRpzwpV
         6meA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1779704958; x=1780309758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        b=EnFOgH1CJIVOziPVaDwlbhflvXSMAN7QQhqRcfbIGBzbdEKNq9MizCbE3Z7+aYNPpS
         0Oxjh7BmyvU3ZtPO7cTK6MvXuj/j6YjvBY0Z/TTPyaegRz5498UQ8k+WMO/DgbOVpAsA
         qjzCLmlzXPcyKHCLRDb883eDgh9tLB+ivgFxFmQw3j7cAkCKMclUhxSsmWTvzZ/Yz5lJ
         cuiZ+SX9/AsvunBXQPEo5st6pPOHp2Fz30n8xgjKST7Wn04AlFRRJn1YkNKCW+wNzYOz
         WED5qTEDF2v35saxc7fbCO8yfRsIHnfvRMHaw+Roz9wrG6Q/HuVt1K6WFUQaAsORMEXk
         Xk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704958; x=1780309758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2zjYk1b3PjwohyltiHt7C7R4stIFaGLsaAw0WYacxCA=;
        b=MoyFds5iUFp+a2C03I0FUIA+BtbHg8WnQ3HcOFArESdiSYBSnPVC3ORUAQpW9CYAUq
         CKAzCuBjEYX6I5u+f7u9dSlZE0G0MhXKmehyfUh39EptCukw3ovLspAl/8dh2HWqSCRK
         scswVpGn7sRXZsRHjmOlpZw3G56BgtSW24gNhbf1OL7kXK/THAGEcj9xUuX2Gi4F93R0
         NR3DKLSjcW9JPlCUG02I5hoFszNXx899BmkADYtJwIAYUAwEu/1B6RLvNTKvaCGRFNu0
         XicS0CyzY7ugp00vln7J0d5YYWQXPyAAxE1Uj9LKMOB7ZkkzGyGPI66BSBdmaUc0wBAT
         lzaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+spylaqGhOIhXhhjffCEGOpSA5fleGE/uTyHe0FLLBWGsfOjVsrHY1eTgrBRBIldPcYqGUHhFXQFnV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8tDK8oT3dUPIQ8JewQQnbEaPXTIqrrbfQ2Sjfq/8D1nwQUJyR
	x0+w6eJo2S4JZaEC+P0fWrnYUWoCAWZ6/RHlvJ99uK78DJX+zvJot8NLhaJY/U3WxIYiN65KREf
	UJX1q7RVTH1k/GVCfls0AJz1RSws8/zQJelfhLZBR0w==
X-Gm-Gg: Acq92OFJ0HHQkx4T/pxppoNepdhIoeUsIMaja2dV87wbAImb+F4WePwKREkIsEP7JfM
	Bj+Z+XXKVsiAElJj7pbPxjIBnFxWJAYNSBRsSpxWB3LqHKfB81K9xFv2EoSUYZcmVucns7dg4X3
	6uez63U5yX5BQDkrG9guFNc3ghxh5s4qqUnBe15OevoGcIEJkn38LqVXtSeyXdWm1VQ1SSM+DXz
	H+JjHbsKzp1FwUeDXxR8ga70QGD86R7+TmHJ0AX+ARhOppwNerAp2P0m6I5QNGX9+4F/diG6r+O
	U02e+W5oxdqMD/H0rLzsegTU6xgbzRF0L3MZi//IOJ5W6YyAejg=
X-Received: by 2002:a17:907:97c6:b0:be2:3784:321c with SMTP id
 a640c23a62f3a-be2378432damr27174266b.14.1779704957915; Mon, 25 May 2026
 03:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525-nau8822-reg-v2-2-7d37ae393e46@flipper.net> <20260525095110.A5DFD1F000E9@smtp.kernel.org>
In-Reply-To: <20260525095110.A5DFD1F000E9@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 25 May 2026 14:29:12 +0400
X-Gm-Features: AVHnY4L4kWcY39eUS8a0Rb31wbcqizeGPlz0iTI1nmjxINscceGgui6DSgIQ-aw
Message-ID: <CAKTNdwHMixtVodANo3GyR0mjUFJ6d=GEe+BBD6GsNgzMcViX1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8822: add support for supply regulators
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 1:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Manually disabling regulators in the I2C `remove` callback break=
s the LIFO teardown order, causing I2C operations to fail during `devm` com=
ponent teardown.
> - [Medium] Unconditional regulator disable in the `remove` callback can c=
ause an unbalanced disable if the device is removed following a resume fail=
ure.
> --
>
> commit 9b4fbe6b13298617ee870787131ce69e29d799b3
> Author: Alexey Charkov <alchark@flipper.net>
>
> ASoC: codecs: nau8822: add support for supply regulators
>
> This commit adds support for the four power supply pins on the NAU8822
> codec by requesting and enabling them at init time. It also adds a brief
> delay after power up to allow the device to stabilize before register acc=
ess.
>
> > diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> > --- a/sound/soc/codecs/nau8822.c
> > +++ b/sound/soc/codecs/nau8822.c
> [ ... ]
> >       ret =3D devm_snd_soc_register_component(dev, &soc_component_dev_n=
au8822,
> >                                               &nau8822_dai, 1);
> >       if (ret !=3D 0) {
> >               dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret)=
;
> > -             return ret;
> > +             goto err_reg;
> >       }
> >
> >       return 0;
> > +
> > +err_reg:
> > +     regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
> > +     return ret;
> > +}
> > +
> > +static void nau8822_i2c_remove(struct i2c_client *i2c)
> > +{
> > +     struct nau8822 *nau8822 =3D i2c_get_clientdata(i2c);
> > +
> > +     regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
>
> [Severity: High]
> Can this manual regulator disable cause I2C bus errors during teardown?
>
> The ASoC component is registered with devm_snd_soc_register_component(),
> which means the subsystem will unregister the component during the devres
> cleanup phase. This happens after nau8822_i2c_remove() has already
> returned.

While I can move the regulator disable to the component .remove
callback instead of i2c .remove, I'm wondering how the unregistration
is supposed to work at all with a removed i2c device if it's indeed
structured the way Sashiko implies. Doing so would make it
semantically unbalanced, which feels wrong (enable in i2c device
probe, but disable in component remove, where component lifetime is
less than i2c device lifetime? Ouch)

Any guidance would be appreciated.

I see existing drivers use both ways:
- Disable regulators in component .remove: e.g. [1]
- Disable regulators in i2c device .remove: e.g. [2]

[1] https://elixir.bootlin.com/linux/v6.19.9/source/sound/soc/codecs/es8328=
.c#L824
[2] https://elixir.bootlin.com/linux/v6.19.9/source/sound/soc/codecs/rt5645=
.c#L4300

Or maybe I should just switch to devm_regulator_bulk_get_enable and
forget about the remove callback altogether - unless I'm missing some
other subtlety here.

> Because the regulators are disabled here, the hardware will be unpowered
> while the ASoC component is still active. During devres cleanup, the
> subsystem will call snd_soc_dapm_shutdown() and transition the bias level
> to SND_SOC_BIAS_OFF.
>
> Will the resulting I2C register writes to the unpowered codec fail or
> time out, potentially stalling the driver unbind?
>
> [Severity: Medium]
> Could this unconditional regulator disable also result in an unbalanced
> disable warning?
>
> If the system resumes but nau8822_resume() fails to re-enable the
> regulators, they will remain in the disabled state set during
> nau8822_suspend().
>
> If the driver is later unbound, this call will execute again. Will this
> attempt to drop the regulator reference count below zero and trigger a
> kernel warning?

Most likely yes. I'm not sure though if coding around this case is
worth the trouble, and other drivers don't seem to bother. The system
must already be quite broken if it can't re-enable regulators at
resume, and in that case, another harmless kernel warning is probably
the least of the user's concerns.

Best regards,
Alexey
