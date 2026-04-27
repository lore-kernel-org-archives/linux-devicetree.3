Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3FC3909AE
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273423; cv=none; b=d6jKApG/mdybIFb+lsPMsjHALwUJivIAJTsmev3TWLc83PADp85tES4Vmdi8N5PrMALUrKGxLXuDtoaALCHtuTNnsMm+TNXuYaBjRQDSOYoiVMJ25KYP/OhpJgSfYRGTAtNrYiuEYVpfBLDPo1Bx3DoNsDVGos3QyfBd8JshQiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273423; c=relaxed/simple;
	bh=idAm6JZdBMdmeJKkc8DR/+djQ9ywzFWWkJPRLet5UAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbWZjBYQUrwkQFs3h4dsvlG9Hanar+rN5W+rcUw9AWFXBIDqQUq8RI8lm6dXL6xXSQTk7I62Ua11zuZCaJNPE79m+u/qgQRgvy0m1L9FTT9KF4g2OBl9HHOUauWT6anmWVfn0MVdbg/UKi3ACg3wV41/CCezNtPjrNLMembO5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KB3aeIqu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KB3aeIqu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f60944so7258566f8f.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777273419; x=1777878219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpcczuyftVggiNXKRP50iSyYabcce+E3E5UaiR04aCg=;
        b=KB3aeIqu+k6wjtgWAvZZ5+fbBzMjyAc3o4UPrFONlG2+JjdtpxLE160mmF5G6WVBmO
         zPbFHTCo6peZiWtF4CfitBDPOSt04KL/llEfhmMPrucyu+3tYB+OrrgJAmYwFEWVPLtP
         SeiUjiqtkQsL5BJxhED6g2pE7RStgd1vbSZYxXXoQAE7SXOUP8H2XNJYVVQKv9LZMxyh
         ovolkxMEiF0BVxpdOp20E4Vfd8bBNk5h5OD30bXfIWIJoGueUT8W09D1CkXtgFcbur3Q
         j7yi9DMuWuibN/qQWMGjhR7hftlsHQ9fpK+IfefmXORfY5jMFJyqrN5+RZSfYkxZdLAm
         uHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273419; x=1777878219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpcczuyftVggiNXKRP50iSyYabcce+E3E5UaiR04aCg=;
        b=N1DD8A/Ciq/ZDyXEr1KwR2KZfMEmej50Im5wnYfgl18pyknvpQcQX1RLPUqRqAuJre
         Sl9dMnetrwAelcaXmEalIx0+Os/WMB2YsgNY7OzOi07cwprmgIbFsK26/GJsheoGMnEJ
         k5ymxY4g89h4rRRRzdR8gTqJD9uhG6+/6xIoLITWCj9MIS5p0BTtQhP/whFjgyYO9Oew
         fCbxzNCtWhsg6Hehe4uEeh1uv46JL/IHshVBCLETUUsTraf+qxOwOHgK/EaqKFSVj3s/
         qXQvXSa00bU0Z/HN0BSPDd2e0oGNSwJu2u0uoRw4FdNoccuxQBWNXRYi9WlzEyoKqzoM
         CefA==
X-Forwarded-Encrypted: i=1; AFNElJ8edsR9p5NUMhJXPmkqGTARXhjpggvF3Op5LS6UMxqlTl50serzJWCLiBOTSfxRp37JCtYWj1+tq4Wt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VIm/UREi0WpImFFocasQUT5vlbuGIfi2QZGBQM9m+4yPX3WS
	bR5vR0R5idPNBVx5GQ1ndPww3hZEyBbqDgO9LOc0VK60cWBXbNmvVT28
X-Gm-Gg: AeBDieuOv+MD2cmZKl+zCu173RqZijb3n1s57SRmj0ZREe7Ql5VElxdSRwwW8904XBc
	GofRJv2wDxPqVbpBntnRV3lJXr7ZVr0DqeSs+6gMqyEXS0sAcm3OJ5u+xmu3DjvnsQ8nw0leJI7
	SKVDV2yL4cYE3JZrVqmLsMXzbTezNVCuWcVaisNOqUeZShvRMGlJUQH2kGoRTKQ5txMiGHcdGn9
	oWMSxotwwE3UKlSgWJ+luhtkDalM52J8xKvtiETV3tTDcEeMzZpSQQwX2eYWIFC3FjQHFi/qOZy
	HhPc8HpLus+VZpA83j0aYyi5NjpWuEhUV57gqSlM12E679fCaBt2IkNxHooJ81STwJ7E7aU6M/k
	gE+1VfTst5Pk7wItl72tdN0fNuRE5CoVjxow/Va84FqYpojOL8xiVYeJM9CRamg9qzBvs4dZgO+
	wpSKEhUz1LrMihAxlZ5iNl6/g=
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr62264642f8f.29.1777273419087;
        Mon, 27 Apr 2026 00:03:39 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a341sm84245734f8f.24.2026.04.27.00.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:03:38 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Mon, 27 Apr 2026 10:03:06 +0300
Message-ID: <20260427070312.81679-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tegra114 support into existing Tegra124 MC schema with the most
notable difference in the amount of EMEM timings.

Each memory client has unique hardware ID, add these IDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../nvidia,tegra124-mc.yaml                   | 31 +++------
 include/dt-bindings/memory/tegra114-mc.h      | 67 +++++++++++++++++++
 2 files changed, 75 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 7b18b4d11e0a..f8747cebb680 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-mc
+    enum:
+      - nvidia,tegra114-mc
+      - nvidia,tegra124-mc
 
   reg:
     maxItems: 1
@@ -64,29 +66,12 @@ patternProperties:
 
           nvidia,emem-configuration:
             $ref: /schemas/types.yaml#/definitions/uint32-array
