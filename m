Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A93CE084
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693000; cv=none; b=tRQLAToAv0x3STj+7IEMGFh8mYBZAPOfwotpNad+T3rM/MJSXTEHmjETNN/NbAObR/S6QBbSLb+n86fna2B3OtmsoRZbi4lEm7TqoJTsapI8cPeKQ8L8WyD8GI/Y6ME5NV1AGewzc97h1U9uI3fCpQpI8J1Wte2VRbfurZjXT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693000; c=relaxed/simple;
	bh=TAlX/MBj9t38pJGd4AC8U0jUF1uArbeoK5p0c92YSSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvhNKazkOhZPxZHPWF2rQUYc4RXvndcSbFa/FQcFhues4YQElGzAk0KPyhiPODQLuVHxJYo1lIuaOVJOkcTmUbpPam4Cmad7ICg7cwk9FRHvlNeCtXJMJ1SoLBzsILAL3Lfqct+A3rPmUAXyRn02P50nqoLXyQz3qYxOGJBLxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db0o2w2D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db0o2w2D"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c355f711so3489955ad.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780692999; x=1781297799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIxeKA2d6OLuIfSBHegRQdEPIVJJ3D6xA5+Qs8RncbI=;
        b=db0o2w2DHeNLGwJaVmfxYID2LEWw16+H0pgvsLuuUNcuK+rlWVOy1tF06nkX/DpP59
         THa8LY9GSOl6DaU1ZhUvd3u8az1tphgtHHBOaXTAsbTHAGhHayhAPGCdzFki7pl0f7+h
         iwkdMIEe3JU5DgyolSrhkllskek20eBBlThVKnq5LqI2LH64y2CEVFLaSoMori0dF61W
         1GgIdoiJn/pHA1EsWp5JVAWWSri+33xVXOEtf5AexB5J/D5uXXSlmsIxj7DRaNF6R5GC
         cucO6sg+92fFfnjgZCZ2mb7cbtiq8nUJ+gNQPYommOiBsFE5lt8OmgMlnBM+LK5mXmmI
         TEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692999; x=1781297799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIxeKA2d6OLuIfSBHegRQdEPIVJJ3D6xA5+Qs8RncbI=;
        b=BrSj1ocYf0rIKRcWH6b64tMMBamhV/mLNr1ufSMdqaWJAw5rXCXqPSoFyBIBk/PBk5
         RfV8QV36KVHlMF/Li5oL9gWeKs05G017a2wZaYwAMkZ8ummWUC6e2cUwYybfxLUPbKoX
         iRzruli5Hfr6SdhLAIYfER1bvYCVxLQ4TjjKw0tuYjQlpU/0A5LZeZjGSOXWKyqsbc2b
         r2L/SB/daLNjgX0K+0j+lkFqpnOC8LmD2IK/QxZXEiRSy4TjtQrl0oeeX5Vmlr+3GCYQ
         mIgErbJWVAoiA8GEkU7POUW0XKANyHQcS/Z8y68TIlmkspQJSCKmzQQuv0c7jSDMAutS
         h9fA==
X-Gm-Message-State: AOJu0YyGYvLZ1EWx0+Dskv3Y80SD/m3LrU7RFsPWtkZhiqlXZFTNaCv7
	kqvWITCz6lXvEJ2H8B6PCc+AUIMAwpu+fuA/5kSxyfhDmi5Cs5aC8RWD
X-Gm-Gg: Acq92OGPAsRXVr0jhWXn8bHXESot0yFfOPhZVcL1Dn3Zx/58qFcdbOpbehDJENgRnzx
	reTz9BYI4itEjdftDEm8fj1sOAXMGGn7MDa6QZivD3kWYcAg0ZJkA3UHilxdmhoJDaOyHM99gYI
	eNEas6s78ls65DmggVoeZa91TqbPMoR8vaIbPKQ7ndhMAamy6xTlmuzkUFQS4tZYRCofO1XaRHM
	65BorZCobLqcTvC9PJmUiXB51HgStfu5nrPFVhC8QyH4eZnVgiOfwcglGSF3qWFHguQF6X4bslW
	YJhNG2uZB78N9uRczfrlQVSkk0070Y4F/sMqqUn1U/T3XlJqNxEBG0aCmDjlNIWPS8IWF4QsY75
	fMyRTagrU8S1XKM+oUN9D9cUL66hlKkst9f/+LeOBMxX4Y9fkbKlK1Wsb1CcFc9Vh5V/0V3KRDZ
	OWz8cY0JMtrPuUV04DVSh73U8UByK5Vfs3hX4ynMUbGA==
X-Received: by 2002:a17:90b:53c7:b0:36b:9c6d:b60b with SMTP id 98e67ed59e1d1-370ebef967bmr2679800a91.0.1780692999211;
        Fri, 05 Jun 2026 13:56:39 -0700 (PDT)
Received: from [192.168.1.3] ([2401:4900:881c:baba:b3d5:d6d:608b:987f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb2607sm2197036a91.0.2026.06.05.13.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:56:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 06 Jun 2026 02:26:12 +0530
Subject: [PATCH 3/3] ARM: dts: omap: dra7: Use new property name
 ti,crossbar-irqs-reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-crossbar-v1-3-f67f7cb9ee50@gmail.com>
References: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
In-Reply-To: <20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780692975; l=982;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=TAlX/MBj9t38pJGd4AC8U0jUF1uArbeoK5p0c92YSSU=;
 b=xRBSV+NoD4DR5C5gkumtbkwnLNDvsIJyxmZUieht1Fedlt3KjTOz2Yo9d1RpZCU/aQ5yyTDZJ
 49SBeen4Ej+DqESpaPWR2BrOOohvXKTqLZGWhXVYNSZe4+wpy849Q4u
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Property name for irq-crossbar 'ti,irqs-reserved' is updated to
'ti,crossbar-irqs-reserved' by new binding conversion.

Update the crossbar node in dra7.dtsi to use the new property name.
since driver accepts both new and old name this is non-functional
change.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/dra7.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
index 711ce4c31bb1..80bee3db3a53 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -866,7 +866,7 @@ crossbar_mpu: crossbar@4a002a48 {
 			ti,max-irqs = <160>;
 			ti,max-crossbar-sources = <MAX_SOURCES>;
 			ti,reg-size = <2>;
-			ti,irqs-reserved = <0 1 2 3 5 6 131 132>;
+			ti,crossbar-irqs-reserved = <0 1 2 3 5 6 131 132>;
 			ti,irqs-skip = <10 133 139 140>;
 			ti,irqs-safe-map = <0>;
 		};

-- 
2.54.0

