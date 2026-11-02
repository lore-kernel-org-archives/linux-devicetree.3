Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641509;
	b=mVSyJ47nNdheYCK9DWLUHiR5aVANSuPFrUj+QeZO7bmDILgd1CjNHQ/7U3lfcAhSUGxq
	 jb7iAYAEkWHM53UryuO+xhvQHX2xEC6rw3k2nJ3Vz+im2uGeigEd5izg+5imbCWEcfGW0
	 6dZrjV+0WZ8VQHdVPqFq0JjYLOkzx2KzWnCchpV8UJNIliRcY9ejRZPppQMNd1//6WkUg
	 Y8eP3SBa8A2W3vt7aXZtgbugQrowxAshPOvzApqE0cpkS8ZYREVYP9YmvTtq4BAu4vpak
	 Bgw+gFOPmWil4YvWxxn2eIA4yvxcJt7eAFyyiIBg+oRF2pbeby+l4uOZ7lpJKzJu1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
	b=laGaD9LyY4klNhRwuh0CjVWaOopnOGTWpiCWZYNnIV/w36KGj/wp1kjD0yMdPmmAg09u
	 VoqDKTkXrpIPiI25zkpldtNNdD7T6w8svLlCy8bdCaLnVQptD+Fnb+1BacMGSrVl+7odh
	 CocsrKVaBsuFNF0bNeOJDMcsd//1SvxoTLt5pNUhXDbyOVBMht1eYQkw3Ni6QYvcqaLKZ
	 Tgpe+bOKGpnRCSb2zZwBkjMTnFc3KG7c42b+GOX6PxszOpYSo9c5uJS50J9iRDfDzQWq3
	 8HSpal4agxyniCf/vQRkR4h5ijdP6VTIYB6oTwhDpEZpCaB626VTH20UQuCzQQ5grKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRVgZR8l;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62D606BA52
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B62D606BA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRVgZR8l
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1335127eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641508; x=1794246308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=hRVgZR8lHjJoywhtAha5sCBvZTIrJvBXnIPA2X3B12WaAkrujwv1v+Wf6RjrjzgD4b
         J9D4NbIlXRm1eECIdajOUYyBOmWc6bI9zFh94TPd1v2SH5Fi3OiVL6z9fBeT4WNUKG3T
         25lhtr6t7AOTMRVmlJSFXe5jSbTBL6GKGg0VwxbwmtoCA+pWZN9zWk+d/oTHkrazpDlC
         IyWkogyMFqz1O0j8Bl8GrhWr+KVi3mA+jnz2RGZs5Igw9clTFwe6zJvPlaSghtEJ8Jz/
         qNvV0xGIrLJ8s1kBQEdqbiOxIRQIRbRtslH2tC24UtKWH8nQSHLSsGPXuhhcKXWkA5cW
         aNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641508; x=1794246308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=C0v4DQWgl/aYHPBJNiErlqW2FmxCq1oc9xVAKzqqc28bcz9I12cyVRpMSoxGqmhbqd
         FhpSACcc3VsEqfJqHSOr4AksdqaMZnFFF5fgGqVNBAfL/xAwsojK6TKfJlOOe86D7q6E
         tSNuCUf5fy4k1aX1NAEJFTKfAWAikK2vb7ba90jur6E3kxjOs8bV0s59bSepVTdpv08S
         15zyj3epQwzhsGZuEhG8e7cBEHV58P/5BTwxdLjTMvHr0bWIULWEIl0AnLgdhSr+xVkd
         YRsPFnQw3iky6HXSjlnrKFf5QpDERJyjeYmSKrISGO9x0Prxlyt/UQRsJJxNM5SxntgG
         0vtw==
X-Forwarded-Encrypted: i=1; AKwUvBzFwz0FNpee4Pa9MvZG6YCEuvfLHW0swN/i1b9DlvW0D495B/C5RJEQ2ImjkvYNKGCnYu0KaB16T76d@vger.kernel.org
X-Gm-Message-State: APuU4Z9zjCZ9JrrfjgVv4kSZSaUaBlW8cQv+eEKWcVq6Ar+ZLdrn41wk
	0k4RejWy6APeWI/Zw0WzoFqwLAGlfl/R9j8yEgqMj9IDaY8e6oWCIiXB
X-Gm-Gg: AYBFou1RT7aMEIeRiJA3DN7/OOQdlLz+ggVIvyWjpYb2IxF3jk328rkLSaCEJI9IsWJ
	W6y7OwY8NUATRO7HY4plmfOw/ACt0Q5uEMa0ddT0TVIaJ0pU+9QpBzNaTZ9y3+tHcVBllQun84C
	vCOt61gk5/2SsdAfZvJej3w8P5fQ9fCvHmnk2zVAs9ybLvxbJiGXxfsF7ThzLziEgvPdqXoqw74
	Xr4DbKRqQec/VLi3eagqCHbOWE85X497di4nvP4dbr6Ayu0nD6KgX13o2O4LCA6ZrVbLnHVhKxA
	WNcpBDNYEDPHbGMej65K7XLh8CPaa4XhjI3ytUH47JjX863cB32btFqASpDEwyw4Qioz7vdD96k
	k5zQX7MAQPYUp8Ai0WF6xxPjkv6dWVzJMapPOZf88D7fHwoFJtCyM575ohTv4g4ASLGJOpz1qQK
	w3K8R0cVEWXEVtHW8cAF74J/ehHPbz6r4+LU4IYmsv6ttra1bdsYvsu7V+loT7JoqjGofgUF0fd
	77NIeirddTNRT4ttYwDG81wqWhEsroQTEDw4faGBl3Gks4D1T1bu9IV6qiBHUE3VTMLL1ie9UMi
	t91hkF3uMOk47jmm23RP8jt+/wY=
X-Received: by 2002:a05:7300:ce0c:b0:36a:1732:1e5 with SMTP id 5a478bee46e88-36a4243b307mr15860843eec.37.1793641507395;
        Mon, 02 Nov 2026 09:45:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:06 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:44:46 +0800
Message-ID: <20261102174450.3000397-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

