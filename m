Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CCB385D87
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355748; cv=none; b=ikqYXjveow54QpiDSqn4MnsuJZJfe1CgeKaay1HhmMpjTqhwBUdvB0TPlHvnomlFrkNB9dM5Cd53nvuWySvSXFGhFgBgKqCM7k5hsiLQgrFMFuLJFHq2Ov4pUa87K27O1OojKz3Gv7y7R6ViSzvY9PHk7Qc+Jc4ZlnfFDOrvfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355748; c=relaxed/simple;
	bh=pEOFktyEdDrmsMq+VxhyWtZQC/mdnC1YCF3iTCL9224=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G59sBfPuRW3r6Hd2klfFGk9KNnc19avTnl9tbxRbB1RBUZuQNWm1CC8dx2qfXgxns9thMqWugzYBuFC/tFXZvEcTe3Ntbri3mZAPd6BLZlND6bKitqHa9eIFDmiKgYo9JUVKngZZma3wdAohAD48zD8DULnKy9+PMUwiCzQychY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et3aWNAB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et3aWNAB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf3781ca51so26315345ad.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 16:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355746; x=1780960546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQhwbUv75riwhJ2xHnBk5bpyd72x1+FfpjxIgAuZhAc=;
        b=et3aWNABTQ80KblQvTDfx1fppju0qciGXnI8ZWmoLtkAYX3QQxrvPRRVI9oaZ+s9dj
         RWoWVLZvaf9v5o9Hlvuol8nTXW593VXYx6a9H+H+QptUVtebnP4yJLp9Tak5PNe2cXvo
         P9v3fgjkk2flPzs2vlki98uZxr3eBmp0w3TDG55LPDT7qpcgwUy/Wy9/7PGaXZV6zc8j
         cC6UsZshHWwbtcp0EZRILCiXPPSpi9jXYmYj/i4B9BQOGJu8kHBhrtvCVP7uHSlauMmk
         BtbFXTdgAK8V48gBCQA8rHL2tEkWcyverHPkqNQu3LXl1mVHhpjRplFZvi3eF27lX1cW
         39Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355746; x=1780960546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQhwbUv75riwhJ2xHnBk5bpyd72x1+FfpjxIgAuZhAc=;
        b=LVIdFZ1ZnAyNq9cyvr8KXCEU4F1hNUxjQA/z9YnxrayagzZtNGYuNQZzUBlGl4IFK0
         LTxuB/qXx9lN5aVdbuDsBo/y7BQtXigaQBf9+VUECuALW3+4ybwN2ZLpuaACOmMMRWg3
         bLbPkjRod9bdjjQ0ektUAkN2d89nl/J53GpedHBGI66jEubaZ4LbUAazkAqWCaDnq2q8
         aPbpaCFnwn23Dct2Fs50ZIcMAh9EqdZ0vbETQU4VFbvztBlHLpmxdM75ozKTAXrblZNp
         kN3MmWyuHpWCYhp1BiyiNCY4joCHI4eIF1Wf7V6ZUYj7FgVGxyMZ8BnkIHL4w1YTbRiC
         BuBg==
X-Forwarded-Encrypted: i=1; AFNElJ+hDMYvI4mMY2lWLFxtlD6j19WH9gzZaxmM2Xk9KwIX5xQyVUsDjJ2gvuLgKsBrCzi8fOkMTrNwd2Cv@vger.kernel.org
X-Gm-Message-State: AOJu0YwntdkZjaO7iFGWAKshcp/5SEabidQ15HP2heMeKA+0RzR65Djc
	IFXQL+KXo1Zs7D7jjCSdOuPF8HepFTdn9CD0IJ9bcBRyfm0P+tIdxg8x
X-Gm-Gg: Acq92OFuLitU0AtDyvNpPRjV9TNqZS8NuazhPta4amnOD3evEyKrHl8joB3GvVTdVLx
	Gs5nSihEBS4hz5r9fHXDuBBUmzAKj5H6xQWemozef+P6EbFar8wCs9F+/Mz5a774ko15OyKADmG
	LCEfVf1lBvDd9DSRx8XbbNHT7Q3zwAOyGGkqH7I133479ebb1Y8hq2mEppz+/jxh3JsFEylEtOi
	W0O5mlRVXBk6raNT2IHUWBSWw6xqR6pyZekMS/qzhmRXwKk745qqL3w3QVs68XJno1i7aeUT1BA
	arBYD71tHMeG+gRMlUASpO100KSMYPPJNokl5HGSAarNTGKnVBYKP9RDdmC+OHkYdEjHWDj3jY6
	ffMEEZn1mYGLE6AfNDVilcKpK95U3WVCgBgEpLaGw4aRdBkxNSfjrb4FXgs2mKccrfqIyT7Dwov
	aoaXNla8cwCdsQx+EiKo+WIv6nwe8Qkq9TNNAOhwXlwRAzdtiX35BQR1OqGneKqe7bJlmTpiW/Y
	i9nwLC4rLGsh8YTvkIQ
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr145407195ad.29.1780355746509;
        Mon, 01 Jun 2026 16:15:46 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:46 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
Date: Tue,  2 Jun 2026 11:12:34 +1200
Message-ID: <20260601231236.20402-2-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the documentation for the 'snps,reinit-phy-on-resume' boolean
property. When set, the DWC3 core will perform a full phy_exit() +
phy_init() cycle on each USB2 PHY during the host-mode fast resume
path. This is needed on platforms where the USB2 PHY power domain
is gated during deep sleep even when device_may_wakeup is true.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index 6c0b8b653824..d12f6ae81ab8 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -212,6 +212,16 @@ properties:
       When set, run the SOF/ITP counter based on ref_clk.
     type: boolean
 
+  snps,reinit-phy-on-resume:
+    description:
+      When set, the DWC3 will re-initialize the USB2 PHYs during the
+      host-mode fast resume path (device_may_wakeup). Some platforms
+      cut PHY power during deep sleep even when USB wake is enabled,
+      and the standard PHY runtime PM resume is insufficient to restore
+      the PHY register state. This quirk forces a full phy_exit() +
+      phy_init() cycle on each USB2 PHY.
+    type: boolean
+
   snps,resume-hs-terminations:
     description:
       Fix the issue of HS terminations CRC error on resume by enabling this
-- 
2.53.0

