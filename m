Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E5E41D23B
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140057; cv=none; b=J/KZ2cW+drIs4JuPa96/L8Bn7dGqE6klf2XuLQqWPEjK8NK2maHRM5sWAgY4uF18+qePC7056xLAD5yrwaoewYIYcbL9othhtKpCNREmcM0u8ZgiLUoQ0NSykSmB4e6/uxcRa3XoztxCvp2RpaQXv+wpxeLg/rNwe5Og6OAV01Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140057; c=relaxed/simple;
	bh=/RSt/Z9l08XWGAu8OiD6FhRMw0al1LqO9ERAn5dwGqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnWDdQnNW7WAWZ+hPiipbt7Psp0/BHyaD72RAiTEOrScjbl9qcYWb9oCPaoN2LkGxoCTMMXEYqs3Wo308gfaL1i13ZK2aXNr9JI8Dkm7jDQ60COwgc9B7zvsuzmrxn2TQikS5eOIpFd3kyES2pU7UYZg1P8QGHON4v9vWttsv8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCZcry+n; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCZcry+n"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df4f540ebso928932f8f.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140054; x=1792744854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=RCZcry+nP2BbYB+52oCVctVChsPNMc/deI9klWh79G4bpaihfmP2xFZSAkMZvG162k
         jlvNuRCithNAja/i/JBLHmkOKFzomeoA/Qf2KO+oVV7zI6Ju7JkkWKPY2Vi9AT+vDV0S
         1qxQ2ObacqakWrobe74bwPYJGcdQ/1UlENyA0qFY5fPtGdPVgcULUnsLR2gP6bFHJC95
         dKOpnhr3g33D/0qDAOWSktjplpbmwATbM5hUmfOXNmsfmK/wMPZAEPLjbrNMtiukXyUx
         VE54n+zlAJx6Dmhl9SS4Ni4+v9cSG6Jywd20YvqGehxSeDmr0lI37lk1P5hz85F20Ms7
         DPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140054; x=1792744854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZnpEzPR/fOj0NYp4YjGjICk3vVhGUGABaDpW1zvNrI=;
        b=yObNSrnGGkldZLOYqyYLRl5Ri34x7wMiM6OAbZyFkyWdzBJ2bX1MXqsKP6ACWqLwXx
         vAmf/vDrt34tvuXSgRvEmGQtsaH8ZyKPJ3BRZWHQOCEY/rQc6EhwRKchVIqOjXnWWlE3
         f144e52hvtLZjf3LMIyBFG5xTTiYemS6L2yNBZ+g+eeF6FkddUYPebTblBazESvnGYID
         jGQSh9Qe2QwQwCNV+8TI0MYEFZDMNFEZlby1d3PnegA4pardYV01dgzPc76a1rGdbewZ
         5Liiezjt0NABYHUiUhrhp8+DWN2j5py5AciiebhE9Ggjisn0f+/SnEFzOHlHwnX0rC55
         V84w==
X-Forwarded-Encrypted: i=1; AKwUvByD450Lx49loaHYLN0VUCW2LOj97mC2KgK6QPX7vtzxc5LIBG3kAajCd6PwOClJewZvFVKUrc0yLPjo@vger.kernel.org
X-Gm-Message-State: AFq9FYKzOh1pJoccH0DLi9sTlyUD0avokTBD18TM95jVPfxbFiWA0AGs
	3xLyp37gvkXa/1CY67rTnxq/a4qJMENdlLpaEy3BMS9xXYCE8iPkagYI
X-Gm-Gg: AYBFou3nBdH8x3JeNbORnlXgsqLCQ6AfNW/Vy13RinSEjMxVRXHrbkbZj/xj4UYq1Rk
	sNYXCMJ6FpetSgkKgk721yFhrlmt3E6ZOE9tQ16QMTIsfY3Qj5A+AGIIhVzpYxEnwolComM/GYY
	h+rZX5cFRbl8kt/weKnJQB9JW7WH7KAMFtBKMCZ7x5CvG/Td4/4eQ/zPBVnV5EfvpRZ1lSt0JiH
	zMEUJu3PJl0jBXh2amAcOCKRYzmhUYuyrB+qBKXfg4IF4/UWUXO4wcL7DsXHywbwxFKy6Kds7Wc
	NNJVmPFDD0JzInCyMlhg2LsPDwPEQc4uhedZsF0izlDeQGn+uwH/WccXiFHWfF2A3QkQs36KNp+
	A6p46FRwonUaajAC+jRPstHG1ZSR6mm9Y7+EWo2GUJTSOQJtqbDIb+znMOc0EKyiJtwpznjS+YT
	tcOR8oNIZFZe+KzofYBN7/L+XEuQh0KP9l7Y2c5bnjZQJ0jzl6n7kTpVHUSliakhlGBf96BMGAq
	Fag8gJkTbUT7KbLfBrWbVdId9dM6W26tRpo1WTYoLtmjpx8VjIt2AA0Bz3EFTJlFuh5fdwDwQNL
	Q869W0e+WdypIXsF3XAzYA==
X-Received: by 2002:adf:fc09:0:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-48dbacfddb5mr33079053f8f.51.1792140054238;
        Fri, 16 Oct 2026 01:40:54 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:10 +0200
Message-ID: <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c5f0e22f549b..183b4f7af009 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -300,6 +300,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

