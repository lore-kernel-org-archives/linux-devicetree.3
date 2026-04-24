Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20D386429
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021688; cv=none; b=FdkDKfZ3ChF78DSyzsGhhV0Iz1qCUzAAjOe4/SlYIie488gSmEFno6gyGbstin47FEdHz1XKFXcRVMutNH2/IQa3kl6MquPAoNlDEEdZAyJcjEylN3vgEA/D/2Vi/D7y1qN+7VBZlKIqMivlAx67L3YHeR5YUHbpaxlbBplmlGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021688; c=relaxed/simple;
	bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Odu6NUPaa19iden7fHGFwuwwuo6ui+gHEkgEeRXvO4IwwHuJldcGQd41ye9bBAapJUKo3kBCtSv2Fj6VHQ63lXJFKRG7HtZK/hwF90Aq1+7CRWYsEKh30auRrtpGUp4z2trqXIIDf3hwBtf1OafX82KzJqK9qEZSjvG8zJGtT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBJ1tjTA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBJ1tjTA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891f625344so62205225e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021685; x=1777626485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=qBJ1tjTAG9rwsyYrYPFV8+537HMSAI7g2G81cNXlFPS0QpBFciZ53yIpkwMjbC+XOY
         G3SkqYQ4hYpfrgZmqf5B/KGaViZE+Tlo5++0kJP1yk2tjt0v3kKctqDCJYOF3KA8UEgW
         qqjoGd9E6aaH+2WcGt+k+BsY1mVhEQ9JBZZWJx6vP6XOIxBl/8ZqvOfpTiWIhfHapl+h
         z/I6rPV85yEWjuwpCiM/4Peu4L1aqucH2vZuwDAjiRxMCmmx3XFxaAK3GiAvVlk8Zacj
         X0K9w2I5XSuBj7+BKoeuVgH3qqemtEO/BT5nbQh/vomwvYR85F6+OouqSTDLZUJA0kMA
         Mf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021685; x=1777626485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=WP1QAmGMXeIu1YyvEiz8YYFrQRB0RojanJrQjbbgLd4wvnuTwzZ4GN4jYCJ1+2/E+A
         7jthFlJjZvUxF9CvEilukSXF4VPkMgabFEhmgwUKo1ltRv0wih+yQtT7lqV/KpiieXhY
         9r1NA45fGP7cVg0+yXr5VG7AVBywoFpTCeyV9N+l+cqTAXlXB/6LvRGwJRf2RZvU55oX
         AbepN9Tt7xjpg5i3qldrtToWPcZSchMnEihVlbqnM6lrbewc12QkGXgqjMBcHNJfZTUx
         16LoZ26chTPz3Fj3nq8ZM0Tjoy2VRd0RKUanSgv9sebUYvuX1y168KqoLtGLhj05L0sY
         5m/A==
X-Forwarded-Encrypted: i=1; AFNElJ8BqHgBBnyAqkt9pAztJ68v0Mck7p6yIzpSIbVkAtAjSHfoSyS01Ajsz1aoswKVAhJfVHLCrNRJd8dx@vger.kernel.org
X-Gm-Message-State: AOJu0YxHKmDSGgp9vKmnOANGEjiWob+6syrVtHv6CJfAl+AgagqNJM1a
	2x/e5/F0oK0wTofNEcXB9V45pJl2d7efN2y3CjJstWzBMXC2ET8R8hrOp3cEXbJEtSg=
X-Gm-Gg: AeBDieurMTUdxEZyF67DNHD5zGMYs7ZOevpwSEzBtpdGznlEDjwnXID22UYodXHTdKQ
	v9EoXUrp3CusnAUrgDArnZRfb4szz/J8qAP/X8V/X+BixKObeZ5qFIu0MkhxqGXzQtR0MXwPJ2x
	LpxnF7YmdutQsdBge1Sdd3M/bdhrIsFqng3XcgNM0kkyn87dxzk874NqioDV0ds1VJPFCXJcnyI
	ChWM0ExTjow9XLMnlDRGDpLba3icx9oJ3Tx00QMUP9t4CB1Zo3iebOk2DobmM7RL+TQWtnwJYot
	pxQmGXJQ4CG7kQEaq2RoG03RaCzIGZTprvj+93xK5HR7poPYIOb2Y0UCaPUxnjkYrMkDq0pm3xB
	l9RJ40qs4hyOWTJVmhG5vj7PM469ta5EbBI4GyyqHAHmyGPuHietJzyVLP+p+1DR2qWVcJ3ODeX
	EjdPXFa4/wrxnzDS/E00tx2F+b/oYTWFE93HMWUoKQ/ULaeth3381NtPw=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr353911685e9.7.1777021684083;
        Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:57 +0200
Subject: [PATCH 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLuLZkMPJDr268l+m921m3jF91DlclPnR+Of8tZ
 4B0me9yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7gAKCRB33NvayMhJ0W1gEA
 CKwLPQQou8T+FSdimuDZHKVX8qOjgIgOFrWhQ1uuRhlAQMe0DVhTTKHMKJI4WV4b27Vv4a8XhYyopa
 djFOIUSDd79QCEhddBghp3kvWTNNAAv+aflwRWPx1sPpzmkDAcrU0n2t6f57GnJqq00Ytf14FLTDJw
 Tyg/6cX7qTbjVE6f2tV6+8HDhwDjicgwxOhTYfCFUvTM3dLDVeYTWW6qSHeDeweg3UPp/9luIjozd9
 mjJXT6uF1etp2ZBcu8L+eYOwFz5Ux6stvm65Thr4nFjAtwB5MitkH6uKBkLbngvJJ1F8ZvaoiETjOe
 DB0JsFN9+5XqKeacUVSl38Ajh7yiES2IPEeEC6u6gNG9wCNC+jrU7oUPx/jUwzI5uRNyLAuAJcQgm+
 sRpYsQd6lXWSxIFUGxcW+tECxDqhnEAScpRtky2GVB02pcdiOp/c3yBiA9aitBJHOphDTNuB2Lt+Gb
 fEq8kjBOBavIhkkeG9ANvuFHKy5OEtEBZAq5y4dAGd2onCWcwK6D7/SXDOqhQ/OAiU95kc1AwP7Wsl
 FXWggrQ9ufoOvqU/mceGPOqStMYMstuURvlK7Wy8EwlYGG6gBRjPAlNqutkl2/2lKTtnA8CVObDn1a
 XtLo7/B35/hopY76it3j06vvu2JA0BX2p8u5zy57cWwdUeDASfI0oKZK132g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..43b06e0abd1d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1

