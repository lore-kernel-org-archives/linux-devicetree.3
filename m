Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134364;
	b=QDNrfwNXxV5XNXtenn0ZZdJ81u7Lal2pVC/rK+1fweoo7rpdy+z5gsls/QjgxrzNphxF
	 e1lKNo7U0VRhXlV7DhctQbUFhu5Dk5YlsK0DaxeTy30sIkFVwNReOSEyZlU4i25U/woho
	 l85BzSfnPujqWfGPG4twNgFAg7GwmpYaxd+L6QOfEqCTwMD+/xhAJI7CWo6DhjmjDYL9R
	 0iYX37xwalF7R4KsWiqGnZe7TWTgfTz0onDnDdGvc3by89ZVT80Uh/LsTrUBSJwPaLsr5
	 5x0DevoWWTpIMsNFujWgRZiddsvKMyta3/fmYjtiTjk0sRGlPPa5v/k5GKyuciHWWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
	b=ndCvqq+vyeyYq+LXvM7ZbN6hFywQ5VdNVqOtE6WI+HjQgEveuTz/HTeoykgxq9qoGt87
	 ZQBIPnYTGTjyERIStTblDF5rK8ZiIpVVzoqSAUd+IrCMM9HJqoIoZ41vUWKcQ80gOI9Rt
	 o0itr/ud4EI3XDNAsaKCCRwZNJvdf6LI8tcgACU+V3X7LM9xFb0ykI2nU9tNqBkxLLs8O
	 visuzeHQzqIZOR5IXAxTggQ05lCCbV7rEcuWvYEQ/gCYvmdhTGv9svv2BnSwiVHwQNPHJ
	 AlEAagWlwI1uODgIVOqe0AD0JJfDlvPw2GPmragSEI5n6IBLEN1fHh6JFr58RbZN/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2660A261C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C2660A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AsAePrb9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49d64a88222so984161f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134363; x=1795739163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=AsAePrb9EkRIpPCiAm33DMP9zvl2+uxn7OVNkOjp4Iq4VaZwO6/f/7msTwkTJSWEFP
         jeB7J3sDfEwjHTM65gRoKJfvpeeAhcYEo/cuHL9VISBt0l3x2iihGo2LUvZc+sx95DKz
         rgUwBCNMjgG2RdjozNyFtJM/lFmFdRcRB3iSztcmPc6TlU5Zh/UifZKwylp1GurBcKxH
         EP5GELp6s5ndln7VkX+QjY+6P0X8fdpBVnb3cwg31u1ssc3lzsCuCArEoUCrVHfEl30z
         aD1uYqoj6Lt7qqEyaH/OB55xh410uGlwDpbly1PSQV7P/fMtJ7ucu05u6/k83ltenaNp
         a83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134363; x=1795739163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFweymMEv8DhRKIaNy7RtmB8ERYH0EjVLWq8evra0p8=;
        b=KMT/pfrzgo7YH4zT7vokkyDQQJOu20PqPUoiF9uOzETeK9F/8CCrBCYmwxp3tUaffu
         Ag4kiK7oPfJVgQdkCge8uGAN5vuVtYyEu3BCIZBgxuj1u9X6+JKXCwahWqrhEb3/EfLJ
         NP/X8eUMcO00QpBH+f6MXtNAQLCLnle1YmTT26wEGhGhtoXxdG3b0QfdM2pyBbDiC69O
         owhyHdzG/3BCwV4NR1KGPsGeJu0649XuCCHMh43T3f+El6XmPdW2XYWigrtlp5EP6+SS
         Utpbyo9X2pntH7p5YQymI82A+Frr+12f6xpEZUz0zAQHStD69vDo7WoTV+XqZWe359ch
         fxHw==
X-Forwarded-Encrypted: i=1; AL+hErF4CGnsKOGzsp0rCzvakD4ptL5AptW746wG/bTZuAT2IJwSKHb890FIHO3KCBsv0VwBobrBtjuugihY@vger.kernel.org
X-Gm-Message-State: APuU4Z/08kRnSTe3sbjtjRPa4pNEyTHNc+D7l+j10lU0/xuYQjrf0AT+
	XgcGytFU2ToJUigQe7rnD+QsmjFb5ODo9eVRSAIgAa12psQNxqzH5o3D
X-Gm-Gg: AZFdTZfxZJG1xun5Ixq2IP83YpcrGhdk0p3Wc2ih8ft9hAJS3MD1CnebKChZhhbdncL
	0KPj0ggrjL6joJQiWtOieMjEUUem8VnRYvDLrs04DXTj3HHkrs/0aUH+wfXGevBjDhPEH9kEIbf
	so6FSL97yBWMUf48OOeaADdgMOzHb/QN7qzr+U9g3YGrpmzttVq+ZAnWb5UUr4RYm2p+TQnv4QZ
	iaHZiTkYXtZ4/4iYv1ZcWXVtTGydsJo2pBrCPIqs4zONQD9TuB//CUx+AXFYOevMBaUWhCw4Rfe
	cFqJK/kz5FIiHl35JhzQqnRaGLgdye/jalI4l6qFSIukxPwraghuDG8UYhOaK086QLREwLekC1a
	KEcQ/MoNIw77KpmbqaB4WW+A50a/rAKhxY/7Z+rJWDWcHhmtJyyiI0rt+onrh60nxIwnMO4/mix
	MVrbCZXDZOGnvBujBAvOfAI0prjQPuRWAWx3DpqAdL1PmhF/q4dgKMvg/697FHJCsLS3gEfBfN2
	XbxuG+zHjW4qTLWFPI5XYiP3zKtxiO7F9euMmhqSb9OQMvahPNUp3ko/TTgYN0DcmBORteHFVur
	33d6e8ClWFBo/eNnmWufQ17WD6bSxybIR5flP5Y25VOI+ACF9a/Pi/TUv3hxtkXkR6e0YKVM2YB
	tSax8K+1KrU4A5CxG+qezMATcWfxP4vJYb1jkSTFlnvtdSr4rsfnU31b7mbhygWwSsL8V0UAh
X-Received: by 2002:a05:6000:184b:b0:4a7:9630:7b36 with SMTP id ffacd0b85a97d-4abb3f15ddbmr2216640f8f.21.1795134362863;
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:02 -0800 (PST)
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
Subject: [PATCH net-next v5 09/24] net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
Date: Fri, 20 Nov 2026 00:25:19 +0000
Message-ID: <20261120002549.1908299-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/N1 hardware manual places the VLANTransmittedOK counter at
offset 0x8f4, not 0x8ec. Correct the register offset so the driver
reads the counter from the right location.

Fixes: c7243fd4a62f ("net: dsa: rzn1-a5psw: add statistics support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..9693f8503b0b 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -185,7 +185,7 @@
 #define A5PSW_etherStatsFragments		0x8E0
 
 #define A5PSW_VLANReceived			0x8E8
-#define A5PSW_VLANTransmitted			0x8EC
+#define A5PSW_VLANTransmitted			0x8F4
 
 #define A5PSW_aDeferred				0x910
 #define A5PSW_aMultipleCollisions		0x914
-- 
2.56.1

