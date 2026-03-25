Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17D434A3AC
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466697; cv=none; b=IFzs02DrVXgJdBeBaEe+kaBPPCl0v4KCyfsWSOpbY6gGLJk6xwiRmIjdHbIZ3WlUGiXXEv3GXuYSGx2fkEnF+RCSHdT79DAv5lOEwFH0WbavDjSKv5vGvgdBoDQfgJc92yKENX52nrS2AfqqkBPYonwanjQI4+vdry95VUurxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466697; c=relaxed/simple;
	bh=VbqBtIe2JkzltHurJdvmEzwt6bh5/sPk47WfnAxxcAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0YzR5y3r+XC15HXPoByR4cNhYF4WJil4RP7rcaVwRKpZYXYd8hIdzsIT+8Ij3kwhL/z+Q73qAwZlsjtGe0zGdHuI++kau/h5d9ZHID3lShtppJY5wjRE64138PBXkF4U+4A5tcwT+eZM6uB6U+1DJ97SInNZMgMBCrHkY/EMFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL/d57Za; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL/d57Za"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486507134e4so2887335e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466694; x=1775071494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wv2eGtbacvBrapR1sRFeEUHNUf8aZYxNpSAbuo4Z8W4=;
        b=jL/d57ZaaVqEaeqqUvaCWL0+b7vHfxIAcChnEPHBnkv6KWoqogJ0LT7mi7veT4MUGq
         ZPWmQKI5oASkuN7ggzBZ+tHX8nO8/SdKlooPE6S00O2/g9MGpY2QXGaM2TT2AzgpulVB
         /CQH+dGkxsNDA+tdHrBqnur5lfGCW5JC6dNsPZp+ceohK5e8mzSuEqajcbkSRSEEjgck
         llDPng+P4DbWwnmvLPTKe1AJPhuYQ6JJB33M3/2dHmuDUCRq8EojZHJBJI3AGQKnfxZ+
         QwIaeGyWw+/biKqg8Zn/vsj33NNW3NQ4oXyhOHEUFWePbNpZRgqwboPD3qX8ZYqXZEeE
         o3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466694; x=1775071494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv2eGtbacvBrapR1sRFeEUHNUf8aZYxNpSAbuo4Z8W4=;
        b=cpvjppU4msGxndaxj6V+CyhwSE2GAI+4v6P01D4laQjrZF2FPRYei3gj2gsDeR04F7
         XkXJ4aTADJ3ViqQAd7cbNqx2X4uB/Gv9x7PqOeg99KAk7DfmZk37EMEnlwhp0T17cdvf
         G8pY9SA2tTzalZiLV6VY5sZssSUZntGVSYfV9Vz0O116krxIKtOMORoXB1BN+mPu7knq
         9BflHNpeUNsRD4ynZgbOKRFbtZihcuXG8BoOI0cyv8W6E8HakmvRCPzJAE6TEH6iyKnF
         wkO/G19aQgodfYsoEdMLd0OkRWawdU8sQMIi2Hm5vQ8lvTHmiJnd2O4RqsIlAEXSBDzb
         j/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXabZyGXMMMY4cRr2C7ihaUPwGmbQLuewU8xfUSZnmgmirX//KuvJBkWWnDBhd+k6njnirQ1oKGg16Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hs/ChJMBuwVzk+4JQ1N7vibwYn6IHtIFt17DhrOu4QsSpTQ9
	XZbAo0aQD5+DGHl4kKr04yJAoOiWBkha+QuX43K5FejJwuEfATD4hxTh
X-Gm-Gg: ATEYQzxK4mxLikma3n4nijdUiyhiRDCl1EiTFhoy4/kyoajgmNOewrMMcitgZKUsO5p
	VuUc/9sMQ8nJ+lzQVlNdgD/8+lhsKI70jXiexTxFHcPzhVK8Jlqvc1WQ5Pav7sKgv65vo/nUI8e
	vHb7G9YqD6Bdy7b4WWK5kwAqgM0a0STwaDVZsgEpzVlfojcX0Sph5oQJGUFDtmAZ1rlqPc4RnH4
	BZCTC6C4xGbRn1xVklsCy+iuor1OL0K42XoZFVO1YclbcWku3uKxE+7WmaqTbgZdt5L1wnWblFZ
	utKExY2Gk65CmEW5SgjpGTtj4AkmTY1xEG5agULxgqaOhMgidC9IkaCkStm3vCjsVqgIbdXCa7l
	yWvMXEA2+BIRFuvt1PBmOaj15zWtlVR+teLkhfiY0mWVq/lg43ZogWi+iBYM46sJ52e+2/w+vZQ
	q3pQ5S5XIqPDy4eA/XyDCFvia461o453YPezAtBY3kAlALa3h9
