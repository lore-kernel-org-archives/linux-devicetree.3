Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D854DBD73
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008754; cv=none; b=K5ubjD61QpfslFMjOmVutEjTDtWWNNre2R+V98qVlJwKJW4mbZo7AIW1D6LlhfviroQShO4SMWSYcfcblhClO7MJBXdAX+7dl2am3jPFzXern8i4F4LhTF6iR+RZuRhlPJflyW/zyRAIdfvmbRonvVGg/jPTB57GhTCgwwamvpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008754; c=relaxed/simple;
	bh=24LLjrfzuiFDMiY2Di7cUy9EJjgSsWn/cM0wQ6Zr3d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdlNAacNapj50NIasQ1cC51o/uotVXKxBbTCpvdWZa4H5gQpA70DogLbYFuksFMP4dHybZ04R3ipYD4xQ6YPlVxhNbcQnCW7/CvyOmXI1q28/rTazu5io/Q99IEeKBGUAo1WvE+zJwd849NGux7u9kAvgBTaLIblHcyNQwS/Zrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oyV3inQE; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oyV3inQE"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868b2e5be4eso1629646b3a.3
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790008751; x=1790613551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTiKA6dzD/roszw2geZzPgwk2NApUJFQrzcJ6rWXdb4=;
        b=oyV3inQEeeHTqxshpe/ogEl7ju8v7wlSGKV8bYi7/jPp2xNvY75N0XtQlSAVvHe1bO
         oLv5Ucqi+We9rxUgZhTCL3E6KE7U0L84Jsgjv25Kmnx1/s038WxTnkvd7OxPHUtHlvJ3
         Ou8Krd/nIkpIghqkR3+p/jTEh83Rnr82O/X2PnLiklAJvV6ZK8uVUb8J3a/fw/mI10DY
         O13ioxKjOe2IplsuOhQgZqAa3QAHn33bpRo/mXb7pBwFlunGtFclgTTVkYTRXqhSVwoA
         qpWRGF2SKWT4TlYcy5ne9wj9wZ83LVkKiNE67tmMl8rYikXP34nn/DREtX4G8y3Y1jxb
         hytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008751; x=1790613551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTiKA6dzD/roszw2geZzPgwk2NApUJFQrzcJ6rWXdb4=;
        b=luNLw6bkItLvSEoaHQ0HHuROctEDmYiRsjQ0GhSZw8L99VwEBbHc8KGxBp+WjYmgtF
         aUAPSWrYl6ioW73ud3LZwXhup42f3di4ZNBEpUajqt+/WQ7c/eM9wouniHQywHM+2wJJ
         H/sIOxGo/VHLZbPTbggewEQ1ii84J9/2jXVMwmQQnjAqyCPsMnkTfhllxVv82P/MItLz
         pDz4iHy+J9GYZcNVHZ5o2b7jBIvJMBH4lqzGe0AJelEDjgEznPqXccyAdG+b6nM0CjcK
         4Mj2E0LE+nZhkLjiJ8Hzj9vPyDYlNQAf4yWJm+WPnb08vaTZ8kRWSxd+5R1BztJi1uBl
         BgKA==
X-Forwarded-Encrypted: i=1; AKwUvBw0UAule8rWvVp2rubAXUXcSFSli0n1fFBBFjN6rdHL/qrgjGW2M94yCW+akR1YpmfjraerAHKER/aF@vger.kernel.org
X-Gm-Message-State: AFuF++kMmVvY1UPGQs51mxrL5hUG5jaME1KmxEjRvVhLNn5Pe+5AH0nK
	LKwzez2l1z079uqFvFmjnYPxuOJoGBuIOP0Vb+mjqCfXmJW5ay9mxp9KeZx/aT93uy0=
X-Gm-Gg: AYBFou1FnGOzq/rmpZ1iwwVgg7L0kqMEFH52GfnflmUMqTzrBsXeb8xJ6XSXMn0kg7s
	2mU+ZRT5OHcfB691DE5vSOQWe7e5VgXtEPQ/BL8BJbNbBMGv3zheWaWpbymCzGVALHMg9yhC1VI
	Ag5dPdYYhuZGHLblSoPjZHg9Sm8Rui3y/m1KtWinu+T1SmsBHECwSO1hdacU02fW7B4Bd85GhMi
	pFqegHQcw6WcS/agoKN88v3OYbJ55BDtYZCGQ4r31j9cYqOUgh++6+s1yUNfTBv3nUwFfgwM0kh
	IsOGWEnrWd+gg03wL+16SeXUwLoyrJAWM87XhsJOjeduQJzR+PejdwdaNmF/Mw3f8Li1K4RXfLk
	aYbHjb2I1OUzDPV16v6SugYXnVNbcl4UtKlLVjl/jw5Dj3FMeBGJW1j6CJbXsC2fuicR81F7cQk
	ImwOGMSm4UCd3Ro/H7/XxHJ4zc+ebf8/ktTU1AD1VuqkXo4gEN6+Qi2Rb+bB9doPqQywzc
X-Received: by 2002:a05:6a00:f04:b0:878:37e1:aa78 with SMTP id d2e1a72fcca58-87837e1abb4mr7930031b3a.58.1790008751345;
        Mon, 21 Sep 2026 09:39:11 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a95f916dsm3568909b3a.31.2026.09.21.09.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:39:10 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage
Date: Mon, 21 Sep 2026 09:38:51 -0700
Message-ID: <179000865432.4136193.2675209362900857145.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
References: <20260917-fix_tps65219-v6-1-0544b735edb8@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 17 Sep 2026 11:01:34 +0200, Kory Maincent (TI.com) wrote:
> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
> 
> With the recent TPS65219 PMIC driver fixes that properly implement the
> LOCK register handling, voltage transitions now work reliably. Increase
> the maximum voltage to 1.3515V to allow the full 1GHz OPP to be used.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am335x-bonegreen-eco: Enable 1GHz OPP by increasing vdd_mpu voltage
      commit: c3037b5c7c38bdf78c214e7dbe513a553ce8f47b

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>
