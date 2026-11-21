Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221431;
	b=xI1OgnJbzXlzLOiEoFzBabvtZsOdiz1xJcRhYTxK5T0aLURrn5qMi300nf9et9ZkNfRx
	 KOC2jEKu8qni7bp6q7S6fVafIpa/hKPgH9tb4wpjLmhaDAcN5T7AnQNxBxiCFQAcnHPYz
	 gz50U8mGMdmM0XjdwkMMBjqEmgH/0Vn4L6aHGxU4Q+wuf6cvWRrB2t5NPL8zPGdqGB9o9
	 uIl/cM7nxto7D5kH2DQ0+bOuFcGbUbC3LkSUIu9Auimck/L4yM5R7Oaom+JkJ4BWAeR4O
	 AB8T3tB0gVz3ILjetRrc9HVs2/Way6nk3YEAj1FBe4SbeAzSELXSjc59qgxc550/eew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tABwpsQwrh0QjJ0q1JegOwTwekJ3gPLUER4Cwmf2WjA=;
	b=1dgi6bDdqt+jisziJ1WcaJ3iA/O13hb7GNxrOl2U5mgq6l1pkI2BBAXR0hPJodQx+XAV
	 AiaWNYA6We6PJebGK9DFmVcuUEf8fmPbmXPDQCTRcBakE04xuABS7qIQhUxQ0JDZJg8FH
	 OysknEeO0kXy0eVacRofWVYDrF//Cxb1JKIs7bDUMtDIxH9Bmy1c9+/UWuAYrOZ2IznuF
	 kb/2cUqDKENDNwDST6Go787SEYN+RwBf05aczhc4IxB0qPNp1424cPSbyWwqfGvEbJUza
	 sPd35PgdBR33TR/XvjfFZeLrb+FoxwetMLnPfzl8YnGZvIzPXcbqvP7djPN0DdIGlbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY31DhA3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD10606A6BB
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD10606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RY31DhA3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so1024088f8f.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795221419; x=1795826219; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tABwpsQwrh0QjJ0q1JegOwTwekJ3gPLUER4Cwmf2WjA=;
        b=RY31DhA3gi95oT5z4yw4u9QLhWUemT1EP9omO4loJL1T/Yw7egVM3w/xoxkcIespNj
         uwzsFSC4MtJg2/HtHwoEvCxUyX1JpXHW1+EulR3JLWtPqp3x/lPis7lukdRmCFIwQDH2
         JFdADIX/KY+TenGN8S6bOCWr1oySky2oi41knT8zod8qCCkh9dH3oywZrrq+2owZ0/zi
         7g4f3t62XVX+oAeWSAelZ5oHr1TvUNdnPPyVDA1r2vlHHqm2hOtR0K8miwCm/OrQvTbx
         QKZ2+DAdommIzJCUbVD5633LKH0sXVLQAN3/3arYfWPHmvRFC3AgGNKDJP0KMfyCKmXh
         9Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221419; x=1795826219;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tABwpsQwrh0QjJ0q1JegOwTwekJ3gPLUER4Cwmf2WjA=;
        b=XBvYGHWuF3WjjYfh3xpXOhJ9q9YCLVV83XXHYMGPrET92v8HUTXR2qtsqNZh7HavVu
         0gh3fZWnG4n2qPEUnnaM1WcM3rwSplbT4lb/MNZUBSzmDeRN9BLxT2CgRb4ExvU9U/+V
         XQ6P8FHqf0OvvB4SuQw3ysPL3U4PqYB4B313BQgbTN5U5QFFpVtaHhnhctlybhXqzaxD
         bKENeQg2RWr3qGOdq82fE8zzfcfdGw9bWs9qK23CenQ0vSxabYHaCaZAeCfKztlGqF5g
         vq6gxzErnau9PfLgv2bufiawBu2CmpRHnHMxRQbG2wtKzVL8YO/TuzStE3pX/KGktjZ9
         0xmQ==
X-Forwarded-Encrypted: i=1; AL+hErFP1RNYTQwVw89OuYzVqfg/i0IxtJBB7r9M/SUHcqlG8mRm1C7UM0DNp4kxC4NoZBVT0s36P0hR1QtA@vger.kernel.org
X-Gm-Message-State: APuU4Z8AaeswDRDYkEKVP3Fo+e6R9lB/NE52TmP9sVaTn9yILAGQzs6v
	G9tM+yBpdMnfqexI+BgvuJpJndSiM/JlWdNyldEEFiuGGiR6qe0FcNVz
