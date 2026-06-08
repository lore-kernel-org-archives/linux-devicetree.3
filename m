Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC05372062
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920374; cv=none; b=JEv4MjPJKarLhQTioPTS+gQEjxVlzwewW3EJ+IwqehU85SSUcxC0dZnpj85zt8tDvtQQwgYBbiqtNFABkaFikx9Yx/tmrIb891L7ZGOBGVQjAyaSFqPhHN/gYOYu0xnPlzNLSZk5ied+Y6RvapzIc7tk8AZLOHDo5RpGDetNAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920374; c=relaxed/simple;
	bh=pfmSN65yllH6tLhlIzzWMqdu+L4C+S5GJPNQV+rUZ3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y/toiooQ5N6fCwD4yZJuxc6qF/AlyayuQ0LDH0EELRm/Mhp2kjvtPsS7MbJeStI5ABchpaIYdvFpE4glOPOFWon9gRG5xpeQj4JWwIiQE8zacC2OzmT4z3wv0MwFguqfEOmxEqVcm78rUBQXYRs7LG1K6mcqmQ98j9iiUnfGDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VdQdCYjo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VdQdCYjo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so45664155e9.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780920372; x=1781525172; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMJeUc7+7+u2n+HnGIXbVVy++zpMhMvTi9S984NETBo=;
        b=VdQdCYjoFmGIeY9oZsUFO0jgzqjwdY3zjGarY7QnIhfPGthzu6f4wO1xRlswmh8ex9
         v8/jOpx5skxvG9hKCuntjMXEruXJkzbZyrH9DYpkLiRGvnKOBBW3uhmveBwg5HlH3VcN
         awBvHmjCUjE1/C79LnLwv+wd3t16TuqGQ0aGeicsIv5QZ+vF9sQNEp19i2eHSTfYZx5u
         XBuZbxjp5EKnKmoAjxc7Tq8xXIhCoYMIS3USdlJjFPnhYbCR7NUbRnQSp5C5g45EHEVS
         sSafUCQfUHK9TTiaI8yzaNg6PbPYvjR5Y0Ws6QPiYWzmh6/DKnOxeG8FMgG4KFQP68Zd
         d+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920372; x=1781525172;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMJeUc7+7+u2n+HnGIXbVVy++zpMhMvTi9S984NETBo=;
        b=Eb1CAwBa5nf6Pd3/6vtcq71xTzu6/jlDie/chwRrke9lhlQnuihAQ0QUQL3WM1/Zgc
         DeClDaaJAgRdSOczXPmtR5FUQJc+9WZQq6k5AjCrfr7tP2KNV/9Gmo7Rpwx1oLVbPTRa
         fg9P6aXpVpmX1nW8y5NPrAt7h3bGqUFXszP394E6dgeyGKn4HXZUAU0eqGFlf/G46NsU
         17SPWbUIoL/lLkUcwYHz4m3VH7pwWLVTnv1yzdPpCO/zZYYCOVjh2fKN2c/mv/kvrFja
         3ewzxPxbNGEUcCBKO/lpFO/p6sT11+jPn6fnMb7xW5pooza5MN8CsXMANKCks78DCIfF
         6TTg==
X-Forwarded-Encrypted: i=1; AFNElJ+83XcZHM+kDhZCr3JT/Y/MgvoF09zS1JHMGwxip+6k0Ko6ri4MI/QrueyUcg5TMVzndEU4Sy58BTig@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYtKfDqJ/1yc/mExWh0kx7rnllnKGwu2mnl2w2xHtOkORbJRO
	ZOKhEidPqvLYtAGn47fVZUnGRMSEfgLZjBO3tRRjfEAeKLFY3OQSv7XjILceEHytJqI=
X-Gm-Gg: Acq92OHXPAQGGkNxXLt6ZjNo+jn8oDIXtjXVTsiNP48pE641HkTGw/LW8o5HJN2eRGJ
	NzY6DXaleg3hfwooF603cF2coGtmKFOUVHWV3n3hJoCowQLz6/bcbteVrCp1Y+MTX7gkMpj9hXl
	jTRK2Ct5D9n375W4/J7eTEc5dZe124iad6IrM8hxmaukXeYyvU79L8ieBGOrRITgigIBYzmY6PX
	4aqqPsF+B5Zdd//g2rFzujYcv5J7WVIwWWek3QqZP9455i2M4O3d7fybVZB690YrEJFf8kpIaU5
	FTkjjE2IIAX+69Y6oJu69vB48awcFElaAeqBxyd1WHQZSv9cnXGcLLnQrf0GLSbJ87v7NZk7Lse
	bbslA2wvmG9ThPokFoeLBDws0uwwSwkK1iHuWIiQz5WAzSsONxw/IZdy1ss8nAeif/uw1W10Bvz
	Iz89D+ZqrJD/kqFL8zPhocKJD/NeJ0zNQ6AgIRYf1tpfv/o3k=
X-Received: by 2002:a05:600c:620f:b0:490:5074:651e with SMTP id 5b1f17b1804b1-490c2612cb7mr222035555e9.25.1780920371969;
        Mon, 08 Jun 2026 05:06:11 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:7dca:9001:34e4:f362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm250331745e9.1.2026.06.08.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:11 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] regulator: qcom_smd-regulator: Add PM8019
Date: Mon, 08 Jun 2026 14:05:42 +0200
Message-Id: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABawJmoC/yXMQQ6CMBBA0auQWTvJtBisXsWwKGXEGgvNDBgTw
 t0tuHyL/1dQlsgKt2oF4U/UOI0F5lRBePpxYIx9MViyDTXkUHJCTT0KD8vbz5NgTo7MFYOtuaO
 Lq8/eQMmz8CN+j/W9/VuX7sVh3n+wbT/xFlfhfAAAAA==
X-Change-ID: 20260608-rpm-smd-regulator-pm8019-c23eb07834a1
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

Add the definitions and dt-bindings for the regulators in PM8019 to allow
controlling them through the RPM firmware. PM8019 is typically used
together with the MDM9607 SoC.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      regulator: dt-bindings: qcom,smd-rpm-regulator: Add PM8019
      regulator: qcom_smd-regulator: Add PM8019

 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |  4 ++++
 drivers/regulator/qcom_smd-regulator.c             | 23 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 382f7d3b4c9740ac06199207796ed9b71582c7c5
change-id: 20260608-rpm-smd-regulator-pm8019-c23eb07834a1

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>

