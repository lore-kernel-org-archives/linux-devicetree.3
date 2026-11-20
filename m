Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134362;
	b=qqtgW1teioicT2z7SOfBXbc2eyMis4PKGlZvTHb3ew029M0PdxWzJpI7v3eOuO6cMTuQ
	 16Uuhy88E6z/FsqpNuCCo4fWYGMVjeHA9NI3XmShVlEcXdUe2XZFZrVvhncKICZDtqX37
	 DAC0kLvro38hXILNHY/FmEM8OvznDGnQAoIWZP8GHDr1waQ+J6j9+nyYXS+EnUggUZKGP
	 dEXVs/oKI5OJgz//pqzGCjzqC0XCRG5IwIGykVnqoq2kDGzslCJdVKFRMntWhz8Ql6w/a
	 sv12zrJ44AE2VMhxDshX/A+EUlD0Df4kV9l2p+Kc1dNS2gib0haFYtJIKbgwxhc3HHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
	b=21vreM6S9mkW24a8Wq1jIrn9774+QvgUcI67wCy/F8Qbq1tkYytNvMjSlybvSzbjXnFs
	 0pGhb0LrcUMCB5QpSF3P4TVmAWI8ssoML6q+DnIGMydzorYQQTmKJWy6BRyz9iuZNCL6l
	 p6/mj4UcZ45W3M9Ni0LkQR+sxAY7vKptAPLBQKsltTlWcuFiw5yfTZsUuwKyWaCsRizRI
	 1yFN5Nr1wt5xzsuReKrIQNPvIjtvza5aXiJdjvQWygGTzZQ66lI3cV59J5U9yiRekRASW
	 fCOZ1LA7KBvUb0esqQ/Y1CQYFfcla0X2dwd+/gd5AiEL8c+O0pV3p8yz9rra1vdTvNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/p/TIxM";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CA60A380B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C78CA60A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/p/TIxM
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so121064f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134360; x=1795739160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=O/p/TIxMNe1VZNL0tb69pZrpgTyXAasD93YyWm4O4g0OxXiQ3RSyP+C1k2XJcpnnWZ
         57wQmpgoyFahDY7mHlhUmAqXIeRyltFF6XLfMNAnPR+Vs+7LdI/jtzJQztOHkRlITWbJ
         VXgmmiEHRdCou5t1ST1xNBJxZk4gGYchsXSXvc9BAb7nbZLlZAC09xdqLBwWcpIoGE0Q
         XzwajEO2ph+fICyEmYZsaln5bJzkr+Nu+MF/c54njKpwSNJ49uOl0yWg8s3box/C0mIY
         bHPqK18hIDiiVTHrTtEo8IwXNQWgDXP7AOfifUyqRv4PPHPEY8AmczehAFIY67maiQFi
         8cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134360; x=1795739160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=FTE932PulrteyGrVWYXZmvnj1hvSU6O+Ex/w/NWM3stuGL1e6rpvZaFMno3Hxoa5XR
         ES1sfA9fjnGaXgAU24D7gHw/ACgR/krbx6Jg7iOlfqRvQto8TP/+JtJd4nQ+VHdnBOdO
         fmaPq4aNWRPs5EsoY3+EkgJeIDyJDirN0rbFw1m0NHM7SClcIkgqJTjDRFJNxWBOL/s4
         QLg2Z1vt4V/Az8gL0Q38rrwknT3i1BdlepjMEDoHJIhrV3hNAXsp1voAU36XXq2hSaep
         rfgtfSI5VHCU/iMsv29YxwVb8d2x+a8Gm4q0dQN+ZZ7YhVhEFII2KGrfZpR1r7zPO741
         XWIg==
X-Forwarded-Encrypted: i=1; AL+hErGMrCc28L6wd6OFeR9LfPYMXbruwu3jaH7sx4XTBJ1eB6Quo03rybtWc0M1TwPDVtgXnWyozdVXFYha@vger.kernel.org
X-Gm-Message-State: APuU4Z/dUR9DCxPY3x6XzE0krWK7OTcJic4lMdFqRaGMBIGtNaPlv6id
	c1180EnvMy2zF9LxWgzeMh2HYXOTkiugFVVeITu18bSloCPsswTsEH+l
X-Gm-Gg: AYBFou0up9iNg5CUpspcr8+ZRaxGgMe3M5IAqZIZ7mge7xOq0cU0eeAcyWLamiIzRWY
	HMsYn4Cpv7ZhGcw2t5UfdP1UJHCYsUN0gc7yfhkWb7lHeQPUBzR9LCf9+c5GNEdcFIdDsFJiUR1
	CEPeSPKwbm+MoocXnw6jawKZpedTzMen1IkzheI64/gvWjHAVW4kSHUeLsNTo1fvWjHJ4KKlOID
	MMRYue6f8l1uZ0fawY0KR77QMvJGWo8eS7IprORxoZFsVjF0WGqjVztgRmxocigYQw8iWrbFiP7
	dEN/xQmkalZd7n8QJ+2faLKru1Y7Dj9Mh/mfgZp+O9JvbdxlCvkng1v6K59BPHT+4XzkIjMrD2s
	3NS5vYdimyh/RkRRdwUwxg+awBtJHyJvCiwjyPYGBlVrtubk3gdAzxC2KVUUlicFLvNpar5a0EZ
	puPeZjp/7QiczZ4tmq3H6iN16w+ey8b8iS0jXkivg2DS24V6VSYo8NhX3HOTXIyf2PXmBttTm+n
	5SVcWip3weS/766LhESNA02elMzLoT/YxAu8v6vJikhodA+ATowEWV63i0SevDbWUUpFUxjrXKP
	bWUPM0JrWzQi6AnD3d7BJ2PXmUtWIQf/LMGFbNob6ubbL0F2yR7rTub1h/EV3nFAeomjOWGfoLP
	D6NpnMDUzxg7q/viRcBLG/1SgBBv7RW2pnMLA4D1dJ0Xr5ftWgDi4IVTiBLDjbVzp+QYXpfPQig
	==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr29095585e9.19.1795134360078;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
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
Subject: [PATCH net-next v5 06/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Limit port reg values
Date: Fri, 20 Nov 2026 00:25:16 +0000
Message-ID: <20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The A5PSW has four external ports and a CPU management port, using
port numbers from 0 to 4.

Previously, the patternProperties expression only matched port nodes
with unit addresses from 0 to 4. This allowed port nodes with other
unit addresses to bypass the port-specific schema constraints.

Update the pattern to match all port nodes and limit their reg values
to a maximum of 4. This ensures the constraint is applied regardless
of the unit address.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Replaced the patternProperties expression
- Added maximum constraint for reg values
- Updated commit subject and description

v3->v4:
- Added reg items validation for ethernet ports
 
v2->v3:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..30f25b06d62c 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -65,10 +65,12 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-4]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.1

