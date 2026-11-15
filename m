Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702723;
	b=B9OcuXvIlcKfKk4PYpmlsfSWd9pzePqdqCYrK15PquD4NUc4JtGJgsVAS7TRMPfpX7ak
	 XUtVm8Dg1lF/AbQ2ivOCoNQ0AUtK4wNUVG6nF3fUcqfw3pjUkLBlZHnNhOOnqUXuEOiiX
	 oc2EUk+YnDLx+ncJ8DE3O6byGw2Und1Ahizsfi0kJVrkZ1jqWVcFdmaDVTZT61Kg5ZQGf
	 s461gHpO8RcqtDfeiC6sr+LH70oFA9M0Ap0bJO3+aMfQdxiLqnLIRQVUykbcPhvRUEh9h
	 joYXL5V1c9nDPRYxhkaozclVakCwaEnefyAAC9I2AxhHx/8uWvvsLDIbvBxBZTFpIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
	b=pxOtwbL7trsbTKPAD4jpkkU5tRoVU/JMuLEvsTpRM9BrXW5buHV8q+ByYVHZBAT325wL
	 WukGCky3y/ROGnb5ujO/VlafiL1Jvl/x6O+wOZh+ybK8FTnDq/a/MJ2V1OQGAmsAyQ8iL
	 2q7j7pPOrhR8L8P4QPQSzoaIYaoObamat793jc/1lrQpJiKfZO8P3qljR4tti/ocCLecS
	 Yg+Lzn7+Jx5Ki7NWSWkH0my9qd/i5aH2Ui7G+RgVu2SceIO7nE8OVOY81GknwkhsmxhHk
	 CkQCuLRIeqRcfoGKb2VATjmp2r1W6DHf+8G5osqZwQ75RJ4D1249/dN6Pzo0ddEKIjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DC3606A32E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 00:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93DC3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DlcA9+xv
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d581da0aaso294108666b.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 16:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702722; x=1795307522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=DlcA9+xv6ovQ7U0XnP+svbUjFjhy51cSsHATRyAaPicXbRqayB+mIxzC5TpzMRQLk3
         LDt5Ce3qRNLH8PwS7YhfnLJTO3sZ5Jw0SIlH+98arhzVSvxqqfGBH5JYZFwoL62y15su
         wSgCV634hpJfX8qy5Sb+HU/i8rQ5zkT+wDnjFhLakA+1o2GAbK6M37u3xkX7TGJCtZ/p
         /7FfFneDcaHDSw8ccfL0X3aXh4yn7de6KDDMUFRs915zjJgwJLIwM0iiQKphMMH1y0I2
         UwFWMlH9SmtKMcd+Wmt5YwkcdjMUUlhOlT2Z/geKLUE4DmiJdkinMK5Zw5D6J0D4iRwD
         4kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702722; x=1795307522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ORxa+4DrubomnpEFvgyCRsCft1wmp5DXp98YT3uKLs=;
        b=Lw6RQRP5EluKcrhfcRMT51VkX52fqXMiYp21laqSvRo8yeJGKJYYlqWOfWjgA0D13W
         TbVQc92+w62SHcHTXHBVY9v2GroKsxyfn4nt3+bJeegbGbkcatSJTXiidmwbLRwQZfvf
         jIajxykPQScbhf/v95uRny7EcQ0jmP/h6jTJWtBWAkbFvnUhl5TQkUloPWbnWR9vw5Nd
         4ll4up79DTx10Jpjle2qruDREbqn6Mu+ZtyhBSDuqod5P7UifmHkF+XURVX3YuXBZNTC
         wSjO1fJiiL2186zpA6BhsRGpvUC5A+Qk2FE/F9rHzfaMlFG60JISY7JewlzOT2yQ5Gjr
         V7Ew==
