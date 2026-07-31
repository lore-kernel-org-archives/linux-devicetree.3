Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7BB3ECBE3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497439; cv=none; b=X4M/GRPzBBV6DvB0qJFzv2e9M7DGg0uZN1gc1K2z4kqF5twxO//fKNtT36h/Q+FIj6ziOssGWntKGITY9JzfQsmCRv0koVgTDX9j/F2HRoXjulLgiYPsC3qyEvA7bumVmyAIJFEK8fuxKUjujSuALDtHgz4dxp0wT7ZYlF1bHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497439; c=relaxed/simple;
	bh=PeMDpAvSc5FYx4ZkkGcmikFJZ8r3hndPMUQlaqdD8jI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jpGAMBozPzKJUhDOcJKQOXiK5guNCeD2bPTxiriRUFfWYKA0dWuBvV/77Md+PXyP/q6cgMnf+ZFpSy4yB/f4gOPFnyBpSQy870fKJiQxhiFqHNeVPNCs3Obt8yxQgtRv8fKwSB7q7dpi4hpoxA8nNzUn0c+FBiwPJyud2/UJbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzFR4OLf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzFR4OLf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4758bd3731bso867293f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497432; x=1786102232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3c4L/MJdU0lTNZCQtFNIqJoMYY64q68vh+MgKlRHtjQ=;
        b=gzFR4OLfiLykFqtMqrkXcG1BbL/fk5y9BuhSGj+pGercqmm9N6XCIIC9mocgWqDGxt
         pe6Ht3mz0rRhlq7lNnoLIDH2cTunEOfbg2QfmsdOEDxbcNi2NQhLApzezqKlQwoLVpL4
         QWc4FThUBXFpUYGpX1Bg9mKpT2GgLaSzUd4FVUlRLemYZTk0xZYKHd9zIbDBbOZOYk2Q
         eRKdLw5TVDeLVcqWxOKPIPC8l9SXr3t0YnLcYQED3FY5P0RcAK/ds5gbXQrlO+knrbKJ
         mlUQOV1DZg0MSVTJZIGQl92sV2S8bMbfo0Wn0HJgOWfm9udq/RJ3XP+jwMEwUxmOteeZ
         nFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497432; x=1786102232;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3c4L/MJdU0lTNZCQtFNIqJoMYY64q68vh+MgKlRHtjQ=;
        b=Sp8B5MwBhT1HQiI89cHSFtOhC/Ux9V3hBy4vbw9mM7PDVki4eTrnZxC2wwTC262npO
         242fdj8oJTC3ggzq+Lb7Jvqfr3zFmvR63Vx8SdVxF8MqcAHr77PDSIZ6w6gr+oo4H4iI
         Cb67W01NIchzBnOStt50SLg1dneS5qbPrfWhvS0FMr2WtAREkVU6pTj9GCBeUQ1YGxRz
         MtbGCcg5lLAKlCfG+YXMEGuqGPQZEXJ4HczGzSsVWni/C8svePLlKw9vad++JeiBXxTc
         //rk97d99g/njHY0lwBT1Ksj1TOG1qosbV2AIWSdiiW2sF1sGL+mtlO53c8zuOKBHiIL
         nSVg==
X-Forwarded-Encrypted: i=1; AHgh+RqfdOiIMxFUTyiHvkinvOcKJddnaiFukcEugYl3kNruQHjncWPxbVHLOdPXCE8xEwhwp5iKbg47LzXs@vger.kernel.org
X-Gm-Message-State: AOJu0YxXxN2RFTT8ss9Cylkk529+Wiqq8dVjlHyx5w+PTV+G2pbCq467
	pEYEn4K1kBxDmSgPfF8AvsQSBn/6vB30xWrs0jqe0t9qZz9bC+G4N+Tn
X-Gm-Gg: AR+sD12rDpuJJcqMNMAJNMAwLwa6m83L1XVL0ATHXgGw9WkOgshPrRa8hSEVA22Pmoc
	CLIBfbV99DndkzV5H5uWh5PpLkoWmKVzxpVzV+aRSi8O3PoR0fX2WB5+IqhTtWZmHxofexNI48u
	krIdRWfylQZo8UyrkeKPCC0tbtdbpeyEnpF07aUjFbPCnDSYLCkNSr36Hn8S4wv+Lttu1kkZaN7
	EA44zmngd6kxAvv4xrinAGVagNtrcB8zrLNkrodp2t8lBLAMBss84awFwR2dzsV1y2haHlk/efl
	2bspX8C5o6Ia1eA8IEBnLPcE1rnIr9wGZph0kQRksUJCNgFKbN+fHFHfNyyKSe52GwcxBt++ixv
	3mNPV7nIwTB3EozWS1Ma9RKGSd4OqtQErZdZLK1XoPUFWuj5SDk1lOaz1zGQyribZGNwlWRB3cj
	3rY05Hq6K7PKMXtnl3e1eejohbd/I8FVlTQllkGhHTXrPKCAh7CBAMSq3uDCsTbK/04Uak5m6aH
	A9WimOUIA==
X-Received: by 2002:a05:6000:220c:b0:470:8e2b:9c84 with SMTP id ffacd0b85a97d-47fd32b8f8emr3398881f8f.7.1785497432068;
        Fri, 31 Jul 2026 04:30:32 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm3823656f8f.22.2026.07.31.04.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:30:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] hwmon: emc1403: Convert to use OF bindings and add regulator support
Date: Fri, 31 Jul 2026 14:30:04 +0300
Message-ID: <20260731113007.145322-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document, add OF and regulator support to EMC14XX thermal sensor family.

Schema file was separated from LM90 since according to Guenter Roeck[1]
these sensors are incompatible with LM90. Proposed schema has basic
hardware description. All registers Guenter Roeck mentioned may be added
later on, when/if driver would need to work with them. As for now driver
successfully works as is.

[1] https://lore.kernel.org/lkml/a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net/

---
Changes in v2:
- schema separated into a dedicated file
- dropped chip id check
- fixed match data casting
- adjusted regulator name

Changes in v3:
- fixed number on channels for sensors in schema

Changes in v4:
- removed redundant line
---

Jonas Schwöbel (1):
  hwmon: (emc1403) Convert to use OF bindings

Svyatoslav Ryhel (2):
  dt-bindings: hwmon: Document SMSC EMC1402/1403/1404/1428
  hwmon: (emc1403) Add regulator support

 .../bindings/hwmon/smsc,emc1403.yaml          | 203 ++++++++++++++++++
 drivers/hwmon/emc1403.c                       |  21 +-
 2 files changed, 222 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/smsc,emc1403.yaml

-- 
2.53.0

