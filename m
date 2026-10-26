Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008664;
	b=UMohC+oM1HhzIAtDVjCun1soWMVjIhQx/Ca1X/l1K3xb0L3wCCv/l6Alc1SOvPezY1vN
	 hKswNq1lCqfmvayrpsO5ZjRIDhPZWIhAuUXmQ7I8ZdkI9eOxblW2mKfDLWTDyU0L5LxYD
	 TecSkfW7ZS8BCcGLIBFHP6pov7WcubjVCpT1NTQfqwmYpTacHR9xupztwci7SikLH/YgY
	 nzo6FAMdTZvMmMtcYG77bE+y/LF4qeHeOztZVPyRthU9+DfO7zj0//Iuh/jA9HU7dC6Ye
	 MduTxk4wxs+Pmweh70A4Lb1RBitNIYJNyHYWxZQGz/PIgtAC/mn781ZJnsHk6S9rj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
	b=VQAuKDegO/zzSNO+zlyLRFR81Fq23I1OHdbJUUpdHw43Kp5oykdRuQhUPfDXjN84VCWu
	 cmIWH3YBXKnsrDUlmkucEsnwiBXLnlWpxWh16H9acwkyBxTrBLMIBOvLBnxd3lxwF1zl6
	 DgV9jiqstpnju3/Av+kGMwJKmPJNyZp0jXEcTsb2fqmtGesgoQsWQrhmPFVaW7rOmVd6R
	 OBJjtw1u3RlWMUQCQhqaeuVhJAg8X6E/bgZCv413Mgwj78t3uU9mQBE7O2gSgVrrQAmX3
	 SrvTEaj3U32O+SAN+z0G0OaVS0LHYNKK2aMoN53wZ/dpMNmtOMeAhw/VOhiZn3qx1sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TLqXL2iK;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4807C60A6F55
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4807C60A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TLqXL2iK
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22896145e9.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008663; x=1793613463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=TLqXL2iKvjwSgi1h3aSaMG8WYQnNJBzAfyFbahhRtBEt/4x2PySNP9/kw4lb4lab0B
         EyTghafYPlE/WX7M4RgCQl+7aAA5BfTNaic0VHql3KXRo3ofqJHbvnUw4QnnaD/GbK/l
         s/eWxX3JY8JXDBZR2LfQTa4X+YqHMkcnxrohzDd+VSaWz/Vd8SQ+C11plgTY0E+AtGJi
         EvJzzhbGKtM0/ruh/YdYpU3AGBmgMNaiKnyp8jCOF4ju13WqHOU/zhmyS1H8E8na86rc
         wrvBUVsnBoznl5fniqVQcbUKXw23y3I/G2phdZCC/yYGI9nnqLUuZmsg3EZkowywV6Wf
         N1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008663; x=1793613463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=rPfuBMBG5PDZP/yQWNWalB9FCZiJrCCe+r9r3K4mc5cA8zhAcvTWen9BU2pTGOLuQk
         wzzedE/T85EWmhA1M+fKIh8SasyqFG+hiRw6/9fHHXS1YcxC/ZBiv0kVMr1DtyBkbsZw
         NSLMjT1/TQLg2t5Vz1gCinFKlpeduwe6DHl0ZOj6rjKIe2TGJ1WJxUy3z/2JY9YMDNWT
         WVsW0zAdvRBgtIlsOy92wVcSXz8C0dbzXTvxwbsz+YEEg6RrtKHjd2zF+mJgthXni67h
         hzxHGg+l3FH4ysamXBK/b0WQ3Fi+RHASujHxgSbynp9DYwS3kH70pL9WLPTaJ4cHsXD6
         wS1w==
X-Forwarded-Encrypted: i=1; AKwUvByID4vE5fqXXr8IzDABlnpKTAaFCt4hD0NeEzUYbzEQqib157Lb2Fxjct43RRVSaCfuNgTR7o0zB7st@vger.kernel.org
X-Gm-Message-State: AFq9FYJSi0oU/FAnaW0MlM2LKLjsqyRpfKrgTBwRGxYjmwR26mrTXkdK
	NQHp5apFrDtiQxONmXLUCj04G/PsA9yMIwVUPSnJqcAaS7Mlue3mVEOa
X-Gm-Gg: AYBFou1V3PWY92IYLPGQdP3AQEqlRooGfbs1fCAo0MPUZxQCGT73WfQZleVHgYp2pY5
	hrDGgbJd7YCPpNcLM86QfV2LTHUHUqFnZkdtEIucn0SpDqPX0LgugHaP1D8PbTabwjvNkXWd7LH
	/AmpQ3m2ErO1OrmiK+n4YWcwPdWUVWqEuMTddxPXIZTRwc5WgMUdEQxuDYWfn2/mW726nWeevNX
	71GxUu8dum3s1h0EOUvAaHJnb48w1lwwD97EPflYegZg3sVfbWIYBmdx0qTXtkk74t0AG1uANnU
	L5Lb5nM76Bn6dpZuv0ekbFSuwQ8Fv9RpmNiUhV5rOBpL35D1feH29g+qpX+D/oUoS4Rbp1BBOln
	KEQWKeAJr5GCSOJ5xuF8OspGzbyIQZN8U0Y1lYXU/bUJR3Ln3dsuwmDLGJIMlodiOPrTFwP71bO
	GTMNeNyXV9jWKZWbdm6EtdJH9EApwq9AfkX0YTTIhaFvglI2sIIeWRJseoi3mFGUwX0G75E3/Uw
	cWfoQFXnZ3SALp/eK+uGR5gWh51S/ymD+YViz+Qln2vZ6pR4gZkI0DG23pjk0/g8C9trc9gxwou
	YdzX7uA4VXp8Lv5Dl3XHjbkv6oBhKBq6aIfgwqrnP4zkLCUkkqmy4RJE1RwvpcEi5GKJUaLjK9C
	7UnvpXw==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr115674445e9.24.1793008662683;
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: airoha: en7581: add PWM node
Date: Mon, 26 Oct 2026 10:57:12 +0100
Message-ID: <20261026095727.31708-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add PWM node to control all status leds generally attached to Vendor
boards.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 3a4a4fb0eba9..760f0c3e6090 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -509,6 +509,12 @@ en7581_pinctrl: pinctrl {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 			};
+
+			en7581_pwm: pwm {
+				compatible = "airoha,en7581-pwm";
+
+				#pwm-cells = <3>;
+			};
 		};
 
 		i2c0: i2c@1fbf8000 {
-- 
2.55.0