X-Gm-Gg: AZFdTZduz/jyXUL+dmj5TikdiLkc4g92jjSgLYBwta/l0CGvOUPW2ZXSdJe928E+Rfc
	E6f+G6Nu/BcDmjPDkLwz1XsV6gqUGo7O9IqDI2iMMYV5vfuwEx1JoGXu7fDiC1URdHyfEgHpv63
	DJbKBS4p58ljzXE7d/1FQFC80cLaxuzM6Ou1RlYbDnv8zKhI8K+kL5tWSuk05YLrz/mrDA9DIyX
	tgyGOIJqSaPrQmtL+0zYVbawmUI3cZsbAQTmNsnX+6IX6sOAEJ06eXxmLZ1vEbB53B8/x0jJg5Y
	zFijZNBNwQvd9mh2EXBkGaJe3UlNaNZe7QNuK8vhyxZb9M6s/hBbqY1lrqsXd71P2HiE7gWF9ul
	RJjTXE9nP4jHH5hgZ/zYfAOYHFD/OoaqS+YFzFjWnkLetnEyrVP41pe2//mxygQV2mZ7mk/CzyG
	tTdY79R9XjgAsmwr4ZOssmYTcdW3oy/PV26p5YlIbqaithbSgWWAyBSJ+n8yXSzQuQ/kjHdFhnQ
	EEcDKatAry1hh0WCHj1qaSPw7eUl/XnSJpjvqO7SvwXZ+OnzxAyLIAhvP3idXOutVE3kM8r+aLA
	Pulr/RJbxQaVHMrFE07Zfu+k9Fvb+4Kn8w4Zsgv9ufLT8lrD4y7bhBNxIl+ehawvhnIJoeXmeXj
	yrPkg
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr11302603f8f.33.1795221419059;
        Fri, 20 Nov 2026 16:36:59 -0800 (PST)
Received: from [192.168.1.15] ([185.69.144.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm7203278f8f.27.2026.11.20.16.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:36:58 -0800 (PST)
From: Dale Whinham <daleyo@gmail.com>
Date: Sat, 21 Nov 2026 00:36:50 +0000
Subject: [PATCH] arm64: dts: qcom: Add X1P64100 dtsi with fused-off cores
 removed
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-sp11-x1p-10core-v1-1-5fed8ce846c7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxG4asgz1iKU8rQqyAGGn6oO0AUtwgJc
 XcCjN/w3kaGpDB6FRslLGo6TxlSFhQ+3TSCtc8m73wt4oUtivAqkcWFOYER8HCdq+oeT8pVTBh
 0vY5Ne9v+7y/C79zQvh8775H8cwAAAA==
X-Change-ID: 20261121-sp11-x1p-10core-ece30a046de5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795221416; l=2039;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=ucZh0rrrTKCzMMAKIK2fAxwZBMPKDCo7fqu8jragjJg=;
 b=+2UtxI6xI3S8/4D/sR+VtRDaaRmzJ3sDysyTSjC5UmMk3kr+oosXp17CoTOKEGpcnG8XKi/ER
 KFclw1YrnC9DgTVddb9LX/Y4IKEFZnlQWOfH5w4WtshGxPPBDDfoX5/
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

X1P64100 is a 10-core binning of hamoa: the last core of clusters 1 and
2 (MPIDR 0x10300 and 0x20300) is fused off. The Surface Pro 11 LCD MADT
marks these two GICC entries as disabled, and booting them via PSCI
fails:

  psci: failed to boot CPU7 (-22)
  psci: failed to boot CPU11 (-22)

They also show up in the cpufreq policies' related_cpus.

Add an x1p64100.dtsi on top of hamoa.dtsi that drops cpu7, cpu11, their
idle power domains and their cpu-map entries, and use it for the
Surface Pro 11 LCD.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts      |  2 +-
 arch/arm64/boot/dts/qcom/x1p64100.dtsi               | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
index d96202e2afc6..cbe2c1a4adc8 100644
--- a/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
+++ b/arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-#include "hamoa.dtsi"
+#include "x1p64100.dtsi"
 #include "x1-microsoft-denali.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/qcom/x1p64100.dtsi b/arch/arm64/boot/dts/qcom/x1p64100.dtsi
new file mode 100644
index 000000000000..ee6f2f3b6ef8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p64100.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Dale Whinham <daleyo@gmail.com>
+ */
+
+/* X1P64100 is a binned hamoa with the last core of clusters 1 and 2 fused off */
+#include "hamoa.dtsi"
+
+/delete-node/ &cpu7;
+/delete-node/ &cpu11;
+/delete-node/ &cpu_pd7;
+/delete-node/ &cpu_pd11;
+
+&{/cpus/cpu-map/cluster1} {
+	/delete-node/ core3;
+};
+
+&{/cpus/cpu-map/cluster2} {
+	/delete-node/ core3;
+};

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261121-sp11-x1p-10core-ece30a046de5

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

