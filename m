Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66D50B432
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686133; cv=none; b=icaCvuWi6L6L94+B0L1hHdAqRKPnhawyqACiGcjJUxYvVXNJzjaSnQpcbTEC9ZpzAi5DdfoLB5ucGYqZdBAuyAdP5fGA7jdX95eVJYxxQXnEwgFhAWT9bDKzGXLrP/h7/INQBXbqmNCgTRIyIJ6MMylit6Zl+nTbOrxPLmtegq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686133; c=relaxed/simple;
	bh=76b/ejICPXH46+kgcUnnuIkydq4CVr7Hr6JUbYvKEtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMaQinYuqIWW9PPdNAaRhsNh/+naSa9vxbA3r8Rs668zbPHU34u46MOk4UCsz2mfqfg64m4JAQM6TYNTzU5nfNsnzccJEiBJ01wY9nxSPcpvGk1LXvdGNR2o1dbJ9w26Ao3HFU6P5d4DKzGRnVSN9O95/dHVX6YZh7XgY82FvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwhPbBiS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwhPbBiS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso15563905e9.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686129; x=1791290929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=kwhPbBiSHnXCB+1SH82oEjL6Zb+/D9Ev4YQ3FEeFIilLBmQnfuRzuptoxERqNt4QpP
         ouJz8v36YTAcKsCyI2gU19KOGsSRTsa5j/lUJgdFQlkBpcIJhVlefp3dPDmZ3AfS6mxU
         oB/TS2ZEa7Enpe/OgslCj407a0+jt5R/QWJsO5H72l0SZl1QZ5egsSO46/V99smh1G5S
         nvR9jr7+kdMrR6FAtJ7IrWRT8tBI2ncy94vOiSgcjCv+PdPrBUSI0+4KotAwEXf6Vdf0
         mn2DujAKGNCKCfrT11vU2nlHiT++ohtM3sU150j8apS945JY+GWVSa2qgakdNskfGymK
         HLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686129; x=1791290929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMax0i/TU24FZQ1LcLQrF4u9C2CqZ8oMQyiSKx72pIU=;
        b=HcHO9t32A0Klea1/X9LU3hKYqi4Xp163zq4kESDZEhUtNFU6U3v72kQOTMqNPCHqd+
         cLoEZuntTpcy+QXY1oHG7NPmZpqvYZnv+xXGHx1qYCnN2WS0mIN0T6e/XFhLxJBQZJpq
         yDyeLlBPrLC2YibWSeGym8BkvNF63grT624rW6o5WaCZbB0ka55s6ObkvH/bg9ILfeX+
         a48KtXmK1s3L7PGpYdkKIUsRqyuNCkT9pbmREaV2kgvjA38HzW1AGTM9a7cX5zijC2Wy
         IZoOMHW85Kkjdb2BjMq/K/tkJs7an0gqRELS/jlLYyxBKXh59adoB6b+fH1lgJxBzt5P
         DMbw==
X-Forwarded-Encrypted: i=1; AKwUvBxw23eFxijXGNqnSKPW8rcVQxZ3TNWz3HhJSwomu/BlaJRJOdRXUD/E+KJTn6g3IloffTemlxllxpQG@vger.kernel.org
X-Gm-Message-State: AFuF++mvOkcjqWnHQliz2pfMAtcpegJOhMb60Ji/+dpsnMWidsDzsDVM
	6utTQqPnheaA+GEEYqR/2hQ9uyZD+9KeNqJwFDeMI/AxsDkF2SqVX0dn/HRO9aOY
X-Gm-Gg: AYBFou10bMvet3kOMf2EdL7QkuKmx87uqdHpXsulJkAAUvxq5+8Atsmp/jCEIROKlif
	fQx+6Eb7EVygudBlrtMMnELwooeRhQpr3No+TZtaHoreurVpdfjXFVuziIw/VUgmdCwcKdqyNC1
	+SwnarII79TqprIS6CTQJoHVWFQ3v12utWh1z5LrAyrGyh1CnJaEWBRlXQnAq1/coCvsXY9wumt
	XD7nDRGSa3LfNJbdL3fOYnxeOGOakZxKkNF8+3G9n/egstfCTbxVrfkXUVAiX+BgYDxK0iY9bnW
	0GCWc4q3nTLxe4NYRQcdy1mFYxRnHEKSMuQ7M7/FD58HnBwyITuBrQjD1UZ4gkEdDLsGiaV8Y+q
	x70Z+3HD3jQR7rJ0OZZKjfFp0vi+jFHEDIhNhN/9fv0QsOm2XDEv/aszOkRBS0h8HMRE9Vu6PdO
	eUlesUf1YvvwI9eK0/6JuXLQEmkXR6pEMKD1eGgAOeXsok44EXW58grjBLgdB9Dh5gSst/pzcpE
	0lM6RxaH7Oj9pm7foyzJejjLpfYj2X+fU5tuIeKEyabLDM9RH9m7YnGz/lvw9d1ZeYcNDtiBqo7
	/lCM1INFpf00GgskQ5sJlmMt8bjf
X-Received: by 2002:a05:600c:1d02:b0:49f:fd66:5fe0 with SMTP id 5b1f17b1804b1-49ffd6661a7mr171208455e9.9.1790686129456;
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add ADC support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:48:25 +0100
Message-ID: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series aims to add ADC support for the RZ/V2H(P) and RZ/V2N SoCs
and enable it on the respective EVKs.

Note this series depends on below:
- https://lore.kernel.org/all/20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
- https://lore.kernel.org/all/20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g057: Add ADC node
  arm64: dts: renesas: r9a09g056: Add ADC nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 144 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  12 ++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  48 ++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   4 +
 4 files changed, 208 insertions(+)

-- 
2.55.0

