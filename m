Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398614;
	b=KUgXmI7ow3so1naTWZZlo1a9AlVPUGjCKT7l2DD59duKjKtQKGi6UCX04z1SY6mJsXRq
	 YjoYCVQL4JFvAwq9bG1jG8L8lhV4DkqkcgQLchJYyLQc9JtYtZPFWPayBTIEoHJhe/Qyy
	 Dg5/ZDj552JUW4vPwPYjsXNg2iv+3OkKiZxm2gaJZeosZJ36tJIc6UmM8n34KURIL97KO
	 +sFxeAhhN4lWIV8Av1M/Mc6koSzoZNKh8PvPNLQknU5DY2HvxpxmEam+eivjKTy6X6tYL
	 3PsWA7iQXBZqpkaDZIQJXbwbPUgZ4WVIsMy0zrDGqb+kpP2YnJ6PFbmihGuW7dhZgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
	b=0Wmj7rUUITjPDnAm0dn7ufizrVaHfiIGmfphq83NOmyu44SfY/t4uS9XdY2liioQPeSz
	 AGgI6FVaGOwarBymGqyH9dsLkWK8iYEKmCPLfXd4Taymw4WjwYOgxNcpkh+hv+7Busy4U
	 INVWuqoGHzcYgHZEdB1hUZICmGkm594Fp79JGGFbovOXaIzJWCtUAxtaFEkhGLuTUdldz
	 SJvKu0aR97razL+tZAKhdyeVPji/aijXXEjmHBWbz6jxzyEcChSubr9il+1SsMjPx/DEm
	 NFiXRci0o4mga3jwHgkv/H8ZtcUfmhVJzqZT5aJIyxESJzE9+FspPdLMd8Qy5/zLM6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNA1EOOg;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB499606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB499606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MNA1EOOg
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so4135670c88.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398613; x=1796003413; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=MNA1EOOgy6ZBUuhdD/ZBI7Krj7F286wnIncjH3RvwMa9Lc6CVzlP3UWssD/jKo8kN7
         184A5ipSF0KxnBffvHbZUN+7mGJxIAZqrn4T/nS9fYIOIeVXd1Xfe58RDS3ca8MxmdlG
         f7ip3ojQ3TguSeO2SPj0EX9SjMAZLOpzJI7OppbJeoTT+ksGEU/4zTxb31E2/b+LE1ky
         XZR4ZxT+5e3Ks+ZDfQnGbk5ix4v6y6AlYras45QHR/82UCqVk5NvRExUoY/e7bjEGuid
         1axATOXDH4WLjGw3TC4bdTjr6UJy04UtiZyYcHA4T8SfZsYNl3mcJ3kKl9XUgaLCMnRq
         vKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398613; x=1796003413;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HPgiKAKXJD1IfapqnG6OwznXuOp3qOSKSxNr/yY/XDo=;
        b=GWdCsKppxTn0mbJ3B+PxSeG4G4L4B0Zzyfqpa46xhq8Nf5pQP4iNaoAcrAOUhVrh8B
         0unD4YyCRISXtqtWCTw79fAPQlUZoR8wXoQH22xXs537vN8xu8GsRTuJGm9fWmskOkYR
         vtdIc6EItSIDICYhBKTpCRhpQ+EcJJYfqSCRfxlt/QeW8Wy9xjzOYyi5KZSNZcw2XAz/
         LR+A4tk90NqNnGzGin22wKyLKx90BHeufMfeJl5TrA23tqR+QsTYp/xOggVAo5oZlIUC
         Uf5UUYI4+esG16gJ6mWjudToVQ3+OX3tTlzZmsL/VzjcDEEtrTpx8R0jVHfsfaotxXk8
         2BKQ==
X-Forwarded-Encrypted: i=1; AL+hErEOffff+FGzPaK6PtmaQZQwAw5lESIqqq5lUH8ioSgFr5/6VDQ/6k/XTeIHddIEfbPWAHYLpY778Xac@vger.kernel.org
X-Gm-Message-State: APuU4Z9HMjfxf/ZdiKWiCwGSZu9G6Pq8x/XxdCTk3pT2WzmY2IN9d3g5
	uWc7FRJxHPDTJ2adTTTKySC4FjE8iNy8WOgYIm1IXxZyKcqPttBBOP5w
