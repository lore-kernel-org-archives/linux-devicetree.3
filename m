Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E43E558F
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354202; cv=none; b=TwOPiXpJYm92zR7rpfP4LVb5q3TSH60oWQv0v80v5rdIHrVg6mL+O6HvpwITjRRdcjRkbnE299ns+xzr1Aax3GM4lbMYcO7ItzM3jk8JPo8HDijhwBtBpSHoRN5wsFn1Ur7X6a/KVdXpE6uQWsgmFR2yO/xGtOnIEhZUDlnOLHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354202; c=relaxed/simple;
	bh=WAkp6NOqHTQF9JqXMs+Q8InAsPduDAdJGM1CNG6S2qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mUgUpIJYmH980Oq3Y1C3jYpDaOD29q8FXo7wjUeiRiX7yi6+Gwe/5aEqxusRc0JdTJJFtnR5gXeDhP6FMWJqiEF7yBAfHbU5lkls+FSL1BO9Ektuks6fJ7aSyKToZ/AkvMlOvgpS5NEXdgAftlFv1oMwqiowwKbKHzUAa6vGb2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEcWHEQw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEcWHEQw"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-307d0405e07so2927353eec.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354199; x=1781958999; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=HEcWHEQwmxDrmrew3C07vlVxU/4oGgVOV/9L8Y393uuBvECdtYoziFp+iugNIz7FF0
         jkbLL9yLGyjnRxsjhziEONyG94kaHhz8EaRTtdznSNWJjtWGtLgpIM+qmJg4DzIEU/hl
         dTdROEaQkFbB9n12jeKfp9zVKiuPBjQX7Nq5bpT9ALLVi8DV8BA4GZcxcWsfQCFmNHuT
         J/YUb85JqEtytJQcNOziq9TqMS/vaYQxvpdXTi4x+9mYE+ScJt2M/shv0wcmT6eK0WTk
         n6sSf3k3HNNcc8nB7SLOeZT1SUNfePdJIVbV0QjVQnfww060fpBvh8KGpTJCPTZO8fev
         dR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354199; x=1781958999;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nJDFZ0RQJ1vXb5m3w+4361WDqY9OZe6RpHvJSGou50=;
        b=CEE+C9dE71zLnMuR8BdeRDhx8aVM1xWkZoEAAsqqc1lj9+xx0XAWf/8FJRcDCc5/XY
         nUeerpRGz27wksAp+g1mP0jZyG3Nlyyi4qKTRqUvBSksvmS/FzXnZ8FNn1AZRNJZW+jz
         8C5HqaT6ZhMDWHOrhzeKL3rn8TtsmHJEWSicodomJc7UQ1+t09y7Z4/51oANYoN3g4yV
         sE7kx9xnpu95tB+J/UjVhzclF+VhI2wGtZD4xONdkofqmHatk+RjaavXw4MlKYFx3OZP
         8/wo+kH8B5pOuWcU0lpJiNZuT4gE8T4nuz3iPm1wawtTSCbjcxjWWXV2mAP+4P3tjheR
         bacQ==
X-Forwarded-Encrypted: i=1; AFNElJ8X0Swvgfur4Oajmag0V3hYKaKIxZaOS4CyQ+xFyfRIIqhU9FQHV/8I7W4CDtfwGVkfjdHhRbc/yqFA@vger.kernel.org
X-Gm-Message-State: AOJu0YwMdqWzUUOvWZXtZb7Wz/nEZai5YQDkjBxSBHr8HwmR0CCU8D4w
	/6jLeE9stQZR5m780fzEew7WfbT9EyH8B8EwT1Wa3RA85ZaCQDZ26Ni2
X-Gm-Gg: Acq92OEnFrbUmC3MukXPVdr+/dMmIYJccg3c2QCkouz190VsA6HN1F9SIT5WQGwNuTO
	KQcPe8nC8fdiLAxcVtPQHZpdaodO2oNpDAuIndqpEwK5rmamL11o2xtp0DW73l7HUojKh1r+tYh
	VPRegzM7L22VFOVMh6xcyQRBtSwn40AJfvQqOcQ0c0axe8dTvAMFrAM6UsVKTNDalghlyrQXIUv
	t+q046hc3R39+41K020ueSATN2MmKBv7CEUMo4Ct1C7GBo2L/zlw9POCjYmVaQpj0wCUmbSSs6F
	FhjzotI70/maaw9TtaKGruPqnE5IrJcX41GGS6k9TJl2N3Y+xYLfx9gOI9J6sQYGlUlNbaayvPj
	z4XLVdxe07IJK0nAQORYSMTDwCAMTSWTvJp3RlwL746MAYdMM7XnadtIYz8BKOoS/eEofDJjy5f
	HoOCfEjYQbRLASrbdIcgcbemrG0olL
X-Received: by 2002:a05:7300:6d21:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30935239b09mr1654447eec.2.1781354198696;
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:38 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 07:36:15 -0500
Message-Id: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9OLWoC/yWMQQqDMBAAvyJ77kJMIBq/UnrQdG3XQ5RsFUX8u
 2s9DsPMDkKZSaApdsi0sPCYFNyjgPht04eQ38pgjfXGlw5p3dIoIRictBTsecXFYd/GMnR1Faz
 xoPGUSc1//HzdLHM3UPxdNziOE7hRLWV6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v3-fac19b879206
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=1267;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=WAkp6NOqHTQF9JqXMs+Q8InAsPduDAdJGM1CNG6S2qs=;
 b=ge4xC/xkTrmRFZwUxQ3xLwJohhzxi5kZoo5r4alnDXRKRBCLCvWbw6d6atLzgZAkFVx9jMxiT
 ba+T7t2FpG6BvzZmRKoeZttk5pu4O0nXWqNd+GfeBywsrRv4c9H034W
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Fix several PERIS CMU clock parent mismatches and add the missing
TMU_SUB_PCLK gate clock.  The dt-bindings patch adds the new clock
ID.  The second patch adds the TMU_SUB_PCLK gate.  The third patch
corrects eight gate clock parents and reorders the GIC mux parents.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
v2 -> v3:
  - Split TMU_SUB gate addition from parent fixes into separate
    patches (Krzysztof)
  - Now three patches: dt-bindings, add gate, fix parents

v2: https://lore.kernel.org/r/20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com
v1: https://lore.kernel.org/r/20260528-exynos990-peris-fix-v1-1-5b65aa7def2d@gmail.com

---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v3-fac19b879206

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

