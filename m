Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E6418A55
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297821; cv=none; b=XsoUMyiMqrTJPoHAPqa2t3HKwpxcD45cbvtRiMR9mcpXwkM1ghuHTG03Wkoq8X/YatQymR0+SM9TnJlhZj43PuuA2wrrsQJh7ioWfpNyAWZVLpKhHhrLCgPn3dbAb9h/Ee3CKSOqEPWH+d8kx+eUNjUKEB92sMxIJTFW203hoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297821; c=relaxed/simple;
	bh=hAfXoKWlQ0jAYSRb83dpejZBHSXKa/px0bS9uQ6kQ3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbKdmBdy36dD6fv5gv2NlC3pv4VrgcZAlT0lofZHqNXVQ6noE60mPoV+KGeuOnYcaxFpxml67R56rP5d8OYkuXIHx6J7uZHqa5MG0u2eTJV2vYPAS0V3Sod97dCxteOZrvCRmMibBwbb0QjGT7lj2OzqAqTHwOi9cmSrKweFTFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8Il7KcC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8Il7KcC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1073225a91.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297809; x=1792902609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=H8Il7KcC49qskOzNjTWMS4GJFZ+XankItDHzLPmC/bTan+fpr1JIVIUmSaIWVzAw5a
         dJdXpq47mvtzf70hwiBVCrlCAUWEsm9WV6MYg41GL4kpZjQXbPcAqr1zuL66YQHz0Aas
         p9oA6nVtzgDc5xKT18NHY24FA+Xjw47IgGWKecncGwipZ1MlynnKkwuVoqND9FpKG8AL
         0aT9ESnqbzCpvCP3viO5C4hZ/MQe8E9oQNrXxkBbMcc3Cz55oOOPLwkOjMvR1R2+r/hE
         6wqpYB+aamwQmCFj/A+DHpdf5Lu0BaRNAMXzp5A2fj9R8nITMRDcHCxMakOSLSFklxCX
         wGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297809; x=1792902609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9/qTcpGmqHaagDBr3uuGLszB9r96QIe5+vf42bKI7w=;
        b=hyZ/rxkG6s7t6rBk7jTqhf0tcd8xj7imZI7F4HHyTi1mfITn0M/CygVxkiEbsIK2KT
         Q0NXA36X4iJ02JkhCimhINZ8BYKn7i+x4eb4ZOR6HkzCIyL/paTgMciqF+dMQKg3OyQT
         zJZ2NLJpFmdf5oYzGNOl+vBOJ8Ype0dM4sHBeI86+sYzWXgparRxm7q6dPupDDQ0rJzQ
         gGPxOb3A+sBmGAsx+H8H4WZjuY5nRuC2jpwMgVOglTw7GsI1ubSUgRhWzlysdJpGWZxE
         6hmsq4dhmCRcD+cV/XRb94LHMsog9VKXYyFlzNK3anXDpN/Dkh8b+1Y+rPJH3x9yCert
         +wtw==
X-Forwarded-Encrypted: i=1; AKwUvBw+wvi7fZjTUdoCiVxo+vNP5C5N6v4OXyz/p0MyxMLQgitMcOtCrPdhAPhuK2M1jQXDZ2MKpQhTh6nV@vger.kernel.org
X-Gm-Message-State: AFq9FYLx5gW2JQlO4jHtjR833CM+8JhegRXsZ1sN5gL/mncV85Yifip3
	XUKYwNo6ZS3cXAeqPJW0MBvEAWDyQAv+5yNuPSfkqxAvxeV16i/L6frh
X-Gm-Gg: AYBFou1NvJFUIbiX2WomQgsk8C09RioFSpTZZpQXx8k6eKcYZ4m9lazbdqpNM3+uZ1W
	2VVqECBj2bKtNGdvJ2hau1QZp65rFIKblu0sZ5OL9H5UdlKrHSslm2YqxfDnqOv++AlVtZcahHE
	rMdC+NUHkum0OccCpgZmGsQaYG/fJO/7wMK50eHJig2kiV59/tlaVAI2noYDAXcEu+Gt2sIn93L
	nh2yKtfKoiMDXIqDovH/QwA9f1q6Jfo4bznOrJLjiRYhVclojbVol+smkIrdWCRQA8o5AWqerR5
	CHdmfHISyYLk8r6V1bqQ/J1KHR/2Pjl9WnvNFtUjrjEFCk3oq2yZi1NTSLVDobpCI6c+Wgtktwz
	5QL+ekvTGJi8gyx0C1SWYIhqBDt8bbicdGIC9bIyAcmoV869N/NbK5ozFmIEyPDdg0VhulfP3aX
	MyD1cN/r3o6/mMVLkArFgA/6yXVFno/GB5eaCghg12m7ypzl6WZrnBFRXzqE4GeYpdTmmjUfeT8
	UY=
X-Received: by 2002:a17:90b:390e:b0:3ac:ba49:2fed with SMTP id 98e67ed59e1d1-3acef5f1d7bmr3980364a91.58.1792297809016;
        Sat, 17 Oct 2026 21:30:09 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:08 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:21 +0000
Subject: [PATCH v2 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-1-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.55.0

