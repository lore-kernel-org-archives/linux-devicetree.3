Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C022474276
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 11:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473408; cv=none; b=iZQRrA1B7pR+lEA45tadR8wAV9Az62oFQDW5qJAcCt/02XaOe1iftCDvxcS6oNPDgKZ2lohWpF210RYOsXEMyquHt2y0kXAAJ7/uf6bzo4IF9mzIdGCY/zKvv3MAXlnQ6nXJB6Ln8TyOr2UVRWgB6oCT7e7OCZYkHLYLsSyQ77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473408; c=relaxed/simple;
	bh=8SP9nahB7MLTsjs0rxhu79aie6zazoZaR+Ob+WI17hI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kAocpeIgkhYzjLUzeUbteze0feImWHcdZ1O5EATo71t6nXhqED/95QYWtqAbQF6QqZ+TB80KaqfxF4xLymTfufe2520K//xLYEL4gIw4IY7cT3ZhpPqddagX0573RIAiZDh9c0UizLGZB5SepGsZ9Pbk4yqrEAzm160POKs1ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9ZeZKea; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9ZeZKea"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so20064665e9.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473405; x=1790078205; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aJ1SBokHH9upoa1UyD7r1hqwedjaAzZFiyFbJ2MnRcU=;
        b=G9ZeZKeaQWej2RREB0HPt5vw4VNqmin7v5beHaIeZR/6RekzcSHf98N9VOtGtwcmHY
         1yahNxp9JcDGXTwYRVEjnS0lhfwsOe/ZKV2HuiUD5pFtH1u+Rmd75Tv6Icabb/CBkTZK
         4SQ6iibw9vckxdp9qMd5SzOpCp2MK3WP0nZxyJlB5Yt62gN98JzymlJvZmZNhFtRmxLN
         Gk4tQCUFVx2PJ8Y6UUgR3lNZHv222/WvtrDCmy9OPk4ZThh+cF156eNZCC3ZfnWuJNon
         AG/SxeF5JwJzeKWcindDNu1zFJ0gcc4HyqXh/khxFElD+hlbo9npO7fpggFHaZElkPV4
         9BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473405; x=1790078205;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aJ1SBokHH9upoa1UyD7r1hqwedjaAzZFiyFbJ2MnRcU=;
        b=brn5RX1wl50Vi+MVQCHJ+XIptwCYqoLW8bK8/hJBUv/JGug53Mm8J+rcsDpDgW8XCu
         NjJCfW9xySYQIu4Q1kjYgqaPBpX4tUY7N/yls66r+FB19mJV+8qOEGAfftwwSLn5tOJa
         k638242szUUDHkM0zi5NRLNLBmyr3cSWqftk0j0Qhu4XPKP6gxDyUl9oo3ddO6IaFK23
         Psswd35t5KyrTuX/4N4hIpb4333iDfCvZ4PtHGC80HNRyFP1PDmlfNIvMGkg0AR5eQhe
         QVW31CHMhVSPsX97PAclQkVol2sOz3cNv+zeVLE4UrIGNNYg/qRsGb76iUc8xkDfRjFD
         H7RA==
X-Forwarded-Encrypted: i=1; AKwUvBxP3OYzIelPhv+C5VmpPjCr5QpuJ72Ho9q1ZdTIaJ41KBsbKDVV8lGuY6qXEr6TRdMmNBJ792s5wvCm@vger.kernel.org
X-Gm-Message-State: AFuF++mBacj98p0rJOY2jBToZb+SVNmEXdODIYU4O8Au756n4X3Uz6/2
	O2dAa+jtvZ4SSl91gEHH+vw5uaYrKV9rNwYo+IBJRSrilbYgZhPiEW6dW2Ggrg==
