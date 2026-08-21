Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9719332610
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787281412; cv=none; b=u6QdcYIRDy/9v/+IrQe3kmvv8CyDumBOlTM67ZZnkW+oXb32xIHWoMGUbRzu6QTCfOaMPEN6D5ACYSnSO+AoUXnLPGZlaD1QSLlQ7m82rrJ3yLSCA6qShJPSCq3QlfLEha2vygAHE/4+v3p9un05+Qru9TjiR+yNzTFJ4WlRlhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787281412; c=relaxed/simple;
	bh=xW3iwMJdUf28ooxJCG/iuJQ1bRNNMmFlcIn6TRT+ipc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIIT1Viap4eLncvHunPidpijEtwavgDpPuFY4+VGz4PnFKYA2rVmFUtmLk9pPh/1WwIPpP6HZRpgZjrODJCF4oSgougI/d7tsfVK51Wx9CZmYEaEGh1ysYvnDZeT/cgJ6+BCRIuYnWXUb2GfN+qfN/N+iSWqNef/HKnUqMZOSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me; spf=none smtp.mailfrom=mswin.me; dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b=zEtk+5Nq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mswin.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mswin.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mswin-me.20251104.gappssmtp.com header.i=@mswin-me.20251104.gappssmtp.com header.b="zEtk+5Nq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so63026666b.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 20:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mswin-me.20251104.gappssmtp.com; s=20251104; t=1787281409; x=1787886209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nR3vivEFJtd3iQZRVlYjMI32Qa6Jn8xRiGEyh0JL5Ok=;
        b=zEtk+5NqCwl3r/Oj3BNwBSI1a63nxMKHV9SC+pvoewYbfMjUn35UJC1g88qfWm05x5
         fpvojNRmW/sXgXDSzMZKi++ePgQICOTBZNb5UYWDUZptmUUDrPGWiYOKy357zYGEJ/J1
         7xX85G/4oKm9gp7rB7burDe6AV/MWLu3eUYKt1wuYSRvU2B0bmN+LbpTQYWMZhukFfdU
         JJjKDdo233wpx2q7dtGWYXBLg9dPtgNKCBv+eXSd5qbVe8G3cyzw75oC2A6vQZtER3vb
         H00WtFSQxr+ZRSQEB3j7iwUR5giyUHs+ZnpnQmujD53iJxG39gAdwmMWYjtgPUQCn+CH
         455w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787281409; x=1787886209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nR3vivEFJtd3iQZRVlYjMI32Qa6Jn8xRiGEyh0JL5Ok=;
        b=WLJeFanX78rO300OPBBoaTfu/wFpmFBB7GuUPU+ibvWFuaEv0IhF4nNGBgzjunU5PV
         FDeiDT5BxJqNPn/h7w7u84I6bm5fEE7FxrxetbmATGZGiKpjresHDqT4iiOpKMsT4oW+
         U3G/tFm+wcOt4sXYDZyunYq2EP9LM1eryCJ5gap3SR8osX0EpLDa7ZuCsKy38Fhby0GN
         V8lkZWFkirNI7Q5V8ALO2TskwWkn1YA70MjfECkdF+tHWugIyRpWZoaeXsvk1bb91ZgJ
         nFgpf5KiXiVuRsJA/Aa4X8YqT+sTGha/WELbVnDPTJl7ig0yvYYaPVBnhCw6ybGcT5hQ
         QX9g==
X-Forwarded-Encrypted: i=1; AHgh+RqlwzUXGsKelJlNkHIQs4EX+gaaHyThMO/dFwld4i4BUw+/hhoVW1KyP2z+NANJQjXzJ0bQ9QtxI4wJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rX6itePGXJXUP2o5mKgqxXk80z+miOK6aRCOyjq+1pa1hjgi
	gQ80NIZ+6wlygA7cyVcn270ufwfBMENR2Q60wcjiN/KXG9gfSDPX41o+TaZKnZ9BU4M=
