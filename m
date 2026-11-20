Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=070/vQYWakv2Bud8O9iEPQqTVXdNGC82I0cmXSK4XHJHsUaRAk8nV3AE2WyPaQ6e60jj
	 o8P/E9TuQ6QWcarwVy5ou22S950MIUDDZT8+IqoADYek6MafVGPKMhPGNdT1hSRILVNiC
	 4SeutaNPjQoLopOWged8USxtRcT2YY1XCyHNfMzxw4SOAdXItk/FAAwHyBfZW0uxcAi4P
	 zKSzh9QR5fs1h2WfoABzutT/qRiAx13DcnpXTD5y9HVT12iUT/F1LIjFlRtoYXotOeqte
	 1gpzE6Rp157u2BkxSS2tn9+uVCaJ+bnSuYdLX52VS0cBeqjZyhqA0LchSMjvWAtDN5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
	b=TRhOrUvum3ndXdJkDIkDOytbI6BPci55Vl/TLAQAxoIMDFp/uJbcEK0CL5IGOKaafbdI
	 jvyKN/pNA6nA4M6IgsEA0aXl3MYhXaRptnNYuy3ILLPxyDrtRsGYaGWw0z3kiaRkT3kGE
	 TC3EwheSR20vJMAp+hLWEHcM6qq6XKeVVYrOHqVQzkYGBIMCw23gwsrrmE48nxlzKK4Nl
	 RNtZNMt1AhLE3tdwQSs35K47l32rPOydoWd2YbWHbNIUkoEVxiQKo454BNc8EXVgJL2jQ
	 aZ4i7D4YH1/5SM8cYcfN3JlBmMIojH8I/EcPbtpTYwIglJPQfaodUccIDuD5x1nXMFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8792B60A3815
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8792B60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a9be758734so178930f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134362; x=1795739162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=v9MqcPLtxE53SbjN64oHKP9t3rCkg88Zes1tVNDU+ofhyrQCe7iAjOqyGgwoAVAPyB
         74RlAfCImWW4u3EDJgGcEgjAiFs4MrtoR0odM43Nci/Lq5HaIRvqBDlFNbttHaKnzku9
         bvgg/zluqtZ5RKvErgFdFnt6f7vI5DzRhSamnmWF9enY8PTOkPLVNn1Uk327j3Gv0Dvz
         Uc0gpHcmKZClPKqOMRZ8DNI5DhyyGBcDwGGNYxRYkffFwL1VudZ5IVkNevBJEBNTP71U
         u+AVVz3mizW1JfQOmIXe3NZ5ttsOXZB8x9NJVYpIUYbvDBz4BCj1YyYuoJHrAxE/ZTJ8
         5/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134362; x=1795739162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=kdc3LrT3jb7yD+w3GS8Lj5gE+guZY/qpDCviCtA5JGPZBTXS89Xs2j18wKYxK3Rs5i
         ED8ALIAsgQPOOzZRalfQOZl2RNgdAqO5sVVPwj0Gqlni4xFre1W79TxtBBJp7M5+G+SZ
         TJ62cYHFcrpSr/U1uiaAevbpXCmg2gLwowDVp6FfYQVp2ZmHxdVDUyiE96TDPQpf2kBk
         eUyu9YZskuo5vI1Y0W7F3odDJOTIWytEqrHi0iboOGO502mcSU2VFxLAZmgf9tTSmRwn
         x2J2zZcB78OZ2kELiiUI8IW5ZtxMSbQ7mFmeMyroX2D+GbTaoUjdQLXNndkFeSnWLyyM
         KqYw==
X-Forwarded-Encrypted: i=1; AL+hErFlBYei22jQ38Ws/3CWWxImu7jP+jVfsQNg6lW/tZTQ+98lqbzgjJVfeaYKI9g+CEIv7Tpd20RnsLM4@vger.kernel.org
X-Gm-Message-State: APuU4Z8JbL4zdvVy+C61VeULzxWDMaUBptns/d6pUOVLRjCJt41Ta8s/
	4xjSDQGZ5qhH96sd/fpVbYeiODyH9Fmz8iMWBnGiiKEofUDr0Oet5ugW
X-Gm-Gg: AZFdTZdmIrR5aG6QqEuPfGQwFH4517CUSAQKGFmE1GYVLUKmLnLasjv8qMxK9Ri0hTZ
	YwakbV8SwZxHG2zVCUtbktIF6sebcC1gqzXJFaHRZms36fG9yL5m/sL3aCROG6LdTnVxahFb3uI
	1bQGVAvlgVdNI46iTyrprPZWIsvrk3FzvuMVNkUDOpVm5WoNBkrPQZbRooWDsH3owuHf7W2s+oI
	WgLkzFqQWho5z+j1rOI5qRUwJJpSAjHPSKgx+XXDa7e2h/npI3aVmsLX7zdOhO2qL7nBZybj1CJ
	YpvgKBeNttG1gDGVFm/sJpFUrZsbEdOzWXXKhbuYK30I7okb+b88cbKjACtEtxZe0/0MgUMs/s6
	PHQRl7EGE0BHSkzKszBokkIYGsXksKBODqwG9/KLEWLNMuMo8dcgArA3XvPA3mfRswd8D4iIP0S
	mQb3hBBBSUEQDg5XXauyEHsryGicXfpm/bAx3VdToy9jNg3v5xgcIBgi2mjVOSk1D2tSsYAA+9e
	WnPF5ZiCQNFnFqG42nqtZQdKDQ3gm9a1n8O/PqnTP63vZi2WywvOQPftshAwoMAxqda8tDdHOQV
	u+vQ1vnRqL4WQ5/cNXZDLnotlXT3M/IHWTxywBlff3YplwsThre6oex6V/VQ71y1txk/I2empz4
	S7NP+4PT9aQ5Q31Ovtkkog60Rv2xinrsIEHpRLdSHIQ17xukoINdnnk2gmOQR+oIq7AFWcig6
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr1921927f8f.9.1795134361869;
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
Date: Fri, 20 Nov 2026 00:25:18 +0000
Message-ID: <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
and deleting one writes "set LEARNCOUNT to 2", instead of atomically
incrementing/decrementing the counter.

Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
correct bit field.

Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 13c46cf2c420..7fd2652813ac 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -5,6 +5,7 @@
  * Clément Léger <clement.leger@bootlin.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
@@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds, int port,
 		goto lk_unlock;
 
 	if (inc_learncount) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_INC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_INC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds, int port,
 
 	/* Decrement LEARNCOUNT */
 	if (clear) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_DEC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_DEC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
 	}
 
 	/* Reset learn count to 0 */
-	reg = A5PSW_LK_LEARNCOUNT_MODE_SET;
+	reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+			 A5PSW_LK_LEARNCOUNT_MODE_SET);
 	a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 
 	/* Clear VLAN resource table */
-- 
2.56.1

