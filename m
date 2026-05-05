Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF0370D6B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991815; cv=none; b=BIT4V33GNPnoqW0qqbVPH1hpAP72+zk8WCFOA5vpkcNBZZnw8trQYqYAmwxGDCXT7KuNh5qRY8wdOXTthHPNf32acddG4ww3aSMeC8MQWbJviK5XZgHcHBhGxooCm0hNx4uEFub0oVaUf6RHYAOSYg01k0kpfu0XFYxqzMq0LSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991815; c=relaxed/simple;
	bh=NgiGLGYytpsX1pgqNn5cf1PRDgS58OvOTWHFQqfn3bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hasSPb4TxGKdfNe7cv6Zx5+ovFnPnfgUkxC4TKCFCoy+LDeCh9KYZWxG6a8njZ3o2DUhgsB/arJn/jhRhAUpS5dHc4J+UBzTmKK5VFUFQHUcHzun5az1ERIXwXqaKYjBznybBk5sAdtApywn2fQkdleQo6vb1ZPA0+h6ndxPkKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWmiCI0n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWmiCI0n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C1AC2BCF6
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991815;
	bh=NgiGLGYytpsX1pgqNn5cf1PRDgS58OvOTWHFQqfn3bA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RWmiCI0nBv/UTy4FGEg7lrvr09YUX19lour1NiIK6RnPunEXWKepTzMpQ9KhNMW/n
	 GuYyQHTqPGiTjsjqd1fFkIBI57zroopOggbhR5vxspnfiAi4gx0iT5BDxwtfRlNnI3
	 w2mto6h8n++NrczrbNAf9J/X0zfkeJ6QXxw2Pfwla54OMCo8FPfcTKlSJMXv8v5p9L
	 A4gavqn6xJsUgaUfFTp987IntjK7Tg7pto0RcrvP0Ec+DrlNG8YcKCPtmCWiys9wxF
	 wzuKaE+XBXkQPLWmdL8oXkPSDkWSEnUpo3Vzw2Awrfjtoy1c2pTK3DZy/BKF/xqlDq
	 txV/tdezXmgQg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso22032061fa.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IXAmbSr69HngeSBskIRHzcE20HBwX6ZmD2azrtEGGsbRgBHgHIgErT8vxNf78rmkHT4HScirISVf6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QPCTleoMmwuDjd+aMDPFzaQsfTq6QQ/6CUqiPVLUo5lIKRf9
	5NAayLiBnnImM6JSvlSevO8i8opj8K/LDQyibzU2jdqwP8Xtoucy0CZMcWIseGdwq6Rhz6s3azO
	tNNr7lEE3u3a+2vC43gQ6OXMlGwSLGi4=
X-Received: by 2002:a2e:a812:0:b0:38e:7f8b:7f1b with SMTP id
 38308e7fff4ca-393b2a578e2mr14991301fa.13.1777991813597; Tue, 05 May 2026
 07:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:36:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v650GZbwnhaGwOxZk5nVgUyuvwqE3GcHxDk+BZ26Q5KE8Q@mail.gmail.com>
X-Gm-Features: AVHnY4JCAjDbIT8r8nJuAn49eNRODzDKBY5vH6JTPS5Yu21u8RVJw3ugY1TH6gw
Message-ID: <CAGb2v650GZbwnhaGwOxZk5nVgUyuvwqE3GcHxDk+BZ26Q5KE8Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: allwinner: t113s: add hstimer node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner T113-S3.
>
> Tested on LCPI-PC-T113/F113:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
