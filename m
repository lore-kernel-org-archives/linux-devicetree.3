Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166175;
	b=4xvMMJAjtvHz/HN0YDZE/rUmNNoPUfLtt06QwOPyHzLer6xMcsm1YdK+82bKx99BoX8n
	 PKU/UyX18aXljNvlXQ/ciHAgBMvRN3IjJeDop66WRV5kA2/O04JcRePQ39IsIdVqHaMdY
	 j/yYyz43PIEMNQ6A0iY+vLm/U7cchgQKnHVRXncBOMKYPw7ybHkZLnvM0CE+d9R3glyeP
	 XjlaHtimerULBGos8aZRPGLMBNingM8eoOjp0694HScnBJTeDrfvlAx4GZSECBcWm9wd4
	 wQQyCmt/tooE3fEgd16oKf5HBndYRdpKEAYLLHrExT9IuuLlypF3ygefGHu7ZcnZraA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
	b=JwFi/J2Q/oChQu3J/fq8cG2/BTpRrUT6Uw0nZWQlmM+3iTN9gVXNsiXihCGexCQOP41e
	 Qw5aBbQM4iVcvlFjZkPZ/K9YQEaVT0nyyXzAHZG7hLscVvN01vMqugZDZpxJnzgbvV3Hq
	 9V8iVjdT0ZkhyrB/rkypcOIkm/FGIZGWP4e2tUX08g8bntocVs6y5IPhes+ZZQL386T2z
	 CPfp4yDhHGrQWrT4ZvREy+trcjak3F0WN64oqXCBzjOTq5tddiBWcdaIUL0bNEyfPXUMA
	 oRiUKGZNACXiKCbGKiuTD8EipPjrBP5iDRrab++++NTztbJxf1wc0FqNOnPsz0zpvQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tsk8jaZ/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216D606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 19:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3216D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tsk8jaZ/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36d499f6ab6so22552eec.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 11:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794166173; x=1794770973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
        b=Tsk8jaZ/bDWD3tcVK3SnIRa473lFlDV8MexVW1PeG+5grPrB7fFhGSj8MYSpDBzSKN
         g+6qnR2BMrMsIaNo8FGnuzAiIB5lpqZKeimcpdkzNNGfkosOFJOgZPUhmboKBxJ3bGfi
         nY8gxc+NNLPWrpb4lbsRoOaFlKbuf+iCcyGn7tX5DIY7luv9lKf8d5HNEkuEg7IC8g1j
         Ff2vK4EnPxAfTLLLuLEol+52cf1jw5Dbs+eiP52v2sb5ORIKiFANUiwNvU3xKnmCfipa
         MlCEdGK8yFe9Bq8Bef3Ml8Fs8HDASbdzfLKKGlrKXS7oBZW8KE/wpn5xuBsEuBgFZ9UC
         ptUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166173; x=1794770973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAjTCjU59PATyZ/IPC1r20+cOIDCc27FKXqTgrZ3hjI=;
        b=LmIcflJqtGiEBvSUdLkn4qggOikvTKEtoltVndcUWtVqJLSEHbdYzU7v8SkDHEcNZn
         mT4q8qsoJohtFBS7MACD1qkz6DcFBIyAec+FPmBzJz91EcZEiaEMNV+65cFYAS7uZJUq
         LUnfdFTPpPlwYUCgTReCJ6kdYPSBhFTdu1ApkFNDkzuQJIKejc1LRHyPWSbg3IdRrzji
         AR+R7JjM5C5fX7ZPrzveLQCd7orDAxcxkTVV9DFcdWQG0D5uHHbs2BblyMP1YJVBVcLR
         liAfuKUkyBFM4+yihfVB8+p8ylXaFqWCg1bxokTVxl8vT+m91Q4RgqS7d/2+WxZMnAvH
         pFAA==
X-Gm-Message-State: APuU4Z8YHEo24S3fQq+8u52HoW27ZsqX+bK9AIYenPoGr0+7cwbsYcfH
	zZS4PsS9/HiywXj47OTArkq7mnvMoL7blriihRY5MaxXutSyPJRjgBf+
