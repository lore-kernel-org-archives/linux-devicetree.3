Received: from mx1.wiredblade.com (mx1.wiredblade.com [72.51.58.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD14A3C1082
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.51.58.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075708; cv=fail; b=VQW0Ot0K83NvynZA2VfR5bWhhJz2J4IsRQ3HYIbRnjoKlLXY51npFSC4dwH4QNyQdDwsKmjIJIzrEoqK2lORHfRq/s7+YiZFHRh0vX0iz4qkgMQm4foDkKSGYyUFC3VKd9X8uczLkr1zwOYHgH9JicwteT30D2vql9XM/ZZYauA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075708; c=relaxed/simple;
	bh=pAeTYzgwrIma4T0EmfQBPjqpQmrfwT/lwP3uZKi7OOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pJA5Q16E14AOWs6h6cSjBI+GD1qKoTLeasa9VInfM+Mg3vylC3eLRM9WOfq66pKeBOh+jzMc+eDalSlrD1vncoO3msMYhvUlO+Ng/NrV8z+/aIRcmFHVfMGwU/HfqsP7OVBuEr8IRov1lWcW70BJhfhe64HGLcjQBP1dwfCPb+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=psihoexpert.ro; spf=pass smtp.mailfrom=psihoexpert.ro; dkim=fail (2048-bit key) header.d=psihoexpert.ro header.i=@psihoexpert.ro header.b=T4uzixyY reason="signature verification failed"; arc=fail smtp.client-ip=72.51.58.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=psihoexpert.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=psihoexpert.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=psihoexpert.ro header.i=@psihoexpert.ro header.b="T4uzixyY"
DKIM-Signature: v=1; a=rsa-sha256; d=psihoexpert.ro; s=dynu;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=JCV7TNmivDrKZTMMPq5ptyzKo/jd7S9u7SuQSkaTGPw=;
	b=T4uzixyYfCnse4p2tvAV6lMAiSXmHIHSRpFuWYDiYoLniKYKEarVqVSwDKqeT0AsuZO5IByVyCECcFoPuESatWe9erfIiPe28fXy7XjZegzHAdqgJ04AQVQBtg8mDFz4B8zxJP7QT4tGq2UVY3qDbwRmNOmkH9lOD+QO+Sl8Njdc6hvJsWLz90ISoT64kZ3JJJ1xScveCUeNcMdJcHS4LF0dZK1j589F/cjNaSz09xqUVfG9GfvTeX+XVY
	Z/kUpGJ9XlAE5mEwaFKs9R5/gvr9ZPF7qKBDuxXAR9l7Ur9o+PhRtrB1W5HudByZKY/aR4XT44VCCp7Dur6XHMqot4JA==
ARC-Seal: i=1; a=rsa-sha256; cv=none;
	d=dynu.com; s=mail;
	b=jxqRA+VDt4OTk0p6mSf3Cf+Lj2yA8HJ+T4t+NbirS9OKEFgshoG8aDCJ9WZVrFJY/G6fSWvoS3F7lpnmDV/whDOKgHwsYBJdWQXUMJpJ2YCOMwIoRBE8c1rUPezWmXvhoSvUg5q0i7cMcprnkCK8QmtgM7/bVFKguUmn2guoZZiq26GaG+Rhx3xjcdo+NpYBRt/Yr/4BO+2t6JyuMnbR5oTG7dhHcrBnSze0YkCBY/5nKN6hGn1AL1/fua
	KfVgbtV2NkH5qEm9fpsrETuklEmWvEWvunpHPAhaFRcI7HbZlubsUWgU4Rl4IUc3t4/tMwcAToYwrwVko2bsuzMHEXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dynu.com; s=mail;
	h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=JCV7TNmivDrKZTMMPq5ptyzKo/jd7S9u7SuQSkaTGPw=;
	b=zCCJW9uEB0eyIvYt5zFgISFo/snqX7bbCx3NUwi/PBqGld/mQj3mrej+hPPFCiU0iihab5JtqD1rCBn/wJr0XCoBIWzr9LwiFkVipm4pm1M+wR30E/c7iAaAIg3zC0EB5pjyAXKMYC8PaipVP6GG1sOXp1c7CTtpa4rTVaayWHFspUZ+ouaRvmuQ0BCJ7b5OwLc5R+ZH5HEDHeSrLoWNfy/xZ66OumPhhxca+eCt3ltHtgn8E4FNYhoVzR
	TWvJP9vWSZpqSFakNYT/EB1LDcyv3CG71Dz+Qa287rbhfAL9vfkVymczBn9GS0LmtpdiybwzgzFQTfZJiM/V8+2Z5WRQ==
ARC-Authentication-Results: i=1; mx.dynu.com;
	dkim=none;
	dmarc=fail
Received: from TkB (188-24-192-94.rdsnet.ro [188.24.192.94])
	by mx1.wiredblade.com with ESMTPSA
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256)
	; Fri, 3 Jul 2026 08:47:14 +0000
X-Original-Rcpt-To: m95d+git@psihoexpert.ro
From: Marius Dinu <m95d+git@psihoexpert.ro>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marius Dinu <m95d+git@psihoexpert.ro>
Subject: [PATCH] arm: dts: rk3288-tinker: add eeprom node
Date: Fri,  3 Jul 2026 11:44:53 +0300
Message-ID: <20260703084645.7001-1-m95d+git@psihoexpert.ro>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mx.dynu.com;
	dkim=none;
	dmarc=fail

This board contains an EEPROM that holds the CPU serial number and ethernet
MAC. It is used by U-boot when configured to use upstream device tree from
Linux kernel.

Signed-off-by: Marius Dinu <m95d+git@psihoexpert.ro>
---
 arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
index 8e27a20f2845..7e16022c7d9e 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-tinker.dtsi
@@ -344,6 +344,11 @@ regulator-state-mem {
 
 &i2c2 {
 	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+	};
 };
 
 &i2c5 {
-- 
2.53.0

