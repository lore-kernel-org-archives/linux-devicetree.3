Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E081D274FE9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936895; cv=none; b=SuciJwfYluMhqHquhz9FTsItYJ8bm1P1y+JGn+6CcKSBgSnNpL+2cAdiESilCT1ydhmdc5wClDX3gF9J+IpgHFUlwh0I3H6IGUnI1kIsPJ4hxkUjclhTEg+3IMoCC0AtOiDgh+UMZyiANSn2uIt804utQO9kjBI6EoLK7her1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936895; c=relaxed/simple;
	bh=8ae474NXZrrydHMsATLrUWRjmEgnPj/0dLRNWL+Kxq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mHsA/oduLqzGJ8xLvQVAYSYuEvxF1/AIfdqPOWgobZLygn2YNYf/PsSLE5G0Vh7qpA5NVDqYTL8XCgIniUtA7r/t8ZiMvBGSrDVU2+4kkJY7ngMnvM2GZuxjspc7M8pH8tTBl9274YDDaEytACKZKatve4vKRWuEwzmblrwKrEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScSHgSp4; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScSHgSp4"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so722328a91.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 23:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936893; x=1775541693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3coBers9c9QNUbHYcA2MMP7ZkcufEz9mkmk8HsvnaI=;
        b=ScSHgSp4mrdDUi2nIhGfEOXSSfkufjh8lm8uLKM5VxiB69DW6TvTl0k0n7BHOC6oU2
         XnkEq7eDALl4ZpgmfJXVYlX2YEsIrj4WlsmtD3puI704VY9HhvirJhSYNkHT9Wu2Iikb
         la2D8S902cxCq92BXuAKWWYyCFejoo1tdhvQX6oD4WXw14dznd5IuU4Lzqpe8X9J46Kw
         0W2pDY/JbgEk0kXYspsnoQsHFxoyp5WV6Ru+vv/w14P971TYMU5ugGcZpiWR/8UwVxrS
         YGxfkkejTTfrpBANpNy45GUThAiEGP6emI6jGcTOhDfuVc9fKCJhb9SLW2hX5AKMhg8N
         RObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936893; x=1775541693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3coBers9c9QNUbHYcA2MMP7ZkcufEz9mkmk8HsvnaI=;
        b=LBrTmrDDQxj45qYSYBI/t39elKFgdyaoqatK7S2Rx0Cw37tGGhh7eqYbmW+iVGZFHA
         hWxQ5cjw/a4OyB2R44yaNdQ3XPLdyQyC6Cs6xhEbHkEiJs8s4mlkl2L06zi+ePFtzJrk
         ZYG+zkK5syC0MOI7T2G8+BNYPmJsbdUMFXaybJibDcKSXi5MJ1xnsB0o1DUWXo4HkmmQ
         8ZNOW2SqfIw3MVjMxEX2leRmAjhwnJPPj1q/0pQrt4w8qi5wIYOT/cI+M3wxxj/caTKW
         Ea0dczRVUvBHp/DzYhRLppq2WGAY5GZIpdZ9g6P8Ee/RNlnFVSFEQyBKCKP0vCtJidRb
         2fJA==
X-Forwarded-Encrypted: i=1; AJvYcCUkm+CgmXOiB60aRX6gmtk49/mRgTRoachepTBWCeFslktOYZ7jtmDYxQ9672z2dizCwCtnCp0giDLs@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6VsTd/4LVayK3tRrUpfYd5fvLaezgojLwfOdil7VN/v0Ubv1
	yyX7Pi5mMgp7CLeVhMkX2sl4LQH5rbWtDWnu16qymkNenAa+wLx32XVG
X-Gm-Gg: ATEYQzzbHDbQvyn6B07qwTf0wdB7W1iNpGVJr5v1W03KLhE/s+Ztz7I7igoNew48tM2
	r7svu8X/2hYmSZAso/vxuCVlGT/Ma98tlKyLMYntVY3LrlO9RPufez6OE5bKmmGePoeGl1XQ5Q8
	ODi5uTWV1U/jJq5pGEMoRIhkoSvO/Dc2FrQ2aV5+Mi1U8hLcI4RUllobhBtkwxrO+JLKgJuh77J
	UBcUuy9Os2QX5VO5GAB9cm3VjC7q0giXGs7m8yP5S+Allb8dqa6r9mZ2cr0A0Lxp0ggkUF3pqTc
	jQtG7TVUlPucYPxclInk/X6k6Kt0QBFsTTOlMZlvA0EuUEiQRIRns3QfBTTDnclgV5LlCACbmmA
	poK7Z+SSe7qoK7Vlr229lLEYHFX0gH6txAmA6wrRRZhJy6Pj0RjvDIWhSnJ6ylLkj57icx6hlNx
	KGedrB4eohl+XVaqzWiZmJAvVVHALcfPfBtq4tpp2MkjNfzvxALbKo1UrI/hk=
X-Received: by 2002:a17:90b:4c:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35c300558aamr13147798a91.20.1774936893257;
        Mon, 30 Mar 2026 23:01:33 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm575343a91.3.2026.03.30.23.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:01:32 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v16 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Tue, 31 Mar 2026 11:31:06 +0530
Message-Id: <20260331060107.501561-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331060107.501561-1-tessolveupstream@gmail.com>
References: <20260331060107.501561-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB PHY nodes has inconsistent labels as 'usb_1_hsphy'
and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
This patch renames them to follow a consistent naming
scheme.

No functional changes, only label renaming.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5064ca4f1158..9f6cc31f1fc7 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -634,7 +634,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_hsphy_2 {
+&usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 9be1e523e9ce..32b7346f4548 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4447,7 +4447,7 @@ usb_1_hsphy: phy@88e2000 {
 			status = "disabled";
 		};
 
-		usb_hsphy_2: phy@88e3000 {
+		usb_2_hsphy: phy@88e3000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x088e3000 0x0 0x180>;
 
@@ -4608,7 +4608,7 @@ usb_2: usb@a800000 {
 
 			iommus = <&apps_smmu 0xe0 0x0>;
 
-			phys = <&usb_hsphy_2>;
+			phys = <&usb_2_hsphy>;
 			phy-names = "usb2-phy";
 
 			power-domains = <&gcc USB20_SEC_GDSC>;
-- 
2.34.1

