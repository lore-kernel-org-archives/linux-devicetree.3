Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89A2EEE71
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290812; cv=none; b=IHeW5pePEMQ57kmus7ezeUWrsn5gnMAYlc/nI23/VX42k+8++vXeBAR5i0BmnWBxTDT20EEKgGnUlr3HEzrsIP7DmGjLWvkIMROewkO0p1p4LGwbODKzB66KmELAMfhDe1vRwUG0uK2mB2aFYGwUQY62WbAkdhRWe/ILGFvyioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290812; c=relaxed/simple;
	bh=hEAydHqntdYMnlyAwKWZtU7FCzzrJfeB5kFdTHg3eh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aFFrCc5vVCbd2I9sVqCcHB1ZvKNPvpGcu3o9UZModweccoJF0vNgrsuCeE1VKlxIg1+M3X4GouJWioO7HVQJdioMKsTfSVh3q6CTtnT3QCWb++A+qRT27jNfkq/v7ogoaPQOyNmjEOamClk+tnkSuMCI0peMkh8zreMaNPzS344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4P/jWP6; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4P/jWP6"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37deb2d3a28so130981a91.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290810; x=1782895610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=k4P/jWP69O57jPwZ7XzWiGa4PEuv70+fbsPbCyWSv7n7L5APxvB2FKuxtpiESMU0W/
         XLdpz8K+xc0sdcrrCtAcgIbCZREPLxb9mBr57rFnAfPbFy5l/cNa9pkitcQNyPcliFjh
         s3bEmWGawioieBBDLVyyIm6nTyGye3U/Yr7reuqEzyq8XDLzY2yREFz+DGFMfIFtG1QD
         rR1aA0fPMZSlTK3G0/k/GlZytSZviLC4jjRe5UaHkPae3PPsSlVN54djCATEVB54zX9Y
         2q2wH1QwriLD4ed0H8DQiwL8tljvqZtgLuST76C0JVWnk67VoCJvftdSf98WwcMgr8W+
         snUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290810; x=1782895610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=WcEBz7lYFSUe2zUdqoqthnsWA1AkgKQHm9Db515j1XHS62lL06rIKS4dLDUcJZuTzx
         uEDnKbys+gFR1oXhIJbaWFBj5Z3js8kCtcjO6pi9nhv2vpWPBBr5Ce16LsBv3SaRl7dn
         92eXVgDpNjr2pdQE0L9EubVPku/jD1U+QXl5Q4t0O5ef0FYliyQ0TaRZXj0AUWqKGzOd
         raLi2KUAeSfDT9Ts9CVw746MlvOXErKpCwp4aiY+rdS/0RgypktJN5oZy6alUHizKK8h
         BBfITXPWPa33UU1R06/WC9BQATKCYxPjzzFjd5aMutrMadDoxop18U+DhbAgPGaXWMIo
         A66g==
X-Gm-Message-State: AOJu0Yxh1YppSsIkX7Jv9XNxMw3jdMRCe4d7riWThGqQ0rfyJ84HsWG4
	mcaX4v2xZqVWdlLzKl9wE5RbVVIy81Q8rvhQVb0UESI63+MW6Yq3X6ib
X-Gm-Gg: AfdE7cmeatx2VScpjvA8GsgitkWv2yjQAMQKkH6HJZJOl+A8C9ISs9PBznQhCsATaow
	MYYSw25TBbDKvPk54vpMEx2oIKtGQWyldR1PV9YM4G70BKnGpR9kbymOkRUAV07LMEuQQVTuLO0
	6hlzmDqNkL3xidmcXP1nBw4RCzd2bwsmXiy3J0kLH10rjONUPi04dN9PUknmV4oxXqdbmZyUBjj
	mq6NYAfLkJUIwclcXoPozuo1veKX3p3jVOjKhhrJ7Icg96d0vXB4HcIKfmvIL1LL3IOgCY7Y9aF
	2C/RXhAOZTL4JsvtIrJZXk2z/ZFRkh29GwOVKI5kxe0hiz9lwnybCdmA9FuzrBOlsFKRMxTDykI
	/UQnUuSiQp6Tn+u7ygEoZ1E/O2Jz5S8QFyiNkc65CGdGqMN+49lC8hCJfWAOjGuGm9lynpcNoU6
	NmDfIK5hNPKV5M9YRVrF4OlgtV
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id 98e67ed59e1d1-37dd0d3de38mr6759149a91.8.1782290810525;
        Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:39 +0800
Subject: [PATCH 2/7] dt-bindings: arm: rockchip: Add Alientek DLRV1126
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-2-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1084;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=hEAydHqntdYMnlyAwKWZtU7FCzzrJfeB5kFdTHg3eh8=;
 b=LQo6M34edM3nvXNVY+lWG19FP/SsEWFUfLZegDFVnSHuVJWMtsEo9BN8H+BQsQz7HVsHAPF9k
 ntrv/WOTO4JAdqu8mcEVaIdImKoX5QNJcMKn9i+mijaj9U60D4syALM
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=

The board consists of a DLRV1126 carrier board and a CLRV1126F core
module based on the Rockchip RV1126 SoC.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..9058f2a461d5 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -162,6 +162,13 @@ properties:
           - const: coolpi,pi-4b
           - const: rockchip,rk3588s
 
+      - description: Alientek CLRV1126F SoM based boards
+        items:
+          - enum:
+              - alientek,dlrv1126
+          - const: alientek,clrv1126f
+          - const: rockchip,rv1126
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.54.0

