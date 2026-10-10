Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C12331A48
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668506; cv=none; b=WZ1rV6XiZ1VsW9fhmgNXsM4aoltlAmepSty8T1rhFgVL/sIg1Gw3AqVXWUQe6PqkIl+EUSI1xEvF551JIlTf6WwYxPEc1GBNRH1R4PeuGUXkyIYSuc2IUjFOUtTo4WsM0/FfigAUG76J4x591zjdWilvlI9FLTyB1U/UnH9+rTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668506; c=relaxed/simple;
	bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU+GIatedz217StZor02/fNXnKCq1RE6Yc41Qf0zH88lVrvneUCzRmYanYaHRnT9yy1yJzO1WRdQ2DzUfizbXQG3bsy+GEegdh9nnfEg1MAwDuMsDWxD9trM6FBKAewmeS4fK80HkCEcoTzlnlIvZJsu5ZtkasfsYeKPpzBU4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0ZoR3lA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0ZoR3lA"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4207ac26so761317f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791668503; x=1792273303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=l0ZoR3lAs9sTroAh39FTweGNBStBrBM74qELjEfizz+t2MCjZh0aqEzQtr7Lkjgu5F
         +PeejTSFMu9AAcGTRxKJfigHhfHVw3D0ZTC7RaW+hCv4VMZvxdbV0Ntgoog1nSjkJ4x7
         4C6shV8CjZen49CR837nKlyaLuGzcYohIH3W/KcDaKMS6e/9TRsdN8hlyRS91CXw5nrf
         QhTv1ZFAGk8wNeacRgwq/jzlus2WEI+PrWHzJ1KQrWcLP0HzhjAywbC62yjkegzr14Ax
         knad6X77UNr8phJ8xb9T7BPOVOShESRYwhqdOawMXYhbCK/TkSeYnsQK6sWBBkWtjEXC
         dwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791668503; x=1792273303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1aFOSVe55ArlboT4cO16oFf1FAGz9Knw0x9VyoCqGZg=;
        b=jvOOQW0Ishl3dUOz5zEoC/C7VBLdtUPQN6H0DBW/QvM/s0shh85winEA+1EQBNCEo5
         6EDgnDQ18++k+6Up9n971e6uBo/+ODxG7H0Ktj7SFUXxLRCjtP/RPzMwhHEBijMdcbbF
         87zPMnH1uiJZ8g3yFZK6s1pPJoZAdM4odc7O++PoAx56P6TbhRrq3TtT/KRZL02x6s6m
         tX8j6kXzEsfDN75YDKh75ilZU/RnmQgPFqRT59rPHISGcDuaV1gSoyRYxlBtS3tU2Tpc
         9cz1kgb3nzciJbpK6TGioWWV/x2TYBS6fGTbYWPlW8730D6snWfHjTXBuxKEy/PePwJ8
         tBzg==
X-Forwarded-Encrypted: i=1; AKwUvBxFNcLHdKs1ZGQzN23Ss/tJHf8U5lRmjZrrXfW7tUQP5a3yRecddcFEVQRR4GRVOOy3E4nc3jLwHMJ3@vger.kernel.org
X-Gm-Message-State: AFq9FYJalTtm38+Lx15SKtUUfdpSnwgAmKxGAPaMuaBbA6hArgifDD8Y
	kSodSvZ92XIdmtaawGPBdv1FQpYLDmIK6Ee19/1JkDyJ5fTgeiRguGE8
X-Gm-Gg: AYBFou223BjA/7Z+0h7KAXD8/DWGxFkVgKfgVVEMdYNIddlO5lXjychPO8rfRwNrxBc
	q933fVWfpQLnx/OKaVaE4T0iKprayFFmXeEasE1BbAeqH652r8gE46HVW1yiwuCZzaeRhTSZfx7
	FnEqLrSl8Rtky5du/1m8qJnufItUSJjyPtCyET/3bsIk27ckVxShfZIIJtnA5Tsjo4V4zE9Lj0Q
	+lEHzSSTccEszj/OslvVx2HVbcuoDxp9/dFFmDluVV//w1mi7TiuG0MjHk0jahGWSV8uaIDWmpD
	Qu/IE67gMlbqWnCRx/oQ8ldSmi4XkA00ZFZUmLi800jQYtd5kWAslKkYkuVbWuoQiTkFg+yaX7w
	7Jk3gTi3QOv8HxaGqHs7BgcDA1b1agL6UGpOTWpLMd2xMPFZIhZBE3Zw+3a/BSCNuSgWD7IXNB7
	GPG/6W5towpuQcZAty/lQiAbO9jRLHLAvLcSPdaNvAi+Ggx86pTrmFa+6eXSIvTQzlOQQ95pNBv
	p1xfVKxyIXMdYQg71I+BBNPOzv28/8jTtbRJ1Gkbzx5v9ECmsEN6ul6u/YAtfl2sYhiPqrJa8jF
	8hnLTW58xnKa9V8eP63uxY70hSE6yIuPechAQcJfyFAiSavh710xOKRTNHCcUA==
X-Received: by 2002:adf:e7c5:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48dbaceedd2mr7689291f8f.52.1791668503133;
        Sat, 10 Oct 2026 14:41:43 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm10627330f8f.56.2026.10.10.14.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 14:41:41 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stefandoesinger@gmail.com,
	linux@armlinux.org.uk,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when requested
Date: Sat, 10 Oct 2026 22:41:34 +0100
Message-ID: <20261010214134.1706304-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
References: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Thank you very much for reviewing this and pointing out arm,outer-sync-disable.

To answer your questions honestly:

1. Origin: This was developed purely through trial and error debugging on the physical ZTE ZXHN H3600 hardware. During initial bring up with the MT7915 Wifi 6 card, heavy DMA traffic caused MCU firmware timeouts and froze the PCIe bus when register reads collided with L2 maintenance. My early tests without the lock froze every time, which led me to devise this custom locking mechanism.
2. arm,outer-sync-disable: I was honestly not aware of this existing mechanism. This is my first upstream Linux SoC submission (and returning to C systems programming after many years), so I am still getting up to speed with modern kernel architecture conventions. Thank you for pointing me in the right direction and bearing with me!
3. Testing: I will test arm,outer-sync-disable on the physical router shortly and verify whether disabling outer-sync avoids the interconnect deadlock under heavy WiFi traffic. If it works, I will gladly drop patches 01, 02, and 03 completely in favor of the standard DT property.

I will report back with the hardware test results soon.

Best regards,
Navid
