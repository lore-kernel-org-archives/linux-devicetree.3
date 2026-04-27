Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0917745
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777249170; cv=pass; b=Sj9rci6AHAkaCJuXA7edNWt/Yd49scJbNIo+Lqt5u3T1XkDB3/kFcNIrgn7WEZVTMmjWtlU/+3ivasuozJp4u/Y6rqK1x2UbNLkiSUXSehjUTUcqLuzUXVyVgDzOVYw5D7yUoG2LNn9TK3wSsqJC/h30clieAMzGoOYDY02oSHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777249170; c=relaxed/simple;
	bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ko39+7c85WhTvvI9hWPdspawFvKfOz3fhgQz3p8hSwUolttxAFSG74licV9t5gVHPlM/L6/3dXOTb6ycNRQIZq4RhD7h8Le6kmW/5oklZMEkhjgayq/uebjFMqVHQiDLxz4BCy1ZmcAeNJPbvT0BwjfJA11ZotHIm+bZ1YcDJv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Co9Xs1UR; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Co9Xs1UR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso5515242a91.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777249169; cv=none;
        d=google.com; s=arc-20240605;
        b=lZhYK+qPAi8dj3fyoHuet/akD830tXVfC5hrN1vLFISc7zFGcKbwvF9IF2+XjZ76I/
         MeJFPQpvGaOWRq+BdskjsqOmzMegOVfuK5xjCXX8DaMOndEofl8at1jVjzzziJY51Ppq
         4txiWwf6jpLQR/35cLXGeUPYSVynoI6YQhixE9h8J4N2TcI72KatqX2jkCzmKvMA0tTS
         zS7FjMM4S1jNZKmlg1XbqTwuhiTvpoGfDJFLGF0ArVVPmEBURn7ZT25eXSDx0UfHk52d
         CQvMzK/gOj/YslvvhLw95pL6VFY9TXGvaA7l8yZ0j5qWfDA6+efyqHAmjhpjoWbBeyUi
         GK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        fh=4NXi7Rh0Ye93k2gd6XZRFLw2JNHgXH8W0ZqklDDAWh8=;
        b=hQGAz4ss2leIxQinSr/G/j0YYgfIOAf92ok467MmDL3C5/UquFYYiyewdSQsbCAL4Z
         jn7gKrGEPMzS8LMk7Qxt2M/r4IwhAvFQOAzFlsxAb5gJmt3Ly6D7P6EScGUd1lz0Khpp
         dhIn7m2wWwjf1oRNisrv8n81YvN5BI8I7KGWMDZaTnELcdheB0DdQgKgvMyZneoAkssC
         vRXI8k1V6IOcYfiNBRZvKQ2osCsar+VmmE7x4EJRlIxuBWG67PJPfQ9fjgvgPoewM8wa
         vmWNMmHTe5GyDm0QJ9Yj+p4bx1K+V7VXaKnHta8LQyiftBZe2udXXQeWUt6abjgREdIY
         A8Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777249169; x=1777853969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=Co9Xs1UR/5GhVp/Mg8sBa3+wMayef/UGATUJ7MRs67G8STwVmPgA+6PkXYCciMICP4
         i/Qza1CJGAjizMKd9JLnz3pJY3CU71o9uRGE9+acb9RBSyVsIdNoTlSGpifhOqnnjWto
         Rb/tUCtdcua6+8VL3TrrPLjaNU9XJ2+6Wn4MCHbXXAanr+8magUJCH8cGzFn1l8HPjmj
         kuxIJ9i5xQ5/kkH1Kh52hWJTxRYBhzAf0cJHB5hE5Mm/hWLbh2YKUMXaQspcP1FCHKN8
         qWXgWJXHNliqbIk83Ca0EcutmocwBhKfRVDD18qsgbuk/S2dVBmrro9gHudHbm5g9YSD
         Pc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777249169; x=1777853969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugOVfCCiJp+93ixYgWWnYCXqvdHveCQmPGZim7XNpME=;
        b=ftE/ui1jxIEOjMu2aaNps6eKHDn+yI6gaY/uohxAugA0zblL3+iZGI2qivn/K2RkkN
         qdpRKzXKaJMqDdo7omtNGLsI8V8OzMGgVhX/473g/Mc0rEp4lBq29YLP+cA+XpCDt/0R
         nwbTmNO92IeUzn9FsAvpSFK/YwLqcm7REkdDS7ARHP5RBKHktmplorMb9M4DelPKzTiq
         TPi2PNmLMoJJ7ytpX8a0CPkiU6TWCunYCgT5S5QkJgK9qV2D97k5+2eZJN5x30hm9uCv
         wmzIfRj2woYBPeeZF5TsGqU1ferRilVYAHMPMTbumOgo7YQ7S6pwsu8Bkpl8YNeynxMR
         kPLg==
