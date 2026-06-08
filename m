Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7662701DC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916517; cv=pass; b=UYkgFpnmKGct5MQGG6bpL0fQL4zboKYGxXsarS0gYUxiYuMG5xcOLE90vRr1b51fk2ZYwNhE1z3MVtHpSrRdcelKl+BrTGm2tKmHhJ50xNjaDLcyhW/7X7/17GivxdIUwIJQh2S2ym7XS2/DsktUXpE0UrV1vXK0WUA207oSqFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916517; c=relaxed/simple;
	bh=ONm94510NvE+rTU8noOpilGgyC63W9CbOfLvEbHcUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+7O8pGHIWKsfqK7HQ5dxAkLh4Ih4oB49nIW0SQiFV+TFhb2fNcvYRy7JPUikvvELphPn3AuqBDzlmmWvJhMRD3ySTy2K45hRB7SCIXlzpKdN1SnLcseRwmm66odKoeBbWl7rI0+wt9sG6GAWEd1dlAnp4iPxMz555PRRkWGTbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ7SR+kp; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ7SR+kp"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84234c83142so1627266b3a.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 04:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780916516; cv=none;
        d=google.com; s=arc-20240605;
        b=eQ2Ww3vrczK4BC5RVYM5RsDHPwiVrNUR6reTEuO8q+GmrZ8DYY6fG8cR6e8DHE+zbE
         D6baXz35LK0SlqCvaynf7sBkBlSLnG95mLuEb3PFI/vQrCcvmDwhSvYGVjiGukFslWJp
         ZS5iV/s5uIrWiAA/urIH+6UeJ8BAJ9hiWe8EEp6H64K0iQaHSMCOSu+a8A2qnlw6GtSg
         dXi7UechIC2J/VXPZy6yUdqP6Kbmh0MF3GdLTrT+nU9iKrHYEV3VLKlx1fhfGagDfk0P
         ktvlbY/7AWJKFyEBOcAfAvbzmMWTFwLiq/2Kxn+SGK7OAM+wpcq7wfw7EaBldGCuIunV
         vW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        fh=bBmZhpwv7iB1RfJsxboPu5OGw4yQFllsU0trHh2ItGM=;
        b=ZXvfgZ533CeYsHW18sa6t9Vu1x4Nangu3zvXNoaxpBldxgSlqTbRGuvYY6mfWPlRxI
         tCQ/n4NgluGdrb6CfqRoegoeYsOwQ7bkmO8AjxKwutN71+pwsnU6QX3Ev38shJt32uzq
         9PvvOMo3LHuo2cV2CLzew0uiCAaOqJ7HAn2f/62yxGBb90ZB8bXYScazUB48ZB4hhrAh
         q6Kick+nvHj9olSPzxQDBhqHaVDjWStrdUrXO4+s+7rQDFjVRFlOUtwyEljjSwsjc2u2
         eDScwdVgre6++2BzgIHxiclMLw+lLezMwdRQRnfCs4Rzdfy0K6GPTiOHPTAQ4kEovF6u
         dvGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780916516; x=1781521316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=aJ7SR+kpKlnNp4avZNM+O6GCA4unLNAJio5XAehXMdoLsi+KxK+2tUMW+hAo8qi8UV
         TJ6h7vYjoEkPyDzhE84JdK7yyrjV3GvKZD0U2AZLTdkOWyfD2S9k9TOU0vp4IHiZLLOC
         +J8mTwU+jvB8I8w9jObrs2Tn7ti6HNlZT+lyKr53Sbjj09GF1G76PmXguWzezLjqRPb0
         5w/BN3M9OAZCdkWkk7FrmaGiVh2xzByuleGlOMHejjKS9tjuTHru/W8t4/eCwZylzMd2
         sBpAjwHotk1ht2A66Jd0YwdHSXshAYaG5mJT3NkUYWay5AKOZdga8QH2XnYHVQ6bjNBJ
         HQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780916516; x=1781521316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=j27WJ0dVMISShlH8Cju26URD7aCV5vEUTHTbWZas5aoILVfXNbudxJRV+YMaJLqfXu
         MB1X4BCodmcqJVuBmpjxUSXLzY6j/P7x4Nw/S8cGXNLkiZZ2hGnURoH89J5aQHNokNaL
         S1SdmA0VzfeWhNG0WhOYOmsYl8Fqy3348TK5A6SLyj4oxohZ3Mid4s4TOluCmWSlH/7z
         tJxmfUDHzo2rjGL1wp8K71Tu7qswfWTqfU/pAtFrF2DTScjLi1hHiAPtL624pHkWa9bt
         dLnAIRvXr+4OZmENkOtaO5yWJ3OT6kt3a9nYOuAZBi0fHwFYeCTQLUVt1hgyC/FAMlR+
         i/lA==
X-Forwarded-Encrypted: i=1; AFNElJ8lOGHQo9mxIxU6Aqp+cwRAyAii7fAIoCi9Y8g2PfrVxAuokfS2CBS6DXWFPR2QdaNJAVIeZpENFsFT@vger.kernel.org
X-Gm-Message-State: AOJu0YyOCCnttog8dGtkRaXxtokil5uz3dG5EfzmgZ3o8GhNNCVkwn6p
	viuZKvsxpfR/2kpcBPsW7tH3OAmAEXwqdS4Y7jiL7KXypCKutiYLJSdcKBj3iOhswrekalM1l6D
	QMEsHjoPqOtV8uJ7W3/NBChy0ouZAIIAwpRd8
X-Gm-Gg: Acq92OEtsCEzY2kaZthWRlNbGiaRXmKiRpndY1bqvZZ/nPNhD7ys7d4CtOiYdX40EZz
	MNxEGVyYmZZWAgAuN1xVO3+msbHEIVFMyl3hpwPdYxhL7fYxV1jtkJKWFtEnrXBAqgJzwazhfTG
	zxWMQ2HDaTlfB4yHmwRiBXysUgMd16FXK2vORyE32eLCk/ox3enVpZyaxPOSLcI8iZElHoOcDH5
	NqM0piQ2n2VX13e+KkNhwFtpMPCsR/yVXhLhBuoWV/gWcAg1uTTArdX4A+QUafEgX73KTWc4zrK
	wXHgT6MvhJI2RedMEfZ2x7s6nnFjjFx4J80q/HkCcT7zgsvZ
X-Received: by 2002:a05:6a00:4098:b0:842:38c7:9925 with SMTP id
 d2e1a72fcca58-842b0e3367emr15279810b3a.2.1780916516054; Mon, 08 Jun 2026
 04:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-9-phucduc.bui@gmail.com> <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 8 Jun 2026 18:01:44 +0700
X-Gm-Features: AVVi8CedRoipr9OOnup0ZkfX76Kd7vpaIrvqocnniiuTgV7U4RTC5IPNi4Uv0W4
Message-ID: <CAABR9nExkENpP17sMxOeCLA288kU24ftvDBmXC6ox0wdo6+6Yg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for the review.

> In my understanding,
>
>         [07/10] patch
> (A)      - devm_clk_get() -> devm_clk_get_optional()
> (B)      - use dev_err_probe()
>
>         [08/10] patch
> (C)      - add clk_spu
> (D)      - call fsi_clk_init() from probe()
>
> I think...
>         (A) should be 1 patch
>         (B) and (D) can be merged into 1 patch
>         (C) should be 1 patch

I understand your suggestion regarding the patch split and will
rework the series accordingly. I will send the next version soon.

Thank you for your help !

Best regards,
Phuc
