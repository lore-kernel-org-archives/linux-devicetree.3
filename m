Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF736604B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128286; cv=none; b=UEQRgBul3c1sjBvlMdO+b2UCXsbI95IjkAvWR8bEIuUPeQH5iVUOCkZitJb8bSekRV2giSPUZHn5H96AIcyWscWwl0qb3T70ymqApVKCbnYIm9UC8PZh4Ar3RfBMLhQgyWBPaNgVpjgZExGumqVfz2yIihfd/dzUG1okags/nkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128286; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htrNTMqFrjp6UX/6F2jCirtD5AkZqpDSWXkAIA+H4dwFncdOB/lvsZIoR1Vmcbu6rrYyryotLyaMTG2CZJR6j44Wa/wj8Dc2Cya95nwsC0+YfkBabvJmtxhctxuQfsAuNcRmm3KuDgN2Sh9oQRXKK2Ex3MbFVdm3SiTLzNYBaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNfX0R2y; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNfX0R2y"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso960169a12.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128283; x=1790733083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=SNfX0R2yc9lcUfRiSDsNb+R4GOnRukcJt2y+Fh99P9vGd7cVuT2PwcaRBP6jZ6rQn5
         Rs5VeR/T6XPtM7DZSSdMiqCXcY1BYiS1fSJWO1WLxqNPqtbOycL1a+MUjF/7mm0SezUq
         46tvPhAumXtfmhRDLTfhLoVON2FBZghFataQuPGOX1mYztcyZS32b/HqXMxE78xUIRPk
         yx4DdxVbYIi2yH6ACj9w71EDEogtNNVyshgUCGc9LxKByVQCicAALoYZG8rXC9WUk6lf
         xxXos8Uk7ke43wPTZWUTj2j4sRt2gT5mw7Qo/zruvYJmnTi8wDCll2VuwvNJ0kiQy/DO
         2KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128283; x=1790733083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=UYw6vU68rbq9NpVT0ObaJ8EkrS7a+orjbVAne7oboaugcSMESBmlaKVXzSh57sRO+n
         Q0AcTiEPtdRvzJxKM7fl0qkG/ffCaUYofw6HPnV1WTh3fA3z86Ov1qnr9ERelPtI7WqF
         xEvL3+yXB3iGEizPEFaKDO2QtcUSmpBzp+JzLE2jioVVmACve1H47jrfJhnj0ylxGs9V
         c/QHaKIGXPa8yE2L4x9DB5WEbHaCgQUZW9Pihbqy/hpFFkiNHpnHG1lMS1jcBytdiwu6
         DTE3nf011y2JHSyvv0RLMN3saRM1J5iayuisg/CBl+hZMOKs2Ri+XnB/5TjCTIgCO9iJ
         ulsg==
X-Forwarded-Encrypted: i=1; AKwUvBxxIwpP+nun7ROzVeTj8Le4FDTKR2zs27SIFCu/OI63q4z/TTIqGRbDSLhE9Ak/K4FdLCE6N0fPFzEw@vger.kernel.org
X-Gm-Message-State: AFuF++l8Uc+X7YSryeLlbF2Ja3XKeuLnBfQsWRPAMwrcleAKBDmvlyTt
	hQQP0PdbQcWJEVBPqeddykFfZn1wihwczxSWexyiY0/0eQCeZgrbE+Io
X-Gm-Gg: AYBFou3Bva0/P2fuiIuLdcIfaKo8Sl4ziQzoKbxtS321imcghOH4PNe1CZLo/I6qQTZ
	wr+kK16wGyvNYHub7fYI2ZSTQiG5AoIKDjCze1x5SpIgQcra2XT8YyjNrsOGZ19TEnPFGsACJij
	ZS5DQ95CLrt4EG2UXWd7sysJ4A8y9MLrmVOOOsX5wb2Byi+jcA4IOGBq4zuns/Hln1oB204iyuN
	QX7NitJYBThYHw2mxCyHJ9f3YDXwqhmVThujg62DEvWKu3QtyZRsGDCC/XvJqdA0Y43BNf1VFHi
	n+hbY9z/3aZ1oyFu/MQdxMAti+4M10NUmyEEir5noVKdNJ0QIEd7fMG+PwRaYSPwfOgAlw8AP3O
	U3itmtF5HK7xdqqFz6lwZvcRSXwEm7frnwQ3wEDbMwFSuFXMbudd3Pj9Wu2pTGI04fjhQ+yDks/
	M9eGjKYxwiLyxIF7wyWz0f/bb4QhS3GFPh/VxfD2nGuG06gyI=
X-Received: by 2002:a05:6a21:4882:b0:3dd:85ba:ad4 with SMTP id adf61e73a8af0-3ddec8562ccmr2388263637.39.1790128282867;
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d67bbsm291074a12.13.2026.09.22.18.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v6 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Wed, 23 Sep 2026 09:50:13 +0800
Message-ID: <20260923015016.64069-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
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

