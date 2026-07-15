Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD692FDC57
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138148; cv=pass; b=hDDgp7lXk2c/2jS1134icEN1kFLUHcNeDfgVfzz9r6fa1XsXT5NnMjNLED98f1cpz8ajmKleHDpj2cwwXUIUBP1Hw/OjZsDjv2aknNDZUzFynQqv2bfejIlkGlqf9aKllr+wZKyIZ9NbZ3DT/KyOker2IZl+hR7sX2MG+WwnOs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138148; c=relaxed/simple;
	bh=t0NQOLYqHWDz9VsRSjuVoji+SI41r96ungAAD1Kanl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUgUwJN3IgoMqRzKQzMfson2mgmog3rIYN+MQyY3Dm7y1qaPleltu1HQ/zveGGcdIPUejUhlMPh7sIjVnvsjJz7WzRjE957ybZZmVM5h0QmJ/zgi8kTximwYPYLKCTY00t4xA/6nvAehSOjZnk1aUOQD/odD4xRkT2LtMOL6APc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgKv2/1A; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgKv2/1A"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69532288224so10308891a12.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138143; cv=none;
        d=google.com; s=arc-20260327;
        b=AwBzl+xhaJQZz7VuaDkBRgl7RPrzzmHaMIPS4cBG/WCBkgPlvCZ7ErpcJoc/hU9c5r
         ivI63KlOQ/sOnXxxsL5BusQe5UDsj0ER+Jp9298U3JdTPuWAPbgeKY/ao1S6Szy5YcFD
         R4+6hx6m7wBNI4OuBteCN9JlpzdUOxSa1j0BO/Zw1xRESqQR/VEY8ei/Da8j3ORhLeP6
         yjd8zbBWiyBx/CjpA9rW5IzAkdelt+pYAvxV0IqAuPbE+/8SeuLGDzic6E7UoKGaU6M+
         V1dfQxGp3tBhjX/5aj1TMBQIdIgom9VbZYahSQijdAM88gNgHiJEoYNnUH67Ugak03D3
         gFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        fh=Hj4Uxv6pWCVXNKOlEwUWTcHaOzShxZOFOuyi17xXc8o=;
        b=Jw2+OtbSRY7hGC7F/bFLhpGZdjzVOqTA0a75e6e+WXSMHru5uMPSpZqEdDaoA931fe
         sp+b0Lam2s5bholsbriYIL0Vk1icY7Qk/gsSDcGnZulQqi5lSLmWsGbLrAHXQxvycvqT
         8pKmw22c9VohhUGil/qt+s7DND98VrebTo+9zL4uomynujMzaAkYpMbbo7yrjRDGM/59
         rWMQRYBTX5a23D6rHJWYBJh/YDadO01JgBUkN7I/wi6w+IMyqdUvMNdZt5BjuX0A43K+
         N1vFifeWh9h+CwX5no3sBa7TEJBwGkuzNQeZJYwmmD/9sJ02Q9gnq4p1d+u6+3J2BU2Q
         wMyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784138143; x=1784742943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=lgKv2/1A3Qpu3dh33l55DhDZ2WtOfRur9GvjsEMwzA9HDB+dUvz/FuSaGvWaOvO5+j
         FlXO74Majb2FoMEPFvHMYKxiHP4LXOJLt/kFFOt/dzDbaWvKWhQ+yah0PJkEJBLiyUoB
         /QeLjS2mnBxfuV4BC/qkivLafCM65Tg33yAbx724+nWPUeTnZs9gi9ewYNNHUHpve9QS
         sbrVAAdE9muwlAs73JW2WhIewcVXhmWzqO715dlQfju5fvQtRozsJnjzSPbHDzdy5AHl
         Osxv5MGrJz8w9EH97sSBZHzBkGx38AiKZKD4xFyQcMP9i76iF8GzqzP0c+RxH7midKxc
         9Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138143; x=1784742943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=fW+sZknTGE/+0fQIX84OtVv35YqN8vkW6a0vfQlq5BkK2YLdw1I/IB8Hq5uVYAE/8c
         fiSThsz7jWpea+dBQL3BnbZ2Tax49wwO/okzpAVU3/5KTQtFpt1nvIV6gPhyCOezhrCm
         CIju/HiWzj1hcI9AeXNs+7tAottghVlfycjVKAwCiNHqJpFg9oq6dOqGmT1QQmGNIv1H
         Egej3XXb8HSlJN1AdpdtMHc/de7H3p6PcbvRAdZiZhXDY7sXaQ2Jx5jM0Iwyyr5F6EHr
         9kwX0p/X++uMDQ0LWDNXSw8UudY1hNEnLP6DiLXsvWOv0YTSApV+G+M2VUrCbpx6LmI0
         gKOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2Fr3dSDJIM3ZIsdljrPGZSAfQAosUExFJM+G7th8eJm/aKxV5WhRGz+s+oVN0t3SZiZ5ThPsX7u4D@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8pnOGNOQa4NIwzegIjIUP1fMSHmB+dmAQfJIug4IFNpMs4Kh
	0CtmlwowoRS7/v5oQSf3mKh2bNKKbVBjLmmlBaX+mtqtZNn6XygODLBiHqsQUooS/ay9QdI6vAU
	i4QMClSqF+o81IHUMtSaHxXEWyYlEbzYvGMVrsplGVg==