X-Gm-Gg: AZFdTZew9vdmGL+R5vbICu1swi44lyY6kEuvqv5+k9GlhsY0MB3Rv8qCy1lRtJkSjFB
	4CI0zkNjBuBehM2T3uFcatxhR6VR9L9DU+nQDt8shz6YD6AJuDd1UraJnvT2jUsP3kbYyUmO1lw
	Fh6GXMLwaW3aWCkUcZ3eA9NI41kjyOuFmTl++H9p5S9yKRmZtZldRrwzIWPONoWdyjLPda26BqA
	9lNM7FIx50pPFjti3/zeiza1FpUtfVPWk/4Wvg27wpynyQxyVpaWfNPNCuP3lsGmH8yZ/eDmfJp
	gRDlmh1Jt5HOciUJ8WCUnv7SZtZ3T0Fn9MMYbon8waM8KM/xFgybSyHh684e7XMN6cNkv+vsMnY
	M1yCxOyIWXkViDGkcTctp7txmbhCyoet3s6KxyXkHvp3Bxz1kG8IIYSkPM3pWTFKHLhuovC13KC
	oCj0p0suzmlt5KqJBMc4of2KtlVDAyAjDqoaoKLhO9E19zpNznMPKjAN657CzRwo6AxiL8sMbRz
	VdSrhV6ZL+kLgeHQYMRxyVzWKjZeT+hBRaBHp8PQvczWnWGFneuJ+H5UXyJf4mSG6ZNF4VaB+8M
	QOWRrbKD/0ObbqsJSk0EGat+MRwHHCU2u51Fzm3fCWNO0nig22DUM0JJy5j64G/OMOV2UQ==
X-Received: by 2002:a05:701b:230b:b0:1b2:4da6:bccd with SMTP id a92af1059eb24-1b5568feaadmr8740253c88.34.1795398612828;
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm23364703c88.3.2026.11.22.17.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:12 -0800 (PST)
Date: Sun, 22 Nov 2026 17:50:11 -0800
Message-ID: <8c2d4920319771e3f7edb083b2e831a9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Cc: Mark Brown <broonie@kernel.org>,
	Jakob Unterwurzacher <jakobunt@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt during system suspend
In-Reply-To: <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de> <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de> <avUGEQhSKlko0Fm9@google.com> <7bec766f-14b1-4eac-96c7-d7f1cf38021d@cherry.de>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Jakob,

On Fri, Nov 20, 2026 at 02:42:57PM +0100, Jakob Unterwurzacher wrote:
> On 11/12/26 01:25, Dmitry Torokhov wrote:
...
> > Sounds like this needs to be solved in PM core rather than hacked around
> > in individual driver? Let's CC Tony and Rafael.
>
> How about something like this, copy-pasted below? If no immediate 
> objections I'll post it as a proper patch.
>
> With this, rk805-pwrkey can use dev_pm_set_wake_irq with no issues 
> (tested on RK3588-Tiger).

This approach makes sense to me (and matches what several I2C controller
drivers such as i2c-imx already do), though ultimately it is up to Mark
Brown to decide for SPI.

For rk805-pwrkey, please use devm_pm_set_wake_irq() in v2.

...
> >     Take a runtime PM reference in the regular suspend phase and drop it on
> >     resume. This keeps the controller usable until its noirq suspend
> >     callback, and since it was active then, pm_runtime_force_resume()
> >     restores it in the noirq resume phase, before interrupts of child
> >     devices are handled again.
> >     
> >     Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

Probably worth adding

	Fixes: be721b451aff ("spi: rockchip: Resolve unbalanced runtime PM / system PM handling")

as well.

...
> > +/*
> > + * Child devices (e.g. an RK806 PMIC with its interrupt controller and wakeup
> > + * interrupts) can still need the bus during the late and noirq phases of
> > + * system suspend and resume, while runtime PM is disabled. Keep the controller
> > + * runtime-active from the regular suspend phase on, so that such transfers
> > + * work and pm_runtime_force_resume() restores the controller in the noirq
> > + * resume phase, before child device interrupts are handled again.
> > + */

One nit on the comment: rockchip_spi_isr() does not use IRQF_NO_SUSPEND
(and pl330 DMA suspends in the late phase), so arbitrary transfers in
child suspend_noirq()/resume_noirq() callbacks still will not work. What
this actually enables are PIO transfers in the late/early phases, during
device_wakeup_arm_wake_irqs() before device IRQs are suspended, and once
resume_device_irqs() re-enables them at the end of the noirq resume
phase. It might be worth wording the comment more precisely so nobody
assumes general noirq transfers are supported.

Thanks.

-- 
Dmitry
