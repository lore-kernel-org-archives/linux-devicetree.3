Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90352836A6
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760106; cv=none; b=pjyurlRgYuYw3RGr9A1dtFR7wouCR21Ciu8WLVsOf1urZKCEVo/Qxy2kpiPzjUNOsMLhogdAUkxl4qYAT15YWWdg00eFBRaQtRmcC7xAxTrsmVX6pocSXiJ4vVMGtQs1S5DX82GXanyQUHUjarQaWqQOvPGEuqmY5ZBV65Qrqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760106; c=relaxed/simple;
	bh=Js0dPUIASHoguxiVqn6MBMWxAGVCNMhj/7RNejkZNRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VgaFjsMy2EnHJTXYQEHOVV1HjsJxaFA0KLDy+fWTEECbqkAfJP4BlOzeXHsKqZn94yISe28oWb90Ar1DWUA0Oj1xbPJOYnymfc4FcsRuH2m8FD7x+jAGvzcGKQumOdu+z148g2/oIZx8CQUuTrlWuvnlo/R7uzbGHcU2O0fbtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+lz8Ts3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+lz8Ts3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a893d289bso1475831b3a.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 21:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774760105; x=1775364905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+swBzHshtaJ2BsEpHPJ0Jw5GrqxY1V25vs/IOCsBsE=;
        b=X+lz8Ts3qE1fRsTEUra8AYF5slAKSe1n9p5pgRm08yqyAHlIgzuHJhNdP0zx/AzVsV
         6uQxr2CPrWl7w5nS38BId4mL9QykLfOduLEM0Xs6e5UypRN/VaYfrugVg0Srkqr4MlfC
         JmoNrurt65RSm4yp960f/HNdQXlZXqzHP/bNY4GKWy3JCe2bv12TMuTzpuE501oN6VvJ
         Tj4D92rz3ArFzyeY46mUSFmpqifKlwASDWS+9vYQl1N8tEKAf/ooHAhTI2yfvr4GSqzs
         uPT9A21BQJHs1/KpdTAlRwKOuuV/RBdBntuvVMH0O4FhYN77aUjFL62uLrBGwwRHhEo9
         xDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774760105; x=1775364905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+swBzHshtaJ2BsEpHPJ0Jw5GrqxY1V25vs/IOCsBsE=;
        b=dxSNHA+rVAJTyyqDMRS+iREe7uhhq9MyWyCBdw/0ruSrWRAc7b7ivyuq2VIOEuYmg4
         YJ0WtIw6doqMO1sC3b0LFT6h0DE2SSOxn0oSIdMGwvDN6ZotWcycqCNJSHyGs14tNeqg
         d5A7RkQS3Hx/TQEjEZimyCZakm2NZsuPhYkzRH1flFRZW6NzZnR56WUxotGb/oVp/QTX
         TMo4hMpKY8lkaNUSm+WclEyn3oEU387950jwvLyoHI4lpUxRRP/gIygxzi2wv9TbFrn6
         BACJkNZ8UMLNlYZ8PJqowXe6oSZS78gI4KqWvtgzmRh4rIaJkYxh4H8V//pgYzgGGnHX
         wZjw==
X-Forwarded-Encrypted: i=1; AJvYcCV02f2sH9soxY3oKVcqPK3jXU7+lz0Pl2hULyVEDrZNQhusNuFgARQCBZvTqI5sNQ/rE12JE7HA3QJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+PDXTnsQpPbPngTBF4ja86ZQawdgY5rFoqHAN8HrkX97Kj5ts
	z6bZ/zWV99/Qr2v/dwMnIyHcg6n9kCcTXxCbfRIzDvHVZn9Vote+HJto
X-Gm-Gg: ATEYQzyUmvczbfOq+63nnnQaChs49BvNx2IUnhMP+JgOAoffaR4YSrOfdUuXS4WQioM
	jqUh7tjoO1eGkvcTJv4DSQivf/DIpIAD4b5b3Cqx8sJmtsvFo3CZCCLl1a/8z7hiZfnRKrdL9/o
	AQbpzc4ydkjCjoKbRPhyzIWLSLk+Vud175ITA6f/OYfoC5eh7eFnJCGexgYYH/KxBrPScLqmYXc
	loTlttTExiFyEgDPswybExGJ4rNvfqD9BwFQeDBDKF1Tyh2zFuOleXOV82eF9Bs7gFsi3iMTojg
	RzXD5TmoEpaxsToe23J3vMzSi9G9FHX47m7p06Km3dC7+jyNEXGmcHznKsjA/x9KmgAbFUg6EXP
	EaWWyDs4ftmdR3y6v67VB6f9sPblXB2vFWpLa1KPUkOSamdzD9BkUPX3aHhryH8UW9rjOxZA4sU
	xXaYxMiRwUo1CToL2osrnP
X-Received: by 2002:a05:6a00:369b:b0:827:2ee0:411f with SMTP id d2e1a72fcca58-82c95d27b82mr7740643b3a.4.1774760104995;
        Sat, 28 Mar 2026 21:55:04 -0700 (PDT)
Received: from ArchLinux ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca8625269sm4005082b3a.53.2026.03.28.21.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:55:04 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Sun, 29 Mar 2026 04:54:46 +0000
Message-ID: <20260329045447.9450-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Mar 2026 18:07:23 +0000 Biswapriyo Nath <nathbappai@gmail.com> wrote:

> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 

v2 of this patch series was sent here[1].

[1]: https://lore.kernel.org/linux-arm-msm/20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com/

