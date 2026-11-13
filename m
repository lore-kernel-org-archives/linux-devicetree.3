Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595120;
	b=qS/quNeozzeM6KrgwnWk8IbVxDLepu583dFbKCYd4az0urO0Wb0xG30dg4xGz8fPBYVF
	 omPHfEuCw4x6eNkxFyeiXfJyHkhfBtRTzCgf0mXOOd89LQd+0hT3550yfMaVS9sxNGGpA
	 6o97xuWCTorhQQzWqkvx0BYTPfLtrhgL1OFo1kMYw57kJdZPIEjVejxjCGHE90hecHfpN
	 hPZwdkZLpfgFtbWzzYSZ4eI43dR2V9iDJVeC9z7mym4pvkN+9kyG0sbTwHfwRzfx+TUb2
	 sa35GT4nNnCCIIcMUjj4am6gVUJpOh4ed6L/GqMOKgoA7SqZAhJKzPXgQtw8Eme1FWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
	b=T5TPrcu5Ala3J9JAwFFre3lEWYnq7X34+q87EPQh9fpuO5Babp5gQS/F54zpN4Bn3a8u
	 y0bAPUbAugbnaC3qalh/DpMGBht7F0mOiMQ8xnZD4gHoq/ygq5TgNZnJaklDCNW64uB1c
	 fVprJyrFosp8wh/pnKoxsGl3JTtKGAlPfwdlDhA+ZBk4GB6TRbs3+dIm9EhEYCg5vOCYX
	 medvlchn6lukTmr16rk1Cfcba5LnkWF24RpdlhbrzfuIkKgScYV3I8voyNIEhKLf0zMW5
	 zhq1L/pRjKd6O3kz62n4vfklxh9DI4mMLX/B0mJgUMlg8hFTvFoEcCWmjQe0d63k6UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D009606BDC0
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D009606BDC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so8176955e9.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595119; x=1795199919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=KLJM8TPgZL5z47JsZHk78jrLrCIcYspZEstNhGvRsclZ7pYYQM1DRGXUCM8pMkylkg
         L26SeRrRErzk8r6t7xyaAQOehhQEgMDgUKTqpmot0YuXZhGQE8MX7Mbf9L5hlezH5FDU
         LxetkSDrfNL7+9yawDSPXlwKswl+EYxCbziDLjTYqHaQN6fYbNmKj0qO9m9+eQq5btOy
         FqQYpnKibQ5Uj7qnkDfcmltCHgk9fi0IG8samb2jfxZWXpDvvHJdh2iXic3JaqK8rIf0
         M8dnt1SAfSRKI6c61AzUZUQtWxivcV/kiYFzeoOHs+YgOduKwYvTPKFL2i4Wg76CZvXA
         /a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595119; x=1795199919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=sgiJlliCTwMzi9RIe0rJCcaP+vTEJjnC0am5kqmva+e36p/dGM3ChOjSzECxm1Pfp6
         jCYwXX2ThnqgElce3ZuUmVZm2CtYWVQIz0M1pD39EIjrTDByouOAhav+QZ+jBjWw3bMW
         EkmrgSf3klVUDRgc+2XXe7f7zNgCtU8RNBCWXP1qri5Yf2b2NvRlfue0zNJkBpOwC5Af
         mjVKBvDvvxPzx1JiPk11928nDq28n/bDZgoQAvl8a8YzbuSMJYb94+Nr5ogHq59c+uh9
         9zET6MZLZDVOqOjuwUf8UgUbJD3TLc8G2O+AArcCDCHwU0iyDCI6DHq2+i6dpwiCgQ0A
         IyMg==
X-Forwarded-Encrypted: i=1; AL+hErFgBUkE9d766UXNLt1xUp+J+RaNPozZvu6miBxor/BEY6zK7CB77LW1ys0QKp8c2kc0fHVWF56Yzf3e@vger.kernel.org
X-Gm-Message-State: APuU4Z/6FVlrTR2p74IT9ldH8RLWLhjMz+52X61+Bn0VJSlsaJ/4ZrPh
	81UryXcyyVgmSaPo6YMAMiqf4eD5ZTj1Q1E0HLGG4dYBiWwRr9Uh/2a9GbyFPocBOak=
