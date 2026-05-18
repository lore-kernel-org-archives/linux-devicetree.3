Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D523EFFA8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114544; cv=none; b=l64GcdiK250nyvLURdr+ZTfjVXLndwWRedI4vl4nUFHwEeEeCep7scIXHNRklq8HP1UrnHYtoYmLodFUHhm+k/Gy2sYxwA+mfs78KQIt/9lZPFZdoa8MrJcKDs5fQZr5g5h/yQ2hp3DBbwb7KePxI7GirXRrXxHRTUJbhZ9tKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114544; c=relaxed/simple;
	bh=89PtTp+CZywNRq5iByxV+8ZZVcp4aTPf8WIgy+hSvKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTqhMcW5yKMfDoVnvtqgCBX0E40If0+hIwKMacH3UzETzTfaExkKTBZlOcKNIIPc2IiwQtl1pY5rc5IOIyIQ5rLOFyCvClPEqAVu7ityPz/Kd7Z4FwM/MmvJCGuQM+JrnOIG6ebgtA9NYPcccboML0BFTpXfimV2KQit3+T0aiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfHf8Pv3; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfHf8Pv3"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7bd65714dcaso17151277b3.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114542; x=1779719342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XcufF3NFTqjHcW83cLrWRQgO+sW13V4Ery+C5imZXPw=;
        b=EfHf8Pv3S7RjLtF2fTlSGgC2pgh5eAkS3Dm3UqdHnpDunpkJu+iJPYeeN2hywR4mU8
         MSLYSqRD4moBut0YfJkmXBujNTimlN2sPBpZFrPmNKhzIgMMAP/Gg+o4pNcz3QdBETaO
         G5sASpHDJa4YXXuoZGiERrMxU4JTtSoNxO5hIpiGW1SX7KPrEVkXd27XMjL6iaciwBbm
         NIg9kPUfYPf785QMOHZ+gcvz3AjGkkprMskthK8spkK4qQbpIeFTZVOxPWGOOQpG5N6O
         pcdk3F9WisunNuYwvRiuOWBf2X59uM38zGyRtz1XFZU2Tnd/HWtfbFfCcQv0SGoo3M1V
         YYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114542; x=1779719342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcufF3NFTqjHcW83cLrWRQgO+sW13V4Ery+C5imZXPw=;
        b=RKDS5+RBd+MvZCExRCbhOeDMmkvjCvc7y63CoE7giwnpBDE1fgyo/pXCPelQkSVL+3
         p0spzBoPAUqpJbUiTMk/oQBTLcY6Z+1cfINhMwEMJh+l0zSQAbI6XuwtbAsGB3FL1mRX
         2DdNzrjlUq8ULSYKaP5CuktGkARGr/CCL0eCur3/P7FiqJKconEG22RvnX+789KxqhqH
         NClcR4oI09kjFVK9ZcBZOPDPiXyhJNkn27GxczksrGF6r/giGlJmvjEjipmjyi3PLFdS
         5w3cG+kgVb3Jrbz0ai5G478AxSJ9dApFF2mXsNSETt1sejcidszioCN69ane8OkMJ2Qy
         Ejbw==
X-Forwarded-Encrypted: i=1; AFNElJ+tk7H13+/miiaMLft/1GuNoOE4JyUGKU7pTzTVFo6ayvL9IRkBe6vrQG+OvsP0TEVkTk3nfpLIGwan@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jdofSO87dlUpQQ0l2/0W/8poqZxwQInVjPwOxfvK6rij4Ylv
	lro0R0F1ZRwHW2UqHMhJyMytFlIdvb5WnPAth7wZsDRFd/bTeYxsgueb
X-Gm-Gg: Acq92OHOCNrWMiQWE4U3eckFGgcsmAHbceMOPRmO+iVtONSlybYMqEMwhsxHIm7jHrH
	QpWCYqhBwLj40u7QkFbfjP8gAbf//NSm59/RvRfBkOLFJhoodXGwayCaWQacCQhVJbfqh/ZNNI4
	R02KbJaOzmznWdqErpnWfMWE2lS5OpePkmMIqr+mLqcBgDHDo4nTJOybgTBCZwPlHqfI58VE6m6
	ho+73nUU6f6RHhHBWUSO7zp59RQPGw55/wyjff7cHXlgwwok0o4oT2fvDT2TDFjCkqPgSebKqwG
	rmIJLH6bs1wMMu2yDH1YHeruMX96Di8bR8uxpEK/iExTr8jzvlP3O31YZlz03T42s58mqKk/BDH
	/xilg4wSFal55GpUhnzg3vyRpDPtFblhlXDXLDhBw7DHmzzMj7xgRC3z4L3E5xH1kCbtzRBcE/3
	7eIUEHWpN7Jbm5QhzP4cVq1G84b93DPCLX/4kZbpjGBQ==
X-Received: by 2002:a05:690c:8d0c:b0:7bd:69b8:f2e5 with SMTP id 00721157ae682-7c95a56f98fmr137336677b3.3.1779114542475;
        Mon, 18 May 2026 07:29:02 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc997cb156sm22094067b3.18.2026.05.18.07.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:29:02 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: usb: richtek,rt1711h: remove .txt binding and fix schema
Date: Mon, 18 May 2026 09:28:59 -0500
Message-ID: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
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

Akash Sukhavasi (2):
  dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
  dt-bindings: usb: richtek,rt1711h: add missing 'port' property

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 .../bindings/usb/richtek,rt1711h.yaml         | 13 ++++++
 2 files changed, 13 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

-- 
2.54.0

