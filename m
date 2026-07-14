Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCC63F0AAC;
	Tue, 14 Jul 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015145; cv=none; b=X/q0Y5HS4pIf9TXtKrhwSCXJ+vfycMbJqVTMgSS9aJto+ydkggARnuX3p+4tKOtI/b3WaeQaBl693zBVHmrbM4W6Hny6QpFO7Yn6XnDiyoCL4zoRHUPuix2WVhZWjPaQnb/Umhq+tYHWEnLovIsrhwS7ZI2EOMbsYq7mwjROUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015145; c=relaxed/simple;
	bh=n+OvI+kFDxP/yL79NSNfJcdIwV+5LLdHPtUMM8FW3EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YMn8RM3SYQoYHTHHAKaFW6YrkB9jhNT+VT+u6wbZgf5nH2WfKWwqK0le8r5DNFDP/jopmQaHnWZeKqzPLLccPl8wtlHkYO7gdmgrAYxtfvYh2h4B6WzTAjWRTdkms1n+acD3k/2QGSp79rKrHhHafVEwn//pMYn47NEfQC/Fpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S3;
	Tue, 14 Jul 2026 15:45:30 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MoeLeak <i@leak.moe>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 1/5] riscv: dts: thead: th1520: remove pclk for I2C1
Date: Tue, 14 Jul 2026 15:45:11 +0800
Message-ID: <20260714074515.1959352-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXq84X6VVqEs8pGA--.61698S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW3try5XFWUXF4rJryUGFg_yoW8Wryxpw
	43Cr48AFn5WF1F9w13tw10gF4kA3Z5JF4kWr17WFyUZws8W3yjqFZ7KrWfXFWrt34xZw12
	kr1Dtw1fCr1YvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUfKs8UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The I2C1 node added previously to the th1520.dtsi file has two clocks
set -- one "ref" clock (CLK_I2C1) and one "pclk" (CLK_PERI_APB_PCLK).

However, the CLK_I2C1 clock is just a clock gate with the
CLK_PERI_APB_PCLK clock as its input. In addition, when it's gated,
reading registers from the I2C controller returns fixed value (the last
read value) for all registers. These facts indicate that the CLK_I2C1
clock is the true APB clock fed into the I2C controller instead of a
dedicated reference clock.

Leave only the CLK_I2C1 clock as the `clocks` property of the I2C1
device node and remove `clock-names` property, which represents the I2C
controller only takes a single clock both as the APB clock and the
reference clock.

Fixes: 2f60e3516330 ("riscv: dts: thead: Add TH1520 I2C1 controller")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 94932c51b7e39..db23624696b73 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -415,8 +415,7 @@ i2c1: i2c@ffe7f24000 {
 			compatible = "thead,th1520-i2c", "snps,designware-i2c";
 			reg = <0xff 0xe7f24000 0x0 0x4000>;
 			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk CLK_I2C1>, <&clk CLK_PERI_APB_PCLK>;
-			clock-names = "ref", "pclk";
+			clocks = <&clk CLK_I2C1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.52.0

