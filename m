Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793913857;
	b=DsMHoSHyBd0OkLmH/iYb++9+hb0aWcJRDiNHoe9hZZHb4zOYjtxNHcfN8FFKH+ssJBDu
	 NvIgXWKDhc0h0P9DOkXIis2T01zz+3PSUneQZ4CHykhtnoleyV3c2ZHXCTRXrgSnZF6bA
	 a8GVacEWeSIjNS/EJYn1Q6vpRwZ2vwyLqzqoyTYH4xEfCrF1pKzZjLC0HnrzNW26f460y
	 /2lONd9pCzcu5Xl1Rgn1jxHrRcMVbfKFDJ2SVNEWRukcU5JQrThtkTsHD8mQLSL2ehpqX
	 ai2A/bFnSfxCX8TkjqUDT4DKllwlv/dhJKt4K7Bbw+2wDHmn8U2WGDUeX6KpmfvVLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793913857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
	b=ZG/K9BMrdzt8fLd/FXq4cmmO78v6010nygCAb/TCDx01NkyzPsHBZ9tmvZT2MLwigtO8
	 U2mQ4QHW++dL7VQhca/MUuYbDjcYoCCrZ/7xBBlbsx5hHWs94fdjU+R2x84amHR6UpUAP
	 yjhOujp/8lpzbrGTvgWaRcw+udgY6lQoO/gbjxe0/MzPSxcq4/ORWoWCs2zolkCtDjlio
	 kmre48RL25qzlXqfiriNv8rMaGB8zjztnkKAFg1c/LKYf/YnlWL4NRrwwAVyY8sNsY+oA
	 rWtOLDsye/eny6Xfs69TFghA5rMlBGmC//f8Q/oKXCL0gCuv6WDOzHJ5GcCLO8lBg1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fKiUei81;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04704606A332
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04704606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=fKiUei81
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843cf077f10so50531a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1793913856; x=1794518656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
        b=fKiUei81luLqDunXx0uXFyfzq9l+RZI+4d7jsR6KRIGot9KXcyMSJK2FTExt6HmKcc
         XntdaeBJc1d6fqQJnymjqu8PKa8fc4nYa4fqG7eX/JsMdNMlJnBVy852Gh8q62ybyEOb
         mZVzq9KFeNtxxmgR8LbklUU+QhZ8ilj9czecGgSv+H09YZU9A32RfbQqILHXzIh4e9dh
         5dR32UkV6vDAqKEp9NyMk9BcmFHAH2R3cEK5NXPu0IIf8stJlAoD184ByPZS/ZR04p4Q
         VKvSyERo5fEQrYpfPL59OccEBoQY79qRWWj6eXQqoBCRb04YtKG9ffKtcUyypXJntSkr
         schQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913856; x=1794518656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXM9i0x2nDS9j+rZWPBPawv/gGcnm2DhRQRnMf6xoMc=;
        b=XlcsP0QN/n0TSZ2c/5VSzGmwVTIPi52y0N1qYhDy5+sUkXRlDaivTnPiSohzngSHAf
         CWQDzXTOxQSU+0W3qfMa4xN5OC/1bsZ9k3jMJLMh2ZNwYlEgdSf5Yw+dCYcvSNpmBbaQ
         V5qkE3PLdGryKMl2eWALswdLtoBdq6pUC05tW+cZEYTEbaSSptRsgmA4680gu6WgpJSn
         3RyT3aV5LIahc1JSvAPQvvJjH36jkg34VZQHRXu4hWIuQa/tRj8m1CZ7T2sv359hw8nH
         TYW9W8hJ07hdIbWaLFikHkTW9R+vKbXN5pXHdh4Hkd70npsutwaUZ0ZfX88bJQ8AZ1Hx
         Qguw==
X-Forwarded-Encrypted: i=1; AKwUvBxX3ANErNhUckvrzsAn+DljNb6HQgCeeKmvikbhUSIMwfKdq2vrHvYn62nhiq7ckGBZDwSpgPT7rMdB@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ju4s9FfiqmoE+uXknpiC5W2UD/9vnKB4SeSE71CeIQ0v1So2n
	EJd+OtZvsT1Hrl1Bb5kFUkqGRa1Oo0sbJDC70sedlJZ4hmBE4+NZzlxAezJ2VjuYNqw=
