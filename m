Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E4B479883
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780409; cv=none; b=kEmFRHqsd5qRf53ru3llLxwuz6trcskNAhpczSGyabBQLb9D23uxrOhMQFEYVR5fZ+szc61XkEDq+3SZ137aPa9YeQal68K8Aiwy7ng/zeczxefuBqIPhe3k10eXVdpoTJRT46HQ3C5cdVgmT6ZU48gOJeJ506g2MeUwMJ/MZeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780409; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRUdLuySLMu60g7J7iyEleS2qsABg46o0r3kwyt7UF6JeR9EIHToRrLDBBE8kB05YPRWfpguhVe69UomLyaqEEAtnbXwGJYwr5MTxsI+ZKaVg9TpjuLfe22hAK2YIXQM6XcykAAGzABEFZWst1AUt0IMdKIq5xo0hP6tqiG3Jfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mR+NHtXX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mR+NHtXX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8541875f596so1218370b3a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780407; x=1789385207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=mR+NHtXXZNgFzM27AhG2MF6G4HOtaLwfdm84EUEECwn5sJ7fFhnLdZTEAHKJeUuK2J
         V0q6tP1iDPwTVq9R2KrCpr70/qNf35QYsxIv7ghP/c6KLl/j0blnWOiOCVdb3besR39A
         W0HBh+U4aMzVE7yKdgL1htRWncl4cWetRukrks6P7jhTaF9GGlkKs5Ds+hluvk2ra42p
         Pf3gwPeWYLrXqKJL5mCuw9Q4uXJZlXTJMVq5EXBaCb0EW1Ki+WBcqrMb9gSHWnaEYGHh
         NW/nA5b3o3poax4mvarzaxndiPpTfvg8nliKK7t7TjbQ2BE+N9VV8tXOdGajeGhJ5yhG
         a8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780407; x=1789385207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=kEYV+WVE3sn6wufAVN4pm5Ktn7+qpG3mQBhvBiFIdv8DRDybEr9HIpVU5AqdXC0wl4
         vTUNYUlRz0Uq59fPYSuM1p3Q+6Zu+ytLI4OSLTF4nJXPfed50uv+o1+m3OrTf1uw+mAr
         oxn/vIQq85VGyl3Ykwzmt9Yss+RRZIR32Dcqns6wTQYPeoZ8UNPRCTHksc8hvS3KDqtj
         f8h84ynAaINezt5q7u3yAYIrvR1sZGitED31gBQe+WzJ5nlCnJMAdgrwnBLd58XmndeT
         bMS+P+D4I9u6N1xGkPhm3fSm5LHCL+dQbiyE7SNGJPuJgIGxXgzTuOkZ6ZJHYajSJS+g
         W7nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd5+yYDHaICK9AFVHuWmkmawG4R/BZwBjWJG8yEdpSqvqOkUl2nocxdnf+Q1KJI5V05OmPedVF+dUG@vger.kernel.org
X-Gm-Message-State: AFuF++lKZa57RX726iCqNa+ngrTBKcZofKqIZlH0ieHKEhT+QREt00sF
	TldYnOO3p12ZDus4qzC+8cBLs3u1kGtmV6rf6CjRrv9smgeeUdGkbBpR
X-Gm-Gg: AYBFou3CmqmCScnzyDsEboAbtqJP7OhetqvYigkXF8ojo8I2xF8AgJ3nIlyeEsHozVH
	hSXl9oLOKlx2h6xJDv4s+GbzxTfAdTj4m0i+QkqKWM7C0p04OoThE6aW2fX7lidx/tTBhfIsYWt
	1zTWba1j6qWyj84+UVIAJPJNWfSxU2X3nZ9tB6ZRPBT9YMyvmXMYCUIZ9FgfK5021I5c1ZFPgKY
	KKyD6QOzRvUvzrLGPPaXX4q4o6JuvVGvLMTiXztzEdhfD7//fI0GEHi4OKKnMlUXhKaI6jFyTBS
	HkGTKEQ3sAtth/WNON8KZC+svUHc0oV9CApAMKLVXosaTCbNI5kMMqyLNvUPRI2mdw2tXrua1LL
	aQ2cgjlj93eFoVViNaH5aDBrXoWtbklhFi6SReIh/dLu2CdMeCb/88X5TJyRmSEgJstvBJ/0VFE
	by1+yX4kmfPbG6j4r7fl0COENxvcaZis93Vf2E
X-Received: by 2002:a05:6a00:32c4:b0:857:73e2:9107 with SMTP id d2e1a72fcca58-8616c8498dfmr29556641b3a.23.1788780406647;
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f67sm4265654b3a.18.2026.09.07.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:46 -0700 (PDT)
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
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Mon,  7 Sep 2026 19:26:03 +0800
Message-ID: <20260907112606.465778-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
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

