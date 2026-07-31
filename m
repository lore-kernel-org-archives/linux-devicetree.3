Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09E93F928B
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498084; cv=none; b=q1NDUDEbxkKjXajnzSbRKtS+oZsc12/8+Wi0ZjasM9bv8omadCzfQqWI0urazB8CnE0iiATKlYzKmfQWigj7vhhOmOm2RiIfB7AJQfDk+qpfBVk5OlgIL8oYyLEdji5pw7NugyDDjWkGm7H7RZVB4DvRDbUo7KCFZ/BNS7ufEHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498084; c=relaxed/simple;
	bh=Uc1BvyKx31wq02IHVbrAdOzHOOXq8zU3tucq6JfxHfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V458cR0SLQnhNM6Tr4OGo+OYmakCeCueG0DjJkZBKkxzuVJ6oJ0Q90MK+UmOZPB18dEI11a3bcJRlqm99w0AvSyUhuxlkN7xeorD93cMtTQ+iBkJIzyFwCr5ujzm7OAwOhwkjvW1tVq427xBK6IC5HtNImYn22irtUyNP8NbOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqZjWsG9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqZjWsG9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso902939f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498078; x=1786102878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEzishtGP2RmkA0jz3joImPDpD+mMIsWvmQEoNf0fVU=;
        b=sqZjWsG9HtlJMY11CSKAY8JaixUo9G2SfD2WoFrFKzH88rCP9yDB7eD3sm1pnxdyaT
         GWlrHSwVsMTyKtp8GQhSFC4V1xaVYJ82XC/ab68ZU9z3I2ItrEtsXZhqjD6LUa1AnaYz
         fwvQIMwJ75i3qLERZ+am+egIqaG7gZtA4Xe6cNmKO4xtGWhvHNZVSQ6gOkalyuDGXWPh
         5hBitwHgLiN1o1aUY6rjkdde5Q0Na4k27Bxxuha8gQcF3ZsMOdxgkZjCWI6UtIddSSTF
         sdZ7i1q4qAWY94zHPGBGt0H2UllLwX+57pRywsJEN0NnyYXaLivMJU0L/giMd4t53YV6
         k/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498078; x=1786102878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEzishtGP2RmkA0jz3joImPDpD+mMIsWvmQEoNf0fVU=;
        b=FOQorcpQk9fPqYWojw6AKzFbX+8SVPWt4P1P14IaDgO0l0aD4SwAy6xm1THjfKXgaQ
         6nk2O9THtHPz8preNDchlDTM2xuQuziPH2pd1l9aZCPHf+AoQNkzTMLcgPtB2GkzuQb1
         ImJa/kF/9hZFrtJYBO0s07vCqFiFX6+SSh9TqzDUC3zpePbeXk6OkRgol1TCnCchcF5r
         AwTMq5Wd+yyeXuYJ9RXLpD+CnuVn1S7EdvvUaB/cX9sstIIb+LhMxObHj1GZV/CF48wv
         Qvw87Rhm7RHEnOybsI/AmxGi19AJTLMUJ7E+DGVnDIiNxXIRvGnTfMMb6mxWWyuT+WbG
         D8sA==
X-Gm-Message-State: AOJu0YzHrH3J5oS69pXSyxSBpxFyo1X/jOcgbMyCRov8Bk7tVcA8I3wl
	h5LC4DI4+ophgftTCgziSSvJb3DciHxs4ABEYrKOlYPdW+VUJxnZV21N
X-Gm-Gg: AR+sD12wWb1AjswVNjzsPvbbq5ueOq6ZDmC2iZR6q4eEs1FYeUSPNpOXVBncM6bn6lb
	C4gCakstNcZaLX5zNyDbAhHSdFV/3PoH0z7URwr2a7VFwPGAWirAzNwrKRhSxtjMN6lL7maLYOL
	0Vs7ke+NlNg76PfbW3PwAimzgVyTS7HG/pTOY0lrIWwO7DlHpMuaoZE/BG96phuWUYHz/erb2DY
	WhQ0VUhIBQOuKS5UBUhEhlUi1DczAVnoIeeUPCk7LSPArjjspJbUZx9r8oDVza163JferggItxF
	j1emiEQmkkLArjvobZYRPb/ttTh7FjQiWTKf7yGnkhk+l2rTsJaaM7AhO8+qgkw3z7r2UJlGpfz
	vPQ80bFnFjgV6ktw7Rm3dSlgsMb0QtAxlrHGuWnNKTPZxOzb8Ja4zc9/B5WKxrnV+LRcWBpXMSN
	+bzX5C4xMEdCzJsPLMYYsAKeAGOPgs/vNqRR9eHTctAcFXHup+2Qjrt4pH16WR9fW4hGx/VN2MY
	fjO//ZzKw==
X-Received: by 2002:a05:6000:461b:b0:460:3233:beef with SMTP id ffacd0b85a97d-47fd2b41a1bmr3954594f8f.43.1785498078220;
        Fri, 31 Jul 2026 04:41:18 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:15 -0700 (PDT)
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
Subject: [PATCH v3 00/10] ARM: tegra: tf701t: Add new features
Date: Fri, 31 Jul 2026 14:40:56 +0300
Message-ID: <20260731114106.169398-1-clamor95@gmail.com>
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

---
Changes in v2:
- removed vdd-cpu-supply from CPU node
- fixed typo in thermal nodes
- adjusted MMC flags
- improvements of commit descriptions

Changes in v3:
- expanded commit description for BCM43341 related commit
- added Mikko's reviewed by
---

Svyatoslav Ryhel (10):
  ARM: tegra: tf701t: Configure CPU DFLL clock node
  ARM: tegra: tf701t: Add core-supply to PMC node
  ARM: tegra: tf701t: Add MC and EMC timing nodes
  ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
  ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
  ARM: tegra: tf701t: Tune MMC devices
  ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
  ARM: tegra: tf701t: Complete power sensor node
  ARM: tegra: tf701t: Configure UART-B line used for GPS
  ARM: tegra: tf701t: Add chosen node

 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
 1 file changed, 848 insertions(+), 37 deletions(-)

-- 
2.53.0

