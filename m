Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20384419304
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417266; cv=none; b=cXFhi9M/CCY4E6DWkvTH8raknv2IHn+ogM2jKqx5IP6lVIyB6dfra5ll+Bp55nIa4LmTEkoFRxC5frKV4TMTEVYuLVKwtOfS7KYpyIBkSU2XtBwf+suyeN3EuKJtLZQ92evwtbASNkjjZMiZb3rqzaC4QqlAuwVEpMSI6EIAWbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417266; c=relaxed/simple;
	bh=ryzjF1cLKw/XipIXoQ7vZ1VOYZcEuP7I+1ETkK1xx0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AqwbPgI2RyplE8iETjz+tCQ20xCyX5h7BoVWa3CltgRSHhf4qoO36kcxAB95A3P9xELLHOt+Jl7gTDxCt9rhK80nhRJoulMwLVmSOMfYTZZkW7zdU4mbVz5N7O30fR507O5JeETbTLWr+SqFZ0uyYvfWSB9thAguwh/22J3O+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4MU+hob; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4MU+hob"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so2323666a91.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785417264; x=1786022064; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIimPfmpV9l9JFDbTgwNS3L9wHvGdkzsHcN3zdJj86g=;
        b=L4MU+hob1GFpZUB/mqe2lh8Fc5aWxghED47uVXP8B0kYVBuu2j+4yM/giOFpC50TqZ
         FJxuCWXJwu2F/nSIqD/gM9LYXLaRuVPf9B4mm5owa7hYPwPS7U/oKw0kPN7q/DzV7LVP
         urNDoSKTSL1vZopdzNuE2cSxdW8sUW38OoRFs3BrMWtCggOBggJsCWoco+PmCRTiDReC
         pl8Hetz4khnzn/QNmCFswQlry6o1dc276Fqh069ZU/CyCRKLevM0/EaRHhWBMFVVJqln
         Tk579kNYoMZC3/jsMREIKoL3I5WVO6jffgcFQv60IzxVExhsU6zlYyN95eik5iPGWseI
         eYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417264; x=1786022064;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fIimPfmpV9l9JFDbTgwNS3L9wHvGdkzsHcN3zdJj86g=;
        b=mdy42dJpiFM0apSW8H6oJLGpWonTQJj+cb9WWLU4NxyoJmsg7uVS0iQj0kMjcdhAx3
         rsr+P1Zpc4hxREvO4xjJ4PaXoI7MV0OEFcV+EztMDNq/UZf2c+A46OOI15o4m7XV0POc
         44oaoMaibziHLNAplA4yKhpBycadKYRrvhdYAM1sbi3AbpSSMcq68ZTwNmQyvVY4jhDL
         6bgfDZSb85YPQHLPdkO51irTJXOfiZ0b6iNd9CIQrNdNuBJAo5gzQEfsdXnGaqejdynN
         Eq05TqbuMQsgFwFAhvfq2LcQ1HLpKISqzgiKUurn1/m7p+RNkVJXyKe6ydfKszTgXhQI
         RumQ==
X-Gm-Message-State: AOJu0YwKKdKYM1eixvzxkU8s3mMvhwtCWpCOTsjGspznjatFFQhQNRbt
	Fjg+DqmjoFzNmOg+T/OOdMYPq9Or+z4Pb7/v536P50mXhlxFqxP8OV/3fe0oVw==
X-Gm-Gg: AR+sD10nQNDKyI0Ih+PJwR4ZlYU1y06UBEM6xmh8WF+uDQhsu2EIC0Z+fWQkk1IdKi6
	M1qoeiHY+s4tTyzSteM15AMIiRCajhgGH43sT9yOChgrBFxVDvkY/kxxeT4b+m4DNDBsj1Xtgnr
	0/kflPSQHuDbl7RrwYiUd2iwYXFFxV7zRV1cEbGq5DLMCTTBJZ8mMzXWqXZ7cukYscnRQeX4psl
	x7dQrnMLT7F0zfw4cv/Aek5fqq3EPcjj5k+tkVbXByBIM9EOm1GwoZob4CgYm3Ti4UIvjIRm2vi
	rXW3FAcihjdQe4BeubieODaXeNuSfIE4K6EhuKtmcvOGZXbarPFFvShQJd3jW+9HYe0J9YpqzIu
	4sQXk02fF5jZK5H9zX8ntrQWwptNrI7+soNqnw1hPS6TN2vwMIhmuOM/w88I7hfobzXJlEH8F/5
	J9/TZZEJoPP6t8YOhxsIVSzjbFPo1W43bljqiI6n3Heqm+33gjzqJCo2tEJGk51qber7fl7uoG8
	3hcz8gBhnvsk2TjqeNqczEr854axRk=
