Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F29391E7F
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290833; cv=none; b=rPdMlab0RGWtUU6HkEHjYlV8au2fGIOJTm+6wgPXSS0wOw65bD+dhppZmvV3UlclCew8N926RyVyBiO+kXWy5XnMe/nGMNHO5BuBW8gmT3+38CRm9ua6Q3wRAJ7pSgG+k9YQWlVycpnZKpbmZVNkF8VThcNZTcs0cXw/aCeRNrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290833; c=relaxed/simple;
	bh=8EosIzzR7UzOFP/v55N37uL3TxX8W4lq/3WtMuwfnjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBGO3obfBN3hE3v06QBRL01qFd+M1+VDIZrsivA5j3DEYQ1lh9XmjaNgL/pJPViSbu/jsAEWQw7bNN/t5GrsH5j9hYniZs+++UjLFQ9B0E2m5tFfu37M4eXyq5oEMzXYqJIdHjT0/83rqycN7Z1C3tLTKkQxMgOBPTn5BX0YSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6J5a7bb; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6J5a7bb"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so591174a91.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290831; x=1782895631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
        b=S6J5a7bbSNi6mc5Tn6dtd3h+h4hty8pbJMFLfdOfWym+74JG005tWWKfWy25QjRW2i
         qGM114J8A0iDX42tlPhYyVBsEsALQ9aZz1WBGhNXm/sx5GNfTQkYVm9ZGDXHEcFRuABc
         ehDj7c91vyZ7pdzm2E/cD3hII7ISeJzG39sLXmuUmiHnw8O8U6ipz6hLa0Rbzj2QA3F+
         mIMgL/wFS5Q0YQ6zwRJV/00Sj3oaoxiObafT+zue96oS6OxjH7Buf2pwgT6llbaERcZ5
         u97ohKvJVBr+GgWxUZyte0qhD1yrJu2F9BaWIH2XHxYLcB1WD9GEAVTtTbIEQPL9q+Cv
         3s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290831; x=1782895631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
        b=QemHGQgJCBGDQ4cBwfu+r5uGvjRQ2Mzj0Wv41ZWZ4HCiTKoclPtItLGj5TPkuOHiLP
         weAezqAawUI7BI57azbilVskoxC8f0sQq+XJakJWBsQLk31zieM2JjF9p9C3f+Drb2p1
         USDjKjhJGyxDsEvP2DpNXzdaPR9yh1oq8bSzpZ8RrNgRHLSSZ9z1z78KFrxLNwU5BnMJ
         rySzZzKiDE4z5YmTMUr8MPlGDRc/EviCsM+n7dMtFpBzEgto2RBfKhfSGv0m74+00HHX
         cJzG7jkHOOftqBjRG/pL3eIcdx9RDbFTPEPmetjAH++v4sS8nP/1lseXnMFe5BszYPsQ
         Byqw==
X-Gm-Message-State: AOJu0YxftlDAOgHKiyXXJ+7vM+ZO1H5/ZG00fG9SM/qYEd8MNu0GQS8+
	k173N1qApxLKaU1A0ACgEpTQZzifi9VVbz17o6e1FwLaOQuho7Kk2HCZ
X-Gm-Gg: AfdE7cnUVEAOxvMXWU5dP0LN3m+tfKjbnHRfYmgEvTkpUO7IiybQJ9nRixYI7dL+G9e
	JG3kAHg7F6iEGlAiBlfb4WsqEY44fpGcme4EXYIz344FLP6V2COWB4OCstdLHdR/lt8GDUU7xdM
	EGfhWrQcGWale/RbtyF4+jEsPxZdfHY5NMLeiyyc9xEPZRZMKQZKTAtKjicqqAqjDyOmKxzRPJ6
	Rx/FWrBgniRN/HbQDTW/59fJr0MUfcjgQXnZKuAYTJiYuxGiJ2CgDD8YELSRQDt/7Neawr78Mfx
	4lakDXcoebd0wCfWUfifabYjvPHSfmNeadBviZvRz9nS9dZRCLCRLyt/+Sso5tn0fBWlH3xc1v8
	vmbqyqH1Om/Qg/0A2Vfzu3tr/psn6y8YNRkhUcbEAY5DRevCIk0GCGrWWLHfR0lnMXFdZE5xOsE
	t84nR/lVpW81XAvsyU67h1DPpd
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37de428c345mr2433707a91.20.1782290831423;
        Wed, 24 Jun 2026 01:47:11 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:47:10 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:42 +0800
Subject: [PATCH 5/7] ARM: dts: rockchip: Add RV1126 GMAC refout clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-5-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1157;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=8EosIzzR7UzOFP/v55N37uL3TxX8W4lq/3WtMuwfnjU=;
 b=r1c6yrCwcpidwG3sbm7w7O+CAbkpEjmxfvytGLFSVdZDGbuxcpNNDG74XoG4SVu6zMjqBnqL6
 vaYbrNImRDfBTvTqOkFFkTzjjQ6aTtP18tsj4zv/DrAte13JPeV4nRW
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

This clock can be routed to an external Ethernet PHY as its reference
clock. Boards using this clock need the clock to be described so the
dwmac-rk driver can acquire and keep it enabled.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d6e8b63daa42..5b1ee06dc035 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -624,10 +624,11 @@ gmac: ethernet@ffc40000 {
 		rockchip,grf = <&grf>;
 		clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_REF>,
+			 <&cru CLK_GMAC_ETHERNET_OUT>,
 			 <&cru ACLK_GMAC>, <&cru PCLK_GMAC>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_PTPREF>;
 		clock-names = "stmmaceth", "mac_clk_rx",
-			      "mac_clk_tx", "clk_mac_ref",
+			      "mac_clk_tx", "clk_mac_ref", "clk_mac_refout",
 			      "aclk_mac", "pclk_mac",
 			      "clk_mac_speed", "ptp_ref";
 		resets = <&cru SRST_GMAC_A>;

-- 
2.54.0

