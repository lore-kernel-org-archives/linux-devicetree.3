Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700782;
	b=dgbnSzAv1TO3XV7sOlsyRsBduweEw3BNoHdoyXdD+YqvMz4Rk1EMuuj7Dr8o+Msk7o2D
	 nj2pAVoPJ+wJWnYUBhPIWNRKz1ab9eO3Mb/z+RmcB3HdZzy4Em2VMt6r/+oGP6Vo0xmp4
	 WZWilcUgDdVJBSCFhEsXabtVST7u0UQoZGUqzAsF97lQPllzZfPTgAUyhsNyEdnVelKvP
	 C7qkqMzTrunEfgfM+15FYCBkm63V+myDlRfjZr14m+mS1Ek3pCrAq9zXuUKbCETvIJGY8
	 A3BCBNtNgSk1szGUp6ZShLOA0TUUWfcuZZ5NlDyOAMKApWjzcEsssm68XPZbRRhzQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700782;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5pFjIV7o9HsajqxA771v2mYVU2R06JQWgxnrI1jbZX8=;
	b=3Dbxgmos7LfxHxzJzFpVQQaqidam9afmYsDvXyBfBucV3uho7RyLQsXdTo9vu7kwR1q9
	 CJhhWzy/LZYCXuSKpTYaK0fStB14JL5F9kBuyqjw0wEva28TrQr2zfXltXWdhfr5BYqlB
	 n1WKyu6OhDsD5QVRv3n8VgP9MRiySYgb1e/i0jtcrlm5LGcik7N5x9Ob8GyKrpevn809q
	 OeXSadOYJ7RLVXReOeEmdQn7hJU6uLGaZHohJuT+952HkILO4AHf6BLdCdrdEk2S7YxhD
	 paFKL1YVrfDXD7JeDrb92LDDxI49k7eOhUeY85nGOpKr2O2I09aYpcWUbRCb0fFaiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKQjsXEt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B154606A31C;
	Thu, 26 Nov 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKQjsXEt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61E21F000D1;
	Thu, 26 Nov 2026 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700781;
	bh=5pFjIV7o9HsajqxA771v2mYVU2R06JQWgxnrI1jbZX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NKQjsXEtM0n7iVwbbs4Qpg7fUooGGDCuAIsqBZw/ujAUTHqIv7JGoUrzWnwg26Lbq
	 gj6D/ypPLMxHSVTlaKa8Zrtd4dC8ECIdS5HKH9ZdWswP1PDayZIvWQD2BO7Z4X6QjZ
	 oQBSxmC5BnIN1kpws0mh1RGh7FifLr+bEHnkpbYoW/23YL9viffHOksrI5t0HJRkJ9
	 nQFQBK+BSkfXQv9bXAvdTgUZNOHtPQSBiHUYt4nhWSnM+AVRHseTUMe97akstAgW98
	 uRPtsyPCp6hMAYS3t0bjwyGl/MfnsG5ZkbgnKuRPtOwuIqq1Ke000s50q6gz/UQx+Y
	 IASaaC//GSkBQ==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 09/10] arm64: dts: qcom: qcm6490-idp: Fix the panel reset GPIO polarity
Date: Thu, 26 Nov 2026 15:45:07 +0200
Message-ID: <20261126134508.320700-10-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261126134508.320700-1-vz@kernel.org>
References: <20261126134508.320700-1-vz@kernel.org>
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

The RESET_N pin of the NT36672E panel is an active low signal, however
the panel reset GPIO is described as active high to match the inverted
reset signal polarity, which was assumed by the panel driver.

Now the polarity of the panel reset GPIO is enforced by the gpiolib-of
quirk, so describe the panel reset GPIO as active low to match hardware.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cb90a83351c3..ca5c868be495 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -652,7 +652,7 @@ panel@0 {
 		compatible = "novatek,nt36672e";
 		reg = <0>;
 
-		reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
 
 		vddi-supply = <&vreg_l8c_1p62>;
 		avdd-supply = <&lcd_disp_bias>;
-- 
2.51.0

