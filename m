Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787651DCB24
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062342; cv=none; b=ix41tj8qWKfdrcUF/d3Xt8P+WPObZ3kOq5K+fQ2KJM0KKfiDjTUpmw4G/9Izh3tV5pIsu0DrSxWy1zBZstnezLkOcGyhSSItsHwU5bOyZbJB2gDa0aLGTTOigLW447C0ngWSeL3K5u4WNc0rCvvJG4S2+DxPxdKo1X1Tg/0Nyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062342; c=relaxed/simple;
	bh=u6NQAJOytJ/55DVmwyhfwINe3syqV5igf5yjdFanXoY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B67Fo7lAi0eTKCw94uclNATVOFDnseV0jJ27aA7f5s7O5Zo9Ve/QtrhoANVrSFieOZaMb3nVxGnOC44wN+ZTnaMsaM4prxQ810f112aw1l+EwVgzGSrXjrWxut9pv7sdZpGjz6VHZYrDiE2DDKPk12JmBHaAEspfj4cCqn25Arc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CNpQhkoE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNpQhkoE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso72560975e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780062340; x=1780667140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hmESmRQ7oEDRaIT7qrXfWDnCEYcDZdHNx/MwGQONMc=;
        b=CNpQhkoEIAG1sim1vqXbGqZG3dNj1EIJOJSPSucGBvHGLObkTO8zypP5ROZjXI4UfC
         aEb1zJSc1YZvwHgqCPcMEOhnjRPHIGpB7sne4vKGhonrSpANlU+cFJykpoEoTV7j0rN5
         Y7yJnTphQuSFvNTM3P35mJe/a0i0VROrCQfV6O6/HpZj45FPgrqUwy1r1Pfw/6Ff7h14
         j2KqG55c4RM/AuymM5X+urnVjOeEXF0Wz3WLyINiu0Po8YoJBLA8jotsc8+DDT4/mO1J
         Efv/Zpf0O8UwilLWm96OxkQXkH5HyZquwnbYAmr+GvBn68LRS4yPTkwOpG5XIWWr7z2Z
         M7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062340; x=1780667140;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hmESmRQ7oEDRaIT7qrXfWDnCEYcDZdHNx/MwGQONMc=;
        b=T/Qrfh3bu573NnbraVCqocN7EzQ/FcojYhhbHZ97se5WvUlrultcatdBOQwbfYNHNA
         HtzPrWGM+mcYtnIvJjgdchoPqb74GiOiwH0Lsb+uxCxYKO8kHcDbzlE8qyLyIHaxJr8I
         mQSzbH98vjZ4+oKg9JduKlZhpZ/TslPHA0xhupbFjDyawFbv33U28FEFIFPHWEVXe+3G
         s2NtByBRxsU3bzt3OJF1cLhYUcyvIeUTzeu0q/IYUuFwJP4jl/Z9CgzQ6J3jTyhGwxjr
         KXJCRKmf+WaffB7Hj+FaPrpYkuLV2yJ1fy77VcPWpqx48YPj3cRM7xLimiKytL3LiQu1
         zeJw==
X-Forwarded-Encrypted: i=1; AFNElJ85t7bzufVKHk7mxsSMHsBvackAqCmOjUmPfbDWeTTLgBeRPzeZZuXtVISvME+D0raG0Gkm39RKpaE2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Wu9zfkbQBmgURlSNBityZPWQf6wXIhWcCbRbnRqQHF0YSqlZ
	VUZVxgDuYbRAzzsVmT9bDmAes66Sv0+OV16jtB1A0oB3bKu/XkvbOi6yUgoQG88ZIPk=
X-Gm-Gg: Acq92OFb7ADR3KgyVcBHuOhJau4FJNUPl042ZLVMznyZOE/fH3jqIVe1028x7J+xbJG
	FRrjn5E4xDqkDwYWJoct6yY0IYFYHs+TpTMBtvoWCj8EzutEuL3a4dn4kUt9UZeFm2Fd8tzbX/Q
	XFMywcfVzV4PmYgO4J9Z9nxgJyud6/tWlvdL96p3wxk9N4mZ8M5KPDF+IgsuVgQ/EgGzsvKIp+s
	HYzP74ZY+z08lqtVKJOOrHvTqw8w9oFhoEhqeSCAf5o4BIpXz4yHmlW6MSXLI8gzdmVBr1EkFjI
	wgekVqoEf5Bx/0X5bkHbELCuHqsptpOoTompfNzGPKfFO+ZR7F/A9lRWhf3ZTbxkyPBm9lT6K80
	maQ8a+XzW4gVTFVLGekb7paHgdsESB0tvziVqMM2BbkUWw76UxrfXvZaqh/LfObQYdlY5Yc41N4
	3mUBFgPMqkXooHHOE3EBUhx+ossskglMJZnHNNf9rGrtOWekBweA67vls=
X-Received: by 2002:a05:600c:c0d1:10b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-4909c07755dmr41345005e9.7.1780062339885;
        Fri, 29 May 2026 06:45:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb3adsm41387165e9.11.2026.05.29.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:45:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add
 display and peripheral overlays
Message-Id: <178006233854.3611686.1401419911890133047.b4-ty@b4>
Date: Fri, 29 May 2026 15:45:38 +0200
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

On Fri, 22 May 2026 17:11:04 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays, expanding the hardware support for
> the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
> and peripherals available through Toradex carrier boards and the accessory
> ecosystem.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[03/11] dt-bindings: vendor-prefixes: Add Riverdi
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3764568dd2e621850c8c2a34dd8a88096ae73e72

-- 
Neil

