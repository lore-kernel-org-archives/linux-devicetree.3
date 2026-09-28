Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82B14F85C2
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628908; cv=none; b=dylPpjpqXgyomInr6PcPXxUdUzQBqFyJce+Uu94k+lzFt4J2RFYP0hSp/m2UMUW/XG356f634xFYqVo39AWaaaF+KdnT47pY5AGS5133dxnY7fr9nPdnGEhdpkhug0DtcJJMSSLLEM73OyRsUyEkz5TwDazdmZL8kHe7HqTHp2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628908; c=relaxed/simple;
	bh=Gsni/OUxA6Ij7SagrkgqJOG5js2KISCrkYNODquWIb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jszHMs+g/KIqD2gkwy2aNnc4r/dTRcntucN+lvL6R961nDyt4wfklZ1cB7DkdXKJ3aBiGlaUFimyw0CHRZH54N36M4W+grpSn7UmUR8ajqU/yOT4clgID2E1h07g8vYruemke1bNtbKW8f5Qtvz7sMgoYUV8U1q4oDwJWGe9Ayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LK9EKoGT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LK9EKoGT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so8299215e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628904; x=1791233704; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=LK9EKoGTq6KzvGuq5zBwBgpPpGbfF1IKscBd8PDHB8P5cUr52liiYh7zso5hNbhp65
         1y51Qyvt+sBd8XNJnqMMTBDsllvOm/xJFUh53Bhqa0TCMtifVrzrAm8o58wZOP/E/Xxr
         8DyPMV3ymaQGG4e+A2ZujqUn8NZZa757sZ4OEd3xDo7XcZgZxuX6EChyEEVrhacC4coN
         hHzDna8mlLiaM75zwYb0clTo7uLYah5SdhHr/jvJB/m7ZHJ9+l9oXqAWH+bC4u8sAOe7
         aTWUzaHGnrIMP6U1r24BAjYBJOs6jCuQHXBrJUtzZf5Z5Wl317utvk3VZ0qdt6Pgm5kv
         IJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628904; x=1791233704;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pZc96VEoN3/pZiTvd3D//LSSDMavgTBbuqhxg2bO6kc=;
        b=RU++a/zNUMc3xh5lOyH7fmJJKpey5IGGBiOYbHKmGuc37/8m77A1VUsZ6qy40fzHQC
         4/X4GgpMsiZg4SegY6pN5TFted6hraT0S1sr2jnwzxFFsRRsZVTGs7rwq2S0tD/RoJ/h
         hi1gkzInv/S2PDLyU7tRqw+KDlPrB9/KSzJ8lUqHHsvDMspSA2C4wxde541pDD5qG05z
         Bd96RaKDN9g+rOZBZKcmWrcmcZ9cJQXMi9Gv92mpkhSskXvvD4aQD/qe9/oUanKNB49K
         zdEucsyrLdvd4hG0z+JwGLQ6FrDtwbH27EPahJS7Xt6zjqrRKkz0oIG+kIQ1XNG+E+dC
         bp9g==
X-Forwarded-Encrypted: i=1; AKwUvBweWp2hikKoSAeWZvsAYmKLq+YKttSk4fEBNK34y3SM5J0P/h094jMq0eBRl7f6Hu0e1TgdcIANKKn8@vger.kernel.org
X-Gm-Message-State: AFuF++lm7VcFLZ45u6UXFgcN8aaEKWlgtP1cynebRsnEk6r91M7/B3Lb
	+cJheIvYB2/Vud9YSsHpvcgQ2HQcg1Jc/hdljeCidGYWou9wdnGEFDmvewR//ILOE20=