-            description: |
+            description:
               Values to be written to the EMEM register block. See section
-              "15.6.1 MC Registers" in the TRM.
-            items:
-              - description: MC_EMEM_ARB_CFG
-              - description: MC_EMEM_ARB_OUTSTANDING_REQ
-              - description: MC_EMEM_ARB_TIMING_RCD
-              - description: MC_EMEM_ARB_TIMING_RP
-              - description: MC_EMEM_ARB_TIMING_RC
-              - description: MC_EMEM_ARB_TIMING_RAS
-              - description: MC_EMEM_ARB_TIMING_FAW
-              - description: MC_EMEM_ARB_TIMING_RRD
-              - description: MC_EMEM_ARB_TIMING_RAP2PRE
-              - description: MC_EMEM_ARB_TIMING_WAP2PRE
-              - description: MC_EMEM_ARB_TIMING_R2R
-              - description: MC_EMEM_ARB_TIMING_W2W
-              - description: MC_EMEM_ARB_TIMING_R2W
-              - description: MC_EMEM_ARB_TIMING_W2R
-              - description: MC_EMEM_ARB_DA_TURNS
-              - description: MC_EMEM_ARB_DA_COVERS
-              - description: MC_EMEM_ARB_MISC0
-              - description: MC_EMEM_ARB_MISC1
-              - description: MC_EMEM_ARB_RING1_THROTTLE
+              "20.11.1 MC Registers" in the Tegea114 TRM or
+              "15.6.1 MC Registers" in the Tegra124 TRM.
+            minItems: 18
+            maxItems: 19
 
         required:
           - clock-frequency
diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
index dfe99c8a5ba5..5e0d6a1b91f2 100644
--- a/include/dt-bindings/memory/tegra114-mc.h
+++ b/include/dt-bindings/memory/tegra114-mc.h
@@ -40,4 +40,71 @@
 #define TEGRA114_MC_RESET_VDE		14
 #define TEGRA114_MC_RESET_VI		15
 
+#define TEGRA114_MC_PTCR		0
+#define TEGRA114_MC_DISPLAY0A		1
+#define TEGRA114_MC_DISPLAY0AB		2
+#define TEGRA114_MC_DISPLAY0B		3
+#define TEGRA114_MC_DISPLAY0BB		4
+#define TEGRA114_MC_DISPLAY0C		5
+#define TEGRA114_MC_DISPLAY0CB		6
+#define TEGRA114_MC_DISPLAY1B		7
+#define TEGRA114_MC_DISPLAY1BB		8
+#define TEGRA114_MC_EPPUP		9
+#define TEGRA114_MC_G2PR		10
+#define TEGRA114_MC_G2SR		11
+#define TEGRA114_MC_MPEUNIFBR		12
+#define TEGRA114_MC_VIRUV		13
+#define TEGRA114_MC_AFIR		14
+#define TEGRA114_MC_AVPCARM7R		15
+#define TEGRA114_MC_DISPLAYHC		16
+#define TEGRA114_MC_DISPLAYHCB		17
+#define TEGRA114_MC_FDCDRD		18
+#define TEGRA114_MC_FDCDRD2		19
+#define TEGRA114_MC_G2DR		20
+#define TEGRA114_MC_HDAR		21
+#define TEGRA114_MC_HOST1XDMAR		22
+#define TEGRA114_MC_HOST1XR		23
+#define TEGRA114_MC_IDXSRD		24
+#define TEGRA114_MC_IDXSRD2		25
+#define TEGRA114_MC_MPE_IPRED		26
+#define TEGRA114_MC_MPEAMEMRD		27
+#define TEGRA114_MC_MPECSRD		28
+#define TEGRA114_MC_PPCSAHBDMAR		29
+#define TEGRA114_MC_PPCSAHBSLVR		30
+#define TEGRA114_MC_SATAR		31
+#define TEGRA114_MC_TEXSRD		32
+#define TEGRA114_MC_TEXSRD2		33
+#define TEGRA114_MC_VDEBSEVR		34
+#define TEGRA114_MC_VDEMBER		35
+#define TEGRA114_MC_VDEMCER		36
+#define TEGRA114_MC_VDETPER		37
+#define TEGRA114_MC_MPCORELPR		38
+#define TEGRA114_MC_MPCORER		39
+#define TEGRA114_MC_EPPU		40
+#define TEGRA114_MC_EPPV		41
+#define TEGRA114_MC_EPPY		42
+#define TEGRA114_MC_MPEUNIFBW		43
+#define TEGRA114_MC_VIWSB		44
+#define TEGRA114_MC_VIWU		45
+#define TEGRA114_MC_VIWV		46
+#define TEGRA114_MC_VIWY		47
+#define TEGRA114_MC_G2DW		48
+#define TEGRA114_MC_AFIW		49
+#define TEGRA114_MC_AVPCARM7W		50
+#define TEGRA114_MC_FDCDWR		51
+#define TEGRA114_MC_FDCDWR2		52
+#define TEGRA114_MC_HDAW		53
+#define TEGRA114_MC_HOST1XW		54
+#define TEGRA114_MC_ISPW		55
+#define TEGRA114_MC_MPCORELPW		56
+#define TEGRA114_MC_MPCOREW		57
+#define TEGRA114_MC_MPECSWR		58
+#define TEGRA114_MC_PPCSAHBDMAW		59
+#define TEGRA114_MC_PPCSAHBSLVW		60
+#define TEGRA114_MC_SATAW		61
+#define TEGRA114_MC_VDEBSEVW		62
+#define TEGRA114_MC_VDEDBGW		63
+#define TEGRA114_MC_VDEMBEW		64
+#define TEGRA114_MC_VDETPMW		65
+
 #endif
-- 
2.51.0

