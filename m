Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD901B87C9
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021685; cv=none; b=OzfWnIbR4W5bH1eZ4EBpL70uacKWtW4xJqitaylbUSjfILExfXpKZIg1zSC4I+RUMPsy6w/lkgmmN2zHmxldv5nrTg11MZbLjCYIskgmmspMFW84/3ghYzsX0+Za94o5hNnacvejN7FqlBtx1JHaoLLHZPPZ0ZZDMY3HCXHQfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021685; c=relaxed/simple;
	bh=6Cl757H0vhrzSURS0kg9slz0sUZ4ni9TBTlScSjFSts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7irT36fYSuxPF3IbRmtpxbfNY30uionEJs5d7w0fABoT2UUx7Zr4wbkw/MGshopPztOiVGpl/gNfmz6fDgyiIV4eZeMtZKWXejMJCWKQZGWkSGmE9ct2UYIg3rEqMTfY3Xp+S82B/UyFNsMyiWn8YADKW1q6qcwIss8knWM250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pt9/H1Cu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pt9/H1Cu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so98931295e9.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021682; x=1777626482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyZmboFNKscOfTrdvdGgVCw1jYQJLbWjYm1kbAmJb4Q=;
        b=pt9/H1Cui/H0Spa5tXFW16grrKHiwDKwQ75ixzB4g51gro34YMZZ1X4A0+tgIysTDd
         hgBsqpiaWxeMZ2bWpev2ekucOoMVnwSzE8y0l0ui2lITgDMpq/GqvmCU1MWhWUBBQ4+Z
         RjaZRPE0G6Rbp3iq9wOBVw7H2UkIKft5quZmTgqRYwGNR7CdIt0xRFX9h5wsCHJKqpRh
         ytBuJECotE5811fU3fWR/OVYJ+JoD13a8o3PsFLZsIaUdtC1X5NAsrQdFvkSiadrMimV
         Aw2WrLyEayh5Cmw8Pm3SBWTY2UkiPzAgf3dNJbDbal1KsYTMZfBRu3tfHO5N91bB8bL5
         mWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021682; x=1777626482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyZmboFNKscOfTrdvdGgVCw1jYQJLbWjYm1kbAmJb4Q=;
        b=az/TqV3KrenESwAfmJUWICNaXcLDJuYCG7GOj92L+o1NodSluW49QDhLx2EHDoQs9W
         aiW38IFRwAXcyOnlFN9WO1rANyU5DCzHZM6anh/9vtiZ3NjcRZvhbMe8zvX2aq9uN/DS
         Sl3fomSLaq4UyR4Hos2HTW5LbUt/qH+n1jnqE06BboT2nVFOEyvXNQkTUpbsRpe21e0U
         d3WJsJNqOpRwn/l8OUauB5JlwruDdoRCFUTZrd0iybuqRr6Xq3wtSvcR/3iI7hlQetib
         meu+XMMQykgm/YLT1z+iTyq1HvXVxvbc+p7TJN2vx7uEVv9wq4k9KYbsFUQXYwXVst7O
         +low==
X-Forwarded-Encrypted: i=1; AFNElJ+PZJ8eKe6ghv9GdA7hgeChDNhiJTrJVLyIwveF+x5d8tu7fM5D194+jWlcfeDLmObc77lE/uVzNSyc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp30dl7pFHhJ1PTViFvbn2JEikHLV+mmuNIxepetxdLEbXNMIi
	6FF3WFysWBV3AdS9hsLBf8Z+5QdKyu445RjWdI8j3S2aJhcnjSq3NeER/F50p2mEc9g=
X-Gm-Gg: AeBDiesL0hKgg4kht2pCXXvhbhQpxvlRf5citwy8H9jUatmw+iX436tQj3xV+TB0flC
	vH6U7X7CMw1EBqxCODZqvBDvjajWjdsdxTYRK2uZ2++zQPEXxgYocz88cenQvaRQYlP/FBwDsO0
	+YM1xhBw863LWzOdL3OH8MX4gRugka9ywfytd/JzSre5XUJmiH0SSpBT3HKwfL3yqjXO6x6lB9L
	6B5wKj96dqNOY6WICk+mzo+s4bSs0yt3RZvpyNnUz+un/OKbWx9kplTykCUhMa5NJ3PTbhroUZg
	/Js7AyaEX3JZToU1YXsgBhEsd8hXKngu0iGEBnoj2EcsWPF+DMvq9QXC8CidGbN9kTtOZduehQp
	DdAn2q6Rcly193XiCfqdpvBjC1HWVFU3leBsl2f1la3AlQL3S4PRofBtz7TfKe0S/x6HfuRP1hx
	OZ4IyBxoMZrtOfZZuXethIUJtcovTGLqKhe5rirlof8fKBfNllhqczSeU=
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4895040c025mr294337145e9.9.1777021681867;
        Fri, 24 Apr 2026 02:08:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:55 +0200
Subject: [PATCH 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6Cl757H0vhrzSURS0kg9slz0sUZ4ni9TBTlScSjFSts=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLtgvt7hKrcFK4V+qUJDyZ//OxsTtiH8RGhS/bZ
 o0Me8ymJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0VmtEA
 CGyvT+AOJkOesWKklnAmSYY77C14sg3Opb7D8XHQhreNvH0SkYYsH8XaqiUhDkpmDyokwHGl3n2wCs
 clKKtG9MPM3ufaL6WG3yp2WP8o26zKhzBWZIFWPqacGjIhNRenoyP3XP/zBSuvIP3fed2Bs4Apk+Dw
 jTXbQWYyDL2Jw1ga4srNJsrRgEf+ANL/156GlheYNQfUQRWy0X+FpUhNebatNBOrW9P/j6OFaTCUS4
 3CMbOqNk4xhcMMIZiK+QCIwJ/71M+DV0UCHNpG9Z3vWWUL5aDnFJ+cwzP+7ChuJ3pZBXH+Nvy/opOz
 C/VGF9Ke9XT43B3IJusMa3IskqR+VS6hQAZUal2PlqylfU5haay9sbYW8t0IrHL4742vtN4MXih4f/
 9ruC40stxFK5Lq3GO7V9c6LuorwE5ebyYNM/TupcQ6e4/CDkXR8424gTcLWV/+rznaN9q3gXnzKgCP
 0GoSMw7miB4jfQQK9iK49ClOoJRHFElxhDlVbQCaolM72YIj5636IeeZRN1tkShwAv5cg6CvOZmhhZ
 BHMBx6m9adSFTjaYdQzZ3Ld7GAv2Ucb8TD+qUODlkKxRFo8IvIFQjPT+8PL6GtiGxi1+HemclH2lZ2
 6jn/a0wgIpZmIyV0nFpsbXtPtPqw1nOYbxFksgpiou5/wcuCl/u29lhWkGTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..16fd5a42f3a0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1

