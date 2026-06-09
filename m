Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B524A3F4109;
	Tue,  9 Jun 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996014; cv=none; b=XNBiAZXmzvCNylL0OA89LviM2jW6NJUomGZpqyrjeTHbuUrc86G4VY4/n1TveMMInO13FHWW9WSpf1hoMcZ6LSnbCJj9JY6Ao2GlsS/zSYBsY0ga8fbHvA7YNKcfgZtxeJIRImUkMjIMPMricyiDUd8V1CtM9FYdZNz93kmkl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996014; c=relaxed/simple;
	bh=V3qDZUx3yOnSJqO2amTow6eQ51hs49Q0hdct+TJ+Fss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ooaMax/D+2NIlskXgw9aGhlTI92fULudGaDqqJ10q1wLJtOYRvxJ6Dovbg4BKyHb7SqDtTVYFwEh1yuOGfIrOYA39EQXFgU4UJcwpWAc6WuAbeym0gJT2kSXrPHfKN6mjmnss3oLp+6wNssSyswDPUsY5UzcAhAQU6P6hmPeEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8Cx3emn1ydqdTESAA--.48284S3;
	Tue, 09 Jun 2026 17:06:47 +0800 (CST)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJCxOMGk1ydqKKOgAA--.28652S2;
	Tue, 09 Jun 2026 17:06:46 +0800 (CST)
From: Hongliang Wang <wanghongliang@loongson.cn>
To: Hongliang Wang <wanghongliang@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] LoongArch: dts: i2c: Add clocks and clock-frequency properties
Date: Tue,  9 Jun 2026 17:05:40 +0800
Message-Id: <20260609090543.1462-1-wanghongliang@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMGk1ydqKKOgAA--.28652S2
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

Hi all:

This patch set adds clocks and clock-frequency properties to i2c nodes of
LS2K0500/2K1000/2K2000 dts.

Hongliang Wang (3):
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K0500
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K1000
  LoongArch: dts: i2c: Add clocks and clock-frequency properties to
    2K2000

 arch/loongarch/boot/dts/loongson-2k0500.dtsi | 12 ++++++++++++
 arch/loongarch/boot/dts/loongson-2k1000.dtsi |  4 ++++
 arch/loongarch/boot/dts/loongson-2k2000.dtsi |  4 ++++
 3 files changed, 20 insertions(+)

-- 
2.47.2

