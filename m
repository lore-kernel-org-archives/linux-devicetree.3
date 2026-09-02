Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED741D4D6
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385420; cv=none; b=lt+MeZp3cQdgeecBq+bAdV5H0gOC1jmIT1iv45p/WAanarLSl8g1z4OjAaouP0iAX6CorwQaxDe888cF5IBxfxkBZ1oKhO0UeplxdnOjmFuTLWCki+PeE12ts0pAy3RzHgtOtkfH+oEJg/Di93QtfSLGFek9mv0nTBJ14Ic3C1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385420; c=relaxed/simple;
	bh=TP1Bh8BMB77s3uGsbNePeTglxwrDKfUoi3tjClOr/kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E67sCgNgDCEhWrIMZzYfVAfCrlNnH75Cl4HbuCcGFTG0uDeq+5utnnkEsoznL0HC2FVFozv6oB9zZ17Lul2oAOckHFumrezBm9U5IdYcA6tGqozE7co+HeMAJkjhFEnb2kIy8IRwuNsKUe1qbxROhgO5buzq/6K0UP/OpPwtTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=nFTVjEkI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="nFTVjEkI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90e8e70fa02so20398536d6.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788385407; x=1788990207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzNUro+3MyICCA3f0xAO39ZT/LJoY8Qojj7g/8tVsbA=;
        b=nFTVjEkITS1unsGevX1U/mNUFgo30gcNN/QKrM1R1ru7sf4Jgz8rGjgs5pO9+umsxX
         bb3kvlQlcDy+fMZS3BjPpe8OvWLOJhNuW91/laOs1Pfh1JOJVzUIZ2JbhzhSGR76w4ia
         XnDdE85kV5Czs3Zh4lu+z9rrwk/PdlpjoyMyxpAHF16XkR8n4OVSxnIj5lkNm7GV40JU
         QtWYKWjYGpLcZAR3mig0StehItKN7TuvbL+mc0nmPuGQFuzgvHyblAkCsmNC/vG1JDXA
         WpsyM5Evas5sq/r8kUylrg3k57w+UnQlGi9t8jSTDv9tF6whg0s4bRuHD/uQG+YytKYw
         XrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385407; x=1788990207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzNUro+3MyICCA3f0xAO39ZT/LJoY8Qojj7g/8tVsbA=;
        b=stCiRGZAPdCekgiVEL2JhtkVWGOqqdYJ8y7gD283F4p3LwNcuKsooF8vM8i46zuE0J
         V16K0JMh+2vkEj7H3jrQtNqSUdvfEr9l+4QyHp6cabgVCFYfKM85pqAn1KpWcHqcYOcW
         SpogPxP+cGHAfkNv87X+1wbj0n79fgHDsMZuKXxlxcRVX3KFOyIP+2s26bklUh7cgFQ5
         ZyQDB3G6uYVcoVuaAkJxKe0Jvbg+voaL2bY8JqBceg0XkFj5cgUwrNzrq71Vwf1COx8a
         SRlPj9hYk+SBXc5Joj0TmQieQENTff1dMaF9+2L5kKcKewXmQygL5Fyft432JGn6IrIb
         Graw==
X-Forwarded-Encrypted: i=1; AKwUvBysg3N/L6+gVNrvIBGzhrwdiWqpKL7tpHAnhg4ILQlWTtECgymndplNQRWj0eyN4bXBo62DjNgYyV0j@vger.kernel.org
X-Gm-Message-State: AFuF++k4gOggR6haXI928AAOhBHmErsDeart44Xg8zaoDWbm/kXFLyvJ
	MbJL7B17bCVJZF1Yysr0VkwTuNpZ6kTBuN0odE9Em9a4gczN8idVQkP80Yp6Y9yVn7E=
X-Gm-Gg: AYBFou1rx7tTkHuiinEntojcvq0CiUNYpD0nrPOUXsysmFtlzIDzTbHXZWOYjJQLFDd
	DamGnNftiMEyQ2BLLooszdUT1G2Fwj9nSRABzODGjQLILtvMJBhRF/yjDQoLzCTG3xzLaD2RWgZ
	3QNJDp1EAAeEAKjzESJ3UcFujPY2oh+QhVBAIFfiXsp7lBDMcBXo9AvzuyXUDM2HEai3PGOjpra
	opwl3+XPfQoFdEveO2LoRnkTUxzPLqBKAJHZQME7xRvwDP5socdUuePP7UTxkwPAfeQxuLOsgMN
	YTa90sL5E7R+TyRv3579EJUe2fRFVz9k6QaC7wMLF1rcC1nFqxrgw7DDUSWuE1s5Lx77OKociJF
	wPd9AqU5k7zJYVQl1qYCgba032EwlH6fFpJ9SG12jk00FjgQHSoNbtY2UB01AQHzK4Nsk1TC9PS
	+dsi/OOkzchiW20uu1irFM2AYTp1C7kReyxfmK+zH8SvPhtpi08reN8A6zOU4ZKCYm
X-Received: by 2002:a05:6214:dc5:b0:900:6ec7:19d9 with SMTP id 6a1803df08f44-90e9f204195mr106473946d6.3.1788385406590;
        Wed, 02 Sep 2026 14:43:26 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee06d30sm28372546d6.6.2026.09.02.14.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:43:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mani@kernel.org,
	krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	jsandom@axon.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI function nodes
Date: Wed,  2 Sep 2026 16:43:15 -0500
Message-ID: <20260902214321.1721477-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902214321.1721477-1-elder@riscstar.com>
References: <20260902214321.1721477-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TC9564 SoC contains a PCIe switch with three downstream ports.
The third downstream port connects to an embedded PCI endpoint,
and that endpoint implements two PCI functions.

The devicetree node describing those functions incorrectly includes
this property:

    device_type = "pci";

That property should only be used for a PCI device "that implements
a PCI bus", but not a PCIe function.  So remove the device_type
property from the nodes representing the two embedded PCI functions.

Additionally, only PCI bridge nodes should be named "pcie@" (or "pci@").
PCI endpoint nodes are typically named based on the functionality they
implement (e.g., "ethernet@").  In this case, the role of these PCI
functions is not (yet) specified, and furthermore they will be used
with PCI endpoint buses.  Rename these to use "dev@", following the
convention used in of_pci_make_dev_node() for dynamically-created
devicetree nodes.

Finally, those properties contain #address-cells, #size-cells,
and ranges properties.  And although these properties *will* be
appropriate for these functions on an RB3gen2, they are not normally
used for PCI functions.  So remove these properties as well; we'll
include them in the commit that actually adds a pci-ep-bus sub-node
to these PCI function nodes.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a13315bf0fb07..3bb5fca8e2b13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -954,20 +954,12 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			dev@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
-			pcie@0,1 {
+			dev@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 		};
 	};
-- 
2.53.0

