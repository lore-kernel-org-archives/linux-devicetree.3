Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C783224B05
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121224; cv=none; b=gCVe3L90QEsr1vyCWXyDeJt+Eby0Lm7VoIWGYHyU2+/uuKlXT9zgWKHkpqngZf1knhdUXTxCYxdnNibJqtzyfcwDonx0YYzC378QNwMca9DLO+KKb/OF+VwFZMJQRSz9TQ7hnKT79/3Rec3fZZEjuh9WggzA7ValCywegHjbYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121224; c=relaxed/simple;
	bh=szwVb7ha6bAIomsunYV5j5o9HMUkT6Mku/1VrKH1sas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJSqtjZq8nLLf+sgcF0FO8dEQ0aBq2YkanKSUYJ75JKb91j0CXDTUT6ng+Q4+AnN4jh4V3d5YBchMwx4Jyq0PBTPR3Nh8X6ZouzfCF0i/oS62YJ5RxIEZBKI7f3exUA9H2GvdsQVyL+UJRSRFD9W0u443otWLBe/U+eEEOFdAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVWLvW7B; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVWLvW7B"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7b4ee3a88e1so20214577b3.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779121216; x=1779726016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Urn1ATBBB6xhhKW9jeomFsTgrcuoAc20SB+ogv/eOw=;
        b=GVWLvW7BCeg7eTLRlKpWq+4UBVGXVwf22K4mpRz/WQvHpF+92ob05Eqev4p6UlXnIq
         ubX9Hc+eHSOC1zqXLnEn8PNJX1ew5xHVDKzK/z3ZxUHSec+8yo577vZWVgsCEa7oRDZg
         jb+YzzPhX5VXUac8l0JlzY3psarXh4qZVOm9+Ffcp3P71hM7D0plp8T5ritm7TCtwRI8
         +NSOcZZ+SNu88fj1vIa6lxvDkTCS2XZGFFw84ZhXjIaD8QygxbBumsMtq0TSaFJTgPN9
         H/ukRWfqTYg5MLbGC/I6f9xz4gGokeCEezL8WKBDMUjZ9R4FD9WMWmdlaoqoVueS+4At
         ppJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121216; x=1779726016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Urn1ATBBB6xhhKW9jeomFsTgrcuoAc20SB+ogv/eOw=;
        b=P9/VWROppjNewdMzgpr2TFIFE6/GJU2jC7Yq+rEby0Z53acGiGjPv6pFOmmuS3zl1P
         mC4m5blKVX2+1dI9FJpRCG6vSqJy/MF+n4HEoUw/Rp3/64dOJ5e9lp9IAfwhHwu3ps/Y
         HKb2A16LKCbMsJJ5rzGMJjV64JKD0Oig2eLHd4RKMH/YXUsOPVd3EXR28W5HiV4BCQV4
         xsdp6kF87hy/m9t6nnWKcjTYGQoAb4NntaPqm0ZonFAkjVmN3XZXufChznbwuZw8iWM+
         kY6MYSxZOgtQszXIdj9+D4ARt1sd9k2wPm+GeBtjLzQSc9s+AG2v/9IvxND3P8CA4oDw
         cCww==
X-Forwarded-Encrypted: i=1; AFNElJ/UXA/+HwjCuLwCfvVPW4UHsYmGkDXZIPWCNL3UaY0xeJrVosVXqAsjqyUTXC1i83gUqZIin8IDWQSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy93x1qjUvGTGLa9JpUrJRl5e5zKFhWKCqfssqdnofWJ5DL9vJg
	p6eEv0iXvNdrN/Ft2pnYRZ9eoNT2tev0ax++wFd8GfNAqhNF0Oy2TQW+
X-Gm-Gg: Acq92OHMfylpVCkPGXiglFAOjx0DhqNxSzEMlmItENOaBPI/8N5+zZEEShjlLAzpVJy
	X8ZlTYtCg/Uy609fDz26+B4483xb58FB3UCQW/DFsA5iQXJZ1Qw5ZBeWTajYk9l4zxzsZY+NQbc
	BLY95F+9uTs7f8GN18Ui+xFfU5PTZdGZ91gkdWh+cn8E0LeWCCDTJPexpBR0Rhh3t+3j4P50Kqy
	iiTh1/wgJpMnr2TxlbS4mo8V7JkHP49XHHXDq9GcjMiusD4s/0H3vTRZ6ssdW2VuHXpbooav0/8
	fjCEbZnMd4IVxg9K/UVW9PmawuQ7f/+df/vqrlh5FfULEed3c+D4jmn0EgFXCpXAX+zoLQxhcZ8
	1Z4bkM3UGFbpZFUAAuxd9scvT72m6aMdLGHUFtnrmIaA/mI/cRSoeFRe5iSVYHeUbJhEGmdMxdh
	4jDfbGETpaAEdhIt6k+eNhRz+8Acq3T10yljTv5u0pNg==
X-Received: by 2002:a05:690e:1589:20b0:64a:ce9a:ace2 with SMTP id 956f58d0204a3-65e228a2c9amr13014197d50.56.1779121215879;
        Mon, 18 May 2026 09:20:15 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db60379sm6596021d50.14.2026.05.18.09.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:20:15 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: usb: richtek,rt1711h: remove .txt binding and fix schema
Date: Mon, 18 May 2026 11:20:12 -0500
Message-ID: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The richtek,rt1711h binding has a legacy plain-text file that was
superseded by the YAML schema. Remove it.

The YAML schema also declares 'additionalProperties: false' but
omits the top-level 'port' property used by hi3660-hikey960.dts
to describe the role-switch graph endpoint, causing dtbs_check
to emit:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
  not match any of the regexes: '^pinctrl-[0-9]+$'

Add the missing property referencing /schemas/graph.yaml.

A separate dtbs_check warning on the same node is out of scope
for this series:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h):
  connector:ports: 'port@0' is a required property

That one is in the connector subnode and is governed by
usb-connector.yaml, not this binding.

---
Changes in v2:
- Patch 1: No changes.
- Patch 2: Fix port node indentation in example; port is now correctly
  placed as a sibling of connector under rt1711h@4e.

v1: https://lore.kernel.org/all/20260518142901.1747-1-akash.sukhavasi@gmail.com/
 
Akash Sukhavasi (2):
  dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
  dt-bindings: usb: richtek,rt1711h: add missing 'port' property

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 .../bindings/usb/richtek,rt1711h.yaml         | 13 ++++++
 2 files changed, 13 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

-- 
2.54.0

