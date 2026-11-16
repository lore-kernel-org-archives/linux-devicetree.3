Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852657;
	b=SbT4TG9tKqkKP4FVjQB6kJNnFzK5xQimFpFXgppP2PAHrXrk0XhNZpBfJWMZIpQmDNFk
	 Dr0utz2NpmyqK8V/VSOUGvQnnIYxzacSGwMdLjEIMszMW/DcTzMQMCC5ovx+IzTZBKPY6
	 ukGQ3/YRhxGtRgu+BPJdlZXUcV6DVZQMfV+R/JuBmXUcA0COauC6bIUxOW27hZ5mzT+Ba
	 OLeWrMHH0BUyhzODnRLruXNZBczS9xzyZfEn+fhMWfkdghESFjn2T76GG6Y872XKctmqd
	 g8xn8E55pA6ud778JKAttollWODwcX8v/ECZ682P9J67JqeIoNhHIKKYlJE0xz2hadg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
	b=Bn7u8IJzXVeALgZaEZ4bg2O36c9K4bkIvbBo86jv4NZzWI+wU55jn4RvYhhPxpegAdSC
	 ToBspw3MrOFmvxUiVEFHa/y7T/uWuuxNMZFBusAG6yO3j+7WcD0dZvuMiXU+lpXHgWugy
	 8W9wDVokywuoylEli2IBrv6CZzez5Cy4LfzXwNPfJjOxgpMcfN6kZXPK85YU6X1DVMsOd
	 H12afZNiGWVf9eLS6bGjbqbLwyN4Tor4gjSSshEdqx3+tXcfYL18gRSpKj1XZVMDuLruo
	 9HRhs/oSpkuYXRdj0IvCl3UMXCzCj+t6EIgQxnsyTisNFssUXJRoKyv2nOlBYQE4EAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAWJE+r0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB48606A322
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB48606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAWJE+r0
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso1160519e0c.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794852655; cv=none;
        d=google.com; s=arc-20260327;
        b=afGDCOs5tyQxsu08xkKmDiPnQsGT5JPlZBa7Vx69yyBrRFkNR0pTa95IsjaLN4oAxR
         J/cYngUrqX07kj2XTQuZjYSVnt4Ant7yXEBVEc/DoL3bLa0MCPwl0qI17j5qxj3asxXc
         Alor1UsLN0b6MLBXU3FiOXpmgUrPPEja07RM8dw6QmyTEY9ZhriuDIp4138XnqBR3e4s
         LzRjbFXuyWALYwRKVAk2aNEBD1Di0m7QTyW2Op4XPPG2HUs4kJ40m74m1kMVgCuYN9PT
         P/eJ4Y+sLoES+tc5i7qs+tP/EaxPVPZlexlAX2EjkONwmDbon+7xdIT3X3DWGt2b8K6i
         OfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        fh=gzVbZ0ODwuh0QBYPVVC+Luhc2zh0pSJoR70v2a/2xJ8=;
        b=gbm5WHE5CeUL/3cePVXokMXgwRVhpsfStRXF8iuHrxEvKYDFx1INs8bhsyVYN4ACFq
         /urtPt0UKmg8B0IalkBdf2du0UObqM478XIcp6MKc4gMTXdsG9u1Qug12vEdgMXFK+Y/
         GcfrW8j0oDn54suJb3NDdy97m1DdWBeZfk4thDg5p5Rk+L1ocYXDEAfJdtfXJquK58+q
         vsYdWDYPFlhBwVceHE7EaeAdvGZPNmENUFZUTLoMgVhMdO5cV2HwTpsi04nbaiSG0wYy
         vjmAk2oZH2kkhf7zmAEIVabZKT9fvGSUSlv86eEfUlKMlORZTLq7DDRp7pCMuiLrN0Q1
         DPMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852655; x=1795457455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=CAWJE+r0w0YEIIqqTqO72+PmfPHdnyhqxI3yHt9FiyzzJLzOnEy6gUZC5LGuTblhEH
         3PzVKOrwiMWV5kBO28dJNngGSaYEnqIgI9q4Huq/rUMjz+Cv6F22LGPPzCGdvv1D6FLd
         ybb3AX1+WGGYQBCbKFpQrJVtmpFngMJyYU1+n6BRo9rpJPBB6wYialBA24CD326m0uxZ
         xsXogS6Sp5FuUn+cZStcb2T6eRN6PcmnIxRwY+CH5rvPqMAeQ4AWMklsjEE2/YxZ01y0
         icOOSPxnZRFdtpqGvKoAi3a5KRamfgaG2fh3mhztZM4A4jUA60L33Lm4fhZM/guUde6V
         9Ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852655; x=1795457455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyOoLldgRLmAoMhpZj0u97Q7A7Xp363HqnTUmstKrFM=;
        b=At5e9hIm/tYpZMwEi6afZwhswQNraWwrN+NvKSWRiAcFHm6F0gglKjKzVqM9g2H6JY
         tnsC5U1SRF5wsHTw9c0KOKKhovcjBiYCh5t8LiXbEX4IROERe9fPQUe5hPrjDwuX07Z2
         wSmeonK60LKNCZxSjyZEVb1jFV/4dWWZmwJWkRy0NQDRBs4xhA8h4Uh5LFvY5XVOUgrk
         wdl4V6jQcTwDcgCeUvn335tn/3G6x6rVLCyP/9vBl8ITA8al+OoaDK3Z0jYBiy94lX5V
         B90FdxzC4ikIPyV1WkGZeC94emLEkRp4QPkg+7l+3nyTkGBwuSaioorrsG3v+q0lkOcO
         INJw==
