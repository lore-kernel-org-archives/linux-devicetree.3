Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC597358372
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282748; cv=none; b=smLoztZ1DGcEEwj1J/69R03LDqaYuGDSp0gChDLfOOk+olq+mj8etAhiE/ixv+TEfj1tv7JiJlDvvmeIYc9PFn8RlO7uu90PHOm+uP5sqDWepxK+j2xO5UbH4UAXoAI3r7jw2yQ9DtjspwECju44D88tLf9ANKEViaMalLdSNp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282748; c=relaxed/simple;
	bh=rTKRF6vf9ERjKXH2kWeSUEnOuoEvK9n2OVJj1+dwk5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMPB1HVmms1ELJxeO1Np8Nb20ECCCMAXEVj/RwEX/cJxIaz3evGwcBuVcQ/RWczsH+8tTpZYMrZ0WVv0DGiESsoOjxu2z1ft8sMOvIgUoKslLmaI5BnHPc6MfZx4rF5Ot5ZSLTv/TwuRqeGJBHvakc6p/LbWaYJjFF5+xf17OUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=OJ/0mm8N; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="OJ/0mm8N"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so1261937a12.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 20:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787282745; x=1787887545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBrYAs25F1BMwhNxYWXrzzIRZUTRoKOsBihavlqCIAc=;
        b=OJ/0mm8N7QawBJb3JhgM6HN7n6j3q19dTqoKGXWHe/Za4dJOaZCdrJM5Q1cBKPKakL
         Wls2lFcEfgraXHCPSPGFI3xuKrrlsGigWgdvavmsaKIszRCojTjtsbCVg5lJ5O+IrekL
         I8sWgIirubW83HuMVgQjbZB0upcFjYiQfhavZolTTAtGQ6Nxsdl8ObUinNzTtq4CgJ5G
         I1ZkwCHL4yAY41G97Sgms+NkXDXlEr3SRU2wcCHQ0gDdv/gi3kIrqTHNQGrVOqm3m9fg
         KxFMUtXKHRIrbKYs75RW4ilHzu4OjPyTDGIAXFe8zxrb1EzUNEJUqPNX3hSgXLzYirgy
         /0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787282745; x=1787887545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBrYAs25F1BMwhNxYWXrzzIRZUTRoKOsBihavlqCIAc=;
        b=jrqMTYEoBZ6o1xd73EQeDOh+h786ByhH+TSdU2wgYtYvdYJMA14KfmmA2ixTkVxNbh
         3hvrnwECZ2pBY8pSOaKOsrlaZtq7Q9z+S6GnDwnH8JIJoFKE9IxIOjNtd5sxRlAfI+S3
         Tck/OPipGor4dneq0SbmEPZLvE1E2adtCa/Vu7j97yujf7FrOkOChqqJAQxO+Nk9j8Du
         W284Ekqh6JBf0edgrGl93wqqRGyAJD0u9iROZUVVnLkjzbb5XNfWRkp1JxFUn4pNAFdw
         A44cLsb9DVjqjtK/PzwIpWUVmY8X+rg/00CExtUHxnYAtxjmLpx4Viw8kLaRlDA+1IpY
         EIag==
X-Forwarded-Encrypted: i=1; AHgh+RobVmBsoEYsZ1cS2fzNnnm290mvJwsgtb4mHwjy79ADJUXb1FmsDLxL00iOSF0URKgmNzJxBawtnpKM@vger.kernel.org
X-Gm-Message-State: AFuF++k+eTqx2yeFAelSSAFcmnXP43twnUUwsrGZwM9194mNjdmokba2
	8ycOKNrSUKVhWjQnxs5qP1aHXzJ8T12Dc5YmBts32fg47WpLz5ePyHoQ02JVheFq9MI=
