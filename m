Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463656;
	b=1YTg8Ad48WcEPb559iofuVHyE1jxaNrsHMbHDaPYqlDhfpC+IMZVhkS+lkChQVoMwJvK
	 ZLoiHv1mgR2NVOqMxRBqv5N8a3MI8I9Oxgz3wBkWj8tV2XZhAO4UcDZXYu0vWOsO8AUco
	 svzGuWxGFM6i/6jAQhlZWTyF7hXg//KcKn0jKMe2W/uZv9dEO1xt666viC7cjwHAX9241
	 2hVfuMBb0QKFRc9de7rftg1ZIGs9u5jkjSnBjjlGfIvk/CYZ8jqwHuyz5vDSXfx8JqDto
	 xJoPIpWsRFW416byjyLki0cYgpA+WFyKp/noZvmmq05he3TP+C8NtYHYYogSSPWF09w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
	b=naz1NPcrqWVWP1o/as6a/4QsBtDUR9pl0fde45AczH3Pi4WvC2CLH0mwmCCgU5bnqTB5
	 a006rnprLapw4ADAsW4ojr0gYPqdoxValmw9mfMgMbn1YxNfYVgF3oB6+otsuFfzEceQn
	 GiX/JldpX4guKmHN2l1QjFOUl1RHNdu0or9HXwxA6/b+SkIGLjkTK6//Ad/j+eo5fhLxZ
	 K0lPeDoQ2Ayq0JT5v8i39wlIbWElVnW8cTtXD/EIbW5nm+AwR++spM1rtaHJHjyEtuWuQ
	 QShuECh6fr3+DehK15iykA1u0w+MgC4gnCo3YtT1v/aSdYHI+k7P/rIMAjVgJ05ntHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=HrT8odet;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9F8606A31C
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB9F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=HrT8odet
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a2551d7b5so3572849eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463654; x=1794068454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
        b=HrT8odetpVzlG6PT5VGs3+BpnPc2Mw2TCg6Mg62pOqMD2iaJtu7oyWTl5EWVNA/vn3
         j2caNx+/8+Lp3GNYaX+VceHd1d/e2KCUx5TAwUUR3FszFxX2XqWujosOgOT6cLdsae1h
         GfercsLgh5mw3Sj/8kik7Mwiwf+CGKobXIuS39BFjU9Q35YW2pkuv8oumVoMoepbEEkf
         O7PeYKOovuoZ725hkRHFAoQkXaW4gbxtx3yaE3Z9auJQ1DEDk2mJQY/lPKJjPy2vXXpa
         SL5X4EodUqmzJ7sd4vOrHJMev1V6isTUFdZ3hNMbTy0IJrLIUgsk/9vtlOWPnTqaSRNn
         cMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463654; x=1794068454;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g2Cb/etac8wlDBIYU1jh+mLLXGwBxvgStF13Lf89Nr8=;
        b=esYU3VJuyA8lK47rEC4FdW+yuzco/hvxzy5/xWp5VBVrgcvUdgI+xFZTyLp8li4QwR
         lOOYR9pl5rQgTv1VOgTnE5GQM7N+Ygzq8S0a3bb2aIpOnIeOFDBXn4YGWxwTp/GJsgaN
         OyuoyOgW8LM2mLl51PSVPmENw4lGlYLlkS6XxTMCOS1leRNZZSEhp6xOayblUkjoiZ98
         NQuBahAaA7wSo77U82u26xirUSZWcrFEnBuVcOi2IvG8E1k9ouHegQFYeVUEdpFlIjTK
         vmHqvr7VR2eLwLbMl/XmTg0L2OEMW/ZDJJCdmf8hY2ETD+uJowWHG8ay/jA5DItt0MpJ
         bbhw==
X-Gm-Message-State: AFq9FYL3xdg+b9uDSG96TGUZHoObarR7GAahLtxOmKmpMLFN9+e2iw3H
	Ay1FELB1c95JbQ906Hx223hFiD5tzqU50zdKiDMEMH8M0upJj5hhTnF4Vqwo6XvoTlA=