X-Forwarded-Encrypted: i=1; AL+hErGSB/79dVajOpADob8gZFmulhnAEEsInBReyLlyfQHnzHoPTKNsc38HohmHyOOm87M4Ri572U/K/Ybw@vger.kernel.org
X-Gm-Message-State: APuU4Z9kQwSzXtHMB9Afttg69mf3nRrWKYd/Dw/ykgfD7HslYC527O76
	1fbgKtgA0tlpAugVFbL8+4R+MdkRgAf+UBpwlfK3wZOTWNrQOpLyWlFPl8sYX5YsocVD8M9qtvL
	dxbutHOeKCXiyA7+d3nQPdfAJ/wa4FzE=
X-Gm-Gg: AYBFou1fqTa6rjEp4DIbbNY2n08+Iyf3ubbx7Yr518Z8CDqtVUzeopWQD5J1VUVqiYh
	HnW2Tmrc2SgaK3EFROIcpIfhpffP7vu2i4rkpaU17d8RhkkUcLorR/DpdnteBx41h0VelBB10Bn
	Xoz4mzeOF08QqGhOLFMCOU/fHeoCM1lXe9jhqVntwau3HpIlkqFxOEUD1d9MueXVyvxH+Oed7iQ
	sn4Ih3pH+6mgpwPBUtS2ScKLindyKnTyrFEsn0/XKGR46VPskizLf9rRwP2vnPKLvAJnOrm5cM8
	d1Ey/AkBZJ33S1oKcjxfHQfud8wLxoIUTGsujK5LXBslP4z++bfYHo8h2nuYc7Hff+6RpoMhKz3
	ukZDSfnjjMGlZ4jepr7DAA/Sype1EGz2oQE4E2VlIRoQj4JPyATjeiiN82Z95i5FLGuAxVQ==
X-Received: by 2002:a05:6122:1792:b0:5ec:d5e1:ee27 with SMTP id
 71dfb90a1353d-5ee34aebcd3mr3588477e0c.20.1794852655533; Mon, 16 Nov 2026
 10:10:55 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com> <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
In-Reply-To: <179485210124.3689664.6903721866612808429.b4-ty@kernel.org>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 11:10:44 -0700
X-Gm-Features: AclHuK8Q7HwxDEIcfyXjUFUI9dASw3q3swCNJxLwvpsAisQFiqmZU_r7ygT_THk
Message-ID: <CAH87RzQpJ3Nu31cDMqWJ_v_2SRm4mhKmf22nWXf4=c9CA75hAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome thanks.

Regards,
Cristian Filipescu
------------------------------------

On Mon, Nov 16, 2026 at 11:01=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, 16 Nov 2026 16:44:29 +0000, Cristian Filipescu wrote:
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Use the common Orange Pi H6 include and describe the LTS differences.
> > Follow the schematic's LED roles, remove unused USB ID detection, and
> > use generic PHY discovery with bus-level reset. The binding patch is
> > unchanged apart from rebasing.
> >
> > [...]
>
> Applied to sunxi/dt-for-7.5 in sunxi, thanks!
>
> [1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
>       https://git.kernel.org/sunxi/linux/c/903a676a19ab
> [2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
>       https://git.kernel.org/sunxi/linux/c/a203a4bac331
>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
