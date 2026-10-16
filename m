Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDE3C1D7D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163124; cv=none; b=B5NvgKmMy6jQgOglXD2MrZK5AXpRZ0xWOOs9nuoII1T7ZaGYIAfeuv1Z4+zfdQWu8u1lTLxJJDPOrCEqvOLx8ry6Cd3uNfqVd10PpFtRUvGwuDAVymO/GtCUzLy9m5gtJoOiIVFtgHPwuqa6QWc98yWTKmyI0d2BRc9oRPxmGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163124; c=relaxed/simple;
	bh=XRkfZtcsy0TZN12WWwowzLogirHoibCR1B2WwNqdqHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8/qd9mblyqCHO/K5bdQ7gVT1upQNGwoVQzWpo/xjUL2BBHbiXygP76piCq/thYd9L7qNuRlQXEBUU0FFIq1gOL44ISRFNiVl4zr2RIGoOwKQcKSYrmu+YbBlSHBE7lbCeX0MX4Rj2u/AX/V3UJ7hhknX6QAlQ7QcDuVP90QJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewMkdODk; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewMkdODk"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so4943332eec.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163123; x=1792767923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRkfZtcsy0TZN12WWwowzLogirHoibCR1B2WwNqdqHo=;
        b=ewMkdODkTayllbM1cFgFQlu+MIM2+wL7t1soVdY+iirGDoRfpXdvboy4b0u/qXYYUj
         f6a2eBX0/zq94lABtI42LlJKnqvPHjO9JR9uzurzDMBE6RnBQz7zw4qDJO7fj3ikjCb0
         yzhWoPSt6tV054hmJ7Sj7KcOfLnxmOjkiDE2ZrRvu4tZ5fdedRQIkPBCPZUAQDhIek+v
         i+9UlkV9e37Pcl7Axm7tbo4WYfU+BKrU6WcmI6i6IAW8pYjmXIHlyLXp3YMBzY2iQnHZ
         qhRi0wwcFSrAmNiobQxAzZIdf1usDUrEvRBnyym+QTVmC+DnDb1f+ysDHRHLa6wue2fl
         MJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163123; x=1792767923;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRkfZtcsy0TZN12WWwowzLogirHoibCR1B2WwNqdqHo=;
        b=g3OB09s9wYM6bPh4miOMd0xm6WggmRLAUiVfSmDi7EhknG43twa7B/ZLB1iyFTTzYC
         SbKh9zq4xnLPvV/y3dKS1LcWOFXm8ugA8FW1Mmq1MCg0bfX70yeeB3EBy3HDmgt+HmB9
         VxwMKIThs1gMd4gglPGqu9myK+hWDy4YwxTf+2XS6MXP1WPfPqQb9BvVr1OQpVgSvgIS
         jdgsvo2N5LunWUkhTZBqDuYF1Rx320w1bT+DwO1qm44Wh7/2b6ZhdpUFU0+e+LZHE4Cd
         sbSZLFpVvF7pc+kw6y2Nb3OIF3UiLqa9W/tUQPn+0Fd/ZcljzoCEOtS1af0UkudfCUyR
         OmXQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5/4s2Me/0JskamDf3bz701qRzkqXzgjNEZlOil4r6NqHNEU5W4wCN6oPjZGscEBI0LbGg2A1qbPki@vger.kernel.org
X-Gm-Message-State: AFq9FYKOPZ83E0GzfRyGMUpRs3X0TBnrAQ9GyHSuW/hh+2+MB1rMoATO
	z2BWvYHWjAcj3kHewDotrg2LefpJUFIAJG3tX2yVpb5VLoFV7aNyFaQN
X-Gm-Gg: AYBFou3CHD7C7XC5GLYgw2U/znE2+yDxe6tRsCRLW7Ibr9G8cF3qMcf17d1hrMaOdTT
	SriXhLDIp2zD1hTrbFoE6eBFjxJmH1DBUOEZbx3yxXJVG4973B7fzr2o/R6IHi+reaMzZYO70Jr
	K6f0oMITP+xPThfC4cckjxv0Use3T6o3QXwy+rjj58hmPMA+l7xq+vlmAkBLDPTN2PZIZUbjorH
	bGZHdbUBchNzn7xhexTL4/rSoomu71WukrKsmPhlCWRPdoLXy/S0oININJsMLUyLlMOJeDcm/E8
	2aS+80MY88FDHwz7vpc39NTkqLcIJbGaXH7osM5BV/AiTnPqEz9EMbuE23T/3aqEphMepj/ycsY
	wuDv9WZKJsXv1kGAMaZqk2EbwDsS/I3ti/qkheSzGyUKuO3+Xv9bzlpQ/Xlw83pMmEcXocr6u6m
	rCjXDrLBZMERJXKpaCa5KuVM2zizeYTvvj1+dgeR20U2P4l71Y2hq1SwvjXCh91+jpcf0o0sxqa
	LT6LeocIPYPO6PBp65Ht4qJTyvp0UwfNux0FzBaX3jraAja6posOgPu2oIkoTNT
X-Received: by 2002:a05:693c:65c9:b0:35b:782c:aa29 with SMTP id 5a478bee46e88-361a2941548mr71403eec.33.1792163122413;
        Fri, 16 Oct 2026 08:05:22 -0700 (PDT)
Received: from Ghosty.python-cobia.ts.net ([2402:e280:210e:2e4:197a:43fe:563f:5948])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm12849770eec.28.2026.10.16.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:05:21 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
To: Ray Strode <halfline@gmail.com>
Cc: bod@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	j@metarealtyinc.ca,
	krzk+dt@kernel.org,
	kulikeduard89@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v7 3/3] media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration
Date: Fri, 16 Oct 2026 20:35:13 +0530
Message-ID: <20261016150513.3363354-1-rshouriesh@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015192632.283185-1-halfline@gmail.com>
References: <20261013-hm1092-driver-v7-3-d81a9b152ffd@gmail.com> <20261015192632.283185-1-halfline@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ray,

On Thu, Oct 15, 2026 at 03:26:24PM -0400, Ray Strode wrote:
> Reporting the native array as CROP_BOUNDS accommodates that readout window
> while keeping CROP_DEFAULT as the active area:

Thanks for looking at this. Jake suggested the same on the cover letter,
and that change is queued for v8: CROP_BOUNDS will report the 1296x736
native array, the same as NATIVE_SIZE, while CROP_DEFAULT stays on the
1280x720 active area. Since the selection targets are defined in patch 2,
the change goes there, and patch 3 is unchanged apart from rebasing on it.

Thanks,
Ramshouriesh
