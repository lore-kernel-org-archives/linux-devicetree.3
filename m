Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455749;
	b=S2s2frJsMuBQSLr7XfPY0tLn3ayWUlQ8WFo4kfzB2ib/z3kPAeK/l5ku46IqxK0yd7R5
	 oKEan7nKaxEqz1dKhlK4RlwbfKZrLbtFJ4cf9KKzfbWkfFYQz0DbYKE4TUFQg3rYys/P7
	 ZYF55YHgfmTYe7Dca3N+9v/XxS/M+E5DNwKyIAgEaYvQSzRWzw58PJ5VEEyHiTO3zRN2P
	 +QAFqLQjrj1DSTJXBIsiGwUqbnW96haQkz50eQ2J8N+1LZNXbUAjFFnJZaeahpEEzVv5i
	 zI6LKYGuITonCfCYLZLC+7GFDr19H+vajRT9LikWB7Wz+ctEFYaOLiRNnBj5HpFXmdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
	b=n/wQLxRgfW5SZy4Zk9Lj6KsUnbLCLB8xUbq9nceLS3kEbMn862VxMFuaZKpWNAwxMx0m
	 DKOjWt0HeTwmwX8IrHUygRXpWQP+diZswHJUuW05Lgp+VkSg/idspDqcq9VXDVFDyXKHE
	 eI7wDXn5mHufA3UUkc9NXVjdg658FuEFHidQ5bA536Vyt0niLuMvCGWLOx1Rkl3Gu+puw
	 +vJMgZA/7USEBdZrSPC+QiY7m12PgsTUHJZHrBhI+mmUzS/c/Eh7wdLEXR3jLAJTIlRVq
	 pb7g9S7U0y26T6RQ3ItDfdQcU8cLC27fJlIxRUaDk6BRGXhZDfhewAP1ZNVpqmcA8iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLen9dyG;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A5606A332
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D08A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLen9dyG
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d68de53053so2778284eaf.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455748; x=1796060548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=cLen9dyG9LGS7JoGw6bl8+2Cxj2yp3xych94Sx7Yla3igJ6tZzdBYW57nSYuwHt6ox
         ofpc1vIZHFsJ1xWj/0nr/qQWjuYrXCnhlFd0BB4oB4VoKIl6kckAEfcOiBitDAiV3+VG
         h93LPAUXpJILeJr3pEfCdRTSlR8KfNgJlfuq9ic4lqOmPwkwN5FacHgYRz/b11yvYhXp
         f4sGnu7n4j8FOPBureCxCmaXFRj8chbk6e06PuOEqIaV+LeyNy3U6ZFf2Hnl4vwkFhNg
         KnE66QI8+ckiGj4R+0wUSyjOIMGwAPkf2YP/C7fBp7boweGjer+EKCDkbwt31kp1M2sQ
         bGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455748; x=1796060548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=GgIlcVe9m1DtppDRDF3XrFSdp7UD6IsVF9Ht239iw9VdF8K2kVkzUwAppFcfC5Czj3
         1FehAMnLjoG50Fbboj74n7pPIWYsQKrnvEY9ZFqiLIeMR0c9KUwiU4CS1v25V9Wa0nE9
         b2Mfv3BYUuPYoWhAwFnf3qBYHsRIRTvdeFbUzs948JUCt/7JEr+rKhfICdoLbR7iuqoL
         tDHDKlyPGzAMuHRzAtRF50b8J3ajkDJmEkoBCqEKQMqt+ZqCm93ai4Oh1MIszkkbWQ9Q
         84UG6aJp1BcPpLix3eacEgmU5SM4/vAbByi+Tf5vxSgkKg0rXhySu2Bd2Llwdd8eb/6i
         xolQ==
X-Forwarded-Encrypted: i=1; AL+hErHfvlWvFgCZX/LF24PMQTTug1fFoZ2XVZiZFz0Y9Uf6r0ubjmt/WYkQpZ4BMmKyQ8ijgr3qAvlizLIi@vger.kernel.org
X-Gm-Message-State: APuU4Z9plx7bxaxJJgAfeyJtI5olHURqz7MjPiRWtTGDQOe9s0at97DB
	c5NALn+4nrQKYiONpC9j4YmVrBKX0xZwIQQdtUIq7UZEyGMq1tz7XSk5
X-Gm-Gg: AZFdTZdIejNj/5pK5gp4pEU47TFmaJQyeW/dpXtAqCllv7nf1Ap51mAghkFlI+EuvuK
	7fepl8/Ye24WyaxEZkNWmZZ2VuziyGb3dDzUtrAuZFplspSCsdQLoH/8R0lui3j3eySUIGhgjao
	0a7clSaMa7JBeHdarmDLWXIZCFtVkDOFUa2IbtZfyVWwkMQmXtxxDvaonvVvX57CSk0dqTskfjC
	vSLQLI/Gw/3YOOcyqJZBuFW7qsPcnPoC+a+BBOfAwWE7mBgxGIdnc4UCAmRXAXCP8/cawEYVk/F
	TS2PvN0FnuuXXe7GejJy9FgwDS5wRguGdmeLtYkW/u1bUzQ4q1gNubQZNI4DVM4uWSGZSfCgI5Z
	Oorpe3BwKQ8VSMz7lNwaN6jh+TAlkk8l6IfN2wlcSNSNb/8qsL+oeDrJKDnAqQ1VSqLNkocTOOT
	SaWEVLf9R33XSqwW7VeXJ/FHe6rfk+MfieeLGT/FI9KnaDA44FmdT4nF/M3Zw/2zK7oidPJlPzn
	EXG0ls5aeoH86epCIa97cz+LX4ECLzaV160uMFTjH1LwPMMe3y+QRhCNHRwighUdyN0WnRM9VvN
	rKdLygwSIia+zw/Jp+Srs7CUtsMz5E55FgEYU0wUUYmk+IByP56+XAXXjwv8R5UCmPvsvA69Y/5
	6BI/R
X-Received: by 2002:a05:6808:6f97:b0:574:34da:2992 with SMTP id 5614622812f47-57a0a93033amr13407130b6e.27.1795455747731;
        Mon, 23 Nov 2026 09:42:27 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm9481238b6e.16.2026.11.23.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
Date: Mon, 23 Nov 2026 12:42:25 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
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

Document the Radxa Cubie A7S and A7A with their Allwinner A733 SoC
compatible. The accompanying A7S DTS uses the binding, and the A7A
entry gives Andre Przywara's upcoming DTS the same SoC fallback.
Radxa's Linux 5.15 A7A DTS already uses both compatible strings.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

v4 -> v5: The only change is the added Cubie A7A entry, requested by
Andre Przywara. No Cubie A7A boot test.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..c2ac34cd32b9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,16 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.53.0

