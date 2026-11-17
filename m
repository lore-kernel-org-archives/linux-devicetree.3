Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794874266;
	b=uBk23DOMY2+lK4GR0sakVsC+t5PGAROvsQBdSguCSUMMlaYS5hhwffDfpKaOWYxLzI6v
	 K9FObWAd5Pth7bNiXPI9M2e51uiH6+dJZ5MND1zHpO3Us3PJNUecckNQbLynNXL4aHMSk
	 5JdaQIKjEldqpO9UiqAKb+yV4o/QqhD16N4uRvHWrmfImZiVSc+viNIYLppxPdqJ2ot7Q
	 Iah0eb09mQkh09GNYpc9i/A0ndUSMRxFnTthQtRtEQAbPVDAk2eCYKHQnkmoVcguo2O1v
	 NzyOwC0YRBMkJwlgdRtz4b/kmBvJLDD7vh8FZunCEtfzGOLHy2lNCwaZcdeBp0vOEaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794874266;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	b=vTDa545oYa4ZWuPT4RISBr4Z+zsIBpIQw75tJxTLFRhIrELL6eiPVIFqI1D9U0bDMvEK
	 4XV9PwfV7AshWBmxGOCQVd+nu7LCEG3owml1Gvwis2GPk4710zasL9HpA4dyZveMfJUds
	 /NeDf0TYYLBl7PSW1rdP0nMRi0gGYjkfDyWqGZZAU2nE46VpaJ9edWoWtX5UPgc2MJ2Dy
	 YYzqT5TVApnLe0dQ7IImqu1DPZkKrTmjl6gpr1p8hhdg8XiRzgz4XSx9ZUBfjSJ8Je23H
	 23uw3lrpSJzqUdLcl3Kkmh7Fehq/8IBawPof64kkIF/8iwAxN/gNjPke1PPzUJjWYlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01870606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QZGxqJln
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDF51F000C4
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794874265;
	bh=YjKQ2PdbHkjHFZ+hN04dl+fGzrnZtXKbmZaR+wm1jOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QZGxqJlnFAM93hsizrM154QuW/4jTifan+hgL0/vdwLtJ7Sa3Kt9qXsYyx0Dn9IcO
	 KBYlZmf2GmhMlpygHXpgO3oYd433qlxTMOAA4/GDa2TkY6jS5OC+SJFz5xnjtoSoDD
	 8fKTcIZPrHMnXKlUozahNvcnL/CRVq0OyM6qaSk0EHl+0Rcv2O7gE276rln/sjy82H
	 8V7krPMh+GTWYREisb8jxAFtqyIWTyUXxn4nFKQs5GkClcVxR/rdfjKT+oON3aHd8M
	 Y8RSZKVka5gmPed6iQ/XR3zK+9m7fwofxSbCd/gcr12TcdNXWzuEMAi5iE29rSSHZC
	 O2CdyMDCf+Uvg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14e307f29so4633649e87.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:11:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFXM9j219xHgiibX54vroUJfzQa/wV7oe5PB6qy+Ip3+uLE30hO1LKhkvInzU2iKIKphFs8a83Wk9Vw@vger.kernel.org
X-Gm-Message-State: APuU4Z+1f8GtmZ4QGaKjQQzqZ3eeVS0SP5P4Sqe1ksS+jpKg24NE4mm9
	kbyEkNbkKkuGGgnENZonjbFysMUkpcRYyUoqh/gA6snkG22lN743RLxjOAgIk/4EZWw/xJRcf/x
	Sy3290eqxsghmotwauetpGq2L15uH8Qs=
X-Received: by 2002:a05:6512:230e:b0:5c1:4f2b:a2ba with SMTP id
 2adb3069b0e04-5c1709f75b9mr4513682e87.34.1794874264502; Mon, 16 Nov 2026
 16:11:04 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-xg6846b-bcmbca-xrdp-reset-v5-0-f584e8b8e696@kernel.org>
 <20261117-xg6846b-bcmbca-xrdp-reset-v5-1-f584e8b8e696@kernel.org> <sashiko-outbox-217953@kernel.org>
In-Reply-To: <sashiko-outbox-217953@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 01:10:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
X-Gm-Features: Aa3M54rQwu5Yk_Bv4F8GS-3F1wpvPataOkYjkIAgSEJnOZCG3CWzAbrtg66X8GU
Message-ID: <CAD++jLnNALhUhekMvUxes-+Wmq+g01Tck9NNvViy+ofFSL+N4A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> [Severity: Medium]
> As reported by Philipp Zabel on RFC [1], why are power-controller,
> clock-controller, reset-controller, and hwmon modeled as separate
> address-less child nodes rather than putting the provider cell properties
> directly on the brcm,bcm6846-pmb node?

Parroting Sashiko.

This question has already been answered in earlier iterations of
the patch.

Yours,
Linus Walleij
