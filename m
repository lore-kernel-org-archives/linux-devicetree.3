Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67212426D2A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991698; cv=none; b=o69nLxWi4p63FEXwncWs1Ty3kmkS0N7HNQnPzxXqVf1t8ZSwI2n3nU6gSczrK0oF9S53a5ZIbmyN0zA6ZEoobFRJaOU4eFHknC/5tH/mS+mWFI7JKriXknN/tY/W3xhQGswy/Cv/+XIIty2rWfPgEgnUsmZe3UYVzLIqsSkFVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991698; c=relaxed/simple;
	bh=1qrTxLA4I8o8v3b/IBW8RF/TdQ7lq2xCRJqsETjYLeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koImojd/Wfntv+8qXCDDaVzAmCRxDpGqIVUjVTaK9qa5jQPzP60QWF9/sfPqMTvs+gWI1C5W+TANdA2agRiZLXj8G8fLGWSMGzwyYApIE1qTsSOuSFhRFoeC+H/br7J8dE/3+BDA1r726PKnjbTfDnmmM4oeNHH7Td5hPjPKa9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoKtBwyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoKtBwyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E890AC2BCF7
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991697;
	bh=1qrTxLA4I8o8v3b/IBW8RF/TdQ7lq2xCRJqsETjYLeM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=NoKtBwyRtUm29XohPg9Vga7qRpKLoSJAiXprhcVvuKvhWjRLaq4OhM3yfiHoKFeEj
	 +NdIf79aoH9Noor7TQDGf5pTuW8bsEsch5pAJBOIH6OtNuNCIEXSDSuRE4GoIQCAcV
	 EjYKmDqBeR3QIkS/NPWXSH5KeScrs6t7km0CkVNkILE61DmjczrmwTIHuqr0QEnx0o
	 9I38oHaw0eBjADetlE/6gArE3P0tjlB9mEYTLuI7agP3zUQOsV2ZBqoH/2ggLUO6UE
	 CM3FbFP59P0tDBashJX7cyiNxTcAQHYNiq7k5TymiLNxMhtC4rrBCKRu8gpnxWlp9o
	 hJJbUTZqKpEKg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a01c80c34so53348841fa.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iMvdXMKeiAGCG0x9AvAssnyb8FEG80l0giiuaLDV2Skxz0nuleNbRaF31NZ4O9BmsUQeNgSLzKuZN@vger.kernel.org
X-Gm-Message-State: AOJu0YwNXCB845g8P1HjLf06soDZRNSEGr1bUuy5hs7MQ5Jq7RyH/ItG
	VWo26Cv3PW+0zkm7d9C/tTHvdaOh6NbGehpmEn248kDMAE/uzlJMy985q6EdYBSli3r9j1VDE7h
	yOjalB1iVgFaCoAyu8IpYvFVaOyyuYtQ=
X-Received: by 2002:a2e:a591:0:b0:393:ba06:158f with SMTP id
 38308e7fff4ca-393ba06170amr11719431fa.16.1777991696235; Tue, 05 May 2026
 07:34:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-4-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-4-7e02178a93ee@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:34:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v66r8mJ9Qqexs6AwLeG2m_h-1zCeaMoqPMXpysQhnS483g@mail.gmail.com>
X-Gm-Features: AVHnY4I0j_jYZqPgBwS8DEio1jLky1bndj5AzLllz7WoZK4WiA5673CmQRhWO50
Message-ID: <CAGb2v66r8mJ9Qqexs6AwLeG2m_h-1zCeaMoqPMXpysQhnS483g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: allwinner: h616: add hstimer node
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
> Describe high speed timer block on Allwinner H616.
>
> Tested on Orange Pi Zero 3:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
