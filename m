Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08591386C0D
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 11:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980254; cv=none; b=dBC8Oc20FpByIBF9t4o+FVmjrqw9tLUcd33Qo7l7bjbCJYv7febEQ7/0/pXxnMecl9cNvhllI0Deu2fL46W0SS38lf04tzM9ssdpYKCvbxqDSyVHszCIt+hUOfRX6johwsfhUOHq/l9D8dUor30jP1ThvWRGjj09gJhHbIyZE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980254; c=relaxed/simple;
	bh=wlOUMAr04Y0D3+DvEw5/WiNQrz8mKbWoLCQpnqCgMAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2kpxDGGY9i5QyH7eJZ5qw92aekfUGOOrJxCe2h8WokkIPI1a9ZMzTPB7lHecM7m/jDT2NPYh4Pswsoi1PpticZiY2v+xpLGS2HJLTwZPsFd3MvrDZ5P6JXDWdZWRzP00rOIhXxhMWA9Aq1VaD4scc0kB1RaP9aqfokCeCXbLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwHI6KAw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwHI6KAw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso41826505e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777980251; x=1778585051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LcSpXr1Lc9I+nk5j4oXPdbeYrk4B6zy+S8hJA3qHTEg=;
        b=mwHI6KAwu9GHaB0XUCKKpUnlOMkzOxggaHJgeo24Unh6CIycCVq+v1e3FsibeUb4R6
         8w/AJfusBjQSYQYTXnrmJO3x8z8DQmtwz/ER/9/7EPj3tiGAsZJ5K6kskVGyDQ66QWbk
         uzc7HZT72bVxkNYgKk2HPi51E0bUvpB0kLVWvShJ8j+yYpyI6BS/Xv5sEUfpTQgsaa6u
         S8Z7Lr3f1KhPGjlCsOmKz6S+Ljub7Xhl+kkAnN/QHe4kjIAgCQvz9cKn1opA+fbROOrD
         kKSJH5rjSAgAMSmez/dnK3EyQabQ/RIpvSiUBlkoez25/JNGAIVEHTGYaZJ2CyI4soAy
         0TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777980251; x=1778585051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcSpXr1Lc9I+nk5j4oXPdbeYrk4B6zy+S8hJA3qHTEg=;
        b=bfV2qz+bb5G3Kpmjz2bRSthXfdbIeSvNSEtUYUake9BCkPkUrcJGj14gFpX3h5DAMQ
         WzF26zdAqymsvhquAkfjy/oGduyfeT3lv3Accqv8wR1tEt7Wu7wtuEX1E9g+vpjMhUrQ
         mFadMVGZCY6JQrMkPjO/pNfWt0bQbsWbjp/jCakMymKyd6/GN5GTuVsuqs0zvGJ/U2Wa
         /dDQZb7mZXEpuePRq/9OFG46UREYBwr/ktGtgwoRb/jrGHhKJFGzBXRR3NbDLDbCJz+Z
         AbE7L1HWj1xgxLzxwRBijoV0P+MwmAD370j8MANH0mFMTU6yLtWPvY4AwUPbIoBKvGkO
         FpSw==
X-Forwarded-Encrypted: i=1; AFNElJ/50K0sKYkHDmLDDJoD9qCoZW6T7jZJFOEUUskCmGWC2mN+aftmfQxhkIjKlKl0K5dxNlR+AT4egINd@vger.kernel.org
X-Gm-Message-State: AOJu0YyNNJxkZIwvPK+zJiJzflnUpfIc5qBiyF5fzEg/IEW9ssmtC4wu
	xRL9N3IgV21K5vkH/egxMqvETK/Zouu654a8PSua2ezxHTfNkT59j2lE
X-Gm-Gg: AeBDievlqis1XYGZO0nRoh3k72WsZc5TZa/i7+Tsq8xw0clvmwXWUalgQjYHloKIpOO
	wKLs/Tvvk8oMhJyqCML6iMw0ENTjW6UHSeQ4mDsgjUVr6+PSoJj76Y6XBfqRy/LMVQAwhM9nsSM
	ghVBW2uoNoEKh3hk5R5nND/bUytte9HELazAaxARy/kV2vwXqagXxjoZ7tYdSVq696na9ZI5rog
	ZX2Y1on3fGXEVxtFgOEegW5JjWadbI45KHTN8rX33ra4yKeQvI9V/EmCo7WztFKqewo/BP499Mh
	NyXiUo6Rz/5/vqlI4tbNtFheHpZKRY2gk73LN0g11jZ6rqtqXujdEWjQoaKhzo9LTH+WeAPXUxS
	dgsDu2Yw7ap2oVOcPrnEw1JvJ6O5/pQ+qW+3AoJmr4d51HhE0zbbdQDzJRUjif54JM07cnrIAgV
	fy/rcX1qOOzAIcOt5JlKPCmPSkK3fmWU97D8zDmhyTGCVz4l7CmNm1T7o1Gn/7plfAOXUiabCj3
	+8C/8tfNV4U33gM5nWPGUiO04V+VqZsUVbIGBkkRlJJsfmWsYZZrI6H4A==
X-Received: by 2002:a05:600c:c0c5:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48a9865e95bmr185083715e9.16.1777980251078;
        Tue, 05 May 2026 04:24:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7d2a:9b5b:a191:3b81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm339946455e9.11.2026.05.05.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:24:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  5 May 2026 12:24:03 +0100
Message-ID: <20260505112405.667796-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Note, patches apply on to of next-20260326

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms

 .../renesas,rzg3e-xspi.yaml                   | 56 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               |  2 +-
 2 files changed, 47 insertions(+), 11 deletions(-)

-- 
2.54.0

