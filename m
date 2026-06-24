Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE6D165F1A
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309500; cv=none; b=B2LfpGha08CaynUao3NBHPyduKQPSEKOWqNtj18pqRYfPAwbnZUVenswlnMarqVeP5RTexV3cH4Rm4bbuBXd/uLTYQz0ropO4FFlB49tkRr4ILExNDj/mi6UuPmXd53KtvAcY9/OOabNkg3JlQO4xnLLI4BqdnW5r430XGHUn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309500; c=relaxed/simple;
	bh=7M2p7S+nixW6clb+wch3t6z6IdsQ91czBjord3xXa40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRcYerbHem85KVuWtfzsuoNdj/zqv7p6Dg3Ks2R5j6AoTqCqnrsiQpCtEkrNUFwq+eIRvqkC/8S1l5Sr0iX81xY3ouM7tpy5UCSWIdVgB3qj4HiSlHxjkcDWE2DWm4rm9zLpnWmMjs4Hzws2u4+/MqokVeHTUU8xWT/G/7cEXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ/sj0km; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ/sj0km"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6ca94e539f9so611308137.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309498; x=1782914298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=iJ/sj0km4+QhGeY9mZaNwiAN8sfs6KMyuDnLjs848iw8VczU3sf4a0C2UmKxsDBw/d
         uewdCL0qi7aqXvAv76NINWzllD6NN75fehqaxJt0j6L0qAExN993PAOsLblIVrkv+ga3
         ka9O6rk8A8uhrwpwyrW3tZJUuliDMVwtnMgEnsSZl3wlQxmMXKE3lTRbZq5+lq+y+aG1
         HqgUUq9OUtIytDHsRHux+xsLWRTeWmzU6WATEc22JmTRPXn9ZLQL5x3+MTOz1R+6cn2f
         HySvIA5LqSTBV3GDoXtHmBwVciACp2JSinhzvQcye1vTeLULHtBYRjXtmV0HoAirWqQZ
         joSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309498; x=1782914298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=gA0N4zGC+6ZHh/gWed/NwT2beOmoYROyWed7P6W+0E2DyVjKGJXJZNFe5j3IyEsnzK
         QVOpdSch9SXUQAqe2053MGO/0e7YoZ9nBu8FQ9p8rGOSnvBdRv2vH9SDa0gINkG5If3z
         YX6uIJSn0SPzwztCj4HyMfPKpUemTtds608YL4+r15RiAMVbXcQ3UlTPU9T2SxsrrED8
         X41YWTDoA0knLzq7ulHBlG6nVNMITTg/tUGLdQfwLQpxC59XKCFm6psanA3wetRO8A9B
         9RzSu0Q7avRP1Pm1hzMjh0471Hkm9Ra3tefG5S8+ieSbu84UQwmoW/eRit9AubVHzgwK
         adFg==
X-Forwarded-Encrypted: i=1; AHgh+RoxIMWRCeMW/1mMAKqAKluFJk7eBEGSC4uoxHZMES0PZ3WSEelBZ9tVIPvjMGgb0T0EgP4Vie+DgvJq@vger.kernel.org
X-Gm-Message-State: AOJu0YxJBiu1gzLtc4COF/2Eo7kzrr6CV3ImB5tv5t+QrD2DWkEMJMeZ
	IlKjagG4DtLSX1WLjZilXzit+L8Xv0TuQODJCEx500Xj7GitIljEOtdt
X-Gm-Gg: AfdE7cmsP9m4KIyuKmeXMK4w4IDdhc4UC8sJrzfXYSIM9GVJuNCbC39lSfwv85V4p3d
	sFf6x4FkyRg0nCG/YIK1izRjJDkPw5c+aOK1obPuViZa2weeEC2Xre/IL8wwqTiLC920/Bh5eyC
	7hn8WvdiFH7cENiALt44h0Te5Sqpt9EZL3OQMqlI3xLt8Lyh8jskeE2bjjWgP/mgHoB4bIApXqO
	VEQ1EbD8S0MybRUmJ8ZRI3YPSFf1mevWl2F7Z+jfE/lQuHy0r/oDJVoXeBQxL/fZbCD3IH4sseI
	Q/x0m5Cs/9xFVJUT2QWPDw3riBoRZ6mZKGpu4P7OTSMCfr1Al32eWr6tMrNhxifmUQhqpJKwE23
	HpUFtuZHxT/WKcNqrrSFFuW5Uo/OsCLNzkbUshYbLTY60YqVzxlMDgn1/hrK55UoZjg/Bc+nt/y
	+nHcPQWEDkelvS92ANocv3nZXzmNAT2TAiA2Q=
X-Received: by 2002:a05:6102:4408:b0:631:28c1:154e with SMTP id ada2fe7eead31-73114f0f269mr1737232137.16.1782309498658;
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
Date: Wed, 24 Jun 2026 21:56:44 +0800
Message-ID: <20260624135650.727077-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe PHY node references mipi_pcie_analog_dphy via its phys property.
Enable this analog PHY node to make PCIe functionally viable.

Fixes: 9715b01da6cf ("arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 7ba249cc3d56..4f13e2b041e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -431,6 +431,10 @@ gpio_speaker: gpio-controller@1f {
 	};
 };
 
+&mipi_pcie_analog_dphy {
+	status = "okay";
+};
+
 &pdm {
 	pinctrl-0 = <&pdm_dclk_a14_pins>, <&pdm_din0_pins>,
 		    <&pdm_din1_pins>, <&pdm_din2_pins>, <&pdm_din3_pins>;
-- 
2.54.0

