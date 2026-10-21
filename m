Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571533;
	b=B2VO5IKqxnknD9GHMmdxvZwAkCltnSkHzCGg6oGIf2o4GKWgSo3Jmc4s//ceIwbqXZLM
	 Um++6F+e3BrZ4EsnxnIXAhkMF5rHrosssqnnAZdqj0tip8LvK7NW1xSa3glkgl9/K87jm
	 g0oIDyTH/5W72tcQUmA7ICHp3b6K0K58M0Z4LaXEtrx7UiQ+Godqj78dDwKW3tXSS+aTF
	 Lo+Ee7xkKsbuTZsQryxcQtWKPWg6jfoyY3rkbbDnoTcN+ukYyVbHVmCKUQ/Z93qpC1Dz/
	 Z/NC/qUbrfSnih+m8xewKohYKMBCLoZVeo1QWefTm/bSADb2TQ03oH7cWSvOkz69jbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
	b=Gve+vVLLX/Ys6Rm/J8llIdB6lALqFBOhSr3nU5IFUCGEMv0196C5uhyGIyTNem+NCr0L
	 T3FayN3/WM/C3gnOTVjo3FlGDz/eHVXLJBX+vC2p/8YzWqDLRksMZGZYJ7osyuaQtCCAB
	 FyH6SRl40+qjElfJYFbjTJPXDWfoGTWoyjorW7CwQtqm6iQsXovSEhbEvDDufSPccd5Jz
	 8EvFwcmluCYlkWdkwHJD45elq1hQk/VhAfHcswCRXoDGsHtX5z3fpT6B/xZpt4/ii2itH
	 Nw6Qv8HOKri0/2TnHOfqBurnHlxBSQbBX+TqZUjKrJVe40Mge2m+fM8Fk4wtTMOW0bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD83606A329
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD83606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so4653055e9.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571531; x=1793176331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=WGFF3bMtm3L2MCSgwqcPw1tNav2ZALn+Bngjm7GzzU4hX4q4RFGq5Gh3EsljyRJhJa
         gtEWV6CgGhtpoiTgz9qTowDGguEKIa+2tayYDkpS90FzRRrZSJvCOFEudeBClvsy5lt7
         2JB/aFBbGlRaPK8x9nVwMz2H238wFAY7uPHdHELygn2b/dTFpTIKWA3fLZowaUi++RKg
         XCulAINhyz2YcU+IGGuldgjZ7HjlEqrRuiLpptIGFApm4NrWr7E4iB9wgmoAEvEMnN7w
         L59y/D3AOS+o54FnC0I8vh1c8PN4ebggO1cczYXpMOM94PAS/h6vBk1gXPImOb/2+5Tq
         d0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571531; x=1793176331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=diMbazvLDW9UzTW8FHZJyX/6K0sptiDNoNAglkZO+FfAjEEgjdkDySxL76bAtDKyid
         egT+xv3YJysRNKsRdpo8Qfvc3smF6HVmXoeFG4KzWCkNWcIB9MzH5bew+nNjpUKkl5lQ
         +PXBsEEHcn7PkAAR+A32KBtEHd+cqIJQLijmTUtqYR/PVc3+vMT/PJuxsLT0iUYoUrW0
         PXnlAKSAPf0D54f62sn5UY2HAhVify/PCiXey/npULeh8y3m8q/cq9jcW+JHD8ZTSzgC
         mPzd1meMo4zStVgq4w/MG/RMECVv/rWsg2uKtSbRiVVrBn1Z9XvWv3L1Z995GqsVmM2r
         3mRQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+U4WAbzV5j3Kr+Ex7k12/O832b7TVjg66KZTC5zlZ0w2WVDii+mOT0kiRDrWHuY57oLhoXNgB2UKX@vger.kernel.org
X-Gm-Message-State: AFq9FYLVLxuD9vim0kccjpWhDaQ2+PzDg9mjw50eP8Z0AJ7uWiJE1o3j
	coLbjgHB5o1M6zKS21A0Zte4Zn+8ytGNbDddTTQKDMzcwjDwMjeyN89m
X-Gm-Gg: AYBFou2APnnFv12UsWiUaep91nKZZtuTX5Q8NE6U5qcg04xYhAksfcSxdL2Rbp7BwMI
	eqlQtKK/I/V+vFGY7rGRHVh75ZDWZLdpFV0SXrCVmvyAvCokmZEdJbB6B9bVSUysOkILil6FDMk
	gLXnXXAOuZWDfiCcegWnO/evHH8ZHsfCRfAYRcF2QOgKuUr5D+WXHdSRFwTKpwo55xkgbO+z0WO
	jxcgHqU6fqbTA8ufb+Ivx475kXtDLgVrIxLKtOegLmLAfKRvcAb2ZKN+Y8fU8LoP2z1pWj0jaXF
	HmjuFrNbQJ8DF3Pzz5le/Ndcyu2eFnPfyWmyzlHaq80ocq4IPSEKmVpRrpzgB9/T/ackyzUCn8E
	hfXbf7MWVYwzvmvHvXGG80w8S7Tkhj9fASENqfPNCeJNNQRr06BCb1gtFqUuLEH43N8UXpcXBrp
	dGJWdsqG7uXZbDo5ApJMsy+YuVboxyYMxQC0qvtbEL0oZsO0olSXyFAlVcg+0OthuNBH+c0a1bz
	0DwwYpdGqg3BsYagNMioFMSYYuDKUfB2KEWyg1Z39uQWRIMuvqON4SIRsWzha+D9notrwMxlFwU
	60RjFZWgxrkwcQB4Y755o3+hLV4tQF8BsrHjfqFHcIHW
X-Received: by 2002:a05:600c:a08:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a201cc6bf3mr744085e9.35.1792571530863;
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Date: Wed, 21 Oct 2026 09:32:01 +0100
Subject: [PATCH v6 1/4] dt-bindings: can: renesas,rcar-canfd: Simplify
 renesas,no-can-fd description
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
Message-Id: <20261021-canfd_rzg3l-v6-1-b4abfdba8e70@bp.renesas.com>
References: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
In-Reply-To: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=1656;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=bfMkHO6jG7ziyusENgghR+SzKGm1uT2oifSo7PJ+O9Y=;
 b=DR8TBLyVCK+H8wHymBT4C1B4+LTr7fsl5n2fceAH5tJAmlGsaw+sKf91GRt2XbvtV/5/OMa3H
 W80PWXcyrgPDfy2c1Dpe52/N9O1lj5l+Dm3X1ujbTjxfStsZMFqRQyp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

The description of renesas,no-can-fd lists the operating modes
(CAN-FD, FD-Only and Classical CAN) and which SoCs support each one.
This is not accurate for every supported SoC, for example RZ/G3S, whose
CAN-FD controller has no Classical CAN mode.

Drop the mode list and keep only the statement of what the property
does, so the description no longer implies that all SoCs can operate in
Classical CAN mode.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated commit header and description
 * Simplified renesas,no-can-fd description by removing the mode list and
   keep only the statement of what the property does.
v5:
 * New patch.
---
 Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 1a7a9ce45e97..81674ea4bef4 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -145,9 +145,7 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN-FD mode (default) or FD-Only
-      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
-      property to put the controller in Classical CAN mode.
+      Specify this property to put the controller in Classical CAN mode.
 
   renesas,fd-only:
     $ref: /schemas/types.yaml#/definitions/flag

-- 
2.43.0

