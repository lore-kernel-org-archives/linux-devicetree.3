Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB3205E02
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132742; cv=none; b=jJtf+Wa2yxMWg9+P5vmq0SZVwlRHgcTt9T/5x08/XnSGCU1gt64o1PSh+O/zy/MJ0Ju5q5sEk+u4+zsunc6gTkjQ2u/WA4lvAfVaenicPeeH+Iox/4GbgJwK6ginCkggxC+bm62amJ9TqMQ1zir7ZJVkzympJsOZA4KhZgoc9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132742; c=relaxed/simple;
	bh=JkIZSeQOgw0omVuhb+XAnYAfTRDkMpkja9HU3qRSxf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIeqRnxFB/zSU6isFO7eUBTj3IBtyfrUqnmoqSqiICS1vccH2Cos4RkazexyN70ToDhn6VSp8a9AieNM2llRNhx3LEIBEmi2k1XOrcsnuHaU3tY6igJNzC/ZdIgEB5+b0h9A1CwsVCFVJ78XI8byduMw2tecAnRKHx22eoH6WoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZqJpuwYa; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZqJpuwYa"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f0e5e36912so21706916d6.2
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786132736; x=1786737536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4joOXAvzLxKT0P3XwUvMlv7VRPuLM5U+lQ4gEocfRM=;
        b=ZqJpuwYa+xChdb16fFtzYfM/Dg92BJoGqwKAc4tXxQUrwPR+cnXDZBeFfD+ijvPV/C
         ozZDIRtKwGpcCF6KPfOPATejcSR+kZEtLCUA9Km2yQ1z0Z71kYDdHT853QGT++eEXTh4
         0L7sCMcVGCqDhuvXejlSeC2ObNK1t3pBZ6pbwDHYtGgxcF++nq6GVXZ9m5u9woLwZp8D
         1Uq5k8BOG2LbLYCLYt6OwONcceUm/41hmLF6T7mwJtUQL0kkWFCWCUjrb9hqGkVgqx1L
         odfBkakLVlEqUJMZBZcwlO1lulvvcjlZ3pTALpR602NhSndkkQsIoEstuAxtzR26U4v2
         vt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132736; x=1786737536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4joOXAvzLxKT0P3XwUvMlv7VRPuLM5U+lQ4gEocfRM=;
        b=FIZjFy6SM2ALsI8YAgONrwvVhP8UEfj9+sQQOb7w+8H7jBSUOvgFGNdPzdmhW7Yxo8
         yevv+khHnOedcg5pYkxOdBOR1z9hteZ5t9Vctpjqf0yqyGruPUqFpKsa3Pp0Xc1jwSAC
         xXq54H5j08fvCdrrNH21KM7WI3tcPD1Oh9b2sOounbFX6R7XADAMPGwC1Imk49TJXc6n
         qrRSQ3eDJ0QkLNAij0RLXq9ITX3K5gbr08IaNzZqZe8YVzWowoWlT90EDBsesr4Ar93r
         hGGu3ssX/l8CRSZ+QAOPYBQiL9BhmQydEkvykAVjpVlQ6MaiTMeKUMfWgMIMdxRG/iBj
         4h9w==
X-Forwarded-Encrypted: i=1; AHgh+Rrh22Kdan2R7onkEGzH8aig7xOg8HbRzP1MN14plQhSl9S2XXx7PZrvhyTLtsPpOEs4qJq6E7vhAVqb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+4kY9ExR06FQ3EtwwpQMvSHFtsv96CQM7XfUaqTyNYUMCuGR
	FgoWSzZ2pTyCMDVkLttHMib6K6euiznF64YqQq9pAOFDLxSGoCCTeTnI3dJkc9trdCM=
X-Gm-Gg: AR+sD10n5Y/KEpOTJyiWqw0FY8Uh1Q39DHj9pQn5YuEKk5Ot1GBDCm4p2hedq1MrQtL
	XE5FYQZzpVd1AlrrVtTxUQrzkdX1hhcdQzAjoLNISrtnH8WWnADd8ak9JcnZLUSrEukcxEpMfRz
	C5he8O2y5MFj5S/x8FW2vLb8xopG28lIM29Sy5WDwueMumGxh745gQKV+IIjuCOk1y4GINgHhgD
	WLYxH0WlBtcfLtK+n7Kdq8D7bqJtDY5/rQTETM3RhHW6XXQ0v3nQsE7vUxigz1aBGgMXZjSak8l
	s/9MIn5TI/T2ciyV17jlE/IS9F94Iudgul2fnVEVa+ZnsKBIj3XfHFN39lcSNzZbQtCKrsDYaqD
	0SgqsYqVCoEDGLuaPpzEVZPQ1sXHRC0WXkJ5AWT6AdUx/EIo+m6MSsegDfO0UQovoGzaa8XPTBu
	lqf8pjvE0TSU+/1Kh2gd3/B7Jd8tbX+5h3PYROksYt6waazH2QHf54yPxfJzhpQVkJ1VXQCKR+l
	nw=
X-Received: by 2002:a05:6214:1946:b0:8df:1814:3a1d with SMTP id 6a1803df08f44-9088126c9c9mr278042996d6.22.1786132736345;
        Fri, 07 Aug 2026 12:58:56 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff366sm15824226d6.32.2026.08.07.12.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:58:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	mani@kernel.org,
	sushrut.trivedi@oss.qualcomm.com,
	umang.chheda@oss.qualcomm.com,
	rosh@debian.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: qcs6490-thundercomm-minipc-g1iot: clean up PCI function nodes
Date: Fri,  7 Aug 2026 14:58:44 -0500
Message-ID: <20260807195846.456079-6-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
References: <20260807195846.456079-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Thundercomm AI Mini PC G1 IoT devicetree source file defines a node
representing a TC956x chip which contains a PCIe switch and an embedded
endpoint that implements two PCIe functions.

The devicetree nodes erroneously include a "pci" device_type property
for the two PCIe functions.  That property should only be used for a
PCI device "that implements a PCI bus".  Remove this property for the
two function nodes.

In addition, these nodes define #address-cells, #size-cells, and ranges
properties, which are not normally defined for PCIe endpoints.  Remove
properties as well; they can be added back once they are actually
needed/used.

Fixes: 1cde54c54b83b ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts    | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index 31bafa2cf51db..3e8d144f57b00 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -792,18 +792,10 @@ pcie@3,0 {
 
 			pcie@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
-				device_type = "pci";
-				ranges;
 			};
 
 			pcie@0,1 {
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

