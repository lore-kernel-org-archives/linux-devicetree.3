Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60AE430CF2
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353482; cv=pass; b=Gsy1+Zvj7iD9Bjf8pyuCz3vNppm5dPMIpBZw1C7XPBsdF2odFQSgTyS6a6BkaSCz+BUujItlSrs+rQwmYZDxpzw3aqNOaHlUw62+Zt57xqmsPPaU0VXYLWSYHPtWLfNjZC6HKXou6RaME+xV6Fnsma7DTWnNj0T8ZbJ6cp5+EH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353482; c=relaxed/simple;
	bh=gCs9HokUb+6ZMGzRlYcfJL9jBr5oqoU0ENUXdBhbWys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ojyw+quajAA0GN2053xp2YpWOrBRBShVK9QLsubbaaxsIrUj2krD4BTOXh55OwLbtA44R1KQ68rhJ7nEX1jIfqiIzv+cO+Et3XyfTq2CCh0wDV0b4RsXS17TsYO6Qu0pD5WtuSmfMGnY6E1Kd+lSANCB8RWvjnlZo+xh72L3els=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GU0hNyiQ; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GU0hNyiQ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c126f9c9567so384960466b.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353479; cv=none;
        d=google.com; s=arc-20260327;
        b=YQK7WL6iLdkd2qsOeNnYG0835cgJKJeG5Sny6y/L3msGDg46+taVYGFaxEOaSt+l0a
         a7/47wiaSFneNoehe0TehBwa+YtMrbvJGJ/53+QibRqnfuJkRcQ3zMYnwqIhnEL3+pWh
         48fCkFbzWtFgel+mpMiiXvNvfUa1Ozw0d0bis4nEAiMeiItrAcA0aUTocC8i19iFR808
         LnxRD0NapTVHiGm1AnaSPsGIGtAuOhVnRMSnNTlproecLRZKd5YHgiZIIX3CjDtuhruu
         h97tN939X5+Kv+PR9dDnrX4lHkWgcTPh9n7wFq1TTSTQmpYlWcP1O99wn8kbcPnSZFRU
         f5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=7fuUHUgcblDEK+YDixn/xzLTjLLUlN7gIF59E4wUdWk=;
        b=Tg/Dp3bSpa8K1OOUlB9cpmdqXm0S1t82SfvPqXmgjXh2iWgDIQ4hrhYPuW+sTWnidy
         dsq6GcDYZklhUoOz3IdWHPIFMVyIgRWoRfnn2BiWpfXUBOBKA5GjUYqAEuBX83CtKesD
         eB3q3HmePeEDDAtoN+T33XK2t/FsTA+Bz0sUc4u67egMC5NrfXojjmerUEfgUcGF/o4w
         H4XzS/GkB26eLcUkoR5sPzF9Fr0R8ZUCATMIm6eXCKT5aNZzaWLe9FGBwo6KlGLDdVBd
         xpB1EbScsiQxLJUIUCR99O47ZCIGhz4tmnFJm2dngCLzKAmLxY7WGgw3ToRtpG+9t8LU
         aQoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353479; x=1783958279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=GU0hNyiQhfhvtxPMVodlt+AWTaFQiCebzodjl+FprxUO9EkdYfpWlsbzU498Q6AjiO
         i9qajWQEi2IYs9FjakI4FF1H8D1CARiHOUz3SQNAsUIJmg2ZVRhcXprA/HyS44+w7wU7
         wXF+htRBoJcS/voWzXEFnzVHFJgGOraswyDjF27NqrB86bnHzznNG7JFYS261uUmEvuj
         wuw5remDY8vHZOgLo+MgiCMz3zUd+EKuWyX8AYDP0AwyBDS6AroY5+WMgR3xD5BS0S3o
         YUZayqlQTCx/jgMF6ntI1YQMRcCM7DjcUT8MXYGL/SoxvWpyxB28zc81Iu9uH3CZKLq9
         FQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353479; x=1783958279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=DN4mgYSA9Dikj5KGJdiJ8lpZlhL9ERAgUqiIj+k0dLRH+R0EDWWlCC7tPddjj/HDd0
         atj45hNyIdAZ/FeCrpp0VuPFHsyHXC4wcVmIv/8COrs7fkjrv2eCQYcD8Ser1rvstVuw
         4n2a7nJIP9KPz1peemSk4agKLUMH0MX/Xe4ybCBLVQwNCuo6Q8G76K0xXNY5KCBkAyXd
         HD/UQiTXFdN6hFFCaKtY2DngbNqyCReds5weRvW/VHQJjI1atok80IJ+E6DmfwQxK9tV
         dBKrRqZ1FIK6Jl5MsB7tHCXQtugYBYFKR0Uxz4tg+AEqb546l+CABhYBa+7RlY+Uq3+M
         XkVA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1JHPXO2+0lbzRWwEOTm5apzWxkYwv6RMlzEwiQwLn5gMv6VA5nKwOdsburCXz/Xryo/C1JgPkio20@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93q1Gv/nP5IPY0/uODkiAZLnl7DRXn5SshiJeO5WPJdvT739F
	y0llb5+dYijvQung3STAtKrbO6IZIZV6KL6cmShD2DGSl7ouCmCT3DfWa59L2hhJB5hXPYNwwfS
	vC3eH8QJepqc+KXNtQ6NIapNMQNtzctl1mZLx2t6YLg==
X-Gm-Gg: AfdE7ckLTT/3UJ/QqOw+2JdIfnd1BNpRmT9gjL8TlSFVUpVcX5pGFbg0dqiY6/1W4ue
	k68V4sTcSng7jDUTXalkQAWhYpw5PeTbXj36MrM5mJ6ZIBNDiU3XBarBLyY2CGyZPHKXtcwlMkW
	A9fNJHo0Mz93jNDvM3EOsWs9Ky9SQtSPIGMisNbpUkqxno3I9aRvsKeulAzQIAKZm6z0xyYQmcU
	KpiP7kXPcZ7yiQsvTaJlBDBxaOyqIGWPEQdtmsVz/uS+919eQ981kajp2ttvEiuENAAOPMuUCDj
	lJJ58xkc5jH4HyBxqfVVRGN2tCmc
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>
