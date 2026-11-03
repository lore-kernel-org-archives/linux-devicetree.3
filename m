Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793683206;
	b=putNHNC/9y4cQF0Cn5rXqC0IoTPtOobPwLiW8VqoOkXy24K7rIDzXS2TSIlBBbWiXdxy
	 ylZibSeJfTBO0GTBQjnfaa1Ad3Qn28b1Ac2pLUyeQ288vYzOgUJluoUCw6t8vCydf2DjG
	 x1iiRJ8LeUC5ZvjS8Q236bXDVCWrgkXmgm1JNkuqIIKehP1KiHRRSl6MhisZ//wwYvFJx
	 5J18JOl0wVTVVO3zs4L/MN7GUcj1hKjeSq2rOJOOv1W2lDUhpzuL+UzT9gQjdOkPTreB4
	 /0VEIfNsEpqX8Tujo2T5jYOosi4kSQsVVWVMomh/dyfuWIBdr28z7ODtCgNtbZxSFZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
	b=tTf5AHGOdh9P8jwr+SRXR3XY3eKihyInuPzlR12G9MqfPQLuFxz7wsHWm/Lfd4x8Vsfv
	 IRn1C0zl4jTLJ9W7oh4s7DHMISR97ytNGsZYDpmEnrkjeJpds9zEd9H4sSNcMVpLYZ7lb
	 /GWV9eP9wVTzKrbLwMUGf1LxOKiWUXogvs7aWskNxP/Nz9nWsAnfwQ4lWY/kOBZtguYE7
	 YDl9RMkk0Zi+KyQPxhrkfVc7m0831UqnMNrI5VAnf1uJqu1xG/dPDxoY0GREh8mF1TIeO
	 oEdq0mlbpclxdKcCC4lJUY2pX6Nc+Hf21t9vHPcJIddN7BCpardYsty/S+RtoKXXFtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K;
	arc=fail smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890C606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 05:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9890C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M3IzuS6K
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40f29667e6so570850166b.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 21:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793683205; cv=none;
        d=google.com; s=arc-20260327;
        b=AL0GhsNJ98Sn/LEj0C7cuXqnNykt51cgZFvZPnkKoYL/GK+qkDseGxJKBQLWhsfzqb
         QvNpV3k5YeyKwos7HM9Ra4KYvuEYPjBK7KvYoTAo+I0/s9qADmvWTqQFVG5mU1KwB3Kn
         jJ5dBur/vsXjCZ+zGH5MRolPaHWe4MdDaJhg54X2CVE2SGWdAAgGr+xVoj85m1SN1w21
         psT9P1PZt91C37IhOVBUSpyAPyhl8UBqLp65F+ONpm6ETNODl0MKriJEZL8x7HkoYdVL
         DJt4nErGwfqavJ1CtfYbknai7ZReOpTxe///lJkSKrDPWLDCMs1Q2rLLqukUZUSaS23Q
         HRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        fh=FhHXc8dX9k4Ufi0RZS+lC5RiQkL16cclIg43enYLyy4=;
        b=XHdsfgEljpA4OYZk//oXF7xaD5i28Xjp1+qkGqvQeGEghuBnIqSdjmJaaSfbiDvFIx
         MlHAZMqTqADmOFywL5PintgYUmWPaaUU9w4f8aadQTlL2S0Db+c+qnggFA2Zg5O5uUz3
         FRU1PKr6I+WsvbnraAfSB7ML+wdVMWYhE/Xv0EtW0vWqWoaKnBZoPe5EHLOwtt9RAe6y
         +bP0swYXtDLg20muTbzcDgpn/1942whISy3NroBvBayGpuu/O+XfYWoTmqbGWSSFpoGy
         SNy8SQvoYH6QiyN2IfQQiDW9ECabfQISz/Mmidq51FhOgm7bXM6uULe5tD/q2QbGROE4
         hz/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793683205; x=1794288005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=M3IzuS6KCu7o7iNdl6VPiSqbL231YdHzMgGAGeXFG8t6cpxlvypNiaYepyn4x2q7lW
         8kz4Bd0tu+pUrZibEHgqYesViY87g9GQqCSLj9th/snQ896c3FaJUifwQaSeDR7Pa8xI
         1aI6T/YUi2gSYRbgsFpqRl6qZWUmyXcRe/ewVN7NymUF+2Ecv5CfCjPxXr9nzYCuJyr5
         Mu9rOsv9QNU0vog1DRT+tsGJQWJTZ0aeutV9xLpYyJTgV6H80RBA7V3WgEtmtlIJadgF
         zyOvk8b3soep59A6arPrSJn5O0RxtLkPGfHbgH3i97i586HN2pdDJ9ZuhsQF9DGPzUTG
         FePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683205; x=1794288005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=fHe9eOR++m+8hyL7T8DDOcD72kPFou5ewnIuUIsWGzX5WL/+lbl8YRlKECFWgwWCzX
         lCZ4+jPKw73dv7cN5XsgVWGzotkDpf7+Z/vGXYWP8+2z8n2nn/aC+5aUmIQZMdO3Q/j4
         1ygrKLdbBFAylnQV0PnX0soH5s73pQ+rmK75pyv5pFaD1W+Xb4iyaOfRWe9u+qGOVZik
         KDOHYZnEFCP0vUWnpoS1WkvrzPhHOHe+cEpDn/QcqHbmLtO8UfnJ+vy4U7xkYzzlsO8y
         adlrvMJ4fphhoL/8Qq0GQdULkPLQmEPj8+FZmy4NU4U8OyO8b5qd6+YzvlPKSTxd3J9s
         qSHA==