X-Gm-Gg: AYBFou1i9wi8KUSKGWZYvxpqiXNUqb046wvyMkJJ1HCdqQ70p8T8otoBcpea53zS0cp
	2klr/KZIoVg7ouKP0MgzXqFppCjL6ft1q34jRjcsvHkHWHZQ7wC1rMVRw919F0CCrlTB5Zuh35A
	R/D4nMjZgk8jyUz4ulGoKGFr3AMQLFbvXvt9XmssC4Uh7F6vlPDr4Byb9PZN4tom7o97hD1qRsA
	4Sh1q0INPXHNkbVS1zdhGA4dvSKVHLrYwCd0+jX3U0I9v6bwRxwTccK6AcbxAtHr74VT3HVEsOL
	M4AIrF83WpI59jBf8YE3yI+peQj9Jvnree9pv/IvzCwanlQoQQF3PeFlyBxPbJUW2pD2kXUdCOs
	9IPixqemcGFLMEpjk+wfVsTc1vxLfTOXAjWNikRo3aa+2EVZ29C8jjaybHSDGOlnEYnwy5VUoB6
	kGM0LWuIXFIFIErn81CSCEqwlPAJYJ526S5kRRjWjj24wiCROSmDkqbtCh+sbaQjV+sTsdDYX0U
	6amiBTQZi0ym7nTw0/9zwTSx6/UZBxjxE5IhuPPqPlwV1DLwiJkCj9UMzi/KsI2yXCKZ3i1EIEQ
	T9ep8TL06WMTdjWCt3o1VoDN0fzcIV4vzQ==
X-Received: by 2002:a05:6808:14c6:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-567e105f241mr438912b6e.29.1793913855869;
        Thu, 05 Nov 2026 13:24:15 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm5349897b6e.3.2026.11.05.13.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:24:15 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@google.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] PCI: of: update endpoint ranges dynamically
Date: Thu,  5 Nov 2026 15:24:10 -0600
Message-ID: <20261105212412.591931-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a bug in PCI devicetree handling code.

If a PCI endpoint function is represented in devicetree, and it
implements a PCI endpoint bus, its ranges property must be created
dynamically.  This is because the PCI function's BAR addresses are
assigned during PCI enumeration, and a static ranges property cannot
assume a particular static BAR address matches what was assigned.

The solution is to dynamically generate a ranges property for PCI
functions defined in devicetree that implement a PCI endpoint bus.

					-Alex

Note: this series depends on the patch "PCI: of: drop the reg_num
argument to of_pci_set_address()" found in this series:
  https://lore.kernel.org/lkml/20261105153801.435566-5-elder@riscstar.com/

The entire series (based on v7.4-rc1 and including that series as
prerequisite) is available here:
  https://github.com/riscstar/linux/tree/outgoing/dynamic_ranges-v4

Version 3 is available here:
  https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/

Between version 3 and version 4:
- Dramatically simplified the description in this cover letter.  See
  earlier versions for a more lengthy explanation.
- Dropped the first patch, which allowed a null pointer for the flags
  argument to of_pci_get_addr_flags().  This wasn't really necessary
  and didn't really add value.
- Indicated clearly that Andrea della Porta has tested this series on
  the Raspberry Pi 5, which uses PCI endpoint bus for its RP1 chip.
  The current statically-defined ranges property works for this system,
  and when the necessary PCI quirk is enabled, the dynamically generated
  ranges property works correctly as well.

Between version 2 and version 3:
- The ranges property for a PCI endpoint with an existing devicetree node
  is only updated if its ranges property has an empty value (i.e., it is
  "ranges;", or is not defined)

Version 2 is available here:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 1 and version 2:
- Included the first patch (which was previously posted in a different
  series)
- Modified the last patch so the ranges property is updated only for
  PCI endpoints having at least one "pci-ep-bus" node
- Rebased on v7.3-rc2 (and the prerequisite series)

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813220717.1394644-1-elder@riscstar.com/



Alex Elder (2):
  PCI: of: introduce of_pci_build_prop_ranges()
  PCI: of: introduce of_pci_update_endpoint_node_ranges()

 drivers/pci/of.c          |  97 ++++++++++++++++++++++++++---
 drivers/pci/of_property.c | 126 +++++++++++++++++++++++++-------------
 drivers/pci/pci.h         |   1 +
 3 files changed, 173 insertions(+), 51 deletions(-)


base-commit: 8c786803613eb0d3352417509611d1db877c65af
-- 
2.53.0

