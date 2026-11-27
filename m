Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780926;
	b=wJjFrqo9KPDIap11dd+PVovV4sNn0R08mS+oybd8MJQ5FTINkcC59Naw67BLyiZaZer1
	 MEMJOf/bJxIyAUQakDrwt3r6atV4SA97by8FFfPC9SLWdUioI3zG/mTAprAwcyiGZ/kia
	 mbniIKuJuHavK66SAgfmX1GkyQVq4wTJnFaMmiirsYtPldBkmBxvTTGl090iirOgJWhIn
	 S90wafeR4AtF0YXpdGfgejHfYCaddfNOqKMYCcF5wKEJfyOnDo9ybNIF/IF8TaCzAwLKz
	 66Enj3iirSYeSjJwjs+Xv9ZfGDEtwC2yOhtbwOuIfZkboZYSf9yjKzPDbI4LrkVSYbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
	b=ZOVOdUDsJqGZ4mj7hUPxpfL5OQWtmlFufYmsVYWUa6aGsli5ZH3tkS8XJG0KoD7p6xnR
	 4QTctASt3USZCSdxHwjEuZuTPo1Ennfc/WrXFQfwcuENon1/YimncmUxA9isYz3f58Vty
	 GsxfQNLR0K0T5JdkOQFsXmDLACKMfnI7C35ucMj5tJHfeIhp9zIJh6t5G5+WCIcuRE6qL
	 0Da+IuO28ecdRg2T1Ef4OPzRoDg16j6bXQISHSU6XRhhFqxZSKaUwsbgwDhp6sGco2xa0
	 EVGLmw4kyG86aYHq6VWfSvteEspyQ6TScjdalapH7sUy83Ue88CfHX5S9lrwW2Ne1Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0LJt6/19";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9494B606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9494B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LJt6/19
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so24931425e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780925; x=1796385725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=0LJt6/19RSoSIxSxgAg9Vd5MQb+QWUZYn3k/Jd3nkizzsLxBtjk10mtUFQsVPDVITN
         DS7qB+kDq7XLkAYzVbQ9umbPvVnjdXg/9rgsQ0tiPiMpaSbfTaoQCJdN18PBK2twf1gn
         mIK51XMtkwc/yEf6h/3Wz+y3qTZnyICWHcQFKS/wqTiKaHwln1ZCvbNnj5sDM3n1Zbpa
         NDZO/HhfeOWV1V13Jt1hGgz0n4UXNR4IdiT93orBMNqi/FiK+06zFvJeWxkYFbxhozPd
         9FwlwSX5ipMBRtzNM92PL/W9V76XEnN3m5wxdDw827VH7aOkbSR/o8i2csnOxrRj74E0
         EIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780925; x=1796385725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l0FqxSdSkWVcKj6JvNw9SG+fnKtmoC4+i5Y2izvcenk=;
        b=Z3yert0kPlTw3EXs5KG9bZaOWDOmivw5U70TE3+OuZ5BqxbcEwrm8V4oMt76zgPgo+
         ShQfO54TBbBXwml3ufAMdY+niH/nizt8X0AhzOYuyAO9fWQuHNbi+jUSvxtPJHVp9F0t
         4958gCvH6kBxKZvdz4gU/Zoq4v6Ep5vFri0dOcBZgy6od6eUeYqxyETpoLeF/3DUgZIk
         gQLUUzVLeq/MPNCkmT/LHfiItaCRpBamXXpPJwZVsQdyuJrLz8LOfNS6oZqazh/hIW2+
         zHAeC9Gt/XTh3E/AvBbc7RN5oSXY8xWNO9xMzfMqzQOQSSAqeZKXhzf/kk9t6fEiLYpH
         CLfg==
X-Forwarded-Encrypted: i=1; AL+hErHQTjCbHVtYt2e3AXkQY6OVEEABiOoI7WaFmZC7sdY+1l9z2XD4W2H50KXRI+Vr18OZNl8hVYUZOgv6@vger.kernel.org
X-Gm-Message-State: APuU4Z8+M3DM7ft/m2Rx69c+7VPvIJ6BSa2nSA0UtOAbpkM6/Sl5bTdc
	2bzXIhXUaBE3BlEQ67fZR4v/Nug9phxlBZzLM6Y9orOiAdJ3S4o0FVCt
X-Gm-Gg: AZFdTZdujEvDgjTLSDqDsX1S/fzAmI8auYUMyXE1vtiHDhQhGzVjrjLia2MKfNBBRZU
	zzdw2Cb9GttCpFQcrvPhHm5JlE2X8W2IpOYGucP2YIc7ySVrDZm2TSDdpXNq5WuORAQ1rXTFNx8
	1yS3/F9kczwLUvV16N/Eigm1TJ336Kdbgs2mUfourHBR99cgAiHyc9xOdM/HCEVGUqViYlTZYao
	YeBLFQK9yMVsY3rnPPwQ9L7XUd/IYHhmkdRYrj9QrwZ4aa4Xk99LLSiduPW311hAXWKYQHXIJeF
	P3sKDmjxZuPHYDxgJh7Nqmj46xyRWTeX2Dze7dSg7Ila3qD9gplxMj1qG+TAuzSJUD+6HXQQh0W
	ArKCg0Raj2LrKtKk3qAThhGIbeUPI217kSMGR4Klr5xwWToriXOZci9JsjjNA1BoOCSizq2tQ7e
	idsJJg9K52oRLMYwyYT8ABJ7FzfuOZRlLNyW6KY4DfrD01WHfO2DNZAhM6fjHxaJHyMKYW4ykms
	pQ5yuSRvGNn7YJ347ihyo5HQPPdtBrPEOTRKZBo0oRhodFVQI6w0GIQOQL0yFdiCGzrXZ95I/Qi
	dHRAaSujTKURxlCvg1EzkJXI69NdWWCeoRr7xFTomqccZN+hq5fPjRHhsq41dACHDKSK
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr457352155e9.13.1795780924749;
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:04 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 25/30] arm64: dts: amlogic: axg: add crypto node
Date: Fri, 27 Nov 2026 13:00:58 +0100
Message-ID: <20261127120103.1532882-26-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..e755a019b384 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -321,6 +321,13 @@ ethmac: ethernet@ff3f0000 {
 			status = "disabled";
 		};
 
+		crypto: crypto@ff63e000 {
+			compatible = "amlogic,axg-crypto";
+			reg = <0x0 0xff63e000 0x0 0x48>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
+		};
+
 		pcie_phy: phy@ff644000 {
 			compatible = "amlogic,axg-pcie-phy";
 			reg = <0x0 0xff644000 0x0 0x1c>;
-- 
2.47.3

