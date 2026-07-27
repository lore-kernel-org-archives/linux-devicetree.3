Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D423BE62B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142065; cv=none; b=oTNPjA1TAJjH0DSRzid1cfZIlRKw5DcIGI5lX+PoNEC+00tXG76r7gNioAXImce1hFjwp2GsLAyLQ52x5VR8t/UVz8pEAcngQMLg9IOs/8KKc0YEV5G6xT6BL2FFDgbq/jWUBCIB7YLRp25+9I2rblLQnzN/yVE7xvUbGxA2EW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142065; c=relaxed/simple;
	bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lKzIHUI1WiWH989a4ALwohFqIMLwPB4tpAynk+eij3jbKH2b6rVrFrQSPLJNZqA5c64rqM0H3qqmHGKWpe+GepgdjbPJ68RJYaVTzpRk25KSKBbdUGBwZzZfQpOrp1Bq9esnuIiwYAeRdxHmowrHk2uAYRLflXMqTrgFPeD+2DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J7PAL9B7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J7PAL9B7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de008b020so1348070f8f.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785142062; x=1785746862; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
        b=J7PAL9B7AbLgS6KpKNJjnsI+nyB4xWGMp0gXZiaEGiNXdL9BTgXOlKZJ6GC+O1YExL
         rZY5WYGmsmScvRJ6rIGUGqfl/+GWN9wNz3Cu1iuav2nssGrT7JL3IoX+4w3pCP37wuDK
         x0i20d6DCZLxMz2gx/+uVSXEa3d7qDqbNI0XM6WGWYD+GIz4OcYDSOoZ6swXgJ5Eaa9t
         8C4NfQ7m3VSAr8Dn1dNy8y5sFYc+9VGjpMinEumxRc3UOHVVz4u6Ctooza5wrhAxQ96k
         9evMClaT05M/V7DZ7U6q3rwlK0C9dGVJCnYE+03AejeCRhPzal7Msp9JW3gzMzAjSVdD
         vYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142062; x=1785746862;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moCHXPjBifjRwI8AZil1TQ63ij5HQhScpZjsf2BD6zs=;
        b=n6/ucBBju8KiPDyVi/vcLEy4NhN9FPis7h/HRr1ATKEU3xm20/snLw5gArl9nUqfTC
         uWxY2pZlG54utIgepCwDXUYMBkd8V5+Jx48DGoTxlikNcpxoKao9pOpNxy4zBrHrDgys
         ihNsHhBBYAEH8B1b1ZJC2bc32SzYTZukY2uP+VspHh4IuC03CbRCVDP/D0pRu4zTc3h+
         0ZeOSQxXrV3khz5p/CyC6cxkgbHjLOAJW1KCG4D4lfPz7sRQ2yiymQmpg65l+i5J46PA
         H66Vmc20mA6v7NogPa13Wak008bQ+62fMMQnB3jXah+CaAoL9Qj6qaUUXVgwpfItitD1
         dcQg==
X-Forwarded-Encrypted: i=1; AHgh+RrMsIz0VAJwDq16JWkXxKkCN6SeQnDB67Wtz6uz+I+gFVZaNALLhygmPp9MZwX5LNVVwhkpr5s5ViOO@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwuDroz50yquzqoPIvMWDkRnMfol5JyOaXXUbxpRv32i3W1o9
	DmNcMlSQiBn6Qw7jlhDCYXYuw5CWK+VHHSMk09hAS/X6AS1n0HdenaJsHt5fh9dz+Tc=
X-Gm-Gg: AR+sD12Bwv1W96ybB7cUlWI0xlyoTG8YknuYu0V7Sc5dwETyr5cepeb8oISVWHXNwue
	+6I1CD3r3THXxxC+H4HdT7GZnhivY6T2GUjYzVsa12yVUSZhS5zoXhRlxJM9V+PyLNkNW7TLkns
	AyCRjbAq0D2w8cT17Wp6xtSagS5+WdBgcUEdtB+AuHCat6Qgvj6apkCDWiI9uQAP5PotqlSN/3Q
	knTnuOmbjMpBlIWF3komX/Ghqn/fz/HmLyB7PhQ0/vYuiDY9bgYFE9BvXlkJZlzH97l/LlWMOQm
	TcA1U7DTEPzVVO65quhh0GyQinGdBGfBry5pOiHbbiq1SX5Qw9/UTdS6tuTDhIn+VaefpgbMuGc
	0fGyRxemz7YaJ1JLu+/7Uk+or7FU+DfoSAli62YtS0/Iq0dI0ouEarC+2lw0wzIpZF43bwKKUDx
	t5HQAOYbJRT63y4cFPamHMLBqyMG3Px3lAzXsZ/ASo536y1yGX0NLxV/TVZ7e4Gnv1Gsc=
X-Received: by 2002:a5d:588e:0:b0:47f:8eb0:c825 with SMTP id ffacd0b85a97d-47f9febcb6cmr9142398f8f.24.1785142062038;
        Mon, 27 Jul 2026 01:47:42 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fc0sm47215173f8f.23.2026.07.27.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:47:40 +0200
Message-Id: <DK981PFQXYCO.29SKQ2BT5EOPQ@baylibre.com>
Cc: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <robh@kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Carlo Caione" <ccaione@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v3] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
X-Mailer: aerc 0.21.0
References: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com> <20260727084613.6905B1F000E9@smtp.kernel.org>
In-Reply-To: <20260727084613.6905B1F000E9@smtp.kernel.org>

On Mon Jul 27, 2026 at 10:46 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] An integer overflow in the calculation of `np` (`np =3D parser->=
pna + na + ns`) can be triggered by a maliciously crafted Device Tree with =
a large positive `#size-cells` value (e.g., `0x7FFFFFFE`). This results in =
a negative `np` which bypasses the bounds check `parser->range + np > parse=
r->end`.

[...]
> [Severity: High]
> This isn't a bug introduced by this patch, but can this integer calculati=
on
> overflow?

Not going to endless-ly fix pre-existing issues.

--
Carlo Caione
