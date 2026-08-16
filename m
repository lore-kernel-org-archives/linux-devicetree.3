Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406B50276
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886228; cv=none; b=Tiv1iuKmxTAZd/0Obqy/6DjsWQc30DmpoZFUULctRwZ/NBKtPkszFCZwY/nR7qcKFFL5/17YHtsbeEPbZOPZWcDWILe1GGYcWW4n7pIk8HMXa9EBINTp0gKnq4pQB9L6R1tjFAralrtA75soiMV8lLOq65+hbS5P8t6Slv4ySTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886228; c=relaxed/simple;
	bh=HNgZBr3EeTP1wU3P8wBuPpWgexNWfQ4T9Evbyc1n0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGC6FV5n1ND2xq/bEFOpJWcuU5eH9/O2XTVnTv8r/lPyKBb5F3TeTYogTzNEFEbaeFU9rTLGOYIIilL+x/DvH0TyICZB3t8aVZ2mhZT8bmGluXC0TMIqvm5faw74be6mda4FfeNM3aVYiYd7+cJvAUVUFB+550y9O9XDWgZUyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVv9j26K; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVv9j26K"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3340607a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886227; x=1787491027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=mVv9j26KD6ekbRHCtYA2tPSDmGnHlPr2wt2HBNa6mLSz5loCt8OZ0oEDIeoBddnSmw
         oSWGzNsW1UaJecWOpmzn+tq3z2nHvundQ1dGAXDAI7m5BaVGfPye15ffziA1/hgHIYhB
         gPhROmmtyLLpNVX7yGafOBCZo4Pa81G7RSuRexdDhSiKxIkfapy/lQyUzLGoaxK2F9Bf
         moJ1DD2N3Z7lOPEPiZAUgwiA7GfRGrutDKTOKWctx6oywc4ota2vAUz6VbjA4wWClFiU
         zhaqr8YvmiVyP+UU3z/ySrRtnSfLJI/1N4emwFiQmI4kdBS83/Ybr/6wK2WSUwe1rQTd
         AzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886227; x=1787491027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/58bF/vICIzPMoSzDV9ymm4CY+7nbZT+jsoNpyPGqcM=;
        b=tYKssM0L4au6uBEDljkGkR5dRGwXwe6V7JlNEU4R5soc7Y8BVYWTTOS+UiCaedxMkq
         1mKsF8uKwyz81IMZVCNl9RZFI1ZuQd+33GZeLTqIrHRn+5Tvd/JQ4BGV4C7TnwBg2lGb
         f8Wfn2RXkbP/ufk7wqg0YIwv8h3mq7mdGu0zyFo2n82nrMtqc9hOuMIWiT0mHtl7x+Eb
         DyGgXRU0BWGiNMa8dWg0YfKQF6KMytZDUF42OTP31NfSLYt5m2iQxFYBl6yFOhGmHjS2
         CjLYSyJF/L43JYr/MefuCy3j2KAUN/k34WobpS6BVsb9WFfLjvUWVytmlBgaZgd73Dnm
         5XNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8fA03+LzTWdtILB1iOmPf63kiAjIG9lUhwD1ktyIyUhLTz7jvNqvRPTIdlBJLtK44rVeaXrCKLDn3@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+zPcr/EgZyly5HbehLHbMX9JiprY9xEFCeJ67UKg3MRpY9bl
	OK9nwCpuha/sAJzQmOdHg7Uv1RTAP2kxe/1ltti/iJNhadGjS5rUf2vD
X-Gm-Gg: AR+sD11zGg3ZuhfUKDTGX9SV+ONaDLTSrXGmD6H9VpjuaocVqtlPeqP+wNSiigWE4ds
	KhA+OLFpaVF0Oo9yGIdybvRsc4Q4ly77Q4N7SUWOkmm67XXqmTaJ6gZpDKMGkJBx1tHTYa8hs8F
	9lgaD6J3hRRcduTWYK8zAvj+VpXsUXK4ZNdXUkch8DSMD/HXog9ZT8JMBgZMXUDtwj8r7s6v8aw
	KHD4vDynj3s+isVgLwYkswiYKmFK97ei1o8ItW4mgaNVPzMauq58yhJBVTBJxvyhvD+BcDJQVXp
	hi3+Ub5b4SJdxH16hROhF066xCo2SfKpobcdVrRPyYt0nFnhcjFt2QM9FCZ57QW6iBlBTbC/ceG
	H1f2Ub1y4s/Tw5vOQInu8GkvtcQft7IBOk1M4ia2f0yiE5pj67IxcCE9dWoUvA64w8FVbIZ4Yu8
	nGS3KON8Ru5wPDt94p4WZjlGIc7Umvj4YdNZGeFb/5Wcs4yBZX8nnc+51gL0ZaeQAT4+vcgNBz4
	upn2IUHMt9dhfWqPZB9kb4=
X-Received: by 2002:a17:90b:44:b0:38e:2e16:859b with SMTP id 98e67ed59e1d1-3933bcf395amr21446963a91.20.1786886226833;
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887e3e7sm29235330c88.9.2026.08.16.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:17:06 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_tdas@quicinc.com
Cc: bmasney@redhat.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 0/2] Add SM7250 rpmh clocks
Date: Sun, 16 Aug 2026 13:16:43 +0000
Message-ID: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm SM7250 is known as lito.
Add the RPMH clocks present in SM7250 SoC.

Sreeshankar K (2):
  clk: qcom: rpmh: Add SM7250 rpmh clocks
  dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

 .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
 drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.43.0

