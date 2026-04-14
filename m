Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639031AAB8
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 19:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196454; cv=none; b=l5tJJBw+K2kW7WFvYPnoiNUPMxxy36HCaKqgfwBl/30/3Y3/CH56odo/UIbK5QkmB2HMul8i/OfZyEuWGp4CUwlrAarTysR0/s3VahqS8UAdjqEQgXdu29SEsd+81Y5xo0cTprXivRBtbkAL5uKJF6iVtVdZHbw20j51FkSQwmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196454; c=relaxed/simple;
	bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UPn3rA0avKUKYgBZrHJ+ZUuWW2C/bB4hnVFVQVdbaqOBEZSGmY5BKgpEcnohBE1dIkTWlcKZkaJEJg/lh7WrSiWcMp9ozX8XBIRFMq1UG9VBF/yAF1ZSIQknbdwhlzMCdQpg4oqvCq+5RpzkLTt9/wS/a7hM7pkBVjKLsC+9p5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9Df6XDI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9Df6XDI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1861139f8f.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196451; x=1776801251; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=C9Df6XDI5t2LG70YlWVWHShcVMu6SwATtHT8taAgOJD4ExEPXpbQFfBBqLPeN1stev
         QjMft2raDecqiKATo6LvHdfxOu8H1ojrFgtng/kXR2hHoAvERHQ3zFSD/g5h+i2tJgIh
         JDFPwlm8sVbiCo9Wm+t1gDSQ3IWBdo3QSWy6J0syTvAZdFSpNPJ9RSKDTqDhHDmZUOjo
         aTegnwkNxU0pjQTAaFa4f6TWZ6It67syoOkfJ2byIkJR01OGhkGyceDSVyI66TT3LIxr
         LmhNXdPjd053aHZlfjBMLPxt1FMDBLIk5goFM/CjXUWBOXQzIEy7qE20SZSPh/NftrAk
         dpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196451; x=1776801251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=qC+Kw5bF+VW+QOnzYJyHbpi9js3JDzSbmm3YDvY0EjllTeO5IBP5WSHuO/t9+MoYhC
         W9uywS4lQEn37bIcF5C5bVz7vw5TbX9yedef2zXaHAZtiyKGNHMKk1vaPs7AEpoFSqTN
         npRKsIqTN4ow4fX7LzQJpY5pvZJNVMTsyN6Wx0VHG4XXuKvj2brYBaovPl3i2FtB0o1Y
         XuzpBsA4H6aU12Ml5+K8XcvJJDpLRj/fWzge2FecOvAWfxmAYaqvvXropSf3RPrrpW2B
         MtUZRQyweqtsGm962F62spzF1vgvtzCWmzcMHalSi2+9NMgQaJmRoAm67RNzOF5DAVym
         aVaA==
X-Forwarded-Encrypted: i=1; AFNElJ9vhHZ8W12bhJrRFGQguQ6ePYSq7rRODiS1OtE54Oapm0U29EFszuPGxxddiraJUJqssK95qG1FUtdX@vger.kernel.org
X-Gm-Message-State: AOJu0YxnZXmHl1r334JDxA+Or7t34S6x6/fW0kbnkdtsPrjkSASgXcKY
	W51hux2mGwLA36LeN7PsrnHi0lhbmIVHEvPhLFkKHdz90uzitM7W5YOG
X-Gm-Gg: AeBDiesWD3ei+ZonmRQxqL2m84RjmqNutRV7yM1Cb8PCOhsCrNfBQ8LeoIpmcks5y98
	l9POLMJaR/8PAOIDEmDFSafmKoLmkfjIot/+3xsERpyefCbV7yuIX0txHk2WCV+CLsgU22TTAi5
	SDsSo4mMkuTJbUlnGVYg/g9x7oSRt0vpxzsbg9Uvi0DDe00GdjL3ViRXQiv3/nWNn14ufZBmI+R
	J3Ya0AD3y3S/8Sn/KiQIjf1oa4s/I+XlAL5W7XIxregYlVfGnvEUn40OTFCxV758mFzfoaCDr5e
	1vPqclyFM/Hqm1Z0C/tT2PYs7gFf8Ae0/ROBWLwgAM2ouzXvT8XlBvaRM6nJVUPO4ThOP0dMD5V
	ctJwIxjutndkkw0D2uvSapdpDbHubcmGCGyMNw49XFnmxHfb+uPPtz2Rkluv9eyPblmW8mRFdew
	C2qmgs1vsosgzuGivDYcI16Y39urAai3+/HaKqE0390aAd7lwF3wL/RevirLIgVTcJUDomSphp+
	42S6bDKwcDqCupG/Wc3ZSo=
X-Received: by 2002:a05:6000:2013:b0:43d:6fb7:fee2 with SMTP id ffacd0b85a97d-43d6fb80156mr17543282f8f.45.1776196451390;
        Tue, 14 Apr 2026 12:54:11 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] PXA1908 clock controller resets
Date: Tue, 14 Apr 2026 21:51:49 +0200
Message-Id: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROZtkZ20oryI9sEZN2yA7KhLx7
 pYev8P/76AchBWqZIfAq6hMYwSlCfihGV+M0kWDNTY3jhzOW0OleaD/fjCw8oJUlD7rqcstOYj
 dHLiX7X7Wz7/1177ZL9cIjuMEIf1BIXUAAAA=
X-Change-ID: 20260414-pxa1908-clk-reset-179c3f1d6214
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU6UyrT506i1zu0tp6LJzs5Vp3U3qK48HCC4UO3JW
 fmXrmFbOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExkximG/+6O+04/zXz0402V
 Cn9GtUzGi22LHW9fjRNQlphn4PY24SQjw4qWc1VWy2auDbbLdX7Kqs3Dwmr5e73C9QPfdmRmfLk
 rxgMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

Hello,

This series adds the resets found on Marvell PXA1908's APBC and APBCP
clock controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add #reset-cells
      clk: mmp: pxa1908-apbc: Add reset cells
      clk: mmp: pxa1908-apbcp: Add reset cells
      arm64: dts: marvell: mmp: pxa1908: Add reset cells

 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 14 ++++++
 drivers/clk/mmp/clk-pxa1908-apbc.c                 | 58 ++++++++++++++++------
 drivers/clk/mmp/clk-pxa1908-apbcp.c                | 31 ++++++++++--
 4 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260414-pxa1908-clk-reset-179c3f1d6214

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>

