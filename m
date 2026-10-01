Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B552D2C9
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869419; cv=none; b=iZu9fLhp5Ajqpu7UUegjFoU29xQpilChiiodun2K4k4tj9+YArg4RLoGLk1FCXPU5+x0CH6FRT9QglPGCNbYFWeK6Su/yoWVH74v6a2mHIo3JhXjl6TBFX5WF4LXL2F6eofkBeJ+ccsqZXpWqoXKwo3l33MlKgCG7OoXxIPhOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869419; c=relaxed/simple;
	bh=QwvQmRrOx0xGCbxyidAP3RSuqxog4fXlNTd4xY4P0pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFcZABXwiX3UdFIm/Lt01OtiQKhCP+GDvvF6C6rV7DLlK5k4w+zZeZOLaqXX+0SG4mC0xBIJAJQD69nPpdhjdmgoLYBfsUzDeyUunBsdHDcq9Ih/rO0if/cGK7evqQJ+muwx785qxbrMT60Yr0MiFnOm6UVVXHpaoYNxYPmzdeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyiPQBJN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyiPQBJN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so5914479f8f.2
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869415; x=1791474215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YviOrpnvHXNI4WIDrnbbiAUcgeM2j2c2cC0XNpV+I+A=;
        b=EyiPQBJNdFUkL2G3g4/aq5D6u9U4wLYNxkESXUb88QwWvuI+oIqbjvYZQS+w9Vxc1Z
         nG1nbRdY/eY8cb74hIPgcS+ifE9HkSh11cuqIPvVepK5JTlr5LRnmTgWJrSfR2NFPGHA
         iqkbtHypbb31pyBKKeUGEc41/dAbwKaLXJ17RULFkm4ZHJfWGAqdaPPuBAy3wNKNLdm1
         3txc3ALz6rVwRR866BojfzLyBWRhHTM793d+rIYlOKarzHhCJ5/LdEzpC2GcMeUJ2Rak
         dOWodkcZ7b0b3JO07mIzr/AIJ98AC8iIrRt0VWHAgivi6tCu4zu7vh5Jj1fiX5gvHfIp
         GL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869415; x=1791474215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YviOrpnvHXNI4WIDrnbbiAUcgeM2j2c2cC0XNpV+I+A=;
        b=mHIYxRkIeiL1uCQAlSaprAg2BUfqGdaqwXDLyCR0/FNAOJCOyVgK+fyP1XktQrFHgM
         nU/BDOl4KTyf2zdiMIi2r3aJAWv8F5DQSNsTKoh/lpYeij7eHVx7wUUHTQZKN4v+gSLj
         rBkfr8vk+QCWS7H/93D2fcr04vScclM/6uW+8ICj720mbaisF+o5ehZafANR/9mwdswI
         ap2xYzixF3NIaxAPaa12OUxE88oQ2bRHKTdOiKEErYbatP9lzutUcFQqRd8NHNSTaCuI
         7Nq4bIATGJPqru7S2Pr+YIHdoOa4yTd4VCmvrFdxbAmnJtQLYI9JPNEbZW7jJk9bH6bN
         EY8g==
X-Forwarded-Encrypted: i=1; AKwUvBwUx8ybq5PfwdbYFKjEzPXeXP4NP0pTtqct7Ucqpx/qfCIn9nDc031U/UuF/aptNLLqiYXGyE1UkkpM@vger.kernel.org
X-Gm-Message-State: AFuF++moPY9Zi9H95V9dlq6cojAM6+uSF8u6lvz0KeWMRsVeQr9/Sd4P
	0K7hd2tv3U7pjReF8cLCMXiPo2aBdjcrZcuyo675pDW9Q38ayRd6UVzf
