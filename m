Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987978;
	b=n61Tmz3KsJ3yYaDFmFK1yQXjIYhPBf1veo9FF/K6l5rzxqdUH5iBW81eWhPfmqq2gTOn
	 f3rVG/6osRDZPX9nQXCgsFQObVsqW1AXZh8dyu+E+hyrXyPQ+T9LhA745mS0gy5ETEza1
	 0307I4x5zcDMcxr/qQKVWHJbpBFf02DH8acBcwF+Wu0DLU9zYqn1wzhXi+HrpjK4ymIoN
	 TBRKhDJse/GCr0gZjFsvqqtAQC4zEaPx51W4My24i5nJ85o0qeW8nSLmp8Ma+vVAeOZ+k
	 dpaopHBGBK9Y8h4B5qRCCmz+4kY342JaXgsCzSKxM04CRF3ez5DGFOJWhEpN/rPMxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987978;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
	b=z9r7aXvVA2fqfHPX2Jk0k/NFUXTHPsvGF3K/Tq/D7MLWW2l7nN0R58tSe1yyHVVzUCtH
	 S7nH4ctXTfIxY/ELZ0CR7j7xcYwMIHAa8qPG0E6yFzIIseMqkgIDR4i9isDCpyNZsfQJ6
	 ZKjwkZ/l4CLHmrPoEf2v92YiaCyHq/Ix6EByj/nwoT0xWRrujoKkyl8crW1xOdNEKo6K4
	 VQp8U0iAn6qQRfcpXmW3jXhnrzpaiRohAWCA/ouhJt/9v2cmJPNZbAdEGCPcARRVXSGc8
	 Bi+9+ahU/OsGJCBZD1DbFGujDZ9Xj+T3VGHbrTQeVCi1tMO09q+13iuSpbhAfpPTAkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26842606A333
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26842606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eadef147ffso447652e0c.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987977; x=1795592777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
        b=Qq5c34VKzWCf6DNmC6VPFWc3V4MDnS3ht6bE37vRNQvnLjnxvzgQnppehtX6euPmDb
         5veTxrDfXtmfR9SRf+dHVp09rce8/qXhwOUSai4Ns7TETIi4vshrf1Md5vBqqYWieSq/
         E/QtDS3ITLgrjdr9ooSpFmMg3+YQ5DeBO8cpH/psLBiPqmRGF4d0n71r/wmzDDCXtH+P
         u/y4p7qMdpBcpvTvQtmXHNfbZdgAqX8MT079DHQOveMbiGVsjEf6t/6gn0UIjOwiLroR
         tE03mMDaXT3VPQUayjJx5yjAeRZpokzFYCuSiKI2WjX2h2X4ou+6nPuegsQfI4+VT1Jd
         UcUw==
X-Forwarded-Encrypted: i=1; AL+hErFloGG01REx1MmuToYgzkT8CxwKDYLPBOqbrt8M63jFWqJRK+Fre5x3Jgc7JUFzwpjbOtYaZbp5vsqq@vger.kernel.org
X-Gm-Message-State: APuU4Z8lm3ynWMETCaZ9lFGWH9pfkmTGHazCPk2t1/IfkDV/zw1BSvbz
	CYWtjHcUUpItIbDP8SpoTngzfou+DabxQdGJ3utM5Omj9lyHIBRdYYFvqyCHbT0I
X-Gm-Gg: AYBFou2fiOnph67Hqi4tC1ZmsMvpRdnfCzLrbXJQnTNWSqH1WKZlxjZfbHALXPpX3Xp
	OKn7yP3jnEM8ZsZ6KDJSLvR5vpGdPGlv8DNKovlfgROhBl/l4YD+LsxrqGbzlmREgKjU5Jjcubf
	ErSZABIcH6sq7j6OVkNAyjjogt+YZfGVR1UGOsBJyH//wVFNEyj7nUJodFVIFXvtNBA50blbanh
	auvisN3UMrakBWbSSSjsuI7WUrVCSLLpdkEoj+BkU98TmcROFAbMnOsgKMcaJJhKbCBHnNQUbr0
	bEiRlVL6EJFvDMyVAbKMbAlHVf/ktVYX4JjJJOaUsQCzIXhYFWdwmJoIhc+gWo2IMGLt7ITmyxj
	FlfmSTICx95fNV3Ga8ck6i93vGctJgwYVOepRAQPqd5csM4Ms9d9p1Vh4IsrwrpaIwUjjbBpulv
	hGjVSXGlMAZbsJtWycSS+r/+A+E54naTjZ9Cv5LvdGqPJBUo+4Fx64VHmH4YSAjVbcG8A5btbv5
	iez62NwXFH9aFP3WbIonGFzN/V/b6OGFhptjkv8fiXs0o3yOxUqUjgEEeKWfiPJ2KQLF2Pog4gt
	3QXlo/725NKuMNV8YgzPhKbvDcQcF1r060aAbxwFQzBN3T+6HSuictnPSWcn+zii3XQ=
X-Received: by 2002:a05:6122:4690:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee646f0832mr970572e0c.8.1794987977097;
        Tue, 17 Nov 2026 23:46:17 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64eed6casm1189337e0c.17.2026.11.17.23.46.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:46:15 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2e14babc8so397385137.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+QKlYsMG8Bz7YBZqHY8ts9aBtOltoCFTbxPKniPAZbHHqBPiTZF4Am6YMGBxVV/77tyHzDEfbawL8@vger.kernel.org
X-Received: by 2002:a05:6102:e0a:b0:7cc:94e0:ad23 with SMTP id
 ada2fe7eead31-7d6ba4d7327mr622866137.31.1794987975215; Tue, 17 Nov 2026
 23:46:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com> <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2026 08:46:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
X-Gm-Features: Aa3M54q17UL4mAgBxZLvOfOFworgkEOusBybuuLEx_Lh39xXrUjItuh72fZWiHU
Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 22:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > On second thought, any reason we don't want this enabled by default?
> >
> > Please see my answer to Geert [1].
> > After reconsideration, maybe it is advisable to enable it by default. Enabling
> > ECC is done by the bootloader, and it might be better if no further actions are
> > required to enable it kernel side.
> > If ECC is disabled, no errors will be generated, and the capabilties will just be
> > set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

FTR, that was my thought, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
