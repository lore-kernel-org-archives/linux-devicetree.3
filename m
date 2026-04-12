Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A74310784;
	Sun, 12 Apr 2026 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776013536; cv=none; b=m0INBz8LhNhttz4iA0TY6gcXU6yKpt9fq5ZcLE9FVl5Ycw1m54uOK06r4ujLiPh+Pb8IMtAmiyP2DKUJoXCAK4HuNpAobnu7IflWxR391MmnlVPBgSnJ7AvEewmtMkgtogH+vxLhkVT6QX3o3EiXZv2LgF9nn7w9FRXfjMDQyTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776013536; c=relaxed/simple;
	bh=OyYhkCOzrlRJO5g72u18UBvcrbV1IuXqg8djuqcBMYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=uDNVPiaOu7wihPCnQqazaY5CceSyK/jvHroVFJ7hXPI94vqE/RMOuZv9s2j4Hyy17OdSIrW/pDiuSV6qlSzuGPNZ3dF+8lURGrb9IwIYPbMqsgK7//I7UIDsWLHOscXf+LA/iaegVwPLjHEFlgCjGLZRnPYbBd9vvnyJiDjRjmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z13nwc5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z13nwc5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B824CC2BCB0;
	Sun, 12 Apr 2026 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013536;
	bh=OyYhkCOzrlRJO5g72u18UBvcrbV1IuXqg8djuqcBMYw=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=Z13nwc5qjjYT80p/eSN+DKekQnWxwRaHt42gGr9DhvCL2rsdFjrhY/O6k+Zb5SOCl
	 aUT41FCudjo3kdd3gOdoxi9CnHIfWhnk5nv0peKDWQypQfTYGk77GEFZ+WQGVsAu0z
	 GIpVX7B8A+7KJw0ZZftDD5Ak7UOx+6gl8dZLeMAgGKIKTqI0vv1xUUB2rW5ga/pi3Y
	 e+08CMOxlkt04/uYjyf+W4PO+IH7Ddq+gbEYyaOocqx6LCugZZPeF2qMvDyiewmYtw
	 CNLLhQoPyfdkWNec0t8aOYKX+6L+jFW3MyL2fIlYNS1gvXIZywpjr6EK6S0n1L33h2
	 GeJArqzDzHBEA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:38 +0100
Subject: [PATCH 2/5] irqchip/gic-v3: Support secure-donated non-secure SGIs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-2-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0

Parse secure-donated SGI ranges from the firmware, reject invalid
interrupt specifiers, and allow devicetree consumers to map only the
SGIs explicitly donated by the secure side to non-secure software.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 86 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab2..cc7720d9fb0e 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -35,6 +35,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
@@ -65,6 +67,7 @@ struct gic_chip_data {
 	u64			flags;
 	bool			has_rss;
 	unsigned int		ppi_nr;
+	u16			donated_sgi_mask;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
 };
@@ -95,6 +98,7 @@ static bool nmi_support_forbidden;
  * with hwirq IDs, is simplified by accounting for all 16.
  */
 #define SGI_NR		16
+#define GIC_SGI_IPI_NR	8
 
 /*
  * The behaviours of RPR and PMR registers differ depending on the value of
@@ -119,6 +123,74 @@ static bool nmi_support_forbidden;
  */
 static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
 
+static bool gic_sgi_is_donated_to_ns(unsigned int sgi)
+{
+	return sgi < SGI_NR && (gic_data.donated_sgi_mask & BIT(sgi));
+}
+
+static int __init gic_of_init_donated_sgi_ranges(struct device_node *node)
+{
+	const char *propname = "arm,secure-donated-ns-sgi-ranges";
+	int count, i;
+	u32 *ranges;
+	u16 mask = 0;
+
+	count = of_property_count_u32_elems(node, propname);
+	if (count < 0) {
+		if (count == -EINVAL)
+			return 0;
+
+		pr_err("%pOF: unable to read %s\n", node, propname);
+		return count;
+	}
+
+	if (!count)
+		return 0;
+
+	if (count % 2) {
+		pr_err("%pOF: %s must contain <sgi span> pairs\n",
+		       node, propname);
+		return -EINVAL;
+	}
+
+	ranges = kcalloc(count, sizeof(*ranges), GFP_KERNEL);
+	if (!ranges)
+		return -ENOMEM;
+
+	if (of_property_read_u32_array(node, propname, ranges, count)) {
+		pr_err("%pOF: unable to read %s\n", node, propname);
+		kfree(ranges);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < count; i += 2) {
+		u32 sgi = ranges[i];
+		u32 span = ranges[i + 1];
+		u32 end;
+
+		if (sgi < GIC_SGI_IPI_NR || sgi >= SGI_NR || !span || span > 8) {
+			pr_err("%pOF: invalid SGI range <%u %u> in %s\n",
+			       node, sgi, span, propname);
+			kfree(ranges);
+			return -EINVAL;
+		}
+
+		end = sgi + span;
+		if (end > SGI_NR) {
+			pr_err("%pOF: SGI range <%u %u> exceeds SGI space in %s\n",
+			       node, sgi, span, propname);
+			kfree(ranges);
+			return -EINVAL;
+		}
+
+		mask |= GENMASK(end - 1, sgi);
+	}
+
+	kfree(ranges);
+	gic_data.donated_sgi_mask = mask;
+	return 0;
+}
+
 static u32 gic_get_pribits(void)
 {
 	u32 pribits;
@@ -1614,6 +1686,12 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 		case 3:			/* EPPI */
 			*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
 			break;
+		case GIC_SGI:		/* SGI */
+			if (!gic_sgi_is_donated_to_ns(fwspec->param[1]))
+				return -EINVAL;
+
+			*hwirq = fwspec->param[1];
+			break;
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
 			*hwirq = fwspec->param[1];
 			break;
@@ -1623,6 +1701,10 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
 
+		if (fwspec->param[0] == GIC_SGI &&
+		    *type != IRQ_TYPE_EDGE_RISING)
+			return -EINVAL;
+
 		/*
 		 * Make it clear that broken DTs are... broken.
 		 */
@@ -2239,6 +2321,10 @@ static int __init gic_of_init(struct device_node *node, struct device_node *pare
 
 	gic_enable_of_quirks(node, gic_quirks, &gic_data);
 
+	err = gic_of_init_donated_sgi_ranges(node);
+	if (err)
+		goto out_unmap_rdist;
+
 	err = gic_init_bases(dist_phys_base, dist_base, rdist_regs,
 			     nr_redist_regions, redist_stride, &node->fwnode);
 	if (err)

-- 
2.43.0