X-Gm-Gg: AR+sD11EyRCpmRBha1Bwvi/ZYGQN6KeaEhTkXO7m4hMbN3huubc/SfEdAy/apLXzkWN
	5WsvD3mnDub03LoB0Qo/to+ugl5xPmoHS5dgYGCDQDCx0nzTDc26GQXAF8jZy8Ww5un8rqkD03W
	NxskxnMatDr7jGiLCao9gA4wqSQCY4D19lcAukhC2TBzm9JfA/LznMf1lj99GmbXQeRSPXIYbQ8
	PioSlkDJzq2eSGQAaFwpJi6/F1sNCUo7WeW4q6nODpzuGypl47jR6a3NheZnanoIzp7DPt/UxsU
	BGLc6tpTvgsCyoAzjtRXVt6iIlnSRGXSXGMiNtD+DGmfV0xo8cFQWllMSMO234iwR9RAk01g4fh
	FJengrbOKj9BlVgpRoQNAlDDXkdKVaBUIoRW+L3zFoDib5zAVQ2GEpfyPQ4gS6RB6Gd6C03jtkf
	QwhC24ywmJc7i1Ct8NiDN0LL5+8uYQTYIc7yTs6qjjgUnxWRjlUTP5tYxLjMJqAHwDD3CCPdwy/
	U95
X-Received: by 2002:a05:6402:1ecb:b0:6a1:f95b:8ced with SMTP id 4fb4d7f45d1cf-6a42f153920mr3334475a12.4.1787282744913;
        Thu, 20 Aug 2026 20:25:44 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([85.17.200.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff177b1esm4217194a12.29.2026.08.20.20.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:25:43 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: reserve firmware-owned DRAM
Date: Fri, 21 Aug 2026 06:25:41 +0300
Message-ID: <20260821032541.1856299-1-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it ends
at 0x48f00000. On laurel-sprout the firmware owns 0x4900000 (73 MiB) at
that base: the downstream device tree overrides the SoC region with

	removed_region@46200000 { reg = <0 0x46200000 0 0x4900000>; };

which ends exactly at 0x4ab00000, where mainline places camera_mem. The
28 MiB between 0x48f00000 and 0x4ab00000 is therefore firmware-owned on
this board while mainline leaves it as free System RAM and hands it to the
page allocator.

On Qualcomm a "removed_region" is XPU-protected, so this is not a matter of
reading stale data: the region is not the kernel's to allocate.

The observed symptom is hard lockups under sustained buffered reads, where
page-cache pressure eventually reaches the disputed range. Before this
change the device wedged at a rate of roughly one lockup per 59 MiB of
buffered reads from the SD card, reproducibly enough to fire on demand.
With the region reserved, the same workload has run 691 GiB of buffered
reads with zero lockups.

Reserve the delta as a board-level region abutting camera_mem rather than
resizing the SoC-level reserved_mem1, since other SM6125 boards may
legitimately have a different split; sm6125-xiaomi-ginkgo, for instance,
has its own corrected reserved-memory layout.

Signed-off-by: Roman Linev <admin@mswin.me>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 139f2b401..a6ee6ee80 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -37,6 +37,20 @@ framebuffer0: framebuffer@5c000000 {
 	};
 
 	reserved-memory {
+		/*
+		 * The SoC dtsi sizes reserved_mem1 at 0x2d00000 (45 MiB), ending
+		 * at 0x48f00000. This device's firmware owns 0x4900000 (73 MiB)
+		 * there -- downstream laurel_sprout carves out
+		 * removed_region@46200000 with that size, ending exactly at
+		 * camera_mem's 0x4ab00000. The 28 MiB in between is XPU-owned
+		 * on this board and mainline currently hands it to the buddy
+		 * allocator.
+		 */
+		reserved_mem1_laurel: memory@48f00000 {
+			reg = <0x0 0x48f00000 0x0 0x1c00000>;
+			no-map;
+		};
+
 		debug_mem: debug@ffb00000 {
 			reg = <0x0 0xffb00000 0x0 0xc0000>;
 			no-map;
-- 
2.55.0

