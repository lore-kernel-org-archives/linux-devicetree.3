Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692E31D371;
	Sun, 12 Apr 2026 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013540; cv=none; b=nZ2IXlhLbjog8amIBLWkNGXjtRkGesxIOF8Icy0HF0O3pRBr3luR3oECTodp+mVFKXqyqexTUOyKWASE76L8H1iDj8Uo7Ksf257oEevk5cDpIhKDYc/IzP/r0FlOD6l5A3PC5ewYw648sP2Trn1jaRZRC1iQ1CFaDNPAtVBlf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013540; c=relaxed/simple;
	bh=W8zuggLj2QSx6JBIzg0DPDLdXsNV2HuCzzIW517iS7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=nPN+Iqssg4xjkohaJWTpDhuhswy3je8mpCOtfYErCAHZt+Ob88jVhNMZbCYdwIDf59teolDeckNExBOYD3dwVQPka/gZb08B32EzjHmOPH0aPYKSUVdA/0633vlyZAsskRLvJdXLPQpjbGuuHbM7eutZvKnXvNVNam93qoBxOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDGToRl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDGToRl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70FC2BCB0;
	Sun, 12 Apr 2026 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013539;
	bh=W8zuggLj2QSx6JBIzg0DPDLdXsNV2HuCzzIW517iS7U=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=SDGToRl9HJl3D+WQ0BNrCThKIOoobD5fQ2jkmv3MIlmw3svTJC+odJec5ewJI9+Nv
	 IpCoGr0LWrddwuMuPBMLlAApzHI1ZCt1Kr/OCQ2pmhOjHB7XsqjThTszaSfzxAakUM
	 HR2f9CEB55n9uXfdhlv0Y8Dl7sEVVl30dlzQL9c87VFFOFtE+Y/1b6FM/M5cFmRlpC
	 zaV6I+8atcQV0t3Y4OeLfQgkn77PObyiCq0Jv9lpVH4z6u6Jrpoorv/RlMraSugbgv
	 u1mEdvyMYgDe/DZIbpx8JmvIL7kebXXf+cBd26tfHNDtziWTQEhLnQ0+ZKAdpeynhB
	 Tacol4r6qMfxg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:40 +0100
Subject: [PATCH 4/5] firmware: arm_ffa: Use device node interrupts property
 for IRQ lookup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-4-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0

Use the standard interrupts property from the arm,ffa node instead of
synthesizing a GIC mapping directly.

Requires the "arm,ffa" device node to describe exactly one interrupt,
validate that its affinity spans cpu_possible_mask so the interrupt is
per-CPU, and then cross-check the mapped hwirq against the interrupt
ID returned by FFA_FEATURES.

This removes the FF-A driver's direct arm,gic-v3 lookup and raw
irq_create_of_mapping() usage while still keeping the DT description in
sync with the firmware-reported interrupt.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 53 +++++++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..7a3800a55dc1 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1821,6 +1821,45 @@ static void ffa_sched_recv_irq_work_fn(struct work_struct *work)
 	ffa_notification_info_get();
 }
 
+static int ffa_dt_map_irq(int intid)
+{
+	struct device_node *ffa __free(device_node) = NULL;
+	const struct cpumask *affinity;
+	struct irq_data *irqd;
+	int count, irq;
+
+	ffa = of_find_compatible_node(NULL, NULL, "arm,ffa");
+	if (!ffa)
+		return -ENXIO;
+
+	count = of_irq_count(ffa);
+	if (count <= 0)
+		return count ? count : -ENXIO;
+
+	if (count != 1) {
+		pr_err("FF-A currently supports exactly one interrupt\n");
+		return -EINVAL;
+	}
+
+	affinity = of_irq_get_affinity(ffa, 0);
+	if (!affinity || !cpumask_equal(affinity, cpu_possible_mask)) {
+		pr_err("FF-A currently supports only SGIs/PPIs\n");
+		return -EINVAL;
+	}
+
+	irq = of_irq_get(ffa, 0);
+	if (irq <= 0)
+		return irq ? irq : -ENXIO;
+
+	irqd = irq_get_irq_data(irq);
+	if (!irqd || irqd_to_hwirq(irqd) != intid) {
+		irq_dispose_mapping(irq);
+		return -EINVAL;
+	}
+
+	return irq;
+}
+
 static int ffa_irq_map(u32 id)
 {
 	char *err_str;
@@ -1842,19 +1881,7 @@ static int ffa_irq_map(u32 id)
 	}
 
 	if (acpi_disabled) {
-		struct of_phandle_args oirq = {};
-		struct device_node *gic;
-
-		/* Only GICv3 supported currently with the device tree */
-		gic = of_find_compatible_node(NULL, NULL, "arm,gic-v3");
-		if (!gic)
-			return -ENXIO;
-
-		oirq.np = gic;
-		oirq.args_count = 1;
-		oirq.args[0] = intid;
-		irq = irq_create_of_mapping(&oirq);
-		of_node_put(gic);
+		irq = ffa_dt_map_irq(intid);
 #ifdef CONFIG_ACPI
 	} else {
 		irq = acpi_register_gsi(NULL, intid, ACPI_EDGE_SENSITIVE,

-- 
2.43.0

