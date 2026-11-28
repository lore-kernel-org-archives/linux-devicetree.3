Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838116;
	b=DrUXGEYh5qij6lK5fhB41RNvBWwZpPkkMBEDz8fhohvI2ONotFolkdfcDfhxiaSBmj2Q
	 VLrjznKkRbY5lBzXRJhhGa1HH/N5ql96fJ3AibSWfpRjlV81Gccdi3VcmSTGPCUoYnfUF
	 D65CpZIzmDPqS2ff79SDuuduRwagJY7w/D1ihQvK37Ws7X7fIW5ya3qg8ImP9MklsUqnu
	 v9SDDL0ubrmG3pMmPIfCxK51eIggZvt4cVa/lmaJ+22aNLipTnAcr/3F6YTikc3wAuwHv
	 bv54XT7a2jB/LB8EoHll+OWkuTTK9vgH0/SG0MGpjNF9YILQuUJHVkWYrF2uasbreXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
	b=VN7CJ6i+qVYFn9tWXSPYdEbXfMqczmOTzWuJ7pwF8wM5Y9J/yYq8P+6Ef07ve3xDyDPh
	 ZPdpZCRCPYRjKVAg8F6heBqOgZVubk8Zn7EB9AD4owLlW1oCGtwFS3prndoJr/pvOpkF5
	 e2+FEVo8DzbovRJ0VT9hUaMLOd4kZy4ZCsca9MnkkvXNOFQmDzAiKRSe9sUrWGUvYEZf1
	 pQzL+YF1f5c7lD5Ux7jX5uciVju14kW50iUzHRX8HvF+8FA7Ci5BCD9rucBqZgvn3kVuL
	 XTasz7vHtu9lNPTyBx2YovWldSEIr8GSItSDgMZnR7A8cOA0ouSCitlp/7no+S3KbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqDNYQxV;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8FC606A31E
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqDNYQxV
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0481b35c9so49764025ad.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838116; x=1796442916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=GqDNYQxVdzmPk71SYW4P4fnCAOImoIcnS1MfGYCtTPcLljr6z9flP4o4ZjhCgjqkYo
         F+OJsLbkypDiAtouP4r7JXfeb+qzBh7V3qodmbDEM3jgBJYoFsFGQB+0DmfEGxejWBQc
         fZM1UMOJwNpeEVKuSWkMg8lRStrvULmsnb+djFUjWzJL+XjVaTqPxFnUy8FMqITnUj1I
         iseRVKbUYLW/Ow52oRFUvea3VMBWIQu3o965QGtFzE+34KCdyCb/Dr6D7wFMg02iGmy/
         veluhCk6NWcQs3d39CGFgUX/mZVuX6mbjQ7HimijheF1kUesEwbz+0AMao4pVSAtMhgb
         mlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838116; x=1796442916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=PzgbqUwP8iujOECCAF1XhYQXklObLK1PGoESS0mThwVOP+0Fxc25Q8YzmKsNnzQlFD
         xdB00y5eSODyDncHeyLu3EWUq5N/09meRW+tod3WVD+KX49FMo8t0kSkBuczZzco8DbI
         wS4egAXD5FIghy8iDmZsTaTypty8y1XF7jf/cTXWwqe8ALIeeFERGzQ9DqGfjXrb6V0W
         vE8qsrgIEtjQdzSYSvWllYkO7u9CIVujaDnCKK+2QigVVBW/TxET0lOsnR2UkxOHW4Rh
         M1dU7u5BgTVo4VXWt+mkdMJGOrold/xCrWmLhoQxlDKOXKbm61NmQOVVZbtX55oN1nG/
         egDQ==
X-Forwarded-Encrypted: i=1; AL+hErGy8M2hhIetTBM7UoLjrsunqDIC1i/a/jMU3VsEfKTQH6MARE9y7Yu7TM9mXkN831EW6zSk+6/1PdGn@vger.kernel.org
X-Gm-Message-State: APuU4Z9SfrPT1XcHdlKDPQMF10BNSwN2bOhwrSryNhnpf1r5x7m4rSds
	EbEqExSQ/dq/GgQmGDtvmhfKyzCo3JvHKhzqvvVz3Huq/jqf858Em4bH
X-Gm-Gg: AZFdTZe34RqtjAqvY4wA73+f5Ea91YwFypw6DxznYqEYLy6o8FDLySTLbeVClXpjqmc
	R3MNZ5y2xUyUBrtY771FwoGRJtMCuORfa2gsv9kqJ0Sklw3aSZvNEs/gtu7DoS/RW27Bp5GVr7h
	iBgLZcTen4iBWkxu218QMWUD/kT101qPH7o4qvsY3x1MuOS2ZYIE4hzc3zX03lsm4oBmGz/Nphu
	U7brqzHE4g1OxkTym7SaU0EhZuKc96arDis1BesWOWF5oUTH+U5C6uLqx8Cbx32KDsW8xU4XZkn
	k76GLkAAGxE1GDkPhZJWXH0ZKXOG4ENjBohvd3b54Knalfkoa7TEipWg5tPYZt1NGBG5R4nCVVu
	sj3t0TjFKMWKAuN8s/GFWaSiAZKJb9xDYS9mNbdV/PlfOK0UTwwv4sSShbDz0m9uDh1asb1rQ3J
	MtfYoRyAmOqUeFaYLaOZZQ8NtqJd/BLsHq+qvo7YK6gMmTcn1Zy+k4nx74SOKIK00hzhY4AS6nO
	S5VACd1xOwuqE74yyKhYLW6SYDZJWxNGIftK6hH0nT+M4p97Tdez4vzahOKcJpqChfRorx71qyw
	7TWK2A68wiLxuuj3dWJQ2wGiF5Ocfet5AYAHV8ol/adqUAY+
X-Received: by 2002:a17:903:19e7:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2f03f271d6dmr235900075ad.72.1795838115727;
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: cpus: add Phytium FTC310 and FTC664
Date: Sat, 28 Nov 2026 11:55:03 +0800
Message-ID: <20261128035504.760778-2-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261128035504.760778-1-idleassetsd@gmail.com>
References: <20261128035504.760778-1-idleassetsd@gmail.com>
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Document the CPU and PMU compatible strings for Phytium FTC310 and
FTC664 ARMv8 cores integrated in PE220x SoCs.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 Documentation/devicetree/bindings/arm/pmu.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70da..658da1fdc4 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -206,6 +206,8 @@ properties:
           - nvidia,tegra132-denver
           - nvidia,tegra186-denver
           - nvidia,tegra194-carmel
+          - phytium,ftc310
+          - phytium,ftc664
           - qcom,krait
           - qcom,kryo240
           - qcom,kryo250
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcd..49976c889f 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -79,6 +79,8 @@ properties:
           - cavium,thunder-pmu
           - nvidia,denver-pmu
           - nvidia,carmel-pmu
+          - phytium,ftc310-pmu
+          - phytium,ftc664-pmu
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
-- 
2.47.3