X-Gm-Gg: AYBFou3BMfy/WDJ19F6+wb/euPpJM9Mi2XCNBPNLwLQpRz5HGGlZVt0oU1FIT64Xsn/
	P9O+kqxU13dhQYt0p96BqyVy/WCVvoCvYNQkOG5CWMs2MPX4dq5UNdY8kN/9PE1wRiAEKB9i5dE
	Fgy/d5rDT4mXeO1yefT9RAaG0niUBCH5hwkdKh+0779+WtKB+mrGJjvG3YBNpO+0iCBpn2FfMVd
	0fXFsaBg7ac+KUbXDTlBPOSEkWJjvfc9nNV4efnivBDAAlaaFa2oQBdsmnZk9XEUStpDZtWkXC7
	uElNrm01k0oh03xfnYvbmBnX+upvSz54nOP2Egs0S/IvghYn3/PC7lt4Er7hdivcWerV7IdBn0V
	rYCHnDpEpW0+Q3IjWAUW3wFPqBHazuZ6PUrBvG0W2Xv9vU1hXc2KzLiqyvbc6cDarM7ITPIHKIq
	deoCtA4g4wPciu5v0tLL1XOW2SCsDAmnCnBVzexKK9DevYc73d6c4JkhD28kmpDy0MSbtq8Se/B
	L7BQS4VRs3h/H55EEcsKOhHsS+VNqkaBTUKUUd0ZTIgTGWpLcLYUE7a2Z38c42GiVq3UMNVkXGF
	9xysiRH82WXH67JkNQtIAWW/P+HlCEVU
X-Received: by 2002:a05:7300:f40c:b0:351:606f:2832 with SMTP id 5a478bee46e88-36a42340896mr6792581eec.3.1793463653805;
        Sat, 31 Oct 2026 09:20:53 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:53 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/2] nvmem: eeprom_93xx46: add Microchip 93LC86C
Date: Sat, 31 Oct 2026 09:20:49 -0700
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBREr0L+2pr2C7Rl5T0Mi1q+UqOUtEhqC
 He34AFcTV4yM2+BSMFRhKZYINDsovNDBjwUYHsz3Im5LjMgx5pr1IxoDP7F9Cmlss7xtKq2DMu
 Ka1l2SmkBeTsGurm0/17aH8f39UF22s62Ru/i5MNnF89i6/1zzIJxhhKlFsZYJavzQGnq/Xg0D
 tp1Xb8DFr00zQAAAA==
X-Change-ID: 20260929-eeprom-93xx46-93lc86c-2450974d8891
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=1343;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=nQH7IYxjQWl0Uk02L/jrD7c/Gl/05Jhe9uifT8TFwR4=;
 b=72t8DT/c/usG2ziXfMJNTCYDejYOegwChuxjw1l7+aVoDTE31eqcHHFF2X6tlGJkQR6szJviN
 e6gOMH2iUOUBpikuY9Uqq+c+tHuCkJhLSP6UTvWXHr6h0keVBTxpgWS
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family, 2048 bytes. Like the
93LC46B it clocks an extra cycle out after the address during a read, so it
takes the same quirk.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- Rebased onto v7.3, where the driver moved to drivers/nvmem/; subject
  prefix changed from misc: to nvmem: accordingly. No code changes.
- Retargeted at the nvmem maintainer.
- Link to v1: https://patch.msgid.link/20260929-eeprom-93xx46-93lc86c-v1-0-272791aac875@nexthop.ai

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Cory Tusar <cory.tusar@pid1solutions.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Abdurrahman Hussain (2):
      dt-bindings: eeprom: microchip,93lc46b: add Microchip 93LC86C
      nvmem: eeprom_93xx46: add Microchip 93LC86C

 .../devicetree/bindings/eeprom/microchip,93lc46b.yaml         |  1 +
 drivers/nvmem/eeprom_93xx46.c                                 | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260929-eeprom-93xx46-93lc86c-2450974d8891

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

