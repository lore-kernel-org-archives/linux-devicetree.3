Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69A93DD502
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651464; cv=none; b=VNJHhPU/xfs5OUjw2j7Dg+3CAhIpMsSO67OnkXz1Jod4X2wbbVJm8bZ7XzldT/lHhEZCC2lmY4FrGMomxqIAUrDBl3Pxt0+qn8EogFD+UcVgAxuQn+ncKsrHmEFflT77w7tvW+1RKGa750IzvsgmuEZpmgJD0nWMy93qsVc8wNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651464; c=relaxed/simple;
	bh=PgS4RWXIzX4J5ZODDned5fwArxiriGg4fP50uyte/zE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VebNYTM4SHe2uGd9/b2t86fRaw4Edk0N2VHmZ9wG3Ruq330y3m9OR3tc/9v9JuiYP/SqwYLOfcTFAFgefN2Ysn4r49/rB54CqMwWpBpwhH3LELx36cYww4XBjkHyXjSXfQl5CzLT24HcLyZTEqFuyi7jd9CfrTHR3MsGLFC29oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWNJk7vd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWNJk7vd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so27211365e9.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790651460; x=1791256260; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=UWNJk7vdkBMrfcmHA1uUdxOl+rdlF1R980gSzitUMv903VasG0FcPAxHGspHLtvZe4
         COOdFrswZKpNeW/ptBZ79RdPQ77GFT5krbeU+4A5WgwcTpXimMlCdHShILVTLvWrlBUf
         nOP9a7t1B7i6WuNhKzGge6j0AP+5GcXT8ePCRiJJStOBUG97qu9pBZer9hlpX5cMBm/x
         gLMq4Gwa9pdScY7M5+OlQ+7cqsmlFfzbY52+JOArFVw82s+rE1SjBE4w91+fD0euxAWj
         +6IuS62KoZwlSzi2w+J11SFWLGjjCb/3MjiMI/4Ixy15ryd5S7BcnnliZE3WCl5tW9ID
         Wx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651460; x=1791256260;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kRsuU5DiYyOHrBAf9+/GH9Fmnu+uM4kHK88xtB63V00=;
        b=ObxPnPANq6m8xFAspVoPxYU9scUuXKAHuwjdExpVDdhe1yBY8Y0cUGCvBqCPgZ7af3
         nVh99zwYgxcTpoyNcIMnEubOvsZEyoEyDdc9T8mOxoqkYf87IM1gnHeVHtefRhpxHTw6
         eWkVV/PY0kMcMl8bE1OPNOJ+udBeYRdGevhYK1eeJp3QpSb7Se0hyHBHdFQQcUaS6xTp
         3cKTQJKUnlVtBCZHyBXzZ8kNHTOTZnm6H3NcBtw9me+ARv9ufXONOXE8CEyPET1fISVe
         tmdpEVrmRMgvJiHyOvB7U0SgJ3ctyA9snvk+7K9xGKJ4trHE4AZaVmWa94v1kj4cyMIa
         3j0A==
X-Forwarded-Encrypted: i=1; AKwUvByeSjnGWhx9oMWIcVxuokyNJbUbZIGIAhYphgyfgizpH9sgRqABuvDZvS0k7oqIr7BsdhdxNKpwdNdn@vger.kernel.org
X-Gm-Message-State: AFuF++nyQv9Wl5ad2W/L5XEED5mCa04tKwJXDbZW8k+felKXkIkNO4L6
	3wzXFLHbh2M96dsxXiZv6PFsfle01hpZzOuCKRrytnpkhbxhccZx1KiiN847ijt0VqU=
