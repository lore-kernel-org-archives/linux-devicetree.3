Received: from mail-ed2-f1.google.com (mail-ed2-f1.google.com [74.125.228.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E4349B15
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927500; cv=pass; b=h6yNl8M1ZKHFxcfzDj3n6H1yon6nZf5YibxIocK8UpPA3OjNt05W/I7Yu/JAKi1odB8Id3H9qH9zY3StVSNSoKzRyyMD+hSrFPyURcPFWpeiPeVD/fJixg1D5BpMicacGvxAzV7rOl05L6w0ZBuPdgETsISS1bETKbMbJYwwlQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927500; c=relaxed/simple;
	bh=RaqQM8sVfRXFrgVuicFiQ+T4/q8FUzfsNzlzFRbxu1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuVXldvRAmv2bJOsqJNL5Fh1hzvt/ECmnwryJf3zcGl1Xg92P+uePo+M3acmTNB8q5cPlLi3XrWJVE57XSEdTDRAyTmkiOc/0bUKLEDq6ArPsmhcmkV3qze/T1cIE1s5PM0Udd53lMTj2nbWlJnAQNtf8zbjTKidKvpE72AGEQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK9Vckm9; arc=pass smtp.client-ip=74.125.228.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK9Vckm9"
Received: by mail-ed2-f1.google.com with SMTP id 4fb4d7f45d1cf-6976c1916b0so197339a12.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782927497; cv=none;
        d=google.com; s=arc-20260327;
        b=mSEYQ1XeVWdnKlCTW3QAL/uulfXgVwD2Fmvhot0NpMG3D61JK9OccmQI7Wt+CLx6F9
         zrBS8l2FLPRpxsQiUOtNdYWZc18ErTKJCiiYKksEmr8XLALojke5sNw4wRiRLf48yrSz
         FmsUfpWTrIX+bd0+3nG3fb9MbasRPeeL9dAvenKczr3wpJe27dS+g8QYNHKvyvAN1BsO
         pV2uj6H+8i48BxpkiKPnFnvN6OZHeLTYIp3/vf6yCtkj2QPBllNKVO9UjVe7QFZRbuMJ
         6/ikpl4ZzdhLPw1qLWGXbLGDVq0ES1pETAaevYjVMBu2NsFQ3M7d+LkTa3Gj6GqQK8Eb
         pnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        fh=ig1aUfNPRQ9C1VhGpYZjsJrxIvEVQs0QBGqvg3Xvc1U=;
        b=aUYfvrulAYb/0B+xAMNuFyb0FUbP5HP6V3iEOUZ60Ub+HpVzGokzKMa2xwkLsVOycj
         i7jQ3DGwKprs3cxU2gPfk7xne3mM3uCkgw7NZrERB16Av26BGSAx24gh+h+llCuJfhVN
         bJEP/+oNVSD2ZyMa35pyrQ/H5yMx455TxlAdq37VDDx7uKinOv6J66Uo5xABIfUAlLMR
         eQeg7t/e7Tbg8bRpU6hEmd+bH2q4TMM8c67lIE7H7lbkqYdS5mCfTp/6kmWYeSfnZuuG
         TOnbbGnWkDqO1cKj+L5HW6Px2GmibGf8TaQhETv0lOZvqvltcY3yIue6pahMqWXdiwne
         OZDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782927497; x=1783532297; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        b=aK9Vckm9FpfD7ljuevl2pYYESywR6Dnba1XveCOyNDF8p2S372hAOyAkmNWciEoUti
         Jbq4ArnDWiVCJCTAE1eUIQ70bgAoIpRTsl6drnndSL4eMq7sNDNoaq88gr5xp2HSqAiL
         SCa0UB2XxoGkPkcVd6kToMGw6qUjgctoyRtYcvlYTaVPmtt8Etwlxc5J6zMCbDKXpjRa
         /AwzWusaCJOE0cqls2+cpRHyehSOu7hn8BN24yzH8qawjAu9J1Dk9evpdaHy3+pV7en8
         4gYQIWQK1nkJyyu712lTVRkXdAKRQcSCcVKwU1aJLu2ni9JnFkN56HKNTQ8qhdcNXWbf
         gLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927497; x=1783532297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYXi9m66KNbs9Qfb5jrT4uIyu4GUnnRMQ9zeXoOeZJI=;
        b=JvTjrBu5BvV20pYq3SQVY1lVPKZRNrcMFtsHdMR2Cd0INX3F5whxDMZPAe9qhAfA3U
         GlnABaNO8cU11bPybmRG8NWCRPESl9BNkWaGKzlDIZ7MM4PEGVQM6XTeLLub7zgs67qa
         +gcDwcXDIbzsG9d0/lvpdKEw/c8kJqC+0V5XiTlhRxetlF4A24LednYeU1qhYOnWtB20
         8rRRcTSCje4rULckNUqVcUhNqoCGcJffj+b0YBXd9GrtNpHlEtXPfn2iEijRhcaVV0mC
         5zvkN77MrPASFGo9tNBNexnYFoFZil3CnQ3r3PO6uHFWoH1cjOPL04RM5VWxq5g4uXBA
         BHGA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7BJ+B/1tub3NJlCSSqU69Sc3eiaGjXqfwImNjf0cgoUSbd4H+Ozk01QAgsCyj1Rp4Pn4cMw61o5Ug@vger.kernel.org
X-Gm-Message-State: AOJu0YzgyYPSGQvZtTeuPyD8r8NJ7VAGQEdITaZwRGONCNEhPMPcyQLm
	tQg+hWlrd9F4H8M1wdFHmgKdG2/CnI/brpMMDzeoLCsNiZmgLULtkrf0PK9IzS47LVx4Oj2fDk+
	PywFtHzDFIYAAdPOOZ6WURM6Hr3LCQQ8=
X-Gm-Gg: AfdE7cnC9nlQnKi7t6T7hzz3CWHKZTfK64PwNOEGC5WkV0wjYOmfGDzq7j9mZJ1ysyE
	+xny4GXC9VLzHA7jimJ232OjVOqVnDA+UyGqEyhcnqFZ1QMsO1NrLdj/wRR2A4XS/LdOj05ekr6
	fufGxk5lUt/pJpZT6VNvcV0FCssWRoh2LSZxVTijmpNtZGrTafG3b6gjw/TRKbnxvfxz529Tlor
	BWc7faexqtHFer4ELhK2+L/bFObPY9NQQFg88aOYHdamkXSMjymF6JhURpn0motUxD5SswzuYk=
X-Received: by 2002:a17:907:3f97:b0:c12:1eb:892e with SMTP id
 a640c23a62f3a-c12a79b77acmr146967566b.6.1782927496879; Wed, 01 Jul 2026
 10:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701164543.3967388-3-coiaprant@gmail.com> <20260701164543.3967388-9-coiaprant@gmail.com>
 <20260701165958.BC7CB1F000E9@smtp.kernel.org>
In-Reply-To: <20260701165958.BC7CB1F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 2 Jul 2026 01:38:07 +0800
X-Gm-Features: AVVi8CeL00GpCHEQIZu5-z1-920rDCQqSuFCtbUcdM8yj0kiyDqMC7ciYSSV00M
Message-ID: <CALj3r0h-8cSDNcYW03yy=eUJUcLq-Lbq=85juNE=mYApPQBGwA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> > +     adc-keys {
> > +             compatible = "adc-keys";
> > +             io-channels = <&saradc 0>;
> > +             io-channel-names = "buttons";
> > +             keyup-threshold-microvolt = <1800000>;
> > +             poll-interval = <100>;
> > +
> > +             button-esc {
> > +                     label = "esc";
> > +                     linux,code = <KEY_ESC>;
> > +                     press-threshold-microvolt = <1250000>;
> > +             };
> > +
> > +             button-menu {
> > +                     label = "menu";
> > +                     linux,code = <KEY_MENU>;
> > +                     press-threshold-microvolt = <1600000>;
> > +             };
>
> [Severity: Medium]
> Will this configuration correctly identify the MENU button? The commit message
> notes the hardware voltage for MENU is 1400000 microvolts.
>
> Because the adc-keys driver matches based on the smallest absolute difference,
> a 1400000 microvolt reading is closer to the ESC threshold
> (1400000 - 1250000 = 150000) than the MENU threshold
> (1600000 - 1400000 = 200000).
>
> Could this cause pressing the MENU button to register as an ESC key press
> instead?
The ADC keys have been verified with evtest on actual hardware and
they work perfectly fine.
Keep it.

> [ ... ]
>
> > +/* used for AP6356S Bluetooth Sound */
> > +&i2s3_2ch {
> > +     status = "okay";
> > +};
>
> [Severity: Medium]
> Does this node require pinctrl and a simple-audio-card binding to function?
> It appears the I2S interface is enabled, but without routing the signals to
> the external AP6356S chip pins and linking the I2S CPU DAI to the Bluetooth
> codec DAI, ALSA might not register the sound card.

Yes, it requires rk3568-codec-digital for Bluetooth audio support.
Since it's currently unavailable in the mainline, I will disable the
i2s3_2ch node in v4 to avoid an incomplete configuration.

> [ ... ]
>
> > +&pinctrl {
> > +     bluetooth {
> > +             bt_reg_on_h_gpio3_a0: bt-reg-on-h-gpio4-b2 {
> > +                     rockchip,pins = <3 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +
> > +             bt_wake_host_h_gpio3_a1: bt-wake-host-h-gpio4-b4 {
> > +                     rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO &pcfg_pull_down>;
> > +             };
> > +
> > +             host_wake_bt_h_gpio3_a2: host-wake-bt-h-gpio4-b5 {
> > +                     rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> > +             };
> > +     };
>
> [Severity: Low]
> This isn't a functional bug, but do the node names here have a copy-paste
> error? They indicate gpio4-b2, gpio4-b4, and gpio4-b5, but the contents
> configure pins on GPIO bank 3 (RK_PA0, RK_PA1, RK_PA2).

Good catch, this is indeed a copy-paste error. I will fix the pinctrl
node names to match the actual GPIO bank 3 pins in v4.

> [ ... ]
>
> > +/* used for AP6356S WiFi */
> > +&sdmmc2 {
> > +     bus-width = <4>;
> > +     cap-sd-highspeed;
> > +     cap-sdio-irq;
> > +     keep-power-in-suspend;
> > +     mmc-pwrseq = <&sdio_pwrseq>;
> > +     non-removable;
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&sdmmc2m0_bus4 &sdmmc2m0_cmd &sdmmc2m0_clk>;
> > +     sd-uhs-sdr104;
> > +     vmmc-supply = <&vcc3v3_sys>;
> > +     vqmmc-supply = <&vcc_1v8>;
> > +     status = "okay";
> > +
> > +     wifi@1 {
> > +             compatible = "brcm,bcm4356-fmac";
> > +             reg = <1>;
> > +     };
> > +};
>
> [Severity: Medium]
> Is the generic fallback compatible string missing here? The brcmfmac driver
> explicitly checks for brcm,bcm4329-fmac during OF probing. Without this
> fallback, the driver's OF parser aborts and properties like a
> bootloader-injected local-mac-address might be ignored.

Understood. I will add the generic "brcm,bcm4329-fmac" fallback string
to the Wi-Fi node in v4.

I'll wait a moment for further feedback from human maintainers before
submitting v4.

Best,
Coia
