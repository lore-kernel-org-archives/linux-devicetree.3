Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909545;
	b=COqNDUcKQhto63VsvbHkMr9Mdh8XruC0mUnVEFenp4mSCefUTKB2kfxeeYCOh27gruNu
	 OmACUQul7OlPi8327nOXft2JbVul/C5iPP0rnWA5HviW+4wazyrryOSCdUBZ86oUAp263
	 wzjAPToQsKwnCg/hITkdrmBqrZCwJK36YvmyIQc0IxBkRkGtfXD/xHVAsQy4SVnGr8xn+
	 rIGjXZwytpNv80fSBUY8rKpulxIzu2jRP/Ww6zq4+9hUBZYPntjgqi++l7Cw6FMGMtDoh
	 5ZIEjz2qnVhoIrxWI/aTJVW0WMph4Ucdx4G4Ut8z8YeH9gPq2EKXmysOD1pZJCBo6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
	b=Fo/HvBMKFSu9QISblKW4gLVjKujX+B7qLLICV/D08E3/n5NWiyAeJl0tIai4Wv7DoqzX
	 jU7hFGj16u/duf1HYkwXh0SwzdIVgTMa91+bVtbNliTe7fAgJrz6Td2xyrOApFqqcdgU3
	 AZradNcGoGiNj74U0AFKsjTaMUuPZCS0ae1RoLYMs0P+8dMJ+T9YjiIA7ubcQxw3q882q
	 WpaOe+xTfwYSHlgK0AoGKwP+/cAEg3yEC5ghhsV0hQIIkStOMY4V6yRCCs4yBwC5FsLy5
	 dZBTBP/F6o4/kfwRiBUCExZk/F37xmsD6rOVv5ajPGOBKYHO4J9gmJ30rZovjV5UpOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJW1RlPT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB8606A32D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BAB8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJW1RlPT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso272389f8f.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909544; x=1794514344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=WJW1RlPT4nBYc85BjmKGFu2S3pNJc9h7p7KxVzEu5ni8QwEhD6AZYZE1PHvNpvssVy
         C5+q+IbtF7LYPXEPEBRaZkzdujhWyQ0fUe4f5Xz/c5Vqe9MDfRDZsDQt8IHtK49XKXLI
         ae8sWtCDBYWI/5gseIUrC/+ZUjLbhQdgHuNQefnHAPOH+81+q7amXVCwCXPYDNrtW2sc
         n9nLehpHgJ9SuJU8R6QuJDwXGiC8NpgU21mQc3O/SLnA6J1YXqXkQEA2Og9BpDp3KDq+
         xEbiyGKqj+IBXKZBJU/daPFdn9kSiL/PN4Gn9LkJCkB4ihpud59kUVf35uGxaQaScdSC
         pbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909544; x=1794514344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oj4+ZYy6IPmEk7n48ZoOfVMyHB9K5zKwdNLmj5eS60A=;
        b=bWedlxLdFPDM0VAkEGOrkNQdWWXR4+woW5S2/I0keNMvv20WPdyGX+An6aCa46rkxd
         6RClMj4Rw0baw1awdkl7+freI0RK0MTN6sMyHx1AqH2460NPtvFCxeXiDconIZSdTnyW
         06RA9lSvwb99bI6xUWHSoJ9x9FmMGRpNLyexuoLJ7okNDbhclYydWDYuil8ONtaET5b6
         UgmPf3PZKwv6AT2tdTcBNL9RyERvZEjg0JiYOJ1bxbWT5DgX0J1IucRDZcAQeRQU7jlS
         ts6z5EN2IkADmvUYbyGOBk2Sk8UfsrI4gVS3MrzzJ9Z3/HCUI9Y/KAAR1cR9pVkJYxC5
         LpBg==
X-Forwarded-Encrypted: i=1; AKwUvBy5PCjphhz1La6MkFjRo5D959Z3KglvKrVNtFwJ8TMAwZWd05vO8LQ/0sv9QFlgQG8hL5hk5pR4a/wB@vger.kernel.org
X-Gm-Message-State: APuU4Z+0F+3ifNxtvD2QGqxbxJmLot0wsF55vw+KF4Sqtt2ItpHCjo2Q
	wr2k68uNhC6cyos+lYJYBt4ACYazPgy0wIMMkad5pnR+3sC2HmGprTMYiWBsDQ==
