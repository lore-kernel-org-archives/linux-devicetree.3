Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322983E3C73
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994550; cv=pass; b=QIvrac9KtfoqIsRJBxlJinl1Y3FzSgRhO9fq9aMxh+0iV0NY+eSkmoY0bd/TTBzm08o0GIDhGaZ42/teNgc9FXJRsxkCfn3lWJmV1GaxWeKPeLQKVzDt7+1o+XM/xmBiTTmzIjj1XpO2hq9aUchqOYPLVcrWvM9xs4TnxIIE5h8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994550; c=relaxed/simple;
	bh=TjqNXTdYC+1KhYAgIl8HmOtUZ5YqrP5H9MzSQdXyhXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUluWiUb8Mc1mTm12i+obug0v9/4evPEirv1/7NZ5GcAiyzugrCW4RJL3GB02WHbP43LeyEA7zDyDP4UUHJTlV8ttdpLrxCcsK/nFErRR/Bj3l6TaK9jQ+CmOnUgYWnI/Fqos5eKLVtRlUnspSOcTbXg3kJuuldGM/dcJcctEPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfVi4uv5; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfVi4uv5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so43604105ad.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780994547; cv=none;
        d=google.com; s=arc-20240605;
        b=bQarfEmzsfvOsmOsVQO3n6cZ4T2Q2MXDtHPc1reEE0xiaDqV13ZgYhQ8Nrue2EXc31
         zKEy8bcrEOoFfwCUcwb/FpsjLcDp/NblGCM/dbYCVAX9q++3esQYgx4qUMstoceHS0dz
         oMfcIdxI8BVO0IUfG48F6gw9E/romqrPb5GqPluQaP8pUEVCW2kS99BJd+gTPjJ1TYpM
         JNIOmrH35ILzNcRBIK0tke9Y25tkIPNINKiAPkkdjLW09y8O/hkSrEvFZavKnPumGylL
         bp0gSlS259RCpEKfpKEdItf2b+YM+D3MPUAjwSTnBQERNn50fUidrZR3CzB+xhb8fddO
         mUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        fh=VThiNWpr8uNrfdQLqBJg5d4ZsqLW05RsMJuQYL4GFQw=;
        b=SOqA1tVfCGNjX0Hf4lEEY5hWMwa3abhm7zdGCiSXLX75FXOBj28IyuRT55e7sWYuDp
         1hDZdiZxOJR/1KAaGiUbEG20roQDeoXNCHKxIxDaskIG3pxPYxeeLY42EPb3TYI+9dvl
         s0gfTR0c1cOKLbyvd+v++nJXi8pHIoZgq8Kb/3WPqcMQ5e4vXuM/kwUo2TvlrCg7Y6ch
         shqaRqpB29EI3iJPxJlGNCmWQMIubciwkexHBRaTpNJFZoOgcxoyQrGLxLymv+LbHmqQ
         VzHdH52nz1n5h+XLL4G4EOkUJZvaPApHTl07mtr/8iJvmXpIJozZeuH9h4K9aUVP36E9
         yO0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994547; x=1781599347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=TfVi4uv53H8yG2R98vcKA7AbOiAdZAaJhhL24N8bX+x82en6ezaakEsuUwPUjI3BNx
         VSAWliDQ3+1GeC3FYAJLesknwOZjU+Kw/gl9B7fU+ZRY+Kx3SQDMGq5nJMk6O2zx70K1
         JP5nHk9QbP+GOqQMnq00pk67dz+c9P7yBE7tsN2zfq9dKZr2B1s0Jhbn7ux5autJKQ2R
         JX9yxUVoLeIPotjeHwdwTwe94VqAu9WBGf5KaOH/Tcg/LuoIygCpWACCvm0oLzMhF9cw
         o09t7yNFVk7HY7WLNkmoKsIUvfqpuyEbnJRSH1qjuIa30HhSFyAGJH6Hk+i/Lf1ZSkFk
         dhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994547; x=1781599347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qPqHTYj5+3o9CDqA1Aws4t/fATKUlA4bCQo4IUQbSA=;
        b=Hk4v8vdoiOP7Q/fIwvYaPBx5FP6GS6v5dmpPDhOB3Epfa4nhhaecVYm2XUGlyne+0o
         +4s0U7VTJ81QveTuH3mGAw/tRrX3Akwk1Jx0ik3/Xs7ikQvrboTV6oC4ESlUjA88ptbq
         THZ322mS3ng0D33i2+kj3kLTn6xm3aMmfZ80ZA3J5WQg54LtKOTxiWbHb0pavM2esqag
         l9ncO0Klzl2yE4RmwZ+NQiVjhdR/nO2bdsZLOCXsWTwW2lwHB8z8tsLB8bLGvFk7F4dT
         5pcOhHh2gTSzJligECoDslgbEAqKanBLtR8yBGND2rNL508DJyo1C17OqvzOlDPbxF44
         B8og==
