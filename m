Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539471;
	b=dM0RbrHuPPnp0tThRN7ZK7ZY85r6f0vE7yJeCQuR0rrZVMTPNZhFQEMrF5hZHO7poSDz
	 0YyEq6MXarTgJB57n6g1JodgUUDmdeG9UBY+oiOj29QUdTzez46ICok57Cz0+AUj/Oh4C
	 48wTBpprEezLUYU21PUifWkBJWM07IaWOFpuum+zPhxWX/LfcvVwS2qsOL/SXFvaMbfOV
	 WeIPLwWwcH5QrjhZFzuSRTRvfhIjlt5AoN5VpyCaXoIDxvW4R2OTDZwyftQDtv+tObtwj
	 SDHxfSZBamv3OkM1mbnHpGLo0dRkjTl6Dxjh/SzdhuTjdok0ghGxe/apabuAUH6dtgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
	b=E3JbwUAgHKJIyt96bePHX9A4xTS1xq4EDsxudHGdAiLcb1XKAG04O1UJEdXRgu/GMGeA
	 PTOQnbSAsc7RxD8PtghMtjKBdQH0JSHz2ACbGWLjgxFdlP+oEFF8rhIpJa5twWVBFqIwe
	 OXE19dv7MKjAaPc0mYf8aAwQMm563cPY9m60LKslJEv4/qnNn6LILxePZ8+pC4M6vI3GI
	 lqEunxXzFYvHMDxiV9/CgIWdYW0Vygo0WGbEOnCG5QMI6+v0vDs9F+2a6tnquPSX5LBxt
	 gZbhs3GQt3BrdxzX1RlIxGIm+EWRwOLh28KxfgVzzq8FBbIawTWGuUQ0qQEiMpBZgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26E606A337
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C26E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEFO6fAb
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4aa5833c263so4592288f8f.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539469; x=1796144269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=sEFO6fAbA4G3XO6q+zujY7LGmdUMiGjT62QMyhVzKOD0je/nwpy3WYgt+iQYdYsL8N
         yH/UMA6ogU8mUzKeMIOoFBx3PDqTusT56wYU0ga1M27JeAor8knzizwnvA5EYOKU5x2+
         x6VZs5gBv6ri+DB/evcL/nIfdVU1zPeny4iyaR99YLFxeZ8SSZ92vT734Q9btQwSSNLI
         0HHnw4n+e917y80Rio68bL51iWoekuzKnQsIZTYVQsSMtedXJkkiDCXlpdR4mYQDyp4c
         8SV9nRPNrNpS8ZnSo7SiyZw9gyCOZGJRkfrZIPy2IwUm/h+eRS7JiUX1hZNFMtdQlPTh
         1NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539469; x=1796144269;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8ZI8+XAVfJmCSvezhsQ+NgrHMpYW4dThTVsOo67L0wM=;
        b=tVe/EGMPBrrwbB8AFQLHm38H4lgmP/WJo+xehPt3Va+DgWtsepeejtptNaBMJ71Qiu
         Xn669rGxZvJLqeCRVVgzg4JpKC4jB53Ik8lyNhgY7qNn7CLwKmAecmkr7WugiGrACect
         TwPdmPj5FxL8HXE2CcSkcE+JqOIQg8QUY4c1r/XBzWmwS43tAf+RePraFiUzvkL2F/a2
         GJ8fn13u9N1q3X2YcVZ0y051wU+3fvj9acvVasslR5hIHVi+4DNoxhyWZkYABWuKS+ZK
         6rg9BEPk6NhmXo8YnVaNbxF46EiEgRRfVUZGRxenAP0fsvhhdU4ejjccq/80s2TVd+vQ
         rGQQ==
