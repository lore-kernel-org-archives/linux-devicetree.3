Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C49E47AF60
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128255; cv=none; b=p6FoXYDopwB85VfhR4Gx3wX1FjQ2C/8oKyY154Tl8HdPBBpcDYjZwjtXQZTgG5jCOI1lp4yJS0XMjBb6ff71MPvtFt9NQYWybJ1+b35eIFHRNXlQ+QdbKhHxi/CDvETmkUFYDlH1PUcE9cIJj0D+ZNdhZqYT7SEQLNplrmB3Prk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128255; c=relaxed/simple;
	bh=cUtM9nCXCjAw/x4a+bjTLJgqufLVfuAa653qViepFAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWWfJbSvdVz+5UAxoVhUNYgu8frTriOphz76InU9BYRbbSevy3efsl7P/Xgc7vLX3WyR66E8YPvQ83Eossv3lzNobZ9HQrFYj9wcCT4R/FQZJIOByElZTC1v35vNHYWAQE12aYnP8gPOlwl6izSawQpbxDXIjcVCmohVqA0mK/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O1HKQw9f; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O1HKQw9f"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad4170e8eso69504035ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784128253; x=1784733053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=O1HKQw9fEgpdfYOoz8qtNNfuoqq3VjHjMVlXTBIiJpbDpxJc/yrdlbr0zIph+DZvFw
         RVnzX4o26YKYYCg6lYyEAfFUXGiApYSLbnIj+qlojX8iNsB4BkLC+CMLgT3KF8N2pdfa
         C7+EAMkF8ogIZuSz+QG65wPG2MTRQ5DTrsqCZzWfle5Z+hXoflzA5UwphE+2UThjQOpd
         OBbdWpM+lmH4JAX54XmoSNi5aQJcDhJZfZhL+P2izgdWnlV7xsBzFZpDrtNL+mM2LB2M
         MjCudTCPm56wKAOnvRsw36sJb4K9E1nGFWcgdQ4U7GpQN3dBlorHH/BnFnpSm2ukapat
         TOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128253; x=1784733053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0f1V+XLP/pNL55h1xnCAtGPJkQJwQhVW+vGDr0a9svY=;
        b=KUM2IZJImBS23rMPrkVOnu7Wf2J5vosckbjpuMHDIfQ0BsakpNRv/sbeQ5WFGcUWOq
         1hHMQk1+9ogefLqUNRe9p8BA+bhn0f/8Vp3cGIbITjf7JDHoyu7Y7aegA3rKDeACngbP
         2MXmt1cZf9pFdde2rN0ZBp2iULqodG8RcaXg7M9UIrtonW76AbhJqZLZAOhKTRLmaZh9
         rb4q+aVOoz0TSoeqXPAaeOSqINKyl2oh7OFz1HT8BIgCVEIu+PK8RhuFSy/oVGJLHUz1
         nBYWJ3Ulyx/z7qaODEBnmw5H8Xh8iIDxMuhSs8+Y6n+9dPKzrnJGBTAdbNiE44eAZ0GU
         n/PA==
X-Forwarded-Encrypted: i=1; AHgh+RqchfgA5mExN7/xmpsjD+X9LoTtp1LVlfdk/ZFnpr3VWsA3Bmg8yZZra0RTKGs7hIrDiettOlRYZUGo@vger.kernel.org
X-Gm-Message-State: AOJu0YydrrUHimKsERLvU4ngwx3HQMmETTZQi05OwVwCu7OQgTwfV0Zd
	qqcnogOCPcqTnR8++W75F7W7xWNwUKNUyLeDTNjdcCqAPiID5AKIqG8sA56kyJmzSt0=
X-Gm-Gg: AfdE7ckPhjIExe/hy+4735LoZTBlYOjNsytH8zTWeX3k1qL7bMQRnDGW5P7BwT+a0pr
	Lf+E8tHBrgxhU5RzZDxMjUEagW5CtEwhlLUhHU5HfXg6kQHyxwioYJq8cz4t2rofEyTkDkxGzZL
	TUe1dSoKSJAamHEJh/dR25GZ1PaLim0Rusjf75hhfX/ULU3s1Fx83Lue3xwyieMC7zLekQjmoDf
	PfDRYhRZZo5ttUz/IgTTpg+YnBH8+Ir6DrmeAyRACYLV9EX5XPSfEh40pxHAO6biFmJOwzIXTBE
	F+YHUClprSIEVCFX0nPyAhWW7YUo2ks/a7HpCuiMdxuTxIQ3SkJCy4FoiDllEZEtBhjOhuR+LgH
	PL/sMrCTxiHPOlRdduGdGgLxy5sTzEfGH64h5KXF9M9uk/oG5LoFtdARhgmqgFC1xCtREEmymX3
	Z5dZdHJpwwv3UChbaQoYJM/0338RU=
X-Received: by 2002:a17:903:1a2e:b0:2cc:eec6:558 with SMTP id d9443c01a7336-2cef14ad047mr75726665ad.39.1784128252771;
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4f38:9a5e:fd18:7a9b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf0fdb3a0asm4417715ad.0.2026.07.15.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:10:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:10:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alei-dNIXo7Z7uT1@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB918568AE7B2364EC9D16427689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Jul 14, 2026 at 07:04:08PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, July 13, 2026 12:17 PM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> > 
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +.. code-block:: none
> > > +
> > > +   +------+------+--------+
> > > +   | 0x00 | 0x01 |  0x02  |
> > > +   |   2  | line | trigger|
> > > +   +------+------+--------+
> > 
> > 2 things here:
> > 
> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> > 
> > 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
> > protocol should be about thar:
> > 
> > +------+------+--------+--------
> > | 0x00 |       payload         |
> > |  Q   |                       |
> > +------+------+--------+--------
> > 
> > Q = 0 requestq
> > Q = 1 eventq
> > 
> > The "payload" part is simply the format of the messages as found in the virtio-
> > gpio specification.  From there, the only thing left to mention is which messages
> > are not supported, i.e get line names.
> > 
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > > +
> > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > 
> > Not part of the spec - remove.
> > 
> 
> The two fields above are required for rpmsg-gpio, but not for virtio-gpio.

I agree that the line is required but not the trigger.  The driver (using the
same terminology as the specification) knows what trigger the pin has been
configured for.  Adding the trigger information to the interrupt notification is
redundant.

> 
> In the rpmsg-gpio case, interrupt detection and handling occur on the remote processor. The 
> interrupt information (such as the GPIO line and trigger type) must therefore be sent to Linux 
> through this notification message.
> 
> In contrast, for virtio-gpio, interrupt handling is performed on the local processor. Since Linux already 
> has all the necessary interrupt context, the information is not needed.
> 
> Shenwei
> 
> > Given the refactoring work that is still needed, I will not look at the
> > implementation.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > b/Documentation/driver-api/gpio/index.rst
> > > index bee58f709b9a..e5eb1f82f01f 100644
> > > --- a/Documentation/driver-api/gpio/index.rst
> > > +++ b/Documentation/driver-api/gpio/index.rst
> > > @@ -16,6 +16,7 @@ Contents:
> > >     drivers-on-gpio
> > >     bt8xxgpio
> > >     pca953x
> > > +   gpio-rpmsg
> > >
> > >  Core
> > >  ====
> > > --
> > > 2.43.0
> > >
