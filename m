Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26E4078E4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506000; cv=none; b=dF9SalA4TFg4p5iwKchnY5pkq6Nd7JsVEK/Hl4K7y5u5s5YQSGWa9LfMKemuqdHuZ+a6kK1lkH6tIf1hLeKMSs93ru5p2ZIXXRGm3oRfWradJ4/Bqs/g/HarXOtdlo1rcwrRFmDnMPa8Fwe2S45Eb8C3oyOOh1ViFZ/+9fCuda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506000; c=relaxed/simple;
	bh=kPo2A4/G1RUw2GNBKxEWcUW5EjGZfPFUjXA4aA4hoPA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U1fupHyB1/CzvmOcvPZPfVYqLoQ3KNerjtZ9a0UPQE0C7DJt/wRmAzyUuPPGj5WxD/MmHgQjEBTJ5di6NIUFKHJ7n1agPtHGiHK4eU4u6KdAgnf6JPnK0Ddf/j0nk8Mts0gxSyfY91/DHBTEd1Hgu8X2h1In95zfgI89zqOlFyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAG9PKun; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAG9PKun"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c034a769so29163a12.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789505998; x=1790110798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mAXq3UY78M5fghzpC0/2Ye65vKnLicW7UPWpfKj82yw=;
        b=NAG9PKunNszE+K5DKrWZdzgdXN5/w6EFNZ/eO38oA/0DXP7yEVxYFoYDBfXTK87AOF
         mhLziy4gSUYVurgi3zgvZvTx8ZywnJZ9jmU7H/h6VLAV4SFzKDQoSuCegc6bfNjtFvFC
         fwDVd3NLn6wPB/auH3W9CFoRRnZlsbTfVn690VpN2whVMxMDEVoOYQQnmpGmVRgtEPMh
         QXq9MnTDbGtyRNltse8RacCm6QYolf1zErIlpgVzUA0kbsaxaRqSTrRXmCN4VTEKnngu
         nSfS7DpqhHTMExfj+YbmrSPtzweboWWKwDSTmRnUsSevOhYO6x2cEmSoWIn9qQng1s8V
         YJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789505998; x=1790110798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mAXq3UY78M5fghzpC0/2Ye65vKnLicW7UPWpfKj82yw=;
        b=wBNsavxU0Viiq3CJSmPyGMMqCBVHEJiAMMHsnCsOpKrFXcN27+hX9E3KS8FFUcZ+Gb
         UXL/zBqNBVCY35Ls3zSokI8Zfif5w3VssgrE9+ju94U2Wi02WrftpldWVlHjAnVn4xOs
         plnJMCZP5Mr0ixwHpolmcvg/nJkapxKxWqUXWo8jRCjk+2S7kqZBobF8CCMdtheMvYDh
         GCkyAvpVSwAf7wHxVLJEphJAsOiSWZ++2fbcAeFQY3GIkFgOfU9NInZjY1BE7B99e5dF
         Rgql8LIIH1MJ/KTu26z807szOMmKIihUz4L4cBzZqg7q2hBZrVCQQwBe4d3WBKmlyNss
         IThw==
X-Forwarded-Encrypted: i=1; AKwUvByFkdlFzJEj1CEIhfM9j33jpdXTn8ow8RYcvPi4AVDlRXxu9q79YSxrxAK2MCifwjJEPbawFYNbvr6k@vger.kernel.org
X-Gm-Message-State: AFuF++mranRRMageOfgD8vqrO8vU0UptltKkO0985Het8CYeI43NgMrd
	pkNddOj/Id6WPHdrwBLJqHcLB8B/iEIccGztlNOLPBs9ASJBC6R388Qy
