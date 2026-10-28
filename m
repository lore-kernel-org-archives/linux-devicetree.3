Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=oK0YKyhV2uC4U+oe/ODRWLVCwvqZTkK5F8+O5ZJn0Koty56fOgBHR93WiK8oA1N93jWO
	 /077DUWAWw+AE6g6SS6nnuTMsjZ/eLeJJE6+a3DFzAuYmRLZhQh8UOK+bCUv3XdH712YT
	 HWNb0Edc26gw9idY6YIMNRx7QGjaFydFThSbG88bwOwygSaqgjIZuHRAr4sIIhYr0Z9G3
	 RrGBBgWcua4h3LnCnpAaemDNBmEtXCbMvqdeYXmru6cDC/Fd1+DRqNOJohIMH7NVTuZ3K
	 Po0PMOoUnkwADHygopakH0NMn5F4Fq7vgcqz6B8Ir3xnDEMLlW7lVRqXVxeOfpsWacA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=ZZOA0MthHMS1pTQfQeZ2rDd5FAwHzW9IRJwdUEhFeyjlN83EuagiD0Eqs1NnF/SK1NGC
	 VghUOYFhNba+5tIVQ7ZzBDbAhyYi0+Sd/fHCa7fpcWjjKm+n0OypaXc7CLiwYeABLBjNJ
	 mrwMdB1yoUb91uYBkugxtf8SRyKLa4Q4eRW/W2yeV+7S6UAiDwUu3ZaZSbm4SEtN65iPk
	 D3OZlsSEstpKSxWMl7W8NX5k7RbB69fEUGkewpildm2zHTZ+NAXRhiPKqRV18DbJrl8KN
	 QicuGU4PZ9xnCVkVczvVUgjB64lZWvBTRT0T8UGsW2yH4S+7b7jjsZUoYJru5OuYtVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37932606A325
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37932606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvVViE7s
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12730615e9.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=bvVViE7sfBqKWfi/kLDJYlnvzOUXPLQxwi7WE8YcmF6ZlMSeeXt5LVtwTgYjpBwkt8
         SYP3vMcQXr/owFcgMM1gE2QwZ/DTceP96Ogemeuc3wSVYptLjbh5WQ0zOa/QFUl5Bsyv
         t91KeRJRSejTTfSC30ERKT+SYsNtmNlFP19tG7VGrb/Fyrtxkv8HCWTMM4co1xxufiUC
         fsayYomNX2KXae5ip40Tnzxu0+b09pZZ8pnmB2UJbRFHhmlzRF7my1fWETNYJaMtDwI5
         xLbeFqSzSFzkr23lLp9iNBgX8plx3P3KNsPgixIQp18S34Dqr3UjM2Pb0SImAbIC4Wby
         52og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=KCxXJCH5PFaxrpzNbEg9FETwH9LOLZ3D1rAU/bncilyWG0PlE4wZgj1F3Vk82M0Iif
         g0XpYF3YSCCd7LkL/OvPW5XBNYdFaU84RhCnWNzK/SHeDk9xZlcgu/HTh3l2PWOqFbZZ
         12lOHR4YkymDSqaCGUsSlNDwVYjDmr9TMY+uxKgg9IfgaiNgyHftM7ivQL4Fnw9YF204
         Wjpp9ZAlrtFMWpKRdcqQqP9ssP4s0YGpWgi/8JUG6Vv8fEs2xtj4QJomY4PCF9W4GDZY
         36dywSM3E9FL3X9sj1iGBjrRpGColyQKx96jcxTsueADEyYSJWkDLAfeKHFVeWi3U/cp
         XtUw==
X-Forwarded-Encrypted: i=1; AKwUvBwmf9+tqVPYtrhegZjqFuTprwtKK7QQpLo8lInG4+SNFQB7SGWEyiI0PA1DHBHMm4szVrfaoAf14KcZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIKQt42EHjRILbFuODnIOBO5J36lvxoGS5UalBPGNuOj9WkJlnH
	ggZ5yfqLXgSoGA8vNHtgYBj+wm/LYmuayDFx8Ii1YSmndZZiRhkBb1PN
X-Gm-Gg: AYBFou0lpNSbK4dettv0BkJl7CUmNF0M3Afd19ql/xqnxRlokM98lEaaIamYy1/ray+
	2qNUfyEqOrc/XgEkSn1+LZiiisOqw7dZ/7WNDwO4ECXxaAeUJKk+cy646kWDQi97qzbB0DQngKf
	VIfMSSxu5uya//i+4zmQkMe11SmDD4aYdcr61xqnFXzj9hYZ2U0F1qkXhsBAZn+GoeJ+sDxQD5x
	wP8h6xXJXuYxirD/zYCHFGb67wyNzIw+yRuJSsxRewiM+g89Nz3Ef9j0OrX5xot9Dnctje49cnI
	gBzH9GpyYVC/ItEW1s4JeWsBSicoG90OdGMx/ZKKiCeq/1AazcQUZTiNDvbYPMwFLw814VAPbNA
	k3pmYV6wZccEicsRyUDybbkKcD6m9MNxr9A8eI0vl7pmmlJCOaSteWbueVpN/tFBjCLzOyGRgBm
	fFUvci34N4DPxedsY2Xo+w6hFvrQrb1vhip48inEnwCWVIaHGOQSlvwL1jird2Fj8+PpvUvrZap
	2haeWxqIWi4t5Ymg9FHvFwCdlDUMZeQm1Z4dJjnA6x9qu5kknKj1ptMFVezjugEalnHI+RivXhX
	1C831UhlLaTMMbHa5ASfqeTRl2Utg1IDFIYrcCIEPSCvC76r+/49So5ZcUk000l3LSPsWDG6BQJ
	IJBDpZzD9bgIzEATE
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
