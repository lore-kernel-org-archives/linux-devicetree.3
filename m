Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378499;
	b=FSJ0F/2PzXcQEj/21vVP51tVdWalSx//+AzCEMj4I6Ld9e3BApuu1BEHAtIwmPc5R+Nc
	 YkIgjWk7lQBJJ1MStVznPH0T9SCcvN87ySAzs3GGoXD4LouPCMtH5K8UiiRmUjZ2Fiz20
	 O906k/NrzkWv3oNVhKECTuuimWhd0hrjTIPmHqp/NvL7YUJ7LSW62fpzhCjF/QeW70VQA
	 WDzTQOIkreAjYfbArwQbbz7C0stSImhZ0Bg3lXpPvkohUmD4+ryG6dcxmsosmEEinTsSI
	 cUDZ7OrYf6AQWJKmmexM55YBy+lCFfilydCo18SaIo0F9/GZpLOC7XkX1OFuJ1j84Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
	b=advGm1ZQrSgEFXsuM+kXFsz5XKcGBFbu8pfj2PbLt+NPVPoxZMOu9/98ckJ40cmCVLlM
	 acWnVVyurmMURYWqzV3YU2m2AOZ3b/2hSnJOSeOD5snB1W4PCAj/5ebDckUvrU1bf6AkX
	 hZc/bwdKNXZyBvDpqp/luQk6wcTRDl57C8QHn0xrMht4rEVDDdkPlryMBkwZTZPqcqWvl
	 /XyHCNjk2xQ1XMHlNMH6nfb4SbAM8cFaHRPs1rK40Z3NJ3iJ34REYsJXtdScCRp6iop0X
	 7qFLc7yHclUw/aJH4wyBEif4z7SduuQLt5Kkv/D0VkDwVYQkhlTCZruvYqH7rTgx5Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96921606A327
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96921606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so3472449a12.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378498; x=1795983298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=oMNnYhvkB8Cvof2QHWD3pgxxbWR+ocjTtM4HIZWTIWD+DqfWGYxSmoSbKccTDAi5wY
         VwEV7mbsNh6r/Bvei+D1b6LANI22rW6gIYszhPwAxhAuddFkog6x2Rdo9dLgjwiOghZs
         tf38d5D9vbNP3sfyiNxKr6xz7ZA3bXA688n/gf+2zsSqWLws7H0peXw8OtQ0SCKU+6i5
         ILB0cNn7Ip6uuUqpro4IS2BmihFYNj9hAkHZN+o/lqnhjorF3huc/AYKRm98+nmhFQto
         Zfyi3MuYOC5zpIp94kbaXcj8pfZ3mfvcsuL5eVyFsAFZz/hbvkrfEERI0zbR8ghY3+/u
         dgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378498; x=1795983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=LYBfxdJhqp98H9NhS0yTcPMLV8kwVtQhsJks9qBXWLIFMi2zfqV+nxIjs6IOuVffzf
         1+QcYgAk+Cdne5I4Apdww1TYN4GQ9oK652GknjchuHLbhRF84347rlqnzU6jzs7LSoKV
         mjPyftja9RiPl5L+CXeg0xrwUCz+M8ZV5+ur//X2RDxzw0WHcxUMid6SuLwMyndhgLvW
         2hryD63cMZQuiG9ooPBY2wIhL1XzDq4rU9yEsIbgGYcXMRk7SMQytmIrXthMJvz+tKlW
         mKbvGHlZGSi+/xHNRuVhr8FsM5CYbZKHzVe1mouEaSLTUZeGlVbLT+lcV04PiWauaBc7
         G4ng==
X-Gm-Message-State: APuU4Z9cZbdkYmEWz0J7oy+wE6tYdPrcMviHFH/T8S8TQnmxGYeIam0x
	6h2rPx9u9tBgsEkFM1v/DLPYPzFq3XVZ+OI1DrsfIgeEpehD6aVkZoaz
X-Gm-Gg: AZFdTZdvlVShzpR/JVno2gI8NoPv0w3MQmXyQ8qF0RTyjm63nlzpM56pbPD7vM3qB0A
	jVElri4dz8C1ShrsZl/WUOM6Pw7p61lTLmcO2wfGwu5NAQ1m3khu3W4AJq2HFIX+JXvEGgHw3o1
	Wlb290n6igP76NJ4C7ggnhInizYv/i1PGsGurOFOP9nw1i3SybC9aHiTohAK95SLr6PaRQQCsoD
	S4VysQNKZJxRIrkH5aBm18LfpWjTdUOsoeXeXI1V5ZrHuLq9e5PgtgMc73UiY5TTkMdYNLAygOD
	nKklImp2G23SUzzNtwzbE1QZbfOyrm14XArt7N19OL6ac2gFwqwriY+7qE/3Uje6lmyhUzTn5UB
	+IrDiHw5ZzS0R0OqQOVEbk5vDr6liqchZizboIphHt3mPXaNk/FQm0zZs00OcwFaTxbzm7czXSS
	di1Q5NqgLFpliUDSa7onIHdnVT16nWk/PJ/t0Vo9kMybj+sc3/UDolkPHbxTbCTgdOvyTn5ul+x
	k8RZN1P0sAOZOF7TH3eb+FE19F/DXWeVW7h+7OUTTuTlicNkDWl6qFar2o1Ku2FHbViz6x7rL6F
	gMTIbVnWY+AiC2acaOkzzn1hpG62MxeBbg/080armX//pCIIyXPzuxAQavfbNgC7ETM5+ttVM6B
	FYKEp3+mTmQ==
X-Received: by 2002:a17:907:7f9f:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c513a274be7mr837483266b.0.1795378497880;
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/18] ARM: tegra: tegratab: Add CPU DFLL clock node
Date: Sun, 22 Nov 2026 22:14:03 +0200
Message-ID: <20261122201407.23742-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DFLL for Tegra Note 7 since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 42a10ec5ad4ee..cf8cd037a732a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2133,6 +2133,14 @@ i2s@70080600 {		/* i2s3 */
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
-- 
2.53.0

