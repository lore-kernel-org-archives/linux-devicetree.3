Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B446F4A7
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935739; cv=none; b=SsoWKPsxCLgYk2sBhIobldOV52Z8e1DuTBHSecAt9x6NbiM6ElSdLD47uHElj+rFn8VRZ71A/vj4rt0VlqFVGG5HeDxTTTeDzUs7AihwQfVHDTvxdPwdU7DpEv59ret7DaIqtbNwqd5LbC31E7lSA/YzKIeKlJXZBLwYhbuIBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935739; c=relaxed/simple;
	bh=BFGcDUFM2IGZ4TgmcIIPIXiOpFbJb35N7OkBBLt79qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TyI4CzpU1Hp5QmBb5tRq/bRpbBjSXK8QxM0I27My9AyAnc7uMT3FbKrE48UnGCcRmXAROLdMum2qPcEzkT9YMF962jMIhRoOQhc0+IuotmrGMLsYU2Lno1lWZ25BoTBVww5UrNDZoxt3xT2v9WmVwKjkJPfZ0Bn9/B/dX43qqjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nd54Q3Rj; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nd54Q3Rj"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca913a601fbso837284a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935736; x=1786540536; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tIcTi6kuyQcSUxNPVhSjqqVVaDVKUW/1s+uq3qhElCE=;
        b=nd54Q3RjPW2jNgUDPVCcFnBk6Y7c42MK1y9DNLA8cfjL7mDOb2daj9QGGEC7wdUoJO
         Kh7ocunx74h9ldBpU/ir+/hXXM3YJ9+92L3Ny2VYuTcXQlnh1y3u3kI5zFNbKInQitOB
         MPV3o61IgADWZYOoz3pQv133I8MuFEl/0SLF0PY+BOkV2I03Gow1IbI7zXuJ/Pf5nbMm
         Ndx52iIdFSH4aZj6pVy7VQ+QsEhubkvysdinr5kFCrMSd9DTO+QruqILWGBBXCrz5TQn
         fwhRfIe95v+QQZ28BtASvc9L4RWTN5ZlByx2Z6nZ1v4LeXj/Ft1UnnJFz1Fs5yP3IqM+
         ImaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935736; x=1786540536;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tIcTi6kuyQcSUxNPVhSjqqVVaDVKUW/1s+uq3qhElCE=;
        b=LDhD5YuoS4yR75jYxU+OmoAZYqVivAjQhdLTli0w+o62VOaYrTJcusHDHTzzvedV2y
         Cbt5JqCmMsP//6oZ99Kub2L+NxHJVwsPFDY4UHTXz0/61ALrQ4l6cgGIiyk4rII57dUW
         l5gslMmx9IA2MiqAmXu9LfySZa7DLMoiLNyl61Z9MCY0zyeNq30lXB+s7zfU63wBvSz1
         WOmuws0SfsdMPIKgKev7uJ+lzifx5yDWr0bmaBBZKc4oFO0lkzy/xwgpe6fizggdRSKH
         yytdBVH0nMIjhc4YXNmzb9Rn2Doq8yeZbLE82GJuSRr3JHOosx7/5Clu6fbIkP8Efhkm
         0spA==
X-Forwarded-Encrypted: i=1; AHgh+RoADrUR9bosfVkrToYnUEMI/Tm3JyUaz9gOluy/FkjEnJ4GcNX1OwVcEDa0J8JOOLUBuEuh396d3BZ4@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0+54ylQdrQ75JqrExouW/ILx5E4mabg3OB4eRExVOaqlF1F6
	93A5yniuPO3KkpGIFwe2XbXxvn9ywwpenEZLeK5vLjHIsIbTtAL7rbCW
X-Gm-Gg: AR+sD11J/gZ5ipidtFMrBqU6halq84k9sqGl1dw3oM0m5yE3V2iyY6vJe6tSMluBGMK
	G+zn6PMRBVNejctWORbEfK7ntW3gJoOIcCNqGSywW4nPBOdGN/cZzKJfd0KCZBychvLZOy2xZqO
	t9LDvT4NOmex9unNxZb2eGXh1SzjZqajqcWuGkmPEXJPHs3agwrt3vcA8pXaR3SjidRmU46wwxO
	I3zK54cLuUVPRzxT1fLcNkrMPkRXLyC5XULd58zbfWQ4+jGcvjpWQ4YyMIW69tYkcBku61JWCKe
	+acXDyTCIO/Q4AmooRqOUvlsWlFSyBz6SAExa93XDZYbMW3TBq3QQ2dA3j6eSctIhdc5VP19D/k
	eJ7Jo5HiQAYsx5VXg9xa5c1MRv+HOLtw/3NzGu+JgES1UtXyJPCJdzA7bkba1asw3K6LCYxUb3f
	tTV+jDSIo0poQmytITW9u9Pavt0heWl5xn+VMI8qjIjr6UeS9NcNHJFp+9t5KK6zNHDCcafVNS
