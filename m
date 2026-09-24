Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B442FD7D3
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258372; cv=none; b=QJ6y0DYPHjXKmK5+7EzSAkkY/AxNwsXznVv2TW9qPbj6T3xz57Y0rBlryVvyK+gaVpI3lwIBrx54nJKvHUW0s0h/kcRlI12dGJ5/wIi1w7jELuZFpc70DU8XB15VJvxxFOk0XrnT8BdI+DjfWXYlx4nu6zZpBqWvq33zBehZFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258372; c=relaxed/simple;
	bh=2xDfb2Al+hXfazTjwcsYYYFYI7kZoADbOaOKtPhYA0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kNgdIiYtI7ZP0ho5U+QcL1L9b1RLfcKyaW5jJat8DXkwC1sGZj1632gf19LkJlX+jLa4uLZz8hASiMMA91NW/7vWSNkCEYaH2CjmAoo5oSE9bjVtvVMBWpxYF0Jol//phvkhCOuTjrheii0G6lNCScQlWHWpmh02JKYvNwq+XIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O46g7lew; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O46g7lew"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1480018f8f.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258369; x=1790863169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bjiz5fcvqLF+AelQDc1eUMc5aT1mzQ/HKFsPWrKukUg=;
        b=O46g7lew6DPUnKzEJXk7+IkCfHr9r5jCIiRs8g2qvDyJSKA/uO3JUgf1pXe6rpNZKf
         +ABMhZgzFHC+mb3C2xZ9zzEwnzPU6hJQaKIz9m6swa0zLpskWUA/oDxsU/g5VkhPi70j
         N5qrzuKecArBTIkACGwO6o071mBwYyKQXd7eTSnhglfPnfAbL1JAgVFeKXrRsEedffeo
         y56QC5KAcMWDfquewtM2068wthiWvblgF+a8w2yIzWgi9l3rkiE6xPL0SRUFg+daQ9Pp
         QDqqoUgzP3f7LYxS0dqnhl0iT1zI/PgLbaTZXkUoaute0ELBRbWGfZoC7OGEORdnDNDb
         oggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258369; x=1790863169;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bjiz5fcvqLF+AelQDc1eUMc5aT1mzQ/HKFsPWrKukUg=;
        b=QEOu+R8hIV1roV0Qm4z+32LfCqRTfcKuaJGCY1gTmoHPULGox5664Iyf1O/d7S10v9
         qkHf8Cx3BcwzowjvBGoIpOHam531NNDr+HDdyZQWZbRoayatbjGrcri1HgtcmtMOHISA
         Y7b87nOYgtQerlT15GA9RJd8+ximrIi7i98J6zKk85sMcUv73uhvKxlzqUvPZRDP6oMM
         zxc+X/0wuVX6NZs/czhUpbpIqqe4oUdnGeOg5BKsx/L7Odh+xDxAXJTQMEJF8+M5Z1ee
         X6fQ1hOAqHlUL7aPdkc6FdbGzieyLi/HAaeSUFxXhsD0h3WMZjk6TsOZN89F5ESvx9pn
         X09Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXnKi+01kvkiuAY1UazaEiymAIXsCc58Te+8+HzAIMevQldNJN/fedE1OYjMCkg+2thQ1eCpaLJ6zG@vger.kernel.org
X-Gm-Message-State: AFuF++mkZxgm7spdFIvBQ3sg1B5lCNop3evlWrzpTFU0fscbI1T/130B
	GMxNu8/Gq5u604Ia8cOU6kDfe3f3/1KbVXHsJmPK9+9O0dZHYiw/egsvZBrQ483dyuE=
X-Gm-Gg: AYBFou1EMU7JHLFaRLaXPTY9Ifm2oqkveQLaMC76TRNLFqG12hJf2VC6V0ixM9uryLC
	0bTSBii5RJo1JkY5YVWma0m8Hlys42jyd06LQ4NqIaMIIIJNjnpc+mJtU6YAElg4L7mwFt4v2wZ
	6WuyUcO79vOn5SxnfsHbjx4lPb0LLDP+vF+MIMgvbcPkQOGkVcD9m1Z0DT64CK/FmW8JFRdYLGk
	ZOmzwtT2D/3Ti+4bNxlOL11HeDg85Wbz/khDHcQVTCnF+9hse2MjHMl31nuymF+MKgL536xGyRJ
	6F2M9FpaTTaZZDVso4LlfXMvBNfZ29hrsyD4gObdlkgBHWxGSQydmOg8RwQEJJNW54L64bPwNfp
	/i173QFnSJtOs2q9V4vtSGKtxdkn8ZWzYnlo2mshXfH3/R7OV8TCUHdgzm+Kh/dM/Wa/kihBn8/
	hsoCKpFl20MImvMov0CHRdXZ4ItqCrEogNXdMmzvRy8uqRRwwFmnmPjoqIP4IqpX/XZKL4ivcnu
	YDAJSbmx5lWOVaL0zTb
X-Received: by 2002:a05:6000:238a:b0:487:84:96d7 with SMTP id ffacd0b85a97d-48871974f03mr4191954f8f.53.1790258368630;
        Thu, 24 Sep 2026 06:59:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Document 10"
 Raspberry Pi Touch Display 2
Message-Id: <179025836777.3234093.12909071047594857987.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:27 +0200
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

On Thu, 10 Sep 2026 20:18:42 +0200, Marek Vasut wrote:
> Document the 10" Raspberry Pi Touch Display 2 MIPI-DSI TFT LCD panel.
> The panel is based on the Ilitek IL79600A controller.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: panel: Document 10" Raspberry Pi Touch Display 2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e40d71fa231fc510c87c92cfe40f60f18eaafa61
[2/4] drm/panel: ilitek-ili9882t: Make enable GPIO optional
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/803d7e465616d2822deb10ec3bf8952e49ffd6ba
[3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/20f01db1545252cf81a39202920d0b032fb4501a
[4/4] drm/panel: ilitek-ili9882t: Add support for Ilitek IL79600A-based panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/481b38467000602761215ba4a196e89f58248055

-- 
Neil

