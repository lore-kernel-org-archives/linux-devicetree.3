Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639944;
	b=iKU833HO8Ub30batzCf4cMxaVHnfx2ildkahGNYAHKk+uK/xB8CDuQLfvZ+mXAIX6Cak
	 9htg+jK6Uy7sKnUjeyCJsVAePdCVV2k/DfBqgn2g21fIFxAxvIyRlHgaMwRT8hshJ+ljH
	 XZ7fr4A+nTOr2eQjHE5tAQVKPnk0bebrxCldU/APbJMQVXT7Za26iVo2x6z/7Kn1WSIIs
	 b2E3vyD6Ieua0svkxNb+696LBIgXn28P1MF6Sy9XyHjmRTeVOUKJStIuN3EOeqP1HjUOd
	 s6XU2zegL1Q39wukx1dH69kfu22Rpbpj+6iVr9lBAgeeor5CkkBXDYzadkohbQwnzoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=U0MhHsqjC3NSN9AaYwnpLOn9cg1egS6rQMc9vYItWhIQcV1fQoIyQOxRq+w3wfp6cE2Q
	 zlbFqEMToYLvFIw9wVSsU0Qo1Y/h4ivZ4gUwdtLuIoy5/oMtPqczpl3YXE7TJKYw7ofyf
	 D+EObjOt52ksw3YuU5duIQVWfnV837lBT3Ni6ESbO6a+YyolMOUE4F4F612BWVGI7hUsJ
	 p8IYT8jDbcUyzC9i9Pv3/uZEenDKJ1VOUh70FBK3kJovJdZM5qGloafIIwdMcwQM9qjfm
	 7WlAFBMLGcc3H9UemopkV7zQJx/HqiPsKssZlA8L5gFk3dlRx5crFF0mgIZW+U0roig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFbJi6I1;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13206608509B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13206608509B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UFbJi6I1
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso285646eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639943; x=1794244743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=UFbJi6I1f7yJ9oMbM/w7l7LBPGxfYK4lTp8CA6h9myt/4iu5jftwM2ST44jrU+MUP3
         AjCfTXXCfEN+LhZ8Iz4eZCAeR6Tat4LESfIt+s1ZtTYJGNLK89WZsERtlWVRSOGwNaM9
         ytW0YkYN6NhTineofT+O+L3/W3GhV7AyO2p8rKeO7h2Chf9CMYbmUcoV4a2SsPxsXdwu
         71fCITyKfPTp/j90U8SNbCf+Lp6sUCskLve7yGsyoaxoIbALbGJtQvQ7KFKdD7dr8yxE
         cV65nlLCNvWaianAfHGHIuevF64eAZ0zyuBqrNPTAuGZ2PjfYqrxF6O6yWwZncvEttIe
         9Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639943; x=1794244743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=qA/RyX3jPqfAfrgl7EWsck1k6XGeuKH+TNEPniF7SO3HgJe/bpHffiXfC4LyfWFp8k
         LvPk//wjalIze7jCKkasuIgHQwUYp99fF5IMtzurhHnKMthxkjWkbqZSi9x/bml9nhRM
         9YOi+GEKWj8tIY5hMSnL5eC35Ls4JFlwDB+FWG1V+i4K6ayyPVn4OhYx2TzpDWqBDTyF
         BHeRVPCN7PqxOKpRWXb+/+N71SgvC7vo/ALmXpSB+TA3L7dptVjiONEMwBAqYE5fEsoW
         yow1XbOxX6RlW+G6UdzpvYRu9nwi2yQGsuTvb/SNE/xGyWKrGfAgkH4Xb+tSpCYEL5so
         buuQ==
X-Forwarded-Encrypted: i=1; AKwUvByF+Bo+oX/9c+kbiiSN59clrjX4WLWwfR3WDiGAtGrWDdlEZ523YOIYSRlhUus9DhaNUdIWH952Gw9n@vger.kernel.org
X-Gm-Message-State: APuU4Z/jtkxigp3O/8UsOvdIaYlyaHMM4CYd7QsVgio6WDlZfEs/VBHX
	uWKoRotCb8eUqiaossO+O8+Ke8mIk/rzLwrleT+v3VISsTpw2TSOG798
X-Gm-Gg: AYBFou0WiTOGXTNvcQ786xkZSlF5a+7Pu9dDtqhWODMte4CwGhdj7pFSWssjGXc9pQG
	7a8psH7EAd1gPwrL6+5QQN38kq3T7qkDL0AFnc8jGMyOG2bJh7CpFIDrBbUvBtQxpVvDPLWT0nv
	ATz4sD6T5Ji4riegVlkylBrSQAUZimv77aFVB1chIJfS2EguQScppR5qXbK+kljzprDIwp7Phnq
	jrdiN9eN6PexL/L7FlqLs6GqeSiNBMkdl0Ge2T8rQDQYSETVZuqeXG3zZr6PsBlfpnhJFbEl241
	BoiQj/3YV0Cuu9IBa13BsJWi11FYvxytW/JFXo0FC9YCkBdwVGnmldb2NSyBibExgkoppLAUp1v
	HAD3y9rORHWf8Ds4qiSQQmbpwr9vduIqpDnGOGVreGShAS8Kx0GMlwVDoPemSl9omHNlPCenCpX
	P7hmp51iCuzXzPK+zWjkGK9cZcZOVksWnot8muDIGftltK0z7iWYiSKvDsLaSarWCwf4eCBhpAr
	siyVHLDL7JcfaB+O9bXQCkShMGXsFUn1LjSHWsUZoACtkbQ5qkj8F+krLybT64xUCjBF7VF0gy1
	119raPXyeVdcHGC14oKlfykWCr0=
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr16230795eec.27.1793639942982;
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:18:34 +0800
Message-ID: <20261102171838.2958552-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: f296bb503a24 ("arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
index 4c55c7d211599..07cfc68b5f91b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
@@ -280,7 +280,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -296,7 +296,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3

