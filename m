Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7123E1732
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010546; cv=none; b=IAajUHLSTfdLhK6wuWmqkLwAABL3Waj3uPeD+cesr5WGIrAmJdq8JepLUYy3xwnZiEFYbmS9duBeoubNtpaOVniKtzLrOVpkEeAaomWhRt4wU1kLyoaViZtH8Z6fNBBI6U62Yq3MwyUYWOcraQthc5RBntXnwrCM3akIVxCOGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010546; c=relaxed/simple;
	bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNZ9Rn1KAlQ/AnW1iI1Gq3tmh+EkphuOPDFcQHVW5bdM7EWHESC3bj/9b0GJVSJoMVud051IpiLfU4wShEEbLz88wbW8PDPj00SWPaNELEVng+NI8umEYaUL7YJLaAXYm3I47ZLZ8ziTi9kN7+YoH8+ixGP8wItcSvZSwyMxNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdMYXKXJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdMYXKXJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cad4170e8eso46015195ad.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010544; x=1784615344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=NdMYXKXJYlF+c3Lc0Sq38i3JWbDjG3sAQqYL/D46o/28QfrKXylcnl8K09vWFVmK67
         /Hs3FvuX5iz+paOkT8lrQE4onOnm3bkwsxR4WNEmnVdymyArVelEPK2JoTGFfC5NSKQ/
         ki8ZuvcI1bbedh8jRa463lQ79M7FfmgytzZuZWoI1KySeSsCP3Aq8Srk8d8edklNje5j
         3py2L3QH22XU5e/it1sHFwunN5H2SqD3RoycoosMeRXztDMp6K2i3WjreqXPoRrZWeVf
         oeQO4yQKYe2meqFCnhA56ouRSklanpE5weD9R2Uhm2uDax4uvS+eQCP9XsVoW74xB3c4
         2wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010544; x=1784615344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=ZIg8xgynvvVL+fcNOhyQGXMCj7Pk1XI5wq+xxLlOW57JgyhmtTmQq9Kkbs/EYFpCd1
         Na/D95TOmfB8198z2x2g4Gf9/bmHwCR+5ggSqK1NHIGzQ0cLaDlUEoKAJM5RJdx4NvEV
         tu0+PuyoBOVCIPLQYzVT2AHFiHrlC8UwRdjU+1YyJD3xJhCyoV+2E11vE834x8UEz9VW
         EKs/5SFyVMOzzhh1GLIMSPhw2OTYMZZHFCPqYBJgph+e0akTiVYpWPGlnJlmb+UlsN/6
         IIywIMnezHyLM+5kaF3LEgG14Qlce8wPAqIT3J1VkIxTqGzxfauOxar+CGYI/J66SKfn
         1+7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro92jaCHJu81UA4udz4b+OEeL1oJ6RITOWC8Zg1tNBuJhZtyONdmvlEBPRGEsIuN/5H3RMU3helnFfs@vger.kernel.org
X-Gm-Message-State: AOJu0YwvxGRHzC6gruldlIh95EgSfYVVHN27TU2p52q9BkDVw5b6dosW
	vL0rlpPnxM+cnmEcuI9uVbUxnsKY0fTSTG68LTO442WUKyKCfpq6gMT0Rc5xTA==
X-Gm-Gg: AfdE7cmrxLgydhm97cDp3W6xV2FSjtcE3e8jvmvDbqGuaXQZLAiQsJeyREAOg6VgdmA
	2WvaDR+t8E3d1iJwjNHIL0WoTa81hA6VMJMtQCN5ErIFS08eb7ITlzBO11K8C525D+uTnaJ47t1
	vJWTLSF3dJV5X/erW/5YOLrupnhwWCLVMsBtXX89qT4TcK/CkLkokm0EO8GQwBop7sm5yG5I/ue
	vDTRdlDgbw+90p6/GGFUT36ZtEcV5sURS4LshsAOIp3rjiapQwX/tocv/b5DoMfoqfxwnkwSJF5
	tw3ir7GIq9KdfBEwiKUcpmXdOwzbU28h7gvf2CiHnDzjH3HT3pd26x5UVPFE0AWO1yItLFGuZ4Q
	CGt37hR4WZ8r4G2NCHM1CI51tPHFG4Af0nZpZH9sdk4ad9Z8upioqThvj2HpUPQPYqri8a8r7iq
	9HuhKFa8589dPrQfeEAyaVMPFskhlhYtAsO5pfpP8zY9CJBuAB+mMUfhqxWGmAmKpu2pqYuXJgg
	abpwwvkgss3bVCjmKMiTPle+6dehIPsBQvxKAjMFxL+Kh2oZwapAzlHNezWUrvdFSBeZBpbMpE=
X-Received: by 2002:a17:903:2287:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2cef147707cmr10986445ad.37.1784010544425;
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:17 +1000
Subject: [PATCH v2 10/12] arm64: dts: apple: t8103: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-10-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl7zHTaZSaZSWk1LzK5M9+9gUtqhoXtnysHTQ5ur
 7ew+FXQMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOqtLgz/dM/OEVGzm6gcofrprBqvrVaN02PfjgS5pY0XxErE1y8KYvhfwbJ9f7X
 GNjOjyOLULWcflAkK/bfJmiTM8Wnr069i5UYsAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8103-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 52965258200d..1212852251e0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -74,3 +74,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 52f63ae7a58d..1d074b9e6018 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -132,3 +132,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 9eb2825d25dc..f8b2b1637b9d 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -54,3 +54,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Left-front";
 };
+
+#include "hwmon-laptop.dtsi"

-- 
2.55.0

