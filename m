Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F038480353
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845929; cv=none; b=lJk6V5Pgize9Z4p/cKF2UypAyZnO1VD2p7xEQzjcfUJXKcKIbPsoX9cEo33J68/MiLe7PS/1YDet9Q56YlHLNl47kTEAAVUA4PZyvNO5vYpE/Vv3hDutT/uvwvP3i5xseqv6EJLkSvXP56JcQXBMdlf/UqVCtaAFnamyWzhUfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845929; c=relaxed/simple;
	bh=Jz7CeHrl1MiYEi9egt1Sa53DTAZlZ+92EoaJBz3WSlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pkiLzvjseSxbcWNkIZxTbuD0bjyLh9UBM1mDYXqdznyyz1Bg6Bcqau2gfsYslI+aWBTIzhBHZUCM4h1ArozFNO9cwqQYqy61HNt8UIJvNwkCXAumT5Bq5uVKVokT3eGNqp/sffIsrhL+zKAiQ2xsmI6HJ+4kpfFVmWo2i6j6IqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGI3PXG7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGI3PXG7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so5189395e9.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778845927; x=1779450727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KpHry5QF5zqM8TwF8sF9NKXYmfgtKgMFk4+Fvwn/DjA=;
        b=pGI3PXG7wdnUF1y+hvAE+OybhVHi1/B/W7r1qxNX0DoeddELdtkW3XykL+IEcBoEhK
         +9If8Xm4BB3mykYbkWIVgcd7Km6lp2o696ZT77h2cL6LlUxvPmIf9Sq+1moYWwgj9uip
         V1VAuv7+3FmCUkHP9UWoirBEa4BR/9pvmeqhSeeKWpozsE7nhw6w2XnDTe5EfCzB61Lk
         5KLYRatJyLJp3lR4oHTi80ub9xNYNz0EG7X8rU76BVOs850fDqdG+wXtqon/8ZzcJy3W
         USya7RgqWZRIbj1mSOyUE15JhZKFY/bu/teL7iV2PMkK5q2wddBR7WRVwOtLVw7glq6i
         nvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845927; x=1779450727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpHry5QF5zqM8TwF8sF9NKXYmfgtKgMFk4+Fvwn/DjA=;
        b=j0WlrlXuHT70QomAZpKsHnaD/Z3Xeltsx9mv7ef5Te7cAYPhFOKajiuOi0F2uNTWH+
         Fms9izkoSszMVA8Ybn6smpbFiUdACguCc8auaaNIBZWjqTYar4k86CGeI/6BOljScuMz
         2jtWcHeAMJzYMnP/SwwW5UvmJUAihAXEKj+rz1ofP9HbD4KX+Oy+heI26ptv0wi0st3+
         IE6K0mP6U9xD5vBvlI68XnGrRIhkw0BESdv8maK2dh8v5h+ixj16G+KIA9p0QjrNKvZm
         WkKnpg4ykQ/8ngFpqp/1stwUu2iO0kTAmlCquU1cbZyEqDKCbiwGEQNt1Mb1DzW6mahi
         Ailg==
X-Forwarded-Encrypted: i=1; AFNElJ80FL4V8Kwa1TqBaY9ksW5N7Tr8M+oR8mxCA3LfzWk7TMO7RATunw6MGuAV4grhAg6vQUTPOqPdXU+C@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFTFNjASj7DFWWH6ypuj6UdBFvtvsg2g7Kx3CoJddERpD3LSk
	Cv6FsxGteKMS6Czc/Qxrq0BYMhFv3DMB3HfR7qE3IlYXwafX83vfOSJfQ2SV77k2
X-Gm-Gg: Acq92OEYufrEkSA5l8HMnU6SRS8gq/rANl/YqPNp8zXhYPMzZrcR9G6WH0kKGi6VzjH
	fqfTiXjp/sCmfxHbME4CiOLLPIu86UNHIbJ0YPFWMl+kupNI7Ktx/0nbwPtPu0DY3zPd5H86mZ0
	D5BxDn19Q1v3o+zsjT14eAEasHljJijNFqAlNtJdrCTjdSeUnGzYiuYgdFtBHNzZdWUfoAs6VD2
	VOUD7U0FfoxdacmV/tszrm6YAs9tcr7AfLwVo5ZKniYFaJgpvGZ4d+ZqGWhiF27Tdcwvum/4V9o
	4jhOtFc90H3ohgUXRYGFlqst8pEnmoQiGBMx1cgNK4hbjNVTjnPDXDqSXGwgmTa6MICF1TJAeHb
	lIP7slMFElE10rwimeM1f0AVs7gkFvtyffEKvAD56DujXrJeVhjMueZV1X+4SqmrGGJ08cTzZka
	bZX7fy9O/iGtqvQYoYJEXKO+z2CB+T5tHPx4PjLlg43TO2i3cHrLCIm3yGtxXoAoifS+5zTYDgW
	HZafjLbOV+eA51vdKCxn76bQzpkH+ebvemHmBr9OWVxPXc=
X-Received: by 2002:a05:600c:1914:b0:48f:d620:c27f with SMTP id 5b1f17b1804b1-48fe4dac5efmr48051935e9.4.1778845926218;
        Fri, 15 May 2026 04:52:06 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c85a:b53f:fa7f:6b1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab818sm58376215e9.14.2026.05.15.04.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:52:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 15 May 2026 12:52:00 +0100
Message-ID: <20260515115202.1515577-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
RZ/N2H SoCs. The xSPI IP on these SoCs is identical to that found on the
RZ/G3E SoC.

v3->v4:
- Added restriction for resets and reset-names properties to have
  maxItems: 1 for RZ/T2H and RZ/N2H SoCs, since they only have a
  single reset.

v2->v3:
- Used RZ/G3E comptiable as a fallback compatible for
  RZ/T2H and RZ/N2H SoCs since the xSPI IP is identical.
- Updated commit message to reflect that the xSPI IP is
  identical between RZ/G3E, RZ/T2H, and RZ/N2H SoCs.
- Dropped RB tag from Rob for patch#1.
- Dropped driver changes for RZ/T2H and RZ/N2H SoCs since
  the xSPI IP is compatible to RZ/G3E.

v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
- Added xspi_info_r9a09g077 for RZ/T2H with type XSPI_RZ_T2H instead
  of reusing xspi_info_r9a09g047 with type XSPI_RZ_G3E, to allow for
  better differentiation in the future if needed.

v2: https://lore.kernel.org/all/20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note, patches are rebased on top of next-20260508.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms

 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               |  2 +-
 2 files changed, 51 insertions(+), 11 deletions(-)

-- 
2.54.0

