Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C353DD87C
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177389; cv=none; b=BNkUAJvhFsLKYgeazo+SrsF/0rVWvcdtYkxuFlzjJ3wrEdjG9nLYSUPx55DXbW9yyaG9oWbUetMBECG/dcPM7HovJnV7lugMetynQAQgxkxfJFEQ/yV2n/RhZ6XAF7CH2441gtdmO6BFGpZCbShezZMWAm7Cw1YrkOkgz0D6px0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177389; c=relaxed/simple;
	bh=smqMWADuNscG6tlMAbhonjsCwFpy2DTmVY5dR7Xj9V4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=egZW06loNJGaugvP5Ad5eX1/TO2YM5Xt0v0QbYZh3IPGGXycQGNfegi7AR/UoCqDwbJfjxP1FnP6vYWGBinztP+evfokA6S8zRwYO3CzI5OqAbQ8lPwT7Ev7EwgWFJbFhZfMolpTsisT1u5gOFjCRWyUJ/1PurQSfBQxQVdDXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P688K//t; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P688K//t"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso2240610a91.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177388; x=1779782188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIQKyiWUSmY3tJlSHzG04+D9tVQZs2EM4N6KWNjkwTw=;
        b=P688K//tCexG4/fr8T9K3z+pq14jxVL88Zpnb0jnlYKuUsgc5DQk4EbbkDP1BUV4wC
         7ByWITiTkD5w4zEGWIX8LJ9HO1u9GkUFK/nYHQMi7hEZEsCMCoImiYxsMEEE3aLomjDP
         266vbJOROCdAeScm0UjQ/JV3Lmk68rdlQBVyB1hFqMFP3iWfk/CLE9ROWDaxT8XXfbgT
         RoaNSNbbDSuIibtnO5atvzuqOf97r/y/KgnDmmYErdc1abmcf+Pymk/pI2bTA8kpKOPQ
         Xt7BlA4XjNKzYF0/vLvktkgrimrlqWsxiTPXc67DO85MoJehRABcFP0XNBvpzlqXrJKE
         N4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177388; x=1779782188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIQKyiWUSmY3tJlSHzG04+D9tVQZs2EM4N6KWNjkwTw=;
        b=ZIVd+6zihzH8AfjVc8R3VrpZn4cCMe0+6sKa/tkHJ1qqQGBol8z6jt68TnSLBr8VtZ
         ufbWq8u8B43zJqKEudFTsCMp82p0LGwgZIwDcItsLXT7roHHjgnstLiNwoH0GMD88oYR
         IC1kPAQxg2M71LC6znx/zIA0xmx/3BH7O2e6LSYNGQrWjB5U+xLWEQXBlIIrHhGrdsF3
         w3KiIRh76lOWHA6LE6p6M1QBlpW+06s8N3FLG78D1qriXOsjp2gddSERVjlENJjfvIoY
         bFdbP+OPuN/zW75nKopOVShu3IMjODo3df/+bdWm6ueC+DtDy1/6Z5AF1fI6OYHqdm1U
         xH2g==
X-Forwarded-Encrypted: i=1; AFNElJ9NhCKFQvuPf6CuIxnaVqdQebQc+Q1Vq+PApf9jekfiZl7wJBl7VLkEycy038vnKrwdvLzKxbQ0bMzW@vger.kernel.org
X-Gm-Message-State: AOJu0YydQU7Sp+Nh2W4RN5bjLOlShVFb0kTonvGKEtH8UNFnPe3dcjqo
	JLfg6OPeg/X9V3OOVenAaabcWsl1T5hply9iFdTpaicIADtXxHbUD9qq
X-Gm-Gg: Acq92OFKuEeZLGH38vEO+mklaZ69edVfkO/mukMEI68NsxRY30WDXpZIANfL0usA18m
	3zN263wobHfK+QY2fh59jhP6FSWGysZ1xrYkSFCaleZeMfAb0AUtUeXM0oU9tpY+5NeCjYz0gO9
	GeJUOkm4SzdJMraPlx8wFsxISEsZgQjY/HJ4SBH/mElJHWfxh53Yg8+vy+jTyxqVWT1swjMjPVM
	YB9TqT2Wg7zrcibsvjAnNX+J9WqcWijmE6UYzZ0GspEfqG+lAJSzPYp9w6Zoypj0hYfNlQyYSAy
	1LiqtGf+eNl4NHpotNSskAwWB2sImcG0L/+vRQ639l+dYk/Cv6NHRVWyS/CMo67JqVLOGccaX8H
	s8FBTQ0YULTa+7atq1CGq8URO4KkKp+bzhxSS/0GeFunzgyF/ZsTGiH6WZgfnGDGKsGpVJedZEY
	h1Lyvpj92qoVcndzvCckpeiqx/393I1s/9WO1L1j2WywxW
X-Received: by 2002:a17:90a:c2ce:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-369514e68b3mr14199587a91.12.1779177387697;
        Tue, 19 May 2026 00:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:630b:f287:3279:f420:ef8:5c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm17116652a91.5.2026.05.19.00.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:56:27 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
Date: Tue, 19 May 2026 13:25:56 +0530
Message-Id: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for Infineon Digital eFuse XDP730.
XDP730 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP730
  hwmon:(pmbus/xdp730) Add support for efuse xdp730

 .../bindings/hwmon/pmbus/infineon,xdp730.yaml |  59 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp730.c                  | 128 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

-- 
2.39.5

