Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC553F9F2F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498091; cv=none; b=R0yjpnizGK5D6707XFqv7hxaZsvaDRm8uz1c5ppUzRe7GLcmQweXXfiClZW7oNBV72LUrbqfJaPcl60G2V3WmlVnogYtdNleg3IVQGG/SXAauJfTrY4itGP8TfntNlrCnXHhV+XZVaU9LjUWuSXVHJcFoSA9QHc7/KRHWOyGs5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498091; c=relaxed/simple;
	bh=fClExvxhAfnwcMseqq4K0j3yFwvxAa+7dc+FGYEzOWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxTn8Y02IiTuCNEA+FuMlQDZzcua9ZreNB6CimxjSH+a5lyj87KIA14DYLn9f4B3gTh/XzzAvyI3l8YhKFaBO9YN7cfzeJIfbtxjmIdezL/20GY1AOHh8ruR0848W1VAGoAX80g3vmOhiys5h2qwKUCyUROnfg8jlEzR6FRusjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfNaDWfV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfNaDWfV"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so789256f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498087; x=1786102887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R99v3fRI5K7+eRSuULtRBn5lyKFrlcGO1cKaa7OCOgs=;
        b=RfNaDWfVy3fLsLXgBPaRdSemiohLb2nkTgAh6PD8Mtgnkgc36SNELmonpMZffvLaDL
         xK4vPZ3wYdGKbCBHEDLqoYChX9jMEYFuqX8zj6KNUtuY2N0EIwmM+Qn4Wy6Z0oU9Szje
         tUVwWVZENixkOrnc9z+pHN1Nbf5RK34n4NVrEguycaomEPLMLMZVP8DtOf4S06Z/Nl2z
         NCfoqn/dBQfBWxOxcUfdfuZ531jgWtTUAn629hW8fClxBALozC1kbzIfyskQhb75FxZ6
         K46jA/67c+Z+2WJeW127wcaiPCxu1dfXGWlT+zn5tK33PAXFOBU4LAu2tyxuXbN+wrS8
         nARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498087; x=1786102887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R99v3fRI5K7+eRSuULtRBn5lyKFrlcGO1cKaa7OCOgs=;
        b=dkZAyzcn15juX9YR/VoG3r2ECmw1XH0BtxwMxWIARBnePIuVdQ2JOMSss212cOJLdR
         EHNK7pt92utzQ68ttvj2Q0Mf5+GCBdcG+8BXw4mSJz4PflTTU3oJ1tshM1xWqckVcVi/
         b9LYrcX4hdcwQK4kX9HKWjR99ijnLeDBCClk/s/wZKQzU6JJSTGIpzgDFi60K8+cV0v9
         QkwTnYVMw59EaC7aQSGoZrIWaf+MLTxcaDTz+qXcKYw/8+ziXG01dOTTKl4BIuDMu9nD
         SMbZjPL8TBB5TMuwqKWgt11b3J7cn8Xihj5trC/777WcRT44jDDBABg3x8x5vkJJE0ZK
         5Skw==
X-Gm-Message-State: AOJu0Yxzwvw0oPg/pyIG9LrNkbjqxYIPhiDJ3HBF3kD/6Pyg8bSPAbYB
	K6wGxIfnbq0tsiP7clu3hzqIm62A2bYNYTyB/3eGuZ7rjY3wYlFUjjU5
X-Gm-Gg: AR+sD13PkkXN+GdE6NxwO4lWty1dyGD6LvAAnI/TvJ+joLH/aqjqqgt35IMqBOYBU2w
	vQKNhc8dsng6XJAaZ6GaWRVX48VQZHM4ay+snEFx4cfV4htTkwY558sA3hQPXKVMyI9m1kTDx5D
	geEiBMgRIhLvu/hvF9ln7mpM37Ti2sC0NvMHyBKmx7QfQ5XrW9E+dV5fDN0CPGsF5/DLNJdgUB7
	HnVJ8xmK9TjFYZCzNy5PRz6m/jsJQSSFqsS2CF2BBeeklEoZQv+ug3hQ93t9L9w9NwLNaSjsDyc
	IDfNEHj8RswfQAjYo+3Ax38pj1FeAGWUeJLm5XbjLpdBkRxNE0jDNaJw2Zph0argV3S2gfY5AeH
	nqk4YgnmCbObJwK8rnWrIoiH/2UYwKHkgWtwlEFRMHiNFqPnrSCoSmYeFcNy4sMJKgHoBSPxOYA
	ya2avE+8Sg4tSPz5SMnWvjjiksVXVyBJtje0oBcPN5+PUSLNgzW8Y61Q/rZ+nk2oHV73PL42iKd
	NllJTASEA==
X-Received: by 2002:a05:6000:2304:b0:47f:7aee:ed3c with SMTP id ffacd0b85a97d-47fd2abbd2dmr4221334f8f.5.1785498086512;
        Fri, 31 Jul 2026 04:41:26 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
Date: Fri, 31 Jul 2026 14:41:00 +0300
Message-ID: <20260731114106.169398-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schema discourages using "_" in node names. Since pin names in palmas
pinmux is not an ABI, remove all "pin_" prefixes from names.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 00eeedf3ef7a5..a27d3c4f2c63c 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1462,52 +1462,52 @@ pinmux {
 				pinctrl-0 = <&palmas_default>;
 
 				palmas_default: pinmux {
-					pin_gpio0 {
+					gpio0 {
 						pins = "gpio0";
 						function = "gpio";
 					};
 
-					pin_gpio1 {
+					gpio1 {
 						pins = "gpio1";
 						function = "gpio";
 					};
 
-					pin_gpio2 {
+					gpio2 {
 						pins = "gpio2";
 						function = "gpio";
 					};
 
-					pin_gpio3 {
+					gpio3 {
 						pins = "gpio3";
 						function = "gpio";
 					};
 
-					pin_gpio4 {
+					gpio4 {
 						pins = "gpio4";
 						function = "gpio";
 					};
 
-					pin_gpio5 {
+					gpio5 {
 						pins = "gpio5";
 						function = "gpio";
 					};
 
-					pin_gpio6 {
+					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
 					};
 
-					pin_gpio7 {
+					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
 					};
 
-					pin_powergood {
+					powergood {
 						pins = "powergood";
 						function = "powergood";
 					};
 
-					pin_vac {
+					vac {
 						pins = "vac";
 						function = "vac";
 					};
-- 
2.53.0