X-Gm-Gg: AYBFou3ZxzJMFlluYdMgOg7gfbLfbDMRelomS7xGjDpSI2jBQEZ2dhT7JSyY7V/lxzU
	Q8InBIW2zu/2TtTxneLs6POl18MEqGFDh3FuUj7GpufsxCp8CvlK4Qtid60UdLPBwEVl5KplocQ
	OydGldGApeJ1Fc/9qKlQnJQRnvC21v9+oATL4npLIJ/zC6R4Jz1wTuXwfQG8z7OOcgFJBGkm+Jc
	6UposZ0iSTMQsZYtgw1i+LLOjtvNex1mzwqf92AjCx9SifaNAhQEcMGf3O/uWtiWeG5RRw2Z11x
	4tQTey+bXooD4Fydw+lfYM7n7OzCVTKt2Ptw1wUeHLFWFAxnWw32WoaIfsf3OCFZvSawd78UcAJ
	jM7DGDrSUSR5QT34dH8Krfa/UTLUI0vM+iaL6B4+WxvXg41byhAJKsDH5ARaHpbADcqWtKHwmjV
	pJYYWBv1whjmAE3SgSSiysbkGfOt+zfwz3rZARe6Il8ecB78phgGCrl3YthywPw1S7v5V8guBnj
	94tOie8pl/pSby35Av3Y2Di8hZW1xj3CwP2brc1Llq3LDBcYHM33v4Rm4NCAIePYqo=
X-Received: by 2002:a05:600c:6989:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-49e7a664c3cmr201566395e9.7.1789473405183;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:44 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/2] Add MIPI CSI-2 receiver support for RK3576
Date: Tue, 15 Sep 2026 13:56:39 +0200
Message-Id: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHcyqWoC/12PwW6DMBBEfyXyuVvhxWsMp/5HlQO218FtCalNU
 KOIf68hkSr1ONLMvJm7yJwiZ9Ed7iLxEnOczkXgy0G4oT+fGKIvWmCFujJI4HIEhOQW8HOGppF
 ovamVZy1K5pI4xJ+97/340PlqP9jNW8nTkfj7WkDzw/bHKdidIltInzU1GvxluAHWlQpGGZRku
 wW3EttnBjeNY5y7g/UUlKFQh5JGJGs0NTUTtX2obIOkOChplNgGDTHPU7rtfxe585/X9L9ri4Q
 KrPPGK2q1Uf7tNPbx67VgxXFd11+9hLgoOwEAAA==
X-Change-ID: 20260825-csi-2-rcv-dts-7712bd834de6
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=2253;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8SP9nahB7MLTsjs0rxhu79aie6zazoZaR+Ob+WI17hI=;
 b=yau80HJx/OiqI2+4nRbzFp/AJXLcoatJ70wB4nOSAxsyMCuc4qdp/OANunbpqxf9Wc5qw1VNs
 r2yFomCOyuSC1ILPFSJnI9D349iXQGQjacxv0mz522lJB56k5fw42Hm
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

This series adds the device tree binding and the SoC nodes for the
MIPI CSI-2 receiver units of the Rockchip RK3576. The receiver is the
same Synopsys DesignWare IP as in the RK3568 and the register map is
identical, so the existing driver is used unchanged via a fallback
compatible.

Only the two receivers fed by the Innosilicon D-PHYs in full mode
(MIPI1 and MIPI3) are added; see patch 2 for the details.

Tested on a Radxa ROCK 4D, whose camera connector is wired to the first
Innosilicon D-PHY in full mode, that is to CSI-2 receiver MIPI1. With a
Radxa Camera 4K, based on a Sony IMX415 sensor streaming four lanes at a
445.5 MHz link frequency, frames were captured in SGBRG10 at 3864x2192
through the VICAP unit, both from the sensor internal test pattern and
from real scenes.

This series depends on the RK3576 CSI D-PHY series [1], which provides
the csi_dphy0/csi_dphy1 nodes referenced here.

[1] https://lore.kernel.org/r/20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Changes in v2:
- Describe the test setup in the cover letter (Michael)
- Rebase onto the RK3576 CSI D-PHY series v2 and update the dependency
  accordingly
- Collected Reviewed-by from Michael on both patches and Acked-by from
  Conor on patch 1
- Link to v1: https://patch.msgid.link/20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com

---
Amin Gattout (2):
      media: dt-bindings: rockchip,rk3568-mipi-csi2: add rk3576 compatible
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3576

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 52 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260825-csi-2-rcv-dts-7712bd834de6
prerequisite-change-id: 20260819-rk3576-dphy-2304f848215b:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