X-Received: by 2002:a05:6a21:164a:b0:3c3:a08d:5b44 with SMTP id adf61e73a8af0-3cb85ef9234mr8477121637.23.1785935735832;
        Wed, 05 Aug 2026 06:15:35 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:34 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [hwmon-next PATCH v6 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
Date: Wed, 05 Aug 2026 10:15:16 -0300
Message-Id: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGQ3c2oC/33RUW+EIAwA4L9y4XksgBRkT/sfy2VBqCfLqRty7
 raL/32oL8aYPTalX2n7IAPGgAN5OT1IxDEMoe9yoJ5OxDW2uyANPsdEMKGY5opan7TU7D01GFt
 7/e07pGAsZ0Lo0mtBcuVnxDrcF/WNNN9t39EO74mc19xwqz7QpZmdXzdhSH38Wb4w8qXm324jp
 4w6B4B1Aeg9vl5aG67Prm+XDqPYGvrYENmwAFxqA2Vt/d4oNoYoj40iG15CqaQuna/s3pBbwxw
 bcp6FS1YYX1uGam/AxijYsQHZkMIYsKqqSgdbY1pXHvHrlm+b1pucp+kPitblmPkBAAA=
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The ADT7470 is a temperature monitor and PWM fan controller capable of
monitoring up to ten external temperature sensors and controlling up to
four PWM outputs.

Currently, the driver exposes these sensors and PWM controls only
through the hwmon sysfs interface. This patch series integrates the
ADT7470 driver with the kernel's thermal and PWM subsystems. This allows
temperature sensors to participate in Device Tree thermal zones while
exposing the PWM outputs as generic PWM providers for consumers such as
pwm-fan.

Patch 1 adds the YAML device tree binding documentation.
Patch 2 introduces the ADT7470_PWM_MAX macro.
Patch 3 registers the four PWM channels as a generic PWM provider.
Patch 4 registers the external temperature sensors with the thermal
framework.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

---
Changes in v6:
- dt-bindings: hwmon: add adi,adt7470:
  - Move allOf: block after required: (DT schema ordering).
  - Collect Reviewed-by tag from Krzysztof Kozlowski.
- Link to v5: https://patch.msgid.link/20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com

Changes in v5:
- Hide hwmon PWM sysfs attributes if "#pwm-cells" is present in DT.
- Register PWM chip before hwmon in probe() to correctly initialize 
  sysfs visibility.
- Fix waveform rounding math to strictly satisfying CONFIG_PWM_DEBUG
  expectations.
- Return 1 in round_waveform_tohw when the requested period is too 
  short for the hardware.
- Link to v4: https://patch.msgid.link/20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com

Changes in v4:
- dt-bindings: Dropped redundant descriptions for standard properties
  (#pwm-cells and #thermal-sensor-cells).
- dt-bindings: Conditionally referenced thermal-sensor.yaml to preserve
  ABI compatibility.
- dt-bindings: Switched to unevaluatedProperties due to the imported $ref.
- Link to v3: https://patch.msgid.link/20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com

Changes in v3:
- Migrated from the `.apply` callback to the PWM Waveform API.
- Moved fixes to another patch series:
  20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com
- Use guard(mutex) for simpler locking.
- Link to v2: https://patch.msgid.link/20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com

Changes in v2:
- Fixed 2 previous bugs uncovered by Sashiko-bot during review.
- Dropped the thermal cooling device registration for the PWM channels.
- Implemented generic PWM provider support using the PWM subsystem.
- Updated Kconfig to safely handle the PWM subsystem dependency (depends on PWM || PWM=n).
- Updated Device Tree bindings to require #pwm-cells instead of #cooling-cells.
- Link to v1: https://patch.msgid.link/20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Andrew Morton <akpm@linux-foundation.org>
To: "Darrick J. Wong" <djwong@us.ibm.com>
To: Uwe Kleine-König <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pwm@vger.kernel.org

---
Luiz Angelo Daros de Luca (4):
      dt-bindings: hwmon: add adi,adt7470
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Expose fan control via PWM framework
      hwmon: (adt7470) Add thermal zone sensor support

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  58 ++++++
 drivers/hwmon/Kconfig                              |   1 +
 drivers/hwmon/adt7470.c                            | 203 ++++++++++++++++++++-
 3 files changed, 258 insertions(+), 4 deletions(-)
---
base-commit: 4c2e8c377915496fbe9cc1c9d91a7297aaa01783
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

