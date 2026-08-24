Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF5381EA7
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596748; cv=none; b=kNgdhSveL2+n2EMLs0YjI7qwrj/K+R3DLxYUqzFYZ5qsEUUqn1WWt4Gwj5v1x3AG66s/IRlSaNHED2eGWhrI2kfU6QEeZ9ZzjZw7VxuB5CBxDk4eLSO+B5xtrcVyKOfGAYgkTi9XD13Uic59qzy9+zt6XSPA3fUfI4MrGoeEzx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596748; c=relaxed/simple;
	bh=UcyJEQg7H2gnviO8EH9JS5mN+ToiD8s+ifVtmSch4qY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZcT4JEgDlbSO/GiBNFjErHHeUd1RKS2FncOJoCfS2DX88sVhdI/GIusdS6V3qBBx4GNACQgcE0cLEHwBLVUW0alf2r8XK9Gw2YoFhT98+1J+ed/2f1U9bwDSx4uroK2wMaSdYcoLQXkhKs6veVAezei1roYqh93CNWfUMjP8r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlfIu31t; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlfIu31t"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so6578282a12.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787596745; x=1788201545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HoRsXIEXKhVImHPPPTxpEdfN4hjRFo5aCqfJBTRCVE=;
        b=XlfIu31tPD0clP4x57yU5sm6th9o1NaZ2fdp/ZIfKZSb7IrCoYOj0aKvkQ5D4f1C/S
         IS0WWSzF8ut0M7LXk25nPSXHcxgXSwLfCpChGHtiiefRY8uI9SSmbBYKTGwU5SZhDWey
         KNh/8hHnoh4RMj4wNF9KyvCfYmGVWbxnZB4gtkauP1Zzj/G/bfUt7TMgPHHRRXK7U9M3
         J0CaCrY+AiZJKFcM4AQhQ7ANoGI8bMIsGlUEN37nwy7JujUfbT9LI7v25pEuKRxBUta8
         elnSHrJPrZGvgYKGe6G7r5uyzRkMl20eDIfOSD4mGtDf7qSvPnAFZaZFDBWMLkwduBiF
         NtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596745; x=1788201545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HoRsXIEXKhVImHPPPTxpEdfN4hjRFo5aCqfJBTRCVE=;
        b=I3gFIk/AmB19l57SYkGcrYrMqEru71hwVr+TYjR48QNdp0sTsi7P5CQzqvzVdqPTsv
         d1jN5yxiibnXCLLQz2yfo53F4JrZZB98iHCKfdfCb6Ro87EYNVya9qpvfaK2MmUoJCEF
         B5rP95t/mBvsuDpHstbI2lhA3bTcRiFYXhIXIkebLGEa9nICzmrbNTzJqx0SLRPMMems
         C19CKwiPXM6Fu4AYVTXlExdBCJqkJMTzpqFeg2624sfvuwUjp22Jd9MlLwPTGZSlrdou
         K+IzqQglR7gDO+auyZ6R6waKkt6bAJAMZf9pf0hkPJko4BpZmGtzAW4YbZDGFOo8r2b0
         7IBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcIlktEti6RKwCSEsW3a8dU6iFhgDqad1PC95zZEdxA4z9WVH5XLJKFqDI3z+17Oecrr+IxxKFyk/w@vger.kernel.org
X-Gm-Message-State: AFuF++lAOnetZZp2di2dsczTlEcnESA3QwApyJCjILEsSRJejWLeDHfY
	5V+DJXK7xK4+BWZ4rxA288pbfkZNcbeTUqt6Se1zjU9vq8/qVTZjVX9J
X-Gm-Gg: AR+sD10pDj+CdZVhQxcENOmNb9kK2klRLUHdDOOkLL0v2vHNAY4IE0Cj1pVlQpyNqwz
	B9gvA/jjHM2BJ/TQzw5iQrM6Yo7D7mAWhibwzd2ungHWp9PWvltpH5QFBaDCv2Wf58oCVPHt28o
	hKg+BOzO9AC0p5LMI8imYwnYiRZIgSTErs5kGO6BkjRE7+UulZkW7jt1ZeRisCjFzlFhoiRGg+e
	4L7CZPqgFh1rmBQD0WUdWdMRxHyal7b0BgBjERMpXvvotdETiYwwwKYfJBF+fga+rdck+gt6cv+
	/dpjiR/4DVj1mW6Jvd8yWEhYg3P1KvFs4ObJRmBZGRK1QCDK3bpBylRx7Xhc7mTAxVbq9A0WCtY
	8tA7LwLpdsrFBT7G2SRgyBCK8X43llgQUIWvyA1IzAJHa30pN7kBduN4icatE7AGgPTjB7mhu37
	eZPhgAyFKY01VfhTeWEnbEqCPs7wlp3vPLdTl1ljnVhuDAsSdSIxNlyFEY1AduGwLati8x/mYMj
	7vCbmFBzYKJVqdJTOW4sXdSLk5GD9pWF6GbnQ61WeutBg==
X-Received: by 2002:a17:907:3e2a:b0:c21:7feb:4574 with SMTP id a640c23a62f3a-c246a2cece6mr2862354366b.1.1787596744812;
        Mon, 24 Aug 2026 11:39:04 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([2a02:2f08:440b:2900:8e59:1937:8c58:aeb6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1307499266b.47.2026.08.24.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:39:04 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] hwmon: lm90: Fix DT channel constraints and reject unsupported channel 2
Date: Mon, 24 Aug 2026 21:38:58 +0300
Message-ID: <20260824183900.8983-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intention of this patch series is to fix DT channel constrains in the
dt-bindings and inprove the driver to reject unsupported channel 2.

dt-bindings:
Forbid temperature-offset-millicelsius on channel@0 (local sensor).
Rejecting of assigning temperature-offset-millicelsius for channel@0 is
already implemented in the driver.
Reject channel@2 for compatibles that have only one remote sensor.

driver:
If the sensor have only one remote channel, reject a possible unsupported
channel 2 and return an error, similar to miss-assigment of temperature
-offset-millicelsius property to channel@0.

Flaviu Nistor (2):
  dt-bindings: hwmon: national,lm90: Fix channel constraints for
    temperature offset
  hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

 .../bindings/hwmon/national,lm90.yaml         | 29 +++++++++++++++++--
 drivers/hwmon/lm90.c                          |  5 ++++
 2 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.34.1

