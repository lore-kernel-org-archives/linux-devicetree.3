Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794117268;
	b=3lltBX+Un8Mn811iMW9VAUW1TzcC6Lt+2O3xL7eJXKwUTiHqk1LHb08B5BufMvMer5cp
	 Z3DuoLXy8sCwKwmQaSG+IzTyw+mlTHeONVyD1UW+BRsIdtQkwumu1/Xs2lLgB3j29jzsN
	 IqtgRJJ1oqXiQEP3w4G5cbfBiTyqAlWJICq/np/4i5Q16UC+kNoEDP9Y8DSv+VmCe18Ux
	 X/HTSRN9dcSsJqa6KaTSDezm6AU3fbNvNARzoIzPFe0BUtT0AopCL3aYTsLeEIt1HiNjA
	 uxNqBNjR7R7D+WVy39h3cEzkkoRg/kOF7YPfTfX1L2cYvoUnXLi1BG9ZmXOLgsM8U0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794117268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
	b=4mQRd/ZTmK540Up67jPsg2kvEBs2k90YBGA9QdRPimeXYeK/zpZafc8HDfyjjHK3z+4a
	 hMeCROof+lNmC0hM4NcICfknFDD69SKOnUn2kRlhCKTtIelXUH8aYYicAAbuZbGJ5RiTV
	 LnVULq46yHfUFa8dGHp+dG9g6/zOSPMAy+5bNFx63/2TsYLYxOZweWceozBvOs4UYWcHZ
	 73QEm4tS2DLUAtU7Im9w2qOecorn5YvjoQReq43KDriHCNU6S4k9mre5mJ94eJQg3sHHg
	 71IlbyzAS98I/csYqLcjVkmK/mPuxreO+7E3vQpjcsiB+qBm/bdEA7E6bGnqHtrQiEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25D606A31E
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D25D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=boTBU262
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso186939f8f.2
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 21:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794117267; x=1794722067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=boTBU262RK2YOd1OLyUG9d3v/UvvA/mj/XbBNpA3gniG/44sfnl1Y9wzA+TD1KPKLT
         qWsFj22BNFuIzSq8hENGltILEIWlyeGRem5pZoivV7hO3Pgk386f3yVkAyfl9prUI/qg
         6gAE4nad5RLyYQeGWWacm4wToKmSlnYS4px/zyMKuDiJWgA6VJieywpNAOIjxh7Hz96v
         /YY1yrPJt2U0vNin1sQBBceCWIvH+qbLoCsMXUmVOmKuzVC94LT6BqLjb3zOOtG/z77F
         RomGuVgqNNYdqB2ICoAP2vLSk4hY7Nr7pdHiFMEIJBtRQjF3dkpGZkLFLCg83ElrCMnL
         IhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794117267; x=1794722067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZK9lVcxiGeYvbrytWguEJMUSVjQJoofRhVDH2bUKRs4=;
        b=GEpT9oSuGMfK2Gti1BlPPfg8DBmEZAGVfgx/mgZQX9lQa78PTUA/FO2Thsb59F7qhW
         frZPH736I3VCWcXcPjO2noAOOYs2GidBsOeJHmYaHPNXFEKWrqqmt2eyKUso0V0mLZpf
         BjfWoIeRXfRV2T8ejUHI+h3XCSvC+O5eDqWK8Sjr8VsQ7pftSmhZKNZcjSK2+Hdgqqx8
         ClGWWNtGRq9lans2pbQ2R9OGabRJipQXRSS/L8ArTKbilVuPkuhK6mt1YHfPIe2uCk1k
         vYYC77SaU6iTNkTLtzsjJc7qemJsndIpMVs0iyza+nXZ172DN72Iu/T95NpsSoWleOFe
         8aAg==
X-Forwarded-Encrypted: i=1; AL+hErExBZu6gvI08ntdzN5X/REA5te6lUwsVYn143fUYs8Khm3LNsuYmQX6W46mMW5cDm+YwRZJdCij2aUM@vger.kernel.org
X-Gm-Message-State: APuU4Z/mFqsEajDeN4T9RKH14tVfMIa/S/8vVDwo0It5Fp0NhoxKGVyw
	toVv7YXTxZyFx/cNGMjgV5DR/l6NMPosLJx0UWCZCkRRs8PHWpUf+/aV
X-Gm-Gg: AYBFou38i3CkGfh01i2VzZ1Rc7HcGnnVlWpID+4Ptp04u6YjxWk65DIgu7ZLfGsYs49
	39Z9KWDxeIbIZOHtTgU/Z0fRqqOxw/+0llOjz2Izsp76HXXjLKezuMMQwYHoG10GoYh1BeTPgKR
	hyaZO4g7VgcWUYKeQ+M9UpeKUJJP/N5uwHwDFFqaJMLYlF3UR+D1S/QutljHNc+836ogzHA2EGy
	chdlagKwjWijwdmfcDAydzLAjExk3LGqt1foKlmpdRSJCMbRBFIjVwrqpRpfKhz2wQkr2KYHCdx
	UR4grw2fCuBTdGBMdcm4eS2BcyuN32xJqqy2KCjAiBmon+8oiGcGkF7o1Qx3PeWzqOJn5JchAgN
	WTEQFBE8sObNZT/A+YloDAfUybaFGZLWQFsdWKjaKwmzqMVMfjIuPV6aZBqyvE+rSYohvg3uMuH
	Glnmo0y/FpAiM/Oxe/kxprO8nZJGOCzqYkCbZp6BYSJ3dVCu43kW3mCpTayW+nss25q3NBM2lsS
	aQw7PeSUmKaMMaMNm4xRVDdnRwha+XCp0kmKTpf5ngkh2iG1uvt9OzsTjg8I/OQpJAIMJ9XIujR
	Zn6weR6p/eUydBT8QkuFyHMWZlWmWQ2iZLZ6Jr14
X-Received: by 2002:a05:6000:25c4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-4958d3fa337mr1211047f8f.56.1794117266571;
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm2113363f8f.47.2026.11.07.21.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:54:26 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] soc: qcom: Add the SXR2250P SoC ID
Date: Sun, 08 Nov 2026 05:54:03 +0000
Message-Id: <20261108-sxr2250p-socinfo-v1-0-06244862f5c6@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHsO8GoC/yXMTQ5AMBBA4avIrDVp6yfiKmJRNRiLVjpIE3F3x
 fJbvHcBYyBkaLMLAp7E5F2CyjOwi3EzChqTQUtdKyUbwTFoXclNsLfkJi9MkpWmKUpVQ8q2gBP
 Fb9n1v/kYVrT7+4H7fgBvva7ndAAAAA==
X-Change-ID: 20261108-sxr2250p-socinfo-a250c0a83416
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794117264; l=687;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=qGwquROsopcDhM+Z4ThxOjcRoNWve/5H+Br9FxG/OS4=;
 b=T1HexMag4r8AxnhjXYeWFmzK9ht034Qz92V/qKDI11bVg1yO1o2yrrrMK/F8XAQrq9fGEyfLX
 3VaReaJcjwXA7VKOdM05c2yaseMFK8VETIa9tiPtBP9L5mkPMHF0y8Q
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID of the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2), used
in the Samsung Galaxy XR headset.

The patches were written with the help of an AI coding assistant
(Claude Code). I reviewed them and tested them on the Galaxy XR.

---
Stanislav Aleksandrov (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
      soc: qcom: socinfo: Add SXR2250P SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-sxr2250p-socinfo-a250c0a83416

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

