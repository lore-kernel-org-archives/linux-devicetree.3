Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616B3AEF57
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743682; cv=none; b=aE2lFL/bXXU3rCLunGTQH4lC0P764el6WGIuUyo5xKYqdwQwduYTzeIyJOXCTkWNoexWEnFJX7VWYNGb92gp0LSw5+1XHejy3i4bF/4qHJ6OaIxPkfPMR+QICPnyd55QyOyLhEBwPevDUKETZ02LJMr66yPFw6bjf+0AP15cMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743682; c=relaxed/simple;
	bh=VFx7qzwJu3kce12Q8ttsQnMjNgXtebt66bMUtI6zt70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFsmylmnklvSJwxN+TvQWNyLU6edJahE0q/uueOoGS+0sXH6iwIMFp9fnoJDbBQkvZxSgpe/yK3jqKpqY/haibg/g3m4yLUI5MnYRuwifknpaFwme3nYN7RhOXY3LiT7/GErDb2Va3F9lDRGluAdgiY5VIf2c9sNXw5iWfOGM34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eDQKdyqD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eDQKdyqD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so1528995f8f.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785743679; x=1786348479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hx6mTKuXWw3d477PSiktf49/edj4ItsDaCK8YLkJo3A=;
        b=eDQKdyqDQnCOR5Oq5T+aBHUoHWccQhTh/Jcw54I1z4y6wcZvfdL7+11+IN2Cw7YvjH
         Uv1aO3YcHzxYu6hcbd3ztepDHN9sxIgz0T99//GvT9Sw3N7PU7c3zOFjxJmbF8PG78sD
         ibI9Rnd057q+Cu9FsHp6Ha7sZVI8g9UVMLzTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743679; x=1786348479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hx6mTKuXWw3d477PSiktf49/edj4ItsDaCK8YLkJo3A=;
        b=lx1pJO/kf+PVDIskRhDrOAhartHeGpg2TQH+q1dG1dT8LbmZr7cBc+NXU6VGWxuby5
         EdnngnwSRl+Qlok25LFx23mEcJICKUwdcmdo42kUjgdUFJs/9RUQ1uoJ6OGxmKUEocnh
         xC3DtAeePJmY+yOBQJCFTCGcrYeZaNRrd1lwD9jYKrgCOjs63khF7xlHqRxe2qrEZO3R
         vX6Jq16pa3OB3gG8D30qD/Q95Lv0uDwCc1TBZ7AdCKxiy8F41HEnXSKjDtZiFqiGYNZg
         omH3dSWYuFweRvfu9807WBJ3WqjyMOAEUrVWdlItwFl3rSIaCanZOmh2blHRbrPtgxxq
         pZ/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rowz9pVuQ3iTwPQ40ImX/VDcXel8rogq/Y6nRvztX1Qi8Pm9FpMzofKMELj5/hV/UNVgsNVxQyo7E0p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kALUxWcIwF+z05tZhcoHdxX4G4VeBsywOD4QuJFKKuQMWIb3
	AAgVuZ4MGRWxc8nxzI7SjrTtVcrMpIat8OtAgkiIsY6PbctmPOxRg4KQ7th70CI/KZA=
X-Gm-Gg: AR+sD10oNTMCLjYv26m1iskqkeI73JJgOXWGmh7SrH7KWJ1NIzLX0EwHcDRaEYF30MW
	mi6/X1q16fdtoVDqK8konsOgt6N2taglDFpDVcjrFY0ehO8AZAVPsDWofLm8YqZp5kBWDJWqxoE
	RAWf8geNAHTQXyBGfRjG4KRgXDntF9rHe4DDRxntZ89YEQoXBiTWUfCVU9WnDLQtZ5UzuNrNaoL
	61pNqUASB1qvJh8EAvynfsDf1JCJ6fWTEVcgetWJfhZlaYjdNELZRXNb02wbsOvXoidEHwOOvSg
	gEe3nVoq1jD2XalQ+hLcbqGYUD2V5jikCUco38sFi1DHpBpAg/iCFNcAEP5SHXL/f5HlBYoYDnv
	Mq8iYuNLGG0faokuo2VeiLqB+YrNHpJZzIDIbmUTZx0XnHsLQ4foZgxmVHPFZN7dgDPyl6WQ4K+
	jRkCaYFEi8feR68e38zOADTtAS+pVcdaV1L2vjYihLVUnIBAMUP+5zUhJ4ZjCWWVE7zVJBqsslk
	Jy4TDg7tBm7ZN1745n2hDTGI5CpMDHwCbvJ2X2FDy96kMhbmlShkrCs3lHtdx7HuKXYR42zlirx
	IMmGGpulmZTUJnjgl0YiKZPL32dVYdOtbtglfxf6gdsKb5TatEq2Oa3F6nqGBsUD
X-Received: by 2002:a05:6000:26d3:b0:47f:8fc8:a8b1 with SMTP id ffacd0b85a97d-47fd72d3112mr22031528f8f.14.1785743679359;
        Mon, 03 Aug 2026 00:54:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29411990f8f.34.2026.08.03.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:54:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH 2/3] ARM: dts: stm32: add missed arm,num-irq-priority-bits for stm32f746
Date: Mon,  3 Aug 2026 09:54:27 +0200
Message-ID: <20260803075435.3825122-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
References: <20260803075435.3825122-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:

arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f746.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f746.dtsi b/arch/arm/boot/dts/st/stm32f746.dtsi
index 208f8c6dfc9d..82912cf9c4e2 100644
--- a/arch/arm/boot/dts/st/stm32f746.dtsi
+++ b/arch/arm/boot/dts/st/stm32f746.dtsi
@@ -721,6 +721,10 @@ usbotg_fs: usb@50000000 {
 	};
 };
 
+&nvic {
+	arm,num-irq-priority-bits = <4>;
+};
+
 &systick {
 	clocks = <&rcc 1 0>;
 	status = "okay";
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
branch: stm32-nvic-irq-priority-bits

-- 
2.43.0