X-Forwarded-Encrypted: i=1; AFNElJ9D9RXS71dj2PLvL+Fm7tiDP+rhw1Iwgiq5IFFV+ILZUc0YwzsLJoZ0LdyJLHVxcl2B2H+EZsqdaZLn@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUcQNfBYk95S+Vu12bKLgLXKoQOas0+gQQwap6w7IO+bnnC0y
	T4l+NQ8AND7n+ByaC1vXVQG1qBWUu+DhJMC5xPrDfPflkElMnXI+vTJJ3HIuYxtYio3SCwDFLks
	Hsai+edoykoossugEggAOFxVATKykX8E=
X-Gm-Gg: AeBDiesDf65VQzAtpQwThVcc+2JH5qHzQCLbuJPINQDRYKa2IvQA2kEYmskjUhVVyf4
	HxLpi0UFK1peaKqR5Or9XfEXlvErI6wrj4VG5YwF2Gxw2UXD1l94E0ii+KMT5TQ0kwazPNOXC77
	jhgC/JYWdVaF/IoBTRRtjwbvJ1ZgXMsfrx8gH7LEFOPRJVALU8agyxqfw2bHDp7mnWGjQJhGzrN
	Ag7/3TLBJOXzkZkyT2B915oaM1aa8KkfgK8WgzFt5aQbLF7DrQAiOy8jeSYkc50J+rBXkfJeSa1
	mwVcRldVfK4pWkQHQ7wKmdy1EceKfBnZhb2d5jAcXpAjk4o=
X-Received: by 2002:a17:90b:3b4a:b0:35d:a4c0:a0ac with SMTP id
 98e67ed59e1d1-361403d61camr40703643a91.3.1777249168661; Sun, 26 Apr 2026
 17:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417021858.6582-1-phucduc.bui@gmail.com> <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
In-Reply-To: <a145db93-a8ad-4bee-8404-21f356d7d4ab@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 07:19:13 +0700
X-Gm-Features: AQROBzDh5S1ZBzuVxFYQ8RBWiB9vcWv-M3KhV5VA_7nj_DMjt8E8DfNhVOVUkdY
Message-ID: <CAABR9nE_vwzWwZ=2bbwTYgEtp=SGDnzVUA5Y8jp7gp-Ky8MN-Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove the redundant 'type: boolean'
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nick@shmanahar.org, dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, lee@kernel.org, 
	heiko@sntech.de, gregkh@linuxfoundation.org, linusw@kernel.org, 
	zyw@rock-chips.com, zhangqing@rock-chips.com, gene_chen@richtek.com, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> Why did you change one file and ignore the rest?

I'm processing the remaining files with caution. Files without
significant descriptions or context will be updated in the upcoming
patches.
Those with specific descriptions require deeper review and will be
handled in separate patch series later.

> Why did you not mention previous feedback I gave you on your patches

> (some time ago), that there are TWO TYPES defined for wakeup-source.

Thanks for mentioning this.
In v2 of the patch, I reviewed the previous discussion between you and
Connor regarding the two types for wakeup-source.
https://lore.kernel.org/all/20260316034606.11304-1-phucduc.bui@gmail.com/

When moving to v3, I followed Rob=E2=80=99s suggestion to use true. I also
sent a follow-up email to confirm this approach,
and since I did not receive further comments, I assumed this direction
was acceptable.

https://lore.kernel.org/all/CAABR9nH3hr+Y5ksD0cn3Gd9XUvmb07X7zJw0b4k_yVbnAu=
z9=3Dw@mail.gmail.com/


Best Regards,
Phuc