X-Forwarded-Encrypted: i=1; AL+hErFxpvxgDU9Ju+EGc+cUmyPwfYC2jOQ/8PaV82tueAjaNNnJvgOjvs9rz/0RYHwV2Alk4jSSdvG4Wxi8@vger.kernel.org
X-Gm-Message-State: APuU4Z/sdU8IdOFyfIVKnV8dSV1WDdiNm02P2KwcZFnlCNISYEdslu8m
	E1gFGvpn8YXjU/nbd1gTsZ1Dd+skITAMnAEq4DRtyX+0cuaBgPemw88=
X-Gm-Gg: AYBFou36+nAgaxQAYXYulYbqwlImRmY60qfoQev0zU5DQvhjnZqKMZ5VAuW2e3iKvwN
	NTgDsA18jwl07v8Hf/C0/3kHnG8Cjcbg+Ixn3hFdvxi6f5qwDXbAgxrpwUYhqol0S6EcmL8VqQf
	qc60/kk8rzjdd2VsakPi2pl6nK5i4u7A/1UJSR6mjhUfpLART9JXKqvFgtfcGYIBvASKDuwgZT8
	8NObQLxoudU4qER1IijlfZ+bOhebyq6ALsVT7Zmkpgk/MV8YGo9r+KgRJ76/gRx3McoskdqUPVk
	DMOBXM6aqUIlHWX91M0zxWqfzK71Iat93CgsJrNKBH4r7HP/1aUZ2X5bYoKRtneyvUNSnsdAPDw
	F6zyDey1i5yOX7jYuhvGL94i3E7CWTacA989wRzh/KyvJ32j9MnW7xhLbhTomar7OiPhkGEWyyF
	6/KAfxUFkEYXB7hP9cWwYEBGoxzo3TEjQHirwSQKUDIgjOz6s15Edq4YJ/apCT2iRC50Oi+AGdL
	mW58fv3nH/uXmFmPXnATR+lGtJT6PQElRHCOxiSrG6x6TfhAgQKwKXETPB1KlIktCFQB/2yeuKZ
	i7nBgKNQcZYWaqjKCzNaAptoYkcPKJLg0foCp4VJN5BEHB/GADF2Wk7sVSQzbPrHngIXcZKiWlU
	e16FQ6KLkaYLshMQR37lblAcQLhNmJES7zPE=
X-Received: by 2002:a17:907:a714:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c509637e20cmr507032166b.25.1794702721723;
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:01 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: qcom: sm6125: Add cpufreq-hw and CPU idle states
Date: Sun, 15 Nov 2026 01:31:55 +0100
Message-ID: <20261115003158.391171-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
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

SM6125 has no CPU frequency scaling and no CPU idle states in mainline:
the CPUs stay at the bootloader clock and only ever enter WFI.

The blocks are the same as on SM6115. Register addresses and idle
latencies come from the downstream "trinket" device tree of a Xiaomi
Mi A3 (laurel-sprout), where the CPU low power levels match the SM6115
values exactly.

Tested on the Mi A3 on next-20261113: cpufreq 300 MHz - 1.80/2.02 GHz
with schedutil, WFI plus per-CPU power collapse in cpuidle with rising
usage counters.

This is meant to go together with Roman Linev's SM6125 TSENS series [1],
which adds #cooling-cells to the CPUs and per-CPU cooling maps that stay
inert until a cpufreq driver registers cooling devices. That is why
#cooling-cells is not added here. On my phone the same TSENS
description (derived independently) runs together with this series and
the cpufreq cooling devices bind.

Not done yet: cluster idle states (PSCI OSI parameters need checking) and
an energy model.

[1] https://lore.kernel.org/r/a3f071d3-6082-47a1-bb00-9d8e72fa3cdd@mswin.me/

Majid Hajiheidari (3):
  dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
  arm64: dts: qcom: sm6125: Add cpufreq-hw node
  arm64: dts: qcom: sm6125: Add CPU idle states

 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |  2 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi          | 61 +++++++++++++++++++
 2 files changed, 63 insertions(+)


base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.56.1

