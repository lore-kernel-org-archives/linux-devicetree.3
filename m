Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816485;
	b=D+CLB1Y1OhQ+QgCvt0+zlgLOg6zuLDOKbeyfE1KEcDtvjoXxZH1Q1Vao0TwsXtqJkLta
	 wc1LAD2JIb/OZMBuDHPt7YCUcSh2ycZnrrF92XGjeRlSBPDZUMgFZ+QWe0lDkbPVUDApu
	 dydQgOE46Bv82jLTDwbzGrcpJ8dmTax9sdX9jaLy/YU2g6S2tIKfDGlPiQYoB6Iuc+tPy
	 5sw+yCvoAwd4hfvD+WShx2cGRNz2sfW52wuaKIo+eT0/mVLr54S8y1gmoWBy6RGPl5BRX
	 lxJbMT0A3N0wFZOa7QtI4jOc+B+piHdzrI4JwuXdh0aryFIGSt51yNv8jAR5D4q8BvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Mky9j+WOnq3WliGY/AldJ7Jn18rgTtc7t2LkEe9tf5Y=;
	b=Zj64Xf16Usf1sYB2Wv4Ql72o7tBTWcDMjq81WKnc6xG7MJDlC1C0eWntuyKLhFgHFLqf
	 6x9WFTLQmYCtrLdcnYLkliX5mS8a6UOXf4ss0bnjyvxjH6iKS8wvl0M31FdPQcYKUOVAB
	 xN1jj62UCTYCf2c3F96qnXUpC5t6aL0t6Q5U3QayM5KYjNS5htZ2ZlFzbeaUZ0e9p+bbg
	 pZNAyCzF0yZqi1iP9YQVLBMcVFSjPmc8Dr61qxBu0Ci5AKrms4IqnRl+7l1uJkUCXF8jT
	 IGBWw6URBK8OOVhNAycbN1Oi7IELVO2pY2aFfYMiDRHl1JKtdYoE0Fkqqo/9oCx9ySA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=el7ZrjEl;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152A60A3808
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D152A60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=el7ZrjEl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so554929f8f.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816483; x=1794421283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mky9j+WOnq3WliGY/AldJ7Jn18rgTtc7t2LkEe9tf5Y=;
        b=el7ZrjElkjGEwbcTxvHJbqH+Z5l0fG1MWnuGf50FD/jKywrXSo/L9eO78LgbLa8l+H
         3/T2X05Y5sNOBDN3JakoeF9hmmn9JaguzMNoD7zt/hfAqDYdjOLXnA3fFWNJjxHCUW9j
         W7dobHmaZyxd43ulo69mZESUlQmXEX7YAUIkZPz5ZcaIxJnilWF5MHV/NPhZAN86U8Y1
         eMJRfZXerQecCDq8nQ4eqSaXWP4GCeVRhrurAyj8monLRW/CHUHRqIXmh6AC7dQfYeot
         EE2edhN3LiQadpPN4WyJY2573sF2XuRDDirnfVHyz0cw4aDnK+a4hv5g8UwYMQMGykgr
         tGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816483; x=1794421283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mky9j+WOnq3WliGY/AldJ7Jn18rgTtc7t2LkEe9tf5Y=;
        b=F7OE9tHZ0EaaBMu+eq8YuyxkT8J/XfTGplahWJmjHRaSHgdw/381V9IJPIg6HqwGbp
         SOfW8PfWhBrtqavAhhTXJNsa7QD0xjpq5QaPgwZ+SMZNw/EnWdFSIghhBdK8YDjfIl+Q
         3PfikNYmOSJkwv3w90w9fqJtAyvBZft7VDheKUbn1+QxIkZprNFxMnEVHRGJRqGOf3Ay
         PDpw/q2OWU6rs+dWLNqJJOpD2c8Ctm6griqamvXsdWlyEfXhXXl3Et+BbmjEql0B7o9c
         pt++0bEstCQ/1rKiHlYj4CF/I5UmhJQd5eIr9UBGpN2kAZKGbeCzPCepiVc9QuZGgLN+
         nbVA==
X-Forwarded-Encrypted: i=1; AKwUvByO4QQM90nyFa/JZCCt7zUptO4/S35zaq2tH8Drj5Mx111iwC6H0B0I8LapDeJwTD8q1gj6OlINQQR3@vger.kernel.org
X-Gm-Message-State: APuU4Z9v6ZYFDDzRTqtI4Vt1pmM6V/9BBo/TzdTGMmczeDiiHC2KeTRH
	3XCOXViDZH06had7jwPRB0chd5hz3T2fIGA0VlpiPdhnL3rop0tPdWqJ
