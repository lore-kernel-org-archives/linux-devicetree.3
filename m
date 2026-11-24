Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541549;
	b=QwmYS2DQVbadZM3EyK8f4XK6G24gtZ3y4GrPFh+FNonma7rJNe4PQ+q+rviaj1wFwI8W
	 mi0r6L91tiRtV5/r1AoYalHfUGG8AhK612XgyTDE/nQa/fsPTf6GQ2Rua8q3lmAntOoJd
	 /+E/x3yXgOrMylN2rm1h1XMY4Bc7o3oWYnwmixDxF0+cxClfcR5iUdTgzE3DLfBGMxd6R
	 7UZkc1Py11L1HF43JAAIltNXQxShGFxxcIB+OW7mtUXKKMo0jm1cmbqLDzO86KU1oLleW
	 2X0l6pQA8s+2M99PL8dJQiD0SRb2MuBqXvZIXZrbiimyUsCV1NhXzkfjGpuG/VvIWDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
	b=bsPeizvFb9sX/wyHjv1H8U6UTBrm6zBro4EJ4PZweooV/sIK+BNWBAQ7bmiGaM6eaapQ
	 jG6G+Z8xrXzDIMYm0Bxub4wJyz8PozNiiq2w61wj8Jq66wD3NM7QiItU4LF1y0HbVelJ/
	 5BO8KrBOn7yBmDxFD4bK6BfeIKS8olOzr/Gctlu/h6E2qRzR5UnAwmILH/BF0l99qZO/Q
	 WbhwcgAbdz7SrEpOsfudKWXN75VHUWkcqUttxL/lXjmoGGR0861E6kTZufj3GFjfrNdbO
	 8aiyAtXq3/Nuux33zSC346jVQh60Oi49uVpOz54bd4D7U67MxvpZbgXR0PnC/udLKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B460A380D
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE3B460A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CAzlwEmN
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49a92144733so2362771f8f.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541547; x=1796146347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=CAzlwEmN9dC0GaiVbvr6PRQMqbM1riHbYgXNkb53ws4oCaBivG/BoCh6bN1Sw/ZEHC
         w07Y5Et6b/7Vwgw93y8Zf9iNg8vLY94qHeb9zERCMCMU/gbsQk7eRXSLhop7B/BBXFbo
         r3kXgiOfdeRzVurOJekr/lfLMZ7bJwhUHvdi9zx4ADlaWpCBE6sElkHpP0oMyTGVk78T
         JDa9oMJobNxa685jtKfLjKFNv7bgE4QDUJ2lh6gVwAGC/sIqtAtVKPd/R6WShfIj97bK
         k6JI+94y8BtWCVvlCbOJcO/Nwmuty1yIT+ES+lJlj1cfMDmBNSk6+eqeEPHGwxq4uT2h
         5U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541547; x=1796146347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SL1KT/eGq3EnDcZK3GAhW4sKp/ckh6MgmCYDRbhWdE=;
        b=2BY4xtean7vdaW9cm0ilrt63mIGkbAkfA/8A1OxZSiZxtea0C7a/uTyeDIAKRJdWaj
         jxcg/TRrnq0XrhBoW/tP66jTlU10YjDi9/NZMMUv5ZLM+5XrdTQ7Je/thF8Y2f9xgrDF
         27QGOIk2JxrPye8slcjxHTm5EgjZKzGi+LnkkmHO5ASkB0mJZwjkdgzzIeaWfY9qRqvE
         LkBLk7XNnz3/0czoJZ9gnHvuAnbeyQhoGAPAook7EeyZBe90o4MehdBV8TN9CnH2+rdy
         JHAmKGELpf/FkixoSm13oZ1kdXci8dPx1elaycy8gXRAWiRar543M55KWPQPaWARYAIh
         vP1g==
X-Forwarded-Encrypted: i=1; AL+hErHIAsSIxbEdpflqqTno3g0RZQaBrGLtJa9PLBX0+cT+lqBOJz7ijX8lr6UtluizdxYc8IZJCTL8O//f@vger.kernel.org
X-Gm-Message-State: APuU4Z9XS6RaCAp3MkZ6LmA0DbWVGEg7H4voqaHWK48NPg4B3dvUoHB+
	LlRfKGclw3DuOyQW/z9dd7U7nIfT5y0wcRfZpnZpdXt9DP4aRjdhovXPnjMYFhvVfnQ=