X-Gm-Gg: AfdE7clAQczvT3YmKZEf66JfHHVWO2MXAtSDqiTaNE2+WDK3bIl3QHTRg69XFYHEa8f
	bREegnauzvulFNiENhWpNlD/HLBh5bUuxxDXJuQrtAPYwLyAXM90rECdYJ3i41vfB9FvZb50zUf
	CB5m1p6rgr7+hMss7E6+kjqWxWohZwfe4p++XKP6lVYY/PSeA7uzhJimTZ7gzLLyyH7WpszPbsu
	ybPROb5KcDUekg2KkhMSGXsYFQCDIiMkAhfpL4WAEd7xzIH86kACRxQEz9ZP3p70f2k+XHjXyXT
	nXXzbqH4/sFJYrdN1g4IEooLki48el4=
X-Received: by 2002:a05:6402:1588:b0:69c:7567:cf5c with SMTP id
 4fb4d7f45d1cf-69cd6ddfb91mr4781134a12.41.1784138143408; Wed, 15 Jul 2026
 10:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s> <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alemgbM2ktRLE9wT@p14s> <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2026 11:55:32 -0600
X-Gm-Features: AUfX_mzC-pSYEjUJ9BYRTa4GlO7TcNO2B0DY7O1_KieZEYL7x6Ya_ZTaPmF0Y3w
Message-ID: <CANLsYkww_2d_eFGCTrTvoSavdkfOh41joKHypDnW-z0XUonR1Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
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

On Wed, 15 Jul 2026 at 09:55, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, July 15, 2026 10:26 AM
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
> > On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > Sent: Tuesday, July 14, 2026 11:36 AM
> > > > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> > > > <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > > > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > > Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> > > > linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > > > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > > > <andrew@lunn.ch>
> > > > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio
> > > > driver over rpmsg bus
> > > >
> > > > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> > > d
> > > > > > > +  - 3: Both edge trigger
> > > > > > > +  - 4: High level trigger
> > > > > > > +  - 8: Low level trigger
> > > > > >
> > > > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > > > >
> > > > >
> > > > > How about cmd 2?
> > > >
> > > > Yes, I forgot cmd 2.
> > > >
> > > > >
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +SET_WAKEUP (Cmd=16)
> > > > > > > +~~~~~~~~~~~~~~~~~~~
> > > > > >
> > > > > > I already commented on messages that are not part of the
> > > > > > virtio-gpio specification.
> > > > > >
> > > > >
> > > > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > > > >
> > > > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > > > operation on the remote processor, so the remote side must be
> > > > > explicitly
> > > > notified.
> > > >
> > > > What operations would that be?
> > > >
> > >
> > > The operation is enabling the line as a wakeup source. In practice,
> > > this involves configuring hardware-specific wakeup settings (e.g.,
> > > register bits) on the remote processor, so the remote side must be explicitly
> > notified through SET_WAKEUP.
> > >
> >
> > As I said before, we are not enhancing the virtio-gpio specification.  If the
> > functionality is not part of the specification, it is not part of this protocol.
> >
>
> It's about the functionality, not the specification.
>

No, it's about the specification.

> Without SET_WAKEUP, a virtio-GPIO line can still be used as a wakeup source, but
> an RPMSG implementation cannot because the remote processor is never notified
> to configure its wakeup settings.
>
> So both implementations may follow the same virtio-gpio specification, but they do
> not provide the same wakeup functionality.
>

No.  The kernel treats rpmsg-gpio the same way as virtio-gpio - they
need to provide exactly the same functionality.