X-Gm-Gg: AR+sD109NF1XfLKLwYPUn8GhgADtqrKiDyq28GFSsBevL5/jdjeNSE9YFyg6+FYugvQ
	73OQkJbNf+nUToh1c4dX/FR/i8ZnkkCCqvVv9zhSh8RfMq+zSMNHAgoWed+qOATsbmnn3O/MPVv
	fNuZSJ8fl2UEAEHIgW0QUek2U9eilh2e5fLKnOlcauB5+DE0pRWt8ZmL5MSqDOu3ZHj6gNOVqbw
	ckQ9Pam0aQ+tN9jm16mMRRmXJGgeLBgz6IcmtVKGL5eL5oyoW//+8Vh7kQAxSrK1NtAmPg9yAWv
	6MlmWYEcxUpv+h73+sdv/A+WKQWaaF7MZbrdGQhAGqGfAbrNQpL5K+RMrNfrW+VCFmgxZOAVAZq
	sg5DvEBhBUpMOxR9ixt30i1oUQM69EHwYsSTWRbQpH4b8bfV5OloCP1H82ybJh606wIEvYeKa1s
	lufb2ZO3HtPsoAEsmGTd7gGZROVOKz86RLvKFoUKOGWsb8Jk+D+q6FTrDYQDmVo0XeOQ==
X-Received: by 2002:a17:906:1014:20b0:c20:f871:1020 with SMTP id a640c23a62f3a-c246a63f53cmr205362566b.19.1787281408924;
        Thu, 20 Aug 2026 20:03:28 -0700 (PDT)
Received: from zephyr.int.serkovo.ru ([85.17.200.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df293sm274875866b.45.2026.08.20.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:03:28 -0700 (PDT)
From: Roman Linev <admin@mswin.me>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Roman Linev <admin@mswin.me>
Subject: [PATCH 0/2] arm64: dts: qcom: sm6125: add TSENS die temperature sensing
Date: Fri, 21 Aug 2026 06:03:23 +0300
Message-ID: <20260821030325.1823829-1-admin@mswin.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SM6125 has a TSENS v2 block that mainline does not describe, so the SoC
has no die temperature sensing: on a stock kernel the only thermal zones
on an SM6125 board are the handful backed by PMIC ADC channels.

The block needs no new driver code. Its register and interrupt layout is
identical to SM6115's and, being v2, it self-calibrates and needs no
qfprom nvmem cells, so it binds through the existing qcom,tsens-v2
fallback. Patch 1 documents the SoC-specific compatible; patch 2 adds the
controller and the thermal zones.

Sensor-to-zone mapping was taken from the downstream device tree for the
Xiaomi Mi A3 (laurel_sprout) and cross-checked against sm6115.dtsi, which
agrees on every sensor the two have in common (2, 3, 4, 13, 14 and 15).
Sensor 5 is not referenced downstream and is left out, so 15 of the 16
sensors get zones.

No cooling devices are referenced, since SM6125 has no GPU node upstream
yet. The zones report temperature and carry passive and critical trips;
a cooling map for gpu-thermal can follow alongside the GPU node.

Tested on a Xiaomi Mi A3: tsens0 binds at 4411000.thermal-sensor with no
dmesg output, the thermal zone count goes from 5 to 20, and the 15 new
die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius
against its 85 degrees Celsius passive trip.

Both SM6125 boards (laurel-sprout and ginkgo) compile with no new dtc
warnings: pristine master emits 7 unique_unit_address warnings on the
geniqup nodes, and the series emits the same 7.

I have no other SM6125 board to test on, so the zone naming beyond the
sensors shared with SM6115 rests on the downstream device tree.

Roman Linev (2):
  dt-bindings: thermal: qcom-tsens: add qcom,sm6125-tsens
  arm64: dts: qcom: sm6125: add TSENS and thermal zones

 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi          | 299 ++++++++++++++++++
 2 files changed, 300 insertions(+)

-- 
2.55.0

