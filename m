Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298702;
	b=FcvbABlD6FXPtC5D0hQ1rxnmvh1xOUsn0KSdm2jHkpZHywHVFx29165PO5Ks4WXHeP44
	 VBO250CqGacpmjDkmMZGaYv37sFq+txecjGdj+wPITtSS2RNYRQI0+PgLjae8eAXHD7RC
	 J9MzH97/Ved5BRyujlYNxHI/7sp7aPAxrpoYdRadM1HjMloW8YYD+O1vHC0Q8lJ7r5vgE
	 1cGmGKz9Ls6pVD/B2k6Ywjn8ByMv6JnC7sneNNomTL6rkwiCi3LpqhJEH67MGv2hIX4gE
	 6G15CQGWG8hCZVGo4rhm3IBkMgbJXIgCeSLpJB5GCjjfKvjq0cErnHAZ6UD0fFHrcmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
	b=WTSg30P3G7jebJqX8Cg2d9jtiZiXaWi9Mh3CoEwjfKxYuGev7ZSaQPnR02PM4eNZyrOv
	 f6CaqudykBYTOC+CQnPkE8vKDWeY8qlbcha7DVm4CtpLTo5GNp7LTufjt+Uqsxh28Qp02
	 CRvfpZVMeFdgmb+/MdWN1KMaj8cMv8Le+i2LjE+lLz3W9FC4pDhRU0BM10IEn2b2b6PVt
	 fYgCx3sIis0giUD5o8m81gqY7EHreClEX2tJdxlqQVsxVuga8zQQ9/o/N/VoB1Qvtqot4
	 l+9MGGGnznxNPP8/fEIWmDE68Z5BD2fr1jd26/+nnQZqgyYbJYKKGNGBJbb6Dj/8T2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtXK7Vl8;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D1E606A32A
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D1E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AtXK7Vl8
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36ca32a0faeso160652eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298701; x=1794903501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=AtXK7Vl8nD1YpvHfshGLN79X3lT79XsqmgtfrkX89gAdkL9drQysNO1yxzT+P91UdA
         LihdS4X2wUZ4+K1LkyXgDyT+u86nFJLuM9xsxZIW1nEn24COMkhKsj5RNHQSkfBl1+Ar
         o5ygjyP6WspOqZX6h9fkeTdayXW6/cuU9JTE2B3IpbsVVgxFI7GrvJ+KB9gw9dEB7Ho3
         A9xxIWAs4cR8b5qVqK+1ACKadQ7QRkYhrMUFaE4PK47oE/AiHRMs/DOH72CidfvOHhvf
         g29W7/RWLNvwyfSlDWC3mypGJcNshesUEK0Mtrl2OjgzmDA+btTxqm9A4w36/vPmSBqR
         QRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298701; x=1794903501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3n/gmm5kxWB9YJHd7gfFf9nA3tSx3UHa8E6czMM6l7w=;
        b=qWotlB19900CG4/AX1maOgZ3BEnVTCCNaohKeykR1+KuB+MrH6xqYi2E8ZkVGtlOND
         I1KxRG8rlwSXQ1jg1YV2lEznvzn/wMFvI6RxSF9fhLfZPARL9VanCmg7CUPaapRjftD7
         vDkRLEM5Hc6Tk/O7YBmiyMDa99YDRUk/a4GRb3eVMUXdWQdw+zQ0BLdL2EaqcROeiTRR
         QGuZHvhzLiIiOFw4OuckQrRBYRXejL4PctS1UMdMeais81sKo5lITqrmJBezQEwF7r3v
         1TFGs3JWkcusKO63e4hQLJitXf72drd0XXzH7Pd91GRLapY0qznMQ82zTrVOf8AYgkZ8
         EzKg==
