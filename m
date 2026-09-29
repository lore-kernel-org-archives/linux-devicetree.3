Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83E47DD58
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671100; cv=none; b=k6y3GBeFKLsQp8V3+AkExBHy40Ws7Ggqpzw3JH/iInhjaN3YZZfEmd38LhAwjTe35x/QAXb8V5bwLg1DzrLyqRGcJmyWmUJV6/C5rqqkb/11AL0OAxZ3Wl2muJROzL1RxOWHrcaXprsM6v6mhFvI48H753PqPUvIhyTxd3Enn3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671100; c=relaxed/simple;
	bh=L3fsKyGi5rpLNg8G/ROz7kxtpDKTfFUi8q+A7hQ20Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df6UNXApF64N4fbt+uy/j2BXy1cuAFeYdhHVIklEG7DxVseiIUBJa3k/raIrWYEWvP7YJgvnk8TsM1S/HoNs6OCRUHz7lX3I1xbRHa9iy9sTfLKkSBvWHT7nFNB84R6iBtz3jz0Bkw1wbhquLu7i8ubDOUV/c5DT9ABbYfpdjv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfLf0uyW; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfLf0uyW"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0aa9d356eso3080349a91.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671098; x=1791275898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=DfLf0uyWUU5DYCLeqZXxmnCbBMN8XZfYhdj2XXgoLkQpaN4Rfk/3a8q/ujgZcpohtu
         PFEUCIM0fb3bkSUmB7AhBX1GjpbPPElQvTEK5bL8nT/0wAXVTHgu+aWYZkwF/YPPCIoY
         DP0k4STUBwTea3C1e1p/DYVWIAAjK11tjo61MmjGfoY39Rc56RdwpcapGVoqnDKuCjbn
         +iSTkSTpAC4M+e3FLDeDpX2ufWNpoXo2N0IhlDD/KlAYxGOVdD+nOppzOdaQyKKJ6k4K
         CKE3ql6ZRw4OTkSGnr50g9T7UH1DNEgm3IWtQg0Hmtu+I0emaNgHoC+4P2CptcMWdxbM
         HcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671098; x=1791275898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AEeGlWy9uXP/q/PPr93GfqgOECgNHQd0LWMUmr1tVw=;
        b=D5Br9wn9Au+P0Hf09pDGye2z8OeCZ9E3vqfeCx7k04u6/BAVQkToMIkv8tWfSQTurJ
         euma6ruB1MDQPYt+y9kxJgu4L57ORlbQpi5SqRz7WRbijUO2hP5XXwuwRZruJDcOlfRM
         kkd6QAbtkboKzAAth+gdWD3naOvhuvaNxRED9q4+sZgEUHhmmU1Qc3Z+CsKhR8iOpmZO
         LFpjlcTQmeTGfNW8KJ9SSVnoWG4oMloDyAoaHUsRO/PTTy4N0uK5+hh5QYteZpjoKpsZ
         pXZuVcVxCcTFphcEi37XSGDfJ5KxpMTGnltJkD29ZAUoQTt/+ZBbsPTpsLnqalTcg69J
         9Glg==
X-Forwarded-Encrypted: i=1; AKwUvBzPd57CbcVQyJj+W1HoPuMAqP27Hc5gx+324zHBXQssgQM03i0kR+NrXDh1jKFar51KQn7z3FJHkhnI@vger.kernel.org
X-Gm-Message-State: AFq9FYLsi79Gup3bF97bfjDhJugxGZjA3CezcpM1m07uDqK3S0sAsFZT
	GbHJOZHlNPi3orz80GKMebYytx1l6qTRjf2a5ZdVl3ObI+Y8az1zJt3Q
X-Gm-Gg: AYBFou0bZh0L73ljIjQi+F9Yw1Z1rQaOQLuVKD0mYs0DGLXbjjWU9u7/XeMzd3lXoWe
	DzmbRKz04GOZkb9p6EfCDskjgE+33mmHKf5b1euQlmz0eocXG7eFrPrYj787p3ca9h+KaclRO1M
	kgTd4B0sa7hepdF4DTBR0NFhyPD1jzWL8aff+trpFOSTVk/bY7+yU51BNTgqI56/ZbGHyC4wp31
	DBWdD3GjmksSDiD2d5gMdEGt80jBOyEuJSrkBttqIeeoMXDlekYZKz1bEboYItLxsqIB5UgGYL2
	kgP8RtlheU7TdCjlXiQuZx1yKL6j49AlQT2jtFUdgZFIwLYfNQWUozAQmkI0a0IobGXws4mC8rN
	o63zykgApBRD0O524fi8MT9mLcV9mzXQ6gEJ7JoomCwfFse2TZLZxxkIgpD9smnKNg2sRPCA30t
	zztECCeRUJGEtQf/8aJuDZl9puMdo/QdMIjsT/peYWbbs+O2Q7jO0+C5VmvdRXvfo5PSrZ
X-Received: by 2002:a17:90b:2251:b0:3a0:9640:8031 with SMTP id 98e67ed59e1d1-3a098d4364cmr12391254a91.8.1790671098293;
        Tue, 29 Sep 2026 01:38:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3751988a12.9.2026.09.29.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:17 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
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
Subject: [PATCH v7 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
Date: Tue, 29 Sep 2026 16:37:50 +0800
Message-ID: <20260929083755.458238-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
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

