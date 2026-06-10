Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224CC19AD5C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057410; cv=none; b=ewPOJYHKT+82v1J1qNvS6L63dGeEZYPnhYyqhNjg9MOKegbvVaDxGv+jSBoFYfp7D2mn7lt5pVVAaO3JNlTvxQVEnAaMv6Ldxl/vxRyHxqx/0B8cABVI6fC4HL76NxRmOS+4pilzxCo+ei0O+l0fqzNIT4vASzR9wd5hL8+/3G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057410; c=relaxed/simple;
	bh=AzcM/BsSmQHmhGhlf6vveW8ZgrRqVlXrTeTt+urqMw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NH+GYD6+cVIxOwTr+WNkPR25HZCK3uWyJVs+YfctduWaS5wqLI6V1MASrOBVI7pVGPvqVZ7WvRm2IecrE1TSv2GjfxX8xxF5buZOl2lmsj0m2tAt/NhYI4Hjl+mxLgAdbJ/F9bn5SrhjoBiiuXs/FyNB3XPsixCkHimoPAqefas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLS2GcwT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLS2GcwT"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so4082446a91.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781057408; x=1781662208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzcM/BsSmQHmhGhlf6vveW8ZgrRqVlXrTeTt+urqMw8=;
        b=qLS2GcwTXgYRSwe0AYGj9Uv1/xknWFxLiFRTtTC3rS4Ok+1m6O+eCXQRkbZvGyQzRy
         17PNFund+5H5q18jnQscMtnlRCPWTIAJTKZnMo2DhIbDo2WYd6QGIHklfUPoNU/qFIDk
         UDKrGQSg1WzOWx62NJN/PaFiqNyiiTXcRw+se5iQ25oZyfF1SxjXj5J06AmUA9n0GBIW
         BbtFFYZeD5N1/1wXrB9gU+59RmvGd/oFUEJ6GMRf3REOJjLCGLOAutq37kO0gG275UoW
         L7tSfFrcfOVan3a0uZIVut+8/kkI2XBWcUTXDErSAO9yIo3n183TYmg6mWcwJCSpjc/a
         Cwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781057408; x=1781662208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AzcM/BsSmQHmhGhlf6vveW8ZgrRqVlXrTeTt+urqMw8=;
        b=X6aZyy4YqM+KgYoV3dGcUfjLXKre+qNrgxHmitYiJib+hV4n2fnkWkMPrkqZwWpXaC
         BrkPd6RDmemZAhVXCJRHKfYB0B59+ASuEEcJC9G7qtMj1cBlCeip2pU64DM1LAJv4fGT
         g3V01PhnWpvUwekh3Yp3bNr/eHGPupUXgf8ELtQm+dJ/5NACHfe358nBVQXm4cT6bIbg
         wlclQr7ZgUn7PM2RhKQzSIvZLFL6wPkqyOOibSePbT/s9a2tC/hI7QbIaLHTcpkILIdW
         62140cPL0v9DfCbobI1DnNbJcByV65CltN1bdGLLEFPQnL/MILTo8flWWW5J24x/HxmA
         1Clg==
X-Forwarded-Encrypted: i=1; AFNElJ822RnfeboaIsvfJ/S1PqDjJw0i1yANxlxFO9hOUs4Py7x6fS9pNMfrGcxpJtJ7emTX2Kl2RwfisgV3@vger.kernel.org
X-Gm-Message-State: AOJu0YwnlCOx9mOqrQKEXmZzJt5uOPCEDWI44GYEs5gWJ5htz8h7Xh9v
	xjl5EXEjIH3AraADW9zB6xgyhp6cR7uhvIHK14B27U2q1YQJmfWwJubb
X-Gm-Gg: Acq92OF81odfG5UR7nZwZPhbN0jXuOQrVK/KnsLwO1nqRYBynMtnYdjFQ6ZRV7ZH2Ut
	01BjT/ktQI5BDtcHrVIHoKMLR4fsMxCjYVzisFf9PlQs8pbYeJu6pgt4yF3VDvd+i16UzKqPbl/
	i7eoSaGSB2YYRop6C9/fdBMJWJQ7yV/o1Ythur3kL+jA6g3zEJu0uIVkiEEeHOE63aB7ShMdGBW
	g0YfOqRdLOdQymfYuR7+Ybb4uN5oFq7OydwkDrYNxKep2n4XQ77tIOlqm4L8uRhsQ5MLEdrEQF8
	U1A2kq7lXWSc+OjygYJ9zHTi6/5zx8c/f3XyiuvaRn99yCJQ40RJ5lEKOk0fHAqtGzguGisuiaX
	557TSDUWgpuh7CmF2KmWx6hsmgBVQo+Lm4K+1XHumd8TnRTcJ51bwiuB5fTEiKL0+LOm30dUUnZ
	NgVhEI9OtOjZXktv8/07tw3jKhFcRMosDNDBiN/hbyMH9zgCqaYWRyZ1V5kFKZ6GjwyI56R2/kg
	k3S56ydnITcnCIdZ2gxcBMlWOzFvsD7lPCCThTyUdMObA==
X-Received: by 2002:a17:90b:57ef:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-370ee82fe8dmr24233876a91.5.1781057408350;
        Tue, 09 Jun 2026 19:10:08 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376245bb9f0sm831289a91.9.2026.06.09.19.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 19:10:07 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	onlywig@gmail.com,
	zaq14760@gmail.com
Subject: Re: [PATCH v3 2/2] drm/tiny: add support for PIXPAPER 4.26 monochrome e-ink panel
Date: Wed, 10 Jun 2026 10:10:03 +0800
Message-Id: <20260610021003.2112300-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
References: <20260529-bar-v3-2-5c2ac1c751ee@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A gentle ping for this driver patch.

The DT binding patch has already received Conor's Acked-by, and I would
appreciate any further comments on the driver patch.

Thanks,
LiangCheng
