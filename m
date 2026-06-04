Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0719F3C76A3
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556178; cv=none; b=BQ1o3uw0hoHkzjBSMYeoIpW5F3txG3926ubJPCIB9aSrReaP+oTg0y+ATe3pumj5Ujl64cthlM/P0I6qsm/V5Bq2diCqnEQuoX2ZfZTeyqN9fVG2yJ7gNFFP7u1eKRxYOUmg0FKkP0U3uzcMAKwDkFZ/9eLafzAGR0Lkqpx2j9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556178; c=relaxed/simple;
	bh=29lxS0rSwedYt9HGATAvjnQ2Z6njYS1v/I1WZXjGzKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OGa/5igO2w5fvQYn7eVM7OB5Rrv70+Wp3GUBgIODOpqn019ohrmDV5vYHQT4b2ejDkGrShp9N4JsVnNd4KatQY7JfbS68wQems0xvGzAZ/LEVIk5U0wJqe+NI353pl0t7CkdbH0j+8LGzfUEWgwA1CyI6zSQzQPlNyUGGSTmAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqjiDhud; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqjiDhud"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec49f7e35eso38242166b.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556175; x=1781160975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEh2hHWSQusy7v04QpYRQuY9sFyI1NwpLSKtummt4rs=;
        b=HqjiDhudaadKKXxPRaBAJnOz5GPq2yUVnkrn20EnXJ7GPl/KF9VGdA/VxCfxjXkQx1
         2UG47ba13LG5wubdYGvph0F+Stbo/ZXEEl9aMYSm2w4WFjIQ26E8lix4L3N9UHBjjLD2
         bGpf+1B2hnPGAoWbaGg1iq6wMnfNjTdeC9uIpggGXUZtw+TbVcw6w4Trfxt+b0XH73ry
         EnolceLAScew05wlktHIFwB/qFMziz4wJkLvYfJkoh/5nJqtQTW4sX1pBo8e3U72n/LK
         l3HxqGkS12S8C81WCvuzACyheMthmMHVNbu6dDDTi3kb/VSuqzoDaPkmzhSemBaYwKm3
         kAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556175; x=1781160975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEh2hHWSQusy7v04QpYRQuY9sFyI1NwpLSKtummt4rs=;
        b=C5lbyrj+bkvwzjAtsASJv7w652nPfWv5Vm/gf+qUVyF66ezbVxELkLVAmZGaX+wIlL
         ieLHNAd265FOkodeeLp6NAVLyxt/SJKmpgjj3WP0tD91Y6PYCN2HE+zgg01gGJs6ay/T
         vJq5yQWgRJNe5K70S9GHwQEEI6oOUuIyiYk5QZUx3xf5Lmgy/+IcaLv6RsWs3fXBhkWH
         c17etGn8dJItkcO7e5d1Vi1wgTcVXsnrIc+nx8q2BeGYybRf8sSbSnjyTGEa85q8lznf
         FiTPEz/1pqFZqIns7sGOkjC/DdkvWnfG2bluTW6GI7xok38YEVwWb8vY6Hr+q6Rqz7h0
         twAg==
X-Gm-Message-State: AOJu0YwO+i05YSMRvD9dHismIrry69wS/8OQqzCbJGpkfqYF2SHMAQ+s
	ZUrPFyCakHVu/gyR4eIIBjttuWVwrLtxFcOnYWmiFD8qtNBta2LI8uaw
X-Gm-Gg: Acq92OG9BrH/NSzt8MVta7isXJRapebbiqGLOpdRZuZUA5tut1hSZUaZCCYmHICBcDF
	VEtYPBgSonrMoAm4G/gxd7m8jR5tkGYGfV1KdQIsyHaxSiaY+juQzHUstLmnd1+gzQpcDY/gRFQ
	6v/8e/43jzomCtgsVaXNXtTuOtfzIu6zVloobHllYeHNzv1qLoXEe+fGIyTiU3LsSpb5Citvs8m
	oUOR3KqLF5Pbq8Ey4D0RQugxfNwBPAJzV40Y98SbP8fpnaJIozRR0CxSv6qvjEOQuYAEESuK2iN
	xxaWiPaJ5hAK+uSkQe9faJOSc1HEW6Q/QD0hk3uxcil5YKizcebsP4AQXg3psE+NoiEcY488bae
	euxz2jvtjbeMwvdn/y1ayqszR5YUCu+sMc2hxdUezoIHaCnBFv7cVSTXQiPgIDNYbkmc2h4Ad4Z
	LQ2WJ3wAacuGk2vebZZzGqkZswuToFYPZ09w==
X-Received: by 2002:a17:907:1c03:b0:bee:280b:8bed with SMTP id a640c23a62f3a-bf0ad5f8b48mr372438566b.22.1780556175231;
        Wed, 03 Jun 2026 23:56:15 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] ARM: tegra: tf701t: Add new features
Date: Thu,  4 Jun 2026 09:55:46 +0300
Message-ID: <20260604065556.137614-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new features recently merged like CPU DFLL, MC and EMC timins
along with fixing some existing issues.

Svyatoslav Ryhel (10):
  ARM: tegra: tf701t: Configure CPU DFLL clock node
  ARM: tegra: tf701t: Add core-supply to PMC node
  ARM: tegra: tf701t: Add MC and EMC timing nodes
  ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
  ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
  ARM: tegra: tf701t: Tune MMC devices
  ARM: tegra: tf701t: Fix BCM4334 configuration
  ARM: tegra: tf701t: Complete power sensor node
  ARM: tegra: tf701t: Configure UART-B line used for GPS
  ARM: tegra: tf701t: Add chosen node

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 892 +++++++++++++++++-
 1 file changed, 854 insertions(+), 38 deletions(-)

-- 
2.53.0

