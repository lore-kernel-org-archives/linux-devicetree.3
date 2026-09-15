Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7647ECC1
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469012; cv=none; b=N7R+yOrM2aYvoU0lzTGRodI1aMovbR7CgYRgEV72FFBh/9phSGX/JhmhWt3/sR9hkfwDU/yyoWI36n0tqzENC5gFvj3dMpmhpKqyIV5LY4qsXjpEOWf7FD2VfOmEMc2+Y+TDgYFVhS8VxkRoobtihyAsMFj1w4EbKvsiQKpGi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469012; c=relaxed/simple;
	bh=yZEgzTB21dJfahfS3EghGIYvrSbI8fD5s64xGT2boCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f8GnhKpqxPyUesRFNq4j3TNRhjce6VBV4DOS6iRMSGaRJd5M+ECix/dnFYh7+Uznr44AyV5dTJyDAW5RulUhkaQx3kihCxUmSJph6xQW4S0JwBBN4lqWJ7cauAOKjcCfI61w9T8CLfzubhhhAo1KglYSHf8FHjFAY+dfLemjck4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvV9sqP3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvV9sqP3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so86831f8f.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=KvV9sqP3IbQxdsLronXb+JMIUTfHqODNtknisbi7Xssq4JaUJaoic38EI4HiCw8Ebt
         K94TijNmLxI0AZClLDTVM/q6GJZ7A7JfH5wujF2ZLN8eR7Og3lTUj3V0gTE4DPyLtqOE
         vtl5kILDDFcEeqpsp+2Upg6YjbMwL7O56Ti9i8dVqTR0SkXzPbohKDKw4zcJkfxj2Zww
         9nWcpHwXL68Wd5iVaEg65dL+qA1dCf09ZX57rHqXd30+T5OgBTTntogjKcVUUulUGyGQ
         ISJxG073UAb5fwxN0XDODr0ut6nK2eVUTQUmpJkhJJquN+l7QjuJaTKCr2ChclwaHrtF
         nJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=EDQ8wXcNFyFbGIiS28UkDC6IekMAAlKLyLiR1KbiAzMylWxSQuYeu3fVA/BmiMQDSH
         ZbHs3ULy3gpiZNesnMixcK9jO70vXhuMVZhwGyMcqHoR6rwmMKs5jQz9WtM/XYMXBLiH
         Bed7DKiP2WoG1gebo2/qRIOmWX9096VGzu9RBt+fd78GT3DWrjWgoYcbOh81ZGt3YZ9M
         tocvs+LVK55WEMcPfrK9W0Dbo1+7lvu5vJFbRsc3KvCW3I/KbDoi7Rv+ogn1ceNveJ+5
         lQ5rlD7MRG6YVCoMDuDmmfkgZqRZlX5xCyZI5vZTYh6qZmQkVGZgc3MhucMPu0dPjr28
         5e4A==
X-Forwarded-Encrypted: i=1; AKwUvBxF/U3IibPXWzmQiYvx92heLTc+Zskw0Ef8A3jlvq/49mCA+kQA2eqzwTfFh/upY9dE3uq1sUHPmeJM@vger.kernel.org
X-Gm-Message-State: AFuF++kMfe8GcnzZiHG91j67DqtzTQT0JMwWQ8Q4j364GHxghij/4+/1
	vK2c7My/HpJQ88gPRpfSwYl0giN/WQX+qm3QqXwdC9mGX+1zaljajfXBH+1lUQ==
X-Gm-Gg: AYBFou3/tTcqp4uWGza7tSa4wxPSycyFH9MYceUA9ps8NnMeZiptzX0fAyh58RmrGKB
	iaoe8M+G/4vPhedVH5yodx9s/tIV3k3gl5VZVMg5kwC7yI6jKe5Tfc0YyupNVDPohCB1nsBmTbI
	XeddiWUqKq1vsSGbfDsaapeHZNqnWrYd67KZGaYNOt3dJp51HnQrbKosHZWV1dxkk+u7wDJ7u/D
	2MXMNuF52qxCRlIS7kC+353forIo75laDlKMvkL7NSwXQa+iPrc9zjKhDocCS/tYTzzfJKASLxU
	O5AhhHbMLXvPfEeQ+Y+gDY54TG8uuxX9i4CmpK0TFOA/aUnFkX/b4hNhtmcb/8/oIQCaV3+k1cg
	6hrCaJGytSBCdGm58SuyBZuwMpPwK4+TgmQQKg2X+w8gZsdirzN6batT5YJnyFu/Lw7o5wRmAGN
	BmBTRPutEPqQ4odeKZRbA+LOu+mjA2SRyaTgSpzEmKRYaP2mwwvxp/Zskjwx5/hFbLjzakWkFwH
	3xuVtbm+5YHymQKP4NPXaWVpfGvOxoqXYZd+/ZW4Rope4PbwxzP1BXCOe1TLSAknQc=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr10107005e9.2.1789469008368;
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:27 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
Date: Tue, 15 Sep 2026 12:42:45 +0200
Message-Id: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUhqWoC/1WNyw6CMBBFf4XM2pp2oFBZ+R+GBY8BRuWRFomE8
 O8WdOPyJOeeu4Ijy+QgDVawNLPjofeApwDKNu8bElx5BpQYS6Muwj5CncSiGttFYCij2kQGlS7
 AL0ZLNb+P2i37snsVdyqnPbEbLbtpsMtxN6vd+5VR/pVnJaRIJKEmU2lKzLXpcn6ey6GDbNu2D
 87Uuh64AAAA
X-Change-ID: 20260819-rk3576-dphy-2304f848215b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1671;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=yZEgzTB21dJfahfS3EghGIYvrSbI8fD5s64xGT2boCo=;
 b=ot+vSy2JSTHjEbz9uBeefJXb/lU1tBk60Hb1vd+2VgmjPFt6k8cpkzJT9QHP88Ng6VxHFAlTL
 bJSEKJiOgB5A2Ledx+QpDv+NYkObnMwn0SNsr7pQzcftDj0X92xSduC
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Hi all,

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver.

This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the
support for the RK3576 camera pipeline (VICAP) mainline.

Looking forward to your comments!

---
Changes in v2:
- Patch 3: drop the RK3576 GRF register table, which duplicated the
  RK3588 one, and reuse rk3588_grf_dphy_regs instead, so that the reset
  names are now the only difference between the two variants (Michael)
- Patch 3: reword the commit message accordingly
- Patch 2: spell out in the commit message why the RK3576 compatible
  cannot use a fallback (Conor)
- Collected Acked-by from Conor on patches 1 and 2
- Link to v1: https://patch.msgid.link/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

---
Amin Gattout (4):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      arm64: dts: rockchip: add csi dphy nodes to rk3576

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 15 ++++++++++
 4 files changed, 52 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3576-dphy-2304f848215b

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

