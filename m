Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC9439F60
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492399; cv=none; b=GLBcbsPpI8LyOhTd33OhaHQbIs9G682WH/k2yDxhJ265S2afNwgNDby4LtQ+sA77f0bZLyp6c5Fj7hiOmxJrvrk18mDbFyydkdIk0pSd2Tfr4+kOg3ISGV3+YybrinZUWRomHRtbiSrS+DTP2Tj95aZZwJdX2GEELxMB1RBvI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492399; c=relaxed/simple;
	bh=+5Qw1AJ/rnv01BOK0sB9/jNvDPLE+eUv2N+zI5ILzRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJNjscdJxZipaO58gqxlfRFacHM8dThuQgeKuehwuFeoQG9RWml4lNRtw02PgxGg1DGlY4lvPh9hbquV8PMVSZDyRStIXRiIOJEh9CnC5rIlfjbvUSnI3h0SC6wDxptW9vZ043RS49erByeBjuSQYMp4MJGGFoUy8QRAVKybSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSIUlwuc; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSIUlwuc"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so3809611e87.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492396; x=1790097196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rZvOWqII6zhNAM1aIgNmP7tEU6m3yPOZhby2VtHyYc=;
        b=OSIUlwuc2YF5ZAkWd0Yow+qrxO7IFgF5TfeGpS2DXanPLDydwbcjpOGjSx4rJxOKdq
         GXRCeRWElRJZxr4Ni+Um3fl1xAw8BQDrINNGC/aZaagy+tNfAPNNN0ndf+X15MiGx8WD
         C1KdwxYGo2TsGZVtAMw6ydFXybtm8wDJp6C2vuMnhkjyCtUXSeWL9SsXvXDCYhScD7xk
         l6iUEZrTIq9wfHJLzEtcIWDZI4d2ii9rWsI5Hf+a6ZM0C5FvfJjY3VbYJC0/kE01CohU
         FSMjtovFKee/8toUlK658Az6CCtzF5VN+xgBPVfAxtvShfRjo4nzWw6JwU7lZk4A4W6m
         HClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492396; x=1790097196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rZvOWqII6zhNAM1aIgNmP7tEU6m3yPOZhby2VtHyYc=;
        b=wmc0kQlu+p6/GQVJGfezzmdjev6oGtNlZxmakdvZJ81jGHN0297M0/YGQGBhMuArba
         2Ubb4NlnU0g2Y+7seKmCkm3GKMPDDPP0qAJtC1be4s8fmNyD8u6md6Mw0K+nmjxHpbMj
         o/fyXPv2d0tamO3lNPQO5q6vPXjzRchDgTgcb2Pf2H/CyDgXFVhhYU+zz0hoKU6hvNYf
         TJ66bV8kbBKI/paxGbgtXSCbQoCx4dLq2WSQ7WDuaVZ2zYMNJ7KAcsdkhQvySHJOdgYJ
         U/jpgnPeBVqonBKxso7SImUm7Mcdj9xz/AASC//qmzCjZnHJktz/xDXgqTZpRTyAZQ7y
         Vuew==
X-Forwarded-Encrypted: i=1; AKwUvBz3fDJVYqZoWzveqcbIOWmwXlzhjFlwI0bCPn1UQft+1byy0Wd6EJzqrAA7TS5z1Aw8IoMzM1TR+OIG@vger.kernel.org
X-Gm-Message-State: AFuF++kn3B1P6S1cypZeDeVNJU5Rped2XCs4UzOVEwW69oNfgQY1/n/A
	0Pn6VSpq2CCn7EQ0G8uhb7tF0IXkKs0nQG2cwVK6Ka9QIUX0983zjVM=
X-Gm-Gg: AYBFou2MR7djTGZ389IKXOA3uXl0A1iT9QeE1eZ1uZMOyKy9UNdHxb/+iAYbvrYF1oq
	uGDEWKhgQ1HOVBcz5GQeaZRzSPRhHMnqMFh/EZwknkZD33Uz5gQEi+A7fFBV7fCEVMMpphdimt9
	IPmcPSYltP/fz+xhLnYStgdFg0v8r0OB8QcgaWbn5evC5HUzLtCTkGa0yUwgBad9qBGvhMDeadI
	jcWzoZaSowONG/A+ez2rMoTDUAEt6mVKisaRA6/wwij0HEQspWF/MGVtwkD6jzB60gi7z+d5xFM
	Dq8T0baNZzhnYt+q2btuL1ECWZG5DJ219dNqz7QIMuRtQL9UHQbWIR+5EEPMkDytVp+omgJzAAN
	q35EO3eKL3CTzs7gzQLASXcapGTZNnU/KX8q8TfF64GcLYBY6BA8d5G120qtPaQ3RaLdTpIbBBu
	UXBMzjMo5FRS+SzXiNVyYWR0LNR8YvG4oo0lAOatA8SqseOkG17ttTGF055ENNPw==
X-Received: by 2002:a05:6512:668d:20b0:5b8:afd2:c17b with SMTP id 2adb3069b0e04-5b8afd2c4cbmr2852103e87.11.1789492395427;
        Tue, 15 Sep 2026 10:13:15 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm91791e87.79.2026.09.15.10.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:13:15 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH v2 0/4] thermal/drivers/airoha: Fix AN7583 mux mapping and expose all sensors
Date: Tue, 15 Sep 2026 20:11:27 +0100
Message-ID: <20260915191131.25214-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN7583 support merged for 7.3-rc1 reads the wrong mux positions: the
mux field names are swapped, and v5 of the series swapped the call
arguments to match them. Patch 1 fixes the field definitions.

Patch 2 serialises mux selection and ADC sampling.

Patches 3 and 4 add one thermal sensor cell for AN7583 and a zone per
sensor.

Tested on a Nokia XG-040G-MF (AN7583) with this driver on a 6.18 kernel
in OpenWrt. Without the series the board powers off 2.6 s into boot.
With it the three zones match direct ADC reads, and concurrent readers
during CPU frequency changes gave no failed read and no shutdown. EN7581
was tested with equivalent changes on a Nokia XG-040G-MD. Build-tested
on arm64 with W=1; the binding passes dt_binding_check.

The EN7581 IRQ ordering reported by sashiko-bot on v1 4/4 predates this
series and is not changed here.

Changes in v2:
- dt-bindings: const: 1 instead of enum: [0, 1]
- Drop the note on device trees without cells from patch 4
- Rebased on thermal/linux-next

v1: https://lore.kernel.org/all/20260913145226.34643-1-sochnev.v.74@gmail.com/

Vitaliy Sochnev (4):
  thermal/drivers/airoha: Fix AN7583 ADC mux field mapping
  thermal/drivers/airoha: Serialise access to the shared ADC
  dt-bindings: arm: airoha: Use one thermal sensor cell for AN7583
  thermal/drivers/airoha: Register a thermal zone per AN7583 sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |   3 +-
 drivers/thermal/airoha_thermal.c              | 159 ++++++++++++++----
 2 files changed, 126 insertions(+), 36 deletions(-)


base-commit: b115930d716defc3a7daa2bc2ae2465d864b7114
-- 
2.55.0

