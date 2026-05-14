Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF63ADB97
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753589; cv=none; b=Xgf+aaYXW8FnlX3jfYJP0elQksIHR5rb+xEuMXNBJxjVlS30pxtfmOnJR/DF2X8qh8q8f5XTuEYtHgTwrz5bqNTen8c3apgIyu8IufQ5hp4XaUZUtd7Bc8faiGneZIHHSi+HagLk7WId6bb+zu8OLbLMnUeBDoaRzqJVlz2pvwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753589; c=relaxed/simple;
	bh=mZGgOAkeI/oi6MjjVTs+pC6rx+CapH4wCOuW2v17W08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwBrDOEnXfnK/QVPbPZ3zEiXFIDHmGcuRO/Rku2vgJAgaAeC6rSbRjMIW1i9cbd03xFG9L1SccKQt6qITt5sV8ejMFlQl0YMdhUhfBtGCmm2Q/3V85c6RmIKox3dBHVLuFl9hqyCYmZk5THxHTjE9t7dTIm+q+DeDUp+4hPc380=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J41cH+gW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J41cH+gW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c80167f56cdso3263197a12.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753588; x=1779358388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=J41cH+gWer4Zk+mBHOfH1C0B5INaVG5pZPyVMIokF6hKbSznwleNcJqoGZoSPh4xbg
         xjs4Yod5oHwh5nCHsvmbNMK7z+PqlQOGF4/JRc7A4Ow3Bo5FU4mLc+8GwRw2Zgf/WxSS
         5lDCLlHAKsUMZfr3LaJ4iZgqAuIr9It/W33RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753588; x=1779358388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KvyM/JTQn7pVukPBdXTyBSsJUb+2exZa4gm3aMyZcTc=;
        b=s/5G15aSX1OZSAHlXoSyt9znQw99MCnLLUiD2eFw6SCimS2Ms7lpAOoLQjkqkwaSir
         3rLUPbK5xnP9N3BBNsp7JRshJedLF0zOfHlRMDAnynV57SNOMO6c1ydneGXauIpDLCJj
         EQoF0XRwm1OHzbMeIL4CmGwJpA5K082HVhnxgnQmZIvqtpBXmmSRtj6XCQpG3f6MuVqs
         SKbupbxb5gnfnTci1Fkedl34x95n+HUpdgmcV6YPU2QSQz63t2ibDaDJhrTAGxk2dx8J
         M+2Wwo9vuhO2bQk78kkJ1TmAVdlsmJa561ppm9vBI+XhTSQ2BNp32/ekNoAzaqyvsQzt
         Gntg==
X-Forwarded-Encrypted: i=1; AFNElJ9D3Hvubjnmv/EM3qIOk//c4Oqb3W9dE+eg+y5c+mtceOGKMrp03xoq9Y9sVeEXGkG0MyiJyeq696t9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7S0Pb6I8t51Ryg/h7Sk6fOJdJWyS32U8j5ak++PupUXx12Rm
	kt2SZh2nbyvIXW1R/LDQ6CDnvW4rs/igxa14YliPeSLM1F1VthgKD1qoWal0pPsaSg==
X-Gm-Gg: Acq92OEBOQxjrZJ2kits7d+wRjvZ5rtkzWW0T55BZ1/fgz7uVBsK6kni7AUMy7CsVNm
	5nE/+CTRoue3EIcxb9Dn4eflZqa9rU73ahQjWbpOScsA4aRERQ3V27hwYsV9T+26ZliYjB79ck7
	DRMTurSiTsaZb04Mxjzqp9JU5FmTbQVda3NThRMnELuzH/tkQ22ugsW6sI354fvMdEzzPqkgNEl
	Sdk5Qt684K6kSJjkHC/7AKVeQMWnVxy0SVMjZnEMlCvrbJMByNJuTxuzMJRWZrzNOo9DEbMGDIv
	/uu/00IuBnDxHYCJmA2MNtYTIg26c3aySgPbzk3DmBK4feQ9SeWrdsSzeEfBjLeQDKlo/GYvsAs
	4/bOlnlbFKyj+Hdf62yA/0yINWY2svMu32D7si3i3/PqXWAnBBgj3cPpMkIPR9XChi0Y9fPtv7d
	1R0EI1aQHqNo8+RITCDzrezaHjnhxQlZyioD1gGLSGTW8bVEqWWX2zkVGB4QaCUueGX0NsLr+M1
	EDBM+XA
X-Received: by 2002:a05:6a20:7f8f:b0:398:a659:eb0 with SMTP id adf61e73a8af0-3afb1112a37mr8021299637.34.1778753587701;
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
Date: Thu, 14 May 2026 18:12:50 +0800
Message-ID: <20260514101254.2749300-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO lines 59 and 61 are named BT_KILL_1V8_L and WIFI_KILL_1V8_L in the
hardware design. Add them to the gpio-line-names property to make the
names available to users and developers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 3c8b4c2f6f23..b7387075cb87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -727,9 +727,9 @@ &pio {
 			  "SD_DATA1",
 			  "",
 			  "",
+			  "BT_KILL_1V8_L",
 			  "",
-			  "",
-			  "",
+			  "WIFI_KILL_1V8_L",
 			  "",
 			  "PCIE_WAKE_ODL",
 			  "PCIE_RST_L",
-- 
2.54.0.563.g4f69b47b94-goog

