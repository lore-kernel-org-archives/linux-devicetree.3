Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB62A3909BF
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869431; cv=none; b=d3CEP49bQMkiguTVYVwLCHkx+NZGSMmaSClF3no+/UsQlrYH5Lr1M7da2Dj/oxMEEzLG5m39jbJAQMuT46t2MvR25dfxPjBJl5OsP2+qBRB4U9IS0TApLFRi/Df8sfCiHanjIRVt5zyaT8gRzR3IRqTkNiyLIUXe8OXowgQzGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869431; c=relaxed/simple;
	bh=CL6NT9NPb+SE4cewyKhPXsPbOqTK7Ga2km5UdId3qwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fA17gQCQAtUa2UCyIeFJCQDwRWWwF4B9StzQJb6geuU1jkWnbbrYEcgyDcFXovcNIUtD5u0bapH1idsTX7eGvp8KB0PiHCVCamJUzoxQJQ+uSHINn/J9+VYwIn40okVxrbmbdO367Sn7vApRfcyphhcm7W+47KE2a2qDpQLY6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPrEJPCL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPrEJPCL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so50778505e9.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869424; x=1791474224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuSJTIGS2kydrO7lTUFOMV5TPnPEsP1/p4j5H58s+oo=;
        b=kPrEJPCLSPTzUlEJ25kBXfw+3P8qSq4B+Abl4LKFvTb1nPp4R33uAObgErRRxCVp68
         m7e05kV8qdNYREkM8mMEXE084t3lNEdlHmRhQjlynpP4IaAz4V0kw8tFSQgX0zCVZLKy
         jV4yR3Zkzqb4SNWwqDxsHE2DHInGK6Un/R72XvNYm9dJ8RsPjzutEkR0Rp74iTegl4BY
         C5A446G5oiSn55hb0sh1f1LeiYEnVLpU666hAxSjbSvTW4LviIILQcAF6jHzi/FQhqxr
         BwxWu6hH/I5f3tertkioSHjbipUVCntLP6gJBGF7nOeS6FOoR6KIutmYUFv3B5Im07Ht
         edkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869424; x=1791474224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuSJTIGS2kydrO7lTUFOMV5TPnPEsP1/p4j5H58s+oo=;
        b=hK17DpGcQU9YStCjlznGnm/lJebqhuuKgVeJonVIExF+7zAsIVCukYyzZGlv2M84eK
         ZnWelf4krijde3gbYI0pVya58irYum2nSLgtHs39rJXH/UlAmuS3Ab0Zw2xqy4v+u/wP
         YjUGsp7oKMJ0sft9gviUPrBOd0L4WksE9YL5ctt0fWh5cq9nPHVz9Os75kRAlo6c1No1
         Ik8oSdq8G0cXKKX2jSwT9So0klyhVQqhSqNVrHMFOwwjkKvs0oB03kO208et4P9x68gL
         Q+TgE/wscmiqPpTynvAVMiZdvpqvB+xsJGfbCieF/3aGXF9zfQlDq+qUa/otEHTEfSHj
         kKnA==
X-Forwarded-Encrypted: i=1; AKwUvBzKjNL04BibAlHbRZ9ZGhvZ1EKOpGVRw3ykob7+NAtUHXH4ABEFpm7jMN9cvfRMSvnMsGKm4tKZlhyS@vger.kernel.org
X-Gm-Message-State: AFuF++lzjCR0DGdbg0ehfjGc35PovVVjJwLPY7GnmCktc3Pf5u7fZzgx
	XgJRYB9aj4nStHKeGqYcQAR2EkEk7+qIX/qlNx1RBFmZuG6rR8Yz54E6
X-Gm-Gg: AYBFou3zj0ac1HDqOVPHY2r+QNDWDruoEIbLCxhRC+PHgez4Gq5qi2R7lvv0U6dHQCT
	2pDPDj9X5cRFYjKnQbgO9gGDkYiuvJzoxbVb8Wr6JAW6L7h3INkkUodCU39MOnMuLaUSlWB8BxT
	bLEIH3TwDkUabKY5D3bd1PAC4qpA4zBB0115dvWNJNehe6XPKipde2KWK0PsEWJ6upWNIiYp1C7
	8YttGeglthlqOdIfRhZ5B32OdMbCAElwgmJT1nzSYRYxDYAGhSClXJSlfw9jCAHYG60JUJGeI0j
	Mas/Az+9rbQPW0iRlSSGa78yUCBzDky/Jbr2JW38sVGCzWLbGNy89JqdsUK4Mqrx9smjIkCTeNF
	qTEFFBYM7AA5oOMzcInr4sXxGLRAEYUby1w2RZjXY3+XPLzvi/3Spvt7N5PWmXMjKkThxpxr8mq
	Mz6NDbq+kNIM/oU7oEjt2QnAcVGPfPQpRmhzTcRaTaurmxYXZrljDdXt/SlRySB2X7AMf8E+awf
	b2BEBAMALhI6a5K0MTjzOwHKVf/oPP/VYI2+ocpahQwulTIYpfcieEvNz0eyPGOlg1YzUkW/vab
	KmcNxGtF
X-Received: by 2002:a05:600c:1909:b0:4a0:1e9f:6516 with SMTP id 5b1f17b1804b1-4a02751b008mr763815e9.1.1790869424097;
        Thu, 01 Oct 2026 08:43:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH net-next v2 10/12] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Thu,  1 Oct 2026 16:43:23 +0100
Message-ID: <20261001154326.754314-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 18 +++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 0b0b4055e615..ce931442d49f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -209,8 +209,13 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	struct a5psw_of_data *of_data = a5psw->of_data;
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
2.55.0

