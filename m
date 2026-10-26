Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039375;
	b=NiLWDzX9+9ZyjblfHRzeTWKvAnPF8EPNdozN55wo9y3R2MOZO28nXDASKAIriUvI0qd/
	 CKmjSn7lzoPp5oVmODvSnDX360AN3GTykQR3RTcGVoW/5uLb6gOQaTUMST37Q0n9gawD2
	 BoaSiLBZ5hTxsCdR0BN63HETOYoMiYcmNgqPU7MVMZcbEXOBukIJwlc1pfSMOPc8nXULf
	 0jdOzQtf7xap6nuOU/XYC0RVnH6aABwyvSQuY6oCPF/R0VWiB3hasaWbZjrT+uop48cDQ
	 pYCxFeGyCsbYLmMTK8tLc4tscghYLVWERb+Q0uppthCRiJJk8+sgWoIFyYWPEl9QOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039375;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=mDMAE9RUKuKtot5J/eh1GOfBPHhLJSKA/iAKc7/42XCfbg1NGwuj58Ogk38paeirIsgE
	 EFIaAEyn3uMADuwmASKAy+4xfCefhArIgBfAIiCgbcTySTNoYCO4nGj7dhcyVNBznZhwW
	 NtKFXXMLlsCDHF/MWqf11iTB9hYUk0i8Z9MqjNIyAAkyRmN+PCE7wcC5pgr2bwcNEX2Dz
	 dYlRmJ8+l3jYJ4LXqo2uGFITx1Ee9yR3tsC0GnI6YLEq/+Y72RNBZ8c6B/Cx6lgGZ3UU5
	 mxGKPyclWDpslcyacCQ9Vz3wzZP2HXhJ2D7pANRZvUGBvQc8ho/zK+t3kOVEKQD/z+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EDbe8JyM;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0B0606A32F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0B0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=EDbe8JyM
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2373490a91.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039375; x=1793644175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=rPaAwOXaqPYMiMd7jPQMVCW6rDuC/3egXsqhgBPYLXtUMts9PvxDFOU4ND/A9YJ1QQ
         VMlixSVpuo5WKe4kXCkokJIjG2PxDMClxHAdefHdDeesd0dsv/yUZe6zh2luthh8BJ7R
         ntefDRZPlnhT9yfgwLRmPipJOQEWZUKf8wi0xW+alBuTWSFQ5WHMkcDcJko0tnKaIk26
         VyIsK6dm3Y5i3vhWXyfAP8BySxi/lFoVj3UMWSPFFflJAKp1OF6t59JPwc8DRAht01x/
         iFn4PtHbhH4P99ft4HkawLiKe5I9Z7CfXQkCv+1SMzKc3VVsOR3P34aHG+cTg8+g352z
         zpMw==
X-Forwarded-Encrypted: i=1; AKwUvBwW1mTEXWtF46VEAsEx5NaBLpzoWbBV54PSfwhsvuqxduOoz6368EmoTyb4Yi1QAb+5k7GHB9qk9M4e@vger.kernel.org
X-Gm-Message-State: AFq9FYIrZyyEREgmkkff4u5xnJ6mNqgVCqO/N3WeDK9A/uCyV1Z+CZe0
	oOX4cRPFsgv9UJ0nWsFHo7TGc+fdXsK1JDOy8UI9Tk5tVvuFC54zgJRMgg6SuyxBXCRPAJRY+Ia
	gCukYtixxrjZSEQTkYAjjYU+Fi0FxW6WxhxRv6YGK6otVkWwSSj+ikH5hRlT+XrLxN82IDoWFhD
	FeMY3c8L3/qyfUt3QmpwbxAKtK+v/nRveQzEfPRYMlihWvW9XQ2Osp+o3UT/np3ybPdDtsi97Bu
	Is3Oz5IM5/bDMDJK3LDcw==
X-Gm-Gg: AYBFou3CFImo49QjN/E9h+3Afi6MocT3e2dJYRLMyhD0PYMF2vAbUHil99la1CS7ZiR
	QCdW446RPRpy/NaSlSROdIIhSRQYrgAcbOQ8qykII21ZKiNeJIgyoJnmyzd6Wm+939iYd43zqUb
	CM5lsiiZbg4dqVxixpmuPrwmcDtAYIn7Kqf+t5SuGiRpc/+dVm4s33agN1JtnJtV+0hV2JR2Zvo
	JcSUG/h5j+/ERjyVrVqgKBlVZdCRbBOJSopvDIrtdrNgFqiHVfxcBQtSvGyfAwC/zaudj3kP3X9
	qfBbSmRel1XUV+xBU4VGJR3+OSTOn4VORes9aZSvmSopSYx3fE+h2kNZXoKeogfJmPZze0Bqsyf
	Uwq0t+I70XunscgjgSttDr6fEus/yU+OE1HQ6UjxnabmRFa00CIAcHuVYj/6PDebVkCccFy1L//
	ZmED3pijkkJam7BpEZQ42jansbQGokx7B59EMiZtMP
X-Received: by 2002:a17:90b:56ce:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3adeaae618emr6392782a91.10.1793039374722;
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae406dbad7sm251167a91.2.2026.10.26.11.29.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15640385eec.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039372; x=1793644172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=EDbe8JyM1HEA7j7H+aiMBu3jKwqskRBAJ0LqbkNmp0bd+lNRV7bq+OVr/KpUvuNCyd
         gpT6RbtbBWzxFxzPld2nJptYQjepp/WUVsyiLvvArWlPBuSEHON2OW+DbvZtzaFY1UQW
         EoJ3v3vDU5E5dWcXRkbx+/XnX+x/J9PlOT8b4=
X-Forwarded-Encrypted: i=1; AKwUvByJg8a7UaJJgfLwctqehJfj8rjP8u6G/qM8q4dflrsPSBowuJkk/x51YNJo1sq2dp15x6Bp8wSLFmKy@vger.kernel.org
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300549eec.25.1793039371690;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Received: by 2002:a05:693c:68db:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-369f7d2edf6mr7300511eec.25.1793039370933;
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Mon, 26 Oct 2026 11:28:54 -0700
Message-ID: <20261026182856.3168686-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0

