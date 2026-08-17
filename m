Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712222A4E9
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952299; cv=none; b=g+KQVNYDPo+thyGdnoIQ4DOWtYkQcPdJ98kDylxT9za9dD2WOUy5ObmoPGB0Dgh6w7wNt55WQsz9N8cKEJnBYcoMlLRiWfpf8JuZVFI/jIK6Ve9bPHbKK3pfnHz5nMlM6ZDne6A1LRQdwEvTeNrxhSYKh1Ny7ZVRF+Ts6RYu1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952299; c=relaxed/simple;
	bh=h70NX2tPDeIemqmiH4OvRNY2fd98eCZxuoknqCOX6RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xmg2NGOF9nXFB5N4i60+Kw0aHi5WSFkXDQJNFF1K7Rx/1RuRUPwl5WaJncKU7jskfLkPdGkEnPTHUSFsjCi8BQl0yKsYPCsk+fiGWLwjIUVm6X/KSOM3Fy1lqpvOJ/+Qt5ABBi5QwjNAdubORm9NrwTqYDLwpALWAr+/AbIs5FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw1c1E8N; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw1c1E8N"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e88b60121so2373074a91.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952297; x=1787557097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi4vUpszV154rKYux2ZJWc/G1Sxirs0ok7VY9vQ3rG8=;
        b=Nw1c1E8N2udfiXBQygA0FIHyyxbf6WNKYr2BxHlxdH+AB9NuhYqNpopdH0Vody40lX
         eKT627OV5qH/elyOIUVSCqXkFLOrr12sAQNkRuj5GDZz7GqqqTm35ZsJJ1yyyIHEtN93
         iN4augQ/LFarZqJu9aTgKdUVsCI2swO4hxz4xvYMsFGoDsLYovvzb4tLXD+Tw0vDrO12
         8kzv2k0UXpi2Cd0w8TKQsiox0sZ51Dh9xs3vCGyoH8uFiODLWpSCTkFV9FzmhcdekSU+
         fJHDHRWbJF+nA0P1PSyWZWV6irh2gzxnjOWRn2bEQ/JKLWiR/L36MlUzyv7hjgsffsHJ
         avIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952297; x=1787557097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi4vUpszV154rKYux2ZJWc/G1Sxirs0ok7VY9vQ3rG8=;
        b=Ph9SEwdmGzvyxX+KayzKcb6lmJrfxJdfBBwceWSSwY2VDAatPvYZrg+eE09M5HVxal
         lTdpR9s6Dv3qUmnNnjXe1vLcGkmSuLDZo7ywoYWeuUIcqwWpLqoqK94SgqzKwN5RzQ/C
         If16xozQtrqObxsy2rHcc+y6VojihdN8jExQT5oFLoiExLwkxwAY8rVMFtuZHuRhJAkv
         wAfyzP1kPejILw/weak0EbCryD9YE8a0she5PKZ1OvrdW5mggkUTVoDSi9JbNMgb8Qju
         w8zYkNbPD8pbpRmZI/dZzRYm0gU7lSkEGSilkcW9Ce33jZrqtIwduvNcIyKrXpsLnUiL
         1Mrg==
X-Forwarded-Encrypted: i=1; AHgh+Rpyy9Jys8mg+uTAeYG7Bh0vqGeTEFrlQLmPteBhOoHxl7LGViASfhui3ehl/xLiSD0nQsy74IKP1dYz@vger.kernel.org
X-Gm-Message-State: AOJu0YxbN513hcaUhZrl0hh0+lxbVKMXdJEXQSm+i6JGnLAGk+//q+js
	KvXQHkdVVdNYibuCsUKi3g890q1p94dAxQdBe0mY/t8HL3Mliv8zWQ21
X-Gm-Gg: AR+sD12K1hceDLO6JgijFrOzTNTl9LxPxCCh6Uudate664VHcO8C6uVy+TheKcyZDGJ
	cGFoVneBFeYK//5/9b81gNejQUockHTxmtK4XxIPC3NlZ8v4WLJa1EOTkT/qzgt8zKsiaB7BVDa
	sa6MfM4l1XCRh57x4ieVHEFh0055b0WSqosQnLM2SIPP0gurcT478aXlw88oxyOplGkQkdFD5qs
	S68bkMP17/POHNsmHgEPJw9XTvWEaVtxt+KuQaUBv3MBPod8f9oP4KHTM7ho67+Xc1abJx/Zo8W
	vYFVcOQ9Ukkg3gpb/F55rxMF62/DS8kOCxev09EidZeTYRzYal6207V3hLmil2sS+RUbfUPxnYc
	L6BxhmJZm3Xqwr7u3tRARMD0W5iGS4/Er+9XQuxcRxQavuLvT4Sd+3EiywLv7Tiie1IzBy6E+ni
	3Ax5rtvkEogvnJCyaQ2NBOf4YqI2DIh3dvZTocFaSRdpZWta+WrQ13lmZNAhae6EujrqH8xNzv3
	HVcNWqfdPwI
X-Received: by 2002:a17:90b:1b05:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-3933ba9e81bmr22812914a91.19.1786952297087;
        Mon, 17 Aug 2026 00:38:17 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.167])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267cc91278sm3359088eec.31.2026.08.17.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:38:16 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v2 0/2] Add Qualcomm SM7250 SoC ID
Date: Mon, 17 Aug 2026 07:37:53 +0000
Message-ID: <20260817073755.2087-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 SoC is known as lito.
This patchset add SM7250 SoC ID.

v2 - Fixes/Changes
1. Changed the commit order in patchset (first bindings, then driver).

Sreeshankar K (2):
  dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
  soc: qcom: socinfo: Add SM7250 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

