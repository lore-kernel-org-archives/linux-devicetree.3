Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570767;
	b=5pDGAqfynTLvIvzJkFkyxYVbLOR5P3b8qgcWOcXXdtxyJbs9CvbvvaYkAO3nYDi3PBxK
	 Ky3UPpqnBB0pI/vRIjz3MxQQ3Qp3O0kwfVFjeSKEe8R6Wp9Fym3tnOy0l09itN/4O7V0n
	 rCGeTpGmXwNFbeE6P+6u0lbbE2LmHxu362wlj9yzQ5d3v+8cdkwNjG7Ufh/cyz7jSwjfE
	 +wnz//8TUWEKDIMiW/2MUNmY3gA5cHcV0pFlG1MaXLfe8jhbsKXalvqv0lVOP73/5WaVl
	 xD30XY67ev3v4HzkTEPn891WeRLdPDW2JuPJezRofn7Y433WMRF22Hqth07uGWKH6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570767;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	b=wi8XWF1MPSR2elEYsUk0d1cjoZRhOlWqlHjTsY9iqnLL9thYwX+f11+3j+1rkLhmkl4X
	 xOZE6o0sTA2hnP8zFCppZxmHREpp4xcIoK8HUJ89xWUwLh02fPyQ5Il/8oLxXVWm5KaDY
	 lFiW1YqYe2NqCFmZ7wWrY4OSNYWhg0sU3HhZ0CiNHwc8DXTVxq0vj1Kb3OGfTWd02uRAj
	 CnVVwUaJ4AAdHW0aoHWZyT/algrqk9VTkqLbPoiGpqQufjTazZ0nmfze9ZIRIpMhdAqH9
	 Qynqu0zZGuYs35h/crYbvRv/0UqCS6PLYTLeFMELqtX8du/u03PErHLEft0A/RwTNQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yUNz9xZj;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B9606A695;
	Wed, 25 Nov 2026 01:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83B9606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yUNz9xZj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570732;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=yUNz9xZj7pPkWYG0E/LmZHN/ACd5ZFyCRqHUPpMJP0gOCcdCyxawPWNaq25YvTbp3
	 UdG3GUJynDH2UauYSGbBIm7ShjlMIji6IdtTHE7f1M5Z8xo0pA809NZxJrxOcHZPLV
	 5VcLRFZHT/hPrK4Y4QuWWPAvb+i8MmiuwPoO9g+s=
X-QQ-mid: zesmtpsz5t1795570731t1cfbf41c
X-QQ-Originating-IP: qm6/nQPQx3/pNPSzdBkdp0oaDuY6kR+5dIbu/pTJ9oA=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8991991900957459394
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:23 +0000
Subject: [PATCH v3 4/5] riscv: dts: spacemit: Add the K3 APB timer
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-spacemit-soc-timer-v3-4-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Lakketge+7u3TGaLDJYVC3ImXbq0o9pWuFTAwlnXYmc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqLLYn01Encp7nYufRgnJOm22T1A7vHzqR4CVnOey
 24/k/Sro5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCJXyxn+8MSosz5ctpZp997s
 Hbeyg3ln/X/KIer8ctLCEO9bCZ1BYQz/LD7+tWHTfWWoOEX8orpHySTB1qzTKe9PSDAH99hcTVz
 OCwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsKw77UaNFtDDD8E2C/5ISDFDXF7k3GigFhCEvYy0va/ahtyjHSS9b1G
	EdW3YJuKO2wA++hEdm8J8/uE7eJ9CPmAGS+M6r0C7QDn8idcV4axiDW7VA6qyLMGlQRixbJ
	psTGRNOJcueJHMJrHVtTQtBPoKGJqawEKpxF3oGR9WJx1z4lIyOap8MdPGcw4jPhmpOfop4
	SlZgpWiTLWyVAneHS/HGJnfmnjj1j4P8XUrgaDaap6kqKae5ykDW/XDqnLcnCUexEoPtQvN
	786L0Iip1RLJl3G5b9x1LGmVb/QacHQ3GrBlgjhoJb85mpLUwEYNMYiEHzOMRUMLLRsc0Ac
	jtxHKw59YXhd9TVDEf5OWfTXuULxkIhF64Fk5C2vsaSUt0V9gYR/WRU/Kk5lmshfAj8yb/w
	Wol9IGtYbxmOM3UY+aMG03/2t4aFG5/oJnQ6UvhoVB2lS0F6JgAMFQ7vQGv7J5I/EcZmT+f
	SNZ/MkqTrk6Cxp50mKsFG9tLjdJIQeXEpYeb6p/HGbYgQqRZSTdUTQj5oU9gzUEbRwZKgNO
	V/rtl2JKIpnUMvIKwX64xTqCkamc8NW4GO1RkSDqLbavvUhB4JF8AhckVjpkKaz+B9d3XVO
	8DlVVGMY2BdbAfe/2GnCSJloiDgIe5TvSKHk/+pTgxBuJsTtH+veppj2O4FXmB4ua6V/aqs
	EdX1HFenZDOYvrURXDEhT5QGC3M++yBfcAzTOd5f2hFoRtEy4QT77BWL/NVHKuVrMeo3c2w
	3GgpNYveVWsJVfiv7NjQj2hPgtdz8lThQIxuw7D4QWOLPCNBz4OYCQFyctMf/0B/rhF8FXA
	/yBZK+mgkt1U5Klb4jgbz57EJFpPhW6TPtB91b6IU3aCq0nBibWSO76ajbLCtp3hZVbSjVT
	CMmyiuiH+gyaLxt3g1yI6AzbhmiwXo2nPUWO5CR2soOGycxhokOLCk4Ro3CVPMecT/eTMch
	pQ/V2oxhO1axO6mTwv8O2x/ZkDZPQcjiAd3ahVy329/sgBdf7z3mluL+TDW5xyqtyZ8Qgdk
	lCchODi/bQY29oFOzO2dybcwK8m40ZCgrCV7UsuibJV/n2QUqPtjJnXj7IcHO3uCSxFyWUp
	bFTeUkWD0wayTq1wEkX4GsUtegKMEGpxNAINEeP6ZtM
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Describe the APB timer at 0xd4016000 and its counter 0 interrupt so it can
provide a shared clockevent. Select the oscillator-derived 1 MHz input
and connect the functional clock, bus clock and reset.

The register interface is compatible with K1, so use the K1 fallback
following the K3 compatible.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..cee313232c11 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -777,6 +777,18 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		timer1: timer@d4016000 {
+			compatible = "spacemit,k3-timer", "spacemit,k1-timer";
+			reg = <0x0 0xd4016000 0x0 0x100>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TIMERS1>,
+				 <&syscon_apbc CLK_APBC_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_APBC_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_APBC_TIMERS1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;

-- 
2.56.0