X-Forwarded-Encrypted: i=1; AL+hErEI0He9nZUMMmQa/fPa79JihzCp6DxIBHXfwJ2s/GdqoaBWe83ZS65gNmaXVdHrvS56LomZHcrFcUD8@vger.kernel.org
X-Gm-Message-State: APuU4Z9J/bDmnOn7+JUsHAZv9/AeZVMtCcDVsMTe6I+zwq7uABONAY7P
	fDqo084xomDxcROuc0oiiTFI2WeZy0Rd0h56RryTo8vlbYHIK5dYjtN4
X-Gm-Gg: AYBFou1eNIrwVedHQUzIwuGzRky5yD1dnpBsSc6rjdpl2n1hFyP7pqF6RkHEi9JmRai
	Zau8+7cWiRKO8W9FrRoAD6XEtlGGo4VYMaxJiQguxnShACpUEYFleJI+FdbJMTW+Gyezjbj2/Yd
	gRd0LrajqysdSMEEzUKZ6ZwXaO2nX6WRZt/4kYrFyBuqR1WuW12VcAy/6Aj0LxuP7SuUmFm4J8f
	5AOho3Jyw1C6xqc/tBDF4rBIcGLyxe+wQZdMEhCNMel+yeIrRc67KZo29ffxAHaIF5MdUFORbY8
	qFKkjc80a8cdlteaOnXdHk+0kWeVlObN/eMTQMnIWMirQ4fIu7RtrEMYRBIGPhhpbvkqgSAwY8L
	A6pQhHdLN+d5oquhfu6WjwucSTcXCMZ1KVrRJnTjScVY0aLLtcEqh7L7FA0ldPn1duJdZwlXsFD
	i6TcAv4xXESs9fDH679twuVgA44RxnJPWsMfGW3TudbiI4iQF5r2BdTSiMttDcfylqSw3HYYARZ
	u25oVCZTkJDcl0UO1QC4Dlk8Tt0VN435xoMYSfb05Xy4JGJzqT5gYryqR/0hoXuZWoBMDjFOfLB
	PYOn+T1l/4qN7PHLuh0GOrcxv0yucsqthJYd5AsMiTF1GHh+ZdhIQYAwcKRr
X-Received: by 2002:a05:701b:21d3:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-1b3b5bc50c3mr3885712c88.0.1794298700740;
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:20 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:04 +0800
Subject: [PATCH v6 1/9] dt-bindings: phy: Add PHY_DIRECTION_TX/RX
 definitions
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
Message-Id: <20261110-dcphy-rx-v1-v6-1-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298691; l=1290;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=boFp+ROAJs+hn528tIchPlOUGZl+pUW4spq3YalZAuQ=;
 b=2Om6akpYt4IeVtY/W3aZ9CiVBUWzCN2RjS/mjsi+pChJrq9agUeJiKjz+mS39Et2p8MKNQOFe
 a8COwdPb0ThCDXpwhBehkJTJFZtzG3JqdNkYva+Xa8x2FSzw82cXcnb
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

A MIPI D-PHY or C-PHY can be a transmitter or a receiver. Some PHY
blocks have one of each and can use them at the same time, so one PHY
node offers two PHYs. The existing cell, PHY_TYPE_DPHY or
PHY_TYPE_CPHY, selects the mode of the whole block, not one of the two
PHYs.

Add PHY_DIRECTION_TX and PHY_DIRECTION_RX for a cell that selects the
transmitter or the receiver. The first user is the Rockchip RK3588 MIPI
DC-PHY, where the transmitter serves a DSI host and the receiver a CSI-2
host.

Suggested-by: Michael Riesch <michael.riesch@collabora.com>
Link: https://lore.kernel.org/r/7425ac83-f6d8-4443-a26e-a47f9306aa24@collabora.com
Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 include/dt-bindings/phy/phy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 979b5dfd8353..9ead74d9a172 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -29,4 +29,7 @@
 #define PHY_POL_INVERT		1
 #define PHY_POL_AUTO		2
 
+#define PHY_DIRECTION_TX	0
+#define PHY_DIRECTION_RX	1
+
 #endif /* _DT_BINDINGS_PHY */

-- 
2.43.0

