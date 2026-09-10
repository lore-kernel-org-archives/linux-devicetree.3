Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2379D3B14D4
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 20:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073610; cv=none; b=rq+JKky6RhO3nvmyKC/VUbuyMBoNvGGHFFf2RQztE7AjRNz1EcA8dwekKMAieOUsaIewX3l7dbXqk0+cguRae2SQyZYhVAdb1s1hl7xEqTa/X/GoarphltmwfQaF+shaFPQyFh/LwrItBRkvEor3N6aGQ9DzL+mcd433n1MwW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073610; c=relaxed/simple;
	bh=KPgoBO1nv2ixXnAOeXDLi+rIWIYBz8Puw7NNm00WdZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaXwdr32svB9Mmp74Lg9MPwn3le0hzi06Xpp4+DaSnQE+nVCA4FvtsvawxNGM3ERe37wazrQmT/whpTm7ep5nLmXiBNuI/v4Om2dLmO3fezSDaaXt/6LgNCYUd4guscB+q8QZDa8QOSevHNPA4gWDkt2VzgPRR79zpb8NNOKIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1MBckCY; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1MBckCY"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8694801b0c7so20132b3a.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073608; x=1789678408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qV7jCnMrMxqcUpoF7Sb7Bgwuj9krY+1lli75M73Ykr8=;
        b=L1MBckCYOnw3QT2pnPFAYFGdATLtTRC563OR1JE+3R7tL6+x1s9/jxIxvJDJoBulfO
         z2GYxRaigBxXNf/zMNvP0Z7KRpCtItZaNwRqtHjnazsOKNO7PBb9jbdppf+Z/wgdrL25
         oRQR9aHbmf5EB8wFanv/sI2799v+DrUb/7fQ8WbmCEHKPEwjPm5bdQ09h/njmnke8q/Q
         35/m7Az7opoCMfxn0yPeqyFZgkvYNsOeG9y/zSM4E+PQ8Me8VA7+LNwuxer34M1L+x20
         SSZ0AmVRb8TtiDsFpIziH22v21pmLJmnnvoIEqYdr4iqfJJZKp2h3hpSqA/+kejjugxL
         1/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073608; x=1789678408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qV7jCnMrMxqcUpoF7Sb7Bgwuj9krY+1lli75M73Ykr8=;
        b=IeV8t5x8FMPU+9SbJ9b3lzgweIQikq1XefxioJmXSYifaGOL+QDXxLVyb0TuQKHVOm
         KxC+P7qoNerimokYMPIFFtji5qCiCD8glslx+yE+2DF183nn3pn3XQQG7fVtPEvqk2EQ
         H0ILUOWN72ozp2bD7T9KgbiSoZVJqy7HAyY/sN5fEXU8zUOqakMKwH9jeZoI+FkAgqJS
         b2ZKxg2bo/ancvVaI0okTusAbnwaxenGSUkbVx7TkoCBUOAVEgohNIPjQPMJHdVlAGFd
         vAdHeu66A3Zpz8IgSLDSA6PKLHCQkiaOpqLG0WSBLyanzPNgohlcCnC6eQCit2dr75FW
         bDVg==
X-Forwarded-Encrypted: i=1; AKwUvByUuGH2RjWdyVYbLxNzZRam+uUJ6/UUK83Sc7zZzDaQyrIkyxvllonFAhDtvqb8ILtVi6abZUXOCwfK@vger.kernel.org
X-Gm-Message-State: AFuF++nHxjGPk1yAJet4Ei7qRJD0TK7p0sIvGiozBiQTLcO5rSO4R3AX
	sZxBCQufqsbo8d9gMW4Fn6rnb8Ned6mibiH4kFkYqs9i5zyUA8pGe/mbf7IYSQ==
X-Gm-Gg: AYBFou32tXADFPzUtk8P1biWRjU5aVtoyEG5DamJwg7PnFn6NA42Jgt3UubjvkeZe98
	lGmOfuMw9G2y24dn14IU2efdoz42xLYMzGGXw6XeYZ37ohb3tmNl9ijLs9pZVcoZdYOaL8rNvQn
	BDSVEZe7QlNlM03tBtzNoIEg8zMoaKOPJPTIc+0axEw+mLwvqhiOFUehrbd0QrfTRTGEd8qmWYV
	xIZItV3JXn6lD4RrJin/Uu4Umxc8bFPGYblS8K7Em+fSUDjc5KNfzW784D1e5slAlcjHKxnz8iw
	2vL7mDxPgftXrUKku5z1nz8o08TNWzxBHQGquRnY6OR4pzT4IU8VPF4K0LR8hxM72rkoknb2cHX
	kHhtK9MJAvbzkDW2QqJhWPsDzTIlSbmkcCi26QHrQvDR0oAtUqqfUCFacbdLxswIWiGtndxdvZH
	FVTv+polFe/yyrU+sEyrKqiwEjY3RrdmAIkQ1/y82BnvcxyjxPypExf4yPklSzJUTXCeaygxU5x
	t6DC2NWSj8S
X-Received: by 2002:a05:6a00:4891:b0:845:cf73:5bd8 with SMTP id d2e1a72fcca58-86b30e0e9e2mr502408b3a.1.1789073608481;
        Thu, 10 Sep 2026 13:53:28 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 11 Sep 2026 02:22:51 +0530
Subject: [PATCH 2/2] ARM: dts: keystone-k2g: Move usb-phy nodes out of
 simple-bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-2-9f6e9cd649a3@gmail.com>
References: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
In-Reply-To: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=1455;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=KPgoBO1nv2ixXnAOeXDLi+rIWIYBz8Puw7NNm00WdZk=;
 b=up0xZHUD3oEBsdfWzUu/NU4e1y2rfEMY2fmQpXizS1C1K3D5SCKhUi7ySXSFdAMIQn9hR3Hrs
 Ru30k6VE7rUB3PtpD64dNdeVJ4nAb5Q3PqemLm0mC13HF2jj7dusCdy
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

usb0_phy and usb1_phy are usb-nop-xceiv NOP PHYs with no registers. They
sit under a usbphy simple-bus wrapper with unit-address names, which
forces a meaningless reg.

Drop the wrapper, reg and unit-addresses, move the PHYs to root with
plain unique names to fix dtbs_check errors.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 26 +++++++++----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index 5a63874090eb..c18bec46d9bf 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -69,24 +69,16 @@ pmu {
 		interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
 	};
 
-	usbphy {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "simple-bus";
-
-		usb0_phy: usb-phy@0 {
-			compatible = "usb-nop-xceiv";
-			reg = <0>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
+	usb0_phy: usb0-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		status = "disabled";
+	};
 
-		usb1_phy: usb-phy@1 {
-			compatible = "usb-nop-xceiv";
-			reg = <1>;
-			#phy-cells = <0>;
-			status = "disabled";
-		};
+	usb1_phy: usb1-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+		status = "disabled";
 	};
 
 	soc0: soc@0 {

-- 
2.55.0

