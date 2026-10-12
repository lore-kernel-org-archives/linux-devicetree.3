Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63378421255
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831771; cv=none; b=bIVDOAY07nTeHEzLa6QsR9aY5NU/Zy/8WqlpL2Pm5UTAXPIw0o785jRRrrjE1G7+hk23iyUzDhCtSvyrWk67NhcgdVsOD0xMtNYWDcVEx35IokcZ+fuCvnZjg8iD8Q5TC2fUM/GqJR6m13TEdKRyWEX3cJ6jl/0AP5jQTan65g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831771; c=relaxed/simple;
	bh=UVpA8AD0Gyn5+hbqHWxl6qLl2xoAn/CS31SBxbju2AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/VqdC/+tpj+q6YjPOt79Rio0uUWl3zk/VLoWQdry6sKk6va2F+BAVX1FEBlfGEKwuJ5e+OLZ55fQBP/bAl5wqNAkZzUzVKX8clNMHe8OCfmvyYcGjj7R4Fx3J2QgCmg7ujl4TZAwLSRSn03aBZSDSEvhsMgOhBCcXjk2XjfysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=JS8RJEy1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="JS8RJEy1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91986c5cb75so29252706d6.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791831768; x=1792436568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsX5ifbIFiwOB5Fk2usg+ffCVqV4aLQttHMxiozc+Xw=;
        b=JS8RJEy1WooUDM2iPczfpTThXGwudZdzZ1I7ZsdRI837ZeY3pj5U4SxF6oa9a4LYyT
         Z5+W16VW1yHIpmseFf3ndH+7CG1OGMkvheiQW44QlDMO65uPViJr89ShsTdHOI/80uUz
         qan15LLh5EsssIZktSQiMeA2Kc2rhDP/SptwF5D5HeApsM7DmAsxKq8uT8fhJS6sTCyY
         xbZWHInUAedu3O8KfqfnOyLURXSbnIon4NyJE+osteXDNTT5/5CNDBil3YDKByXtu9X5
         U9fvaqdLb2D8x7pBwsdCUpN0IzaaggzHrm/NFHIqYrCKg/tYBIEYaQJFrhqYS0rvcJ25
         lm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831768; x=1792436568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsX5ifbIFiwOB5Fk2usg+ffCVqV4aLQttHMxiozc+Xw=;
        b=D3XQqJnMaxHOwffzFoLpBqF1KSAYuNHi3D7Jxv6E06xcWwu2RzViY27idrBDa0DZjz
         rWDHprEafJ3sOIGggAn78sMTaPccWf3OyPsKMbuEXcZYOuGn0dasJ47WfaQKrboTSUGK
         IMTD9IhO7O3CXWerN0PHF46IjSRCO4DCzhDnMD0Jv5kwwtSsB+oZadHRap6/18BuGEHB
         LhcvuunxtIEyx8IF8LWedyrUtpi5L/U8b/DYH9RKvSoQxaPKk3hrbETLQzgE8h6ekWkF
         8aj3DuuDT/c+8aSh/aJ9gpU3wFH6a+IjmEhkTRPss3FICx0mTMEeSWlKFEcdyQtzb5Xx
         6vFw==
X-Forwarded-Encrypted: i=1; AKwUvBxd/eVYsz9cxBoCqCVnbpwo2X8wnePKbvXEyWxi8NK3oXW8gQmNmkZZ1dlybi8SzpusBABwqswRObiI@vger.kernel.org
X-Gm-Message-State: AFq9FYK+QzrWdgcZe09RoKZuTpUt57iWDkD+pNpIrwL7n0nfNY2ifQDH
	qbC5NlXksj1AUAdVXgOp9cxwRvPVm7Y2/qMYgCa9bcQttbGC3aeTsJ64S1QcYF/DAfLOLM3v06e
	V+BWgSGk=
X-Gm-Gg: AYBFou1IVB9J7qJxkWqRLjgoH7uUHPhPz0L2gWl0FUPEf9Rbdxe/pBMaCn7wjuyyXqb
	6hWQ2478guSAuSQDUMFL/wPYZ74HdM3G6X9obWcQFqQNlSA36D1FAFB6NBGkyrCkeBiaZHjwTNm
	VdbH9Z44NAPazsRju/NOf1syJwzdiA2wHBcX1Nsa4Rkt529H9336Q2LqNz6uGwVv0UBPazzwaSX
	pD4a/uF3kiJXS9tdFJ0wPPvpaQZT3E3yIYtBKcCiHqd21SLyN71yVPU18EyyP2TaMCHXy+R+NYs
	SEuYY22KEYm1ThKapVZ35a3EijTtKUwsJFycPD452p8ufmTKWsQVQNP9auDmMNSQm9ib3y4/gS7
	ZVmKPd4kpyR4dEIib5gLC5GQvGQlYgQ1KQueXOgbfsg+gzQMpiCSg2OKiKNk3bY1IFoYKA0hSeh
	qW1tfTQ8uSzbOsAAqBPWt/ga2efL1u5noIk4L6Kcv7664QCtQrl4pyMyQm3ow5/9BwtJMNW7Yi5
	80=
X-Received: by 2002:a05:6214:4508:b0:91b:82a6:d31f with SMTP id 6a1803df08f44-91b82a6d953mr60928806d6.35.1791831768296;
        Mon, 12 Oct 2026 12:02:48 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm4815216d6.48.2026.10.12.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:02:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: tglx@kernel.org,
	radu@rendec.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] irqchip: add TC9564 support
Date: Mon, 12 Oct 2026 14:02:42 -0500
Message-ID: <20261012190245.3988619-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the "MSIGEN" (MSI generator) interrupt
controller present within the Toshiba TC9564 SoC.  This device
collects interrupts generated within the TC9564 and forwards them
to the host as MSIs.

The TC9564 attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  An embedded PCIe endpoint is
attached to one of these ports, and it implements two PCI functions.
Each PCI function implements an MSIGEN unit.  Access to the registers
used by an MSIGEN is provided by a PCI endpoint bus, which exposes
BAR4 of the PCI function it is associated with.  

					-Alex

Alex Elder (1):
  dt-bindings: interrupt-controller: introduce
    toshiba,tc9564-msigen.yaml

Daniel Thompson (1):
  irqchip: introduce TC9564 SoC MSIGEN support

 .../toshiba,tc9564-msigen.yaml                |  70 ++++++
 MAINTAINERS                                   |   7 +
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-tc9564-msigen.c           | 203 ++++++++++++++++++
 5 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/toshiba,tc9564-msigen.yaml
 create mode 100644 drivers/irqchip/irq-tc9564-msigen.c


base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
-- 
2.53.0

