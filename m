Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC3049CF5E
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301484; cv=none; b=o54iG3XQ6C3LYJLFl6HoA+S93wTb+m/fqR6qNGETOTWQe3KoXKsTGVwnUxSMXbRKzm006QaPZiraQyfR7lMnECLdAqw2DAS7vQAR+xLy0R66DSg5wO5/lqW0WTkLOuKfhqdF54+NnSlhTz5sDBMGiMpHEe7MYcBelae7XUAMEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301484; c=relaxed/simple;
	bh=d+Sg/QN0vuk5Vbj+git5U7K335HCgp0F7VITjtEmHOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTbWSvqxycUZM958x/t8QB1kbcT7BT5YnFB1abE339ICX7KzFUq8zUHDep586HlklOuoyYFBY3stVbnGiOuJ8Y+z8Ng0I+glF1AWH/rCai66GRMJp0JoynFZs2zv8ejGIgV11fmUhMbmXnoQdmmLSW9EAbChfhnSsQTIZJz3cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBxHlxh7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBxHlxh7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso603177f8f.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301481; x=1791906281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OBM6S6WvMfOYmics2t4tBC7RnarAW2QTV/e/3ITAXc=;
        b=sBxHlxh7RrfoszKmp/Q/lINnhi6WjgQrC5iXq9jvHxD0q2koIyO1esP0xnaGGXL1LG
         CE/N8btpBCf1Idm6xHAH+8jP+8/+pnnxPYw6UGw6mzh2czga9pIUzWrOUaiYEXqvsxv6
         OtFx6fNxUB9Wm8CMINP23x62cym02sosl4/SQFehG5lTGNTt2QF82Z+wTBTNNQQIrFye
         8xxOacbw1eWXxEJoLX3NJLMJ4eFBOtVrcZUwaWS6XBjiHm1l5eo7949+sjGxczcl9QCS
         72C6wzaRIvyLniYYGSpHgThnrUB9simOsdWKrASt50Za8dswEGCcbAFFM3Q782PHI8HI
         9vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301481; x=1791906281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OBM6S6WvMfOYmics2t4tBC7RnarAW2QTV/e/3ITAXc=;
        b=Jr7LvJJ+AvhsSnWjGe9FK1ODevWR/yY7o9AXP+TtTVsrksYZ6bY0vx7AddWEGR/2Ag
         faHwk8lo9BxrVfn2INxeRfEJMYvR9ts7SyJZsZjjsf/eC0jkCft9gui/Xjq2ybRsg1vE
         oN4TmKbF7dcgx8jocj0tKKpRX6qew3MbZfRs0wfd/J2yCE2q1BNgiwBLGkB1b3tUT5NG
         Bc+XY7biivae3ydeJ/YWXi8wGHLLh49f3OE59xPHoiCszy4hCCgr0/FM9c1WilLw13L/
         AxZF/845IPfRQGywlrFJWj6RxE8PIMGODHc41oBZJ8vPEzM33qDkzkBw4AqQnyEkmIwT
         VB5Q==
X-Forwarded-Encrypted: i=1; AKwUvByLZ9bM2EQfcKrccq3Hd9G3g/i3K8sF/3ekbP5KrFDoxsUfpNiejdFCeNwhe1i3UWCmMROQYjls1EPc@vger.kernel.org
X-Gm-Message-State: AFq9FYKiDzMUn0bumT0E+vBbN7SrFmYYKN3lIDH1gTRi29G3t5Jsyi8j
	kUfVpgHewAynHIreqv0Q7h/d97R4/pCFTJCtLfzN21Cj9GN/7DeigvAN
X-Gm-Gg: AYBFou12dYzCPSI9Iuz4G5ruCjN4EaYVr+Huc8YyHwzjR9MuM1n2tcb/drPb0aID0yf
	b+WzZF+MOJWiyMPB3AEhCvgHzkfrDm2/9r0+pxhtu1J3P+hgr0+Rq5S36WlrBvGwbAQ2muivCPU
	47AOdfROEPbwvj7BWjXAev6KFTvzBmGyop53dypwe+cX9GnPByd8ySWgLQiH9P7ijJQD1F0UHQ3
	3lVrk/mdssr5khpCKDAcrMBefFcnvmBkcoSSlmX1cmcpHcIBYCTiEGp/wXoH4vSW/gjnUFYP9gM
	ipAtDQHJN+RqIcjQDMQpA2DJMsAx8EvfI7AXiSPcQrnb/06c05QakTirzxEZzKycduppbKKFHiO
	1MYBH+AVVgxN833Cbp5RFdE+UYS6z0a4FIIyddpJEr6p5uO3TpjpeDPBjnHQw3cAnDDjyyN4Ysr
	FxX57VwZZoC7xFygP8sXF3XqX4AjEY5C25u/G6ErUW5SyWSh8VtmReDHb7HLJWJhGk+KMxOqxNQ
	WnsoV29ZF6cDwKU5M0=
X-Received: by 2002:a05:6000:4816:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48c6d1d23afmr2860943f8f.43.1791301481269;
        Tue, 06 Oct 2026 08:44:41 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/7] lp872x: remove platform_data based probing and adjustments
Date: Tue,  6 Oct 2026 18:44:24 +0300
Message-ID: <20261006154431.318936-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert and upgrade schema. Consolidate driver file, remove platform_data
based probing and add missing regulator/chip supplies.

Svyatoslav Ryhel (7):
  regulator: dt-bindings: ti,lp872x: Convert to DT schema
  regulator: dt-bindings: ti,lp872x: Document input supplies
  regulator: lp872x: Fold driver header into driver file
  regulator: lp872x: Remove redundant regmap wrappers
  regulator: lp872x: Remove platform_data based probing
  regulator: lp872x: Add support for input and regulator power supplies
  regulator: lp872x: Use macro to fill regulator descriptor

 .../devicetree/bindings/regulator/lp872x.txt  | 161 -----
 .../bindings/regulator/ti,lp8720.yaml         | 244 +++++++
 drivers/regulator/lp872x.c                    | 665 ++++++------------
 include/linux/regulator/lp872x.h              |  86 ---
 4 files changed, 448 insertions(+), 708 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/lp872x.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,lp8720.yaml
 delete mode 100644 include/linux/regulator/lp872x.h

-- 
2.53.0

