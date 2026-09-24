Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FED49BD74
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790277794; cv=none; b=qZclz+5SjfAvOPAUgAuc34IPyXMJFSjJ17+Afs12NvMNYvH7WtGQ3Pl/eqVZ+ALyJ4MmHRPJ1ScSUqmDngdLDUSr4plz7HZRi5Bv/X/orBSacr9Sqv2EWv2kQX1Piu6qqLpYCsZdRpkZBdgwAJa0nzzrJCKHEbmtc/Q9SJ9QTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790277794; c=relaxed/simple;
	bh=EoQb1skN7Q5sSCKaIbwupQrJXSajIUmdKDM2ZPgRsRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR9tPNbljUMjj7jB4kc7XIK7rT/zN/rB/WgDN+HVFUTFG62gS/2j9yEsdaX+n/KxgbpW5Ozz/r9J4lTBZ89NMqhvzCvZQUdgRinAr69bE4WgGDjBQxduLUGBA0/54/5N6p0dcn87TYBnYF5o2tsB5GRPmSiXezHq6dSfMJ/8qyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NGZLis28; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NGZLis28"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id B07D3240029
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790277791;
	bh=nITHRcPKbcB+AhbMxeU5N4RO/HPZFix5FniAHxSYaMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=NGZLis289AJ0scI0Y6646QdWwarYkyprpmgJk6atvUtGeJ9fUzFb1x60aLAQyYpU8
	 0DST/18ABweJu26PbCVH38heL/cr+/+0Wsw5FBzKHiOEn6q44Qc3h8Gl+YQI9+HrJd
	 ZIpCxTmHHQApPWhDID0/TslJVFpewDt2n1YC0jiQZYCgPfNgnLSJUpoldWU7tAyxz+
	 WgsGHhQkugRd/3+/mAYQGCRZKJc7MSa8XYXnUQb0eJp6oYMQ0J3kgPwkVZMOs4RjgI
	 ZN5zyVLXsi1G+ItnEI2T4uFfcQX+m1d5wHlTGmOVYqpOO8J+Mh7zmGY9167LtmQpLx
	 FFSVJxPFPtbTA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrNz20zRqz9rxD;
	Thu, 24 Sep 2026 21:23:10 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 2/2] arm64: defconfig: enable Moortec MR75203 PVT controller
Date: Thu, 24 Sep 2026 19:23:11 +0000
Message-ID: <20260924192259.20517-3-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
References: <20260924192259.20517-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Moortec MR75203 PVT controller driver as a module. It is used
by the digital temperature sensor of the STM32MP25 SoCs.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6d3d94ab7db..fd4da6a61ce6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -765,6 +765,7 @@ CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_GPIO_FAN=m
 CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_MACSMC_HWMON=m
+CONFIG_SENSORS_MR75203=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
-- 
2.55.0

