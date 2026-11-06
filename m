Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994506;
	b=zGrlU8ZxSLdwyAtBdW3YVHAagEd7BnB2tz8ukc4wpTpEdGHIe8TLgo0YEYK6VYK8WJoK
	 A6K1yUQbsoeAjUROjHUogMFKzg7h5HlIiTckrXPzsXwBGFnUoO0MFy+3s/UVTeprBJVCB
	 0u1RzLoTv3f2Ih+CkuVDv4Y6IGARw9DmdxN0yC3gP6Lfwz4TovuSWUru7wNr3+6hld3g+
	 +19vNekxr6Cq7GfVNLmqU1ncrGhCJ666tNcSqsPHWpty0EO20yMCUEO5b6d9S0NORWYAi
	 rBfscwhTAxIxxhfNpz1pd36TyCXGPkaVBO0WUHHw9PWAYACTznQehB+avGxT6rlkNDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
	b=XGl5zL/18kjZj2ZHNAOuPiqjr1wqQRZIV4x3P2sxolsDfHlilcHcaNHBnhF8GUKcy9eh
	 g4nusP/0valRH50i+WYcd0NE80x0lE7m6QlSZmSxtxuuDRqmw23/BZP7AddPvAenUsloS
	 D2ReoWsDHtDArJfu8fwiZyuxpl3Vhbyt6+kFUTscRgdNqP0R3xnlicb5aOo+ATXpoOtvH
	 AdIzvP71oiOIgaZgo0dZFIEv8aHXtLxe23wuQAzpiXtZ1DVoXuLjcqP5MUqz2K21sPYFt
	 f5mOqVGGNvxua6R3oS7YR5RzLkaHRg/5Xw7eg6LPDC8LkPVhPTTQJIfzMtT/CXHDg3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rC/vlYBA";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AB606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 19:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rC/vlYBA
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso927472f8f.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994504; x=1794599304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=rC/vlYBAxEILAObsPB3tcl+bFuhtNG7RLstWYCnjjx2nBh4dndY5yFt6tE7obdPcC0
         vcQ6/Bmt/U2uWAAAcznQhNK5v6huZqVaA1kskZIo9ZOaXtA4VA/tNufCk80J/2xOOMS0
         cUFmzpOX/ZrAxPMGUxDMNDXnoPMtO9YtsDIi2FX5fo0fAGsib8Xu6pcdsWQjdeqh2J9P
         zYRjiRPdNGs9yxI9xGUX91h5qgeXdqWM3xHJomG9oXkfnx+Ov5RgLrUkbmP+ApOwj5+x
         C/Xp8K/e17UlhCuf7cq2Ga1VPW+6gIcc8OisRssgTgq+TpMI9gjZ1CWWFyJjw6AcpMPv
         pL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994504; x=1794599304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=xdKi/S5E3HXVt3snrCMbLhcju1Xt/j/UhtOmm+c0R4zM9CZjQYT1ABiQjbG7EY3ytE
         VQe8zux7FWO1l4i6shf8LuYoAAGak2Ntwdfpca4WOLkwuErV32kEblc8I90Dd4tqzuzq
         r+AAZUVxDqe7XHKDdaeN4UO/OdQhlKdm9oSZRji/bKWXWPbUL9XR4p8KIB9VvqSTlJqC
         Np5exZnSLGyTLVABwwOxyRYrfOu6WVQrJ163vi+0eUT+6iFMxeKhAA+Wuw7+zmdMvaH5
         S6S4Z41P52QUUrz6Gq1R0w+9Jz5RJQZuPPrLkMopZzdsxgoOSGcnCh5DrHDOHGtTgnho
         4GZw==
X-Forwarded-Encrypted: i=1; AL+hErGKfZx9y6Kx8mcIP8p/Y3ELu5GfgjhMq3IZs3EgrD9u1/VuKN8SygHdwLOw8vzkjZijFb8X0ioy1UKy@vger.kernel.org
X-Gm-Message-State: APuU4Z+6TmieeT/bhrJc9URqMKW0KGdWBl2ZINAu9qez6kKZh7IHxg/C
	cZmXX3mM1kbnjQU2In8vBnsfhyRqAm7F8ozgg7NpzBgxmPLmSPPKNkRF
X-Gm-Gg: AYBFou3jdelpvAnD8grEZplifXxxdfgICA7uSpKKI1Q32enXf0et0sr7xa2OB8u2kNu
	1g/B3qrOzttUkKBauXzGNEi+M0hGirN8WknLWsZqoP+720SqGBc4ilTXKde433fYOP04xL301Vl
	SUmh1XmRNgvzhev+WtL99MnZXs+h7j+0pKdwnyEuyotZUVl7eNFIA41f/NqJl90nonBjZfP/9FQ
	19dZWLCosbWjNeiXWLnE2Y4dodVrEzbuy1VSoTIWuM8ylBeJqKdxof0QkOKGXuTX4Me48PPEHmz
	LHuIQXvPMy+KtThsqRDYzX8dwIPN59lbGEc+Z2orpRvmTJhjsZ3SXyWTqObnHi1nISslfsAqGTn
	fgba/EL47Ces6YAqzJnZUiL8IQiyeHRwL9MGSjfNFhABfjOCV2ld7MRwKk5q8drKuALc6QeXQGh
	XcCWRVxbaglUQ7N7lRY481QMx12T1rVfnJiZ7OEMYqfTGja/dikn7vOZvZvW/mB/kayQ1klD45x
	Ih/fWTUbhmgrwC0eJLz7syDIhyodvsxN5bnHNrFNOCB0cbVkmW9x6/M53GIOVvgBvNWlZvIycA7
	DC/Dm3ShLCawd4MLfwL7uf9Sl5ETTUM=
X-Received: by 2002:a05:6000:1acd:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-49275fe4e8fmr6979074f8f.20.1793994503735;
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm4928130f8f.28.2026.11.06.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Heiko Stuebner <heiko@sntech.de>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v7 00/19] drm: starfive: jh7110: Enable display subsystem
Date: Fri,  6 Nov 2026 19:48:22 +0000
Message-ID: <20261106194822.4153919-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on a VisionFive 2 v1.3B with this series and the v7 PHY series
on next-20261105. All 24 modes the sink advertises set with modetest,
from 1920x1080@60 down to 640x480, including the mixed sync polarity
modes 1680x1050@59.88, 1280x800@59.91 and 720x400@70.08, with nothing
in dmesg.

One thing outside this series: the modetest pattern showed small black
bars until I wrote 200 MB of other data, which pushed the pattern out of
the CPU cache into memory, after which it was clean. The U74 has no
Svpbmt, so the dumb buffer mapping stays cached here. My v5 run had the
SiFive uncached-alias errata patches applied and did not show it.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>