X-Received: by 2002:a17:90b:4fc3:b0:38e:6bd7:fbbf with SMTP id 98e67ed59e1d1-38f9bed468amr2139138a91.20.1785417264204;
        Thu, 30 Jul 2026 06:14:24 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9babf9f8sm1068756a91.15.2026.07.30.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:14:23 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 30 Jul 2026 21:11:59 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: Remove HSC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-upstream-sanmiguel-remove-hsc-nodes-v1-1-f0308eb8a00c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ5Na2oC/yXNSwrCMBRG4a2UO/ZCbEGJWxEHefy2EZOU3KYUS
 vdu1OE3OWcnQQkQunU7FaxBQk4N51NHbjJpBAffTL3qL+o6KK6zLAUmspgUw1jx5oKYV/AkjlP
 2ELZaOz3AKa8ttdJc8Azb73J//C3VvuCWb5qO4wO3zpDPhwAAAA==
X-Change-ID: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785417260; l=2011;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ryzjF1cLKw/XipIXoQ7vZ1VOYZcEuP7I+1ETkK1xx0Y=;
 b=APDPwAeB2o0hAhzdf/pC6qqRxJFxUcbKKwxw7AgS883bDvOowl+qCAStY4zQ1rQ0mrvrD3bUT
 dEkQ4HcTDAmBgrywTkWcPnGQgmJ/ihcig0RjsvDsaFPCr86EPL1ApXt
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Remove Hot-Swap Controller (HSC) power monitor nodes from the DTS.

Due to design requirements, the HSC driver probing is moved to userspace.
Removing these nodes from the device tree prevents kernel-level automatic
driver probing and allows userspace to handle HSC device instantiation.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts   | 44 ----------------------
 1 file changed, 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 3cc6e772cc8c..98f224d2c091 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -442,50 +442,6 @@ &i2c8 {
 &i2c9 {
 	status = "okay";
 
-	pdb_mps_hsc1: power-monitor@10 {
-		compatible = "mps,mp5926";
-		reg = <0x10>;
-	};
-
-	pdb_ti_hsc1: power-monitor@11 {
-		compatible = "ti,lm5066i";
-		reg = <0x11>;
-		shunt-resistor-micro-ohms = <1000>;
-	};
-
-	pdb_mps_hsc2: power-monitor@12 {
-		compatible = "mps,mp5926";
-		reg = <0x12>;
-	};
-
-	pdb_ti_hsc2: power-monitor@13 {
-		compatible = "ti,lm5066i";
-		reg = <0x13>;
-		shunt-resistor-micro-ohms = <321>;
-	};
-
-	pdb_mps_hsc3: power-monitor@14 {
-		compatible = "mps,mp5926";
-		reg = <0x14>;
-	};
-
-	pdb_ti_hsc3: power-monitor@15 {
-		compatible = "ti,lm5066i";
-		reg = <0x15>;
-		shunt-resistor-micro-ohms = <321>;
-	};
-
-	pdb_mps_hsc4: power-monitor@16 {
-		compatible = "mps,mp5926";
-		reg = <0x16>;
-	};
-
-	pdb_ti_hsc4: power-monitor@17 {
-		compatible = "ti,lm5066i";
-		reg = <0x17>;
-		shunt-resistor-micro-ohms = <500>;
-	};
-
 	pdb_ioexp_20: gpio@20 {
 		compatible = "nxp,pca9555";
 		reg = <0x20>;

---
base-commit: c2b9fc3f7091157518a3ac2282a0a8bc797c227a
change-id: 20260730-upstream-sanmiguel-remove-hsc-nodes-b99c93ec0d9b

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

