Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765679;
	b=mSJCr/uP8AUCstLbknNOeJ8ggKkfhnD+MsSrhnr4SRIsbjtYsE4lE532eINA6L7aYzVe
	 OqytJPi5e1Mf8HulDlTuvz9gWt1D8ocpV06gzik7lVl+4SXka/ihoNkj7lXZZzEtH0EY4
	 VlYVOh0/PKJZBtbheqbNHC0lJZm+WiFTZhvMckbuRYnYc2U62r/Y+tH2ZbnHATzt922en
	 dOazUTUd9F1nzPh8Rbexz1wAl9po2AuWw2+luQ141JkzFjUc7fgiFACFtkhL8MzhmmdX/
	 SLT/Ce6ZNUuLg+v1kaScbNEc8J1rY51LOIHDZXkWF+2lz3YGCbqPxlX9FPiIO6JHzfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
	b=Y16R6zVP81tEfsdz7omPNOj7sPrGiz3Pzy4KANvsyKoto3s0A9ASAaJfNRjwnqMLzpkg
	 HkPmIr5zgqMwmalhQrOxhKIrRN4LtVMi45b6Qx8w0waOHOAd1fLam9JKnr+lJVHxhA2+K
	 OqhWfADsUfnmHoghXgXPQu+K8NOGfcrYY8fuD9VhdRWjUtJ4Q8ZQIiLmYsXY6euOfzxwE
	 sxlBLyD6RDxz2H8xzazydACgXQNhTE3RKk8Hynn+dBIhFHxoCAe3c8emtFAbMC4MqCGsL
	 WT3XEoF+A1a0kjwGFy+THx/soOfekW/cigJdBtLVcSqrTPbb5wiZ8xq1U+VIuxdQ4oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ofy9ShX;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30F606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD30F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ofy9ShX
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385c497bfddso804041eec.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765677; x=1796370477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=0ofy9ShX7MdYotp/3tfXIUG4reTq0nHGYrwVcKRxIXzmOcdE/5/P9Ktr7TX5gDQKHK
         2Qse9MOZSKtwQ9+T+Jb5RHDlIUzOqxadLHkksLD0iZJ4/W9kg2Tl3F6Q+2/OPxR5frlY
         gld28w608lagYh/DoLUtaMJapxfYVYYyBpk8iyMviUukhMCuRgYnnH/M2OgcH6D8ID8V
         copV6UPXQMd2UJrcJpECLidDkvR2rHeY02mvJLH4GoswHKGkgz/4sNJHlXi4pSw2ow98
         TMcYHIdStCfW9Ms9qw6XP60mvRfQu40reuMkLUq8IQOdNUXKY+WtQdQeQ5Ad9H0peGU4
         7zOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765677; x=1796370477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdqQ/1stdbLe7LW/q2pTltSdWQOOet/MTXZ5U6MTyic=;
        b=XB3ZbvA9cyClTOCqMtLVr8B7JQtHcbD7dxzEWSkqf6Vq+aWCPZup369vKMPu6iOuXg
         PcM2h0EErgQHdzacS66FyMtA9xIhYlUXekBXkNy0QQ+WRZtUnQjYLXrM+j2fEe75ta9/
         Al1AetEjkccLgWe3H9qxBu1vBLaOG0SlEQxnCpQJhkFByx+ZX8gaCVtJSEL4+eA1Wvrm
         1ab8y8JJA3oOexZWrgl5wL3lnjGgHR4Xn+M49EUpCqG+KGoR8BUbM7Zy0+NRot8CiFXD
         n0ET3pKaX09xSd3VOZLAmWU9v/YBPA2eEnB9q6oF0I7c/AtFuUOIZ+GCaYNxu5rPuLzb
         wB5g==
X-Forwarded-Encrypted: i=1; AL+hErE7dPURwsEGkMzHzJwp6PMe6WyncXrtcvc+iLnfNmVGF+NUHCK1Km466TTN7odiBPqyVeLEwbs2tuCT@vger.kernel.org
X-Gm-Message-State: APuU4Z8D0xaJ6BWKT5b80/7jONcIxPtGTode95Rumu83WdIE41sRjR9P
	NbWCaxVVfGIlcMNRNA2d4PurbFYueNfaBoUoxuUSiHUqwlwR7u5SwO6L