X-Gm-Gg: AYBFou2hGR0NETQhCKOd13pgfJ0mLnAvx0u2HICF3NERmqUAt5wAIncJbovWhtlFnEc
	EZPCMGlvCXvhbJsgA5eMU8BrZWgWcdzgSytj58PFK+k4iE+gtDxBroKENwYEFYJ2al2J+2K4DMh
	VAIBVYLt3bQzc2qYpjgz6DggohL11AOh4Kfpprw1JLoE9q4a3/bHW6mHGxcom6HhhozRFkcEzYu
	A/Umf85rbQZ5DG/Bgm0AoLBgbJGmMDxJm+/FujeRRx6qHo4/YsFdDoBTqMvJX5IwAC2gYHk3e6x
	g0DCAem7IYLzvCvUAtoMs/4JtxRDUsLLEbtxOpobkpubDznJbqTAAtIZ9kH1I8zLcQYoDiiA4Ux
	dYThXXkUdSmDh8gU/MeRA+tZbT7FrTWX3YLaRQ/a53Jm+XXN0Un/SscQzSL/eqki5o5G+cToEH5
	9TbhWPVNDYEE7eZTHa9WUczHvmiHKJDk/aGxgmIedv1c9Gt82Jmo5bzI06ABlQpQbKAUuxNfu4X
	j0cF1MrJYI3sDYYlXctP5DDd9pOfbrM/kpkr3RrPNGS3aHq8Q+Vy2AhyHU0TpbjvxQaodMfWSuQ
	iLC6bhCS+PxFhNj8ZVi3Ihn34K92McCrzZDe5n390z4GjKCFtXpp33lygom/JHMQ
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr75652835e9.26.1794595118599;
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:17 +0100
Subject: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when
 ADSP is not used
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
Message-Id: <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IYZzKllyENGnlE8jlO51eH0Je07L7Rrz0zPT4BMmGvc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91keb6kA1VBPnnlaUARHEhCdJgsbPCQ1ljeiie5s
 R+jFRjqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHgAKCRB33NvayMhJ0UlNEA
 DIDs+OuP5YF0RoJBlUL5/B5Wlya5YkksFWt/RKxLIu4fFxvQtEHbQjSN+ANdWJWWFIkNmDgTu4/z6a
 Aic/L2475k24voVJK7a3a6SCUlJd0Y1DMXJZVcT3pavimXIQr77dtxTShIMI4K0q+vc40XS7z7WhkX
 PLjGGDbmfdJo/2RYfkZi6+yDEVPzYpqVxF/TwCGCGrHg1w1m247Moj6umOYseWTF3R10dCM8162Fcq
 m9Rc1e7K/V9FcRXBwXaiyCWaKTd4+MloE8HdNcFPfmK3WEuFgXe3ADjIBvxJ1dlIvGMvp07uQ2IGaH
 SS5LhyFhX5wjNJQpviRheXLspz9cKDPoKqq1/SpNvSQha7/fZWEun9O7YBHaFJvULgJtnTQOmp/aX1
 NiAbHZWVK7Ve948pl5641G1P1556n00BGKX820XlkW8XJEvsnfZTv51hcLuT1clwmbu7qBUBvd5Umx
 hYyKj3XTXLrlG4pHyuq+lt1SChrgf9hLXr7Z1W0NTo6gLm89hNLJ6Wu0xGiQMgRstniZ9OemXEC1MA
 JRMdN2DkXDohMhEZ9o68RZkxRTkyy/pFW9ncp4Z1LIwLeYEiZQ8ypOnqHFPiYDhPPglSxIrNrEF5g3
 V3f8xuKwiEtb6aUFAMBfVfNiWT3F164EYcWURan4J2MWsMDnCm1xFfgyNsmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the LPASS TLMM
is entirely handled by the OS, the LPASS TLMM block requires
a different set of clocks and power-domains to replace the
clocks exposed by the ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml       | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 1bf08860a4ba..4c54f873199c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -29,11 +29,25 @@ properties:
       - description: LPASS LPI TLMM Control and Status registers
 
   clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
+    oneOf:
+      - items:   # for ADSP based platforms
+          - description: LPASS Core voting clock
+          - description: LPASS Audio voting clock
+      - items:   # for ADSP bypass based platforms
+          - description: LPASS Core voting clock
 
   clock-names:
+    oneOf:
+      - items:   # for ADSP based platforms
+          - const: core
+          - const: audio
+      - items:   # for ADSP bypass based platforms
+          - const: core
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
     items:
       - const: core
       - const: audio

-- 
2.34.1

