Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641517;
	b=Sn8QPUv4SRIDitzxfg2wCj1JfNr+nSf8A9mGLpVeA4Q4qXeqfSc+PCbxn+0YPrbXWoqK
	 bcuULO/Q/FF9utT1IJ9/9kEI8uKwDoQkEVkgeEMi2g/prwOCaYFtWYstBtVvBMGpylXvF
	 Nj6oVwvEfbM0yx6T5hen9Xtz54B+4FGLaJPoNw3UmRrhsFRIhqWLbPWClwDh+1o13MVvi
	 HBCZzmioTIYDTDdU7ACLtH8y2Z/+Qtr8XNYYe2awDdvmLOVBQQNOU2fJBMl/RQNG7ecQ1
	 XzZYh2vnzPemBj7FNSWASS7BwA7Nk1uhZhy1JUtJRVw2QRGPW3Jf0RkiRi3WVpujgmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
	b=zccMFPZZewME+AcJ7aN6adxvTLtqPU+pqXDfvte4yVQwvdPq+uWuBznHnN1KsXAcHMbf
	 S/ylZAQS5USVeK9zazvrjxEdoIUuvAhhDAjXPFYaHmYS8ZgdGl3nw134cNtP2ItB4kZy0
	 8jI8WqlPLQdTg/TNNDak3hWOBA5vkvP+pmzhNmNfc/YuRLdS83R8ROeiEUcn71dGVyJi4
	 d26HL+Ii5PeVEUGggASl7OluDc9CKb+OXSi+DP8gts7NIEIMez2wZYZXD1uJVDZKFWghM
	 SisdhDzW5iWqCLpHGgjDYBexmh5ovv3MprmERmz8NhOni3C8cjDHuspfltt3G9wshrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcfWJZlw;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95B606D828
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD95B606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FcfWJZlw
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so581186c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641516; x=1794246316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=FcfWJZlwlorXOdwsxhWcH9+liYdbhRZnfXp29VOEP3RP6t0Fmdj8AeWdxNMZc3KVy9
         Dyep5PR/joW3owgfvwUwR9tVvvVN8AKy0+UyzTOShSU7F9wn4yh666jjxzDBnoQYnGDL
         hnGCFDjyi+VLr+PzDlITWWHzV15aQtk9M07kcW5Nozj9Dn1GxcHH7UEmFGrpR4gO7Rtf
         6zFFC/KgIq7PCvcnzeI+47NPkUPslSfv553bnI+tuAPNkbinSkC/yR0/0kdF+Rsbqv6x
         10nn+IpoHCdADQE3QUIXz7DoyY5uJkS6vjs3MMt+bRpNa0r6IwlYMoyKzT2sNEyiI0RL
         gFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641516; x=1794246316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6UlseroD4jG2dHId972eYhTZmtxZYuBjJ9VhYkAhAo=;
        b=eTCScIjC1zRnE8TtGriOGcrBF/vdRjbR/sG79HWnwb0Ez23sF7I6ncWvbsuTk2F3M8
         v10aRpKM+usCGZnwX+zRjL2h3+WUtOl3ftjlNF1i+gg0Se+dQcJLChBqJ3m7oZEAdtdo
         h57aGB90o429IB/MDiw0tYz0NAqoBa/Q6vmOh9opAKOtQ3YasvDBugbrWkqf+TFHWLye
         J0OLM3Q4+i2mPV0PNTR/L2VcvRMJxrLxYLEZMS9ISLHPMibRb8e7hLNc+lnufP8wWDST
         6u6v12ZppDvwMQxDt7FPUS4cBxXAVzpSRrov+ra4AVkGo8VholplG0k/jL9MG5swAsyL
         AS7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzACYa8ZoTvRNmBjrBhMFsIhJQ/U3UcT3wfJbmFm6zgJ2JIl9Iudl4KGceM3HfmvUG9cXUfM17F1/BI@vger.kernel.org
X-Gm-Message-State: APuU4Z8HIMnVXrBo0jmwyfWgp8/gBWjMPLQWeQ6upMk806jpjCncqW8S
	hFoL0ir4I5cj4V+J7XBiAdxtSjxTsN152jfSzj8R0fRPMKrP2ArL6LEB
X-Gm-Gg: AYBFou0bBPJ2XHJKVuYfK4eRFHJSqvcmRbgOOYUWV2b+/jBNeIRCgTDCVnGPQzK6df7
	xlXlfGTPU/vxcZhTucPmpfvr+S/O9tM4hUosiYv+cGwAzYSrdUMYD1E/PWcpfX2fTkYppZFm0YG
	1d96D5vREULG+swFM8fFh3j+bpovXZq9Ndux/exn6MDE4H/R1GBDeYykysyjlFxIORK+pTCKlZd
	/FMLEtZXtdQTw8oUvFd2/gkze3uD0u5YH+onnWSXIyHsIldnupYgSnDrA3XxPc+ZbUaDQnSKYMK
	um+s5cPyoBR3zK3wwXH9quHt0TAUgrtyjcBOJVBCSGv3cEz8nuzixjIbE1q0fGKRbw1ZZCwKVoP
	VpqJjDgZ1xsDvd+ihZ0QcCESIImG7e7O4HuYEOle42js9/R08UqPLWFvOLByxni7YxwYFTMbvxw
	x5fGwuITGEjXDYtRMnHLwpx5KObakopsjY9J/W+TaBILj++f1UAUMohmw8Wza/hqGVcjJEIj5i0
	YLxy9+mT+WjIe8a2gI/29qFqii6F5hLgcrgtC40yRQ6Ml/VDfrQvTr6plmHyMoiGe3d0XZEm4za
	UKVPefaAm0/FLuabTLx6bGzVmjA=
X-Received: by 2002:a05:693c:895c:20b0:359:ef9:9be3 with SMTP id 5a478bee46e88-36a4236a466mr15885436eec.11.1793641515587;
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:15 -0800 (PST)
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
Subject: [PATCH v3 4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
Date: Tue,  3 Nov 2026 01:44:48 +0800
Message-ID: <20261102174450.3000397-5-coiaprant@gmail.com>
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

The RGMII WAN port on the Ariaboard Photonicat uses SCLK_GMAC1 as the
GMAC main clock and SCLK_GMAC1_RX_TX as the RGMII speed clock. Only the
parent of SCLK_GMAC1_RX_TX is set, so SCLK_GMAC1 keeps whatever parent
the bootloader or the hardware reset left.

Set the parent of SCLK_GMAC1 to CLK_MAC1_2TOP explicitly, so the GMAC
main clock always uses the internal source and does not depend on the
bootloader state. The rate assignment is unchanged: SCLK_GMAC1_RX_TX
keeps its rate unset, SCLK_GMAC1 stays at 125 MHz.

Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index b719d5b661c43..7e0a2ab829209 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -285,7 +285,7 @@ &gmac0 {
 /* Motorcomm YT8521SC WAN port */
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy>;
-- 
2.47.3

