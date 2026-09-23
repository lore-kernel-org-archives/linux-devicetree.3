Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584F3F23C5
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174954; cv=none; b=JwjPY+F5fg9poFfVc+Bz7gm3G3x4nZMtSzRGZ0AGQK1cr+DMzv4d3eGE+d44VodLyPugJvywT4hs4L0eBrPbfpQnNw+giV2fN8MRqFH7EYpq/mZeYKGQbfqQ9RXmPDbuM7Lt5SmbDdczOADIlp1XPDNVSULdR2OZhWdCZu60aVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174954; c=relaxed/simple;
	bh=pSeEJPU3lkfh8cgLcenFy2jzqxMX5d+PxutRSDesZoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VEYN2XN7oXIt2QGiqyE26uVHcFeu4/JFZCTtGDbrNgoByMPtuJAcx4F4TiFBW6iDaQvZseqZkdIv7CMRzB5NY0/8IYBt4rdM6kJLr/ep/sEZVTdGZCblWYkPqUB0/UM+PwEk34HnVIP+FwsHn1iVp+DZJtfoSxC9bqJWL0H0nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=UlsN0GUg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="UlsN0GUg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so7645185e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790174951; x=1790779751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uYZRT0nIgMlAwRKG90W+rLkaTWtRA8cAKQ7+v7bJjc=;
        b=UlsN0GUgtcuHplOFez3FwQkmoOuLY06F3v3t6oRX2CS+ug69goioqIP7TD04yVUdER
         bYTOMNJmNl0OXBrMkGFrY+mqRjVpiRwA7y0KriMOuZH9xqxiLQy8G5Cn8DhKzj1+amxM
         +8xj3C7Q0/EhBp/KFkZ1yaAqZrLQckvRiy2zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174951; x=1790779751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5uYZRT0nIgMlAwRKG90W+rLkaTWtRA8cAKQ7+v7bJjc=;
        b=ZP3+R9qEXGwG0Ty9SfSkmP7zXrPLx75ok/hLKndWlZx7d26OUxPZtOiGDJ3DVdn2Bx
         kEBAz7Yo7X/f1LO01TQrlGbD4gCAypbobkG+nQjxlFhEy5XQqoCsQYmfRu/y4b8LooeG
         cIBLOcIDVrRHMakExa4cx51p1/TCqjP8P3Icwm1w8rzUHaeer8p+IyaS8K7lGnXS3PpL
         HnNMH6+6cNtY4L5UxRH2MFdOF7311/+1aRTxAlOtq+ZCh0flx35cVv5g6LrNGgjS1JjC
         3I4QGyio8t83uUyNSv97wIFTjc5SSCVADO2HaiB6vK5D1CE3pSmpgt4JZoRmj2E6QDBp
         ETpQ==
X-Gm-Message-State: AFuF++l2TnYTth+JwhkBLB6sw7sWIeE7ueZ53FXspnEZzn+CrQ1HVtyQ
	G0DT+dDNkr6+K8iKzFa71HOK0qLrHEukNWkwLhb1rQAPhsR567Zf+1j7cXZBBJ4Ja4C2QxCIctj
	Tt+za
X-Gm-Gg: AYBFou2LX7RN69eKMkShkgiKfbkuFoyg1jbANX07iXEYFoGlyimeVD7WIfTlxjQhZGy
	gR9ndJq0OsunpcrwWn8LvI0MQ9g5JBWKnv1RAXgtZb+rXIpIKcKK+/zOK+Qe6dBXx1zDV9Mqk0d
	/9yxK4r8Nd0tF7vm42toueTi6FYJj9heZDZ1Magz6yeQzrg+rYQ230amMpxgaIVoYdvRzX5+diI
	04c6Xf1sBi9LHmaTuMOwDZn9rbTQ4qcwpjhcEAs6JDCRK3AAMjyOovMNhDrLOcijN8wRz7haikK
	yCwvQQM2Z278JO6u+z/cADbjGbmGkSDqvu2C+Vuugx28vZgTxOVAJBDzD9smu5hgAbWmfzS2Dv0
	VyZdju5lHeWRtr+I2/damar60qmbJwYkUIKYhKaZH14lUuZE1rPrUjvyDioH+9EPW23xFWVoHJ3
	dgmIGtZgUKtu4xiVjbJeH0cjZxMQTgMxHQPevWqqBjCJECPvaIQevpn951oSVC/MSEDJR5VXN69
	DGCYrlY/OMqMqo=
X-Received: by 2002:a05:600c:198a:b0:49d:1840:4fd2 with SMTP id 5b1f17b1804b1-49fdf1454d2mr40893875e9.23.1790174951337;
        Wed, 23 Sep 2026 07:49:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm82614915e9.14.2026.09.23.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:10 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 23 Sep 2026 17:49:02 +0300
Message-ID: <20260923144905.3365851-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

