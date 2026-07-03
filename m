Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833C24A06D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044053; cv=none; b=pi0OzbtIg7n7d/NVfaTmq0dQQ8Iuc8aFbQSImios3PHASRcEq4bGlAl8idrskMYbEMO8mKNqPiAsLlSIr1xwv8dA9Jy1qhEmIbWa6vODk8vTBk71lLgRLwNddtKNLirVWFhDZteXlYmOqYHxtC+5ZVOiZdpoHU6g50u0PTgWkBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044053; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuWXYHwNICNskHffZFLoX2EVzbgFMux8QP+x/+HxQzgx19j2MKpDhnNL0IRiroOuKsmIIvj9v+94skahbJkRwI6QyaxW3lMteZq3VLl0kcvNrNG4v0v5NtwWaLV9fBRvvVbu9S8Z5kXbp6zmjgJfaPzK+NRMjaLyjr72Iaa1FCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTw+VDYT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTw+VDYT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cac59f8b64so445255ad.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044051; x=1783648851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=OTw+VDYT42H1lp2ouGANe5zt3jLSfGJSwq08E9juDh8Yi3voOgvVK/K8ona4CPPNh4
         Uqrx2ucHOK80II3MQBk78EF+8Wek1/PwDHvYrkxwNU+tfmAa8zEadUN6nn2Ut3nzwtrQ
         PW9AtNM3Nb73aLI8m1tXOyURBl/Yp7KWIzPhf7dtUUfHciUu26wVMP/y8AWENSIIxK87
         e+QrOnKHA+oCM9Onny5hZKwdedUc2skV3bWpjXcQR9gtmbGkPGrNKhpqPQoTyPlnC/sW
         EoalO3MC2wvVB1YPNBvbfWzU2a/uv5Wj/iEd4vhSG5wZfg5C6fSnO+LmKxJ8IEbMiccX
         9Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044051; x=1783648851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=Iqr/l+IxL2VAa6Gi4h0vp1Ug+ywbpLBEBoBQcvSimIfUAw9CJPic+x41Q6gUbgHAZW
         L3OBHM1UTFpIchM4wQt3tvgyCpnz+psg0/GHBtPiHF9tNRRjXKAmp5/tIE9qRi2hjFXl
         J5KCmoLE1B6XqHxDB4dOMc27SqAajhF6HGp58tka3TzKWohIoqgnSCmF5qOxuunzoJvb
         dEX36rXQox9tGSBC/t0iEGOWZBxAShi9wVMDEjuCX/RJNl1rR4FY0uudi4kQnMjD3UZW
         sloYT2h3jQ+c92je0cVXAjjjJ9jbvzdE1aa/JA0I/LAMr2XbGjJau2C87XkMPn7/4Dkp
         xLaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoI8ZxGFmonC93lHk4saG+z0v61XAhoo6TuFV7U9+DvRZ39MQ/U1H4DLa/9TCRGRsN2lP/DXX0od5Bz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/H1zjLFROWiOEeD/fIJSl+OS8wmYCvYVmWfiHB/Y/24sKKLv7
	hcOAuIGHjCdyUuzkpr7bLMY2QXyEDgNEGY7ngPDaWlXtexAA9ygAnLj6
X-Gm-Gg: AfdE7cmDnpaqlJUaoJCFvNDM45en8HGy0DWn+Dhr0MlNGUCcVk4IpHaekSNFrAARQ7u
	+GvuOe5ECz6+G2XD/PG+uhTW85fSFQaOg6YxXkF7fU+GFcAQoccsYq5dJkK+aZLxsolr2AeSpMW
	R/GM3ncm5dE3nZuwlkaQs6XY/r8mMMwW24OwA8CcELh+2MYkE935GhdGFmMv4lwkN/Nw34J7cgW
	s6yMERjsoFRuCoH1e9+V7AEV+g1PKguPHdZ1lQbCMwmjFVYZPlCsib8WAAPRckd8F0Dldm94NZd
	O30Qg3Dr4JcuYUawnGYr+nKRU3BA5y5BIX+xiYdQyZ5wQbZCATyEjwOkMW3gYop+HxVVyyaOrIC
	ASTFoCRj4/+wUwHLjTj/0LRg9El5WHz0Ph9vvDp3pHyA/rUY6mGLNvFCQxaDl1I/NBgnQWAHLAM
	XPkUonFS/McaA=
X-Received: by 2002:a17:902:d541:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2ca7e87f1f5mr99029145ad.39.1783044050535;
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71458f6sm1481975ad.32.2026.07.02.19.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Fri,  3 Jul 2026 10:00:00 +0800
Message-ID: <20260703020003.485436-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMSIC device on RISC-V based system does not require ID
remapping for MSI. So this device only needs "msi-parent"
property for IMSIC-based SoC, and the "msi-map" is not a
necessary property.

Add new condition for MSI handling on IMSIC based SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
index b3216141881c..91bbbc8924f6 100644
--- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
@@ -27,8 +27,11 @@ allOf:
   - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
   - if:
       not:
-        required:
-          - msi-map
+        anyOf:
+          - required:
+              - msi-map
+          - required:
+              - msi-parent
     then:
       properties:
         interrupt-names:
-- 
2.55.0

