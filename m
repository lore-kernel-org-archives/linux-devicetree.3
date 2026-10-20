Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494967;
	b=ajrCtvX1Lme5joHKtA2UBarNsMMbHJACqpMsixRxO6XJIu7VrKwX8/09WPUGFJBPwZzL
	 RzHRVztQxw6EjJG7jSMLeWsZ1KCL4nugNrhhgsMmergNtFa/9HDXt2PlQyemA4KhqsQ7y
	 Ld7tpFOpyxTxuYbsFwbX7sDptk+8+5vOdXgPE/fUUYeyPNmAZzsRqMlYHHenh+cq7xos+
	 13NVvJ2cjPE1ldtf2/4aFlQCjnOrhhrG9lBTTXEU76Jie79ch67IAbflA7AisYb355xPR
	 pPF+gCLCw5ZJ+WodEn0rmQtTIKD88ZO+My8NBsQuK81dLGFyV4OGMXRCjZ6F8Q3AMrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
	b=eLNOM7M4TH5VlvLVlQNg0lAhPux+3R2IfUc7k0VKIx+z8A6jKvzo8/5rtxam1rHPsUYs
	 ZUDwJspHJ4wmhQ9auFm9Ocuheuon0X0oqLPq1HVn1/w+dsIgJxZzvNJdcobKD4rkbfLEZ
	 bttOvO6p2xvMlTmAvtgMGFdeOAx7SpHf3bDfn+ZHtb/vlaeoelRnN2ekUpadi1So8Skf7
	 IxNAcCgXXBPLGq0HHcBAVlR0HzmEGbe5WAigbiy5KCtJApaR/WhVejSkRy8YYOwg1mQEE
	 96s/HuOPsNd5SceCPhqGnvniwXqC5XM22YntyXMDoVrivY03dUMdp24Bbfgksvc77qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCHEkMMH;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BE2606A31C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85BE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FCHEkMMH
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so5645265eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494966; x=1793099766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=FCHEkMMHCZJvrzaBB5rate4Fph4Rq1kjhZI+VLv0rKL7jFOYNUgf0C069UkN7PQEjL
         PUccoLadivPMR/aUAQvHUhbMnPXVkGWpOcEEhucRWqhXJcYE85lrvquDS7q6Nimm/IUW
         k4EhWZU7yIGZ61lrl6Ey3KUIz6ztljPhP4JNh5x08h65TR9u5GdEeOmqfikdDQKCj1uZ
         FyOQsZQx3YWCbpZinXk+SQcv3HqDXA+1/cfX6l6rn+4aNB4tcUeKphb5yBWYUtKMPJQJ
         Q9j98tsyqAnvAOnqwdRATe0htn2FmQCsegS0PcWfCVZiVOOvs4kiExTtUZJ7AgkXVRfv
         xXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494966; x=1793099766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BKNUIkvvRElNLCz/nkWKn3YDTekvBpvFpeCv+ciRNW0=;
        b=pT1C7+o6G/KCzpkll5AK8ioKSFaVu5kQOKA/E2sHHgeaqPKY6o1qdLVIIh0uoNhV6F
         e93VHQ8+vn0CdfGYPVBlUVsNnILE0HU8B2Utlg7TvdZ+GbZYVwDrUcGoXOXufZ1WFbO9
         g6ldZsI1OHoqTDjQssy/4e9ez+kfsq9ZKZAuxuQZm9ViwcL+8GQUic8bgluURJRZ37UI
         o4aaHWo3YgOn0Ii+QC5IhUlfZRorE79acPfR0GcW/4tCECmccg3Ux3SHSX/s88qL1uQ5
         9Im+kdQnHpkqIwMJR6+wtEbeFsTWMJv2EZv/2OOqeyh0lX5GXAmrxvHHwh/TtV54M5xc
         iV7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYV2kAZsbjNLQ7TRjmjCt0iVBzDwUFh7Kkum4sZrf1agz1Pz8z3Z8rbL+Pqw5egvhqowU37EhSv/XN@vger.kernel.org
X-Gm-Message-State: AFq9FYKGHLB1Yq4O1HdTuXQFaWTAfn862oIM/qWVmiS5p10YEPK5cgHj
	55Zeu64HywZJyt8yjPXwGufwQ5uNsbxM0gZDgWRtndc+wLgQpY8QcpXA
X-Gm-Gg: AYBFou3zuvCO5OZUtxOzE2U+SNIDtXOZGhudrkIE2E4kIwQ403Npmn7umfk4fgHilQ7
	t0AhTOK6m3OHoBDCyyAHGU1C7kaQquurIoxSPyWAa4lhYjKYUnLRUjLES+vJjdgKcRixYn7tTz0
	Nc5PBUmujBXTQgd+MyUWKHefuLzc8l5s7xeZJgafmXhfodDLTDV+UGBfRV+aY1+MtZs1G3iTqT2
	CFEeWYA9FKq4JrMY627RJUnOpR8fLTZHcCLNh600WJLc9rBKtFeK1BRuQLyn99xN8iLXP+ZbTAU
	BiZHZKHgDTrOgJp7+7qWFJEuHBszsKyYSlqhIsBbSKzXbTaLsmASPROy8MyyTJNHdRlSARoKE5S
	jZyL/N7bCK17TdmJHVpUoIkY3E+Sx36/GA4ga07vMU8GTqij/rCcOaQuE+VODJC2cKzsZlvWeGj
	UpAH8jQPR7G5mvXcBQ8Fsp9TyR/+b5xeoZIehf/REiduoCG8GdRU43AX/TjpCfcexMzEeTSjA/s
	2KF
X-Received: by 2002:a05:693c:42ca:b0:35b:91da:7cb with SMTP id 5a478bee46e88-361a284198emr14197128eec.35.1792494966059;
        Tue, 20 Oct 2026 04:16:06 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081fa5a6esm41461147eec.16.2026.10.20.04.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:16:05 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:15:57 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <u3zistwpxmtjstw6lqh2qfvr3mrj5ozflxfnrln2qqitjnj6lw@5ea5j3zmonw7>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <atZ0jECm5BDeROSI@SMW015318>
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
In-Reply-To: <atZ0jECm5BDeROSI@SMW015318>

On Mon, Oct 19, 2026 at 02:50:36PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:15AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Some simple bridges, such as a resistor ladder DAC, may include a
> > data-enable input that must be driven at a specific polarity.
> >
> > Read the data-enable-active property from the input endpoint and fill
> > the bridge's input bus flags accordingly, so the upstream encoder drives
> > DE with the required polarity. The property is applied only if the
> > bridge doesn't provide its own timings struct.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Hi Frank,

Sashiko's comment regarding atomic_check was a false positive, but I
wasn't too sure about the one regarding devm_kzalloc. It seemed to make
sense to me, but I'm not too familiar with this subsystem yet. Do you
think this was also a false positive?

Best regards,
Leonardo
