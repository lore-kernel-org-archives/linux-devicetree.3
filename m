Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733317;
	b=vMG+n5NxL6jD20+ItL5dNLoGDOVlgiAp7iYv/+7FtIDQxpNu0lauwalCMVIuf/Ktswzv
	 adj9ocrJC3feg1CTeq0dlpQnG3lnSuUURaue1JMZXggbwJVqSes1XRfxexlYMWKgIEamI
	 oyECqbiSo+Qa/Kqm0I9zeZHdjx4izDvTsgFCxU7uERxwR3dDPh68F6WWcXLSOrGHuzFKU
	 p9w0TaVcAYh8JpmboUTm/nb9HLUYdpWIZR13UI1Gy2BUlPNOJ3uNqy2R4S7qAeFVUsUJd
	 W884xQTRpBo1VBIgRRxyIQYOH14DUiUqAYr2l+lU6O3XkZvSpDQE4rFlgHCkI3OKevA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
	b=d7fGat/qyCeoBGa7BLTuseAHXrXyVkA/QipT/1W+fKHV4mnoE5e30KufL1NRe8wHxgIQ
	 513Ahjs3cGrkSQT3yDE8U0HodY0XrV0DzJNMK8qiNt8P2e9HrV01U5lYVn82ESiZy17IN
	 AoPa3tAn0yFkYtRLFugVhr6IvV6JVe740ScFdG5PFkJtP8xA+eOXwfVoIdhfazJ7Ki61v
	 KfJWMIacz6lJaZEv9ISUVikh03e9MGquBs4HtggnGEcRjki5BdID4w1KcM/skxezdu5zG
	 hV9cOATw9+Cd68EkDh3rwW9Rl1roGLMl1M9vkRXFcqCzZkprFguhO6R3YeUASA+Gtaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6eo4mK+;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F4606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030F4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C6eo4mK+
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so434932366b.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733315; x=1795338115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=C6eo4mK+MFDgCNoUEcklPjlO1ph6zkPxXk5Du/g4M4E9WkY/4MB7EhWYSkSG3O2Y6f
         srDSDJA1emEc4AvqwID5YxXswF/6xjFE2hqo4ktd3Wugnh4NZ6gnDzYpf1fvZpnsSC+D
         MHwS2c3EguCfbZvWa72eynSoAWQ0HH3bYUK1mwF08SD9YAXcdA1XkRawDatF4ob+2HZw
         rg19N4xzudep2TcranCcCjU2EtixMs9aMatoc3cLCso/w0q2XKrVuLhmqPeTCMpGXNon
         kiavz30P5qbqkebbDACq0uemp0Cmt0Q7O8cw+w53xLUUutqaq+r3fUE6O4m4tpD0CGrE
         YI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733315; x=1795338115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=por2T3Gp+tEuNMPyL/YvZC06GbeieK6i8ZhJKNw1bi8=;
        b=tc9PI2MXm49umPBQzIAaE3mnO0Cg7PJnaBqtAYHhUyQBC8aAf3d1ecN0PaHHur3LAd
         /jReW5BAbat9p6DaiFfo8lZig/sXCsBD2ntai/uXqOZ4XyTIDWVFPas8D3yONBHk2240
         7NMh6onZhIpOLVAx4cd+5tZB2+Fp817XXFLZDZnTfNkU1s/y4MUOSPKckRVBBI7vaMud
         95DEGwQJVM3mBUlP/x71q3aetxHEnNJq63N0WenEppEMZssJiOpFxWs1sohK22tWpOrQ
         CbYnP/AFZUIgRACq1RIOcXaDHG+wmgbJ5N7hQPEUHNJXrW4fq+kQD5gicjPLFmUD9oyp
         M57w==
X-Forwarded-Encrypted: i=1; AL+hErEsALq0MkrOz68GIkDwmk0t8zAxCFBkyHj5GkVgLUj+CCoW+hrtZrzDQqp4b3++uzJa95ZnxAjzY44z@vger.kernel.org
X-Gm-Message-State: APuU4Z/EGh7zoeB4/gwYniKKXS4ljj4llvZgiHZXehjY2j2jyS4LiXA8
	TzhPGiBzqFU+Md0Hxog4DLE00GK2W5RBKNXsBnd5ayi7Npol6JbeAQ8w
X-Gm-Gg: AYBFou1zyaqWcd2V77tNqv+7f25sYBDVDPum2N5tTEhwyxGCjCuryGoOQDbGaEUiXRK
	73JcDbxZXGzuNA4UQTdyBhuh6We9sXMclc/VeKvkZtdHHh/fx3h+vqWFPma5lCz29SEEmM9U12H
	vH+hHtu21k3z2RILqftKtRx8xUJQcV2zyxQDl/LNO2JdG4xKkHCXr9+UaIBp+IOyUqS3FYRMTPd
	LFtCa/QU3AcMvBZnYZe681jxQwG5FQte/NJrMXhiE2yMOoP6ZOk+h5OGWhxZyrQjO2ioEUd4E48
	+ii/mznkGHuEjnJ6/KPbSHFkshid6SXLBUoHekusaU2t2KeqyeoeShm7FrOaf+/2/VuMSQTNGgV
	Ls7vd2R4nqNyttq4RFxEvgV5mEyWHYshksFmd3VLy94DlLmAnWo1Y16SFIaX/oQgmaD8tCAG/sY
	Q07prV0eyMU5ZkKJF6GlhQCwOSlxPMKbYflO2RTCLVAy7xzaxulUhpQcbGHtQxQRouwgq1Yw3yw
	s5/vPZEAAu56uTiNPxHH86amKh5suCKxLw/WhpBqv4XaUgiVvrX1LnSneVEzTMSQXNwPItpvOLV
	r62hc75baWUcnvQfOx12E7UKTevYCB0QoFNZL1I6Hysvat2ApTWNxH0WqLDrZFeUq0d4Njw+2jH
	lai0pKirlMw==
X-Received: by 2002:a17:907:944e:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c509634ac8cmr591328266b.33.1794733315249;
        Sun, 15 Nov 2026 01:01:55 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 0/5] mfd: max8907: Schema, pdata and poweroff
Date: Sun, 15 Nov 2026 11:01:42 +0200
Message-ID: <20261115090147.95337-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Convert existing txt documentation file to DF schema. Remove
platform data use. Switch to device managed poweroff handler.

Schema includes reference to pending tegra-regulators-coupling
conversion. https://lore.kernel.org/lkml/20260924-ti-tps6586x-v4-1-6c7a8fb8b646@gmail.com/

---
Changes in v2:
- fixed max8907_power_off return

Changes in v3:
- added idata check in max8907_regulator_probe() for BBAT/SDBY/VRTC
- added conversion to devm_ helpers commit
- switch to devm_register_power_off_handler() and
  of_device_is_system_power_controller()

Changes in v4:
- dropped in-supply type definitions in schema

Changes in v5:
- rebased to be applicable on top of devm_kzalloc_obj conversion
- added restart handler
---

Svyatoslav Ryhel (5):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler
  mfd: max8907: Add restart handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 176 +++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   6 +-
 5 files changed, 365 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

