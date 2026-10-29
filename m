Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262361;
	b=yC96b3nSys5+UFzOzE4UQvZtgKxdBl9i+EQSnEEcErsc8ds9QxeQEls7Tbn4dO43WbDJ
	 ddx/4zlIUqz7N2oPNxf5aHT/9mrbsAW7nT8kWtpbhsyOkSljkPdxlvUchhmaaopFculX7
	 LDh49VtMwi4gL4p5NL5swcVuFDA04f8AoT1Dn+GbCYnyBsVVSReyo5iAsYP6Tj5Ut6KxP
	 zMe2zlH18Rxd0cMEyqnecuro5t1Ldpvo5JzqLlCdIC6pWk/AmfGktGBO9ajjTo/i530Qb
	 W8pbsPAzs+5/wdmetYp1yG2zyIgb6SECBaRMfL3aaUhGQTdOhWBmICdnXEoIF4UKrXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
	b=WTqWbJCsCo3NKdx2Ussg9ocCqCA0vpsU7Em5axJuCoAGbX85XPgxqAfOdR/YUlIKZKg9
	 /UBvoI09hbPQMJUIEmctJ47TAAzHekVq5Nvu21TVeL2/oZEsDLXC17XuwgbkSoHBzR80K
	 T6R9i3hsT5VX1eV5Y35qEwcezxGNi0y9sl5avkxV6Sbhz3JaTDAEKIcS8IMhN/I6U+jvL
	 n6NEnepFFqzpS6kocdHd/AroOAXyGmM2wZrxLwBpsLo9808i4V/Mz3IM+ooWUEUvsj63E
	 Y5rFHqfKFn6wS8XEvrwlSBJyepWOMYePErAMPFHZtSCUE3gLl5TNXI86mqumdbfiKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZEWLkcMZ;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C778B606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C778B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZEWLkcMZ
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e74a32a07fso2824805ad.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262360; x=1793867160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=ZEWLkcMZ8/QNABuzDhJfJmFN5hUPFbOLuoMMYZuiB7Qf7nwzWq/ntmp4K7YADMs+bK
         S/cQbbdch+4vnPHfdd1Wb0IbE8RQJxTV0Paca9FtnPnirjLNcQCamNWVEL4pRwVvAqva
         YskHf9oXe/D4YuNmsqORQE5yLJSZ0COXH7sUMishp9aXSStn6cdCyK75Plr3SGg/jIyl
         Arsg+6Nuxwo49Xj1j+iC7nbUd482zlziaYjnqt+iVnLKrf+UP865OzwUUIO8CBMsGHhr
         F5XuEUzWAPLXT5eW4gcadQqCFFe0x0xTKICfeOPP5fOBAD96gXUR74N9AajszIwJc8AN
         y0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262360; x=1793867160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSAI1Taz7XPgEgkZ0/+WnfXZLsVVAFKEoUaZ094DMNk=;
        b=vdSaTG/T3qU3xbgT8iZIzhRuJW6VZaWlr0nzwQME52aH837PQtJKWr1jThKpluUHgJ
         66Gi883BC0pDfhRiymCytAbpxdjLeMsUWx2O4RHp71j+e7DYPYnDM8ARgIFI+1ml20Y1
         j8CUiN0PpchsFdlRxEa1zv+xbwUsASmhkKbZp4CEXpNk7dlUYlg2GkiBSfahlpNU6LVX
         1vpqyo6a4FSn5Bu1QPJwpFXLUjAXtpv+MmHoBozxG79Tvsf4bBpHlSJttxUJIAk48b/4
         X/KVLinb2MVuAdsmJCxr8tewZiaG7wpjORL8dA085bWVV/gE6uhz12xHGenG9FOiuyoV
         XLuw==
X-Forwarded-Encrypted: i=1; AKwUvBxj+jDHynMFz/r/R8NWwoJII70MIWgvNIEsTOA13HkW0MO0OTgeehOhenSg/C1z20FGRaNyM4w03Bw7@vger.kernel.org
X-Gm-Message-State: AFq9FYIlhUGKax+b8KZRGQQc7ueWEsI5NdeVB0WYv5OGFRTH3IF9xklK
	P6TqE2lu+XFyjNOViGKlJ2ybtQlw/C54nhjLQyc/ri1clOsAeHuXpcSU
