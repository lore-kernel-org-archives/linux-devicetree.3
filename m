Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B989F37DAD0
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 08:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868898; cv=none; b=bAOMeGHlvsLsNAPG/0kfAQmqueUZgm4YVk2fD+DdZvHXYa6sxxvqH8z88Ng9k6wUGogy6WrClMCUqnzIkY5oCYSJI2RzMLlbpK5SP1nu2yUjxD2LOEpPim8/3xRdNH0ucoyW3uzKYvmGfgOaZXemUm+mDayvaHbFDiW0ZAuVXiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868898; c=relaxed/simple;
	bh=vVVV/m13IjNChM/ZjwQGj3Jq/cViqlU0kkgLRzO556M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o+hU1mOizCFtgveGIAckTK5hnPg9vXwajdx4+xJCsdTGCELjiB/D0NVtFzfmCQa/pU3cwbxgPnY88RNuyFXbTFUw7BCG4mzuug1eEGO6gQDFxo/mvOVz+3mr1oon1EsOexT7hkkL07U2U+7gPlxu7lvZNdqFycO8aQhIAIkHKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9TkdBe7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9TkdBe7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2475357a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786868895; x=1787473695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=X9TkdBe7qavLfbDInYx+/9Hx66YImXGBqwQglrS1z3N5SK77Pr76SSE6j2FAdXVpea
         kzLgHjhpCm9cF7yRchvM3TyahsItytMLLrDxiARB7/1HY4x2EmFbOG3PRQVzQLfnHjoq
         49VaE3bckvZGupdrLAB09VcpTTM+hI8G10z83oQVu9zsUzwnIeMkKzFLq9ITDQartZHR
         f5Tpwu31jl/4v4KixJfDqQ+02iYl8CJohmr+YFiBEBLRxpcNrWQ/FoYlyfN8Yvsdr9Gw
         /ygP9hXW4jINoNcY3VkZ4I2ugwt2pAfdM1Ojpjei6t50HuB/rc1nDc8DLlQEuDBnlyo/
         AKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786868895; x=1787473695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GygFTkQxU74dE0opi3EUfTc1t7fZqz9y0D7YCf1CsrI=;
        b=Kw1Z6I5NxgyMRj+GEJohiye6qRujfouWLwFimug1eBK7+lXccscctZP8oppqd0ZDYU
         ql1DK7bcsaNMLdY6pVmgEyohrQ3hchrM7F1PQ5kf5kRzPkRodAnPArHc05CqWW0TVqnU
         s3CoqOhLc8wAjmw87EU3zPll51rfJdtlvb3cfJ8J01Nm7DL7Ba3MSYdAhKCi+TK5oKu2
         oIVoVpvsAX93I2C6yhfH9W7WMkiHKO1aoCMuZNDzOWsEhgmmdombBTWU1go7SvjVN85h
         +WO+bVxx53Px7zgt1ZnGcMKnPl5AApgt4q3cdFmel0EzY4G/vz9YddrqAkyvFrCrdVdl
         xleg==
X-Forwarded-Encrypted: i=1; AHgh+RoOw5UejtzgpnABFzILndlCFU8JEyydoTxe3Ja4n7om7eb0GKNbKJA46w7XRDRKqDYEP+57ofUfQwF2@vger.kernel.org
X-Gm-Message-State: AOJu0YxND8SdJPgjQOSNA5Nk9HC2V3OhtLZ6t07uNeweb+7JBfs1lXmU
	ymSB2X8+FfkOeHeExt3edPbs2D/sib6AOgJfIERu7sBm3JT6QWJ+2io2
X-Gm-Gg: AR+sD10FWefrHGuTnT+n1V/cRdIcRk5Svv5Ft4Uh2B+dCQ/4MCZ29aRAJI33twN3mDW
	3Di7lw/hK46l/tMFtrVxEuRr3TFRt9dDxp1dfMlI5dwPECwEyyn2XYi3x1X6CzjmFJxCdNY7bpo
	hi3bEN44l5wtjI89KZxqCgkdovPwPgnyWd6a7paFvfmM4lZ0ZiUASGfFST6cGpfGV+9qXw9og2B
	n4Pg5WTi3JppvuFnai222RXFoXVs/LgtVc0c++5bucq7xmQezF7CZf8/2AoZ0H6V1pYClzUiWGl
	1JQqyN4os595pgpuM3UuYRvraQmCy/PgHbkowlJdafj/2iBkh2EOFkNBxUaC7eB/7NUwGLMVeWK
	ecHKFc3TWSNxJhkZwmhVJz4tZNvA7QcflQdUaa1BansZgDOzoP/HnOltaaXkrtLGAwfoYPiT+mv
	jmgl82x1OERRuQFxYik/ZDYEhqvdJTI+jJObyoP5D4AEZqqU7trjxoiLKf6nLzr4IAT5sRnFaKU
	IaVZzDmtr1OFdysf4Vp+vA=
X-Received: by 2002:a17:90b:53d0:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3933bcec7eemr17147634a91.17.1786868895031;
        Sun, 16 Aug 2026 01:28:15 -0700 (PDT)
Received: from localhost.localdomain ([152.58.201.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889bca5sm39510388c88.12.2026.08.16.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 01:28:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add Global Clock Controller (GCC) driver for SM7250
Date: Sun, 16 Aug 2026 08:27:59 +0000
Message-ID: <20260816082801.5773-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for the global clock controller found
on SM7250 based devices. This should allow most non-multimedia
device drivers to probe and control their clocks.

Sreeshankar K (2):
  clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
  dt-bindings: clock: Add GCC clock bindings for SM7250

 .../bindings/clock/qcom,gcc-sm7250.yaml       |   60 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sm7250.c                 | 2347 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm7250.h   |  163 ++
 5 files changed, 2580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm7250.yaml
 create mode 100644 drivers/clk/qcom/gcc-sm7250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm7250.h

-- 
2.43.0