> Anyway, if you want to drop the function, the command can be removed.
>
> Shenwei
>
> > >
> > > > >
> > > > > For virtio-gpio, however, everything is handled locally. The other
> > > > > side does not need to perform any action, so sending a SET_WAKEUP
> > > > > command
> > > > appears unnecessary.
> > > >
> > > > What is "everything"?
> > > >
> > >
> > > I mean masking, unmasking, and marking the interrupt as a wakeup
> > > source. All of these operations are handled on local processor.
> >
> > There may be enough capability in your remote processor to do all that, but we
> > can't assume the same applies to all implementations.  rpmsg-gpio is not about
> > inventing a new protocol or delegating actions to the remote processor.  It is
> > about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
> > _exactly_ the same way as virtio-gpio.
> >
> > >
> > > Shenwei
> > >
> > > > >
> > > > >
> > > > > > > +
> > > > > > > +**Request:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > > > +   |      1      |    line     |           value           |
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +
> > > > > > > +- **value**: Wakeup enable.
> > > > > > > +
> > > > > > > +  The remote system should always aim to stay in a
> > > > > > > + power-efficient state by  shutting down or clock-gating the
> > > > > > > + GPIO blocks that aren't in use. Since  the remoteproc driver
> > > > > > > + is responsible for managing the power states of the  remote
> > > > > > > + firmware, the GPIO driver does not require to know the
> > > > > > > + firmware's
> > > > running states.
> > > > > > > +
> > > > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > > > + configure the line  as a wakeup source. The firmware should
> > > > > > > + send the notification message to  Linux after it is woken from the GPIO
> > line.
> > > > > > > +
> > > > > > > +  - 0: Disable wakeup from GPIO
> > > > > > > +  - 1: Enable wakeup from GPIO
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +Notification Message
> > > > > > > +--------------------
> > > > > >
> > > > > > "Interrupt Messages"
> > > > > >
> > > > > > > +
> > > > > > > +Notifications are sent by the remote core and they have
> > > > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > > +
> > > > > > > +When a GPIO line asserts an interrupt on the remote
> > > > > > > +processor, the firmware should immediately mask the
> > > > > > > +corresponding interrupt source and send a notification
> > > > > > > +message to the Linux. Upon completion of the interrupt
> > > > > > > +handling on the Linux side, the driver should issue a command
> > > > > > > +**SET_IRQ_TYPE** to the firmware to
> > > > unmask the interrupt.
> > > > > > > +
> > > > > > > +A Notification message can arrive between a SEND and its
> > > > > > > +REPLY message, and the driver is expected to handle this scenario.
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+--------+
> > > > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > > > +   |   2  | line | trigger|
> > > > > > > +   +------+------+--------+
> > > > > >
> > > > > > 2 things here:
> > > > > >
> > > > > > 1) You did not include messages that mask and unmask interrupts
> > > > > > at the driver side.
> > > > >
> > > > > Interrupt masking and unmasking are handled entirely on the local
> > processor.
> > > > >
> > > > > When an interrupt occurs, the remote system masks the interrupt
> > > > > and then sends a notification to Linux. After Linux processes the
> > > > > notification, it sends a SET_IRQ_TYPE message back to the remote
> > > > > system,
> > > > which then unmasks the interrupt.
> > > >
> > > > This is the kind of information that should be part of this documentation.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Shenwei
> > > > >
> > > > > >
> > > > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as
> > > > > > such, this whole protocol should be about thar:
> > > > > >
> > > > > > +------+------+--------+--------
> > > > > > | 0x00 |       payload         |
> > > > > > |  Q   |                       |
> > > > > > +------+------+--------+--------
> > > > > >
> > > > > > Q = 0 requestq
> > > > > > Q = 1 eventq
> > > > > >
> > > > > > The "payload" part is simply the format of the messages as found
> > > > > > in the virtio- gpio specification.  From there, the only thing
> > > > > > left to mention is which messages are not supported, i.e get line names.
> > > > > >
> > > > > > > +
> > > > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > > > +
> > > > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > > > >
> > > > > > Not part of the spec - remove.
> > > > > >
> > > > > > Given the refactoring work that is still needed, I will not look
> > > > > > at the implementation.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > > +
> > > > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > > > @@ -16,6 +16,7 @@ Contents:
> > > > > > >     drivers-on-gpio
> > > > > > >     bt8xxgpio
> > > > > > >     pca953x
> > > > > > > +   gpio-rpmsg
> > > > > > >
> > > > > > >  Core
> > > > > > >  ====
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >
