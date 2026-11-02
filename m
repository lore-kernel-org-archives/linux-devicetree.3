Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662455;
	b=m+P4htMsQD6TaoQf8uHw4I77iHK02C4p3JXDX0m+x1l36CTx8ywBZ9LsEyqT+SCMBj73
	 cGR97dzDVef5zCFpAfgCe5u8FOOgCFoaBZWNnKsa9pdeWK6Kd44nt3SRnTB0ViXBGnTH5
	 21yY2XplKDz1Or+eo5iNVir6cHRq7zQk7vi9Sn6xr+kZJWIEg1graoVfPTw9AibR+kmiQ
	 SK7aAZCdcjEOkpKg2ePkrHtdQS62mVLV34VzUHhRcPKdC6LvCS9hgCchk5cbuKJHBr/39
	 AtQzvUjA4smCBtvfNiTzOy3qpHi51u7wzQ//07StT+OYCP8W8Q7w3jp0CFh7fAjlJEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662455;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rYrONzDmndfVB6GaH3dGiAC1FfNwMYrSAW/wh3V+FUI=;
	b=eWaVMJSwaArTmXubnwPNfykM4QFc59gmtuwXCM9W0COKTx/BBBCrN3ZmWRXQBJFyjYIV
	 DU8EJKNDlJdOfhkrcbTJui5xmC98j2QXPUOdiOitTvkXjSycn85P7k8kvLTCSSl7Kb3d+
	 CoLzD2GmzIWn68egw+S50W1W5Et/Ovh0V+Kzb2R62pZi/iDB52rShvE6SHfzv94Q8gop8
	 ijvNalikxFegnDLBbW6hxUlRpORcTfbiPnw78DpEIZhMnEAdA3iE33exCYSPes1MZ7Cg+
	 P48UgRvPMEH1qJiPazc6CKexM8t6K1K9mXP2PMFTQGqYksxKcyDY3rC1owMPvKlQc9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="KY5/YjPY";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE887606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 23:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE887606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KY5/YjPY
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 386B22F;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18AD73F673;
	Mon,  2 Nov 2026 15:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793662447; bh=TyPXI9cOspx3YhD24PSZEUA31oaVYiyRztgSw5AfOuc=;
	h=From:To:Cc:Subject:Date:From;
	b=KY5/YjPYz1s+wKGHenLIrGW6UuNYi3/dP16lbQEGEt1D/xIUfcJWgXCqly+N+kx9n
	 NfBiNAUBXfBBKCZAQHlOC+PSKYaWTAZXz7RW5fUnbe/BgMqfm80lBVLBYhJWEZ5m+U
	 Yh+SupEqXGLE9FqUi90PuwGcORUSgU+vffXiOk+I=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: a133: add ethernet aliases
Date: Tue,  3 Nov 2026 00:33:48 +0100
Message-ID: <20261102233348.23117-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
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

When adding the DT nodes and properties for the A133 Eternet support,
we missed the ethernet0 alias, which is required by U-Boot to generate a
stable, device-specific Ethernet address.

Add the alias, to allow U-Boot using the Ethernet port, and also provide
a non-random MAC address to the kernel.

Fixes: 8f128f357dfe ("arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts      | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
index 694c0cacf9064..607864ee13718 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.dts
@@ -19,6 +19,7 @@ /{
 		     "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
index 90a50910f07b7..81a2914ae3113 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -16,6 +16,7 @@ /{
 	compatible = "liontron,h-a133l", "allwinner,sun50i-a100";
 
 	aliases {
+		ethernet0 = &emac0;
 		serial0 = &uart0;
 	};
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.46.4

