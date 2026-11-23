Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445264;
	b=lNrTHCciNSbtj064vyaM+GOZRBaNb2YuRWq0ipzom3g8IdVpkC5zlP8z/gTVifFA+BAV
	 dBKM580e9NlSWlPUeHNlBquMi4jQjOi+7lJO7tjHbo77cOGngG0HkepV1erds8g62P5KT
	 lJKxXSrDOG10qqWdyhbagbQSPNxfqcpJWnJI059dWE3ex6fcQU8oUOR5CNv8uAUAJTss6
	 t/LCNi+50ucMgZ4MG/+C5laeNDucDoO0Ic3dxqhB4OPu3lTX5X36zTAEQ3V3uT3nbkLqP
	 yA6zyGusYLhKPJU3tLOfMqGl4o5BWmNYG2MEJ8POE2g/VoyfmWM84XZtX02vIKO+t5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445264;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=YNuqURf3LBV5JoL4B0KXnskJ6e13mRKwQlIW6jMmmoEENl/7pMYAh0fCjgotJWyvLk3A
	 nSxEjEjxZPGwMRM00s7ToIMW7fC7RmrVTBPdFgjdoargkRZvbx9v8ooIJN3U0uers10ke
	 asiwV8rzgVQpO+cBqrdMU7usH5KTXbK+kxMCKDUlcxZbRV9bO3a/Qlo3b6y/gQzwyhw1S
	 EOyWWyUmEP+kv5Dab0pjMEQWAC9vKihSyTbdG5/WchV0DfQKteEjnifaKIpgPA/kRFn4Q
	 +X5G72feFlTl5TyYOSwkm5wZlZ3IX1NnJicpwp/UwbPLKCV1f/HHZxzd9/ZUzkAVhqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beluUJgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24334606A32A;
	Mon, 23 Nov 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=beluUJgU
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795445263;
	b=LBywtNLS2c+dsR/P8hVhC/z4ZLbvSorsopXIaSA5JGv/AGs8IzfX0rvI0FaE0hTOxPb/
	 aDY56CpvdKhpBE4I/Vv1sT+4WkMYteFPLVnS5f9es7YjwiavIKmDFeUYyjLwtSZzLwb8/
	 SNIdWeRtQgGjwjj6jrT3Ey9hQMB/76T/vBIFInTt8EJMLW6vWYApaixhW5JACUjZOcLO8
	 z1HcKVyTSDPE2L3btjnEuLxvT3M8zaqJrE9pRGoWatwNdQJfhwjrKj8+rcVRONl0JXwLL
	 Qn+F+beSvHTZQiuMJIegJH70n/r00XVo6xov19nBdBrN3NJjZzanwYTiobVOxVOOwlA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795445263;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=ILq4Uj4kWHaDN5ZuikePFt/yD0mA9Fzfa+8MwcczdNxKbS2gI12CEkCSwulR54+2wx4+
	 rCZ+hkFHHgQJDpUz7eQDT/3ayhBRhO3iuHdo41oumNgQWuScVq3ntegepaWmfPJ4upSO7
	 6pf9eVvOBDFXEMM4fIbdMCgFaxBWXzh/dnxbrBWsdpLazryI/9lDt4WXJijf4S0PF9Azy
	 vRfJ8fmz/SeQMjc7YG4Ng6Qw1yfY8051sY+oER9vrBAHoAqcLKKgcvBUGlw44PFWvM1t3
	 U7gXGEBlj89XPCJyymiDJpR5QfspIcH9G9JcrXDlwPm/dCCRVHn354DBUC/cXoikv4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 924511F00A19;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795445263;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=beluUJgUZr7cuzIz6a+RLyXcc/pCItNueqUmRFjJeaBGmtUd3UGfZO+9wzSBzn0yg
	 i2D3dIlJyvaajcaz5hLHe8pUTAFi3Rb8u/nYOQSktX2DnZiscMqq/h+B/0AyXrXCi1
	 q3vle9mAkrUqyE81DTSuYur1MX/o12UDLlf65ySaolN4eor4PmcsYDpWZsNID0D/P7
	 sQWEO/VPznaUVLQF780UAtICu+ZqoAMvj0vksKQAdHn0xcWL1k9k/MNJWidAzI/sER
	 u+MtR2MNRJaRLs3VI5Db+aqu7MVmdUySgnSwjfNAPyZd/SmiM9NI0RgXl9pzkFXY+a
	 14JZfw7qHd+AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1A2E74C4EE;
	Mon, 23 Nov 2026 14:47:24 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 23 Nov 2026 15:46:56 +0100
Subject: [PATCH v4 1/8] dt-bindings: riscv: cpus: add mips,p8700
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
Message-Id: <20261123-p8700-dts-v4-1-60bb7bf8a7a1@htecgroup.com>
References: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
In-Reply-To: <20261123-p8700-dts-v4-0-60bb7bf8a7a1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795445243; l=841;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=lv7fN/1sfes4OW73tQF/sEOIFoYV8Fh2hXDbsngJw9E=;
 b=7m5bAOpwqYkpt80MXV55MvSifM+b3kzld3tR8d0XpVoesAhdVu9LhDKC8cIKyVqwnwC1MLZ7V
 wUo05RzAz9eBAZA57ms645+N+Efl9+A5V7bTJRJIdJ4oAdsqnbjGRTv
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..3e7016687fb67c53856310f97f4ba587ba6b89e0 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - mips,p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0


