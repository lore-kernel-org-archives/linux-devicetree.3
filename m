Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F05325495
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527252; cv=none; b=uKwobGQ3SVRkdbl8/Hf9PtODIF1PPTLXUq1EExAWLjUqwxjtBD2SinPJjBzE+XPKvVomsjh+HIPIda9JBXD++Zo5jHqhtRznfjuluPMrmbTFIZti/0zEDNFPWygkpV9s7ZS2rkvjW7q44kmVJ7UR727injd65FTuRuyrcx9wMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527252; c=relaxed/simple;
	bh=00Y6pFdZew/zSYefbBU5VVKaSl8ILbGOEdNX1Pva6f4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R51JCHAV+ojPD1ThFSQrU9jMnfeBrWO5ZJ4wpZyl/IT/qa/ZyVrE1lLrp0VuHF/QFFyNMaStHAsD7yuHsHLMJ4hX7V4bnG8ks63aZfUtOHgNS4rl+9SdJJ7BLS/8/4Sq4W+OIeTIBwXdTO6WUKazVnUNiyqWYlEdQ+QM2/FeYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbF89Xry; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbF89Xry"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so606015e9.0
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527250; x=1781132050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=hbF89Xry5pAGlswn/2teLBgadfiVDHX4N/X9wlQeUnBT3idZS3uVtcnGUKL1i8iDgQ
         BrakBhIgQo/MXRh6gtKt7Fu6mOqoyPqp9ImcbPB8Bw71YNo50Q6QjNtFPm4UjfL9xQq1
         n7CQHCDFq//Uz0ky2AU/ivaC4VnHbF3X1ZfH6aC3ULusdh0utskPqcc1L0MRqXgp2mit
         LFbngIfGQtsAdeu3aprb6IOfGPpJwvYMXNCHxxHNJTX7/rKx0oE2G7kULT7k3lOCyVjN
         LShVqQQiS0Ux4pzwHDwLE2R18hCJgYZ3C7BHM0fvjcBie/H+a7jxOko5ziLrgVy2MJ1I
         ES5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527250; x=1781132050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=bfUumsZWVJgjKEBvzWokPt4R6VdQzm20hDJmraZLx1Iqo2UupwOPktuLZ+E1HUwygH
         EKtqYNepQ7LoMGGPb0Ak5qOgI8Mafru3akNKi57kOYM+xI1H9Ucmbl6fv3cQN5s+X7qh
         YqSo562WRvqoH32XEdwwGq85CLglCDwrT5nh3v7USuFI40BdJTILYCuAx7MrorcUMDNf
         bjwZL5CC3IVluYoZ1oAFfYPYXTowjV+0OnoM9ZWKf64U2zPGBhgfBPbepedsPJ3izx8a
         oPOnwIy6FjtBx5BYQp7PG7wWH8cI6qLj0OHgJrswnfXuCliRxIxDioxr+MQKw2TlFR7n
         Fctw==
X-Forwarded-Encrypted: i=1; AFNElJ+k1SdyqTp4BU8wHzQ4sUa2T35WMupJk5IIJTqYkap1FDuI2+F2wNICcY60JUpVfJ6EdmltqFBbfi8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxEPYDXvkc6D5QoKv97aPi8347XaLr4oPFwDpv9hZ1xLaMfwYAh
	WoAQZ5UGz+cefMqIQyaGjEeiVH3K7+hfuJfDytyigoRk9CeNJG6xxVsV
X-Gm-Gg: Acq92OGi2Jvz43jvGD+Y/ifoqX+0K08HaoYX7xXW/AnlKeQf+EcuXbi27n0XZaQQoG/
	MyJtCrDQ0+BJN4h+joGrkxEZyFZRADO7ljg2q0cvAe2p0S0jB64/nKzaBYW3SJhnxfrxeNqWZMR
	WAvVWVUGmxksaXt9iQqy8A+MFMzJxra8tUcPfj8Mlq32xAA9dCa6RQfwL+wJppoCi5UGLbAewNI
	S8tDb3NmbKADmoeiJA3GwrKsKbDZZZDVRTRWBJB01lBwSpC5QwAFLn8JP0vRyTEfmPoDjmxOOh+
	OvsvKMH8Upkcd5I3e1m+v5Ho2XCNY7LN3GR19BGmyFOA6LzvZObSVeSyMvdprcxqNxgoImW6kDL
	TlOvrH4Cal2SXbUqzvGCW50HFH6IeEYo81vuwM5I4otdDK7x2FNdE//XwQCsXnaDIbxBhMHR64X
	EOa1MiMPHToN5A52i0kMbZI8O5LrZJX2DkC/c7a/i/tCIbo7udHIiBKtXwMEgwZq0UBEovAtpTy
	sC4S49yPbQ7eq2yWVYpex6PtAtC+mXHGsVR3PX77e+jGXk=
X-Received: by 2002:a05:600c:c490:b0:490:b0df:9eac with SMTP id 5b1f17b1804b1-490b5e94d73mr88883525e9.3.1780527249399;
        Wed, 03 Jun 2026 15:54:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm-var-som-symphony: minor board updates
Date: Thu,  4 Jun 2026 00:53:58 +0200
Message-ID: <cover.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains minor updates for the Variscite Symphony carrier
board based on the current hardware configuration.

It updates the RGB_SEL handling and marks the relevant input devices as
wakeup sources.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-som-symphony: add wakeup sources
  arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3

