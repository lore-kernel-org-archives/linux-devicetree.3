Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E9488DAE
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283310; cv=none; b=FpHKlm72YA9fJRx0epZFCrSr8opNnOHCKIzRxl32oipT0XmTBTihnskSHYvx2Az+dnf00kPHR7gACqM4q63u7NiVlkBiBLXT+KBRrXZM/TSYGoy5ZKPbVD8UFm9Jx2tqI0QnmS6mwC3j3P4bsjnY5DwH+6zmlpOGslK6+j6vmkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283310; c=relaxed/simple;
	bh=Bf3DldYJPkEl5wDXkPPwE+qQIpcMuluvTmCJXkBa3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLqfkJiSx+e6/KWBHqsydA144qjEhZmTQnX7Enf2dgZjfdkFfygWCFXodMmTeeIjSD3xKK2/b3gFRtQ9EvNo59u2dmMnvb0wou/VOtcdY57lBcBpNVOsblKf7NDcrg+AfI/cgb8R7stxo/3xw4sTr+5D1gXFnAwOp6LGydXKgFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=w1PVg66y; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="w1PVg66y"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c0006ea8eso369161cf.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283308; x=1788888108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFhnWYzUZYC/wvAq/4Lo1J9s4tj77sgPBLg2juwGlsE=;
        b=w1PVg66yReSX5yg83+AUMHYBJbdEiIxIva72R+qUDOld7CwiDAxGrH92f3G6Fvu8Me
         oxkrUV0baAy+WiDw7UGF4dohAsK0xkHHoSgJHJYMuGIcfWyAt/68PlIAm/0PaIw+SLzq
         DJx4IK0MoQuGxT7Rkqde14G1XohjhJv0I1Zr80tVqFQsBfOWH1MobEtfr9MEfjIhOtsj
         rba9WpXdH3n7Yfxb4b0VgeuOUaOanASIde97c01veIypNlcp8y6uW0y83Q7G92ali9nJ
         qdaM6QRyW1dvIvtxUkoGG7nBIH4K3gPMd3pOMalIfHKcibmTc8IZaM4OK06e3v/iCbc7
         K6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283308; x=1788888108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFhnWYzUZYC/wvAq/4Lo1J9s4tj77sgPBLg2juwGlsE=;
        b=kZtwbr7OpveKXCRgScI1Ytb36+71XDe6zGcs9ekda5vGi9GbNlKl0inV+rPjS+ZM+L
         dGrd/91YWjdKYr5v9FR7Ror5SOyrwtsB22vh/9w2OWpvqMjsBd9MvnkR0FDoEdsoIRlI
         ku0AipNs9HMbwimFP8bZku3qrkDyo7dt/Nr9kC6/X2q74K9gOpQG1xs55KQedsEIGP07
         +mFqA++lUww4O9Zu4etJxidCOASRxeOQ4mYqWC/0kAXGurYbgvgza/IykybyOX0e8F5b
         N8o8hjy0A5mTL6ppr8lAbgygSzuM/HrNtJgxnBc8SuCNRzRXt2+iAWhzu1hlAyCsgbLZ
         nlcA==
X-Forwarded-Encrypted: i=1; AHgh+RouGbbpMPJgfK7ECCIrueHdhQV21LJuwmR/2JECKzuPsjwoFGUeS9OPows59Tc/aTCewUam+HLqCoLX@vger.kernel.org
X-Gm-Message-State: AFuF++mPsZ71Sp78WyZ5XB3f/lBpCgoKeAW1FBiM0wrZfjl70/sMOZok
	5LTtMb6SYzO/LshpsTPS7q/+dHqVTFvdPKFGXGN1stvdZ32VJ2Ehsdack2+VHeUABuw=
X-Gm-Gg: AR+sD12Wm6kGKGw0YhI18ucUXhKo50+NQ2SQAHtRcn4sGWJJtEU8a6MpDcF6lkgpJ50
	k0zYGbkW56/9r/+KfdGmUvhRyQK5ahdEb4fC8kivxk9O9Pu7xRu+X1VcCvZH9noLrFu2gU6xBcQ
	l97sTkCc5blaeKMbqMp7ejNtpjaFcXndoMJ2rBn7ANPKA/986UsilwBdl567Y/QejIxN1830ijj
	Xq5s73sUoOLtLJ5f+/hNZF7mTwUIHPfxhspWn3nuTJphrIVtZDYy+TqDZ2/UVaU4ggDyK/OK/Ok
	7nToAf16EulIrYeQZyeJ5Nkqu97QBZDnFB0xaYwdkH8Fi+A//TeoJag7fETEyKm/x0Wpcy4gnus
	c7G2X8yBbnisYWs/OeOFAODWH3Imr4220GEI2J1a3njsECZBlby0eY/Pz1N9i5oNzhVLXnkNvhb
	Sx1PLP5y5CivpKY1pF5I3icxm8UDRozHHBOJEzcGa1wZiJYChbHgESfC4ZebutCBOG9Q==
X-Received: by 2002:a05:622a:2586:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52fb93d5098mr461094611cf.8.1788283267690;
        Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:07 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: use dev for device nodes
Date: Tue,  1 Sep 2026 12:20:57 -0500
Message-ID: <20260901172058.1512508-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Thundercomm AI Mini PC G1 IoT defines a TC956x SoC, which includes
a PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..183ac59ca7d49 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -790,7 +790,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -798,7 +798,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

