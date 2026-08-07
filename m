Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941E376A09
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091530; cv=none; b=axj9pwtJTuSCbZMEfNPUTwdumo06VtN9ggjI+x4LbabfANBtsg81MlKdEF30CSBPYxJ9WxmQeiqdUxuqrj35EFe5MZkQ48RdLUVVqoqwrD1ZxMw8s2aSfDwLX0oD4XNrQW8GHO6uJ2xWvlzHHVXXh+9OWQxNVOVIY9w347VrgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091530; c=relaxed/simple;
	bh=3ejBafVfOq8uRsHe20pxvJZtuyC38ocEPWuFLFwOV98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIEJ9sOcNhdtLp+K0FAAQsPuacZPCZxSu/E7wkMCoj85BBAn5ibFRxoAdK/0gH8dTFlM/KEpG5AbTHzkXmI2gLltEflEa0e6RtlLYbQOJmkPWwccsRaYo2eT/8M912BWJe+sVbaUJMekWgjyLn5Q6K9zMp/vlgHsJSy6B2sHrM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDiemaXc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDiemaXc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2840763b3a.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091518; x=1786696318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=;
        b=iDiemaXcj4MHOJ8rkksbVusuLqX1V3tbRtvs2qZkRZxP9uLBDLcV1H4BvYJvh56oXV
         iOgBGFrg1zQ6eAgTd7dcaFfSGe09eJD0lnGA3ZbSv46YGxGVd516vLt5eqXgNTH/SZhj
         7fz/PWYHOZvUW7YW3WuArWUMZMh0soHKEUbDjGk8wcb2H1eez6uZQirA6BT3DV9WOavP
         aucY+uVV92HpQ/E10dtmtUkbE2yHtEx130HReMjfVfKQplKCQnocXkKSgapv/4alWJUY
         JXgccUvxLcqH7nBGmXDEbUBr7GfFBl1WqAiboQ3AcTcPFOGcsH0eJvQfP4wfvNUcqR56
         nDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091518; x=1786696318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+oLbfnm87lp0uiqGxHSztbOHkrNn69OeQaoJobBjdY=;
        b=KOwza1/8Nf5q5vV9HRVCehcCTzFm6BPKSwqFkUh0fuSD7nnCQqfgVgJf+IRZqjZy94
         vMHcn5VdgIXrEvCfwNsdfNs1ge4Hw+YZbrMg3OQt0COMEqIunNYzFm+ov2fYdC43+cOb
         0NX1TRdVTMC7i0poMtrpKVmDoqWWqZPa7WFAfiCpBmvKUVj8J00WXqcwNuMjsrUmZLnY
         ++TaidVHN9B8Fu7jJFc1Z5CkizcNDwW2XiBkb9hZaIDsI2LZpjxfvaWbmxYXV84hlHL1
         gTm8wwXfh1JSp68aWGvIPe1QUZF+aHc+BxzIJH8qXo9MEZoB7e8qdg8UCLzeo5GTgq4n
         DbGg==
X-Forwarded-Encrypted: i=1; AHgh+Rpe0p7L5xhguigauJFPxqmdLotF0WD8/nsixHYXNpFemJdtlgqeVvDYT/TidOvIYw8u945NOIwIROH4@vger.kernel.org
X-Gm-Message-State: AOJu0YyTamTo7YoYk4IWTpRzSMuZ0toE5hjJ3jYO4IpJwZy4LMuIjnut
	036oFyplGmVhimVayiv2g72i5fN9BJI4AuxXcTzuO8kGoXVOA9euNAZR
X-Gm-Gg: AR+sD12LcsagOb75HcESUVUSuidAw21ZdS0MToy5PrD4Ju+qz/dUny0a7uF0j55B0zl
	5X8Yrz/ojtMX89pylrTRE1llHlH0v5G2JxFZpXixYbG2LaIbsmepdBJAVGIFbaNnd1TdZ8xxRqg
	fn5hZQxeKsn8t+vIjt6hQWWhnBmUKU2TvcFyU6FfYCHVFM30/kcv/8jmYjR0F5v++FfO8XEQDi+
	w+3lWdSKtR1SNjzDXq2d/hFrIM0fAeCn7brUCrtjtuS8sPZtjdlS5zXQD4jhictPQfwmJf5l3bE
	M401gx6WkF2ZlwGxPvqompS5xbbfgjYqHDoNgLYVRLbF1m7unNoVBN7MJyylNunV34jWRLwUGL+
	Ei5UeotTQMdytmfO1KxHzpXPHbYwLe8qJo1nzrL6c47LP8f9c3t0oh8chcRI8bjN0hZT3LnQjd8
	w40vYT7k9sNHrxPKWggSUQD1qE/55vYvPRJsZeUAoCZmdhyiIcUCkRs0RoI7QoIzMjAc5WVvSwD
	FbfblL7O9fczKQpXHVHAnd/SU4hcxhYt3strA8J1eUVsmLZ5g==
X-Received: by 2002:a05:6a00:b806:b0:847:e2c7:59b6 with SMTP id d2e1a72fcca58-84f2e031181mr24296331b3a.11.1786091517957;
        Fri, 07 Aug 2026 01:31:57 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a553071sm627409b3a.43.2026.08.07.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:31:57 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] ARM: dts: aspeed: santabarbara: Disable power monitor nodes
Date: Fri,  7 Aug 2026 16:34:05 +0800
Message-ID: <20260807083415.672008-3-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
References: <20260807083415.672008-1-fredchen.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to a design change, this power monitor IC now has multiple
sources, and different vendors' parts require different drivers.
Disable these nodes so the kernel does not auto-probe a driver, and
let userspace instantiate the correct driver based on the part
actually populated on the board.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 2a822e38f091..04fa9a5e0d04 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -585,24 +585,28 @@ power-monitor@40 {
 				compatible = "ti,ina230";
 				reg = <0x40>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@41 {
 				compatible = "ti,ina230";
 				reg = <0x41>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@44 {
 				compatible = "ti,ina230";
 				reg = <0x44>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 
 			power-monitor@45 {
 				compatible = "ti,ina230";
 				reg = <0x45>;
 				shunt-resistor = <2000>;
+				status = "disabled";
 			};
 		};
 
-- 
2.52.0

