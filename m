Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12423E95B1
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796579; cv=none; b=tQVILc3vsZRstDXRnG1XjxalAXxQV9fTFwaYs/squrg6+2ggdY+rop6GoBFo/We/4s0Ned2xVeIMGWTmuZiGBoIH0sU9NZrcyd5GYnERMJEUcryAi9yo2GKcKtKJYsLQVm87sfOf3D4rgfdh99GCVnNpeZ7JbNSEIgEnWfV4RtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796579; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ML1MHg6lM8yd7WkYMMkZbN//zh2ItBH8GUkya8+XjmQyR77gxmcLefqrbac7ee3PUL2KIVRWs8T4hqFioWCdgBaprLhCzsm+SvGOdLGkLfllq6Lz23YXqZvZACwCf74d04EZ4n1pgIpHfdJbbxwAnnr5x73D1AG6NaLJPtM5hec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q68rHxKx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q68rHxKx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c2ae992beso116722f8f.2
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796573; x=1787401373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=q68rHxKxtVWzJK5/I7RRg35bWMnrD0/s4kHf8HavyAUF1Umpf8AqjWXLsCjx2ifuwq
         R4eESMysdPpFksQOeFcvePBvHBomU7bQh/D/J7mHyARTpqLqevZjS9vYNs2QJl51VvKq
         2U2vLkmzZVKScTyTaVydaHtjpKOHldpndZHx3Vg9ObkXJfOMeRGhmam0NzpbaGX8g8rH
         97Y+T8Fgmp5/HwCOhZbLBUIUS/JXaOJgGCSbR2P5bEmTLXX9F5rdAfGV3U5iK4+MrxC6
         AbTCEs/zhtuh1oK/H5A5YGPx4CH5yfeYZj2FR0unOQ55U0cryUhsR9yXtSuslHwyIvjV
         EToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796573; x=1787401373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=MPBmYR8TEfJIGdGvGPhKCGMqQHvOsIqGhNaV5L9jzR/X8pjB16ac1ntQW5bAcYCR/P
         3oVHhujA4jYMe7lDN8/oKv/vRMDP6IYfuOFooImfGtBVY2XqnVzg4/x1tuQm9WtZluF3
         Vj9PJD0rXRAqF+qe8eZyzEYtrwhPStFrc1t51/6ihp+Z8MRzGjohXSNOS8o/BV/9FHfu
         4YxXQc+3DjvekFN6lz82/p2EIER6wmE5/CQb7GOoirL5X6dBgRg9XHKWiWAiX7h3EPl0
         M52xfLG7O2cY5c1PZTZj50COnTy1exg+5nZDi0b1+DyFZ8271ENV/qDjczAwbVX4kFN/
         MW8A==
X-Forwarded-Encrypted: i=1; AHgh+RrPj9U7rOM7URocFYH8Cqd7XMQLkdlPfcJwbeeYz3k116ytcx2cZkKAfYMXc+xTHMGgqjSvb/mmQQgk@vger.kernel.org
X-Gm-Message-State: AOJu0YyeBakDJS2xFBKAXnFjHj7nEPCNGSrvwxxDHBBcWsX83CLCLSns
	AoYAqMGvhULJFM/3lztbXl7rBwJr5hHH99gTgghYxkcGhzDR5PcAD8EG
X-Gm-Gg: AR+sD10OmYz2zli1LaualqrPsTtYRsFSvFzcZwro/xvFlCXQmmccEN9uyv76GLrMLIo
	l8iASUZ48/Yjk4XnPDBLSA/9zlO2xZGTJOZvDS9OXA0G7n6HlvJHjvSJ515me90SZrCVvqbIT1x
	rZMQqdh47oqs5DvdjcaHOyUVWxYtrGpw3vImHAtcWOmAO3g19pmnpLJsySlS2JplYP+Ss5Uvtu+
	cQjUztHcAfa4VRpxNn+IVbil2utEesc2gOoz0nb4BDgrR1yurYElSp4OWI9Fks1HaD+R+CV/rR1
	iNvIMqyfdmY7UecfPhV3oswsHeOeOmdyeJvkhtcFoqRwep3f5NutkSilV2pb3CldpwBpfiUJwI9
	QVVF8LYR2XVyQD+iEt2s9IXD5M3B6GHwPyGLGjJ34RLhkKHCmnwU4S6xYYdASgZOfVlfNVaKAYa
	IZrjCIBnS/ZzviA8gqlgOaORHnAdBvXlHYaCRphxyO9Gfy4MyObEkZIdcZuYm2B6K+wZ42O74i/
	lWMtAqjl8TTdQ2HZ2q0thkXbbGTkiCWGEALi2cY8yfokR2L62rs7drMMDYcqzRHr7/pxA==
X-Received: by 2002:a05:6000:2585:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-481607738d1mr8826047f8f.2.1786796573266;
        Sat, 15 Aug 2026 05:22:53 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:52 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset notifications
Date: Sat, 15 Aug 2026 14:22:34 +0200
Message-ID: <20260815122239.65405-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
