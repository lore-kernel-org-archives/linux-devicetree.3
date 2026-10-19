Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A1135200F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407119; cv=none; b=NPxjDMEjbLuxWGAQEJVRPwZWOIDi7I86gNJ1yru0g1CKyM/qGlbpDWkJ0XWrs8SOn5Bs3jvjP3fXi/Lim+GN15yb7YaRQrzRTVcbIRgVfksgddDINOxv7JGeov11pnYzUzUyDZlYvHfD6lAB+ZZ32nvROu8E6RoA1YKHDTql/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407119; c=relaxed/simple;
	bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=La0mveeu+UsgFIilvxw+Pw9rkCNyYctFII/cIEtY2rFIbA0rdfBVQkMu7r83GXCRcPL13Rp+XbkllKFNmmJm9sALhZJoFSvuzR+hUCp9f3zUexaSPpzlFdc06lCsW2919TYETbMcquxfCzAGK2tnRPy0eKHhIXyLwiNyiql+ouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=mihnb2lN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="mihnb2lN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a01933b584so13936185e9.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792407116; x=1793011916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=mihnb2lNs0zq84B4egRQGOF7XNQjSy4XS7+axCL8ohb4ZufbZE/XPSK//tOwjI0Iss
         tZB1MjbHTh1WjwPqo4/Wbh9I9Z3519yPIbieIXnUzmVKGuVX30bnJ+qy69c2jwktGbsY
         +aF4+AYoiNofdREcuASsGN1UHlJulqZ0QJlsDnSs6Z3ta3rs/gazBKg7lI7oB7J0r+j2
         JdDuzLZUglB4nLIMvm3boevXEFKYLfzQtd1krffrx4Pk6/or4vl4Bk1SJjzYYRyKJ4c1
         HEQ03NgADEXDldMr8Qx4yyOeDalMHo6RKUW2VIn31ioByHF+tUZ8eFYPsRGxazYzjBcS
         XWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407116; x=1793011916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYETpg2ch3RE6Zgv4/hYXxN4Wo2kZmgkDZJdYz89Evk=;
        b=tL974euyBa2qyCZK6v886O/EVHIXEpbGmtUHSJjO9cjbOV0OZtzXDpxBpYE1usZReQ
         l8z7iXe1Hon8LO/IeLyCKl576hrp0HsVr0rx+MkEwdJpiuUghDdDv8sHrS1SZOtQ/O9V
         SzXB9Qu6H2Py/im2K+OolkrjAmksF+8u4zwxFJLshHz0MIRuZDQ0ub3CvkobMMaXrqY5
         CNErlXfnfnanExAvYjOBvVQ/Lzf3GJwR+utckgmpVjaTxv+ryu5VcnuCHKEj6l4pOBg6
         YSvyHkjW7HC+oxDym0iwwi4zd07zUq1FMNxZFl6xjPWPMcb94afuO0u19Qy4xQSX/p9k
         B/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzoPeIzPq4tBeGoXBEEI2LZVOOoSB0ueWZP+iJiTpnhYEn42ToDk1oxUBTPUtM86C+FmFm6hDSwpMre@vger.kernel.org
X-Gm-Message-State: AFq9FYLXQ1rCbxiEyO9X83ECKDJn+TB0EIbroPjlxieGL7chHf5TBHoH
	WgzmyqcA2UMeWkmMiv4dKQVUzjgS05nmn4pG7tjJTwOXAeKda0+n2wG5jMrCIGARG5Qg3ju18Ex
	HqY26
X-Gm-Gg: AYBFou11zoj/iF23UyiAFfuzT/+IRSUpQs7sm+0XzxLgHOCL7YgJnUPzC5UUrhkRbm6
	m5Dumr7Ickq6DA9ces/rORg9P7U0iaKlYH07VtoHtHQFqEi0AuxYoLsM/denn8mopWbNgegKDIA
	SV+FF4ur9hjNGn20fLiYb8TbzNe+Y51SUcokcBoi4MvfGIOGLZZyPVKXa7sIj48YkNM4nc/upcq
	ralhrCf7+C0K7rwNMBPpVDsa4dqBanDQds+ri9FNrrJ8S4wn5laJyf1F42fGwFPwZ64gfJ/OPIg
	OYCobVd1+yuW0RdjvYJ+VjaZKZ2lrjxQbJDPA6sopKmI6cEvZOpAgq9CoHwFtH6H5A0s+YfXG4T
	/7VAycnxDX/xq8sHTF2DV4XETADsVDPAakovdnDYnPGg5Zm5+tkbi5jMX350WRTlFMsxelc8FD1
	znoP9h27WYxObcndIFcRIbLYoNYTdv6eC5k//oUWIVcl9+mQwVkwqwFS4z5almxa1LKzCfTLTZj
	e4EEMoHCyuGqt+RNWaJUXjuooY63Vj7OEFI4nk7EAUkDUngd+Fpw+0rtdnlvPnLW0zQvUQXw8wO
	qus1SD+Ski0qGR725CtRYio5f6qfZx+PPNYFTqs57PgKPOkEH0CpuR2tGnO5wTIABtgdxA==
X-Received: by 2002:a05:600c:1da1:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a1d76011ffmr159510145e9.19.1792407115972;
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm349369535e9.8.2026.10.19.03.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:51:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:51:53 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Luka Panio <lukapanio@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
	pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
Message-ID: <atX2Sf4GJNFYq2ZY@aspen.lan>
References: <20261016162912.64581-1-lukapanio@gmail.com>
 <20261016162912.64581-3-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016162912.64581-3-lukapanio@gmail.com>

On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> Add a driver for the Awinic AW99703 3-string WLED backlight controller.
>
> Register values follow the AW99703 datasheet (V1.6), the structure
> follows the aw99706 driver.

Given how much the structure follows the aw99706 driver I'd expect there
to be more code sharing between the drivers.

Cold AW99703 support be implemented by extending the existing aw99706
driver?


Daniel.
