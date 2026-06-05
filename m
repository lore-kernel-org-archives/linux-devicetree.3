Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA03D3C1F24
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 22:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698589; cv=pass; b=mXxDNUCGgqL+6L8F7yTuHsedCcPbw4sMJygwdPHH+tSoteShqAfVRARdgjLS/mMzdC/ctoBJajqKtMm74RRXPpbgiVEs6RfPsDNUlD/cPo2n5I8c8uC50r9wfPipY7ZTkNHAxfD3oTUit9ghVg1wRVA1D+hBy7x0mgBA65RyVJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698589; c=relaxed/simple;
	bh=+hJ82CmdEVkqjDDHhsyrW4LNqGqxDk6mnNaahYCx5HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6wPFnijRypgyZvlkp8n3NO/klkgK7rYXOk+PpGAqTiyTUooE7dNinFqi3+GFk1k8GnmSNJSJtDy8ig9834cxKVTRcb5sPBftLwoKSIybMXxUdEep2KOmyk2WFY9ckvPXqSXo3drk8nhjG71O/7vRsx86Vix7BM4/ggAbkHrjQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggF/rBcU; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggF/rBcU"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8589498839so1107273a12.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 15:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780698587; cv=none;
        d=google.com; s=arc-20240605;
        b=YmiSlSKqeLntdAKFPGJ6ZUqNtz6tzADsSz0BmHlsn4JbcAqiaV2l2215hUqQK+UBQL
         iSk+JEVhCN46dwdwxXbUzSLut9N3zmB/D97jek5KmgfFTkbcbhgkB2+jMIStWOa5k5ri
         /7EHgKUfhvnPmED5JvnPPyttvKvTQ8Q3ntHwpVqeG9WP2Nl1IM56LvI9vyB7PzdL3N6U
         swS6Y5z4So/yxWUAHPO9sealjetpdMvqpz4BPDXNrAz6zNQzSPmOe27km813fgjKNs5K
         jAxs5YZupeCj+QmigIjaVhvP1pj8zcJGxYEv2AEl0KgwK/UZv5iqT4OLCjC9+C4APNez
         7DKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        fh=NoprP26afL5+bKLGzXCq8Gz6P/kh4+aOklOhHqFW04s=;
        b=CT7L7wHpBJ1aVNzULlITrX04eQqqc6WWlOd8qqqJuz66abAq07ZnEcBNoxCkq7SjYI
         1VXpg4coWclEYyQb2KnygdpVTVJRZI/8EpaJ/5hysDBw/4snHU38hWoJX00B+wpm6Y6l
         kSr1l1ubOUUaFEHilSUdeF8PXFd87JFn5q/YWwJz1CYrygQBWdqSErftekjhzusuDoAt
         hIGDG5Ty3UURe1bTATeadedpN62W8hFnWXmafRYas9kmeNfo6ZSi6GVnX41eaSEaL+0z
         ihQfIRIUBRelscG8X5JPEhJoh0VDQ81IPcJ7X/Wdwqg4cYI/7rrjxrRB3cMTHoSLmCrl
         wMWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780698587; x=1781303387; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=ggF/rBcUcl99HOvxNPzHwpMMrmOUW699YoLTrMY5uPui/IAYAqH+nnbU1mM62ACL82
         P67nb0j5d6rftNk+bltUOFbn/PtxzbbcFdYEmrZlD1fhDrrpNcX+6dYrtWxBF4KpsG1e
         1oKWWmwAZAih1TjrMXThWb+n2r4ql2xyAiOg8qPAtOFA4e/4kxN33jzQRbrmp6snd9tm
         U1vRsLHNvittaVgbXYYLkf6ICXVMay/FKmtGF3jn+uw44a8wVwi7x+MBKKFEsKGztiqg
         ENLIOsoFUH5p6LLIuQrmPconDbR8NPz90r4WnWpE3X3vOjwW6NEn1tiKPJ7CRtJAT3JG
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698587; x=1781303387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV9ULzaG79qCwwmOnfVk6C9FBfxcQdzVGSaD3MY9TpE=;
        b=ea5yssjNDK59WQfQqxKIJqV9k/oZmHOsa8yW5u2i9WA6j/1Mn0fnLmz5ZgBDtqMzau
         GbjEEQnK1PeRduJcmefVVRD0ol+tLGQ2UtN/CekPv2qwm1EgihOEfQVgf968pzti/FLS
         BW0TDaj4hg6x7fLkR4igp9spMrXdP7llsWjtUedJGeOy4G5MfL2cfLbcydojkZLVSIKC
         MBZJ7ucfvVyxFWusHtH+H9R9lf7jHv0cIlfIBJ0tyKlf8Kzqx4JCQ/KzXbxfo5hag+WX
         fvOEBp/FBZBGCp3EeHpGG+INWqhSc7z8VRq4mR/fS08Jvud8oRB72AB/nYhHZRMhyHFm
         pVqw==
X-Forwarded-Encrypted: i=1; AFNElJ9FIwMhTEAcu1txerqxWK62XGmSqaBSIPss/aDcYJE4Q2yQe8A+4rIcHG6QtnMadlyPvpnnHW2gkBtg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9xSMxdLdQElx1y41SndWn5bPS70WvkGNrBivhZyYi6SPHcg7
	5eRipjiavUj/WR/0yVmMQLmEx3mjKztOjt5Kd6R8O5dJAcMNcPYvTjPu7lgiabRDiBrW7+M+IRT
	GJL/pBQeySbTJ50oVxwC/dmWriNVEH08=
X-Gm-Gg: Acq92OFxAEOP3v3DsykCq9LPXT5DaqPXSDeWb7eqEpgcfhe0wKXAoiRYDNbOK4E9dM/
	6gLTEV2fg7GKFD/7pORyc/bbx30jaRrdpsMxCdmr8EIuEmw9XeHAFUUNB6N5unn7NNMKCiLfOki
	JwHiEB3/D38IYtATO+VbyBkDXVsJiVK7XAbIaPxGCn5cA5lLa2ZsTPSWCw1LArgd20+3HYgNpKS
	NbWrZR5kKoMbg18c/3XNT2eOfJMM+PH328wer1hS6dpM9xp7VDAzzJXMxjEkj7AlKn7Y/0oiNlk
	JjhCz8Ol9vD0QXiM9Pab/Obv78NewXau7l0An633TY5pQXtBZEL93zdhAPz9qPM9zLxZbDvrsoC
	ClSlnbw==
X-Received: by 2002:a05:6a00:3d47:b0:842:6fec:1296 with SMTP id
 d2e1a72fcca58-842b0e2f70emr5369705b3a.4.1780698587138; Fri, 05 Jun 2026
 15:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-11-phucduc.bui@gmail.com> <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
In-Reply-To: <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 6 Jun 2026 05:29:35 +0700
X-Gm-Features: AVHnY4IxKGU0FIWOFBZ5YgXOV7kRSiKXHpEfhImiSr4YmJecxoXq6aFVUBTuuBg
Message-ID: <CAABR9nHGNVWuOLyuqvjrsYYJBXOFs8W0ZN5PUs3AX4+rM2RmMw@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Morimoto-san,

>
> The indentation here seems wrong.  We're also using spu_count to
> separately guard the clk_prepare() in fsi_clk_prepare() which seems
> problematic, I'm having to think too hard about how this might be
> robust.

Thank you for your reviews.
I think we can just drop spu_count and let the clk core handle it,
since the core already refcounts via enable_count/prepare_count.

What do you think, Morimoto-san?

Best regards,
Phuc