X-Gm-Gg: AZFdTZcX/mxV7NyWikkClh8sVeMxZFPh3+iU0IshdCvJQpyFyYIo6gjM5vL2oeOdXPa
	Cw4eVI3jAaLoiX+wZz3U9Eg1p8lz8m/vubtfN0MuQIg4GxIz6/EQbwQCnK0wwGRo5yaeocjnzn5
	X9weL1NmRhVbIiBlXkbxYQxPAPjvRx+P0dcJ0eg7Vj5JoG7w/iw82VpeqEoQfmDmkCjiZMo1oXg
	r/8OPRhcZDX/+i3cJ3SqtX0vTDfs8a+3QjGeU+eopGlT8UklCNjB/Ek9gFthxXifH0kucW1g98i
	NlM8RR3bl12aVUkvli5HZiCncXjfp34xODh7BrrxW8UDP/JgQEk0dNqrahwC+ryXgszqDJZ5wLk
	MkDKasNfIreLQD9E5DszWRifSTcHB8Ts8sKHzNLgcU3vVnfre/KNzsMUxSy8D3qL1St9ZvMgeds
	Zr0lgCiTGEtiWVvxwZ0kdsStqavIbC3fa1vMNm8UvNvrIvrYlv3UKqB63+nr63LXgV/8iBuNrem
	iQfD/wfpq7H7XTdqPuVKHJGMPzsvuCOFucnf17AtrzX+B2NVJPbZDmWnFlmixJu7ny77mNCz+gu
	4ZO29D9RpS2DcIdQN0bGLB3eZks7ryPZKtPSW+CtOPG9yK5bftX5IJo8Bd7u297CH4/tKwVMjeJ
	+65GetBNFVjzifUaAzFL3
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38384098eec.1.1795765676382;
        Thu, 26 Nov 2026 23:47:56 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:47:55 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:38 +0800
Subject: [PATCH v8 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
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
Message-Id: <20261127-dcphy-rx-v1-v8-2-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3039;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=7rrdQlfrdWzd6vh0XG1BVzWjWRFX5AHNt9d46Qfby9k=;
 b=PJpEud+ez2q0GsXQjeTCuSxtX3j8zOIr53Jy9X+9FVnl1qhWLNzk1uuIUPCxn7Wem/kCpfd8Y
 YUX34ypgZ07D1PGVlQgKmasrZrBAoNlnEImfVm9qQyVU7lLJNtOmv1F
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
for DSI and a receiver for CSI-2, and the DSI host and the CSI-2 host
can use the transmitter and the receiver at the same time. The single
cell of this binding selects the mode and refers to the transmitter, so
the receiver cannot be described.

Change the cell to select the transmitter or the receiver. The
transmitter and the receiver cannot operate in different modes [1], so
the optional phy-type property of the PHY node sets the mode for the
whole block, D-PHY by default:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_DIRECTION_TX>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_DIRECTION_RX>;

For C-PHY the consumers stay the same and the PHY node gets:

	phy-type = <PHY_TYPE_CPHY>;

Existing DTs on a newer kernel: PHY_TYPE_DPHY and PHY_TYPE_CPHY remain
valid as deprecated values. They select the transmitter and imply
phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY> respectively, so nothing
changes for them.

New DTs on an older kernel: an ABI break. The older kernel ignores
phy-type and takes any cell value as the mode of the block. A DSI node
with PHY_DIRECTION_TX therefore gets no display, and a CSI-2 node with
PHY_DIRECTION_RX gets no camera.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/94d47cab-10c6-4ec3-84a0-3bddc9d67f5f@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1ea21ab203ba 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,11 +22,23 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      Argument defines whether receiver or transmitter PHY is used.
+        - PHY_DIRECTION_TX
+        - PHY_DIRECTION_RX
+
+      PHY_TYPE_DPHY and PHY_TYPE_CPHY are deprecated. They select the
+      transmitter and imply phy-type = <PHY_TYPE_DPHY> or <PHY_TYPE_CPHY>
+      respectively. Use PHY_DIRECTION_TX and phy-type instead.
+
       See include/dt-bindings/phy/phy.h for constants.
 
+  phy-type:
+    description: D-PHY (default) or C-PHY mode
+    enum:
+      - 10 # PHY_TYPE_DPHY
+      - 11 # PHY_TYPE_CPHY
+    default: 10
+
   clocks:
     maxItems: 2
 

-- 
2.43.0

