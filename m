Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6412127FB3C;
	Thu,  9 Apr 2026 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706555; cv=none; b=bRozZzeprE3+0CAD3dA1eJLJ44IZ1kL+x8mchJQn2zHJAhXDl9MtwzioyGF33/WoThUBSdENmKaV+C4DKKOujYMsZ1NYv0ukLh/ApuO6IixCvZwJk+QW69bpRPF/guL4RysI0Bgu7iGu06XIfGcXUrvrXiKphoOEtDUvhZoTSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706555; c=relaxed/simple;
	bh=XwkvBR/31TyGVgxFdqL28TB5xmOVK0ICFdDI74vVCA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eE9H3geAJhTm/RHUAXf+LYPwdmR+2g0o/zv2zgL+T4oROYU8POgFkXUkewBRAOpR+0zuhwjBa26zPBB06v5XaSrn2Gqd6qPzt2e+gD4EDxjMVyDUKT5OW9oZWbZJXdiaiLzcBOWhNFMbOjtINFYix3HqIqRDaaXL2AXENkdpvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD3n2utIddp98GzDA--.53966S2;
	Thu, 09 Apr 2026 11:49:02 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] of: unittest: fix use-after-free in testdrv_probe()
Date: Thu,  9 Apr 2026 03:48:59 +0000
Message-Id: <20260409034859.429071-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3n2utIddp98GzDA--.53966S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Gr4kKFWUuryxZw4xXry8uFg_yoW8Jr48pr
	ZxGa4ayryrWF48CrWfZr4rZa4Yyay2qrWrKF1xJasIvws5J347XFy2qay5tFn8ZFZ5Was0
	yr17tFW8WF1vy37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfUbiSdDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgsMA2nW9oesDgAAsu

The function testdrv_probe() retrieves the device_node from the PCI
device, applies an overlay, and then immediately calls of_node_put(dn).
This releases the reference held by the PCI core, potentially freeing
the node if the reference count drops to zero. Later, the same freed
pointer 'dn' is passed to of_platform_default_populate(), leading to a
use-after-free.

The reference to pdev->dev.of_node is owned by the device model and
should not be released by the driver. Remove the erroneous of_node_put()
to prevent premature freeing.

Fixes: 26409dd04589 ("of: unittest: Add pci_dt_testdrv pci driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/of/unittest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index eae7ebdf5130..4078569a0f96 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -4317,7 +4317,6 @@ static int testdrv_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	size = info->dtbo_end - info->dtbo_begin;
 	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
-	of_node_put(dn);
 	if (ret)
 		return ret;
 
-- 
2.34.1

