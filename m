Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC6429830
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565989; cv=pass; b=PwTWne4f1nmMsuqCmXfAT0Qw9l52UHsHuHkwNIsnSQNopwfPyyKqsXD4hV04oOD4l0O+J0TA3QyCR8j72VZfS6771jHvrfwd8azsTANSpqEshn0A31Gr9jwM5+W70ufiowNEEFBw0ue7Tzvwi+qNx84TDPn1g0C2essHxDHtqfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565989; c=relaxed/simple;
	bh=yxZL62iX8pebWS6AofBmV9FGACpi7rIEMuv0C7XnSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pk98wyXlIENNgqSae8Eq7wiR7JAZzz+Pn0WXV0o6QY+vfKyoFG2HGMFzYs+SVS5HUh3bD0VyWf8/sjZUrl9BqvdfpHAuU2hgwtE0pHzAymc/xdtNqmx9qhOz8U7EOA5LMQMGAOtlRPB4e1+G09s7g2Ys1keeasCexUfeteVoE4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEHWRCep; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEHWRCep"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so5218787eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:06:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778565970; cv=none;
        d=google.com; s=arc-20240605;
        b=Go/u6uqZbJKEpiKW3Fo9gowRVim/S8hlN+zuIxVnSLGOwXij3ax4YyGMwaImb/GCD1
         cx8cjw7k8eMh3mRe1cIkBsH89iY7qG2o1cNlJiGxUk88NBAiOwxoSbX3vFnQnel59oqV
         p43KsL5vLsZY3gfSbJjr0ig0sTjRcvZ3tbfwAZN6nNzF5Ha0/AhtryUUrgKtGO4F89yQ
         bacsJ7l5bOlp+hapP0SFW91d8/CGjd4Q4D6StC1nvvce53Cm0HgbS1Y0A7y8Ps6Q17L6
         MVcdlGS7OZ2QyK/CQK3f0TXg5sSjDNtoKDAtNTITyPqr6dUi6nhYi9y74YDIruHcAhlX
         tyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        fh=N/CyxibKaRW3L3Ddw0Pi1iWF9oz+1s+YQmpji3hwKHU=;
        b=VZZf5pLj8Erlu20CBcaginIrotjuuJ3KaWd+iWEG1LNed2DDfEPLLkXyxRi8UBM9NC
         Llho01rb2HyAXq8E9raPwJ3aiVYQj4kSmYx2k+x2I5V11IJUV0xXbs+1vT782wZr94jE
         15JyRt/E/5xRTT3YbFO7Xys3AX3NDZ2ZCOoUcxJ6aIvcLf1as6rcJ4z9Vj6fia8JKkLp
         Wji6vM07j3fcLZ41NUl95LdmRZICPcNsGuiDCTDz5XvxbVe4hRWDbkcCtC9PJfo2UCXk
         pLORYzI2N4ZnCz7t1zkpJFX3WYoAhjZvrwrYlRgaBrFdq5xUl7RLn2KO25lNXfrAKgvI
         bfbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778565970; x=1779170770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=tEHWRCepdx5nmp6yIVCYqQVzLmcrQesovgaR9iEkViVeFajmSrIpSEYelr2lD2XxoP
         xh5y8Zvqn+p86e68KD2mvaQiqYvCBtE5yPAPTikVo2xqoL3Tzv1bOvc6AoLsBX9tMQ5x
         bYKhs3w7Wz6+rTS0+0PdymwNuR6Mrju/sIlosbiQTM7eQulfT33DGAwgDmm2ablH56dQ
         bWpBu7X7LqvzKybeZhNl7lGCCxcAzvLmd3Uqv1PZtG5EGNwdM3TqVIVGnx8neXBuwl/W
         L4ZL2IYFzfr7AuRSPKZt2mLvNKX42PoQwoqq4VK13MoKe4InA0vqbgWOu8BlRN8yU7AO
         0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778565970; x=1779170770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=O5fsdpBHzew9B+r6jMOH5AOJfG+aTp4PCqaOftszfdzMgVK6GD2uVs5MNtnHMQLfAX
         /2h0Bt73+WeIJAYL2A6Yg2AAenZjC0Xf7RIqHQg+EpdXrBGLcfNvM1/HAWHcXpnM3crh
         5vB++PVebVXGnesKE6l/qPFlfFAIe0XT0HCuLXJX27u8QwBBaoGiieAR0DNK4JSqmAXF
         QDzydBIqkX1Bp9W4GYg1QuaZg+ITFFQao7hIEVLvEYGoLgISgPaQc5KpEotBkwHHf2iF
         5H1WcYlyIv4VS7Zv7hVAEHgtI/f8RbAHhGBee+b5hxgTzmWaLvwyeyG7icJmRSCT1wGr
         HzZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uXREj+LiSpzwJk4yNNltRETTrfHO3j5br8SsFUT1G2r/GTxgXxhRVMu5S5BL8IYIIedTn8C0xloDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2R6PaSH8BBQw5p5+Q2NpL9xg8T3Cr5izoPwtuKyhcbnYDwn8n
	RHcncJYF6q2HkKW+620x1ISWOy59SwXRPQMQMUgqEZ/46mcf+jwg8ZcQnewx7cX2Da5NEcDtSwo
	hnzXyzXxUk4wDqewOpwUrEym+litU8gQ=
X-Gm-Gg: Acq92OFRh1zWDpxAs+soCef3Euz08nxGdJbDcPca5XsgT8lpwJohUcyW1VQy1JYxxJd
	LsXbmuBdZGXaHWyUytlADaD5Vermv/A3Lh5Ls4pHIqmS4X0QCyXQMH6r3U5PWd3mua0CjhwObAE
	e/pUUkg0xbmxykfrfQ9d63bQa1KoVfZC3LYgnheUS06juhrs6d9/RGUU55tklyX2baLGB/aJmfw
	m/Bt2UcO9UnitRcNgEA+TzcWPmMcx23h5Cl39nRlix73DwVNskbx8XhEl+iZa5xuDWhOuqWxpFw
	dtFhrZOR
X-Received: by 2002:a05:7300:d70d:b0:2f5:3f62:37b4 with SMTP id
 5a478bee46e88-2f54c080b64mr13761984eec.8.1778565969672; Mon, 11 May 2026
 23:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511170548.0065fd07@kernel.org>
In-Reply-To: <20260511170548.0065fd07@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:05:58 +0300
X-Gm-Features: AVHnY4J1P3ErzmBnYdLDEn2tVC5ojwqEMUhGov68STEE-MFG5Dk8UXTF_hePr8Q
Message-ID: <CAPVz0n3wcgaXzSLAMT=Yt=+FC=n7ufkn_CAaKNcyTr=a+7bdTQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 03:0=
5 Jakub Kicinski <kuba@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 11 May 2026 16:56:55 +0300 Svyatoslav Ryhel wrote:
> >   dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
> >     property
> >   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
> >     controlled
> >   dt-bindings: net: Document Infineon/Intel XMM6260 modem
> >   net: usb: Add Infineon XMM6260 Baseband modem support
> >   dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
> >   phy: tegra: Add support for Nvidia Tegra XMM6260 PHY
>
> You need to split this more on subsystem boundaries.

Yes, I will in v2. I needed an initial patchset combined to have a
reference point and show that all patches are logically linked.
