Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C55356C641
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792090601; cv=none; b=eVFAAlrPDvASa2h5zcGjnvc6ht8oROcVJsp18x342DmtmSjy0lt73Df5FYcDTH1yrj+H29nvoTxOK3wstElVkUlv186OW7rJyQ51JEVMUVF2jr4M4tMggMkKC2fTf33m+jHwLhtsk/J9eCD6miS9y0zrxIuK71jQWW739QDL53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792090601; c=relaxed/simple;
	bh=F1nPu9wpy2HTwHGav8g9uO8FI0WZgezRY+zItOCC26M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dezwLYuOseETos+7Ccy7SQfV8RAgbIVdkgyljXns/WtNpvjXYARL8gigEKixLUe+DzKrUnfw+7sZWE14JlBZ8OH0E7dwgBy3VLegJSfLO34fPztxO577ElrLPkbXgyTST0XbQjIKVLreLVPqnsjqeIgOHJR3zIavP4drTTkKLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxUcDARx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxUcDARx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so21824445e9.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090596; x=1792695396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=mxUcDARxmwAdwf/DN1CGDrEyUZ2vHXbz5Wixbot7RiY9SBqbjnY+D6V/LMDtn2vdon
         f4SpfdqOhBRYf/OV2XAue3OdLm4opyz51hC0Ms7Et2b5jpRHu4BU3H1owFYmuZv6SuOS
         jF0X0xQfLYM9Ddi743WQkkRA/4Vvq1cKEagSw52SHyzGMB7qnP++oILjGisPPNxOEVVi
         OGSmTDomjEX/vXj7/QBGRtJ1Op4GVvNKYIUiKtERnZc5G7YOKnqmB0tWBDFq5Z6fmecR
         8TwsJotRi4Ydt3WOruVb/ontxNL2lfAVV8qQq9TPcjNKFH1aYRkDY+aDbiZ1/xXNLWek
         NyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090596; x=1792695396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=1bnifcNJsjXC/g2j8PX24XBHIVDjjLdT5bn7/Ydbsoqx6LsI+k/euPnEfmAiL3e3tf
         i/3ieRvRywsX35s1Anzkk2EsHlfL3VIdun97jzA4oQ+iz5/Nf+WKF9EgpNnlLVFrurbZ
         Glu79HwG/IFqmdjPH72fgBO2LOK6yZF3+4vbKpFm+JjA35R2Qw29HE8czWxSAr1EOYjF
         h0mf8GLgcGSjBxfLdeEKLN2SkTbygpg6Hzc6xM6RNjBxGzyx+oiEif73F5NJ1rl5Vz2L
         JyzzVhH3pvW/Cosh6bbBhN9AjUkGYFolXKuRPknZrzPTIYZXx8hl/jHhGKbPt4h0sFzU
         iRXg==
X-Forwarded-Encrypted: i=1; AKwUvByig53J3BaDc2svpZN8Le2+FFzeX3ulAzUkNc2wPHTXnFn0TbqG9gSsV2zSG6njKcdCoOqinMjiQ/7H@vger.kernel.org
X-Gm-Message-State: AFq9FYJSWAO7rySBzHp7cdPx1eI+StoBHSze0Emj6HbZVIZL46iteiCC
	T6No4N1zX4VAQhHb19QniEo7GpphNDA9PYAf+nRr1es3nA9XhQ7m3hKM
X-Gm-Gg: AYBFou04aVER1zPlMQERCM27vez+DCocxGkHDt2Cc9Bqq8nBryr8mYnu3Co/eWZWBTs
	68Vq+opaMG4sctxqWPib/BvX6p098+h4tmNhzV0Qk7ucH+gfWwk7IiuXV7lGsnlhDvpUCi77tbu
	bXU9rpQ1uEsTV+MqLXi4pk+uVIcSBJmm3uUOx/MCnxjAGHZ03+53SKRRdHILu7vRmxCgpILeEiN
	h83dGXytt8BbKhxzOdypgNsCaGtEbsZTgsM2M40J6SyJHthzKPAZiHCV97jrr9XmNgQxYaxfKxD
	XWOUMCIQV5BIZU+m0fsrBTm2SgRHLeQBDXDqCOYkIGSe27Xd3i04XIVmVtgjQXZcuw/ZzvHeLnq
	aDwJiTmHvvkyCTVQLtxvLus12U7VKwMPsleE1dqKJ1LTwJRH5vObxZocJJBp6qqcyQEcGuoMiO6
	OrtrYYfPv3d3JFIKACX4/f4wLHjMxqm6/JU64d9pyIuypveLCbppZfqFEn21dxQJEkuEgqFdv4c
	xsk07VAayczpWM+f+8IwBA0uRr+MRr9wdjsIoiX7w==
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr399234465e9.4.1792090595555;
        Thu, 15 Oct 2026 11:56:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:06 +0200
Subject: [PATCH RFC 2/2] riscv: dts: spacemit: k1-orangepi-rv2: enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-orangepi-gpu-v1-2-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3

Enable the PowerVR Rogue GPU on the OrangePi RV2 board by setting the
GPU device node status to "okay".

The GPU will use the clock, reset, and power management resources
defined in the k1.dtsi SoC device tree.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..cc375dd1a77d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -384,3 +384,7 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&gpu {
+	status = "okay";
+};

-- 
2.56.0

