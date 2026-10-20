Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510668;
	b=4EOGE3921ieeRsj7tF0Y/oV7NHjLoWxPzU543uBOfSO7EK32zluGBZFu9QjIOGwxQ/Ni
	 pRt65WCprCVR+nzBbXguAilmkVScIcO4WfZWhvF29mHVjMHqHhoUd3DSHn8cF82zsiitN
	 gcRzMINteZWZZXTqVf7PFSNs0wpDvOVFZr4P41rFNPA8YUZEYnAgB9Q7toukILwhJPYUa
	 L+WTdZdIyqF4eTEzVFi/idISkn1H87tAqE6+5Cl1sPGJvL/RzyeSTULj0R2kYtg+QCAq7
	 EewBeMc82XHV//+xi3mFESb5oRFOY3BZoEY/jvg5r8KuZJpO95slW29eeQscQesPhDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
	b=IUXjo0LQScGdUoX+9X/9SAuTMXW+vZaDa2C9VK4o2aNWxVJ24GZJzNjAsb+Va5d+KhuT
	 2m92PWkVuoQ4fy1FeZ9R3PiJUA8K+B5a2sCvyfJyd08NX2Xq2/wIwcJykY2isHEyFK0k8
	 r41NojhC7iYaMTWExQbrupAByCmpLhjQXmfKxEvH87NIivYu0RnLhUo0PnFZ0TKx8VqUK
	 tcm+nqklzhw8I+7QqX3ZIUHutK7C/2bpDhbLQNGtAbz7Nv79GCgsdGFTETtuIgNPK9S+Z
	 N934PcMDE8RfM3RDpeLs/yKf3Z+S4jnoplDDVcaYec+4zdy+GzUY2PhQl1vYytwKBWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2he3ntK;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6830C60A2626
	for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6830C60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e2he3ntK
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so6118730eec.1
        for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510668; x=1793115468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=e2he3ntKMdsitxFNgYNDH2KDtjT8SdoDD7kf2YzzKijEjtZurMVzswa+aZbKNL5uGm
         17OTHiwqGo/Nxc6JdBmRcph0RqvrCYjNejHxlatn3WgJ6M8hKqqroMMwyHGrGOHpyEWm
         iz+o22iwugbB6vjf7oDOITU8ifXxFLZNx7C1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510668; x=1793115468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEhsrPmovlqFhqyaT3oTm4Fh1ZVngCl2/NoPnSq3l5A=;
        b=bAt8Il4s5kaFb4ekK44HYcJ+m9Ma+gMP7IvsuDK4GhfSXtOkKRVjn2t5jqqimo6qty
         xDiK2jR91PNzc8ICxVru2HqywKW20ylTNrxO645oYIM77S2C4noulNfthKnfLKUiwFLD
         EmIC8k7qK/meWtUkHJp/EAVGq2H0LL4NyNluU74jZVVmb5L359ibQjcXlGHEDvPyW5nZ
         G4mIARg/BRksH7sQC3I1dwNN60WnZ8mj+jDOizaSuxcdbgiV0jcWOgNXk+J/RYkFyyQF
         7LTluGFbbgtTsMZ1VKd/6QzY/7Hy+WmcbK3mjz2asqe91LWgdkIX1TscxD2oHE8MB5af
         SsYA==
X-Forwarded-Encrypted: i=1; AKwUvBzanJi8QIqMG/5+Y9NcPY998HJB/Dq5bMsmLZ4mc7rcDXrXk1KzntTUItnEiRodCQ5xENL9m4XyVa4u@vger.kernel.org
X-Gm-Message-State: AFq9FYKY6Xp8zxU+Cirq1G+f+GL6BOXc5mKeId4+KGFpG69Qqn/8Qgc6
	QqJM2jrCoJKebjchH1maDOlzCGWO4Png2RkAw4RDKimOypJhuT51NkfeUUp9H8VsUg==
