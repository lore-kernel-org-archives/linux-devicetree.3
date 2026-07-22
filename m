Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E1A386578
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784692699; cv=none; b=Lp2v1I1j/iQBo50hidf2nQFgWCxHs5v9wmv34gZPXBThV21wITiGNvCOC/HUuW3GVir+m/TOKpOKJ0CO2NNLbe6Oh7CTSGSnIM048S4guodGejWqETzIcRSHoD24kM252vgrS5i/V2DTBIGwNGFpykht4aUY99sEzflP0ftVUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784692699; c=relaxed/simple;
	bh=Cte+u9tH8fCR/6ttNQaKQJ6a1hf+2lqW1U/FDUKfMcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVuiPsigLfi6N47LymCUC01qlX5mdvHD5LeGpj2j/Z7hc3/wuXgKH1GnAMXz2Q16hZyVCPiukogY5TQv3eHOEw+dF4bdk0alExAGO/NiX09Q96UJlFd3lSJTfWupbVTwHRCZEUT1qz3kbeyMAcYUs555psxkDTM9joTmgv0w3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nw5zy9/9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw5zy9/9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e6a434cabso651828885a.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 20:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784692697; x=1785297497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jeICyQW2fPpNALJsCTGYlCb9AbcZZPQ0wg+u4yTtyc=;
        b=Nw5zy9/9frt67p3YLOOCGI0qskLaHaA6gYXsPzs90wZedY0IJcCqfddHGsDRIPVAwD
         r05oqWN2ZawTv1wAJM+wSp5DHKH4E5wdxkTaUTHNQ7NA7mpPdFEuMgS98feDO+dxGvU1
         dOvYDISsK/UjbhSAnB188aAbRon1RiE6tEEoL8qwHimlFs9iZCqqUVUdoQYvE+PK+n2I
         2VbiUZzkYK7uVhk9ncYWuO7XUl8Try1mJdaTlHdAG89mBhHu85dqWqtzUQBgkdw5yDCM
         sTttZ7UD6G8yvw844UXqQcFbGn1rdW13F822BxEkSgdClVwECGMPBOMHAvkEtab5n3Ls
         qLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784692697; x=1785297497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jeICyQW2fPpNALJsCTGYlCb9AbcZZPQ0wg+u4yTtyc=;
        b=q91eC6Av+WwwjtuTxNUzzCVBjG5AyW2FjnaqEKsxPrKtilQlx3i71y6YvViUj3+ZTs
         Jyczyl55QobhQZ3PgCMKbs6l/GFBIbLxHAzVC+GM+aMJTki8vdL4N3pqI0PUCcohqjjL
         9lM5y/y7jd3xHLmp7gUEhCblL6DWe4Pc3XD6ChCdsMLHT+gq86tvrsNMcX0upUw+TcGn
         6nE/XSfha9+VbvjnSrQ2K0E2RaIBu1E00Qea2cwqiembQc1RP8mLdri8wy3l2azsM6X5
         990PuxGcUMstrTYacn1nM28/pyM6ZOYucVVFuQVlur2zB7Vv0aYI3NJD6+CBwE3r3jpp
         xLyA==
X-Forwarded-Encrypted: i=1; AHgh+RpEkM7wg08Pp89SDjuo/Lo12xC7ZS1TbNzi+fEfGIsoYeSiJlPi/s2mIt80JVKM5O+mwYprdaZht0Nw@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE9gy5EYZxDhfBoiVLi6BnoO/5VeRhz+D6CYXDm+e2kaJGEun
	mjAiJ0+cgICYmk9VotHQPedoF/1XdeT6jBf7cRkNX1lZhW67FkqTaPXB
X-Gm-Gg: AR+sD13ecMSwDo9cmTh+Bo98MzAUcKoX2HtiJ3VpDr/rg02+uVZOHQ+9p3RY/9puMiQ
	RN0R+67J0YRerJMzT4nmBetfRvAJZW4w00yHQWZ6raY5WvRLbwxRor5+V0zXVsuJeYB1iwRoa52
	DQ7VlLkRhc0zDkLvKyuegLxxaaiq4JSX+Zw0HQLNmOHhS4vs+mnsXMK7nv9o0k43nscSTWFxKYh
	5paMDQLbeqzMjGdo0tAXEVz++RJ+EHUCsRgGdGz5OZVY9pBd64jcZGdu2Kg/lORC5uAkpzmHSXg
	l+ec10TtfH1Jyv0rIE1Sa8UVmfqoHrBx2+cuKxxhuiTVwiNPWBqIfifoG3G2lOhmrleIfNlSH9V
	VZJQ3O78Tb8EyGvVAifiehwWomk/94xeQJJpVr5M/zHsV2sq7LcxEtlqho8/H9/6hj/54QZQCQr
	wK4ESc6i67vE56kIgxNFSxuqkEtVwlcwDFHuH/3WGtKYeEFLoS+djbvQ==
X-Received: by 2002:a05:620a:1a1b:b0:92e:cd21:447c with SMTP id af79cd13be357-930b3f3e243mr2072924785a.38.1784692696928;
        Tue, 21 Jul 2026 20:58:16 -0700 (PDT)
Received: from thinker (syn-072-043-128-189.biz.spectrum.com. [72.43.128.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68c67d6sm65916085a.17.2026.07.21.20.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:58:16 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	javierm@redhat.com,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
Date: Wed, 22 Jul 2026 06:57:31 +0300
Message-ID: <20260722035734.14981-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alil0p_s9-dM9j_t@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

>>  	{ "ssd1327", SSD1327_ID },
>>  	/* ssd133x family */
>>  	{ "ssd1331", SSD1331_ID },
>> +	/* ssd135x family */
>> +	{ "ssd1351", SSD1351_ID },
>>  	{ /* sentinel */ }
>
> To avoid conflicts it's better to convert this ID table to use C99 initialisers
> (so Uwe will be happy).

No problem, adding a designated patch to v4.

-- 
Thanks,
Amit
