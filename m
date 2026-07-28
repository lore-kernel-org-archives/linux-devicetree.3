Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797DE2F8EBE
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 02:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206968; cv=none; b=O7cVndcRICRbBeu07ZFdkrCz2JBRYV78C8xB1lbWNOA7jDFAirrkVD9FeO01P5xrYDLEjJfr9/WgB8LDPgqJwB3DkIqbSuP8BHjCAjFKAgik8Ft+kNMWe2e2aRP0Ft2NAIZDNo3UpnCy5gidXykJG8/ulAJQzPXKprSqD9WXh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206968; c=relaxed/simple;
	bh=eMDL6R7A88J0Kxgo7GwZVeOD6SjDV3c9R/PY3h9YVK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kD5UdxJIxausWbP2qYroUgzQ99TXpnLAv2d+zQ1lW+N1rrNx9C9W7T7DUF++m+5HRbgVCgxalSHveO9BMfujdI3BoPOCtYxwUTfEmnVw+KINABCmPF1qrzIaXlWSMWagDr+08w3BqJCyqrk0BUKfPXfu3qaWdEOI7qDlHhBwuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dht1nh15; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dht1nh15"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81eff3ddba4so43355697b3.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 19:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206966; x=1785811766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=dht1nh15zkFWW4V2Fsg4CfYh/sufn/Yb04cAQcQkTVAwkvIz5prQs8UXRGQwOZxTn7
         uf54SALe9QtCXJnXN5h6DzFWWCgtw6nyaVJOEf2aZGjEMSa3w5T50kwmRjnmSUxWuNcw
         w9z79K11zgbTMuOBeRHUp5L3wL6jK/Pv+Lll2F91dt0iwsnlYxCQwAzG6Wt2XnMUYje6
         4ePa5YlZEVOpQI0SsYjKIg8XqasTVre95zRnBlxC/5Bf5akagCEoPHjsDjstT7pJG4P/
         qcQOzvg5oROlvrUH1m9UQluN3QjYjLq/mkREMG7ad/2XEkYJUC/675haDdq4V5iyCL3f
         +aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206966; x=1785811766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMrIwKP808Rw4T3v4dtu26EGLZbL2Ysq//n5nDtGcIw=;
        b=GWaoLHjoCz+snVE41W64tYTf2rVVNRTstDiMRkkH+hg3L9O2D5JIZOgRcYNOaHfDmQ
         2Jr98PmSi9GKNGgWJ9ICVfb0zzMvLDPxi8KjUCydtnsGW3ZRCg2+8C8bNOjb6CGsOx/u
         jVGMgK0DpEPNmxFAHGY3MvTPmJGbpcZNFCHJ7fB2W7KuZEgjIIqB28LmCB/YlXYhSQpB
         rCIa+t1Xh6YCUk7vklkceP/FjRX1rYtJy8lvDsMyT/N5Rx/xy8bC7nFCWoJYETGkwzQJ
         +IW2Gl7fKnRRSsTPaSaJkD/vXPHIOYQmXvWc4ISwdYj2ZmxpBiRJJViIN8+pVfNm59Do
         8zGQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTrA6qeW62PwicLfSqfz6IM3Bjyo9ySxovGcfwkDY8756W7vIaZU0L9G0zLQcl5O1MbVB3TCCLc7Zn@vger.kernel.org
X-Gm-Message-State: AOJu0YxFT5e+KM+PbVIOPRxrOAQTAcqGcEejsclgGYgzn5kH0xRpfaoL
	dUQUZl93Ek2O+8F3zHp+NzM8m0044BNITkI4apu0C6aIlbhDOi9evkQZ
X-Gm-Gg: AR+sD13wECIhTjyg99TLjzgPuJeQZBHAdDMMMatpqriBnAl/vYS6zMWX0nuNN4KnVh6
	+h9PeAAh8SzMkY/qISe+ktWnlNMHEClYVsQ3/wr9HC4Lhp5VayJZFPTuJHsulcmkjoWAc7UPhZW
	0D64JJefzBeweFPID5VlAH93rJfW9CkXrf6gyCS7tUsFS51OlTxrIfnXiBdkqE473Y7Cw6OxS2Q
	x9p2Z6nIHerlCNNpmV3VFiFfxhFXzJonhOazvL2jn8nsckshkK2dBzxaAYz7JKmn/aV267uuMst
	cy/FBYBGxDvOmAadaWMqGYmoPvYmi9+v4aejyYw5dfPOTyc+aJqlACLieypR1votuRbPePfd3tn
	TICJ+PgYgktw4gh8hf84RVJgSpbCH4G8ndojShzXbG24L1fuIw+XVaDxj41vFDKtaf17lU9u2o0
	7+1v93Ou62yawqoPFUjxWKid7XLOTbTDTDZzLT
X-Received: by 2002:a05:690c:9b0c:b0:81e:695b:585c with SMTP id 00721157ae682-81f990e2287mr1923257b3.4.1785206966382;
        Mon, 27 Jul 2026 19:49:26 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:25 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 4/4] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Mon, 27 Jul 2026 22:49:16 -0400
Message-ID: <20260728024916.993224-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728024916.993224-1-utilityemal77@gmail.com>
References: <20260728024916.993224-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Enable the CIR receiver in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
[justin: move the PI8 pinmux node into the dtsi patch]
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:

v4:
    - move the PI8 pinmux node into the dtsi patch (Chen-Yu)
    - add my Signed-off-by (Chen-Yu, Andre)

 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec..994f1e4f0ce7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;
-- 
2.54.0

