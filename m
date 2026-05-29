Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623183A1A38
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 05:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780032183; cv=none; b=Mjzu5FCN0M2xEu/tONq08vuSHZN8yhtJfFHIHhzDDdFDgz1PMCvz5kTVBt183cFTv3SN/AMGSiMeayOkIOoszrXt0ibiXuxYVGjqzRMAVpTqlcgktEwACpfA9HwYqvOBrIS7XkeM2p+c7K5b408wBqsEG8cxF+jgtKi1B9Tee2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780032183; c=relaxed/simple;
	bh=uVEZU/+gipWULzqX7BJdsxlQpV9amP+FJ2XDIND7gxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDZpNvTdS2wk82v0AZclyqDswe/d0fPmAQ2XdLC0T7ZPGykBKJXEYhXevFEQ93+ov3QGFEzphCyKNI8cNf1DKU/gvi2bQHJLC18ELUGVnTF3jbgWixxriUMSAua9ScioINTc4CK7z9oO+sRB4+SptUOy++Nlzv3mroPe6zNoMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkQwhhex; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkQwhhex"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7de46b8e432so11861426a34.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 22:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780032180; x=1780636980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwqBkxBqToEXWExg8efj0rcQqkFJQIIdG4GoWkLr1k=;
        b=SkQwhhexE7R60DljNv9ohdMXEzSnfrj0pAxxBDOWT411u8zrc9ZF5nMVbQ4a1qQE+8
         64U/p7HtoVjilzwL3qW3Mr/C7p5PT+xTyH1t3ykCULWc4rhNAvlEtobuuQyc/9JjoCWk
         RSVaQ6ylmjyG64lWrWpLTQ1AGpoVSn1B6E/gsZfMCEJl1FEHxMEdZdjsUJhMRxRbXDXk
         LYcLTALqEWFdk6pXYrDAzaOfm9ePv0gvVnGyXFFSVzAIfyGS7ejPhSZ3d3ykWp5z+zbM
         qXUD/+zRS8uNp63xQkbQCF3+0gzLvP7z1BzYrcIa3qkkDxOF6F+4TsgFec+je317hQc5
         49Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780032180; x=1780636980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6kwqBkxBqToEXWExg8efj0rcQqkFJQIIdG4GoWkLr1k=;
        b=Yd1DnA/cq14FloPQxsbibTibexbVyrHTKeV6K7nG2SxmCgokR1NhGgKHrjvU6rHSqb
         JwR7YUWNLFnVBd32wpCrvvQLJgNTH7Qd9f9RIJvv25O2dL5dW39mUXFkh9wFBmcpyF1R
         69tZJDIbXiyxwfYRLvFs2xia+BMuJ3KLa217+OB+iRpA47rWiaoBf489oQAhjJQM6L7e
         f5/fkk9gcdXtLNj1jbeT6VMAa5LkS5zad1j7BXCkhi7wx9dS5CdcbeIiQAkyE7dBETlN
         SVb5aDC9uKipeHXOxM4M96Rm/CmVJ1S980Q9PGgVHuk0wUJQX4czrFUY/Gre/NNmb5aI
         OxXA==
X-Gm-Message-State: AOJu0Yw80FMzQm+Q1eXc2Bpsn62mriIw27icSwNOt4RShSRhAVMUGpAS
	1tF8bTpOlBzI/yYHhPj+rF1NbuRHVBji2YskeK+8u8gl+Y0ju9Bx+fgeRZGVFg==
X-Gm-Gg: Acq92OG8p0Je8jc4/WCiFMrLxst9zks+BW9dqR7M7j6b1ZmCZWE7Kp39zTKEChh17jE
	XSZWVZSAqGbUU3EpsA85Q9bWEilHFLGTbQJgo5oF2cKkoutg1BKXg9ALss9J6tRSTKu6INQ/6dW
	1pu7At1QxGkfeHbFvcqDFMDm8JMCTnQ/rykwLHk4ngX3yno/L0n8PRFpv6C1+qVEk8xKLJMFXnh
	a6ljiRCaCgem+KV2jLN68ehwdSKhfpRPX4MfzbKvrhAxNoHoSwX/xfuaoR73D77FVMDBUx4qfq2
	+0Dh2v8hHXHFDJ3UHag9/4zsnYPl/qXPdsXcWnRANW8NSkpiMdtMbkKcBsa5SH55ZN2X+5c/GKe
	2uje1j36Ui8eBrMndLlcr1v8G99xOXx6PkiIEySjfL8qjRYIkw3MwSXs88HAz62NsHJwqKzPnXj
	mQvImnqDQ2t3252J71NE38b41oNrOsHTcLzxtAa8q641A2BRzrfJDT
X-Received: by 2002:a05:6830:2118:b0:7dc:ddfa:73e7 with SMTP id 46e09a7af769-7e694dfa401mr929130a34.2.1780032180459;
        Thu, 28 May 2026 22:23:00 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:e3a9:78c5:641e:a58c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695bd790fsm760909a34.10.2026.05.28.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:22:58 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: net: dsa: remove obsolete dsa.txt
Date: Fri, 29 May 2026 00:22:40 -0500
Message-ID: <20260529052246.4934-4-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
References: <20260529052246.4934-1-akash.sukhavasi@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dsa.txt has been a redirect to dsa.yaml since commit bce58590d1bd
("dt-bindings: net: dsa: Add DSA yaml binding") introduced the .yaml
schema. The .yaml has the same filename in the same directory, making
this redirect unnecessary for discoverability.

Two files still reference dsa.txt, forcing readers through an extra
hop to reach the .yaml. The stub has not been touched since August
2020. Update references in lan9303.txt and
Documentation/networking/dsa/dsa.rst to point directly to dsa.yaml
and remove the stub.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt     | 4 ----
 Documentation/devicetree/bindings/net/dsa/lan9303.txt | 2 +-
 Documentation/networking/dsa/dsa.rst                  | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
deleted file mode 100644
index dab208b5c7c7..000000000000
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Distributed Switch Architecture Device Tree Bindings
-----------------------------------------------------
-
-See Documentation/devicetree/bindings/net/dsa/dsa.yaml for the documentation.
diff --git a/Documentation/devicetree/bindings/net/dsa/lan9303.txt b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
index 46a732087f5c..0337c2ccfa9a 100644
--- a/Documentation/devicetree/bindings/net/dsa/lan9303.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lan9303.txt
@@ -16,7 +16,7 @@ Optional properties:
 Subnodes:
 
 The integrated switch subnode should be specified according to the binding
-described in dsa/dsa.txt. The CPU port of this switch is always port 0.
+described in dsa/dsa.yaml. The CPU port of this switch is always port 0.
 
 Note: always use 'reg = <0/1/2>;' for the three DSA ports, even if the device is
 configured to use 1/2/3 instead. This hardware configuration will be
diff --git a/Documentation/networking/dsa/dsa.rst b/Documentation/networking/dsa/dsa.rst
index fd3c254ced1d..42a99f5dfa2e 100644
--- a/Documentation/networking/dsa/dsa.rst
+++ b/Documentation/networking/dsa/dsa.rst
@@ -509,7 +509,7 @@ Device Tree
 -----------
 
 DSA features a standardized binding which is documented in
-``Documentation/devicetree/bindings/net/dsa/dsa.txt``. PHY/MDIO library helper
+``Documentation/devicetree/bindings/net/dsa/dsa.yaml``. PHY/MDIO library helper
 functions such as ``of_get_phy_mode()``, ``of_phy_connect()`` are also used to query
 per-port PHY specific details: interface connection, MDIO bus location, etc.
 
-- 
2.54.0

