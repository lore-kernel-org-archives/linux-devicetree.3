Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474902;
	b=sfgyPS+oFdVHJATReBnd0WoRArH23/SvSL6LXuemYgrKmizKcRn6FYgoqgLg364qZOhk
	 i58W2gNc+qQScnRHbGDIaUt+dJERBkBf9LPsIaN36LDN1NCrvJcyDPYTER4UXcRP/wQGr
	 PNpLQRuaob1xNEMiw+V6Y4zEVTtDnabs0lM5fwYxHgqNJH5UcxOjSrQLJrLQIcLGqCikO
	 t7CdL0WvLjt1ap92KWrWU+fW/zXNxmEYHF33vedkZUtN5YwRog7asy1pyskFD1JW+6nsh
	 NaQ6fvtLROX+64tGtg0QvXL+ofnTlgBhnWBtsv/fWqOCx+efhc6zl6dK4YlYfeiN55g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=;
	b=wTn7triHpCm+1Nl6WrPw+/LEJDXRAUL75jx9jeuuanrjJw4uqP4PaK4A4bta+twYxJG/
	 HDRAwurZffF2BJpwuzJ4fDe8X03xg2WYeQNewyyZLXznN7osI7zhM+c+Lf1lIKCyMawF0
	 LFEExcS8jdvjgOyqxbak2DuLYYFXdd/7nLNotXKUPSkqjR0OzuEE/Q1kNxKUxGP1JCgbc
	 jWoCgCrk3ZWU9fnafwFBU8CT++nYxvmxNwOIK8nc6Ua47hD4DoxQ1cNgaJ91N95i5i1T2
	 BxA1wKdm91rKS2cVelYE7kxZOzhtE1dFVsUwOIT4FLQeERDD3R57oH741F1tqAEl7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iXkvTuNu;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EE606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iXkvTuNu
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso7137859c88.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794474901; x=1795079701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=;
        b=iXkvTuNuKIh6EHGNW2b30E/CNNzLs80Rc0+6kYvuk4yXyT/fd8ciF+OoK2UPZ6cI3+
         NZZiVvS4hVU9z05fD2CBtrOmgcdkRiHPvjNvk50k3zyllpiZSc2LCYtDT5iVKRnpbe7o
         O1Fw5DNeqNTQ+b3lSG5lP06L9DZNMLft931HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474901; x=1795079701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4jBQf+2hS3DAsRaFcqGX6vFD+jXw9epZKaxG7T7JiI=;
        b=FPgWw3ndzkIoaaAtowq9caZat/2mFCLP7iC0p1wbSRNY83s5sFb5fjBN75H3TTSvz1
         AviV2QrpRfbyLeH4nlktyIUaVsmHj1oLoVSmgpSNQ9hny3a7elWIAdkUMcQD0EPMHWOC
         yg9a21vXzrZMHV/X0Fb4pUQQ6h5zv4iChScvRPt604jhygEHbE4qqO6u7pZAabAKK7vm
         Yh5X2lSJnXg0hnt8EazMwXSIH94o+UHEGDtau0VMCZuaAptSvOUaoPmCuxT345tI5Xvm
         p3UFO361qQI6lyP6yNAn2NgE4Or2F1cjZqb10Uz1VKDWGAY4/vb4EkVLR1tVW2nyLb9e
         GzDA==
X-Forwarded-Encrypted: i=1; AL+hErH43qnAz2b2wRsRojWC7jayWS49oVEmK78453VVCm7Ap8dVzdJvOvEVd0xLzFXQY4KZ8mrH1f8dqWwT@vger.kernel.org
X-Gm-Message-State: APuU4Z+9TPvgvn5QlbkmYMLox1ZzX0rFnboTHIE12r9zGATjZjvmw/0f
	FDdmVvvACLsKUQHtUpX6lPMlZrJ0oWECnPGic2ANWmQbz7c8qVzh6ldsJOhigHAW3Q==