X-Received: by 2002:a05:600c:8283:b0:485:3a22:69b9 with SMTP id 5b1f17b1804b1-48716099758mr67938595e9.29.1774466694017;
        Wed, 25 Mar 2026 12:24:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:24:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 00/16] Add RZ/G3L IRQC support
Date: Wed, 25 Mar 2026 19:24:15 +0000
Message-ID: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The IRQC block on RZ/G3L SoC is almost identical to one found on the
RZ/G3S SoC with the difference like it support more external interrupts,
GPT error Interrupts and also has additional registers for GPT/MTU
interrupt selection, shared interrupt selection between external interrupt
and TINT.

It has 16 external interrupts of which 8 interrupts are shared with
TINT[24:31] and are mutually exclusive. The external IRQ/TINT interrupt
selection is based on a register in the ICU block.

Ref:
  v6: https://lore.kernel.org/all/20260322122421.132474-1-biju.das.jz@bp.renesas.com/
  v5: https://lore.kernel.org/all/20260311192459.609064-1-biju.das.jz@bp.renesas.com/
  v4: https://lore.kernel.org/all/20260227140316.308106-1-biju.das.jz@bp.renesas.com/
  v3: https://lore.kernel.org/all/20260206111658.231934-1-biju.das.jz@bp.renesas.com/
  v2: https://lore.kernel.org/all/20260204180632.249139-1-biju.das.jz@bp.renesas.com/
  v1: https://lore.kernel.org/all/20260204142320.103184-1-biju.das.jz@bp.renesas.com/
v6->v7:
 * Added a patch to fix error path in irq_domain_create_hierarchy()
 * Replaced variable type of iitseln, sense, tmp in rzg2l_irq_set_type()
   to unsigned int.
 * Replaced rzg2l_irq_*and_get_irq_num()->rzg2l_irqc_*and_get_irq_num().
 * Replaced raw_spinlock->raw_spinlock_irqsave in rzg2l_irqc_set_inttsel()
   to avoid possible dead lock with the consumer driver probe and eoi
   handler executing on the same cpu.
 * Updated error handling paths in rzg2l_irqc_alloc()
 * Added missing colon reported by the bot for 'struct member 'used_irqs'
   not described in 'rzg2l_irqc_priv'.
v5->v6:
 * Collected tag for binding patch#2
 * Updated commit description for patch#5,#7,#8,#9,#12and#15
 * Simplified rzg2l_irqc_{irq,tint}_eoi() by replacing raw_spin_lock
   locking/unlocking with scoped_guard().
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_irqc_irq_enable() as these variables are used
   only for calculation.
 * Simplified rzfive_irqc_irq_enable() by replacing raw_spin_lock
   locking/unlocking with guard().
 * Simplified rzfive_{irq,tint}_endisable by replacing raw_spin_lock
   locking/unlocking with guard().
 * Updated the variable type of offset, tssr_offset, and tssr_index to
   unsigned int, in rzfive_tint_endisable() as these variables are used
   only for calculation.
 * Dropped stray newline in rzfive_tint_endisable().
 * Simplified rzfive_irqc_{irq,tint}_{mask,unmask}() by replacing
   raw_spin_lock locking/unlocking with scoped_guard().
 * Updated the variable type of titseln, tssr_offset, tssr_index, index,
   and sense to unsigned int, in rzg2l_tint_set_edge() as these variables
   are used only for calculation.
 * Switched to using irq_domain_ops::{alloc,free} callbacks for mutual
   exclusion between external interrupts and GPIO interrupts as using
   irq_{request,release}_resources() leading to irq storm()
 * Dropped irq_{request,release}_resources().
 * Replaced the macro TINTSEL->INTTSEL_TINTSEL
 * Added macros INTTSEL_TINTSEL_START, IRQC_SHARED_IRQ_COUNT and
   IRQC_IRQ_SHARED_START.
 * Added used_irqs bitmap to struct rzg2l_irqc_priv to track allocation
   state of shared_interrupt
 * Added rzg2l_irqc_set_inttsel() for configuring INTTSEL register.
 * Replaced irq_domain_free_irqs_common()->rzg2l_irqc_free() as 
   rzg2l_irqc_domain_ops::free() callback.
 * Replaced the 8->IRQC_SHARED_IRQ_COUNT in shared_irq_cnt varaible as
   the same macro used in bitmap.