X-Gm-Gg: AYBFou3fp4T6U0gWa7VsxpOEQg1WB8Ls4Np7mfTFwDniGybbXJse+7kpQqCBnSuc+RE
	c05l2gQ8HXIV+LpRiJILqZb02Z3q76PYkWZnTecW6153XCqczvlLRNa4OnwDYOsHfeKBLucrVRq
	g8pY8kNoXzz/heuU7vU4MRfL52tzwHrW8FqvZ5tteqbfhp683sto8fXayj/Pd8UhZ06zDTJpmmY
	eois+ESnAONWN4oMwV0pOw2bhJX8OV/Tcz4egHJM0MdF8roxOs/aveWINOTNSwSsH3f9lr0fGrm
	XnjHYsTYV/xEw6vJRwbfdh7lQPNFybjEh87SkLFiWdlyqtj69D7PaGm3jeoOSY/oIxrGMsGxCau
	gfjM7J1f7V0hj0LXibMOSNUpefZwOQxoYECQF3DWk71MoKFNtufNdW7nvFtq5tGEzYQe1jPpaYP
	fTK4He33xedAlNnGmpUZGfr0qw/crvX1E8zjL1kjkeWMAF0JonkgeHT4hUEsbAzE6n0K/yMP+Lv
	TXJeyk2tF644yExISCxPQ01a2G2IlHtFX/lEEEoca/gK/rk59v/vfJyYZC3rZlwkpSQmDNI
X-Received: by 2002:a05:600c:1394:b0:49e:6bc7:4e1b with SMTP id 5b1f17b1804b1-49fe66bdefcmr278754015e9.15.1790651459537;
        Mon, 28 Sep 2026 20:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfa66e5sm46706265e9.11.2026.09.28.20.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:10:58 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/2] Exynos850: Add ACPM node and enable cpufreq
Date: Tue, 29 Sep 2026 04:10:46 +0100
Message-Id: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYsu2oC/3WOy27DIBREf8ViXSoMBhuv+h9VFjeXS4pUHgU7T
 RTl30OTdZdnNJozN9aoBmpsHW6s0jm0kFOH8W1g+AXpRDy4zkwKaYSVltPlmnJbtOCAJfKUHXE
 su6/0w5VaRiuURT8p1hdKJR8uz/XPw4t7be+S7RWySK3BU7IO/yl8qPEXKvG2l5Lrxs+KCz7NC
 oz1uIByH98hQc3vuZ7+tEdo/VOOMWzroMFq4xxpLQ0YNTmEGRGcnFHokY6IShixWHa43x/4Jam
 NDgEAAA==
X-Change-ID: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Thomas Turner <tturner@lineageos.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

This series adds the ACPM IPC firmware node and CPUs operating performance
points for the Exynos850 SoC, switching CPU clock sources to the ACPM DVFS
clocks to enable cpufreq. Exynos850 has two clusters with four Cortex-A55
cores each with identical OPPs.

In theory, we could have two OPPs above known nominal max frequency (2Ghz)
but in practice the board becomes unstable with fully loaded CPU-bound
tasks and hangs pretty quickly on OPPs above 2 Ghz:

	opp-2106000000 {
		opp-hz = /bits/ 64 <2106000000>;
		opp-microvolt = <1106250>;
		clock-latency-ns = <500000>;
	};

	opp-2210000000 {
		opp-hz = /bits/ 64 <2210000000>;
		opp-microvolt = <1181250>;
		clock-latency-ns = <500000>;
	};

with random data aborts and illegal instructions. Maybe SoC can survive
short bursts to these frequencies but this requires a bit more messing
around with cpufreq_dt.

Also, it is currently unstable on 2.002 GHz OPP as well so this one
excluded from the series too:

	opp-2002000000 {
		opp-hz = /bits/ 64 <2002000000>;
		opp-microvolt = <1050000>;
		clock-latency-ns = <500000>;
	};

with the same symptoms but takes much longer (~1..2 hr) to reproduce on
E850-96 WinLink board.

Sustained testing overnight confirmed stability up to 1.846 GHz
(opp-1846000000). Higher OPPs are omitted for now and can be evaluated
when we will have thermal zones.

The dependency for this series is:
https://lore.kernel.org/linux-samsung-soc/20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org/

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (2):
      arm64: dts: exynos850: Add ACPM firmware node
      arm64: dts: exynos850: Add operating points for CPUs and enable cpufreq

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 237 +++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 4 deletions(-)
---
base-commit: 5a956dde5526a634dca7ccad27c051ebcc306089
change-id: 20260929-exynos850-acpm-node-cpufreq-33819039cf43
prerequisite-message-id: 20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org
prerequisite-patch-id: 5a3c87e368d6bac968f16a0e56fcff5eaec60dea
prerequisite-patch-id: 8d6d1564a919eca361aef19af5dbe1cf3205198e

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

