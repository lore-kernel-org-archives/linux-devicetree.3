Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510657;
	b=4XqWPwUGcDb32L6H0xy+Noy8PSiXYGk3HiqqKAvv+DNjM1waEheZCsPBEKuv/CTcCZFY
	 Ksi5ajEsREQV/kjiiwqVcmXvVs3N4NdS6vipYi7QxlcHJK3pfTGdOqjSDVfdby2vmjQd3
	 aV5VnULNArauI4Py6GrAV8BMzHYJxbpfgVgXYr0nKREIrYNN5ziPxMWMVXqj/WaKD2Mez
	 p5kj1J0lD4YLcfLBrwNFHXYqU9rCC4pG3JebWOWW3T/Y78jCKBzngruEaDcRaCzyownf1
	 W2zdudUqqBsY2o2LC1tFjivdIkuA6kPh8tPQUGJRVpOPe9TJKx9HWq6sON/rtJEXmLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
	b=ZuVQjKhPtYMH/dQuFpEyZ8/DqqOZEw1w2WV3r5m//UCLAghbbYG54ZmDzulyi5y8xa97
	 DNnHHDj95o8XZeFEEIGU9YCTjQQjNMcNMu7p3vnEy8VK8FmB3UDhwUbpz9dM5K+ygLBjv
	 Pe6HTCSbqU7+zaKKgQOMmE+qAKcDzyXSDQAlwnKwuAEH38g7F6KjE4oMNCxe6GQlHnoKx
	 Nfq3TMLYUGKqsLagT3rqbfHaeKm8X8jVfmTLA8MgPS44s0tDdAWq4x6RQFpWowb1s5a2v
	 P+lTJtV3G4fwZI6R96eHL1HC2lgyI3YWqtZrW/OWYfVKKdMM/57VJd72fAIS/CAOCrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CB560A3821
	for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CB560A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IEWFjXdY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so1226355eec.0
        for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510656; x=1793115456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=IEWFjXdYPvHf1GX8A4uK2ABfWGSlVp/WQdtFWAFPb9xPpTeDY0wm5hQzqHNR0CGNyG
         gw52LIeiYhC9IHIn6FIdkvW2vBm4vC3ehHqZJblz1xfrlYYx/RYysnM2pQ/Y4+etxin0
         IzpXTkMh6gCy2nqoHlR5KxsNg1/pU5B6tIaMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510656; x=1793115456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=icTqhAy0oRfUiSGM7E0YPuUQ4E3VHsujkrRq/ckhcg4=;
        b=HYG4P/1s6WmOv1rDdoAPLUK81R9y6kl5uBknoNEkIXqOkqDaeB/Jmd8pAMdA/1K69w
         JiNNTDt4YMKxTNooj7GzZqCIeR+AG/S1pDU5BymlgwPDH88TM4Z6iVhsVBrN2kA5vB7v
         OVjuiGePTdT3W5wfXOfWKQyM16S8pAIrYCjnSETK3N29uA1rvgwnUoVjuA7T3IrWiWCW
         spH66sIfJeFyHHBkRJ/kgFTj+w6JzvNTesp5AXuPoibkhH0tiJPabRXJAhh4w/cJ7N1M
         UTv5oh+3H1WpfAEr4pBlTAnj2NLLiXi7urhfZXI8Kn9LDNxZCne8wUpH5qfOaycc0XMS
         Fypg==
X-Forwarded-Encrypted: i=1; AKwUvByTd+9VbTvJAIoVrTC8B6To6W4AhNeXFB+jD3KDIjdjE2tII6TFW1q4h/o5xnJRrPUz3buH0AmiW14R@vger.kernel.org
X-Gm-Message-State: AFq9FYIw6D3cHIjfHy/M0Mbl0z012seeSjterrWc6pdgssRyxrw6HAaA
	2B5OTl2JEdok7hW3mmDBpTptSQjrpysObzOPoFf3lX4Jq5htdsaLsCbhOHiavI4fIw==
X-Gm-Gg: AYBFou1I8HV24/ceUINTMDM4lWG8+91+TqTwRjLbqji+F0eA7WKAKKWwdjBPCPQ8qKw
	+4dXt6h1FBIqXRNhhlUNpWPNlWDT9dmnxw+kJlnqqY6QkSTEF+48fjI/BUHhI8QLEKwxvyNGA8M
	SAjzK7IPGX0dseYz990kGC9RNR98uLrR5L3V1BhIKxHUqN4q/uzZDHaLxVLP+f3fbvb/gaVzgX0
	5xMDMg4N022lPrGAp/l6Dw9BlN/EuySuOZ8geG8AFNi6QH2/2fSn8Fb3b/CYAh+R4bkU7Kgmzxt
	uw+oqzojwjgvjGKLefLdw5EFLavJ+7nzl4L6YOn+AK5+lp+CXwTfWhtHgYgNya8RWW6gpdH2fMG
	JXQ5gGcsfEaxXVlFX0J62AVzvIxQSGwoDho5muwQTQL4vBd1Xqxw2NMslh3fFXlxJT7N7Zjc6Bt
	JbpDSshJiORxoFNSK1ZhSPHq9h0WBdxSkxHNLN43Ay2sXyOqHFnYsXcUcmvIhfH4X1OdenMqgjw
	AP1ffFtCNpt+gg+TzXylEgpSUX9JOLKtWgGUSFH2/0QdPuu7FJkNghP0z8=
X-Received: by 2002:a05:7301:1408:b0:353:ba38:789d with SMTP id 5a478bee46e88-365f53e0019mr2964076eec.0.1792510655681;
        Tue, 20 Oct 2026 08:37:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:34 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
Date: Tue, 20 Oct 2026 08:35:21 -0700
Message-ID: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
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
Content-Transfer-Encoding: 8bit

Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
`CONFIG_DTC` is enabled so Kbuild rules can query and update properties
in compiled device tree / FIT blobs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/.gitignore | 2 ++
 scripts/dtc/Makefile   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/dtc/.gitignore b/scripts/dtc/.gitignore
index e0b5c1d2464a..24357adc8896 100644
--- a/scripts/dtc/.gitignore
+++ b/scripts/dtc/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /dtc
 /fdtoverlay
+/fdtget
+/fdtput
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index b47f4daa4515..6bce3542d8a9 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -2,7 +2,7 @@
 # scripts/dtc makefile
 
 # *** Also keep .gitignore in sync when changing ***
-hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtoverlay fdtget fdtput
 hostprogs-always-$(CHECK_DTBS)		+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
@@ -10,10 +10,12 @@ dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
 
 # The upstream project builds libfdt as a separate library.  We are choosing to
-# instead directly link the libfdt object files into fdtoverlay.
+# instead directly link the libfdt object files into the host tools.
 libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt		= $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
+fdtget-objs	:= $(libfdt) fdtget.o util.o
+fdtput-objs	:= $(libfdt) fdtput.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(src)/libfdt
-- 
2.56.0.212.g129ede20d9-goog

