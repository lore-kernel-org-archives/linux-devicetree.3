Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCDC403EA1
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199880; cv=none; b=imGblYjjhyIm0b0+YHg4unjOOPKSbODS4dbn/hkt4+JOJ8d3oviW7qWfb/XueScgTxVRb9rzzZVlQkby7R1SkIUC/CVfVk85eBdebfMOqTFFPxGjuXKMSBTbjJm5pbbHlxBjx44XXr7DnKB6i2dVNnUWyW4RKpZl2zSw4YDmaPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199880; c=relaxed/simple;
	bh=zBdK1iiFDwTHqOyTQyYg4l3HxFz9CENCyVT51LTKz4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DTV7B7PjGJFxnD2TrYVnRvP7chHrHqLZnPbNEeWLWfRqYafqfHB8TNJPH0AMg3T+lqqeM9vTaAfVTiwN4tU8cebMo16vOvnPbkgF7YrmZBjaGieZv8k8ebutRvC7wTvV+Dvbkm6G8NZ2pfiwfoqUmOD7CXiZnojwUPN5YpLDDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gdHa3F4O; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gdHa3F4O"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so53451a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199878; x=1788804678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=gdHa3F4OGPta8Ku4hc7pkSHi+zcYreUvgF2rhRQVSZ47n+ptJttnJS+mb+aFmLwAxo
         18lopdAfAonfJtlyWxoxkDu946+C8uJXa5KLYJ9+nr7+xha1L8pRdYX3R67lcfIrsuvv
         YwvrYs7VeqInldCQQPUFVgFjsAwbCCQLwg8h9qlLBP9fGKXheUvMOKP62KzTQt3vR/o0
         LSO9tQAJFoJwCpSeh2d+JdohwgxHnADaUC+2TwxxJoUfkOv1ZEulGfDAQa/e6+V1ogHh
         KDPvWBaf6Xlx/QMQ7fUcxrYn5oIjynFhw7tv4Z+j3elCHnxLHxAFlJ2c+z3GcIpLXJPR
         oGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199878; x=1788804678;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYKJ5VPlv39onDgpizRA6tuCgoTPGQMQ0bB2xHAAOlw=;
        b=J8EIg47c04ywXI1wGLNkuz0cUWRIg69UZtfbFGZ4egAjI679WzvIDsua9b0gVzgGI3
         MzplRqr0dIdd5rviVYH/dKul+h37TG5uycXa4GobdVzesmYozHZ+3yLEOoGIzN+kd3HH
         7uRgd0cuzxOkSZcGy6LmLeB/Q+i374nEqgJnJlEvedZe4rImRvsNKEbLXy36jeVP2937
         hbFnDl9dqbtXxg5cRHoQ7vdU/g5uUL4jbfk/VFm2UKwGFgc3kl+xlAvySEfftxn/mcq5
         4M9hoRv9PnON5kTxKgNCd74M3JD0RMdxgcTKuOM/lmioDq8E1hVILWLbbac+KnUFYkv8
         DMCQ==
X-Gm-Message-State: AFuF++nbNS/RtzvaL6vOfEYmL/+ngkBohBNnd64w76He7r7p7JemHJhD
	pfe8m/6mp+6E9PnRlGfeoj8gWtyAyjOWM7eayz0xNq96bkvWBU+OwMMgDjsCrGROdI0=
X-Gm-Gg: AYBFou0koTDqYapKnWmPHlVe/mJD7MyLAzIX/eVosvGrKMa5uLOlb8bcCbS8J9PCMWd
	gm1szCb5gYeiq3MiIemQ36ICykKrf7bi5MDHIEKPBjKD/1Ju/8PfUSfIrP8+tHQSKUkBm8kJz7p
	F/mv9ZkNUQSfQwxdwZ5DH+m0XstuSZrYX9kpYsvgGtXL3jyK7Cg203RZX6Av5vFNqj3w6qiztoh
	kxudPz0+d5pCsRg2/dFkmV31a+lcQNqie/V54Esm72kc4cPBj18qg7w7aTF/1HBouz4xHug3Ep4
	nLWAu6YJGpK1HJsZ83oMegT6fc6qP+RL7mp7gcbgeTWRUJ/8/KrwImRC9TcumMhUKDF3Kx+XGm/
	Doq/gPFR2BeX0e0CfMYRVNODnHZgUnX8RDRfDCko1m1MiHVzakUJiwa7idykG0ei9YuQTict0e8
	gub70vJWnRJ3CDOFPUvSNFlK4p0qMxon/ZWnma1bp3qTso6s5IMLRrw3ICIw==
X-Received: by 2002:a17:90b:4a8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-396d0f69d10mr34762737a91.13.1788199877917;
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990baaeec3sm863336a91.0.2026.08.31.11.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, Roger Quadros <rogerq@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
 imx@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
Subject: Re: (subset) [PATCH v3 0/7] ARM: dts: Replace clock-frequency in
 camera sensor nodes
Message-Id: <178819987707.2869653.6455595386601883422.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:17 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 10 Aug 2026 21:05:57 +0300, Laurent Pinchart wrote:
> This patch series contains the leftovers from "[PATCH v2 00/72] media:
> i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
> DT changes for ARM platforms were postponed to the next kernel release
> and ended up being forgotten.
> 
> To refresh everybody's memory, a large number of camera sensor drivers
> directly use the "clock-frequency" property to retrieve the effective or
> desired external clock rate. This is standard behaviour on ACPI
> platforms that don't implement MIPI DisCo for Imaging, but usage of the
> property has leaked to OF-based platforms, due to a combination of
> historical reasons (using "clock-frequency" was initially considered
> right until before the introduction of "assigned-clock-rates") and plain
> cargo-cult.
> 
> [...]

Applied, thanks!

[3/7] ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor node
      commit: e74a8fe7c2d85e314ead77064ea671b71de44b14
[4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
      commit: 3da3c1f84d4f1d14d321ffbec742d4027b503827
[5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
      commit: e59ab4d7eaed22ba714c57801262a09ac1c32100

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

