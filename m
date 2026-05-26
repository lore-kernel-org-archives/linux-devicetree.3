Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3001400E02
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807223; cv=none; b=FODreZUV38k5hZSGRdpw8FfHsqzQNvfncswMOH6Btz3jFytgYjZ+oc6uH57fC7wr9Z0k0mri2mNd3dV2MaghECotefBxq+oIFx/nTD3qcQyQVJbwlPctT6g5HWTwi1XtRTrQRBapy3JoWLeNr3ni6ezYRy3EY1KXq7kfT46P7AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807223; c=relaxed/simple;
	bh=9raiExYJwinCsjU0ztkvcMXuLXTubkfh6tboMQl05Yc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oWydn8e3yPLuUikGBWR/V29qyncQx4bDFU5Fi3cZnhcD+iBeVRJGiNT/aIqq/UwtcL15ckmx56G4q8JghOioSw5Y7gdKBMLc4Cr1bB9sRZWHURBvR13NLHLGe4VcKJNdwX449pfOdnUOmaIDCMtMIjITetkMtPq5KytlGaDA8Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mSIyVNNq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSIyVNNq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e5624c053so6408206f8f.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779807219; x=1780412019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5cQRAN/rOy/5Hd0UrHoeFdJRowMHdiS3Folbw6peeI=;
        b=mSIyVNNqkAjQb3sgpn4phz4E2yP0ijpPC5seankeOEgRLw/TStcuPB0l3ejA6H29jW
         4GhJNKvqYm28ADZmPW0pzUF2OrQOnyIJny0anw62K4mEWh4EXOySmU0pUFP6RmQc0YTy
         DpH87r3K7AMz8t9llg3Ct7c//p6dw/ET46/EIFHiovTeioi0KdjFQ2Xq4jUFd3wdnK5W
         +t4a0wQt3LdSycj+aMUHMJbF8zrxxe4DMsIYhiJVyxvKiwc2pp6Y2VT1oiO/O/quCgOx
         9LFmmiPQRdRzkwky3g9a6HwQbYnlhXECKBnAraJ1xpa2VsgMRCYgey14sLq0G7wcvCjZ
         c2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807219; x=1780412019;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5cQRAN/rOy/5Hd0UrHoeFdJRowMHdiS3Folbw6peeI=;
        b=EZuDobSCciZIfCDR+R9hXV3EZsiDN5NnRG3pLL1DtZSEqTt+tdIVg7hDaUSZwZUEjI
         L/6O8bNFERVWvHZhim3BvSwZ8gWzVCgw0loZ1P4bp78ns73tuv7UBUx7WI36j3WnQvYk
         at7vLdCFPZPS1HMCJrqKKSFuyVv6fSZFS8BBdA1zp+Uz404VX94KM01PysPwPjlTAz3A
         jPfCFBiqqbNaKMSbbRXc6u8hGlCiyfgxvoS50C4ZMYkt5QGRXV9SX5dydb1kQFTo3tzh
         1Q7SsHG4xqtMP4ZeJxiodsKsVG9WHhjF/psDBUnd1VkTl6VXcgVUa9hfdml70yVj+kbM
         SLzw==
X-Forwarded-Encrypted: i=1; AFNElJ+GInVSf8RPZqpL1LSKKk5zop0oog6+JTD88XTaUsNaZvgZQhuyh0suMu8v3Xh8IhkTUlg8r9Qi9mB9@vger.kernel.org
X-Gm-Message-State: AOJu0YzViq5uLPxftQTg4HTKT3b8G56u/upIqVhVb3BPe93JSU7JQUvg
	0Bvp0lshNFw5SqaAKkbC8MI8g0wzBQeKA9SUwhPbA+/auZqCW5q/C/z8G/2dptR35cM=
X-Gm-Gg: Acq92OHeVaxICyq82sGlGyKzPr/4kcoEOQUXLQwibVjZYrJ4lS+K1WV40GevSnOxS6/
	+bLjgsvR/anis9i9atcK6jNZi8TpIOCIgvU1wRz2PntR/Gn4v06eeju2iqmSgTQqQdq2cwrhfqF
	WaMEbNx7XLAAw3ZReL6cmyLKNn9VRk9DCiB/vQzKpWFwUsapKlE6JPbG/79JW0qRcOYfA6MX+YW
	z7MsnxPdzBQuIzrK6YBQcpA2G+0qQYve3WNiWr7YInkv+3Zi5d8lYw9RiKcmHShfsFfjHsK6kTr
	31c4OSzOs1NTg3GRcM9W4SFYvY9vbyjJtSbppXNVFT1hdUrd8/3JswUKQhUO8pnfpKzTkwkbJ/T
	x4mLmnbAl4SnFznAp/Xgmo4cPIZAM2vgQhA4t5f+eiyodO3JJg4QEboVGLR3kaVSZfiq6GjTxcl
	LDmZpc3ylojL7zpZEcTKgnfAtN5V9RSYfq2F91XJTAc7RHPDYgsHMJ24U=
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id ffacd0b85a97d-45eb3673319mr34044860f8f.4.1779807218962;
        Tue, 26 May 2026 07:53:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d49132sm36278884f8f.24.2026.05.26.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:53:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
References: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Add NEC LCD Technologies NL6448BC33-70C Panel
 Support
Message-Id: <177980721808.3070642.13975316431536819752.b4-ty@b4>
Date: Tue, 26 May 2026 16:53:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Mon, 18 May 2026 09:47:44 +0200, Steffen Trumtrar wrote:
> Add support for the above mentioned LCD panel from NEC.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add NEC NL6448BC33-70C panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a1d12f6f9305578641d3fd0ab01777e511f1785
[2/2] drm/panel: simple: add NEC NL6448BC33-70C
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/23c8c2cd3d4a2b65c21d31cf91e81d5e0b81ecd5

-- 
Neil

