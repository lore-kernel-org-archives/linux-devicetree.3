Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2D3EE1C0;
	Tue, 14 Jul 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015145; cv=none; b=IEmqFO7R2YTFjfTZYvKYue5rqdfvS7PYMpRx2ruf7/6UctOWnJdGToSi0NOF/YZpd/oaQcP7dlHw2RS2x5lEju4FSCENTLdc0+JNbijm++w8kvNeXdN08+Os6UM7OqkGpSYkzwN49gETcdDo+xKb4FfcSEN1tSt7wXVgn4e4DQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015145; c=relaxed/simple;
	bh=BHA7s+NUnKG2LKy5GZz58B9Mbi7+YSlc+KU/kgVZWbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfGHno4mtbOUdvkiSgNpm7xoKwl9gVdnYxNoHJWvDTnNykFB8dkTTGHCW12cEyikcDcEV+ka+c2vzNyGaVVBUm3Up87tGL/m/0JwBLvtA41BHwavf1kZ2gnu7KhTBDRBvnVJA+xPjEW+UXQymxaRk6SfdtlInUrIL0Ns3+4wr+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S2;
	Tue, 14 Jul 2026 15:45:28 +0800 (CST)
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
Subject: [PATCH v2 0/5] Add remaining IO expansions on Lichee Pi 4A
Date: Tue, 14 Jul 2026 15:45:10 +0800
Message-ID: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXq84X6VVqEs8pGA--.61698S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr17KF1kAw13KrWkCw47XFb_yoWfGwbEva
	4IgFWayw4rJFWftFW3Jr18WrZ5GrW7uw1UCFy8Zr17Ja4DuFs8WFWqga4Ygr1FvrWSkFn2
	kr1Utryxtr9rZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset is split off the "Add TH1520 USB support" patchset,
dedicating to enable the IO expansion chips, because the situation
becomes complex when one of them (but not all) was added for Wi-Fi
support.

I fixed a small issue of the existing I2C1 device node, and then all
original patches are aligned with the existing I2C1 node for
consistency.

Emil Renner Berthing (2):
  riscv: dts: thead: Add IO labels for the IO expansion on I2C1
  riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

Icenowy Zheng (2):
  riscv: dts: thead: th1520: remove pclk for I2C1
  riscv: dts: thead: lpi4a: sort nodes

Thomas Bonnefille (1):
  riscv: dts: thead: Add TH1520 I2C nodes

 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
 arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
 2 files changed, 157 insertions(+), 37 deletions(-)

-- 
2.52.0

