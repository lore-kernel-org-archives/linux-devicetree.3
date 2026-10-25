Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938272;
	b=mxzFTFRqshitk+Hbn9NiksEwRcPBKZI6DxhZbGjdmeKJEx2kN4w8wqlU2LUkHw0Mgw6x
	 CpQCjEO9NYBXBqH6F9cDG4RAR8wHox4xZmsYGu6mDOUflV1yKMH1aftn6EjMIv/QWsalX
	 Ja/dV1JQVFOR4VCmDiq2Z3SHvh+EXHJ67h3P30mdwnttlzMhDFzrs11ynV+c5EfPaRoty
	 1KEhcE6d26Y/cCnCOGgCFuEmCRUkFdWNfYR2O+jk8grBELUgKhRXQ+7llaSYKvSybanM0
	 ir47NgGAcuJVllvVsb5DwJtdlY5k7QykYuAuykbjDGRjzamHlxpCKhxY1IPTzbOpF8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=GZtyz93gWM5vH7SPUeBwBouZHBcosPOoKKzu7DGcGljpYS1kFUYG4A64gsh3IeYl+CEc
	 pijD5aDxcRYtdz/WqXAOHzDOjcF2P9HEl9yIxVS+IlqueyU6RuMJ9JnLRzwg/AZ/aSceh
	 kZrUvV/IcJdexsT14bQL63DUDb/oawRX4k0Q0hdtdn2Ylar2N5TlC1k9sWN/60/zLWOtJ
	 dfssaacfJ+aNQdWLOG++ouTQbfuAcpfE11FNhutfilHf8rKCEZf396JeGWIDxGuD3FnGt
	 qp5hkAQSaHFrJDCODN7/YxXf3a9dcruTD9mXqaTkNwxwVW+hW97rFIRGLVPGC4T1PuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o4r4tRfV;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DB606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4DB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o4r4tRfV
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2554405e9.0
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938270; x=1793543070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=o4r4tRfVohudZzXlJx9Uvq48Xmd7onLgDhbvSQslDAVQM99ndkTsx96MESG5NmzWh1
         WGucTM0P1nsuq6Afsr3a57aQQsILdFa7EZX2mmsZ/eSLI1zCj6AMV7/7LGYtc53Aqimx
         3kOR3k/VT6g0QyTXpiB9BupKNkvuNEh+2oniESNC5FEZDqTTO7xINc3gbArHs7x3P6b4
         dY3UawtmBR6TcbyXnJ9adfNaNh+xcBqIVAb2Q86VZfNqEPzY5QKHGBOGEg2L4JgjjNC3
         pCXZNst9h+7wnwvj97vxOIDWDmMolmK87GXyUG7pKFundQrraRApeZ4tpqLuhAO95h4v
         mdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938270; x=1793543070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=YMDkrbwjK2BzrzDRiTusZUvuHhARBoets/AMblMSRsz18HhI5nEcUYHYfhGTAF2s1e
         oX+dePDQydu1PStNzvLA8S1AYGhpPjiqOMhngTvtqUWokLRfMya/vBddlSE54wlEeVrr
         capW9r3a54+Kp1GjCKUSODxmkVUXHY7kcQVy2QIQfQgp6G5J0EafaPKBbEboYdHMVTKT
         NoMUxWpZxmtdYFU/DI3jPcpqJCS8zGYXdqsxZsxbZ/i4Okpq15vPpIwudLaHoMcmlCUg
         sV6WwXiNtCir/E27RJUXrNcr0H04BGPLVY/mcPZWHE71neeYbwec3O+JaI3+v7hvOYZx
         /YYg==
X-Forwarded-Encrypted: i=1; AKwUvBy1ZGRJOU5yd9pOz1+KvInXN7cFU5IkRto8WIbEDvfiyhnTx3IAmJBSUm0Fz1gMPb8eHVhrqhAmdcNr@vger.kernel.org
X-Gm-Message-State: AFq9FYICiqY0S/Pw4zavRCL91S2fb9FBDwAhMhwccwLpb28JPwJoHokr
	eKrQ4QrKZiZ1uTtq0HCvTG4UAdDdvEpNbX7Zkf+x3awYeuh41JpiecuY
X-Gm-Gg: AYBFou28W9IH63tSBmUVxvNeQZ1dTOovlmdDzXXUxLf5tJ3pOoeGBgg1gaW0R0KiIb1
	VxK3Spl6Gg48eSZYyTauKgHNWv5SRTv3W7+RmM0HPKfAUngPfmT4eYe/mwHn8yci7xjYRG/khl4
	KyWvMiDJj4kFLwooGPQzC0xI6wq1PknnmRcRW6kwWVbpjkPox+eCtYrSv6dvdmQxnNJwzE18Et1
	Z2oAHINZFn+XwpUkHEqR6csStJ4tqTB4stS3WdYs+Q5gLOQDHDAmpLufzh5AA8fbJrFaYXjpuob
	v1JUYnd1nBOet2qnHP8mFP0oVwHZyFGiG7vEhGwmMKFL7KTNPT6Doa2roVWoZs+M+cDoaIoxpEj
	Ew7zFy0K306Y24mjJo49SlLyBhcmzq8grisI6LNUz8QZixWE6cZsoi1hjHiRqWjJP+BjQmfdVk3
	tPd7tJgC93IRQuc3plWnQ6a7FtfozlYl+1/+fG4wwbicbLCU9iD5R0LHMUQjdtQmhSq+JAQv1nH
	bUUqE2yhbmOc5woI+MLR/1yHnJTB24drdXSOVABU1coQp2Y2Jpqt3USHXTYDqHe9a9ibBRwO5to
	4T8RAFm06or5bQ==
X-Received: by 2002:a05:600c:3491:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4a35acbd31amr73775825e9.26.1792938270408;
        Sun, 25 Oct 2026 07:24:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 14:24:12 +0000
Message-ID: <20261025142412.112216-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
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

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0

