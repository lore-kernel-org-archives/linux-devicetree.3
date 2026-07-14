Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C52931CD
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784056609; cv=none; b=Bs4nXUI7X0PIFUGgoNTY8L/0bTH7n6aO4IrZLM5o9GoaJHXq/SH38ya88wH7E13i0BX8JDTMDGibrAbNRsDZ5139gBUGIpF9YnwhkVsP5Zgbphg+slkzshEh1887JZ/awuwE1I34ZN7lP9RL3uIdgx50chJwqPFK5MpJLIHAEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784056609; c=relaxed/simple;
	bh=+f+IDLTrXMIwTZ7iuJjJZVhlyaQWKezzbOXQBgkin+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lt5rZSSHLZUiAV3CatkUFK7ZB5AXkOfwTrtaJ83Sghl5m/FtzkD3a71Y3dJD93ew2DVt1iDst7e85yaSuK2fnhxLolWknR3vE2iFWKPQ83Wpw/xBC1UfkUhZW4QeMUwuqbM55moOaJuY5Yibt3aZ5LjuKD1jYwiNS7PzYGb8pLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CwlYWUeq; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CwlYWUeq"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-495b27007d0so945692b6e.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784056605; x=1784661405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuXRtMtsCrbKtroiJGCdttoDF3tRJIUhOu4EeJUBsWE=;
        b=CwlYWUeqvLnTF1uafTf4ApxV8OCRd58uuBHZK6U1cLp8LwKUF8sSP3iIErGqbiQrXX
         SpZtB70POQ9kZg5JwTumT24Cs4jVeuflxIBb4PXE/+Dk0UchakKoteHEON1UMLiRRhAZ
         qT+KRJTiLwXt0nzzoYf9JmzXhKDe/UMI1ELqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056605; x=1784661405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuXRtMtsCrbKtroiJGCdttoDF3tRJIUhOu4EeJUBsWE=;
        b=iHpXEG4K/q+723L9EgMWrHdwemDo1SLtHcQ6hiPanYhbCMYbNCl04AEhi7knaYlFYV
         IHvAHnhGyYJ/A5o09WBriBo3O8e1pONAGk/BWZ6kfHSsbDoUyrf+k/RN59kKF0K5iWZu
         btsN5dbL7PEiumTsUi3ifLpCgpGHCqGMO2JGLxFuxV4w9mZJqzRl8ARcLGa3/H3Wr1/U
         EUXbF30zhUImYKBYd/jUjd4ulcFFonONMLfnTwBV2y26xKYgnless/cLe7EXJliD2qel
         oeRQcyvA9Ifvb6O0JqT78xocdJvY2Z87tME8I7n3i80482zgE99DO2iUfHlTsxYmxvP3
         KYVg==
X-Forwarded-Encrypted: i=1; AFNElJ8UrNdGVnt7dAlZ8d+1YrxTIVhgQbjOdx3ATOkY9BeHZo0DPVsuneRvUpZUANri2UxKK8YM5Y1wTWE4@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJ6fohyYITMJnt5lJ+NsixXn9mhuDNSHlSPX/7bhYG6qW7etO
	rj/lR3z1yt5sCV8+jSCpMHZQFOGVpdodHLov4vBntYB79EQAQXUpp2asgjL/y1+LLQ==
X-Gm-Gg: AfdE7cnDcQz2UFx9yut/JRANF7ymvhGGEV6K5vq+EgfB5D/0sWphmuNbU+iIacHgUH1
	pnrpDOrHuFzaY4KahLGnSK6lUD3bqxrWllfd3FxnrhrSYxM7C/K+P8ZCvMKIFsVi6b3AQZGpSc3
	W0csBM903Ly7uyxkW8qewf3tm6q9NNif6RGJN23zQSKJ8guX6beBypRU8ICsiG7dXfcAUXD3Z8/
	9FklMOf+iqEUBcrSiJTTwC3DipwMGTZSmK4kLxzx0rDVLonjXyzdwqPOY5rldpSQuzrzwg6zekk
	J4uYCrhDIm0Bhfmvytfasb0sXWCqC08nbCP67ZNbs6GNdSLybUZwW1X6r0cQEPd09ygaA+r/IRv
	3qCDl0FpOUSnEFTpo/dVg183CcGZ5Kscla7dEbeXKY4rF61RqeZq1JdMrHX6iJcdZiZiOplQCuB
	czy4JM/uU=
X-Received: by 2002:a05:6808:4f22:b0:4a3:26b5:7c3a with SMTP id 5614622812f47-4a42ae048e3mr10469731b6e.15.1784056605373;
        Tue, 14 Jul 2026 12:16:45 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm14767236b6e.3.2026.07.14.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:16:44 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:16:32 -0600
Message-ID: <20260714131631.v2.1.0b846080833e4b836793c43fc26d1c6d817cf9b4@changeid>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the compatible for the SARADC of the Rockchip RV1106, which is
compatible with the RK3588 variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Fold the compatible into an enum together with rk3576-saradc, since
  both fall back to rk3588-saradc

 .../devicetree/bindings/iio/adc/rockchip-saradc.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
index 6769d679c907..f0551d665916 100644
--- a/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml
@@ -22,7 +22,9 @@ properties:
       - const: rockchip,rk3562-saradc
       - const: rockchip,rk3588-saradc
       - items:
-          - const: rockchip,rk3576-saradc
+          - enum:
+              - rockchip,rk3576-saradc
+              - rockchip,rv1106-saradc
           - const: rockchip,rk3588-saradc
       - items:
           - enum:
---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
branch: rv1106e2

-- 
2.43.0