X-Gm-Gg: AYBFou1ACVA4T4eZ0Z1iyDt8IPtwu9bEWrVYkkFpORE1os6xw6qoUtactrcMsMufQRj
	NEN3otTyrLzly8qkS6RjKLeZ2uAmZyE+EeZRP2eZ8rdn61Ufo4m5AYWuIwsw7GPl4bsIst+iirB
	29i0QreTu10EcgHmsIFMCtz+8nKnJKduk8iuJW2aTLT5WhQli1twhn6mvOF40NrsUUFVFT0A68R
	FvdrvNFFq7Pf+55GvxN7B/sywho9yJiGgeHO+fX7cIt4ENrkGekyAj5VI+HFnewTsURCkN0ViAI
	1o5rp5tMfEP+AA6EEtVj9YrDzw0qhZq836WCJ3WKBc2Y2D1X5zx4J65UpAp/dyeGosxCyZUAV07
	y7MVwrdTb2xKlEHuqlWEgyoqGzI1H9wleQJFBpt7IjcRlbrKUsgbAvjQO7fhW6T6/Dznpj9mwVl
	jJ9usuXMcxaGQFMSnnynH2UTkwFLHljCx2Mo/Z+p2rj3XjwWn3G9Z4mxfm+nhx1rMhgGE/7DuuA
	Tole3fofZNWLVXKAopX4ulRR8WD/mm+/AApfR9ccgysgczlc654c02Kjjj2eMe3lhvZ76CBqxb4
	6Lw3GzpaGYjtOmVc3o3EYNzhKJlIY7aGSHhDw1YgzqlALV+NNaV1PFrsjLHD2A==
X-Received: by 2002:a05:701b:4552:10b0:143:5c2a:e45f with SMTP id a92af1059eb24-1b39fdaf96bmr5061989c88.0.1794166173146;
        Sun, 08 Nov 2026 11:29:33 -0800 (PST)
Received: from [192.168.1.11] ([2401:4900:881e:93af:b6d8:a723:b13b:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm8800387c88.4.2026.11.08.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:29:32 -0800 (PST)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: arm: omap-l3-noc: Convert to DT schema
Date: Mon, 09 Nov 2026 00:59:16 +0530
Message-Id: <20261109-ti-l3-noc-v2-0-509e8485a1f3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBAAv0L27BraRgOe/IfhULYLrAFqWmw0h
 L8LGBOPk0xmZogchCNcshkCJ4nixxX0IQPq7NgyilsZdK7PKs81ToK9wdET6sI1ZAvVODrB6j8
 CN/LaW7fqy/FZ35mmLbAZncTJh/c+S2rzfl3z100KFZa1UwVZMobLaztY6Y/kB6iWZfkAlTM+G
 LQAAAA=
X-Change-ID: 20261002-ti-l3-noc-28dfca81fdc5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Santosh Shilimkar <santosh.shilimkar@ti.com>, 
 Sricharan R <r.sricharan@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, linux-omap@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794166167; l=1249;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=K6eNGCEmoAmi4nk9SdcQuMxZbbIDLpxuaZ3Z3g7Mvjc=;
 b=k6VrIzg4IlUrfH0wtgd/Rbtm22qUDGqnR/FcbVb/nmGOY8v7B4sz+3m8fvb+DOOVQBjDyilxI
 VImtW87SNqrDkaNLRnIRJMO95m7fWCC+bV6iok1BX5rAw98GeBM6tsR
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This series converts the TI OMAP L3 NoC binding from text to DT schema.

On OMAP3 the ti,omap3-l3-smx node is deliberately modelled as a flat
simple-bus for the whole SoC,so  schema allows child nodes for that
compatible only. The NoC variants AM437x have no child nodes.

Patch 1 is a DTS change and patch 2 is the binding change. Patch 2
depends on patch 1 only to avoid a dtbs_check warning on omap36xx
boards.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Move binding to bindings/bus/
- Rebase to latest mainline rc
- Add unit address to regulator-abb-mpu node
- Link to v1: https://lore.kernel.org/r/20261003-ti-l3-noc-v1-1-9bd18cac33e9@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: omap36xx: Add unit address to ABB regulator node
      dt-bindings: arm: omap-l3-noc: Convert to DT schema

 .../devicetree/bindings/arm/omap/l3-noc.txt        |  23 ----
 .../devicetree/bindings/bus/ti,omap-l3-noc.yaml    | 153 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap36xx.dtsi            |   2 +-
 3 files changed, 154 insertions(+), 24 deletions(-)
---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261002-ti-l3-noc-28dfca81fdc5

Best regards,
-- 
Bhargav

