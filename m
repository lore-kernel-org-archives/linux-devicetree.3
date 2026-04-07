Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09C3AB269;
	Tue,  7 Apr 2026 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775577729; cv=none; b=QxT/qXFp4lTV9tGFwWbwhEDDQtxDg4aBtQzP+ICiXhl5n4okrQtZhGl3DhZ+gi03ZpxGg9GkwONCkFOUKTnhzof5d7Iu/Lkq0Z8ncJrNhxeR8uhB2z0Fjj2vHhgLxO2Lgzr0LTWvkNpP3NvdYcr5z0/P6Y3VWVeh10eqX1emKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775577729; c=relaxed/simple;
	bh=Nr4k76+J1u6CJEEdYYHDVJMf0Tw9s5qO6XDeJjFJGKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9W8P3CobiGjXIilQA7vBfNBy2i9z2ECHM8mUBqQY/qggWdFhfLjTyQmFp2PTURI2c5nJ8DYBnqWSZGvJQIqRxsM4u11G5VibEaeY3xlZ8LkmCJ6GZTnkItbcCbxIFDvnCJzOwPgXhD1duV7xHzSaZbVylSpkhn+zFgmuT8uEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.43])
	by APP-01 (Coremail) with SMTP id qwCowAAHsGtrKtVpwzeIDA--.50509S2;
	Wed, 08 Apr 2026 00:01:49 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
Date: Wed,  8 Apr 2026 00:01:43 +0800
Message-ID: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHsGtrKtVpwzeIDA--.50509S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW3WFWrWryrtr1fGF4fuFg_yoWkGFb_Cw
	1fCa4I9FZ8Ga92kF1kZrs5CFyUZw4FywnYy3s7Gr15Ka4Fvr1UWFWqqw4jv3WYkrWYgryx
	WrZxtFW8Cw17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The SG2042 MSI controller has one 32-bit doorbell register, and each bit
corresponds to an interrupt. At a glance, it seems that the MSI
controller can support 32 interrupts; however the PCI MSI capability
only supports 16-bit messages, which makes the high 16 interrupts
unusable in such way.

Reduce the MSI count to 16 to prevent producing MSI message values that
cannot fit 16-bit integers.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 9fddf3f0b3b99..9f1820a7b5a9f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -234,7 +234,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 16>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.52.0

