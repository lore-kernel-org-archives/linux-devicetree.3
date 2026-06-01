Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FFF3644C1
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303622; cv=none; b=Uo5LnXBGpZuh4Ph5h1x1yW1XQxiRRVWQWjOz11P3JVVeLViWo1TGUtP2cTCy1zXXZ/+YwnL6cQCo7aw25giVliE9BOIQIuTtaAShSmob4hqgsDCRCWDBQCMXbG6WkvT1dxsjNv5zM6EdNx+4SBtiM5eg4SsKZZ72a7N/0okKjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303622; c=relaxed/simple;
	bh=1mkTpVi2VF3boKQNNq2NjAYKBhxn5zW6guol+Mp+hr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgyzWPVMFKAsBY0XufATMuKDsB2OrwykhqBViRHO5fyfdml8aOdY2FzdV6LE4CXlkKXC+5pgWTvnVC3KACz8EAGVeW/qAkQ909/g5xt54YTG+pdqECTsqGQ6lhTZmBu0tFQHwcZoz1AuICHNMqav2PXc9Lfu/13v7qjmZbQHEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NwWCggUh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NwWCggUh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a7629380so11017935e9.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303619; x=1780908419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnXbjTKMyn86FuU7uk6pAXf7Et8qNHJAEHLholFJyMo=;
        b=NwWCggUhJytKK0GPO/K7qRX5KAI+qVKGa/7KhnQgCSeAy0R/KEiTzBofeIkmIbJiGM
         QOiGzAjPx1/thrlot42sZafa0tVLIhiyqaC81cy2CPkKA8EcvCRLZyphPzfCPFg9Inh0
         8R8GWCa45Ac0SGGGZPyzpMrT/42KzW8CnRMDH4fcR5ALYZrXfGGP6X/Zf44fwBN21GOL
         Ri/qZ4l5pYlNiZpsCizUsLTxFLFbOmM+EzBZdWu4o3d9VxR/r0MiYX0ZjfPAwS3i09S+
         AE3yWuIfwwrT24/8mUIVKcKKAdq8Ss/J0i793UZALbQxltvCr9Pp41DH1GtVRPYwBKZb
         W3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303619; x=1780908419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VnXbjTKMyn86FuU7uk6pAXf7Et8qNHJAEHLholFJyMo=;
        b=G42fsNsqzy2AhM4COf5FwSx0Jf/4T5epaeym6oIkFeKB+rtjJTlN6XCjevjwOq8pXe
         Qx9y7sPQ7DrYQoE+IBOpmlWz5p79XhGgO6HEezmz/z5Ajsix4t9zWYpuMmv/bNMISG/6
         brHImMwL5aG81ZKXu/dNDdwR6YBoKP2kOiCoU+pSAq29NI7T8znkRf88M3CC2Q1mDlU9
         KvGNA2BKRSd2mVpGvd2xH5OSGyiDZ38+QyW6IKfhJDtwT1t7HVkBaufO0sKeJMokfAZO
         XRnQN6QJ0SLAiYhai8crW6yygcVIHFsJDXrlE15xOhhC5jGWSyiIUk8Eyh+Jd440rwKK
         xfLw==
X-Forwarded-Encrypted: i=1; AFNElJ/uCt2Y/hjFSnCSrB7OGcDB8otkipW+1dBGHr/Nn0DWcUnwryTpdmiWbYc47kePTBoxgqKI4DdHNAXN@vger.kernel.org
X-Gm-Message-State: AOJu0YxUA762+H/YDXLY6ciKN5oUT6HQtT3LefpgD+fgFCk1JALevQwV
	1AqqXKVngTL7yy2EF2nKwBhaR0AAI+zlknxYFN8UMseicMGv7/nuYKCFVCnww1Tsoqs=
X-Gm-Gg: Acq92OGVH152CUqjLaKLjQx7GLhWksqFynwgZ0F7r8Mg5Rrv94qzPcK+we1jUdx8jVu
	rlc5EaWRGTS09ZBb6Tk2GAZnw/nb0iD9w0ovreBw6TdF50YLUKRnzP3hztWP8qwR8tNLrzvopmU
	gesmCDXJRgSe3JEcbeW0ylqV24shif6aOdBu+hEYu55n2OLgmCzOCk4BPujjLut9HROWy78En2O
	KGrgaIJ/UBz6SdQAERUqIdSKvZ1Z6uwrdMi07vIzG7OmuAbAIHArD4EzWmc77uZvFy0uzPd5bVu
	+0CUoLlzjQZxmFdNlC1u/yry/HBBr1tFFaAyNNrGQ3XG62ZAoOJQD2nQiw5M884VPgLlrZ7kvBX
	OwMsK4ApdlrjMzR2p570cw4+ngeR/M3ajK1lQn5a9OOr6+Oe2sECmQTiBX5hroOnVN+xhpyIgJv
	SbIyvX2fYHJ1BDlXqJmwAZHr7USV30ASdtSREsLnZtsA==
X-Received: by 2002:a05:600c:1c14:b0:490:a646:9d74 with SMTP id 5b1f17b1804b1-490a6469e64mr161541825e9.4.1780303619566;
        Mon, 01 Jun 2026 01:46:59 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ae39c281sm15309795e9.14.2026.06.01.01.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:15 +0200
Subject: [PATCH v5 4/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f
 memory region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-4-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1mkTpVi2VF3boKQNNq2NjAYKBhxn5zW6guol+Mp+hr0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt7ez3qbmc3WXb9zmmHPWiOfjNNvES/1rXY4l9M14u
 +fM/FXvO0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAikWyMDBcK7JIfPlMIT3ie
 HrT+7vTUgGM6/gdaU9pfWHr9urJftpeR4WfR1a3nb6Xlt2eXxBcpPThb0l5r/OeNQuiC2k0tdhz
 pjAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 12902231e58a7a958f335096047b0d2384dee722..437b1df02142c666019ad4ad3558fa066e04781d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0xd60000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 

-- 
2.53.0

