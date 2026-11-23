Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425827;
	b=akxP8X4JzEZpZriMrIKPPJ9UF5bnhOp90aahCGI47EOqNw5bpksDO+SOnQScSOdrgo3Z
	 pUislUcFWHV9/s1A71N1eCkBajxDCkYSoOHjOk7fFCVhp/8P7Q+hg6hJqLRAGyhi7VkTW
	 ko6+kaEyw76kyzb0HVxRRB8xNhRxAaD5wwRqXX4yGPMwehvaCGc/GmqWeqp1xUkBPsdKn
	 ajHJ/iPi1xHEkheqZgUdKwkBJ69g8ZqtMXafozc/X8iOEO1Ev9oiOmmVuRthdVm8yMUDx
	 BT8eV01QIv4I675kzbZNBgkwNOVwQjAhMQd6/DcxfyeDjx/oJHP9nyUHXmCv9dwrPHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
	b=K7ikcJpqoduci84zi0yS6wgsJdlGIXYzIrunEzFKV8/sQWEnRKdhJ/nhBC0oPaRqx7Ef
	 afyDt23z+n7HjFXX/k7KA7A9Ul7B7kzPjXLtTD1ifOvj8mr7/GA7fxFDV6DQo54KoU75L
	 lRsEXSiDwJRa/BsbSlpN9/ikrr+kG1ANG1u8rcOT8o7huEsCLrsYevfkLCWizyfdCyrs/
	 6NCw3GRkfABBkgGDGHK9RX2gilC3wKHxu9fRRCa+3aIDNZCcbkl7FfA/to+RhhF1y1Qgf
	 liRnUKCIqMsjuitSqdCOsV/7zlZZ0fzWpMFpZ51GXx39ziQgLf/awHxKmZkfhxrIPeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2AD606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2AD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so24746335e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425825; x=1796030625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=vT3U33Gm26/ZBgMRRlulxFYfcmGhlmydeqlDpIYjryTLrt+9HHB5QzPpvbD1JGiCKA
         G3t7XUa+ZBfUsfjF+OGv7+OZSpuia+iqVVIEpK4rk44oA2JeubiWqm7/XlnkGzH9qF7K
         Ib/6d95d/k2swjHCQnuJ0Ss1R9Wl2uGAqJ0mn2A3mVlWrT1XNk4EUDcRKEpbjPomOpCk
         03fZ/EdBRbTduuTsgO0g3lk47+jPVtLcFj8g1fv86fKaHHmOw5D7lvWrypXoyxbVTW+u
         3ZgSB0n7cmcclWhWJ+hR8Pc6IQFzJdhRw3czAOogo8CtbKEoJVoa0yzjbVZbgd0MYB0X
         0q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425825; x=1796030625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=uJD8YJrH+LaAxVUgARnPtH2N6KE1rOGf4QPWkIxQnl4fd1r4um4RkEIlop9dMQuvYw
         Aer/DjQLB0OeRIbi+FVSsFupzZ46L7ylBGAwr7KsTQYBW1Bb1ivpBLDbvkwTY3KjW9l4
         gin1H+b7wWF4FyIG4MLU7fT472ZClXWrJIjnI29JR70lhPTqLTK6YrAHpHb6ogj/SDMe
         pTP/7eOMcI1lVsvS6fQSzCf1NJyWljz+kTevIbXNSWoIbuFPtCEh7adAelASnAXxqcMJ
         u3HOeCGWCVq8QxE8MSPkRVDCPS3S4Wx1vPVmJc5zQ0OkZktdOtSrivuQcDXNPFB+SvKK
         +Nvw==
X-Forwarded-Encrypted: i=1; AL+hErEJe9zVateFANGjHyYGi9R6Iq187rXhigKSggVQb0xmnsg9XtwvyqIFcbo08VQG9UPhPyb214THsn18@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ec0xSKYKzkUoD1OXHIxYiCkwAULcCthjOzB/rHRn3sTuKj5sm
	Bb+OQc+yQ/00cNy7AhZk8Dd1m2AOpc1S7ZxhRJIDacSCz5mEx8XJp6gzsW9LtgUIPCfIRw==
X-Gm-Gg: AZFdTZeTFlpjqmB10NRTWXlAXllXApbdC1VYMIqOQDeZmslUoOgdLJEQPDzmAK5O9UQ
	nPoaKXCl1rJLU5xIoeRQdTzVtdnAR+PNENuPCWWeqS+muOnGdqoFD9FWOfU+h3lF1ZHGivRwy/c
	q5q0lbUy/NCP8AVUNT/qMXGZm28RzPA8gMlaP5/G3SIddrquGXen2NCTrtwC1b1dU0QgVskvZza
	SrZ2zisl5JAOF8qILB1fFVxxeWCuNGbZnj2jSt8USVeAVUCtdARzGG40I+RqGrqY70vwhPDOSpg
	pWA2UZQU/Bs7TOuAGXlrJV0wH0IiBQQoO9+IPA/kyCEr1V4hFQO5yH4owTbIK3mtouKUCTOc+XR
	YEleiAtKQ223Oh0FKlSfyT4y/BNwAKemL16eOgWQ8g0DSplceB4ZqPLbSvXwlQqfV6DLMQZUnRG
	MXcYMXbytwu9uwUQGASMghjUGj/5cxTlrkbx9O700IC5815Otmp4vu1mhP1SnanDO/O/u9bGkq3
	a5Pj/V9/k7qGsurGN3EsxEF3+DPRvJyX6MvrEfU62X3bqhITUPRTDuYJS1jAhDrh2f7nnkXaNa+
	J+2SXkeyGpa1m1Lyk6850+J81Zd9GKwZ1lIboIzsZci/tp2U0j6ofCbFRN4ImU7xd3I141yuqgt
	BLBhEaApcjqNvArReCC0uXcRrIDB6Z0J7y00=
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr276942035e9.15.1795425825278;
        Mon, 23 Nov 2026 01:23:45 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:44 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add USB support to Exynos7885
Date: Mon, 23 Nov 2026 10:22:37 +0100
Message-ID: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

This is a v2 of a previous set [1], which was split into a clk patchset
I did submit back in 2024 and eventually it got applied, and this set,
which I never ended up submitting until now.

This version fixes some things noted by Krzysztof Kozlowski, and also
contains a change made by Umer Uddin, as he recently tried to resubmit
my old patches from github [2], fixing some things up, but missing the
previous remarks.

[1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 90 insertions(+)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