X-Gm-Gg: AYBFou0iqQrd2BlT2Iw9gzO/gj78PS7axLArGnS5I9aZ258p97Bz5xBEohZCOHl8h/F
	d1P5FoWAuaQVEvli5y2NwjfgGzlKpMWLG4QsdZOoQAlyX+pURCHbGgpg0Ltf+HUWE0yy0PmWRIZ
	tgi0rzgsweKq+KT7TCLAGSwmIhTuA6RCc+X2WJY0Ngr9r/mCpNGwg73R1CRfWHKaB6uVQQ/AQaR
	TMBU6KbJZoq+GQYh4bXHXjxGhL9ESLlc4WB+N+xL2L5uDw7S4BWhp9CfnCUCI00oCV3WJw5yvAa
	0/AP1A+q5KyYBpb85V9uirjwMY8KVzbXNgHNUZULqP12d+gFv17HLI85xQjUhCaJ9NZBPtIKyoG
	pPxfdl7rHf4J1498lh/nZQoVvOJ0D0mHveTFftVABPFI/99fmq1ZQLvm6ZyZ+4/1oAhr31cCul3
	IjqteH5uKASZiOTgM2DgJk/4Xy6vHzDGKZfI/nzwfxOMOyAFqo2b/470uZktKNTPvGkYB3L9vuG
	CHDg1mnZVxXLYF4W2nSWtn7arxK3F3HGrzSTZiCOPaYCb6P+2ui0pua7FWjcfkqB1i/9f5M
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr175925425e9.31.1790628904029;
        Mon, 28 Sep 2026 13:55:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Initial Exynos850 ACPM support for exynos-acpm
Date: Mon, 28 Sep 2026 21:55:01 +0100
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXUumoC/4WOwQ6CMBBEf4Xs2SUtBUVO/ofxUGHRTaStW0SI4
 d9F9O7xTSYz7wWRhClClbxAaODI3i2QbRKor9ZdCLlZGDKVbVWhM6Rxcj6WhUJbhw5blu5phTA
 +QvDSo7LU2jbXKj9vYVkJQi2P68Px9GWh+2M56r8hnG0krH3XcV8lwy41KHUBn+6VY+9lWuUGv
 ZZ/Huavx6BRoSmLslH7HeXGHG7srPjUywVO8zy/AVlusXL7AAAA
X-Change-ID: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

This series adds support for the Exynos850 SoC to the Samsung ACPM
firmware IPC driver.

The Exynos850 contains an APM co-processor that handles IPC messages for
clocks, power, thermal management, and PMIC control. While it uses the
same underlying ACPM communication machinery and protocols set as
the GS101, the exact implementation details vary between the two SoCs.

Those protocol-specific differences will be managed individually by the
corresponding protocol drivers. However, a dedicated compatible string
is still required for the core IPC driver because the Exynos850 firmware
utilizes a different initialisation data base offset.

First patch updates the google,gs101-acpm-ipc dt-bindings to include the
new "samsung,exynos850-acpm-ipc" compatible string and adds clocks
descriptions for clocks that can be controlled via ACPM or by Linux
directly.

Second patch adds the corresponding match data, base offset, and clock
device name to the exynos-acpm firmware driver.

There is a dependency for driver changes on clk-acpm exynos850 series
which seems to be accepted/merged:
https://lore.kernel.org/linux-samsung-soc/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org/

With this series I expect for ACPM firmware DT node to be:
firmware {
	acpm_ipc: power-management {
		compatible = "samsung,exynos850-acpm-ipc";
		#clock-cells = <1>;
		mboxes = <&ap2apm_mailbox>;
		shmem = <&apm_sram>;
		clocks = <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
			 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
		clock-names = "cpucl0", "cpucl1";
	};
};

and further add cpufreq support on top of these clocks.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- Re-worked bindings update by adding clocks descriptions and hence
  re-wording the commit message and adding constraints for clocks
  and not yet implemented pmic support;
- Rebased and re-tested with cpufreq;
- Link to v1: https://lore.kernel.org/r/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org

---
Alexey Klimov (2):
      dt-bindings: firmware: google,gs101-acpm-ipc: document Exynos850 compatible
      firmware: samsung: acpm: add Exynos850 support

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 54 +++++++++++++++++++++-
 drivers/firmware/samsung/exynos-acpm.c             | 10 ++++
 include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 +++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260512-exynos850-acpm-firmware-support-0aefaf4104b6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

