Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9F93382E8
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429085; cv=none; b=h4beILvOZcnlnZsNeHjyZIiv5dT6c7D9/jJkGmYB4J1Qs7UW/hKr+3uV9zBLwkztN4yaL6JWB06Y68TWGH4TmtSx6GfXV6mArjboz5Olg2z+EwpFcS1nxCIR/IqlknfpmfLSQMN9TCw25w2mgLTQMJraQgWK5zOCvDRFCesG95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429085; c=relaxed/simple;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma1TxcXeG9uWWgCyK5pwIoKZJHypG/k3kQh0AzzSigyHdaokeoOJipvEclBoL0GcXDYUuBN08LT+HnAZkRsvOQQqhCogtkvD+y5G69RVHxZ+X6pRWJOPSEeXg+1z0MhxhomBfLYcSoVwwr7mosyymff1/obuZAm+Kpkpi8RkiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBOcDBMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBOcDBMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC5F1F00ADE
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786429084;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FBOcDBMZ1Uw1fqJRo8015fKH6xO+wyL161DG5zJ5ra6cUgNDz20Zb02aSHfjpktOf
	 FldTdzP+FckaDhsqXc9GvmVj3PeSPuKrM1gyMz8Sip1UJdrIxOR7vIOAGwwha1QlbC
	 nWcLqgWrB1Se0Ag+kVHq29Q7N21roI2IGXZnD8oqFeIicfa1asvDo5YUpqRf/g0zFT
	 Qf6rvxXMMpDA+MFpzkL4CQHimkylqs5G3wS+voItK1kXAOP1ub1TXLJXpCzaW8K8g3
	 +Zan82mPHYNO9xMJsnfJ9C2VEZ2i7uSQP5j7xbrkDVkTVVFx4ublUeFNIckQprgMHS
	 0iHvKPbZ/f1KQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1982670e87.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 23:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoE+pjG49HZ7BQLhWsA95P1D03i2jJmB7GuUylfOJq4cBhgHxgfrjKEH/XfLywPaXGLWU10SH3kW48v@vger.kernel.org
X-Gm-Message-State: AOJu0YzXksbkzWtL7ZGGea+tJZ055mmG9X6GHnREHXc7j4CW8pNSAjqF
	nHrNkSE9HZ3BE+qYb/w1ICrFuaBqHZoreQAx2o9hjMqW9cDXVWcAY2v9OWdi1FkxSfK9v+zo6qI
	hb6bURHpKsSCCoSyKtFP77RQu5CUvsck=
X-Received: by 2002:a05:6512:3c84:b0:5b2:aaa2:1d97 with SMTP id
 2adb3069b0e04-5b448654039mr150789e87.48.1786429082679; Mon, 10 Aug 2026
 23:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
 <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
In-Reply-To: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:17:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
X-Gm-Features: AUfX_mze3ESUSsSYW8CEZRJNkHQmDt4gP_VSFyh2kb488Z--smL2Lv1F6RAXAFo
Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 9:27=E2=80=AFAM Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
> Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
> <linusw@kernel.org> ha scritto:

> > If we can get a speedy review on these patches I don't mind merging
> > them for v7.3 already, it's nice to get some movement on all the
> > nice Airoha silicon.
>
> I wonder if the same speed treatment can be done also for the clock drive=
r and
> also dts?
> There are a few patch there that are currently blocking usb phy and pcie.=
..

Heh not my department. I think the SoC maintainers can merge some
late DTS patches, the clock driver is up to the clock maintainers.

Yours,
Linus Walleij