X-Gm-Gg: AYBFou3O/Ovq4oDWxVY+sEbqu21JyCxx5U1dqQXsqF8tyxYp7aK1GsEL3CBAaem/clT
	CzwuPcm//2O/f0xsAMbAg/VVBIu7uCoK7n7hNhg5OjOfOz/2/g5n7lF6+JPc9OWEsjM00m7Soh6
	W07wL/O/ZXqOG9KYQ/EXIMzSuLVQOgmUDKr6d8i+WaICDaE6QlxQEHZfsk4yYy2U0DuwbOb1TVD
	qJOy5jdVNDueyaGtib8b76nwWYkU5lNJpRFDZX0SDulR55l7NGe0tQHofXPrZZkvLL5spXPzP4i
	BPqkJKD1RSWhfBXX6YDAPdPvg5IxjxmJy7G0dXDxKdv+DXtackk7jJ+ahp5xQuY1ByA8rZ6Q9Sk
	/9Plgy2B8NdpuNbAQ6Y6a6sM3bv4u/zYMZrVgEQU7+H39RB4QG1+YEURcemrd69MduEqEF+LAoH
	Bj4VkR1Slz+rY54rJOx/Wm+Ey6NLr2yehkwuD3O37OFrpWxThbi+polEA21h83kP+30xYTnrpKs
	r7mdZ779vz6m2XXNZwRXQlVqbqduJ/1kWFl/2lD3hjbCg+E6cgYaAPUmk6JAuv749u8Nyp8TRvT
	jr9NW4NuOeZuI1nndoH8hwbx/1pGzPtsgVoTQlg6BmtBobV4mcn8sHgwmmh+i6j7kzmTmMHk7Xk
	OZaXYfk9P+bBg4hYOxmOCSql356Yy99lEk83LgRIpadwB5o9DmJMQRFd8ZOE=
X-Received: by 2002:a05:6000:4a19:b0:488:8bc1:a2eb with SMTP id ffacd0b85a97d-48e6e308b00mr36775005f8f.39.1793816483116;
        Wed, 04 Nov 2026 10:21:23 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 12/14] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Wed,  4 Nov 2026 18:21:00 +0000
Message-ID: <20261104182105.1102555-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The ETHSW IP used in SoCs such as RZ/T2H and RZ/N2H has a hardware issue
where the internal mgmt_tag_vld signal is asserted as a level instead of
a single-cycle pulse. This causes the frame length counter on the
management (CPU) port to over-increment, so valid frames are falsely
detected as oversized and dropped.

The recommended workaround is to program the maximum frame length
register (FRM_LENGTH) of the management port with a fixed, large value.

Add a management_port_fixed_frame_len member to struct a5psw_of_data to
hold the SoC-specific value. When it is set, program A5PSW_FRM_LENGTH
for the CPU port with this value in a5psw_setup(), and skip updating
FRM_LENGTH for the CPU port in a5psw_port_change_mtu() so that MTU
changes do not override the workaround.

No functional change for existing SoCs, which leave the value unset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- Marked of_data as const pointer to avoid build warning

v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 18 +++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index f8fe6f3b8e12..f3eb8646dea5 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	const struct a5psw_of_data *of_data = a5psw->of_data;
+
+	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
+		return 0;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
+
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
 
 	return 0;
@@ -990,8 +995,19 @@ static int a5psw_setup(struct dsa_switch *ds)
 		if (dsa_port_is_unused(dp))
 			continue;
 
-		/* Enable egress flooding and learning for CPU port */
 		if (dsa_port_is_cpu(dp)) {
+			/*
+			 * Workaround for ETHSW IP issue, mgmt_tag_vld is asserted as a level
+			 * instead of a single-cycle pulse, causing the frame length counter
+			 * to over-increment and trigger false oversize frame drops.
+			 * The recommended workaround is to set the maximum frame
+			 * length on the management port.
+			 */
+			if (a5psw->of_data->management_port_fixed_frame_len)
+				a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port),
+						 a5psw->of_data->management_port_fixed_frame_len);
+
+			/* Enable egress flooding and learning for CPU port */
 			a5psw_flooding_set_resolution(a5psw, port, true);
 			a5psw_port_learning_set(a5psw, port, true);
 		}
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index e952afd95dca..5bec33b23079 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -237,12 +237,15 @@ union lk_data {
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
  * @tag_proto: DSA tag protocol used by the switch
+ * @management_port_fixed_frame_len: Fixed frame length for the management
+ *   port to account for the HW issue.
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
+	unsigned int management_port_fixed_frame_len;
 };
 
 /**
-- 
2.56.0

