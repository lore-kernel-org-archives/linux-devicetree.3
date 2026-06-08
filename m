Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91F3B42F5
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958790; cv=none; b=VBxT8uDPD6uPAOn+d12oJA5D4XtpEVmDl8JOXtTuNMPJg1ZZ25ZgsnZ/T2o2Wy+1x20arxACApX0eROWH+L8fmTf5tUfttVrNCDRrXEMjY/zqBvXV5uEJowK9suqsZJO/QVXkmLF3jUGFwd2Tb0GePhJ4ctbxhbelGYp0JvhCh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958790; c=relaxed/simple;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hN0tr7CvetIpL6qfoyvqiBh4ci/ILgoJwr1LiaJ8x9VW2I9aNvr1yKgvfcFPaUfyPnDnn0ocwJVGP8c8wD+7ipzQQhQNGk9/lcLmk//wgq36eio2TUO5bF5EN/0ryjtCULWiEYMvakaK2KgRKviFDhSfvBKdwRxMiKOLLQvKDd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPcmg9gS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPcmg9gS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497701F00893
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 22:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958788;
	bh=B3T4j7OBsymsUW8sk7AIgEhfmNfH3xykTHDf4YdxftU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPcmg9gSpqzLhPQ4DUxzeLr6C6gvQ+2sHHktTS9Sq3n8C9ba1o423+s2T+OkBEwee
	 NSQhMGqUYw0rMBAxx6zzm+3AvPSldX5QtCcGfRRWGN4JyDAEvCCSLm9fXFa8YO3I1j
	 IEUGelLtoIcqdmVt5XMkMY+qWrxP+xt+QR8Ez5I3Unk3FYBCWZNiEaP2Ul6eI7EtVX
	 boGc/VxU6fOvh4VTJ3kMyrBFktC1OmwKyMhVu5iXK5JqpCo/nNIXbqYkO4uEW/Cacr
	 3kDyx/ZB0e4gD6WlcKK3mmzmWoMB3VedIKGX7OCznQL8kMlssvJFRnRH8l43cEBW8r
	 J8Pp2U7c1fD6w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-396771119c4so49247801fa.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 15:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8S0mPMZY/Pp6msm6nRW820mB+TWpGz0FlAVGvW9fn0cI2zDxIJzBsW+tiL21RROr5QPopcwdybflT9@vger.kernel.org
X-Gm-Message-State: AOJu0YwWp1kLHuwkoR4m9tomGVMUKHUrXZhmqPM2aEsxC0but0s0KD76
	lHcy9OT7J36dRxfLDrwd8JDkTRdeNSOhc+pgpEqyWjWeB1/VzAl6Eg1kyY9joYYJymBnmCcr2pY
	KPtESmeCICpl7rEnbHSgGu9HY6SqHb/c=
X-Received: by 2002:a05:6512:15a4:b0:5aa:6eca:f382 with SMTP id
 2adb3069b0e04-5aa87b76dc4mr5708333e87.11.1780958787136; Mon, 08 Jun 2026
 15:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com>
In-Reply-To: <20260601152707.29039-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:46:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
X-Gm-Features: AVVi8Cdb81KyiQYHN3WaKg4cCLnATFx4zGUZo2-MGBsT-bnCL_TrgRbJJGbJYZo
Message-ID: <CAD++jLkFGZ4YYwDrtWsirRF238+K5TiDBeczz-FOZtq-MBA3Kw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 5:27=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> The driver for MT6795 pinctrl already supports the slew-rate property.
> Add its description to the documentation.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Patch applied!

Yours,
Linus Walleij
