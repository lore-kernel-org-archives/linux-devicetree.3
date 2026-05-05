Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3313143635A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984634; cv=none; b=fBbjZXN6ssmGSfSx6Z1BmFcXwN+ITLZnMOz09sM2SdOJhsSFQqD7qu/uJn0rb9yx/23knOTNE1F/ALKvn+j96EdB83t0M2/aWckf8I2k+2hNQUnKN4IwVCY6UHDXzLMJhf1Fubk/JzyCZCGP2uA6X1/HCLfdZ3DVthl9n/PtIiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984634; c=relaxed/simple;
	bh=fXYtnePBRLtV+M4SHHrrefJnYJ79aRxHuZxbqdakfzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MM/H6x+SBVUJHXuyA+TWmDBvrOmw+CAQaDCUgql6cEWomdWiNSw04XX5KT2WiQQ+yyGTRQ7JLnxkbpis5Bh//zvWYbZNPjC9X8aXbB/6Bvr1PAiMXE41KT1z8XRYFhBGaBdSCpcGkpPIcFK4dwAU3MF4BtV1xZiV6qanX56X9do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsgfeJ5j; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsgfeJ5j"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0046078so44722975e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984632; x=1778589432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sKnGr22K/Ed7RFCo6QissygXi05auc89BmYlf72LcYQ=;
        b=ZsgfeJ5jGI/yhISdBSH1TWDgJFLomKXfyba5DrDehUzJkhTsPGd6RABMbRZEJEN5Ts
         tICbFaAdiErnN25B05J1Wl62U4MYT5r5Nm0x0qhvstvLuYXFysLHNRTsBPmHwj89KmIj
         5chKY+aWKlZCDia59v9roenVFJX6+6qrAzub8a1cLkcFNDw+nBBeIDf7oGe1rzUS/mIp
         I6uomdejjeb375EB4MTQ6jv40FbyygNWuEdr9mqwo9s1mYPRCldL2t9AksECrxmuZ4bb
         xO/VXl82zR7LsxeaWUZa/KULMnQFROrwZBaZKHZYvhVkR7rmrDnIJiTVu2DsnZVelOre
         9fRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984632; x=1778589432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKnGr22K/Ed7RFCo6QissygXi05auc89BmYlf72LcYQ=;
        b=hbjUlC1/fORBiP9QNsnaBYVoDz4UTfHa6GvLLTbqY9GOUTVF0byrrjcULDYP/Uvxdn
         h08HgGjXn0IYTFoWS6OICfqogvfF1kKdyyyxpOnS4YHcDP8Jr/uu3TlApSRt6KA+OvMd
         YTCwTlpDHKFcilr0R1ZyQQjn7HlfjWqraZNXPzHXZYuPo675ZiYh5rM6hwEj04UYrUPy
         zSZBGlXYNEv43Yi/GTBB0bP/JWg43+8hJzTPfT7Uw6hnlDz79zLAeBA1PS+eCPzRUVT8
         V+JIdQsgkQHE4R/OoH6C4ey71OtCcLTcNsBPqlHt+oohv0TNmVXwOfffWOe2G+KIWPzR
         RILw==
X-Forwarded-Encrypted: i=1; AFNElJ/DRyf2xEW4O/zLUpOuqxrCFv49dasr2iYTCf60tGkq9LSA3Oae2hRtCgiND6AwvJ7qY2A2wUVyRO0h@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQxyNB22xPBnfNND+FFZ3IdzkfXDbUZbyriFNVBAx75ZY4fD5
	kDm/MZr6tvik+iLoctdAFFRx+YjCWZENmGE2JjB3rdxZVg3bdeVtVGW6e+9xWQ==
X-Gm-Gg: AeBDievmrQ90gH+wL/aUP5QE1sQ6pFzjkgoQAAUrXGr6P6zANsF8crpCRhupwBRH9HE
	I+q7C7YZH7YEHJIkIHV4kJH6PfG+7Zmog540pEjfVwXewEPX7VRwBquHXQpNgbqWLnt8cW/P8bo
	H00FlVFSZnPDq4NeTml/c7Pd6l+xgWPULvGJZm0GeAjN970M08OK8zX71DI7OiKOTEs7edKMeZL
	80Yj93dJM0Gzs4ul0dK4rrU84G7a5W3KppQHgwk279nQmuemPlKeyXawNwnzLX4OqNH2lKKsISh
	t77SWTUjX/JHd2Ju/AKdky+DWlduAmsbeO/Oh/c98YY5DIu3FWz44UFeV/lmWviQZkNPNLMc7Ek
	cNxHi32KnkQWR/guTpJxGs5QwoL7MJDBJMWodm0hfP8FveewCYCGlqflVPMc0UP7YQKlE061/6u
	DhdwIANg8SHqVslO78kFLGKwF3W+lnZdo83ddeLrhlIfZX1j42e1zHwoO96BQ=
X-Received: by 2002:a05:600c:698d:b0:489:ad:7b5b with SMTP id 5b1f17b1804b1-48a9866e8a5mr231113835e9.24.1777984631419;
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:11 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/5] Add audio support for RZ/G3L SMARC EVK
Date: Tue,  5 May 2026 13:36:58 +0100
Message-ID: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add audio support for the RZ/G3L SMARC EVK
platform using the SSIF-2 interface. PDM/SPDIF support is planned for a
later date.

DMA device nodes have been added to the SoC DTSI so that SSI can use DMA.
SSI0 signals are connected to the DA7212 audio codec on the RZ/G3L SMARC
EVK. These signals are muxed with SD2 signals and are enabled through
the SYS.4 switch on the RZ/G3L SMARC SoM board. The audio clocks and MCK
are provided by the 5P35023B Versa Clock generator.

This patch series depend up on [1] and [2]
[1] https://lore.kernel.org/all/20260505071544.8965-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260505070206.7932-1-biju.das.jz@bp.renesas.com/

Biju Das (5):
  arm64: dts: renesas: r9a08g046: Add DMAC node
  arm64: dts: renesas: r9a08g046: Add SSI support
  arm64: dts: renesas: r9a08g046: Add audio clock nodes
  arm64: dts: renesas: rzg3l-smarc-som: Enable versa clock generator
  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 127 ++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  72 ++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  42 ++++++
 3 files changed, 241 insertions(+)

-- 
2.43.0

