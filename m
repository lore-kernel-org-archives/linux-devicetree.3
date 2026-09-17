Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C7C4F7CD3
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680498; cv=none; b=C5LDmzI4vO+pIAjHVmrbORApytmOoubC9HOr84Om9HyMbATJ5fK0zc+BSoP+PPC0i8edlIN6WYwNeSG3FSDNljOucL3ujmQzCkXJ7/ijcBM26lLN3VomSe/mwVbxsUCxTWVlm7X0ZFduZUuRSsLA23UWtC022YUjtAJ8bc9cu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680498; c=relaxed/simple;
	bh=txQK6gBWAB8O4Gneko7Mjvx9fODC5NA4/fCQd03ku8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy5r3a2GskJaIe/qE/y0Uvbwnje9YoG0M7hEbT6MYdzO8967w1Ubuw/hZmQ3QqWam5U25k9w/AlGa6yH81b8DKLFekvXs4dlmGR8AoUh08ex+JcVW7D8znaycC/OM7+hGjGpNhUe81c2cZCbMaTb6FOQin6nQpcsLjJ0u59PQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1oaHWPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1oaHWPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A21F008A0
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789680496;
	bh=txQK6gBWAB8O4Gneko7Mjvx9fODC5NA4/fCQd03ku8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J1oaHWPJOY6ovPUB99W08S2XtJEu+hk3Z2Y9V0jVdCM8IxNjmmat7wf4T2jKbuMBH
	 cVeP6z8Tw2cDvBBG0UpWQOSQb7c6zq/IfoDe6vThrXAHysxtDooG+0FE4F4DZncWOg
	 b8KXLknNre9SRjV6yfRQRy6uZImQkvGKo69AUV7rYfrtrc4naccVY0hb3NFwHXt1eI
	 qtRKsD02SyQv9YfUc9pcWro/JTa2IvylmRpkfBsylPySKhqWGqgNyh8wSiowxoZwvD
	 ZtW/qCsDyAiDVwbMG1mxUxByX41fNUs6DKgkeAI5FZfMntHORZ88huY8M6Ij0k9xO3
	 spCtYIERV+0OQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso81734e87.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByX3oQl/8j5CzE0qZFcY3aFp8TkkuZlEE5BQj79SOqPMrRuCdOogtjIQvw4tIWbLnJ9o/lDuImJUIe3@vger.kernel.org
X-Gm-Message-State: AFuF++lek6DcqUYP/aVwSY0xZtXhjb2aFhqnr81Q0xL6nTV4f+d9CHDj
	BNS251n8dJhcFO/9EOL8qtV5PQc7casTS3IniazrcpCKefi927EzNLBOFCPWTYH3UfRyJS+I/8q
	NXYLMWhgaxszp8G1RKL+8t7VjJEamozo=
X-Received: by 2002:a05:6512:3c9f:b0:5b6:183b:d214 with SMTP id
 2adb3069b0e04-5b8c1959c7bmr52714e87.59.1789680494998; Thu, 17 Sep 2026
 14:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-ks8995-to-ksz8-v15-3-8825ff5fd4be@kernel.org> <178965134899.22033.3037968040082683737@kernel.org>
In-Reply-To: <178965134899.22033.3037968040082683737@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 17 Sep 2026 23:28:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLkM8_PbdwccxininXLdU8um8BZ+Kx+vK6c6HkZMZXZSVA@mail.gmail.com>
X-Gm-Features: AcwNN1VyPhRsN3Qbmb1ByERncPndEXnEtXxKC8_vGzg2qxVb-tjNy1ivJa700SY
Message-ID: <CAD++jLkM8_PbdwccxininXLdU8um8BZ+Kx+vK6c6HkZMZXZSVA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 3/4] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch, 
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	marex@denx.de, horms@kernel.org, linux@armlinux.org.uk, nb@tipi-net.de, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 3:22=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:

> [Severity: Medium]
>
> Does frame_size here need to account for the 4-byte KS8995 special tag as
> well?

No it does not and it has been tested on the hardware.
The special tag only exists inside the Switch.

> [Severity: Medium]
>
> This is a pre-existing issue and not introduced by this patch,

So it can be dealt with later, apart from this patch series.
I'm happy to do that once this gets merged.

> [Severity: Low]
>
> Should the bindings be updated for these three compatibles as well?

No and it has been explained before that driver
code and bindings are decoupled, and this needs to
be fixed in review-prompts.

I think this patch can go in.

Yours,
Linus Walleij