X-Gm-Gg: AYBFou2l1PqMUADIeaY7fjqlv5AVSQxwKJQusfWYu0AKneS5khnHn0FdPxNsTO386fX
	luk3gkSLaPLGzxRxCDvg9CdLUWy5kt2fBUSKWG9l2pbCuMnMZXO3LJLodNUmBnYhXpaB6075cdD
	MzOnix/rQRZSlehU18c9TqWeNUeadXzDH8oYsKAnnfq3pVz7uofT1WeNgYm3e6s1KRxZpW0eirh
	3U2VsW36YUOQsaBiVxtVa/zrXyLj556sWuW6NprlfEkK1gQYgizNKV33xhUcgmrZmIPJHleLoKy
	LqgVBtwO7QfdLTAuiYBVFNc5h3jlUcGSfzuUrJ9sABoQTZ75GLHXpoyXd7abw4OmIlgNBcrzfjv
	eF2HH8CinqTnINnm8isBmlaEP1PGEwK2vdCtZiO5wKxoxp6xPopxxY3ImuxJcCgZzIdGcKgwU4k
	/aYjGyXnbOBOz+YIw06yuOlfbX2Jabm5OSAfp9MljKlcAjHMGPshOrXmpSfANAy2gLxY77wHlIx
	ctyHCWr0dPPcF2y9CMB9JTZYKv6lEyeWQfxhlkm3ISy8sWLc7Nlj8La5eUURsYKnfGebYK6rVvh
	22Tdeu0Le817pe3+ovyKFgNFx3nYR884
X-Received: by 2002:a17:903:32ce:b0:2e9:4175:306b with SMTP id d9443c01a7336-2eb00052bc8mr67641045ad.1.1793262360067;
        Thu, 29 Oct 2026 01:26:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm30031585ad.16.2026.10.29.01.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:25:59 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Thu, 29 Oct 2026 16:25:19 +0800
Message-ID: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the ArmSoM Sige7s, an RK3588S-based single-board computer.
ArmSoM confirmed that it purchased the CoolPi 4B hardware design and made
no hardware modifications for the Sige7s.

Keep a distinct model and compatible so Linux identifies the board under
its marketed name, including when a kernel-provided DTB replaces the
firmware-provided DTB. Retain coolpi,pi-4b as a fallback compatible.

Following Quentin's suggestion, the Sige7s DTS now includes the CoolPi 4B
DTS directly and overrides only model and compatible. The existing CoolPi
DTS is unchanged, and the common DTSI extraction patch has been dropped.
The series now consists of a binding patch and a board DTS patch.

The v1 series was boot-tested on an ArmSoM Sige7s v1.0 board, which booted
successfully into userspace. This series retains the existing hardware
support provided by the CoolPi 4B device tree.

Validation for v2:
- Build-tested both DTBs with arm64 defconfig and W=1.
- Ran dt_binding_check for arm/rockchip.yaml.
- Validated both DTBs against the processed schema set.
- Checked the new DTS with dt-check-style --mode=strict.

Based on next-20261028.
v1: https://lore.kernel.org/r/20261022125339.82746-1-liujianfeng1994@gmail.com/

AI assistance: Codex prepared the v2 changes from the v1 patches and
mailing-list feedback, revised the commit messages and cover letter,
and ran the build and schema checks.

Changes in v2:
- Drop the common DTSI extraction patch and reduce the series to two patches.
- Include the CoolPi DTS directly in the Sige7s DTS, as suggested by Quentin.
- Clarify the unchanged hardware design and the reason for a separate identity.
- Add a background comment to the Sige7s DTS.
- Rebase onto next-20261028.

Jianfeng Liu (2):
  dt-bindings: arm: rockchip: Add ArmSoM Sige7s
  arm64: dts: rockchip: Add ArmSoM Sige7s board

 .../devicetree/bindings/arm/rockchip.yaml        |  6 ++++++
 arch/arm64/boot/dts/rockchip/Makefile            |  1 +
 .../boot/dts/rockchip/rk3588s-armsom-sige7s.dts  | 16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dts

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
branch: sige7s-next-20261028

-- 
2.47.3