X-Gm-Gg: AYBFou36BYGKFzIU1lvyFPm27KpBBQLGCzZWv0pzIttd9Y6QWU/bLhb7FoNav+ZEgzJ
	B7cQDJ0j/zPfq3NV1gBqg/YF6Qc1lzgKpmmmLNw2FStVhSJgmy4QYLRjC7fVuVM2ubt3u3z6hbI
	kLSgEE8K1rkkiTUwVn/BtYQ7wOVq6HBbbEnpwJC3RHEFjr19REj8pyFM28nPmgqBeWDbW94y2qH
	EJ1kehOfJQqa49uDojYq/tWt3gmwGvtXoyA9U81QI9pcolnr4lpSWy9silSaXjjGHaQ9VB4OQ9/
	JbjPEf/yZqHHI+JcsxxzeLeuT19fFYUC74UophApE2DX6xXT03c5pprez0wF2itdSuZqMgpZyAC
	E+m99bqzWWJutT8vyt9Nqsm4wl6R41EwZQ2OJD6LHAqd4wBDHFzqS1F+x4h92N5t1/RgmuuWgvX
	mg42ha0QkQHYpMgkL1dDh9h2G83NoSdB6g8imzAL74ezDuC/qiiJ4hIzWGSfCKRFO7Us8KPd5nl
	njuuZRpDBa4vFzzB4egAwxnWZlQRhwYOuvCBqk1NIfzyR1gLsrOuozj5iHFh3Rm1xCIsufi/uVu
	ruvYOfq+s8Q0RSMe/drkHkAB5NvwQbRkYQP3b+Bz
X-Received: by 2002:a05:7300:10d:b0:351:1e89:66ab with SMTP id 5a478bee46e88-361a0e85fc5mr16049994eec.7.1792510667340;
        Tue, 20 Oct 2026 08:37:47 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
Date: Tue, 20 Oct 2026 08:35:24 -0700
Message-ID: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an Image Tree Source (`lga.its`) describing the FIT image for Google
Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
`lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
metadata in the configuration descriptions, allowing the LGA FIT image
to be built with:

  make \
    FIT_ITS=google/lga.its \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

It should also be noted that the "description" of the various
configurations here is expected to be parsed to help figure out which
configuration to use on which board. This idea came out of discussions
at Linux Plumbers Conference 2026 and means we don't need "loader"
info polluting device trees. Having a structured (and upstream) place
to store this data is part of the motivation for landing this FIT
image.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the soc_id and soc_rev (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the soc_id and soc_rev in
this FIT image in the hopes that we can improve the bootloader in the
future, though.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that building `image.fit` with `lga.its` requires the Pixel 10
(`lga-blazer.dtb`, `lga-frankel.dtb`, and `lga-mustang.dtb`) device
trees, which are currently in linux-next and not yet in mainline.

 arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.its

diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
new file mode 100644
index 000000000000..5ba19c0b5411
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.its
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/dts-v1/;
+
+/ {
+	description = "Google Tensor G5 (LGA) kernel and device trees";
+	#address-cells = <1>;
+
+	images {
+		kernel-1 {
+			description = "Linux kernel";
+			data = /incbin/("arch/arm64/boot/Image");
+			type = "kernel_noload";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0>;
+			entry = <0>;
+		};
+		fdt-1 {
+			description = "lga-blazer.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-2 {
+			description = "lga-frankel.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-frankel.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+		fdt-3 {
+			description = "lga-mustang.dtb";
+			data = /incbin/("arch/arm64/boot/dts/google/lga-mustang.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			hash-1 {
+				algo = "sha1";
+			};
+		};
+	};
+
+	configurations {
+		conf-1 {
+			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-1";
+		};
+		conf-2 {
+			description = "Frankel (board_id=0x070306,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-2";
+		};
+		conf-3 {
+			description = "Mustang (board_id=0x070506,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";
+			kernel = "kernel-1";
+			fdt = "fdt-3";
+		};
+	};
+};
-- 
2.56.0.212.g129ede20d9-goog

