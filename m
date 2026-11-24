Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795554891;
	b=zNnr+Dt4ayNFlhARH/b1eYlcyruJxeJv0+rOA6VPQnWP2o+aHOx8JGsDkKwvpJW6rdRe
	 H5jwSOLvgl+qGwumQndF2Zty6KXjnD+qrNQRMszAqiMQavl1jqaGWkHAjewsS80qLU1JY
	 DB2SjYlxECAlQET6uvJdREKs/T6/iBYcGN7kgmCfFWMIwuL4rlZ9jhVFtzjYvhbhDTpgS
	 CngI7yCkZwV6FNraXyzBsf2nK4AGXYczt1le1rw5N/dyf08m06TjkxgNV3fg7ECz95o1M
	 4xIZdHA1v3SjdCT4pBJYhC7t6uQs9zvVoiKiHq8xjYbCPLQBA0TMfiLEJ+lCGcXGazQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
	b=c8SXlRbo/iyh+EpCsKSvPvNGkqKb8HM76TudaTYpXBGou3oMFBkzQXi4KHGV2EvtHTvy
	 JL/WbWKrtlL6k7QpT2u1tRPQ/wjBSs1Kg31N94hLiKlSA+BZoEkt72w8DWmD+xOvXb8E0
	 asuuFkCzDllGRbtZhRS6qXRHayZDapGKWmteGYKe/Jf4Z52P+LVjk8idZgVCpUC81vDVU
	 mEWaX2/GNCtlGPOI8EnFDIAisuPuelzmCLEhmBVYe3908IjK/gQWP1blyVqryx5s5HWnW
	 9hQLqVDDgTfVR40YJZAEZ17iECHk9T0OPXARsGEK7bYiVECudQIbMznL3yBjeCEN66w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB17606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB17606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=IWBxgdqF
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b531cd9bbaso40723467b3.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795554889; cv=none;
        d=google.com; s=arc-20260327;
        b=SEjIqrkwOi0rhAZVwP/7nWtzp2S/y+uCctqJDRE3Kt2WcwVMmHsHCPajntkVg3mbqa
         eLJjuX+OpEJMc6GwWgDu86z287Z0hkeajYWo2BZ7fpKFTO6sZrIF7zE0LlwxqE2GDdA8
         QSuoDnHpaL0VwJonAUlcDiBTyKXsEn3UPulLw2cqYl6usSbmTs1fUOEe2PGsROkoEgx7
         odFLoE1HZiIAtEWdJ+wyfDSjNbyTnO8ozNyS2sdEyAT83K76o+PUt8OT5z/V1oen/Gij
         kFaswnsAb1fgx7HtVaIkIJLQRkVBKeF8YnAVJtd4qeSacCEq44lfvHKktT8RM2v8FxSA
         /m7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        fh=Chm9rqCX8OJo7ZMTtPRgQorlIr1w+MM/vQg+B/oMmb8=;
        b=e7oUz32qztnBmF2zmp0xtFJeQrqOmC5ELMuZIlEJ2qD5LDZpqmJsEMIhj/9+mW4/rX
         1+b5HIKd2W3eHHLl/3GNG7sHMyK6L+7iiHe0mnQD7HpHYGiuw1N2g0vpLz8k2b04pqUL
         smZw/G5MoHM+ZOwWzUa7u2o/jw4PKW0MYyqDGV2H3UBbbbMD54p6N+l8Ce5bL1RTShEC
         1BrA3PfyKawzpwB0eg1XmmiWq5UamonGTk69HZZPFGy9esGYY3Ti9VrbzqerXAk2XAJU
         jRqYpZIxcuIVdGC/wI1aPVPH92+Ve3fRy8+TV2rfQO0LW2Hx2MZspvlG9Yxm83B3OVU7
         98UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795554889; x=1796159689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=IWBxgdqFp2x9XfPCnso0A2FH/xCUErU25ylGd9luJVJO+mW9jwjDcUc6j56Jo7eMZn
         UjDsGcxdVnO+JPKHL86/tNrDP03a9uOsvyZWaE09Ja/x4zZcuAJZBx6g1lS521mwQm1u
         1t1xtyQ5Xc/UIv2Iwa35nCEWMfwoQOZ6v93+xvRe7lQgBGjqkjpkS3QMmJFMP0J1KUt6
         U3jD4FvtgG1wLixarS6ha+vluA8fPBD8j9xI93MGiiJw3J/1B06xQFmp6aKwiJ3g3wHT
         VDaJ8YFqJ0riQg7jkTA3zaSONIcRhkwO0GSFsrd1WFKF1j/sGlGYViwaJL3wGcoyle0W
         01+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554889; x=1796159689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdUdyJ+8j1hb94uckgP1slGM98Pz+Lnjg+RuI+nwn9I=;
        b=QQodexn0WmQZu2Y5dexegGUATJTdAxWoab0vt+yzg1CBZFDKNh5pdMfpuVbVODk2y+
         oYR9U6Vgq6FNNU96G/a2o2LyjMBvOqYHhW5bRIcapjZBYznRL2PnSPhu/Tas8bkpCgob
         1mm7FbQnTMSzFa5Y60iWlD/gw61ZZlBBj36LF3ovmNrPxI4PGwG9c8EaJnQqFX9iPntB
         WUW5s44QddHrTyEw6ivX825GnRo5msQJHIr5Df6ZoJMiscvHQm3rimOVlxhQ0pZn/T0Y
         r1eoe8eaESuWqefU6+XA2RO1p+S5lH/eWBVS5JJtElal5+HOHdH2xWyigOQWuYaTQ7E5
         8qAQ==
