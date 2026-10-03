Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513B386575
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003942; cv=none; b=GCN6yu4tPk8NDbxHfSRGPvrdIOCm7rKX/Wy2eZ26CFUxta5pbmHUuerDDSQ11JBihjilwE/fQlr8gs6dKIhtlh9YNDtqyB44EnUAWthD8tJj5FqdzzNtPm0cz6MHGV5bospuwLjH8iW55KZN6dxdY1RRkituilxQYYWzN2mOgSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003942; c=relaxed/simple;
	bh=1n3hNLNA8piD8V4+ptQPNN8L/VyoZDHbBd+gVifAf3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgvIInH7txg3dECTLeAtuISPhIMh3fL6NLDSlB25A1satoCv2HGA08JL/Y4LrPmar0fGd/kI8nH1mkrXE3DOT21aqiDrf1q5Isc/PAsMUdfORxcu9NzcuMrXu8mf5P0oaQLoDY6eeUwZIR3xncbkvE6dJROPEl/4K+yiOthUKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk1FUyKO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk1FUyKO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1043025ad.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791003941; x=1791608741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x6LkvQ8Kd/cKQAlxyeidVUPpFg7ou+cK3PrsLKZpAcY=;
        b=Tk1FUyKO6GKXHLmUBaZNdYaoE7VmXVjEiMrnRJRWTCBboJ2oIJS78fj6tXEh0RAcSr
         kdAYctGmL1u1mPYIdLcFL+trD/JPPd1Cf59C676ykK9m9jmZpCYp/NaJh9Vf1JJEWAMi
         TMoGeMc/ediXMU2/enRViU3KPNrkhec8nY6Ni3VfftIRs6i9qiQVH+s+pCKYuZcNiMC/
         IwfzlJ2sn9SP2qwxQAvinUif8ynFJTJGxA/zjiOi/GLC6Er5cJCcWj7P95e85CpiadK6
         cWlxs3vSI6XOnVDcMBI6sgDcM7q96P1ajvkjxVgaIkaQaZtq3Y89uWkbTf3/eHexw2hc
         I+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791003941; x=1791608741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6LkvQ8Kd/cKQAlxyeidVUPpFg7ou+cK3PrsLKZpAcY=;
        b=sXaDwyDoJF/BRlPUqIaZaQ7/mpwGvw8OmqACicCNHxExWyInDJuMfc954t2OFSKS+i
         hQ6uvR7JgKXqCs6ZZsH4csb8ZYMnAiPgwVExpBr5y76vOyMcKJM2zxm0C2fM5VOyJgI4
         9Q6R/zgzGESulgUisevdRzmhk0BTKA2t5AIJQ/0SXRryePvJ27mzpq9Smu7T44kvCmk3
         nxNlvG0L3L9zNwgKGYmBd1O0W8Cv5D1FN36UgCIyGpNkJP1JD/vmasVHjnYIcRsHjLwS
         6HtnQ71yDbpJHkSuhtjQIBVi9lUi7eCjWqloW7wMlH3UBT0Nf/0VKZrWOp4Z6CdYdTy9
         rVNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXgXVGRUs8NdxOfNr3P9BforCU+4I8IjSMcPZhnjIp7J/7PkZpQ+9GprL4Cf91gb19cZ1lPjLK3qmB@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8zk191ONs4QDWh5VzWJVmGtl9Wg+qKOJYD7BnUa2YKacuR79Z
	8drWDu7aa6YbQFVG/Vbr5NEN6ILS89roZLM4wAV2gRxIo1BRMVDMBoTW
X-Gm-Gg: AYBFou0fB3eu+f91gn31dJ6dqZBKo5E1n9E8EccjkPKXljjlTHauSQxr1YwNJEKHpYq
	taKG+PQ26cMow2fO/cR+KHHSO/Bu4auVYHZNpCTx8sWQfE89nWn1UdeGk8QhX4RwJ3TjVl5I0me
	Ig+mgr0uN60/vILcL6yj+UkxNVu9fqbHGT0C2hKfNc/bpZyg0N/bePJoLdz4F1rouJY5g32DzcH
	SFyV9t7qP0KuTRUxQXXtNwuTtBMJq19FSY8YP73Jq0/6sIynZDW8kdYshxLtQDBLde5iD14dcTo
	3YhFYs+Jj8iw9zuKwYcUsZmQ2MTWV7JMquuesvY1MJL95WGr6HmiAleaZIYti3bbmV5r0lWt41+
	EEWCK/y1sGwdgXjdctyRg/Ab+INd39Xb1YrGOAKesTjF1Z9NkWLLhef+jK1tR9gfHKYVMQNQ62N
	3mZ5MM1HadSBR4rS3xZBdT5oWW+aUDD5pGtSSB5oGWpgk4yCGvrAlphonjrbEx9hgBOCeY0enWC
	JV7jZP4tlJ/uUJtGCoRtw==
X-Received: by 2002:a17:90b:1d43:b0:39d:fcbe:fe04 with SMTP id 98e67ed59e1d1-3a78675860emr1077468a91.2.1791003940820;
        Fri, 02 Oct 2026 22:05:40 -0700 (PDT)
Received: from l (ec2-13-230-214-216.ap-northeast-1.compute.amazonaws.com. [13.230.214.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm1650442a91.2.2026.10.02.22.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:05:40 -0700 (PDT)
From: Liu Yufei <lyf98405@gmail.com>
X-Google-Original-From: Liu Yufei <lyf98405@gmail.com
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Yufei <lyf98405@gmail.com>
Subject: [PATCH 0/2] iio: proximity: Add Vishay VCNL36829 driver
Date: Sat,  3 Oct 2026 13:04:51 +0800
Message-ID: <20261003050453.413700-1-lyf98405@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liu Yufei <lyf98405@gmail.com>

This series adds support for the Vishay VCNL36829, an I2C proximity
sensor with an integrated VCSEL emitter.

Patch 1 adds the devicetree binding.
Patch 2 adds the IIO driver, which exposes the proximity reading and
a configurable integration time.

Tested on Orange Pi Zero 2W.

Liu Yufei (2):
  dt-bindings: iio: proximity: Add Vishay VCNL36829
  iio: proximity: Add driver for Vishay VCNL36829

 .../iio/proximity/vishay,vcnl36829.yaml       |  55 ++++
 MAINTAINERS                                   |   6 +
 drivers/iio/proximity/Kconfig                 |  11 +
 drivers/iio/proximity/Makefile                |   1 +
 drivers/iio/proximity/vcnl36829.c             | 278 ++++++++++++++++++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/vishay,vcnl36829.yaml
 create mode 100644 drivers/iio/proximity/vcnl36829.c


base-commit: 52c36105f76e96b638152a42e735f2e7767ed946
-- 
2.53.0

