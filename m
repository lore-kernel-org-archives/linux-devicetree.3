Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A123F0746
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102294; cv=none; b=aiGsSL9LKQZ0j0eTOg3KvKhGUwYKjbsH0IifkHCAkKMp9e1ASJWUq51TQZYejdLxEqq3n3hnwPpGEKps7aZqKlAfAJpWQvR0SZdcOPLMpBI3acYcVOQpbqXRkLzyXUlSSIiXQcTC94p52YomIdKBlb7maxMHGq0iU7BzHZ/lCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102294; c=relaxed/simple;
	bh=oWvBs2wkcpHlHYRrOrYAiwcizfdpBD/s5wvMKKA0icY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jX2ByGIZQiSgMcodzOjf4DjTXWsWpHyR9UcOclyz0hDnGl7pLLh0w3Bs/DtMi6rlUaz9zFao0Xb/SY8CrV7/RmawTYZIBJCaIzVtWwdoexmPNlE9TCW2nGBfOFA5RtGv7dbMXdReXkVV/LZNp0LM26liELVjdlfG5E0qtq2V+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPW03DP9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPW03DP9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36936dcf19dso909733a91.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102288; x=1779707088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmV8cNju4kJCUjfwDPvczUtAcDn6QQSu776YFYpkcdk=;
        b=hPW03DP9eaR3p/KIgdY5ITl7wsdzjo/HVg0xi5cQ7ITu+mj9P0Q+crIPlXNY5HV6CT
         0CKYyxhox2Xc7FpkzzK9wPWXQT65g6120IW7Inut47zU0Q4SjjQC+EfgRGULoa5LoGfj
         MZYfcjNoslMyFmEg5G3Esw+ED4x6ZYD2TAbrvTA5l7g5kKNtN5zI507iRnT7f82R9yNn
         eVCYEFIBWNheZGp5CL0ixWHCzSPIQNAtR90E71PSrNQNbMtyCdApZIlBMHzHlDgtWwKM
         w56bLx7Ei16Ep5it4wuJBSBDQeROf34/rHtLrQ47VSkdbNT/APXBVxvCJ/bf+jy0o2gW
         taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102288; x=1779707088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmV8cNju4kJCUjfwDPvczUtAcDn6QQSu776YFYpkcdk=;
        b=sPbdw1zJpF0grU2eta+W+zU3ex6dzza26DrexhiVJKfBInSQMNtM2s7Lz86fO9sIV5
         jckU6d6/EyGLU7+Gway9sQcUy8UycQVffjwVH1+T3ZfqYzIEH8N0SHIkpdVWNeIth0tU
         jlRZmQr3urinc+OmASkmOqQOwFigf0JlLjoLl8fZhLnVhL/9V4j+BT7BclVN+6C+1eVb
         O6bwINg6d9GGG8CwCb92bMMIbvWQKiYgdqv8BBYFYyn8dAO+f5ud2GaoVMY2Yibgw8TI
         yluGWGnHy3QHZvwaXq9cTx63uQivTz5NtkJ7FHR6pyXgR05rtiLMIdfxeaJY6x1Q5KIZ
         /XXg==
X-Forwarded-Encrypted: i=1; AFNElJ9ixkO/69rbVJ9Ta3TdRWe/6IBdLBxXFXYxQ0P/yL88nDSEAUgxpgIl6oRqTTGccroinuLCyaxrYepY@vger.kernel.org
X-Gm-Message-State: AOJu0YzwHxjbPuKnEiSEs8PkDgI/Im3F1cKujwcPRd4aPLI9sgacfoRN
	+f96YEVoXzTJrlcKHeW2D91h3lzVWbP360rzi/FeFV9sh6nVotAmBkjRhMT+AQ==
X-Gm-Gg: Acq92OEtLz9+GvauzCTBx1ALzFCsBcZsQsJBYEYj4gmpaxkDgGmWzn9hyUfGnHExNao
	hWfEUSm8HGlrboPICNHDyS23g9pQv3ZEUusJeRDK43rDxXPhN3Rbf9XVOpyEu1Ej0FTKGNEHP4B
	8zF8CaowtVSkUYSTYAzz51X8x1qdaR7WzSa7yrc4oP7lOD/eejQAfRYLCORnTVrHGF3Ac+Whmto
	jVmgNnyTN+BlyiNm3CTpk/juJ6yGHWCrwIKVxPWIPz8UIYXNa8eiJnWGvxhoqD8ZUg3eifG91vm
	tlnmTnROvOC0APZ9xioz3bLUp5rLTL59aBJhwuejx8RcbfSJ7rlRkrLj30KhgNdaQlOGcycadJC
	5sGNIX5Wl4dQjXsG9Vn89ZPEN6gKtPqCCpPwuL56lw6Y7UqQ2zy2qcoL9utTWMgq1ZdfiF+Nkhd
	sfOc9goDgSawFTXgpmLLWxRTP/+2SeKHy/tQY9r7+eUkneWLNAAGMta77Rym2sfFB0mMIi
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr13448011a91.8.1779102287750;
        Mon, 18 May 2026 04:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:04:47 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 16:34:32 +0530
Message-ID: <20260518110435.16262-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1093 +++++++++++++++++
 4 files changed, 1097 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)

