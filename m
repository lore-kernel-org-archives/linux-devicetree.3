Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A42563FA1
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963203; cv=none; b=rsccgb2VQIDnFx7igZH/pHnusVRCL4l1fTn+nf41nYk6ZC5ud4Oi1BX+uJE8QuPKEFbCpsMWg8tBODRllx+y2BpkFu3J7GKiRO0Z6lE+DWnbm23/fZtNmv/2hfR4/Z0xQLqxc3DbiYL5rWJNRmmmIFlTOfzQDM3Qp2HSgt5JStM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963203; c=relaxed/simple;
	bh=Ij+KDQ9ZJ0rGUT12NkS8OoDHwq87Qone0frg892tmiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXrQO+IgMwNACwZQVb3m/GXH/8OPbsykhhO3yqNdB9oZMy0L7hRsxqz9c7RVmrjlYP//Kz7CPyWdRNrPo/6KdcGLiS9FDtZphVcNZi8RFCUWhQs0P2txru5wtR6zO1+EhsHEALNdH+TgrJQ3TFlShWPXAI162TbBtDFU3xMzzjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ+/3YdJ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ+/3YdJ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so790692f8f.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963200; x=1789568000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=;
        b=WQ+/3YdJjiuw/ZgUjhgZc/rqGmrf8MjZfTAnULC8ICrpjDaqSh2ZrPS3Jv8ACSAnmg
         /Y+wGpleD349jAT5xSx1HfF0jfukQnxDJTa705NKx3UXyC7/nNfDeHH52WiJHdfWUPPw
         PQb/nOYR+FrhzgWxNUO9+WpYZNky0szWrHvFnm+joQUjoEfJjUhu127lL8hq+P8dFMKj
         88oZSBtoRkxqp7V07MOtlADbcxGhjwtz3Cr4qgUIZMyqDvxzr4I7CvCkv5sptkaTMDY4
         R75RgKRMwu+k7hMHJ1EptEBdrpXFKQKAErha4bc2xGXWYdhoqlZYdug+D1s3K3uPz+YG
         FD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963200; x=1789568000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0V4HMy1CvezDYDqr9F6ZiS7h+RxgWvbBNQx5to/HBw=;
        b=ACgM49WyG2IoVfHK3qNyyHt89bnkIjW2IM/JGNwmNp+juST4InQQEiPwmYLQdOa7tN
         LzP7aSfPCXVt2MJuOfH1A58tShnFmv76sMjKu0oiDxHtSF/HMrchIbYmco2fyW4KwWSA
         0oJ8FacQan358SfmKmlaXfcF+4HsLztcpIm3mywilJWILpoY6pKq+WZC835C32MIj6I/
         CaOTXs+hJfdTvnOlB3K+avwcjnNmzxjYfZ7PeLS4EuQEDRhtVWfGLXf0atyK1noSSamx
         1Yq05a5rsPBKHI0K2RlIVz6ZX0RgFGIDC7OREKEzu/UvFG/kLzlng6k1NIT6rJW5nOys
         Tu7w==
X-Forwarded-Encrypted: i=1; AKwUvBzhadPMr7VqYYhhAsghkwkqYZBdvG3QVUV4nZqmW30etdB4+7GED5Sq1K9zL5V408QuNWonY9ZO6k1D@vger.kernel.org
X-Gm-Message-State: AFuF++mcLjbwTzTl4z582Sbx8LIkO4xU/LRhP7B5uAyJna5+g+kKtzRt
	FE9Usvt9WnZWWBxIJm3X8bMPYmA2K4L5If85CizQvCeAu8A5KeQz0AVH
X-Gm-Gg: AYBFou03JigjEdGdJ4mg5/KlybOWCcx9mU0NXTtSny9T2Bsit8cI6TVWCle/bv19ruB
	QQykql8V5dKZUQdlkdBQ5P9U++yFy+NIK8RS5SRyoEzl7ZGM1D4vQbZM5BMuKVIueo8tQ6CWN6g
	EoCt5g8UOtkiJBqoojMNfxny6EQGEnbwlpV8/sRVoi1dLIR9BCx2xCrVUIA8LBVan33FY0PpaqA
	LxObcy37FtcbUl4FvZLKzwKA/resFwRzQE5+CMQp865VYU3Wrjr1ylPGD/9fuL6QmnA+x31Li0Q
	/tssp9WGKMcmlspecvx6uSUWWP5X0kysEIz/fygmE9uWQnMCUTCYLpnWnGgD2ro+9LVQBtxkeQo
	a2XnUy5FMubAGH5VdRznGmrg5HKiLkxam6pSfzVc9dJVFP8Bta87jlhlx71MHRLBnSAYlG/CXQn
	zIAQRMKpc6DmJwcMFbHUPtWXbkTJXI0+wzML1X9rga7vndTr34ArErL3KW527y9V9Ofzep2Ddrs
	UHgbj+he2lwNOt3rLZtTlxA0J21wTo3r3oFWUoRbsXKhg==
X-Received: by 2002:adf:e944:0:b0:485:8ea0:da8c with SMTP id ffacd0b85a97d-485a242f46cmr12481535f8f.16.1788963199968;
        Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 3/3] arm64: dts: broadcom: Add RTC to Raspberry Pi 5 B
Date: Wed,  9 Sep 2026 16:13:00 +0200
Message-ID: <20260909141300.1368790-4-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141300.1368790-1-sander.speetjens@gmail.com>
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 contains a RTC on a custom DA9091 PMIC that is accesed trought the firware mailbox.
This so we have a battery backed RTC, so the OS does not need network to get the time.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1a..5a82dd585f32 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -102,6 +102,13 @@ wl_on_reg: wl-on-reg {
 		startup-delay-us = <150000>;
 		enable-active-high;
 	};
+
+	rpi_rtc: rpi-rtc {
+		compatible = "raspberrypi,rpi-rtc";
+		firmware = <&firmware>;
+		status = "okay";
+		trickle-charge-microvolt = <0>;
+	};
 };
 
 &pinctrl {
-- 
2.55.0

