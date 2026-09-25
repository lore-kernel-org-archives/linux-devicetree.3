Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BBD4DD6C8
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353339; cv=none; b=FmmUgF5aH/p3AQDLj33ajBUE1s27D2rxYk+w178qxPRRZNwymZxyN4fhK2T8SFmo+ljEkabAqSBi2fogca56xK/nwoGBFpzHRDWdhN8Jn3ItTAmsD4isCpB0qEz3gbj6SGoJAG5pKJnXYUjDrpRT0HpgV3rdBI+Dl7JBDcDvIjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353339; c=relaxed/simple;
	bh=xAvvblBwNOqIUQOGEKNsNIGixT3yFJ3KNrcg7Rkjjso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPZjXeBeDrYmF7AQ4L0iZ4QjA/0jD9dEEPdjM4/ZODqySSHa8jj07Pa75wJ7jJ7rtsyu0LlVOxZLjrt0WL1Lb7l6XnAXGmccZu2aj/Lxw1oVO9gfZTqAwxsr+LvgKcpDfjp7Ysyo4CNQBrg/DySJ5FyJOKnsTQEGZLtxMoqhmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYqPkeQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYqPkeQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9777A1F00893
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790353338;
	bh=xAvvblBwNOqIUQOGEKNsNIGixT3yFJ3KNrcg7Rkjjso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UYqPkeQpnmFjyBwjzKAQPiAMluI7i81g6et1N2T3Z989KwlQH7nlQ+PN07B1T8xZO
	 5K0qqmi3Fgf9UcuZj+VYs2YFXjGaFUaDiGV0lbaWiNnXfu+NP6BGIRFf+0XUSkEfVu
	 eXDY2aIhLkKenE7xeybE3Onkrc0A8a2Aj9ntb5vPBdbmtsPH7Egg2nXbFNf+E7sX4u
	 ar4IeBualTmj4EiligRxtpg9xYGgn/nvZ3WNYfjHPB3U+qHl34TDfaBhtqaXFn5pMI
	 D6OnYOyAZ8TXQFzbRusUgmC7dmrsbi97YlQ/j7wImQ2x9SwDPsT3lUWVs/HS4Z9vCt
	 qWiJEPWCaLUMg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e820df9dso882636e87.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxPTo2DD6XjmbBvqJ0Nu0jPuQOg6m5aQQajTlq4s7aY2ms9zUw/DmwSp4FlefsDFQ78vohs13HE4/Q@vger.kernel.org
X-Gm-Message-State: AFuF++mXWpQZg5OPSDkPiZlC2Xi1n39svnhUcihavxhwe1ROsHITiPce
	g9N2Sx5gUd+w4VeXtE01aXAbXEjVe9smsrCyqmhag9OrWQX2v7vqH3NURZz17fh8Uh/Ycwdcysp
	by+z43ihgmNygccCWMnxS7Cz5FuMUQRc=
X-Received: by 2002:ac2:46c1:0:b0:5b6:4ae:d89 with SMTP id 2adb3069b0e04-5b8df09d879mr1710580e87.29.1790353337380;
 Fri, 25 Sep 2026 09:22:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-ab8500-charger-dt-v3-0-f80b8d295e2d@kernel.org>
 <20260925-ab8500-charger-dt-v3-1-f80b8d295e2d@kernel.org> <20260925090958.7BBC31F008A1@smtp.kernel.org>
In-Reply-To: <20260925090958.7BBC31F008A1@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:22:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLksnw-77qz95BeXB92NVtP-k=jYdEcb8amYGQweq6UYTQ@mail.gmail.com>
X-Gm-Features: AclHuK8eXeQqz1Ensjlw4i4gfrwYBle2I9OdB2UqM1Xv5v_BW5TMR8SLXB2pujE
Message-ID: <CAD++jLksnw-77qz95BeXB92NVtP-k=jYdEcb8amYGQweq6UYTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: supply: ab8500: Add AB8505 charger
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 25, 2026 at 11:09=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> [Severity: High]
> Since stericsson,ab8505-charger uses stericsson,ab8500-charger as a fallb=
ack
> above, does enforcing a strict limit of 9 interrupts here break driver pr=
obe?

Not your problem as I have said before.

Bindings and drivers are orthogonal.

> [Severity: Medium]
> Since the commit message notes that the corresponding AB8505 register bit
> is reserved, should this conditional block explicitly disallow the
> autopower_cfg property?

Maybe as a follow-up. We don't need to fix that right now.

Yours,
Linus Walleij
