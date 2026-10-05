Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366C3AA1BA
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240044; cv=none; b=MW4Nojc/D9Aj5VvVRoYIB+GRD2SXIXb//TxRrCJNel9WoozxznfTGo3eaweAOmPPPC2MWJBJxI6rV1RFEdhYyb6SpVHP//3477cUTXDTrSXmU0q7VSifrY5JJrj4RSI7v8S/TxePEFxfUBqGtozb2oGFzF45izlan3Db8UlI5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240044; c=relaxed/simple;
	bh=Mg+xLhEBE+iNwytNcOclz0X+Cg8TFYLnf/u5pFemE2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4EcoAiMoXwFXCB6FKyJ3Ky8igeqHajMA+UXzMMGjd9w8nqNWJX/2T4AyUeQ7Z6QOTjSUQRN35ikOjs8/HfzyxLmuNfSqaF+6mDANkcXWjcDBShJV/LPCNrw47JZPGDb5nr6OYNNYQxA37MhD41x0DqNjnVEK80+UvzYVwzXTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rncpOBWD; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rncpOBWD"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a854dffb5dso168844a91.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240038; x=1791844838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=rncpOBWDD4guQAl4cXfmq+OfSC3li3I97OqdWoHyQrvDGtZe309Pwi9duLbt/EeEdX
         w775WQ0e41+j3cq/qF75pM6KFF9jUhW/cP0ua7IfPRLzptVthPMAmd+jQgNpTWlW1wMB
         yGCDCNyFpSrhjsi1ErOC6dakngdCqFflWNk0Q74yKP6fABXbjYtbOIK0NAKt2FeKP8OE
         iATZR3DClV1HuNgdtuM0Oqr1sTkmgDDOy0VUuAkDtwEcBcXL9n0goH/14qppuadiOAX7
         xrlax/uQrHoKl53isoCK0Wn914zWzKIyQHEjObgHHCQYNafbjMqqtC/E//75t4vBVn+W
         Sndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240038; x=1791844838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3O5Pix90BvrGtShH3HWLTeak2Koa8dPqPpawpalPiLo=;
        b=EyQNx40T6xzGFJ4EXkzXmapv0ExX4uYshJoWP61XVloZ5PRbWk/IjF7QPjojlwW6e9
         wWBtNF/EA7FSRZR7nxr0HQaseZz7bU9Ab1FTFlB+ZqByGQwg4G1Tq1aaysiVOLbPcTdN
         fupIFEiJ91OBP4tuJUP3GZE3fM5JOmiDC9DklQqBpf13qZ64yGdCzILo32wIAJ7UD8XY
         CjGwr7ymHH66rvecH6elVXYGfqck6Y9QBhw/hLhZco+YYa/aK+x3lX5lvrizKHTRJEFq
         y9jCcomvbNELG1Z9i3TotzVe8TYjw8+JRIP+HdkoIfM7EAEzCl4cmkXf+8Uru3nCcWf5
         T3Og==
X-Forwarded-Encrypted: i=1; AKwUvByGKmlUYF6Z7HNFTF4ZgJ+e0Vj29+EHda7qFW3szD36I+Ywo0uTWqSA8vOLP9IMeO6XNxFRUmvaHWzQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKcPKmzeDZM9FWdsysunQaXMZOxg0D8edoD7wusE6CeSUD0IARk
	ll6r3nsen6vdM8aUY2/DlpKs1rU+f7ALGhWju04GoJUVVGOnFOGleW1K
X-Gm-Gg: AYBFou2jiMGa92NOCh1eQ9FeM1GUTKP9oOg8UsHl1wo/o6FzUsGhlIFueLYHzE0OhIs
	AQgcG4NVIFNdBzajUA6WhzokqTAHaaEkwW/AjLlocgTx+EqPjBpcmpdezdYJeyKqYnAQVrHwVSz
	ViCifqcjmlF0XFzmZrdhRlhi1j7RDEqLk0x4cjLL57F8PY7jzHMB31CYdAnxKbCl6XLBmCXrBrD
	UXYZ4sI1SqM1qSe1+ECyH0vmqfbRbGW6bgxl3zZVKLz5RRyJkJvUrZFKpxeLiZ34iwzFZ7EUcaw
	2asysFAc2cPTDlzhh9Vt3Muj4KgzuymZGdAWowUZJcVObKIC700k2eJdULDBoQOBQuFykznll+/
	H8SPoGsA0kbXu2GCdAT3mNkD+X4G8VuXGwdVeRSk53UBfGdhhaKq5BoRFHRzN5/iNcT/1wcv3+a
	+S2ebvTJ5Hi1rBBKbKjgveTsr8YDW8m9hoHIXg4K0WeLJdAv/Oy+3vHgSAPqdm6+U+W27U
X-Received: by 2002:a17:90b:3803:b0:3a0:7591:ad7a with SMTP id 98e67ed59e1d1-3a6ce3b92f2mr9535670a91.5.1791240037537;
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:37 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 0/2] arm64: dts: rockchip: add RK3568 XPCS nodes and enable SGMII on Photonicat
Date: Tue,  6 Oct 2026 06:40:06 +0800
Message-ID: <20261005224008.1140250-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the RK3568 XPCS and fixed-clock nodes, and enables the
SGMII LAN port on the Ariaboard Photonicat.

Dependencies:
- Generic PM domain (genpd) changes:
  https://lore.kernel.org/all/20260925041751.495818-1-coiaprant@gmail.com/
- PHY binding+driver (Naneng Combo PHY SGMII MAC selection):
  https://lore.kernel.org/all/20261005221229.1095843-1-coiaprant@gmail.com/
- stmmac XPCS lifetime management fix:
  https://lore.kernel.org/all/20261005221749.1104430-1-coiaprant@gmail.com/
- net-next series (XPCS glue, dwmac-rk SGMII support, pcs-handle binding):
  https://lore.kernel.org/all/20261005223011.1124347-1-coiaprant@gmail.com/

There is no hard build dependency. DTS validation will pass once the
binding and driver are present in linux-next, which they will be after
the PHY and net-next trees merge.
---
Coia Prant (2):
  arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
  arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi      | 45 +++++++++++
 2 files changed, 117 insertions(+), 2 deletions(-)

-- 
2.47.3

