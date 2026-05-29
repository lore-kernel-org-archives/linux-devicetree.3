Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBA3E0234
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780056651; cv=none; b=lsDCsOoiFVStGxhxWUTjy0NDOfFpUYrf9AiwU3Q4gHMxKaIqeqzWRREasS3Cr9WaJmnrcaFaGQhDc6c9I9Q7BHx5TEZhZPiSXzdhd/kZzaiqYHK9XdV66UiDQbiW8ivI0qq5iIo95EY3mQhUWzYxyTN7fDyo4FT9oq1Nn2wUDKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780056651; c=relaxed/simple;
	bh=JnGEEFp8WTXWR0uwBO6AmcqSpeSfcYZH5tJyzNik8gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feWUmib22kIvdMQjXOhcn6kOJJeigszYW0ddgEZQlsai/sTJcCpW2RkNqewfNpePRdzyfURKOY89sEBRqXoYNTcfNtBOrXoUc/HpnC1dhXuP3OICkRoS6gPraBi/4WMB1DyWBBAXjiQWpRtfssi9IzkeKfK7FG7gLUhupJbC7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxRbdapE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxRbdapE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so1538387a91.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056650; x=1780661450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80UKwhf+3B8/I9ptiFQwWeU5LzEfb4vtDtyUw96NZBg=;
        b=HxRbdapEgceDRX4beW2i+VZBJyxGAOPQ7bTna9vcX6ATKFae4K66YJqhwdovn1RTbn
         AEhaZrMKEx33QTqnPTfeJ2EgLCp5x//xiInhsU6tmmCLEuGORpvHrueTREc+OnW6bFO7
         FcB+qZS3PT00EI66+wATRt1qAwkdmgoI6CBcSNNcpIiN2vzwssqgqA2+k6y3yEk9Fgaf
         ptRI3/ydHPTmTyblfZoq8gG/uGLGkJVD63mXls0r48Am6TvZKL/LVEOPKSt9v432d0RH
         LxWGM/toI0UdZBzf0NF6vtnwnCw1usrWUS+VMZFk0YZUE2Lq4M2byStgeJh6qBzw9kSR
         Bhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056650; x=1780661450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80UKwhf+3B8/I9ptiFQwWeU5LzEfb4vtDtyUw96NZBg=;
        b=XmYFeBT8GAInVI3NFiWQS+nPEPpOzc0Qw6wGGvaQWLrrBzdfqQuVKgCFLbqQ+KYycB
         Po560LqJJEyvdv3N7LwnYI42Kmgm37rvZiIj/S2zX4Jdwe+KFTJlLsLulGAyt+O+YjW1
         WUGuoBfpMv2WevdP4IC6mDpzGUMLX8WITu3D8DEWMhVLw9gZ/F22Khdk/X80RYQE5kBe
         L6iRqRRjxa99jOWw4cf4DCa/B7S8JicIim5HymC95HQMcjpVMmbq6wcgGRQg6iIQT/YR
         cIAkZljUOdGG06BTiK/2n8KT9GLztPbp7qJJNboFGhnX8qWitRxn5H9arRtKg64HIi2B
         FvFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/akUeMY3yGTuceQ3sFtwRr6TEVp2pNGBHlwlOtoEnzRgEPRuvGFfJvjfyq3kMFAY6lNEUIPQBJkfQD@vger.kernel.org
X-Gm-Message-State: AOJu0YwAeAAHTgTRFFko5PuilLxDNImGydB+I01ttakpweiUsk1aOqVz
	b50xGON2QipEPDEVqIiEGLfrvDnYROCn6hAehenQrz91c3vfwlS6eAYZ
X-Gm-Gg: Acq92OHHMQKV9zy0N2B0f6fAcoy4e7Dx6yqdjK58Q9hh42zlflb2BdL1Srj6MsdtNKb
	n9WzRWuxOdEAkQO3hin0Ix78wa2kMQEFjfWXeVW2bEQcZB8DtTN3GiRJDvTnsnUkUQy/UQHHmFD
	utaRKZJYGvnQttEIg37/5PuZ94an9+bIz2dz05WJMJCDqxc+b3eM9laMm7GEYS+LqRoTZvv3QRU
	0l/0wDi/zAIXVrPHvjbEJY8RiGwcnduACUk/YEzA9vno09dFsm/CVe5LIhknSv1k7M6sRAhnTEd
	b3k/mN0hAXHOlJllJ634+znvTlPTB9grbo5lTmJnogyGkB9qRiTLKcffumyiJzGXE8Yq3HsMZAn
	H5CfobuigKAiHma7M+AmL6x5qw6cG9kVTeuRGN7kx561BLztjQ2RDtaU98rDBp5bVpUSMus3DZa
	Ygu6mhALBZVCZy3+5iisQU+h3dbL1CqhiWZIwbvtx4f5RhgNRpDdb4cLotMBbmSAye4PcLtZiVF
	M4W++yTOAue6f+uhjW3pMrH7PcYiuIEj7V2s0hpbW0qfrkC
X-Received: by 2002:a17:90b:3a50:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-36bbcc160damr3225238a91.10.1780056649582;
        Fri, 29 May 2026 05:10:49 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdf3afc6sm942820a91.7.2026.05.29.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:10:49 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 1/6] dt-bindings: iio: add OSF GREEN sensor aggregation device
Date: Fri, 29 May 2026 21:10:00 +0900
Message-ID: <20260529121005.1470-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529121005.1470-1-kimjinseob88@gmail.com>
References: <20260529121005.1470-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe OSF GREEN as the first board target.

Add vendor prefix and MAINTAINERS binding entry.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../iio/imu/opensensorfusion,osf-green.yaml   | 43 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  5 +++
 3 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml

diff --git a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
new file mode 100644
index 000000000..626b41fb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/opensensorfusion,osf-green.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OSF GREEN sensor aggregation board
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description: |
+  OSF GREEN is an STM32F405-based sensor aggregation board from the Open
+  Sensor Fusion open hardware project. It sends OSF0 capability, status, and
+  sample frames to a host over a UART link.
+
+  Open Sensor Fusion is not a generic industry standard. Public project and
+  hardware documentation is available at:
+
+    https://github.com/opensensorfusion
+    https://github.com/opensensorfusion/opensensorfusion-hardware
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf-green
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf-green";
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..f1b1f2ad3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1237,6 +1237,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion project
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d7927..26bbdf8d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19977,6 +19977,11 @@ F:	Documentation/networking/oa-tc6-framework.rst
 F:	drivers/net/ethernet/oa_tc6.c
 F:	include/linux/oa_tc6.h
 
+OPEN SENSOR FUSION IIO DRIVER
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
+
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Rob Herring <robh@kernel.org>
 M:	Saravana Kannan <saravanak@kernel.org>
-- 
2.43.0

