Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701003;
	b=3whT8x0YCVYgjz+sSrUZAdOWOx/AjaLunN82RZ/ljx4VJKkdcc9VqIaQHHxnZgcJ7sd8
	 5Cxq0JAvUvKDBsPwaR//uRUvHo0Vc9chaOHY7zlHWzdjMq40xw3lYiTWAFLVLOB5Tu3Ds
	 iN1lXy0KjGWUOSE+iYLC5gg6Q1txv8dlUJm7AzK7B++yCWq+9D/kgujHBbVdilahyjbem
	 1MK5xaJ2ARkbMF2gYUtRUgdjMuNLf1sRQabqYdAkysNXaBI9iK3eGnWzFBVKSUjzBhFzn
	 PRpHnulysvZet5WNKcAR3LqXXM3e8YIooggcymN6BhqeCtgCW6vXMy9aC8JMQVS0BGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
	b=jTRUiSQ2/odvSCJEacoZAfh+ECvBBOrfR7di1n0K2X5TQ++nh5oO+Ghy2BxgVIYpM20V
	 qPQS0YrgRpPpbMFbYh/cMbsSt3QZD788fg6dnBadluBfWX7iXh2N/Yt5/MMycL0Ja6jX9
	 YBVnCStdCUTBClOa6qdUOll0eGcqmZh4R06YffhhqBQk64QWtmknT0VfNOsk5FB1n5yIf
	 hDXC6KUBbft6MAFxMc035Eo6Ih4pqWn8D9WPsC/vDOzDru4EmHVsa6rS4zNZtmyn2ro5+
	 0e/ThILUTE3lPmrTkNS5x6NgNEM/sN9//1MPSJ/rPtzRcXnY20k8aKHePKtBhQq4PZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E06606A333
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E06606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UpC6z3Yg
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso385852eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701002; x=1793305802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=UpC6z3YgoFOp+e9UwyTUdWVzTO3KVRF6+aoI5mDP5mAk8QvN0MDrCfReNgke8yzN1X
         /ryB9pG9Ww14dsp5cXojQQnip+PAON29ABfumIkpQhQJEHEgnLoU1mQXhRsKoJ0NfOwv
         H0gS+G9LCnCDh2v3CTv2etn0uCX7nGDtEysgJrkOli1iw10N4wNJ/7y0zaAhE0Z0YPW1
         DbIpRe5CrGrIjz3kmH4sY8LMxQr/QVImqYc58JS62pu3rfAAZTKszIxJAt6Tz4Xc5qFt
         vqyubXGNLBCtjwI6hesqjlFq+nZWfNi/cwZMn+CrlxAi9bYCAIAV6t/Msc3y30y5VUAl
         jK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701002; x=1793305802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RhZYwAvAgAkKH/b6lApqxbYEpk+yOAgCSo7pvbrCu30=;
        b=g+HjPKxAei3ytwqN810c0l1GPRSphkxbd5B+H73wQBrHn9N2wJwpx7yuHhcbYfyrCM
         HH/YReCiK0f+KelnqsUnOvRHm8wBeqd+53Vab7+DfXTGy+XowIAWYvaW5vdOihnDZkdI
         Zq7fLiBsdLGhs7g946oFQ5uR19ArorW4J9oeDoarnGkrE6l3HtqtFFSwI/yNI96wfU4L
         hzGiyj2ZYOTpi6KnNgnJq+mYeJyQmuPqpMqny94jPtiD/75jBQgJEYjM8taAUvU8VAZ6
         Ptsnq0vl3hsoXLJMN1aOGQOQhRQSQqPfpjvDoGcCfPiSXxRH1ZrjBodxK8i7t+xF2Qx5
         E9iA==
X-Forwarded-Encrypted: i=1; AKwUvBySNPoVaKtA4IQNCoIKddZN3eZ8c4/Y73bNOg0EJjt0mywlKo08IWUrA5t838xEOpsIT9OfdLpS4wuS@vger.kernel.org
X-Gm-Message-State: AFq9FYLXWFdiJNNgcbOHvibW7QzXpfUXQGO2Jdhv4s0bvIWxECdDhNBo
	XfpNAUDoXxqcYBhsa3UTSRmmBqZLfoGDxRTobAzmm07eo9SCwHaQ4sm8
X-Gm-Gg: AYBFou3W+WTXQpbJpc8wCTZQQkfvmrQJjJTCHfK0xzV7pp8XLzm/RPxRsTaU7fMG2Os
	9o/Eyutm4XTJIySE9NVdHEzCvavdPFckkuF7rU8N69u41aLF73hDdc9PaBKHDI228Q215ChvyZe
	7mofDLVNDz0HOBk8VzBd7xECykaCsxiIcIi6x7R87mEuExk8xxrhtNiGVLB9EBbM9F7AOwJdfjj
	e7nu3lrGH5YKhONBwJNpES+tO1zkE7SnexX2VFU8g07xnOqjSCPc+5O038HSOavXQXxJOxF+sI+
	PVSz4pErRlahm0ktlBsQ1UlEW8iatT1QqHxSaP7flwFC2367V59+gLywS3IpnLwW4iYjTJyanU4
	PyWonL2TckpwudJW1pgLijWoX14/JUKUVWjn6L2rLcnBu8Lf2vZdKAZLF8d31R6z+/HALJeEXeT
	fMPgoHa2N4VIw714ezyFhYDHOPsWVamUckHRX97phlCeRRA7zJ07AOdyAYEGxicIApFwhpT1che
	6CBGyRHP8BaakGa6edW6NnP7yMGcQ5T0GzcYTqzgBjPbXQMpGV/2GYAXkYcbcjOgVWK0UmkDoIR
	dZr8SHprBb1DZODFVvXGWiuMHc/E9mWwIl1UrLfumME4
X-Received: by 2002:a05:7301:700b:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369d90e363bmr310924eec.2.1792701002252;
        Thu, 22 Oct 2026 13:30:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm283894eec.17.2026.10.22.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:30:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 13:29:47 -0700
Subject: [PATCH 2/2] dt-bindings: mfd: twl4030-audio: document preferred
 name for external mute
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
Message-Id: <20261022-twl4030-extmute-v1-2-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
In-Reply-To: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peng Fan <peng.fan@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Proper names for GPIOs should use "-gpios" suffix. Now that the
twl4030 codec driver has been converted to use GPIO descriptors in
commit 178c169a30b0 ("ASoC: codec: twl4030: Convert to GPIO
descriptors"), update the binding documentation to list
"ti,hs_extmute-gpios" as the preferred property name and mark
"ti,hs_extmute_gpio" as deprecated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
index c9c3f7513ad4..1d41f582261d 100644
--- a/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
@@ -39,12 +39,18 @@ properties:
         description:
           Enable the use of an external mute for headset pop reduction.
 
-      ti,hs_extmute_gpio:
+      ti,hs_extmute-gpios:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
           The GPIO specifier for the external mute control.
         maxItems: 1
 
+      ti,hs_extmute_gpio:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Deprecated legacy name for ti,hs_extmute-gpios.
+        maxItems: 1
+
       ti,offset_cncl_path:
         $ref: /schemas/types.yaml#/definitions/uint32
         description:

-- 
2.56.0.257.gf7497c7d27-goog

