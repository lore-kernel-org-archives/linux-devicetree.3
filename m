Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134371;
	b=YkvP1KV1vGoQ6I/wsaU/A0ZJZBtV4hcChFICuiIVSWKetJZo1E2RzxL1Tt5VjXXa2bdP
	 mok6drQzB/oQh5Wo+Rd4TtMx3PEkJ6BpG8yEEDlG5JjHkh8zm8l0ENO5dm8GDEfC/PAbx
	 CEBbrKp9LgJAHH6O1oDrRTpAuXqHfJ/cwlRaO11+kYJYR/KaQFIJAd/e0Z+XptMtA9Bpv
	 fvdlqBhVT2aXm+bPpR1JyZbCCPY9taBCAXYuVPqXy5mMkPAAhTFqSQes7G5VRkYItlbmE
	 FPASQFhsMligL/0YRR/8p3fu7R87Bgk5ipC2C4lXg+IS0ypoQFMw0iVkbAQHsDy9CzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
	b=Xc0GewZQf38uGQTO8hqzVdeN8CEIW8RydBiu/xAz7SIdoBnyO+bVWbYKFHMpsM4nqqN6
	 UkJht7RuIw/YjyBF0ohgHb0ivllqEQqA9+uH0ndf53buMuJ/nj001oarSfDCS44JBJau3
	 7J74pVbVOE7a0F5tSQO6/liiwp7UqYwOvQiRtoaNZK65508Ph65q+4AAK7LA0pqaR1MEy
	 ZjAFTXW4NJPZ00VXDxejaOzFGDRD2wwkrz7it4D06eftlk6YIB1mQTYGA1vFaNuTv4Ulf
	 fUef0YnYYR27nBZGy+QQT06BNgw9OJQWY+E6O05fdTcgwyJYYuaT/TaC1FqNdRZAZNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHzM07bY;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C48760A3801
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C48760A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHzM07bY
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so258896f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134369; x=1795739169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
        b=pHzM07bYYYGn5CeLneZvIOorVvK6Rf9k0bjdAQ6X0SbjIKd5irJym8phnYbYlxyWMM
         xV/FnriaQxuGZONNnClFSdnkZN+T7FBpYHnS9Zn/Uwf9KZKiXsKb/4h1KbJIvLNrf6Ty
         b/1aYP5hC6Aj7v6zeSsKt8WexWzpYfgdJonvnQ8Tv9uG68d6x+Fn0o+NeVn9lyxu0zfD
         mDGsz66EbJa4jA15U/yx4+aD/v61LcilNQfuE28rqPA6fBHcDcv1kkMQNEb7i2g9MVJy
         WNZdvZznk4SiMhLwHmOdaRG+YF7ajrwZ1TjMbNaG7kMjXxbbZc15BVpbW56S45SetOdE
         KjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134369; x=1795739169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
        b=zj7pm8Qcet9RC2+uQM+KE+rp7/mM9KMaLLTS34qtueNDiUdKFpdcD1JrHYf3JjSzSG
         yEZoJZ8Wxzkz1Wd8g0L9I8sg588wGExsDGfc02d12+BgWqA/vgRKpwyMaYY9iAzEmZqg
         wuYocOECTvokhcenmlPYctj8yQ9iE1kr0S6yYK7TF6WcwLTjyeYUpkBFa8qu2EJzTOuP
         2HhuYwAyq4gwH6nLqfSYkljbhiA1SypZhHCxFYheCKWIDGlATyP3LWprAOX+0COW4344
         iknQcpQIqMBFCGWxLK+i0zoko4AAmxP+kdVVuSJK0UMf830IAaB0PLBJ45P93ZLSXRWf
         leag==
X-Forwarded-Encrypted: i=1; AL+hErG2Ldd/jMB9HTngx+fqwv8LbwEiDFWuLAN6T2DIvkrrij441yQ+eMABsQNYeJ9s2l1nn20NHFOWu0TP@vger.kernel.org
X-Gm-Message-State: APuU4Z8vz4xP54b5qEluErr7jf1Tr9s734X8LhepNqrhLwtkCMVwQtFg
	w1omUrIUFLM18Yc1dKCAkjOHpsnsgr4MxTJ6lF0DGD0e9BntufWtzGmd
X-Gm-Gg: AZFdTZelS3672CK6EE2pCpOQeO44YMuYhS9gxJ4YA+bTCLA2xTBiXxJAONZTHp8qFyg
	OAmtZcQS9/IFnKLmSIlGUGJmogPEzyDoyHtxyiXaidbrVegZrHtDOeXKAPlmXWEsSh16t7l9ZB/
	z2DzmfOudLpmLEILnPQZAH+T21CaIZyMhxkNkxgqAmoitvkEMLO4YJB61OQgmxJMPmZucnANozT
	qjf46s/BnZ4Rczs/Qudbww6Sdp1igN9OJeIcn1qRU67XesjeGsxOCWA+ejZrGyjZxXiKBQlLmrZ
	kNsNXYshjZCpiPEKZAulx7Z8VILSUqVpWKYbLvNUh+LriZqmRHCPmNV5AB3hXpxhxxq+o7MMPX4
	qbLwXoWNxUEhER5cXNsleKiXyJWN4e4xiZVFQAJvdUbyaWIWAkFM762F6uh+1lhLmigkNFlvu6T
	TY5Xay3BQ+xpn6Covg1WwRuh7ZYS94yj8ixxU7DSGbgJxhuQCQKJanBfd864y5grkoeKFGyHd2u
	EbywUAbdrBIE2N1rzlxy9e5FOoEvl8u39znZB6m+UYK9r9v8ITtVGRvVA/t6r/s++3jr33Ap3jV
	CK9/oNIBh8s4JnTFGepENfJyBprmMRhW3KdC/24Xdc8fGmckyQ0qlM5m2zQEXYwexxRnlGku5eK
	8rP/rRTF/lG53+dYsTwuFK40HkUnRILmAhE3dF/kmAqjbrnUBMMNbyGch/SQSCs225ynOUN0x
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr2588519f8f.53.1795134369416;
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 17/24] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Fri, 20 Nov 2026 00:25:27 +0000
Message-ID: <20261120002549.1908299-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- Marked of_data as const pointer to avoid build warning

v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 17 ++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c59d881ce10f..9475e53752ce 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -211,6 +211,10 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	const struct a5psw_of_data *of_data = a5psw->of_data;
+
+	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
+		return 0;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
@@ -995,8 +999,19 @@ static int a5psw_setup(struct dsa_switch *ds)
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
index 58690f5f3887..942931cbc402 100644
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
2.56.1