X-Gm-Gg: AYBFou3LhtVCni7egQtnWlbI2sWR18NhVKyWwJAqI3Zp2FvdL8VweYBiqZFccunrIf/
	Y3adQf6rZs6pdBkvtisqi6hBWEYJWXi8lUBDjAD+BrPeEv9Pwy8jbgdDnJgvrLYZzpFJuclwJ59
	X0DlJd+zwBRwcyhcn9Kl5lNxzN7QErXkuU0dpXHyBgNJzXYrplUHMcQxUDJPmg1EsTS0G1aSfPK
	0tD1H/t4Y3Gs7ndPtDumsp2XDNLBHX2+b2hczvkEUvmoPu8CLDhb3p7C5i+zyYtgrkgF/3e5IYh
	tZbvY4HS/kFpsDvHtcVEaoHZpGmQm3em2ZaDmO7+NMjJS3QpSj7AqsPc6K8zS+MKDyWAmNmHVcN
	SteEYZPE2MhM7TEDoYcpgvV7gyV79TXDYpYvcgUUIvrJFvjxXswuQKO7n9Y1thf/ea2A24GoKpr
	q4FU3Ig/xHRF4R62vW5qzT9OTdRPg88hhnF5BJne8FD6PPrrjsu1T2od8TvY1SJwIfEkIMbHnmf
	7kCZTgGQNbri71jN43ADXC1InHGpfXM8Z4aW9VKh5pdzPqnruwbTTk5tGmBOfVkLpuFbNcPPAN+
	OhDpcbwI
X-Received: by 2002:a05:600c:3501:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-4a02758ed05mr254625e9.31.1790869415275;
        Thu, 01 Oct 2026 08:43:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:34 -0700 (PDT)
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
Subject: [PATCH net-next v2 02/12] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
Date: Thu,  1 Oct 2026 16:43:15 +0100
Message-ID: <20261001154326.754314-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a distinct DSA tag protocol for the RZ/T2H ETHSW to separate its
semantics from the RZ/N1 A5PSW, even though both use the same tagged
frame structure. The on wire layout is identical, but the ControlData
bit assignments differ between the two switch families.

The common tagged frame format is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The differences arise in the ControlData interpretation:

  ControlData field (bits):
    +---------+-----------------------------+
    | SoC     | Meaning                     |
    +---------+-----------------------------+
    | RZ/N1   | [0-3]: ingress port         |
    |         | [4-15]: reserved            |
    +---------+-----------------------------+
    | RZ/T2H  | [0-3]: ingress port         |
    |         | [4]: timestamp timer select |
    |         | [5]: reserved               |
    |         | [6]: RED period indicator   |
    |         | [7-15]: reserved            |
    +---------+-----------------------------+

Because these semantics diverge, register a new
DSA_TAG_PROTO_RZT2H_ETHSW protocol and corresponding tag driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message
---
 include/net/dsa.h             |  2 ++
 include/uapi/linux/if_ether.h |  2 +-
 net/dsa/tag_rzn1_a5psw.c      | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..57143cf52f89 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -62,6 +62,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
+#define DSA_TAG_PROTO_RZT2H_ETHSW_VALUE		37
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -101,6 +102,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ8463		= DSA_TAG_PROTO_KSZ8463_VALUE,
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
+	DSA_TAG_PROTO_RZT2H_ETHSW	= DSA_TAG_PROTO_RZT2H_ETHSW_VALUE,
 };
 
 struct dsa_switch;
diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index 1ffac52c39df..9fd25c5d96c9 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -121,7 +121,7 @@
 #define ETH_P_YT921X	0x9988		/* Motorcomm YT921x DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
-#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
+#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW/ETHSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index aab0ec143c77..3dff661fa58c 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -23,6 +23,7 @@
  */
 
 #define A5PSW_NAME			"a5psw"
+#define ETHSW_NAME			"ethsw"
 
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
@@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.rcv	= a5psw_tag_rcv,
 	.needed_headroom = A5PSW_TAG_LEN,
 };
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
+DSA_TAG_DRIVER(a5psw_netdev_ops);
+
+static const struct dsa_device_ops ethsw_netdev_ops = {
+	.name	= ETHSW_NAME,
+	.proto	= DSA_TAG_PROTO_RZT2H_ETHSW,
+	.xmit	= a5psw_tag_xmit,
+	.rcv	= a5psw_tag_rcv,
+	.needed_headroom = A5PSW_TAG_LEN,
+};
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZT2H_ETHSW, ETHSW_NAME);
+DSA_TAG_DRIVER(ethsw_netdev_ops);
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] = {
+	&DSA_TAG_DRIVER_NAME(a5psw_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(ethsw_netdev_ops),
+};
+module_dsa_tag_drivers(dsa_tag_driver_array);
 
 MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
-module_dsa_tag_driver(a5psw_netdev_ops);
-- 
2.55.0