X-Gm-Gg: AZFdTZeoWKOZGuAxSzDQH9iznTOaUDaPs61hgxbQVNwDPfkQtmxIIlRvKe5+IJexaMX
	iksAngY1n/Xf328G3mGxp7UmJ6LiMq7qF9etWKh5AHvWNp27pDhgzECE47CEl9lg5d5OKSvPmzr
	VPM2OwxE8gkco2b8meCXyKu4RM86+ZnGlik6w7/mjKyX7nOSOkNkiRgNuXS4e566ym65XUaO9ZY
	oQt4ANEcIN9EiQ0zwp94nW+ZV3cEWg8zRUMjlOpeDtuV8c/zgDxea9kzXe5csBlZyA1Ss7HDUv9
	KncqFpb+e5gsbqmb4+/ykN9UDBidGzjz4KSGwA90NB+fnjldT+bOj45T1wYW3+TUquhO1kAGcMV
	mHfsxQWToe67OXw0B4PPSfZ+ETox2/XBO4VFvGARyy2Z0EGwf4OwxuIE/53zsQqEts4+TVdCxuu
	TqmQTKj3YSw4sKMexUJP5l793wP4QhH5/CsxxGWUchCI+Nb2VbcCje1McSRPVHnlQ6iBJUIpefH
	yDZf+LcH38kh4pbLHXz27sM59j+i/CSUVbnoOvnGWWxf5uO8KU8V0lomTR82Zc1dYkKA5M6Wrbd
	OQc6iSpRpdjoIt2dUc9atXVXq+HgBdeZx/NwOzTuUi+BLEjI3A==
X-Received: by 2002:a05:6000:2383:b0:4a8:8004:5261 with SMTP id ffacd0b85a97d-4abb6d04250mr34327691f8f.44.1795541547074;
        Tue, 24 Nov 2026 09:32:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:14 +0100
Subject: [PATCH v2 07/19] ASoC: codecs: lpass-wsa-macro: handle the macro &
 dcodec power domains
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
Message-Id: <20261124-topic-sm8650-el2-v2-7-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hVFg3Y31Ispb6dIhV4lKOW6ZJCfvIzuJH+rNG0A18RE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcod3y0YQ0h2BUQpIM4apyqk8yOgOGlztGUy36oe
 7e2JPcqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHQAKCRB33NvayMhJ0Se7EA
 DFos36gYy4RYDRa7R1O6n7gn3ZjBST+lXq0rc+BtlYRhQBkv+plvM/fdkv1vhFxFcAL3LMJm26pgg6
 EAc4ea/zyMm9nLe9JZyBXI6R6tXmPSAmnPfA/pkc1g+26Bi6HDrv0w4qYPDemOZ4TR9ErrHRlxZiZu
 mpt2Ay4r42L0T5QF0jszfiuoqbbFFNGNiGzfHH4Tg0br95tQSgrAQBQx0RkLJR1s8YJfxUpEe63yof
 SC4bjrgMa0Ahd1TUkY6pTmdg+OKqeokhbO+Q/Fx/ay0lrjEHJVMytyAXvxH+PFZY2iyjXS/y9jhaF8
 VhOvgz9bAIx6y+fvgPBlsT7Dr//jgYQ7DswTbC/UxeDRt9LTUo4Mj+9atQYvyI5jyPcfTpcamZD7kK
 w6cWGJvKV3dh1t+oG9+UReA+HOfaoaTxhqTRKBcawcNNKXZPJBAfKylGj3lepPQKcOr355h5x5kT54
 1i9QipL2N1hlE/atQCVwnJqBXhn8CLUitlCjTufD97ldbJisg0H39XzrNTkk+7vYdzMqM9EbVnM8X8
 DLDZFllX1fV2ip2iOIdk0cOgB8X+pJgjDWJqUG116Z2A/oTam9YlFZUMurEh2KcRo5TI3JTrI8Efsy
 URFlBGIaJG7OAI/gE5gHeOFA3XAzLGZtxhSz552Lx6KQ/360SRc1kHU0qUFw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the WSA macro lies
in the LPASS core and audio power domains like the RX, TX and VA
macros, so attach and power them with lpass_macro_pds_init() like
the other macro drivers.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 2b63954f783b..254b8faaa8a1 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -419,6 +419,7 @@ struct wsa_macro {
 	struct clk *macro;
 	struct clk *dcodec;
 	struct clk *fsgen;
+	struct lpass_macro *pds;
 	struct clk_hw hw;
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
@@ -2769,6 +2770,14 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->fsgen))
 		return dev_err_probe(dev, PTR_ERR(wsa->fsgen), "unable to get fsgen clock\n");
 
+	wsa->pds = lpass_macro_pds_init(dev);
+	if (IS_ERR(wsa->pds))
+		return PTR_ERR(wsa->pds);
+
+	ret = devm_add_action_or_reset(dev, lpass_macro_pds_exit_action, wsa->pds);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);

-- 
2.34.1

