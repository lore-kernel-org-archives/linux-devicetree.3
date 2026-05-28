Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63635E1C9
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956730; cv=none; b=d63dN7XHu5r2X3+I3oiU/s1VZgZcGfEspIOBjM+m55HGYbJLDoVdPayqI4kOw+C4dDSN2un3npbOla9b7M6SyJAen/KR+pJGcgjqGfSI0kMOtOvwnsJWVrwq6aP3vRp8K7K/AUcsipEjUJucqOh8NGi7DhdfX0ZKQjdsjpF5V/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956730; c=relaxed/simple;
	bh=p2dvLLhp31PFH6S+B/4+kNtoTbdSaKxwxMBm1BCn5Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oMcfsyPkj5C1EMcfpdycFt5UhqpGCmRHsgQKUt82VvWMhEPuXhvkx6ILKD/uC/U8l9hHNRxBTdXIIfDMiU7ROq1F90hxFseRZEgmmhBPVfPPBlfzMi0uZiITHzCpZ+GOzPE3XGEN3AHNPinX8e5CxLw74i7t+K1Ly8vyXmRr2rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0L7foUJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0L7foUJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569A1F000E9;
	Thu, 28 May 2026 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956729;
	bh=21KtnN5w1SmK93fOpkoeLtN3ezSRWi64MXMncDa9k6k=;
	h=From:Date:Subject:To:Cc;
	b=D0L7foUJeMBp/vjASghJC9iqQjbZZMcFBUWHDBD0O/o641y4bsH5ZQRLUuAE4FuLr
	 h7Il+V+AjR1AaDzfawGrz0g715B8H/YPDINlwGu5hSr/dbTBpdC2DTE0wYZ8IC/GXq
	 MY1WEdfCWStyLMl8Jvwma6QwKW0LN8Rre11kGZhivk7+0Go7vwHU/iCum6QO01atVU
	 DkvcC4COGA7bUvyKxrgkTxSKozgnJ4peDt+RU3x37Y64qsbgWKPTiS5a9axU49lZ+C
	 BMKxbN7KiVaqrl4kRWsw3O3wTJi/8IQ1PhGVXufbQaW1rsMa4BaH8PYsM6w7U0lzoa
	 GDtPSIKoySG4w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 28 May 2026 10:25:26 +0200
Subject: [PATCH v2] ARM: dts: gemini: Fix partition offsets
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-gemini-fix-sq201-fis-offset-v2-1-f594d3072fe6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ7CMAwEv1LljFFsSqg48Q/UQyhOawEJxFUFq
 vp3Ql/AbWe1mp2NchZWc6xmk3kSlRQL0KYy3eBjzyDXwoYsOYu0g54fEgWCvEFfZLEkhRSC8gj
 h0KFFT+TqiymGZ+ayW+3ntvAgOqb8Wc8m/LX/eScEBG9r52gfmqZ2pxvnyPdtyr1pl2X5AmWYh
 93HAAAA
X-Change-ID: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b
To: soc@kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2

These FIS partition offsets were never right: the comment clearly
states the FIS index is at 0xfe0000 and 0x7f * 0x200000 is
0xfe0000.

Tested on the iTian SQ201.

Fixes: d88b11ef91b1 ("ARM: dts: Fix up SQ201 flash access")
Fixes: b5a923f8c739 ("ARM: dts: gemini: Switch to redboot partition parsing")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Resend to the right email address.
- Link to v1: https://lore.kernel.org/r/20260123-gemini-fix-sq201-fis-offset-v1-1-a046625f8846@kernel.org
---
SoC folks: please apply this patch directly for fixes.
---
 arch/arm/boot/dts/gemini/gemini-sl93512r.dts | 2 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
index 4992ec276de9..341dec9b636a 100644
--- a/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sl93512r.dts
@@ -146,7 +146,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/gemini/gemini-sq201.dts b/arch/arm/boot/dts/gemini/gemini-sq201.dts
index f8c6f6e5cdea..bfd1e8581ad6 100644
--- a/arch/arm/boot/dts/gemini/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sq201.dts
@@ -134,7 +134,7 @@ flash@30000000 {
 			partitions {
 				compatible = "redboot-fis";
 				/* Eraseblock at 0xfe0000 */
-				fis-index-block = <0x1fc>;
+				fis-index-block = <0x7f>;
 			};
 		};
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260123-gemini-fix-sq201-fis-offset-f7c101a2264b

Best regards,
--  
Linus Walleij <linusw@kernel.org>

