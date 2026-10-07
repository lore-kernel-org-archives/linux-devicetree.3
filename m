Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D7494A1D
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373282; cv=none; b=sFgtyHJv+9v+ltGdJgZXxx00rSh3Q+l5ApFhmJRP+OT37BR2RJeBrAUiTKOt0hUyTiT2Mrofkjjp9df0VYjNHWM7HBjnUTvz9SuAUrV4B9RWxqdcLVcydahfqYU2QhHVr+OG+PgjaLrzXIqJsrw8Kc5DUcDOX6dYd+GpsmAzOFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373282; c=relaxed/simple;
	bh=wziumXR0C0JuI6Dmj4K/JRRVx4+SJT/JltIQlJfsk50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbXu39R68nmgMi9Ej6tbZB2Rw8x8VZ5OrYPkIrz7QlERWlJrTQifgqP2sqAOYOTz0o+oJIxbKW0+IB33k8o9htz3icx0dO12eCaGndcWoOdYEPVHtZAW8uGd5XIOeZvrB2qrvdHVXduUblXNd1BWNQl0iFVUyYyWxz4IlrCyQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQYbzekU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQYbzekU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C651F008A0
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373253;
	bh=wziumXR0C0JuI6Dmj4K/JRRVx4+SJT/JltIQlJfsk50=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JQYbzekUcMuAPJ++XMZv4wh4ozvGN/Wy86PFLHAspa+xaoF9UcaS0BjOE/6kcYdGt
	 y54g4iwlDoOoeUs2zTB9S9S7qh82uJnlBIYKhyuliNQWl0ogxLAixR7uHQmZxndlvp
	 0Ftvx5cIrQVVq5rD/TtgPjGepgg9QcGmD0B2Ozj4sjfPPhRkGfjpVgq0WYA9CfT3bv
	 3d4depWwN1MAV6mlgyuF6dJqRqxz1ZCVviqMye4vX5Q5CJIkWDSZmZBKFDqswxIgih
	 /TI+4Dc2/IEzA4uCmhgWgvJaHigMF+hJWpjDIcz1KCycZub9JVsv7ODYaZ6fTtZo3B
	 7RWq3VI3Py3XQ==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6df93f00f4dso1688454eaf.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 04:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPorUfHHw3c7m7xPgXfKdjg4u91C7pRfRj8xN211n72tRBiGFpIyVMHkZyuKt/2vcQ+WT/p2cGbFEO@vger.kernel.org
X-Gm-Message-State: AFuF++lyhvRULAY5DO3nDotneIff/4eKinSQTwCpIQRnB9J/NROxqyoT
	lvQZpOIIMCU49FGOHuVU5Z9e+GPn8We0LMpStULNljfVoryYoj/uUgrGNtesJUjK4k4s5OSJLCv
	KIe3L2P38JgKAdrB4TFPeoiCR1p8JalM=
X-Received: by 2002:a05:6820:1788:b0:6d9:5636:808e with SMTP id
 006d021491bc7-6e7a739112bmr2000179eaf.56.1791373252731; Wed, 07 Oct 2026
 04:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-b4-cs75xx-v2-0-b7d6e1e24d44@gmail.com> <20261006-b4-cs75xx-v2-6-b7d6e1e24d44@gmail.com>
In-Reply-To: <20261006-b4-cs75xx-v2-6-b7d6e1e24d44@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:40:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfyv96v0VQorp4izy8ivr5eCtfDDVoNgWf5TRyz5JXXQ@mail.gmail.com>
X-Gm-Features: AclHuK8byDgRIuSHw8cA06RqOCCjXEr36nPZzKXnufFQprrALuEAe-_uffVuuoA
Message-ID: <CAD++jLkfyv96v0VQorp4izy8ivr5eCtfDDVoNgWf5TRyz5JXXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 06/10] dt-bindings: serial: Add Cortina Systems
 CS7542 UART
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 8:17=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add the binding for the UART found in the Cortina Systems CS75xx
> (Goldengate G2) SoCs such as the CS7542.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
