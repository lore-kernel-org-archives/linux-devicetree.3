Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23183C10A0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227397; cv=none; b=AdVUAL8W7BfjG+44lYRmnKtaPBka93OSCE77We06eMSGbAp8Vq2ZvGlMQB8m0b2Oo8NJwTDVg+ArjETAy2vyX0EC7vav1x7bDJwJPvFTvxwdISYx0HhxlBtSmpEmJ+4gj20uOdC28IHGyQ+98k1yUcbhFhUtXvXbcOj62FqcBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227397; c=relaxed/simple;
	bh=SOgJiB/MuJVZyQtUcsGPQALMHCsqFHirouiFc3+0UGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLLF7JQI25ryrkXhPwX8wo5Csk3zPFF9CekV1aNpJ7A9l1CR2lbc9NXp9TAiCkxCswbZz+B8ZLjn4VXunsUthTLJdWFwZhgyg7rc8rpxTLdVL61TqHamqWpQtpo3ynB5JLQWkq938AbeVVx7vBVX2Nh5Xf+ht72BD6MxJ1GHQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcgTAJZY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcgTAJZY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3234182f8f.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227394; x=1784832194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRNRaSB4h1IZiSHti3Ff+SGGOCQ4KEN0BoYKYtSAbjk=;
        b=AcgTAJZYp9eQHgGEQ07ZUw88lEjIUmaZpVD7WK+C+y2vVYZsFsiwUJdzpKxHRQY8OO
         ExsVbvk3ieqVCmi+mKWXanxIl/iAn4JePtS3EXbKBxIQu4BBfWl8pVqdaNXQla55AcbE
         9RYACdDbsEJ/LumL2FYbLL4Qgu4Dx9Wyw5vmdsPfaFVS3iS96OJWTO3V6UP46iz/qT3t
         P4UBU3YHN1wsdiR/18P5Jcl5dosv02XRT7kDEUBBPl+ouQwEdLrxlSqP+XndQJDKxbxU
         aK0HbbTHz7M6WUg+d2ZdQXrnUfhwJLx+D+A7zIiUXurDikIRmTBOTfqfj0XFuot4WvpF
         712A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227394; x=1784832194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRNRaSB4h1IZiSHti3Ff+SGGOCQ4KEN0BoYKYtSAbjk=;
        b=Q1QIOzTa+CEOav3Pe7SjlajVHippP3MTXeVnrEcRPM03p3hhUBUN8DBfvdCjkyjug3
         +Glq3pthccqm9Mv/CVPKjc8FjSgkmYoDpffV5q3OIdOg2ukcFu1vrTGWVpjHgFurhNSf
         qLfZU59tCVAyPCpc+D2uB71QLEFUfYY7tx5g4e84X4szRBa96p2frXXJJzp7QH/qdCLc
         mLh7N6StWBxTYryqdlPHxDAWe8YKhv555psDctR7twuMFyd49YU3AC2folGWVCVFNEVo
         wD4Du+FAtOkL3ltJVKiqgUkc46owvPyrn6TpEdMy78U/pxKePE8h6k311iPZnmPHdVVo
         xqHA==
X-Forwarded-Encrypted: i=1; AHgh+RoQuIsLFyH18Bvr1TMWbhhebRQTyBQejnBAEF/lfUJG2OVrSvE2KKz3OrlalMTnl7TMlEZs80k3eEy3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb1KWMU8v5/vxulMWJstmtWelhc4cCITo0r9IS698EWnHfBZmg
	OQ2vJ9IaMotjnYjiKCCvmCMYqiyojk8KILXRpT4hpC2xgAnA6zEYdMIn
X-Gm-Gg: AfdE7cnazOW7ZI/el4mq9JD4xEwOCXP3lwEazOkNHf+QF44Wf8X9Z6wJ+LDLvo/67fl
	Gm29oPQvbKAGlpMOU+y4wvIR7CG2pmz0sTRp2rb8YvVEukN38aJdijiNd/s2w/Uo/1mPV5LClPC
	Rd/58nQ89JyM9kpLv0zJLAehDinhyJSPCTt8fiEyF8vsPztDGbOW1wTq8dHn1m8VQh7YslF1q58
	mnVst9lxqCPOP6HUPWAmeIpmAduZ0nqWP5P6GwUw9ejvLMM63CBesE4i9mE4t/z8GvmClf7sGAj
	P6C2h0Rp2W53V0/nh9+q9adI3hgokcL8cFlaD5HzwEjY/f+Ch+0O/9tMQAqj1ORV8yEGhEtA8nL
	yk3HPweX/nTZm3Jv6njZcW+uDdz/bQqFG13wWljRsQIUlstRjFVTVxietCA3TUa1xnq46qg==
X-Received: by 2002:a05:600c:1f88:b0:495:50c:259c with SMTP id 5b1f17b1804b1-495483924b6mr7338445e9.7.1784227393689;
        Thu, 16 Jul 2026 11:43:13 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:13 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree overlays
Date: Thu, 16 Jul 2026 19:42:59 +0100
Message-ID: <20260716184300.85413-5-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Verdin AM62P,
bringing it in line with the overlay support already present for the
Verdin AM62.

The first patch enables Bridge Tied Load (BTL) mode on the Nuvoton
NAU8822 audio codec present on the Verdin Development Board, combining
the two loudspeaker outputs for higher output power.

The second patch adds OV5640 CSI camera support on Verdin CSI_1 in two
variants: the current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator
and the legacy CSI Camera Module 5MP OV5640 with a 24 MHz oscillator.

The third patch makes the MCU_UART0 (Verdin UART_4) reservation overlay
common to Verdin AM62 and Verdin AM62P. The shared overlay reserves the
UART for use by the MCU co-processor firmware as its debug UART.

Changes in v2:
 - Reworked the UART_4 MCU reservation overlay as a common AM62x Verdin
   overlay, moved it later in the series, and dropped Reviewed-by due to
   the patch rework.
 - Link to v1: https://lore.kernel.org/linux-devicetree/20260602141311.1366818-5-ivitro@gmail.com/

Vitor Soares (3):
  arm64: dts: ti: k3-am62p-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
  arm64: dts: ti: k3-am62x-verdin: Share UART_4 MCU reservation overlay

 arch/arm64/boot/dts/ti/Makefile               | 21 +++++-
 .../ti/k3-am62p5-verdin-dev-nau8822-btl.dtso  | 14 ++++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 ...cu.dtso => k3-am62x-verdin-uart4-mcu.dtso} |  2 +-
 6 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
 rename arch/arm64/boot/dts/ti/{k3-am625-verdin-uart4-mcu.dtso => k3-am62x-verdin-uart4-mcu.dtso} (69%)

-- 
2.54.0