X-Forwarded-Encrypted: i=1; AL+hErFryMc44kbr9JAf7INOXjjIepgROn9cYlxI6U2L3oEsezDmV1khuWXYjVJyt0p1Xxmi8Ys3s/TK+t87@vger.kernel.org
X-Gm-Message-State: APuU4Z8v/iPSWqjsmXhOqwiNRn5XKWwlfSWKZUVafUiBCgEVzS2aJmhB
	UvpFVZFBw95tkrzedtc4l3BTe6cHav2ERt88g4iBZsVzRqFVhqlhA31CurMsYQ==
X-Gm-Gg: AZFdTZfxSPgoPKaJaJA7313bUBn0D7JUX8rJeFKJPR96v+pfyPgb8EJZIvI52Rkqmj9
	tyIQMQonfB7hgggoDT3f6jQIkm+m4ts+cyUdTqsejOeq5I0Rjvdh72YlxEjbONvmpHPS9yMSCBz
	Z6QBJPywK+KAz2zDK+HXgnKJhe5Tf+4TzJMDuxQks+gdsFab3BaB+CBX3tfLwrde6noKTh5U+fv
	1E1FDlszpPRjxhehaswHbITYA2BTETHQeIC2zkvZEM/ySLVpoXVh/ipqNUcE4sGCDgYgyDGKhMb
	062fEbWve0+E2bQgb4JnMLuwresLKTWSEs1dLRn/iPo/QP/GFpL5oYbkcns1VgdUbF7c8nqxY5T
	sMFbHvGkBO956fRJychI+H4cqkegWmPiWH3nPzeXLCogmxsUE+1+/u+hcGehxBkGByJS84ENoKP
	7uve3yVH9H3cB2kTPZIVcfHyL0Glij4CzNkDlvVJt7yDWnRW2mVcB8tgkQjSwJYASv+x3fAeyQV
	KwkqpfjKrPcMYZ6Qv4s6cWk/3nMcNNqmo2HwqliayEcvZIk98RToI8bB4DfiZy5pHvPidki8Jdm
	7hft4xUxkQuNMfy9S3rgfvN8/5SAuds+B0jHx5Yps88Ui5yeQdrk/MF3RVFIgxG03A==
X-Received: by 2002:a05:6000:27c9:10b0:4ab:6077:32a5 with SMTP id ffacd0b85a97d-4abb30b85e2mr22202041f8f.30.1795539469277;
        Tue, 24 Nov 2026 08:57:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm28794104f8f.20.2026.11.24.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:57:48 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Enable RZ/G3L SDHI
Date: Tue, 24 Nov 2026 16:57:46 +0000
Message-Id: <20261124-sdhi_rzg3l-v3-0-67cdc83b7e48@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArCBWsC/23MyQrCMBSF4Vcpd21KBju58j1EJMNte0HbkkhQS
 9/dtCtFl+fA988Q0BMGOGQzeIwUaBzSULsMbK+HDhm5tEFyWQohJAuup4t/derKkNvKmbayrXO
 QwOSxpccWO53T7incR//c2lGs799MFIwzqxU3kjelKNzRTLnHAYMOuR1vsLai/PBSfXmZvNFO6
 VIVdb1vfvyyLG/0I7y66QAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795539468; l=1532;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=iFo7sdHkGslQ1kSM+Y25akW9VwgPNIpJbKGmr8OYoYU=;
 b=6C7wS1kP5VKdYvjWxyVJ3aGWwaw55O51VZMSQjiPBj+3fuYpsPIuncCK+Ci0WVBKVfMdAaGOh
 Q37SBrL/oP+A4auyv51QBsShkRiLzriNRrpotmYuAGsNfSoMoiJhzzN
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
- Fixed syntax error in sdhi1 #else branch.
- Added generic node name vqmmc-sd0-pvdd for GPIO regulator.
- Retained the tag as the change is trivial.
- Link to v2: https://lore.kernel.org/r/20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com

Changes in v2:
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Added a comment about the SD power signal.
- Collected tags.
- Link to v1: https://lore.kernel.org/r/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com

---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 104 ++++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 407 insertions(+), 1 deletion(-)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