X-Gm-Gg: AYBFou3LNa4SYqRFTniLW44PZuJ9GZGohZphQ07Alt6ZDo1kKTgaQklNJqs9DFHCpHx
	hGr/6rOkuJRwvAVmWGYCjKDeCeXEWQG1GG5PGDYCvLP2VBaskyfxkIVN2xOvAcFwIaixHKZgAF0
	Z48got0AKi/U9fjDFCxdRuiUsVr/P1auxfBq25ERr9lkuNVn+0la0GlGP/NsNgn91CRNw9V2vQ2
	EKYy1ZYdx3PWqGW34ZJbX2Q+TYoPdPFhvbbU3uXpTaz65TKmd94z+rBoHf2HIvUONyorJemn6Uv
	1fG0scMJjzwDyn0uoE3wHbawt3W0FPXuGSn1vBqZdg0AgmBx6oAJNBtzf0O1/BuJdak9ebh6xFs
	/a6GbyFWz7DdQi+326QZQUB2d7KzBZrfihKAaRhh4RFBJjox35ZunVGhcz3ROD9dQrJOBHrizAh
	bLa4pAv5ki4plCzusjObf8jQYms1eEQUyLBYJPvWmqLwTmaeD0fW/cqMWNPZfEc7wBIVZbWn9SH
	vD07zMfS0yxKj1rjulISmPD0ypa+BZ79ynIGzmQM6nVszYeo0h9Y/2E8+KRuMoNhR2z3IOLlfe8
	mlztMRkRb/+4ocPZArCu7QDPhQqkV+iiSHrDAeblAUmek59tLv4AviTUA4lpfDPEljzRcsnmVYY
	12RfH7g==
X-Received: by 2002:a05:701b:4510:20b0:151:2e62:fe5b with SMTP id a92af1059eb24-1b3c0304105mr4870294c88.22.1794474901309;
        Thu, 12 Nov 2026 01:15:01 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:3df7:8811:7670:7b44])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b3b5b2fc09sm48205792c88.10.2026.11.12.01.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:15:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mateusz Koza <mateusz.koza@grinn-global.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-grinn-genio-sbc: Fix Microchip USB2513 compatible
Date: Thu, 12 Nov 2026 17:14:47 +0800
Message-ID: <20261112091448.869620-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112091448.869620-1-wenst@chromium.org>
References: <20261112091448.869620-1-wenst@chromium.org>
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

When modeled as a USB device on the USB bus, the USB device's compatible
must follow the pattern described in the USB device binding,
usb-device.yaml.

The Microchip USB251x family of USB 2.0 hubs has two bindings, one is
for I2C connected and standalone platform device (usb251xb.yaml) and one
is for USB device (microchip,usb2514.yaml).

Since the hub in this device tree is hanging off a USB host controller,
switch over to the USB device binding's compatible.

Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
IMO the standalone platform device variant should be deprecated. If the
device has the hub standalone without a configuration interface
connected to the main SoC, then it should just be a child USB device.

And the platform variant hanging off the USB bus probably never worked
on Linux, because the USB subsystem won't instantiate platform devices
outside the coverage of the onboard devices driver. USB worked fine
because the supply is always on, and there is no reset GPIO. But folks
really should check if a platform device was created and if the USB
device has a device node attached.

OTOH, the USB side of the onboard device driver is missing the PIDs
for the 2-port and 3-port variants, i.e. PID 2512 and 2513. Not fatal
since there isn't actually anything controllable.
---
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
index 7a31cf6f27db..b69fb599ad53 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
@@ -470,7 +470,7 @@ &xhci2 {
 	status = "okay";
 
 	hub@1 {
-		compatible = "microchip,usb2513bi";
+		compatible = "usb424,2513", "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&reg_fixed_3v3>;
 	};
-- 
2.56.0.567.gdb80ae8cd5-goog