X-Gm-Gg: AYBFou0jZ0vvYAfMAbzd5pDivjqkI+Gunz8kQI9/KQkZSusJUZMFQ7pNaoYroLW5hzY
	+mS/SEfIUaDjYQ7yQCkRA271JYwNXJXPrnaa8rcwLBFl+UMUe6hIvQ4uZXJ96N4CXsysALq9neg
	M2q1D9zf39ZPfyw5/OpyUhwzkHw7jll5Gb+SKeTrv/Vw2ueP8nE93RUakijMQ5cTwgsGs3Rf+nu
	oMSsvVQGu9UKmFQxWZPy3zybpmV4Csi8iRXWren9Hkw8xgEtG7H5azP3Ou4wvRPLs48DAbEeAzJ
	csdLEC4a39CtplWNu4QS7B08TZqlbkNWIlN7n+8OUTiHY/qU4idQRWLIQXbRdThD0mcJMEB5cly
	2RCl5O8qNhxQ1zEg+/7VpjwLiV5xetGPYFItDDlPFIvdACLXYw7N1w60rjcSAohDfiCu0JbInhT
	n1yHdL1cqymWxSdmBOB0q5ZtvgKel/ncjvnzFiuOohO1LwZlRvZTtGXCrtBhpwv++dBTf8G6d86
	8v/bZDzAUDXSmSk72gFHeXciFimqiGfamEhOh4dNxSxHbbuzBDWgmXns9Xx2NgBoWJCtCQO2f9i
	iU2N/PQWBNcH6KryfcgPKZKmjw6H1H2EnrnSIfRWdANBbFfeJ/1FsiQ=
X-Received: by 2002:a05:6000:2dc9:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-492778d2076mr1325704f8f.45.1793909543495;
        Thu, 05 Nov 2026 12:12:23 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm11108369f8f.17.2026.11.05.12.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:12:22 -0800 (PST)
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Matyas <matyasdaniel006@gmail.com>,
	linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Date: Thu,  5 Nov 2026 22:11:53 +0200
Message-ID: <20261105201154.37294-2-matyasdaniel006@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi,

I'm looking at the fbtft TODO (convert drivers to DRM) and want to check
whether fb_ili9341 can be dropped. Findings against v7.4-rc1:

1. fb_ili9341's init sequence is the MI0283QT-9A one. Comparing register
   writes with drivers/gpu/drm/tiny/mi0283qt.c, the values are identical,
   including the default gamma tables. Differences I found:
   - mi0283qt writes EN3GAM (0xF2) = 0x08; the fbtft write is commented out.
   - mi0283qt always sets MADCTL BGR; fbtft makes it configurable (bgr=).
   - fbtft rotate=270 also sets ML; mi0283qt does not.
   - Rotation maps as DRM rotation = fbtft rotate - 90 (mod 360).
   - fbtft also offers runtime gamma adjustment.

2. fb_ili9341 registers the compatible "ilitek,ili9341", which is also the
   fallback in the dt-schema binding, so it can match nodes that the DRM
   drivers claim via their specific compatibles.

3. In-tree users: no defconfig enables FB_TFT. canaan_kd233 (62363a8e2f56, Feb 2021)
   has a status = "disabled" panel node compatible with "canaan,kd233-tft",
   "ilitek,ili9341". It predates the first DRM driver accepting ilitek,ili9341
   (5a04227326b0, Jul 2021), and none of the DRM drivers match canaan,kd233-tft.
   fbtft requests "dc" and "reset" GPIOs, which fits that node. I haven't tried
   binding it. I suppose that, if the board is used, then it is built against the
   fbtft driver.

4. fb_ili9341 has had only style/mechanical changes in recent years.

Questions:
 a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
    modules to panel-mipi-dbi? The KD233 node would then have no driver.
 b) Or should KD233 panel support go into a DRM driver first? I don't have
    its init sequence or physical size, or the board...
 c) Is removal of all of fbtft already planned?
 d) Several other fbtft drivers have drm counterparts. Should I inspect those
 to see if removal is needed?

I have not tested on hardware.

Thanks,
Daniel M
