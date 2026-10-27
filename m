Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101611;
	b=EJsf9yZNxJ/u2tx8rz4YKTMNBfoV3E0OmMx7J0vBrDFokTAG8dfGIpwnO7EzYuTRYmub
	 wHSXl+Sz+b0cvu2xo/9JGHHsmScsUdDkuLH07XPAdHBEeQjSK6viLYYxm94LqkUT6ahve
	 7o4Zfy7z4gi0Xs1e+5uTzFLi7qnEVJVeQjJuelwIgn0BxpTauGXNlikpOsHsc60wPxIyI
	 eufy4xUK3w4kxngfrSWuH+hScJnQd738TPdYvLrvnuHGebBrebJM2ro/McPgm+p93ibYZ
	 tEYhACnyhVot7hIGD6QuoRf4y8hJ4Es2iTKIGzRh9QiXczKJxC98Eun1wo5LbXTe/Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
	b=pN+tcgYjA3wZJkMBtMYWRe1TQBuAT2ernLxGbwAQyzS14eSG4xaWt+38YJ12v6MOcGKD
	 9PteFBX/qBAjp5WQyCL5Q4yeDlkEmdCoR6csLIiO0ZwgT72Er/3GtOQn62S/02TAdThpo
	 UEsr7LVw4cw2m04/pqiJBgAEmE7xV6F0QBHsSly2KIebma/FK/EcDcYL79bPKdQfohQsO
	 KIN0j6OG7cxWTbP0927EcsHe4MB/EIq6OH953mIYK/kQIs4fWmnW5L8z1WOCsXJSxNski
	 qLSf4tW9+UwyBn0BCegscXORFJcvgMTGGiql9JyrvYdqHjLld8h1y0vh27Lk3lZbR/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=STjV0ADF;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1E606A333
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B1E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=STjV0ADF
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4395d31228so605456966b.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101609; x=1793706409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=STjV0ADFFfwY3KFt+PS+8OVbQeTk85S5kWC7jKPZK2G80klnFRlCF6F46hd+FWNlBl
         rSJhxgaKj39/NCRoT6Wpr40yGtEMq8aft4EPPSu+IdBp/E1Vp4YMrB03oEBhRtO1m0vq
         ++0yZbAwHEITTMKqw0Sdg48ZVYp6NgZkgaxDtK0rAICQlYigVmRN0cHjS1VM6/QhFPFS
         ZZETrxPYfVoyHBvBu4LmK+qVYk0uT+lGw3LUBBjJG0iSz+bOylVcB2T2Z+eXLXAHTnp1
         jHBtvv8ZG4qcLcZcyCenDWxb3/ZxGW7s6DZHoJo3pPdbyAhoGEYoKR20Zvq/9/txHOiC
         axzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101609; x=1793706409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cD5gPt3rxQPjXYH1ipKJ6amZslyQfip3D0gAJFQDmwA=;
        b=UwPkLy8tfGcC8yqp2uz/H12dApov/xrWuXh4wf5h1tKP+Tz5LCpT0Q5koDDIhyYSQD
         m1UWJhOX+Vasngn5+prDE8w7+JNDOKoHDwMhOz4OMMa75tkAMncmXmis5Qr++NvZH/f0
         v5+pvEJGk/oMbqMyRVKRuILHLpXWIeQTWuwh5TmdedWIal5GHAwcrLxjI6NR6yxVKrWo
         ZcvglAtYq6Bbr9Dy5lz2GLvaNJ26bGz8PewUCmPMZ9sYywJqggugDyz9SrAJ20xhmRlO
         a2o48tr9q5WNNAkLYB/wlmt762xqmf3qmNkmi+KIWUv90IxKCHQV3NeGTev7T5pNBVI9
         dsWg==
X-Forwarded-Encrypted: i=1; AKwUvBxWZhFv0lQJxBNIQx1P0BxUkX9hmGm5+6dp6qSlfM9AyqEExx7n85HyDhqIX01fk4VFh+p/c617ksJF@vger.kernel.org
X-Gm-Message-State: AFq9FYK14vgIJuUqe1frnZICK5t5UOK/30KbXhqSy98RBJmsYA5r8Fe4
	heCIfF1rNadw3hXzFaeI8lcxXui/VzmsS7qEIsKojrjWfJFiow63xgmW
X-Gm-Gg: AYBFou3YNv6eSzfFHLcJYwHetwtRGOIC0ZhGtNIPtnqrQ7+IY5wtc6LnDnNmzikKg27
	Jstcq2cMM0wC1LnqzKdPAjt9NowHshyVT8LwWXH5DNoc0lnc60zqiA5Ocmzh1LyRpiTAGBy6yhz
	vvu7KF/LDnqxSjmEisa/SxBbttwGwQnM05nFFu+xrixtTgJsnatNgSfOwkNNnKxNJogwzfQY2WW
	vdlIeLsvmEdOceDD9CcXvu6IFASxb/BFePpUdlqmWvGeMH1GwGI+CakBfhcSn0AqyaMI1EBjdtJ
	R274LmF8gE83l6GeN00kNDe1kfBh6lbbqt+g1aKuvrQue1P0Kg0TDvVmn/Yf/V41dQeIIFe8NDL
	cs7sohJE+pEw14ugDWj+ty+YJPJAzNTb2GzMHbR63DxW/PUzIjH7fDdM1+Gsr7SR0Oq7UH4kkms
	F5b9jgsgEAD9uSqGo/kNCVcg1+l2JqXYncN2Zi3Ck6l8AOkOlAfSQNyRMXfXtHgaUEtzq+qDkS1
	q/EoJ692dKZCWBCqEbKx3vt7ppaapw8V2Pwi6j1LiajDt+YnMTlq8AckszIFZT9017SpPrC7d4d
	hUlhduBn
X-Received: by 2002:a17:907:3f90:b0:c2e:640f:f9f0 with SMTP id a640c23a62f3a-c46bdacc9a6mr1123370766b.5.1793101608817;
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:48 -0700 (PDT)
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
Subject: [PATCH v4 0/4] mfd: max8907: Schema, pdata and poweroff
Date: Tue, 27 Oct 2026 13:46:30 +0200
Message-ID: <20261027114634.79706-1-clamor95@gmail.com>
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
---

Svyatoslav Ryhel (4):
  regulator: dt-bindings: maxim,max8907: Convert to DT schema
  mfd: max8907: Remove platform_data based probing
  mfd: max8907: Switch to resource-managed versions of helpers
  mfd: max8907: Convert to use device managed poweroff handler

 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 drivers/mfd/max8907.c                         | 159 ++++------
 drivers/regulator/max8907-regulator.c         |  11 +-
 include/linux/mfd/max8907.h                   |   5 -
 5 files changed, 347 insertions(+), 180 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

-- 
2.53.0