X-Forwarded-Encrypted: i=1; AKwUvBxiZy/neOva1XcCCArcgK9c2oTOum70dj3uWxQXISgt1c2XR7NBwbTLv2yusWLLYo7frAZqsxAV2Ckr@vger.kernel.org
X-Gm-Message-State: APuU4Z84nw5fv9mgJwgCjLQDxs8PloxYxqC89lHApqXePrbbuA+tTFst
	fP1F4aRGzmrmUhbirdZ21muFX65uFRA3/8hifA09qTTntclazXct8j5VaLwt2v+aT8Jj7ZC2kR/
	BjI3BoBjqNwPuvDRZN5pHql2mMZhtZNE=
X-Gm-Gg: AYBFou1OqC6qXxmmiLdJChiRfhJox8uH4eoG7Zu7RnWysiX9J+2TwA6Hpu9/vLrAkLH
	c31Bp3yBIPGVrNbAL6GHoignezOogKyOd7g2D1fcz7Niq/AfGa3QyYP01kjKMgtCqMQ3q2fo693
	V1JN0Pz5Beui6/rtd+dqZSD8rMbYpLFGE/0v4olgZj7vEummAQrhow0DDWQJcMlFSnORYhkTE4V
	XDT01fcYnWYz5QCcrilVlRKCviCzW0UGPnPpV35TeIce4bfe8Xd0FnUelJeOWbijTQpHKZao86r
	MNdStTg3pf6iyIYNgiC/q8pQuajOO+dmR9/Tq4BrOMlLQFECxFoQZTlvps576ablc01RQPEmKOR
	tBFrHg25aCQvJLyw7Ku0NJ2aycahEfyxw9UN5bVyePGjdZ1sImuq9sLQaX5M=
X-Received: by 2002:a17:907:1b27:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c4ca7ac00e2mr960824566b.48.1793683204767; Mon, 02 Nov 2026
 21:20:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com> <20261102-tough-brawny-rooster-a3d3cd@quoll>
In-Reply-To: <20261102-tough-brawny-rooster-a3d3cd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Nov 2026 13:19:37 +0800
X-Gm-Features: AclHuK9QcK19DBzWKX6U7B2jdmB2traqMfPAukSvaMhLFGEyPx_6lzhivdpXnb0
Message-ID: <CAA+D8AP+=qDya3JDPTn0WYTG6xvoc=ORqkTF5FNWvArgd3DB6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HIFI4 DSP provides an additional debug reset control that can be
> > used by the debug interface.  This patch adds the `dbgreset` entry to
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> > the `reset-names` property and expands the `resets` array to allow up t=
o
> > three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.
>
> No need to repeat the diff. And if explaining more, say something
> useful.
>
Thanks for the comments,  I will update the commit message in the next vers=
ion.

Best regards
Shengjiu Wang