X-Forwarded-Encrypted: i=1; AL+hErF01akQzzl9GuFhvBXPWML1l9NxDzfLnS/cf1npnaoeyvPqoy3f5Yy66+aCGzg0qbvR18DgrWOxr3q9@vger.kernel.org
X-Gm-Message-State: APuU4Z9loR2am33zOJpfvDR0W12joA++lCmAkysSZcDwhsCrWuEYbGG1
	ZLLLyN2wlrYHxqiNr8NFiQdYlDMqXXLqvATqpXi+P1qjARpAeTSo5dcaIWYtJtjY8BtlSByoJok
	ReNfqGpY6X1Q4KHKH1fL0JwMNZ9P8gMs=
X-Gm-Gg: AZFdTZdunkXy34V02D3LJO2R8HFHAYvenUjQGjkRR0z99UZ5CeYFE64ExoA2J5hM/5t
	Se0pz+UWnJx56Mlk95cfOT8QKEvalSnV6O6kpJgw+9yMAdedT/VAKuKhJiwY4iLKM2WwPqT7GRe
	2mRSeir4l3Qj9oI8qV7wsUFNna+zHsa/JvGr/oehf8g9I6AnXoTR18l6CHacDu+0dEvernZ/GBq
	UCdzvJ3tqnj5dT4kXzJv1VQpm3JWe5pq04YxR0xjcUNAuhBCeZgQ8daqfzdioNVxss7J6svStVr
	xTFtfx3h1E1WSkfqTME5GPR3FNxoYaX/WMMgf+7LUoEWfBVydV+RnF61VkkolHCk+BPZloMsvBT
	u3s+ArCbe7F3xye+OIqd/8AiCGyuS7iERjkX07IaAE9ZPCIoX9cLgm7btWieyQv9Fb+OBCA==
X-Received: by 2002:a05:690e:4090:b0:67d:a5bf:ac89 with SMTP id
 956f58d0204a3-67df42b4d7dmr8236792d50.10.1795554889394; Tue, 24 Nov 2026
 13:14:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com> <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
 <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
In-Reply-To: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:14:38 +0100
X-Gm-Features: Aa3M54rEVwCpdz6_8gjaGQEhKA7ZqL-_05evb2pOjFxPbafFazCrzB2je-Od50w
Message-ID: <CAFBinCCd==1Vf7jMCHP0VuWTNa7A5FvRfPYdk2zUaZ8eR54Z+A@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Valerio Setti <vsetti@baylibre.com>, xianwei.zhao@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valerio,

+Cc Xianwei Zhao, I would appreciate it if you could take some time to
help us clarify the questions below (or refer us to a colleague).

On Mon, Nov 16, 2026 at 11:24=E2=80=AFPM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> Hi Martin
>
>  >> +properties:
>  >> +  compatible:
>  >> +    oneOf:
>  >> +      - const: amlogic,gxbb-audin
>  >> +      - items:
>  >> +          - const: amlogic,gxl-audin
>  >> +          - const: amlogic,gxbb-audin
>  >  From what I can tell it's even amlogic,meson8-audin compatible.
>  > Although I didn't have the time to test in on hardware yet.
>  >
>
> Thanks for catching it!
> Any testing is more than welcome. I don't have that board at home and,
> based on my quick search, it seems not super easy to find one these days.
>
>  > [...]
>  >> +    audio-controller@a000 {
>  >> +      compatible =3D "amlogic,gxbb-audin";
>  >> +      reg =3D <0xa000 0x148>;
>  > I believe the audin registers are 0x300 wide.
>  > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
>  > that the register area is 0x100 wide.
>  > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
>  > =3D 0xb8. The datasheet [0] (page 395) lists register numbers divided =
by
>  > 4, so to get the actual address in the memory map we need to multiply
>  > it by 4, which gives 0x2e0.
>  > The 32-bit SoC vendor kernel [2] has a header that states: #define
>  > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
>  > by 4).
>
> I know that the register layout in these SoC is a bit messy, so let me
> explain how I got to the 0x148 that I wrote above.
>
> When working at this driver I used the S095 and S905X manuals that I
> found online, but based on the link you shared for the S912, I would say
> it's the same when it comes to AUDIN.
>
> Using [0] as reference, the highest register being mentioned in the
> AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 *
> 4). However I noticed that before that there are a lot of registers
> whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_,
> PCMIN_.
> The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is
> 0x148 (=3D 0x52 * 4). The other AUDIN_ block you mentioned is between
> AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).
Your approach is logical. And I have no way of proving my theory.
So the question for someone with access to better documentation or the
actual hardware description is:
- how big is the AUDIN IP block register space?
- what inputs are routed to the AUDIN IP block that neither Valerio
nor I identified so far (one reset line, one clock input, one
interrupt)?

>  > I'm bringing this up because dt-bindings are supposed to be complete.
>  > So even if the driver doesn't use a resource yet we're supposed to
>  > still describe it.
>
> I perfectly agree with this, but at the same time I thought that
> including registers which potentially do not belong to AUDIN was
> dangerous in the other direction, i.e. we cover a too large area that
> will be hard to use in the future if/when we want to use it and we
> realize it's really not part of AUDIN.
My concern is actually that the AUDIN hardware block spans 0x300 (or
close to it) and we'll find out later that there's a bit that we need
to toggle which is outside of the 0x148 area covered already.
Even worse: what if we put another register area after AUDIN and then
find out that this theoretical bit sits in the second register area.


Best regards,
Martin
