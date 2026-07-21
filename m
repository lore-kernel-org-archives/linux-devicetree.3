Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331CE47CC85
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628674; cv=none; b=Zs04JdpIcAL+0aoICq5yIgU4gtx6gKeGdNjTYlFnI9ph4dxgRQzab2+ce+04oXlQ0Uhbdc0eNjpb43rLqqzXw7QYCCgTkY42D4lpQxqx3P8MQmh7jY3CC0Gydz1wbzBWO1QVEHwi//32nKAqamdvd6mlWNktEpaNj6nKoDHSO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628674; c=relaxed/simple;
	bh=TUmjXw2M4oeu88E4T00FZuITV/yEcOpyuEC0IVB64Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUsUDxROEnCXQ38sBXbTQ+1HKWYElKeiFatBbOI3eqo9i6b8nlvaA8jyJhKsVrXNHr5OfubcMLkYGn0eMPkCT9FIfueHOG4OqoC5eyjZiA49rIGisGDwC2DfQWEWWIgHJQDsjgq+jF4QND5zW1UwIbOVwDM3F5ZeTLVBgzOmMMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHbD6DTb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHbD6DTb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso31798065e9.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628670; x=1785233470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=103K+HDBGo173ka6xLJ87zAEncnD5tT5dDYUjcQ8I/s=;
        b=FHbD6DTbyIBQiFS8HUcvNehDITQCI3mFTow3teJjPZ+ch3VibWGWrbw728CSrgUz9G
         bfUuAJpatFW7j5n6ceZBL6w1y4nOGiY2bFpjqHDpjL+lLN/njmkwIo2nfAOpOwQT8jmA
         iyUtw/lEJ+nwnBL0+PE7mPXqfYFX+uYqCw5oyP4zpLqQSUc9NxUveY6MQzOoyQ7LT7/f
         Lpr7J0cmWj800ERFUVrCVR7Nvm821jREqK9qwh7UFPH4x/21NFtJvS6gUX0uDxdPd9yO
         1Hz/+V5yLBAiRynz8HgeVaU7D5UXGfhWcpO+t5RrlUSkrytlOYG+id3Eg14wzXegMEt7
         1aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628670; x=1785233470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=103K+HDBGo173ka6xLJ87zAEncnD5tT5dDYUjcQ8I/s=;
        b=AZuxbYMlilNWOhg7OJrq+Ki8n7XQ3ErCkFnGw8ARwxIqCNaIaiKm9a7WN1pc4pEWlk
         KN8PxixoWo/VtgVuz+XoSqyZTLas3c45A66yrFAblddJbgxA8Mm+WeDjIyG7M0OUdKET
         dskVcw4lHhSkAVrf8PuLsZ2roF6Yo+QDSS0MzJlg/u/vROZsgdmku6CGBes47Q2Bro0C
         hHkQHtahJmxrzuZ+Iq2mv6rqscM+JUsGzRTl15MGWrHGC0eg5r1rbe09ifIGrD3LIIBB
         4AATXB4JZ3UEH6D8svhNaQdhpmzEJ5uWFkeSNhZfZDy86JrKOalWHGBNs7qha8oqjKA2
         rMNA==
X-Gm-Message-State: AOJu0YxP1te7/Kz7AXMlja//pE8FujatotE4Nzg9MHblONb4mPtfGPJS
	hM8A/bVO5j/mDV9tTV+Fy6QplYO/UDvSxVpHx6+owtBS19NcPLDzkWpN
X-Gm-Gg: AfdE7cnfYUcpQ5g6YVqp+0pcP/LiGbrREIBlB8eTLyyYcl1bsnENgx8HgzAL3ScanLg
	yQs8uLx32xPVkWE1olJydK7btAhjI9/v/vLMZs730mx9ug6i38isKqTpcDivBbyTPPBeCrd92/p
	RGI2y8ktqG0valgLoFrTC79Fa59mrliG30WV92BE+0uj1EnIcZeT3smudlHZM/10PPQhbQ28CFa
	6HU6SQwjBffcuqW5PIRjpP8l7HHnTmitFRms5ovQXRrxJ076JODG+ZPDdtLQk1uVLJp6stfB9eA
	SK7uPH4JyWhzue2TiezphtZ+d8na9lUjuzeadOSkvea5VNIXxUK2GIZweiDYbqw7n+7mnv1nKl+
	0pDuWxVegILHojSqjeEKNXjRAIoZ5XmZUIz2bdv34lB8sLxTtjc86xypVnVOX0knwoKKoW9BVAf
	/t+vtIEdX/YaAXp9wCeqC68JI=
X-Received: by 2002:a05:600c:4e94:b0:495:522f:d994 with SMTP id 5b1f17b1804b1-495522fda7amr148264315e9.0.1784628670304;
        Tue, 21 Jul 2026 03:11:10 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:09 -0700 (PDT)
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
Subject: [PATCH v2 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Tue, 21 Jul 2026 13:10:51 +0300
Message-ID: <20260721101059.451699-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 5358cdb6efc10..55e9256e80f33 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1599,6 +1599,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <2000>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
 		i2c-thermtrip {
-- 
2.53.0

