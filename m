Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906600;
	b=UiiBw6IdwlENFTYZTeQdZvmueqsQrgeBUuP1YwqGveBHnU4QahmZQHrtxBGsfkB3bvXO
	 e/FgYURErejX/otEVWgKZwutvanxprBkzO0H0lgb0232BJKRCwBR9/LkZev+F/rR0j3ij
	 cLSY+NCYUWu6ik3dI8vEKurzac/ftyAEbLnHkYDSIIbkK/X1ZhrQFkFk96UmkVFBIgVd0
	 Byn+MUBTgM7z5qbIK/fRVbVYtIF9j/dAHOnwT0VkCSw2nF0Yi15SgcBr2farZED+y9vBU
	 f/ctCbKzE4hGewiH7Rxlic9uEb9EerbQyfIzCOPJcfF9YVhPE34nBinI6Q7TG1pRGzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906600;
	h=DMARC-Filter:DKIM-Signature:Received:X-Mailer:To:Subject:From:
	 Content-Transfer-Encoding:In-Reply-To:X-Lms-Return-Path:Content-Type:
	 Cc:Date:X-Original-From:References:Message-Id:Mime-Version;
	bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
	b=JpXL7+kWIOSFcg5YEDR8r5Q972t7UpFKOobMJt1VRsaVn+jvTjVbKfcs/K6LlLlPxU+E
	 QFszgwBi+tMSnyKGDjp45Ly3kVqbbdXkIvkKqI28QK4foPiQ4ZxrgqgcVHpV5AjxNaTKa
	 mAcmnZF4pV2jU1dTomYT4+oJUZzAFmV0hQAFtbYQTJComIR/yR/nSiM2SVPUIYNjotpVZ
	 ncA2ppWP/b5XA3EjUJC7i+GmKcLYebZmUmFZNoJbvyDa3l1Z7+OzDGqDyESCLp9rDVSuT
	 eFauLrUinCOmWgx5xfEv/3n3Ny1v/olZLC0fW9CgL9d6bMhtP/vMbrlWos/0ME4nDdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.cipunited.com;
	spf=pass smtp.mailfrom=oss.cipunited.com;
	dkim=pass header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=19SSjgab;
	arc=none smtp.remote-ip=209.127.231.50
Received: from va-2-50.ptr.blmpb.com (va-2-50.ptr.blmpb.com [209.127.231.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3094F606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3094F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.a=rsa-sha256 header.s=feishu2303200042 header.b=19SSjgab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1794906588;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fHUvMEx0c2bPwIe6HR6SirI4dIsRD6+ZIL2vDk7n8vU=;
 b=19SSjgab0GWrUCL8BiPlE3mXSyTWh/qCSBrOUYFFz0pzGs9P1zBxYgZTad8/MvOBqBJfjz
 l9mLRCaYmaAYZDGi0jZXNBYDCrlCSim9ArgIQDxhSuljfTrwUuk15oxkKQYElP/C2lAIxb
 uxH4aCa5eQNZifXVS0dOsJM+jZ3gON2ohDlwYnmIju5WlGMFrxHV3oYgiwWNbQggeZVkzV
 sHgoq8R6jAjNp9hvDVMzw3ucMXR1k6ySaZxyE+TWXL62vM3FlUK8jk/YYtCccixdqf5UgZ
 hRtVhSNIrDefgZjDfx+1hGEOP8c24eALBKG/L3Pr/uGRnofpDfW+mFWdBo9T4Q==
Received: from [127.0.1.1] ([171.15.157.139]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 17:09:46 +0800
X-Mailer: b4 0.17-dev-ce4c1
To: "Keguang Zhang" <keguang.zhang@gmail.com>, 
	"Wim Van Sebroeck" <wim@linux-watchdog.org>, 
	"Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH v3 6/7] MIPS: Loongson64: dts: ls7a-pch: Add watchdog node
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
X-Lms-Return-Path: <lba+26afc19db+585bf3+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <i@rong.moe>, "Yao Zi" <me@ziyao.cc>, 
	"Icenowy Zheng" <uwu@icenowy.me>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>, <linux-mips@vger.kernel.org>, 
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Rong Zhang" <rongrong@oss.cipunited.com>
Date: Tue, 17 Nov 2026 17:06:48 +0800
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
References: <20261117-mips-ls7a-wdt-v3-0-2e88f7e1d6c5@oss.cipunited.com>
Message-Id: <20261117-mips-ls7a-wdt-v3-6-2e88f7e1d6c5@oss.cipunited.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

The Loongson-7A has a watchdog compatible with the one on Loongson
2K0300.

Add a watchdog node with appropriate compatible strings to wire it up.

Tested on Loongson-LS3A4000-7A1000-NUC-SE and Lenovo KaiTian M530Z.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 1793109281c7..dfc91e49ea77 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -74,6 +74,12 @@ ls7a_uart3: serial@10080300 {
 			no-loopback-test;
 		};
 
+		watchdog: watchdog@100d0030 {
+			compatible = "loongson,ls7a-wdt", "loongson,ls2k0300-wdt";
+			reg = <0x0 0x100d0030 0x0 0xc>;
+			clocks = <&pch_misc_clk>;
+		};
+
 		rtc0: rtc@100d0100 {
 			compatible = "loongson,ls7a-rtc";
 			reg = <0x0 0x100d0100 0x0 0x78>;

-- 
2.55.0