X-Forwarded-Encrypted: i=1; AFNElJ9olwiGJy1Z25z5ECRTbe1h3IgtCtIDzhvqoKrT8cFqh3LmO2+ByhvBwIOQDEgZqV+bKz+LjgSUbsx/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22vDKg54xDNdN8pe5pEBgVAEvFirao99LbQNevvpWmljyjRaK
	kPmh3r+hv1XsFDLVZ8GiafS3sTogzERk2ZGHKrHA6weeq6nWDyVIFkP70X4XSVbw3+bRlfIDduK
	tAd65A6MiidYJ1Bq6EOew2T0wQzL5x/U=
X-Gm-Gg: Acq92OG/0TDFKjIMm6m0RIdHrs4gO67tpIO7CK+0La08M3c02PEFoiYSah4socGbDOR
	3wrZxt6dqK1CLrfBS0pBlbyYOghvIwCLEeyipjuUYstgSm4XHNeQ7dRSyIdfg4GpVm2/icNV+WS
	8Zld4/mgOw0kJErw1VO+03kk2mtJFU7ur4eWNTSpNY9SKyVNSFsWjQ+YM1v8IkIuZ+nJ6aJtbm+
	CbwEBxy//Yme4ZU+zggxI16i7woXLnkbvlvgize3OhQxUIx9KvgThH44D3sBWkuhair0Aebgy5v
	13QiGiF+prArLcKP8YHMoXOmaMeOWIk5tqExDjHvr5U6xDND2c0Vv9Y3KME=
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id
 d9443c01a7336-2c1e7e527bdmr221175875ad.14.1780994547276; Tue, 09 Jun 2026
 01:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609013107.5995-1-phucduc.bui@gmail.com> <20260609013107.5995-2-phucduc.bui@gmail.com>
 <20260609-nimble-guillemot-of-karma-bef5f1@quoll> <CAABR9nF6uhEyCo-6cekhKwfm3zkqjXCpj2O8C8Xk=2Frw0arRg@mail.gmail.com>
 <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
In-Reply-To: <6103e3fc-4b27-47b5-aee9-8b481759eb65@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 9 Jun 2026 15:42:15 +0700
X-Gm-Features: AVVi8CcPsj0hRF2MDcCHJjJml-KAPCz7cDMeJub82nt26AoPo4Fq3Pllieca8tM
Message-ID: <CAABR9nHBA=sZsw54RWMCg_xdDCeo+stnSYg6yACfzuJoMNMyPg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] ASoC: dt-bindings: renesas,fsi: add support
 multiple clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for clarifying.

> >>> +          uniqueItems: true
> >>
> >> You don't need this, it's by default.
> >>
> >
> > Could you clarify which part you are referring to?
> > Are you referring to the "uniqueItems: true" property or another
> > constraint in this block?
>
> The uniqueItems should not be needed.
>

From my testing, if "uniqueItems: true" is removed, the schema still
accepts duplicated clock names, for example:
clock-names = "fck", "spu", "icka", "icka", "xcka", "xckb";
Since duplicate clock names are not valid, I believe
"uniqueItems: true" is still needed here to reject such cases.


> > The hardware supports several valid configurations, for example:
> >  - FSIA/FSIB slave: only fck and spu are needed.
> >  - FSI master using an internal clock: ickx and divx are used.
> >  - FSI master using an external clock: ickx and xckx are used.
> >
> > Therefore, while fck and spu are mandatory on r8a7740, the other clocks
> > depend on the selected master/slave configuration and clock source, so
> > not all of them are expected to be present in every DT.
>
> Explain that in the commit msg and be explicit that all these further
> clocks are optional.
>

Understood. I will update the commit message to clarify that
icka/b, diva/b and xcka/b are optional and depend on the selected
clock topology.

Best regards,
Phuc
