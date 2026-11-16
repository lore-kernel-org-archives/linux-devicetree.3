Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864428;
	b=axRlsCZlUOuDXwjQ7OUXSK8tJHt+J58SdqQLdyRib0A8+eMJKaHpvDIxYMO4cfWeJj1N
	 rcvW7c5IAfYwVKJPtj1s+qx3fYhdrMwy73q28y/YwmGT5/p2eLYc9jB/lIX6Jy92WKGvk
	 8Idh/fdhMidUF5Jqpw7Sb+uN5b2/1A1uTl2gAKa0307f3m2lnDrd6ZA+Ja5SDbMhQk9bS
	 eznz+QPE+9t6rF4Ghoahzn2X2lL0NNZmUAG3Mu2F7admby+fPx73+UxKizCvco7o4SSW4
	 Nfc+7jYi6DMfhc02Dzw4lh0sf9vwozMAAULdAHb0ninzteHPsP/+lWb6UH+p2Jp0yRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
	b=zLLNIA83SVAlpLvLu+nq29XE8IjIp+ZNvhQduYpHJThA9QvBRqQK2/L6RkduEMb/4/ss
	 JzTek9nyptZGQVvPbS0gWuOIU7zxvl+FkRkks6wqNauuYtGGX2plVHzgHfKai1JZIkoY8
	 lIiWcsu+ihWDEA+qaXJqBQsQIsP17ABpJd5jEgoReaL4koMW/wpIRYNB/9/KfwEPt/u1F
	 qATyIcX5FNmFl+kOhgQzfUhFurKmERwjqQJtjcLqAC4yHmqqENBidSreZH17v8caXxE5v
	 XCZp7yHDhb9lYLkmVHy3Q4xg6O8avKJYLBJd9L7FrXShEYXNFcG+SokaJliQOus1m8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwUmdGf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD5606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CD5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MxwUmdGf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490f38e9688so230640f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864427; x=1795469227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=MxwUmdGfyUtZntWN+dJoS07xQM0pQ+yVQaLKkkqz5GCWi49NfYHKbWARqZKhmg5l9P
         xd2SuFAw0lCCpffBXvhmGo2xZ9cKfJTe4nfCkkB9BpB2Ewjgp1tqMuMhU61bgBaeqDer
         UroYO6LTJwf9ez7KYEQngDY0mihFGBiJsqVzaOOYNpC2W+5MvHXboThdP/oLwUGq39Rs
         z3V0OzRqMtLQ8bMsw120HXUpxzOyVHbrTE5sD5sy3vWlDMJF9dGPmPZfIctKxwRS7q/O
         Qo1H+zS0NL/QScukZH8Xbrny5RwvwyeLCvlSK/QSvqJ0ZDVKOmrNlWLe6r9KV52N5Qpb
         /zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864427; x=1795469227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ro51FgAwM27DOCsfxJX1DqcXySD2o72+3qO5nSN9dQg=;
        b=wcVJ3CB77O9UdgFlsMF+knYKs/sTRmoaxewZTFqDAJVkDMP4rNshG5wk4NX03F8c1r
         844dD1KB6vd8XLEjIL64KsWDz25lFgPI7UTarmBzbjS3m1ZZCFfadkiuDDBDD7K/Dk7h
         jFehZXe3bQ+cQslcZcLnUGrOsEmAIKKsQHQaDrwi1rfGC6SdDRsOz/offNfKzRU2uhyp
         vq/5zhBKafxRvii8CbPmtAIjMj6A0g+3ROZpW86VsX9U2vu3FRpcQSXJVnGpLfomOS8s
         lldQ8Em9nLKyltnnF/kOphF8y/a6WRrPN9Bxd4G8f/GR1bWUxNdzRozknD9I0BvRwphm
         b+aQ==
X-Forwarded-Encrypted: i=1; AL+hErFwBmJ3HTocw1AZQkQFVG/ZTX9JFmayDaqqNFdwdEhSYyoHSRm05F6DZP6Gfdy/muQWXpmFBE3yBHfs@vger.kernel.org
X-Gm-Message-State: APuU4Z9A+W0zXKItmFBSZF6xV60duwjyEC6CboZUwgThjXmG4rV6PD/H
	SDI1oDbuWn58WWm9c+jSIJfcay09QOX+s+vrzvIYgt80mrDTqnKtNgBm
X-Gm-Gg: AZFdTZfxPBbCLpEQ/OEtZgXlCSa+0V7tdXFPeii1Gif6wxcGeGi715tDkQ8DRuxgBWm
	6Ls49rOEImXIVZwx4ZmmJX03BIbZoY+W9lzQRI+B8/ae3yWbuf1rIvhblEFhfyVAwG0w9LuZlEe
	IIyHS36ZQw2cWNvXjp+gNoEVSQMnpvKRr6KT7kJWOECCZGf4F1eiSlZZHs6B/Rrz9FaroWByn1/
	39C1sEaaGNlIJOr+yd//Je/Que5ylDz3HqVYOs80b+uU4+OuGxz8KxTw0cJZ+ys7csjW2VEX4kT
	mEY8Os4l+Ox/3tDG2XjmO1SA1NNSmJVkaagRvml4kSfHP1XA7M7in4n6CRq4Awt823RRRX/J8wm
	zIYes1Zt0hFur/6M130yZCjQ+tP9tUO/pf0c//mVDQa9Pge9ZrDKXDu8jcUXlkDlo4KgBxL3cdV
	0Gho6sGKckzmtuhaMGKm5kY6Us1qZ1Akc/T4B1hgtVOLSAMQTg0wbo4esy6MGU9h7XCZjXq5d3E
	hRcp6tox7Cd5nCDwTsGAUtw7su3+nGUQGGmiUh8JaNl4zDGxEP4jivD4bJz2rrsus+5VFazMUXw
	UtCIeXYF0wyBG95GssLNLXXxeI2bUoVRBMdfNsO5lA==
X-Received: by 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr1458441f8f.1.1794864426917;
        Mon, 16 Nov 2026 13:27:06 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:05 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:21 +0000
Subject: [PATCH v2 05/16] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-5-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=cCyX7eu7E67i1+mb+zFb+/V3MZ2Z8Bvs+BbDvfy8HQI=;
 b=jodb8KTCYJuS0IWgZE7KB4t4x5w4vx+XqSva6vd9XaFcHbRLapvwh0kujvjIVh3aEijgselYV
 FDfNsOtrAj3APDDTnmVV1I35ZxWejVLlN13Q6QOSjvxv3VTGu5EUwMp
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the DWC3 USB controller on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..7a8b72d2929d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,halliday-dwc3
           - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
@@ -209,6 +210,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
@@ -570,6 +572,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,halliday-dwc3
               - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3

-- 
2.55.0