v4->v5:
 * Added support for separate interrupt chips so that the decision is made
   at setup time and not at every interrupt delivery in the hotpath.
 * Dropped the hw_irq range check involving info.{num_irq,tint_start,
   irq_count}
 * Updated rzg3l_irqc_probe() for supporting separate interrupt chips.
 * Added callback irq_{request,release}_resources() to both irq and tint
   interrupt chips.
 * Dropped SoC dtsi patch from this series, will post later.
v3->v4:
 * Collected tag from Rob for binding patch#1
 * Updated commit description for binding patch#{1,2}.
 * Updated commit header for patch#3
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
 * Updated commit description IRQs->interrupts in patch#4
 * Replaced the variable type for num_irq in struct rzg2l_hw_info from
   u8->unsigned int
 * Replaced the pointer variable info from irqc_priv and instead embed a
   struct hwinfo into irqc_priv and copy the data into it at probe time.
 * Replaced the check 'hwirq > (priv->info->num_irq - 1)' with
   hwirq >= priv->info.num_irq
 * Updated commit description 'this differences->this difference' in
   patch#5.
 * Updated tint_start variable type from u8-> unsigned int.
 * Updated commit description IRQs->interrupts in patch#6.
 * Updated variable type of irq_count from u8->unsigned int.
 * Updated commit description IRQs->interrupts in patch#7.
 * Updated rzg2l_disable_tint_and_set_tint_source() for making
   tint assignment very clear in the code.
 * Formatted rzg3l_tssel_lut as table format.
 * Updated commit header irq->interrupt in patch#8.
 * Updated commit description IRQs->interrupts.
 * Updated shared_irq_cnt variable type from u8->unsigned int.
v2->v3:
 * Dropped items and instead used enum for single compatible values
 * Add minItems for interrupts and interrupt-names properties of 
   the RZ/{G2L,G2UL,Five,V2L} SoCs
 * Replaced maxItems->minItems for interrupts and interrupt-names
   properties of the RZ/G3L SoC.
v1->v2:
 * Simplified the binding by using pattern for intterrupt-names
 * Fixed the binding warnings reported by bot.

Biju Das (16):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Use pattern for
    interrupt-names
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G3L
    SoC
  irqchip/renesas-rzg2l: Fix error path in irq_domain_create_hierarchy()
  irqchip/renesas-rzg2l: Drop redundant IRQC_TINT_START check in
    rzg2l_irqc_alloc()
  irqchip/renesas-rzg2l: Replace single irq_chip with per-region
    irq_chip instances
  irqchip/renesas-rzg2l: Split EOI handler into separate IRQ and TINT
    functions
  irqchip/renesas-rzg2l: Split set_type handler into separate IRQ and
    TINT functions
  irqchip/renesas-rzg2l: Replace rzg2l_irqc_irq_{enable,disable} with
    TINT-specific handlers
  irqchip/renesas-rzg2l: Split rzfive_tint_irq_endisable() into separate
    IRQ and TINT helpers
  irqchip/renesas-rzg2l: Split rzfive_irqc_{mask,unmask} into separate
    IRQ and TINT handlers
  irqchip/renesas-rzg2l: Dynamically allocate fwspec array
  irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
  irqchip/renesas-rzg2l: Drop IRQC_TINT_START macro
  irqchip/renesas-rzg2l: Drop IRQC_IRQ_COUNT macro
  irqchip/renesas-rzg2l: Add RZ/G3L support
  irqchip/renesas-rzg2l: Add shared interrupt support

 .../renesas,rzg2l-irqc.yaml                   | 157 ++----
 drivers/irqchip/irq-renesas-rzg2l.c           | 481 ++++++++++++++----
 2 files changed, 427 insertions(+), 211 deletions(-)

-- 
2.43.0