X-Gm-Gg: AYBFou0iWvwRYb5gqA5xfb0wSJwolX+GKi5+a5K1tCKHg13tvjLNBlMMQypCiNDzQf/
	+pt5NWeEDwXp9SEr39iKShpEhMZclQml2D5E2LQSB28c5SpG2KVH9neoF2/wyzOJe+vYdvaar3I
	iJ2ewNhFxwHERECfboXqFZ7miTGjptuULbuvXX9r1RlEqmYmRn6cwg3hbFGb3LdOZV8BySimEK1
	QNYc8L3GKaGZ7APeogRdJ8hdeVkKoejOurus5G1O+yvp/UAOVRI6JqU0D2A0NXwAKk5mYiOrVCI
	LK5NC/LuKKyrtiN3XfRnqAg88t79Rt/Q9bUzQ9O0bw4WiJ8mcX8GP3taplV0rSxzDljfiKYss4e
	tH1+SlnH+YsIR3zCkEFmAdPTzaw4Fk1fs290hvEtisHK0llZ/sRTDe3EjbAXbU4WumVfAJJkffN
	eZrVSHF5nHOy+y/wEho9TrZaJzp6Clq/oLYVJ7IRNhE0Fe+rA/mwDXr4g93QBrdG+Jcd51qrokK
	FDnlpuKfPQ=
X-Received: by 2002:a05:6a20:9c8c:b0:3c3:2dc0:7cbd with SMTP id adf61e73a8af0-3dd5f550a29mr144628637.1.1789505998304;
        Tue, 15 Sep 2026 13:59:58 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1483sm465432a12.26.2026.09.15.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 13:59:57 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/4] ARM: dts: ti: Clean up OMAP crypto bindings and dt
Date: Wed, 16 Sep 2026 02:29:37 +0530
Message-Id: <20260916-ti-dra7-omap-sham-fix-v2-0-4eadb60081e5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSwqDMBRFtyJv3FfyscY66j6KgxijPmiMJBJaJ
 Htv6gY6PAfuuQdEG8hG6KoDgk0Uya8FxKUCs+h1tkhjYRBMNOzOOe6EY9AKvdMbxkU7nOiNsm0
 1a9RNiUFC2W7BFn12n33hheLuw+e8Sfxn/xUTR4amlmxifKgtl4/ZaXpdjXfQ55y/CD8La7oAA
 AA=
X-Change-ID: 20260911-ti-dra7-omap-sham-fix-388a067572b3
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789505986; l=1647;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=kPo2A4/G1RUw2GNBKxEWcUW5EjGZfPFUjXA4aA4hoPA=;
 b=rVqx5jSUyDMJKczoDv0lUuW775dpSmBSwHDpyYUPOKXi71Z9GGR9Z5DxWjAzK4aw0MNKiGMNO
 +7Jea75W2TsAIasIU5Yj7avrZj2Dhk79O7x+B/PhUf6rIZh4jQ3TlWI
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Patch 1 removes redundant properties clocks and clock-names from
omap4-des bindings.

Patch 2 removes redundant "clocks" and "clock-names" properties from the
DRA7 crypto dt nodes.

Patch 3 updates the ti,omap-sham YAML binding to add the missing
"ti,omap3-sham" compatible, deprecates "ti,hwmods" and removes it from
the required properties list.

Patch 4 Adds missing subdirectory in $id path for omap2-aes and omap4-des.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Add patch 1 that removes redundant properties from des.
- collect tag for patch 2
- Add patch 4 to add missing subdirectory in $id path.
- Link to v1: https://lore.kernel.org/r/20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com

---
Bhargav Joshi (4):
      dt-bindings: crypto: ti,omap4-des: Remove redundant clock properties
      ARM: dts: ti: omap: dra7: Remove clocks from crypto nodes
      dt-bindings: crypto: ti,omap-sham: Add OMAP3 compatible and deprecate ti,hwmods
      dt-bindings: crypto: ti,omap: Fix missing subdirectory in $id path

 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml |  3 ++-
 Documentation/devicetree/bindings/crypto/ti,omap2-aes.yaml |  2 +-
 Documentation/devicetree/bindings/crypto/ti,omap4-des.yaml | 13 +------------
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     |  2 --
 arch/arm/boot/dts/ti/omap/dra7.dtsi                        |  8 --------
 5 files changed, 4 insertions(+), 24 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260911-ti-dra7-omap-sham-fix-388a067572b3

Best regards,
-- 
Bhargav

