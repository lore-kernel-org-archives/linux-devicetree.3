Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E60F47F2DE
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584063; cv=none; b=m5D6rZE3BvxFSdAvUPARdwLuplUbXlP0kpwc/66MgeHZSFKXJFBe67oYTgF4nmUQBox6VbYFUfj26j5ixyqIurClI03HkAcOekJ3NVkwn6JxudVjXnvuGFOZYE0En9FhW7C5WPmNl2VSkvpdaB2+vqDireESDewP6aRy7hCjFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584063; c=relaxed/simple;
	bh=FW93FRmeSezchCnYAfZ6M7ZWMShNc662kVxaj2Qby6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3nh857gvaOjozmmRvBSG5FbK+Gcy7sfKJMbKHCWQBGdXiuJXwdkfYRDurCoaABva2TwtWb72eW4zQYkgM7Ru3gBkHdKiQi4nvqdLxItqbvkx9UEln1rRLwKoHRf02oqMK08Niq1IxYe+9pVDKhpBtpbLgkfzy6UnFp7Vk/yERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHw39UuI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHw39UuI"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so581968b3a.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780584062; x=1781188862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+magj2UORCz/X4UOoPUbqQLTIbOP3hI3F42RQJtIeyE=;
        b=hHw39UuIw7g0nqUOGtXfnkwnzjsx6NPBatSWjC+mJGrcqd/4iC90l01zYAp5Adm877
         9KUcbdo/K9VPsWhd84xt4vaMB2Cu2Z64fsFIz3dqhwJ38ulgg7toRWgMd72AzfDeobMM
         0VXXpBmV3HGC/VT+EngacN0fGGeUNQ8FtiFVU2AhucRVVKEELM+kewmPe+RoM4GOOLRj
         1YZmzY8qSAU4G2qf3mXRhOn/4Ag7/Do4nXyca5kW7EqxTFVtRD1KTBDho/JDkj86z4nu
         ULPb0h38SxGEEEAi973TtuOnmgAY0BUwb94g5OSCeGWynZZx4rdip6vGBboYfX1Pvu0Z
         kjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780584062; x=1781188862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+magj2UORCz/X4UOoPUbqQLTIbOP3hI3F42RQJtIeyE=;
        b=J/+GMxS3BSf5hWplRfB3OYu6/S4E/28Q8UCcKullMjcCL4qhI1+19VZ8uhkAXjGXpY
         Fjf+fFnpFIOXOIECHXFQ+swyXIUqeiT0Pp4qJpHwQmGQ1FsQ1D3hpO5nGcqc1VLBkkpO
         /2arbMTW2QCLv+Ohj8NkR/Ugd1VsnGWfw8VNZ2zezjVuJhsemgKBp/O1yL7MKoUts47i
         X252XMRt7GiM1FsLxhJkvOLlhW6/vtZzAmRlJLe1Rt1LagnxhKBQtmSi2rB2Thpoi1Sa
         g6D8kncpwRX2JpdPsJTbFTGKj+Gfuj6DIfo6XUHWUacJY8J6+jg1Vzhy8TX9ajp+O7aC
         QI/w==
X-Forwarded-Encrypted: i=1; AFNElJ93GzTrA8YWFvxkt5/tyY2ObYfiBOfHVxE9Zpx/RJi9P5oYmlblIik22BY0d5uXM9DM6mlW7NaqAc7E@vger.kernel.org
X-Gm-Message-State: AOJu0YxgGDnkQbo9XLhleycVXqb7tGGJWxfQscY/OgIQ72VNt9F9Fh4w
	lj/9y4BQ4E5HTDwNyWOL3FChMY7c3Tsv5qOBpS8ZMXcUb74CB0sy3VBg
X-Gm-Gg: Acq92OG10ic2mUr+F5xZslrZrE/qGvOwQByn6ywvdMrBV5uwRsXBeSfu2I2qU9LVXFD
	NiRUP0RgUgqovjix/qM0K/HcR0SVLUC/ayZgma4sWxU3X6AvgBnmXXRU/5kYUIYO+KXKDwBVsUi
	tLrrB3M5uPVMGTmnc2hvAOsw5RnxRX/RbaLTPXoR54kYmtqqRtzJSywPppgamgR6bJuXk98CEg7
	vVRdvhYncGHWpOTCHNJDSv58KPiKte/4aKgUmDKQSAoOOE8uh5Qiz2TPXNo8u8WWzjKqAba4LvV
	b3DMnUJEKLFF7kUU6D6h2YRM/fZKxdz+fVKTk61+YhT3ReU6E/WuR4DdPRVNh23cpyjHNxgXenj
	DxgJ34miX96jZi/4Hj1LdzFASjsF5i8ZW8P2GZkSlLp4Z1a3dINYTPKuzW86xDEqfNVvrVOBINe
	JatCj96A/+c4qKCSbXrhNzciVCUnxPru047Oq4rg4PadZhHfOkxZE8fInLdioOHDJS6DYxsVHhg
	PavOxugkx3MmRvgaMo6dW7lv7H+SdXcVhf4Py6UZif8H1qavEljmAc0xzAL1Ng2
X-Received: by 2002:a05:6a00:ab8f:b0:83f:a040:a3d3 with SMTP id d2e1a72fcca58-84284efdd84mr8087893b3a.43.1780584061653;
        Thu, 04 Jun 2026 07:41:01 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372868sm7279753b3a.17.2026.06.04.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:41:01 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Fri,  5 Jun 2026 00:09:48 +0930
Message-ID: <20260604143957.668047-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604143957.668047-1-joel@jms.id.au>
References: <20260604143957.668047-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3

