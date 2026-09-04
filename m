Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929E265623
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491512; cv=pass; b=tSvg98slIf1Nn7ZLEsgJ0QWaxYI+OG8Q9Mp7NLKfQA7h+UT5khgeB+f10V1fatK2lI1GrSHqTKLjmO96aFG1uiiI0r8rQaaIQFYH5fVpQo0MjI/ARfKHN8U6VNGK6xwH6iUPL0Osr5HsjvPnvRpgfbfSOvSDilc3EthK45ho7Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491512; c=relaxed/simple;
	bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1IahoOzMF+YkAvoJYszCZh+ZzJsobrqXOfUx+l1xAU02tKbASu3K0M8HAGP9VrY4R1fln8WEWldChh46NPcTpfUvM+Z8D0se9EsrCSxwnAeqLZ7sGZTheV9QMt9xoplFSLBUWfVdFAhBNy0QUeiK+haNhdWHkfQrPMD+8Lc6a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB9L74Y/; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB9L74Y/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8f265cbe6so4486385ad.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 20:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491510; cv=none;
        d=google.com; s=arc-20260327;
        b=otSN2wx6dnoxYZqX3vHTwDGJyWDzKDvwDcDoQ1zCd9hmKvvoh8+SS3IvucNsWaM3YI
         Ujrsl83QuWh3io9PY/RkU9ei8+EckUa4NCWe6j4PS0qcvWM+2Xm6kS6a3kpk7zj9q/hO
         2sGUELhRMxypUKyltFk7b5w7ZEuoUGqZ+BawS6dZeCLvWTpJwM0l/nspBiCKlLttoqme
         87do6vNrlUC9kF4OAqFhJQZkTU+PuBw3w/R+6fkthym8k549ysd7g0R9BOLRxloAQE5H
         4kkPM0364bnlJtta5jn91qY7DiQJrqbcsbPwvUX60GU0g769fsR+7sE0P6na5633gNVr
         JtuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        fh=XvP4qL01LMn/waK5HTcO6xHBFLxaZ8sMtSKIfXW7/rQ=;
        b=HN1n8Nw8ROIXqet8MTw61RuOZHMfWyWsZk6D4k3LMWXwdDDUgqNnoRBTNymsoyYCLn
         Uier45o2gabPynErxzczrIvMhN2Mb9F0W25jo04KlLqLptX8fVTSth/UL/cYFAJHaiel
         J0dILxlcflwA+yvE9lUgFZVQPVy8p63qe7JXDk7LmeWLBYVAXe+rJQe1aArZkrcv+EZG
         Gbc76Eata2Xud0uBRC/5ZC88JUKlQ5/pfRN7mCwEDP5uL/AiXtKnnFtnlmLpydMpSlj9
         BFxC/nGUpH/Nb/Yi1Da2deMe3qYl+GYAmBdbellvWyf2oTOWrzvBR639fawga5x3t0/t
         nQ6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491510; x=1789096310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=cB9L74Y/322y7ZV+mCRyplO5gjZFLkjeXcoQe3JNT0KFh3EcB958KWB0LSyvDdu8O0
         HImua85i7oVVPDUdlsEDnerGun9UFBx3klouyyJi7c7rTXcH4Gr0eFsxR5s3kji7Dk6D
         Xf1nOzWKDpkYg3srMPFDmzOJLIhsHsTaHCvctqWb6hhLOWTGBr/eub6cqcGKF7rtZTrS
         GLuu+M2ZhFLwaegHRJA5MIanOGBpxTDkHCccs2w+4JpY5yUY/zDbxnVia7+2LUQkUumo
         FwfwsY7y6CyIDEmJp8aYIWrJdcGkQycBrhn45YJm/U5SW9D7ECgq6pRhZn9GtUHIH3J0
         6Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491510; x=1789096310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=gBIaZUFPUeaezNYlbSaWnG0wiPH/fVq7Xj/dEbESOSTadPVN9kplT2nB4IawwG/oZn
         okbVYoLgJ42ywVU+cosO2ERFgxLGH5d8qsX+osva4XRAZmAARwNjN/MXS3WHSStR8ZRB
         KqwdB6YrtOCNpHZlDX0qNLMitaSYn6U8VcAmNoPuvvstlUKIG8h1voXpC1s0IQgGZqXW
         GgBBbt/JfKy+tOhL+KHpEUHtYBYiv8+p+NNXiNhEq7rwHY0dXPH8bZn+uso0wpA2dmYV
         fYdYwmQFhi+xtnavs3FLDFjvucr9ZfdCOaevzKNUwQC16hfDCaeAuE2yzy8Nb4BxHh7B
         Zflg==
X-Forwarded-Encrypted: i=1; AKwUvByZCqtzMT3ZIrpToIdUwHf/Jsuq9cYyh7648ImRvVuh0N5F3ab/nr6l3cZQhTin05s+eLb2EN7a8XyJ@vger.kernel.org
X-Gm-Message-State: AFuF++l6wxUTns+6vJ4eaTGzSbMX9bAyrwaK8HGruC0Nx4KhfNRs0I+X
	v4jKL7C9ZGNCtNXfp3aKmhPCAIfmKIb2GufbW4bEmsulr3aT7C/bjZqQZ1dMQkDAZRZ3qWu1gRN
	g7PH/CtI0QrM9UnlDKgwBk96mAbnte58=
X-Gm-Gg: AYBFou2A4zdwTwoxK/PDU7Iexo4w4Rnd6MpP6JsyGWuRMdJy9AYk0O/w3JGtxW/+g89
	2bCqWl4nVlS3C1k2eVsWrBdXwOm7H0dkV+m9kbZ88NyJ0T9RL0UI2iEvBz+2QFFnJ1utkZq7VbO
	+HIWiEf55S0JsYpk4GnQ3U9rmEzQiDYgZYpGtyYdGeDr36eUGeQ1dYWF7sWzBylv6QDNc85/9ck
	QXAsNH2JtGS8VCwMnK62VQTgkCEWrWgCBdnQ24kfDl8JwwM2UxdPZDTEjOrWQT/hPFnVx6dqkas
	FmkRsvpqRQuaeeh4+zMW8xXzjFWIgV0JgnIwOnfwiPXO
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id
 d9443c01a7336-2db127509bemr55944165ad.15.1788491509602; Thu, 03 Sep 2026
 20:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
 <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
In-Reply-To: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Sep 2026 11:11:35 +0800
X-Gm-Features: AcwNN1VSQJhguJNnq06i_90XVuMC-oTCxeandMzLTYM0L_HXyiYFRb-mCLJw1rE
Message-ID: <CAA+D8AN=ZSPDK0HahaD_Ki9=RSfofpTbphFz_eestpZvmFpYfA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:41=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wro=
te:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >
> > Each one or only the newest? You will be getting the same questions.
>
> Each one.
>
Should I refine the commit message with a new version?

Best regards
Shengjiu Wang
