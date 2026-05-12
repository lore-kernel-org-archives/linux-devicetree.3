Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B55360EE1
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588396; cv=none; b=EuC+O0kGV1q+EVEugSdQ2p4gUsvam+TxmVLmcXpP5pp07MQuriJZAu/q3VXP/AeSv8sY01mO/9/xfmlW2YZ4VzQsTgKET9+jmCqqnnL64pV3V7LpXhtyroXOoPRc2eQNrEhrb0/DZ01ApYyJZVkZRwAdsG54eJ+SvwJFlGv3IeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588396; c=relaxed/simple;
	bh=TqpSTdiRV64u9z4m66enAOq8H6i13HG4Kj18qVReCWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtzN1IzzaXxVhznffwOSvPxwWkCbnKVza807cgsuN8kBGGquvBizwThB45dS/8NDLP6q30MXCCNyQ5IehgxTqA2oSxk+pu5vqMs5jKy6DmT2xmX0CUpq3MMuZVkRgpz6EDsqN9FOZehFjiaVysbxOar2Ja37Y/znZe95u7G+z6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAH7He8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAH7He8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7327C2BCB0
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778588395;
	bh=TqpSTdiRV64u9z4m66enAOq8H6i13HG4Kj18qVReCWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GAH7He8kZLwXFNO2Cww7ogSbM1QLu+qmXT+RgXYlPP2RM55swSxH68nt+aGZ6g6L2
	 jHWbmlGb3tvBxOX2/4Kl+1nvHvW529vAjr3WeW4/emT4+R3vRcJn/V3yKTyREDLzyA
	 0XnLYic23E/CoiJj5R3hp9RT9KE2osTshXfxT+7cewRs8bf/ialhw9uYD+XSDjUS9r
	 XjHusbkU63L0etXnTDd/jJDp2lB4Dq8ijQfIPlyVNkVN9Oqo6vrCgUqx1zGps80QJr
	 skKVQJLRwdSOD8Q/sTHe9dx5prGa2LvEdwOGfa9B89/zeY571gFa9YyStGbbxpnEqI
	 0MB53ioIzdpIA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso8269377a12.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:19:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TZUeDVIaJdLtHYg1FIKeulZhLU76QbTCvkr2C2SEthYl6YFjPYgSebAJ6uIjZDuHIGukewdJ1HCnj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PlJs2cGt/8d6CepfWDQ7cG11ZcZ6vl+/LOcJ8kxEH/EECtG4
	4rSaAilPLayM/PjrLMTIBj6vPZqd0uMMRk5keNtiSvBk+XZsJuAz0xWzt7nD+586hO89AXsxvhX
	Py3qpKEkXXO48UfL7UNg21441sI0lAg==
X-Received: by 2002:aa7:db47:0:b0:66e:cf8d:6970 with SMTP id
 4fb4d7f45d1cf-67d643c2b15mr10546583a12.20.1778588094154; Tue, 12 May 2026
 05:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260510120141.118057-1-pramod.nexgen@gmail.com> <20260511171554.6541042b@jic23-huawei>
 <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
In-Reply-To: <7baf9ca5-50ff-4131-995b-70ee094ed247@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 May 2026 07:14:42 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
X-Gm-Features: AVHnY4JL4E4-RpwMcuVlQFVo75JqgBEu_54ecJmda2k6xLPrFqJ4wDz1IgH567o
Message-ID: <CAL_JsqLxtWLR+jxRXt7Uz6dcF-90NYmfyGWYQk9um9TYHSWbTw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings to
 YAML schema
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Pramod Maurya <pramod.nexgen@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 11:24=E2=80=AFAM David Lechner <dlechner@baylibre.c=
om> wrote:
>
> On 5/11/26 11:15 AM, Jonathan Cameron wrote:
> > On Sun, 10 May 2026 08:01:36 -0400
> > Pramod Maurya <pramod.nexgen@gmail.com> wrote:
> >
> >> Convert the Xilinx XADC and UltraScale System Monitor device tree bind=
ing
> >> from the legacy plain-text format to a YAML schema, enabling automated
> >> validation with dt-schema.
> >>
> >> The new binding covers the same hardware and compatible strings:
> >>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
> >>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
> >>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizar=
d)
> >>
> >> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> > Hi Pramod,
> >
> > Something went wrong with your sending of v3. I have two versions sent
> > half a day apart and no idea how they are related.
> >
> > Anyhow one of them got feedback from Rob's bot so I'll assume we are
> > getting a v4 and wait for that.
> >
> > Jonathan
>
> I think Rob will have to fix the bot to make an exception for the
> legacy bindings. This should have been called out in the commit message
> as requested in a previous revision.

The bot is not the problem. It just runs validation. The schemas will
have to either drop this check (comma's in nodenames) or exclude just
this property.


Rob
