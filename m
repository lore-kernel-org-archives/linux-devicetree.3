Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9943DDDDB
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 07:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234099; cv=none; b=c2h+NbYjBy383m26siQvR5yoy3+leIRYs24W7bOotDhN04dVERtFsONLgymlGaQ2IIqC3wkf64tNMPjgCdtHm59V7Ru+x5O6Ic7wKKCD4taxJ4qFX7LfqG9mq5uC5doQk9/VgR0o6oyFxnDsCmie5Ae7va72mDOyQE2AxcHiwjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234099; c=relaxed/simple;
	bh=U1Z6kjsMVIbbbRSSBlT8V0uTPKeoPfC6ZhdfOLN5uW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHRwmCrh5zgIVE0Yhh6fsmKMw5jbefg58tSnXuq/TvwltbBXj2rFDpFuJV3V8m9m9D1Qzsexi+wlTPcGDWtjgIuyrPwPsXNywCm7cE5cy/A7hQ64gv51M9TbDfMnu/gYodk11h3awK2QOmCPsFuVk20dBXTYnpCA6pFcB9hsQLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=bnOWYsid; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="bnOWYsid"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso2806204a12.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790234092; x=1790838892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=bnOWYsidpe7xcw9Oe4mvJ75tR8m7UZt09lWMnVpb3C2BFx4V6szCbUQG1cpL0cvDz8
         VBAEMyNl9awcfhiNAC3ORD/oBwOGOjVhb+X7UsuSRtc64m/QvAXd88MKjPrfOrlus1uP
         6I5hfloudEjOrEyo52yCNjosVUVk1FguWI48ifALKHQsaNkvp/P8BB+kHslLq5nSNgno
         zKguWvBRCLZ/JYM+OUqdm710LG3YDfphlkZtLBcmcH0K5D2AuSOuqctPoHHJDq/JTmHf
         Kr10+4Op2dllW4WatMFouVM1YWFzVU7g5mdrlaQ0B3MYrUNeMkMfG27767xQrKw6Qhwn
         yJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234092; x=1790838892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/q4IHYKCy6ATe5C6R4o2zyKGD60s2UPYSeHPBkDVEs=;
        b=JGsArNG2Ywy9k9Zv4A0SV4ql3oB0dZr98BQvCHLKqXLSLe1w/oAFEu3lL53ECB/V7H
         xtFejG2BccZqm3971hQkFNhorZv5VbrO6w0T+SAGI/PsGQWkT/KDk6Zx+HzlRDgTpCzt
         cn5TbzieXSBxONsA3M90zJjZqNVekpBoQUdmsoIKOAtASxU4U+CgU/CZ6JZ3pLXAvR2A
         X89snB45B6gqaEFxQOp1oaPKEBdXW4ZBL2pCZD+3HJGnD2mCDm8sdC6UR0MgnExMwP5y
         kY0dOh+kFOvlgn4/trpkvPqMzbnQiQ5mP1Nu6bvAUYtlBqmouYbQ2qG/KKQXxz8Uq14M
         wUfA==
X-Forwarded-Encrypted: i=1; AKwUvBwB3JRuyKDL/Iqz8c02n6dY/WPl2H3mkMImDHLh4vckiOuvyqgbU0Rhpk6r4I/Y2FlYw8UpbR7dA0bg@vger.kernel.org
X-Gm-Message-State: AFuF++mZt9R9mYHHQC2IvqV/r/tUIQne4amQlw4WCpK4TXKITtnNpHpD
	hG8ipwt44J2B2Z7PL3GS1sq9HPiI801QtKHdyOEfThPjuY1uAONrTR3R7gWUioXG7zQ=
X-Gm-Gg: AYBFou1R3HZksPFk2d576Lo/Sas/Ly8AZ7lXs6STENG23vN9RMnWM+C6r0sNnld3v9X
	0qHE0vz3Suy9abQO57MsHWPOfrmcMcHhHvlpUsMYUjnJtTueOzQtP49dlQyvTZGbHCjVuN5mOYp
	LWlDm8BkDc4dwfwY/ojxcV7iqmCgk9khmoazkqnu2/z93dLNPdn03LTBvt1y0NjIX5Uwd33/LQY
	W7PP0NIALreNxifZpbkdxmGl7ua/8yya5reudDj7lWuazV9QO7LWE0X8RvMemLxYEEnzi7OMnjH
	SUMMm88+qGKY0RemMXMbvKkwOYSgu+h1DqbqNaAnQnyNpNpdmSWQXkYx29FeKFznT+Aligi7j+K
	wTKC5UBSo7fxDUXWKyQWr02nsgWjtQ9gx4m8CQ15VSXsz6kwRAVFuW4qVWmLBmd9q7RdEz+MQu7
	tSsYo9lScpUwQIleq9x+e10ogEZnubzM1r4x/zLAEwAukWlXy6AXn4iG6d2Bc55p7pFU7BRjmka
	aUdNa+bw+7qLGFk1Gofq94qnB2jvLnNc3AXON4J21wjtdM=
X-Received: by 2002:a05:6402:5385:b0:6aa:aaf2:f6a0 with SMTP id 4fb4d7f45d1cf-6aac8ecf65bmr1299955a12.1.1790234091341;
        Thu, 24 Sep 2026 00:14:51 -0700 (PDT)
Received: from janlin-02.home.wermuth.pl (109-206-198-27.host.skynet.net.pl. [109.206.198.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab38a9756sm3306589a12.25.2026.09.24.00.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:14:50 -0700 (PDT)
From: Adam Wermuth <adam@wermuth.pl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adam Wermuth <adam@wermuth.pl>
Subject: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa ROCK 3B
Date: Thu, 24 Sep 2026 09:14:43 +0200
Message-ID: <20260924071445.441822-2-adam@wermuth.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924071445.441822-1-adam@wermuth.pl>
References: <20260924071445.441822-1-adam@wermuth.pl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
which is served by usb_host1_ehci/ohci through the host port of
usb2phy1. Enable the controllers and the PHY port so that modules in
the B-key slot, such as LTE modems, can enumerate.

Signed-off-by: Adam Wermuth <adam@wermuth.pl>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 149a5306bb03..ad9a91c0d0d0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -758,6 +758,14 @@ &usb_host0_xhci {
 	status = "okay";
 };
 
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
 &usb_host1_xhci {
 	status = "okay";
 };
@@ -780,6 +788,11 @@ &usb2phy1 {
 	status = "okay";
 };
 
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
 &usb2phy1_otg {
 	phy-supply = <&vcc5v0_usb_host>;
 	status = "okay";
-- 
2.43.0

