Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC6413D62
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788811169; cv=none; b=NumsJf5D4g2Mtwzq3c4sIBBYPA2LXLh/kIrY1Z/vEk7nugzwpjps6o1U2whDSWH8u4EBUVDsBp7lQtXesWQYLGLM4cmtAp8k9AUThbpkmMKfyoO5UOB5VxsbYqzz4umfsvSg2LmbrjPD06Fu8XS6T6L6qLB+4xznGiL1DKL175Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788811169; c=relaxed/simple;
	bh=wQRPeTV+5FiLTxMGarwCwCbNlevB4Kf7DjKdr9Oovgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drPeVreCkJ3pchbt0vx346K5juZfLYKMjJp5nIwmYw0DLsd7gdCsZiDVhpetr4Ohe/MSOR0PdMD+biFC8WF27HOHGiwjiV0Cx7owqgZFH6QxeBG162w45iNWJvMqsT4ivXHGnMFtrtLxiRyQ6EUIT/LLgWNGW02UvH+MmHXYEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI4xIdM0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI4xIdM0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3335298a91.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788811167; x=1789415967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=AI4xIdM0j9JRxqwGvBwSj42T9yJfq2gGSTeC0GtNDmS9VWeUS+AottAkY7EnllV5Km
         p+fJuGHUWpzTnTmeusZExhgICJ5vI7agNyhxewXwBFQAbiUSXEDn0oXOcUdeZQlPpAHJ
         NGVDPHgR0J4DtrCzbCPA3S4coJdPAWyFYQlXgd2JVXCiv2oPfWHB720GXgOvy+kJXSwU
         IkO3AhJuZT8wr+qZAFcXn+gBbacGyVKs8vALoIid3aSGZB1CiIsNiP4Znflyu37Z1gk3
         7j5myQcJhPWoxxtk+yECs0tNVmtqeFYYT9zQu0x5y0kN1VFXYlANDBr6PaDKY0pIVkFo
         EwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788811167; x=1789415967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ykn8R+5bxXefN33Ze9iKBwEjjXnMgUuxZmUBRl5EBxg=;
        b=J0csEsqu5Q2ZXIAYaAx3dRKbnVyWLKIPExW80+rioGebCOsJy8oh86ZirKFvqmEEkd
         FKS3/tK0CezaLjQI4TaChEd6RSnFboZLYDNLKNw0tkR9HGEuXKHCtNrpiBSyjPTJeFgg
         jZoTch4gjRv0rslvk+5148kKJdi92m7nziHLPCpAQW6cjI6/oRXmgjrp7MSsX7fvv+HW
         HFNKo5XKw/SH7O8Ie1iguOzHgIc1k4c/tMT6UJr+P7wI6w11GfwvCwbzLScjSShWldHC
         Atu/lOLUN1X02RRlRWrcnHQIkS630wLhw/YIacND3z3Tuj3bkp3+84ECWwEGQ88BFyUT
         XvOQ==
X-Gm-Message-State: AFuF++m9DEfImajgPg4vtlZRWVQtrPWD6W5XQDDY8R0bZhCI1FItBbyh
	X8z1KNqAvHDc4PRn6vuy5MQm23SLXAPg2hlXKgpwBFLxPO5B8HWNfpERkCql4w==
X-Gm-Gg: AYBFou34AEuA0Fgx7D+6E84tKJRQCs2X5eFi4ZaydarIFRCUg9yxRCyLR1nxG2G5SQz
	5s7B9iasZNr3FtWM42MxijaDpqehgpds1oZ8znDsnn2aeiOMxI/rEhywIWMESaV8Rvs2/MdUBp5
	LUflgsTS+VerzMdN7qq8MKiHy8j4kik0KpavkPxL0Apw3p8cs6mYzg71T/pW+c3r9fiVfxR5STl
	AyI4QnAtGPgDGezHOialZzbWEELkGN6KGsH4qFLoQKz7rv9PavdFdey9AjQEeeNwJO4x0z6ovyh
	pUehVKXhfO2Q7F/d0QY3HYZw2HiFrVpfG11yz/KxhuHTfI7nusTwjsQ97i6K2vnOfJq2xo4hs6E
	gOw+DlocGkqDTn1Q+YCMuolY4pPJGOU9EKDckSa5UXQzxzyrvODZPotijjVdI5TOvEL8plI/tjH
	6VtZAzAD0L0X+lx06o6kF/KJH9trIYo3pQq4qMAkuTHQT6o497av8SqYhJYQXr4q1U+VOvN3i7T
	NqegZbjye2XkLdbrOJnuMUS2QfR6OZDvSaLTj5YWZR276lVYdxBz08xP7DQRdI+HQjiKgBG+8Im
	lc9Cu5+YmceK9qOdPKoq4EYRbxdYV8Jtk1KwHg==
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr34312237a91.21.1788811167343;
        Mon, 07 Sep 2026 12:59:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b58187a9fsm3683932a91.3.2026.09.07.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:59:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: AC87U: specify switch
Date: Mon,  7 Sep 2026 12:59:24 -0700
Message-ID: <20260907195924.29510-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add labels to clarify which port is what.
    
Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reword.
 .../dts/broadcom/bcm4709-asus-rt-ac87u.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
index 59400217f8c3..2fed02ebb1d7 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-asus-rt-ac87u.dts
@@ -26,6 +26,9 @@ memory@0 {
 	};
 
 	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
 		et1macaddr: et1macaddr {
 			#nvmem-cell-cells = <1>;
 		};
@@ -77,6 +80,43 @@ &usb3_phy {
 	status = "okay";
 };
 
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et1macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			label = "cpu";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.55.0

