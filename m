Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C628360EEA;
	Fri, 10 Jul 2026 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670771; cv=none; b=or9Hlo75942MovGNImxhNu4yJTg5at+DvK+YVL7Zco1gzRZSovwee0xB8M4xlNvvXHdIiZrBHKNYAJpltJq9+AA7AmrxHpfaMRfKUOm/rQIqfHI+jzCicuTNQxq+QdMjFnSeT4ic9WeqVPxjE8DCJKOBWFsjJx2Jtji0JglESKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670771; c=relaxed/simple;
	bh=0zNFU/tESqT2WCBUBLBXE4gHeSZK6Xh+50AlNFfLRMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/zDMunenhURQIdr+YB5DeX6v57ugrWh4WcOo5yPqKU8aRKy5ovr6HlKIP4s2S3QHrSJs0BpatCV6ZnGjLSf+QodEptmRJ9L5bNxQSqjJ41DrBxEZ7XBcKdn7g2DzoGqDeDHkRizA4YUgIItf3dwgo7gDO8vJg77wVkziNbg3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MfN7BqOd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K1WwsP5d; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MfN7BqOd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K1WwsP5d"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxPXp4PsKzMlD6;
	Fri, 10 Jul 2026 10:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=MfN7BqOdvkXRAwHYVggjudjUT83XMF6Aac5V8ZO2AG+jOSxw5Am5MJ1BM3ivw0FW1z+2QV
	qIqdbiRJnAlBQoTUwU8SZ0hcNUwXo9ZVb+mEAtWQ4KKsSx3hyVcQfcceq/vIjnvyAMGxVW
	bClU4ryzfrWDKlyeyaqbu2z64yZ7jsXuHF5r9EUmROV8eDT4ev6cTaAf5FW85DlNaV0R4T
	DcO3+EMtx55LwZw3RfyTVLr32ZQdfRAD9pYWxjaF8awuDgJ4z5TqJ9BYQzvA7Ivl/ZQZ8X
	MnoMbn011YaZAu1begaKhH9tNkdtkYGznwjD4VKYH68WEneO8crKTQrUoqhL4w==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=K1WwsP5dJcKOSlOvbW/CsZ6nITchfBE7LQ7V6HlMcjTcZs0Xi0LDDM2ld9uESXPmtbGF7m
	g4IQoPhp72mBHFvHVdaMKbrTcUNWNKZFobtBAbfViH1Wdh5arzzRPYz1FV/8GivnsnrZGj
	MatGw9ZS2xKqGGYaimoIj99UtZih9SwQTi4GGpqouKni4kw07TTfFS9p8ca2QcxOmxf0/a
	X1IYEaYDiPhFc+tmXawWFmFFZQKjBv9yQpg2Ew3YoARXOkZHVN5x+pg9EFW7pc/qckVSLl
	a4iqNRQOtzZv4CdwSvvOfoJ2DYsFLZ9yp8X2YPFjvY7JQM2Rb3ivMdYzu6SOOQ==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Date: Fri, 10 Jul 2026 10:05:23 +0200
Message-ID: <20260710080523.428548-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e08c77fdbb62919aa1a
X-MBO-RS-META: uswnj341qs38uwohh85538f4dgj84hr5

Remove needless '('.

Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
 
 description: |
   The TPDM or Monitor serves as data collection component for various dataset
-  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
+  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
   Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
   Single Bit (DSB). It performs data collection in the data producing clock
   domain and transfers it to the data collection time domain, generally ATB
-- 
2.54.0

