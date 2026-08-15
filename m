Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A32FD7D3
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796571; cv=none; b=p+tjruOGSRZMVLP3WzYAM2uF6pQfRdrXf+aVpw3CYV0es7fApPz6TTFAaN6dh/Eri8ibkWG7FpaEGpZvvtLifalFTmEt7FgjF9aJqx8DGBpuNWHvWg0WW9IvHRiacnCmxyKx6GHJmJG5ucgVqeREGMUrJk6lTbYNJSLIOqY4Crw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796571; c=relaxed/simple;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coX6JySYzYY1QWshM7LOLqlFsHSfdPo8ESTrsCZ9U81rWptubrwQsYitHEncxSh4E+ucTcMC8ji2i1WV9/yBj8RnlXZeu0wDzfB8SodaBcrjofwD0NW1FBuBUrrovp57Iv631lj0UVQS4RbUkAJCjnEbqzNRKyl0A3ZuFLUfOLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKIg3rtr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKIg3rtr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f611b3af9so206862f8f.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796568; x=1787401368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=gKIg3rtrZWW5ZRoDWz9ne4k5fxGJ9fn7NG48Kgsr9gWTuirbthIQd5aPR6+g7QkVsp
         R2GN0gCbJi0gg0kB/NSh7l35pdF38Gj9nmL1gQx+Nx7r2p2VuRf3cHFTQSyb5AAXc3uI
         Dx3J06vq6jSo58vyzao1ysbZ39C8uxIQAYhCTZx/SuXXUaqoaeOLD0GpYZlb56fT1/EM
         KkyYKGxconcfOL5wxL61ngWZlTMxznY5HVwVR1th6yKxMlCctS8acprTPCvyWyg4cjHr
         ZOvkDOGDEZXeviix4rn9iPItX1iZOv9Ssci9AUcavEoCcPs8fzz/E8I9Dx7lb15h+7mn
         NZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796568; x=1787401368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=AR40P2QboEirGUVv4UDg2u1nOM86nzzKCsgO/t7kcko4c9h6Ih51khTsoczV4Se/dm
         c0QjKnrDaMr3gNeyxUf5yRDWWjfvbG0SPMbS2mPyCUBAH3Dn3Ls1mbsqtJXNXyVfROHP
         h00Wnd9nQc0jqSqoe0OQwfAK50hxv9kxuhbgSQKY7EIo9KWd9bZdj+OI89NE+NG0hTrt
         ZAZbVol/RYj9S7cxgI0j/8t0UXiLBG7w/i3wnMctppsnxuaqdR22IG4juCwRsIo9FdAb
         Xr78TXc51s+grTauJ0TgkJ7RCoQn0LE8YUq1TXcz3IGWlFUmG9PQpBheEA7CqvYXcNxW
         PzdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtrs1A3m48aLlmAp2M0YqyZl28oA2xUZQLAHTsNuvxOE4+r4eC0nLK36k6a5U+GO5uCe2xwJjyMoDi@vger.kernel.org
X-Gm-Message-State: AOJu0YxhkgoPsmPC1N/xJhsZKMRcrCuQp6GkZbOlFCZNuiemsi3aKHH3
	4I5wHQQUsqz9waAmisQ5l7vXXzvZnCDxZnxRHYF34McvpYq//NzunIGp
X-Gm-Gg: AR+sD11EKTvHBWEnNBejYXNsv0FsDRa5+GrTN/fpderztfcKNpbFSSqRG7AP9cvA3kZ
	yOunngdCLeETx7kWBQeZkuE2j20JS9xcUNsLvGGonSNs7N1gEZ0gNA7I2oQMlqq9uiBsI9VXEpa
	J5RnrBPZHV6UzEcOnmYxwS8Gxwamhl3drzbyefodRpX4WIwf/dj9tBYZEtlCKoVpJiuuuMjRDx+
	N+gXENZBGKFj/6duTHezTJOQxFTUWoEWbEXUpcL5oB/nipdgnQNjC7zNjAcxkB55DMwuEm1WkPw
	bArZv7X7DH6lD1jLWrW5tyUUFbuTrkmj3OIsak4Fb5kwIZcBDvEpjv8jyWclDK6Pxr8YeyFxWOQ
	SxIMiP+pZyqjlcgnhgMHQG1goZkWERLvSX4JU+sWKv08Ib2WMN4mD2MPNsgkLV3H2h98DVgyTrd
	u16vXADMV7wgWC49rI0Yfsj6PH7w00S1CcqFV11WDeK1uNhl1iQKZ7huQFZ1YzEsiHoI9C1nfA0
	I7NLVEY4zHLcaOWpC0VcgI8w0ACBY12tscc3fi4mcDHjp0mara85/klGqGZkEQ+VAn1
X-Received: by 2002:a05:6000:2603:b0:47f:9256:52c0 with SMTP id ffacd0b85a97d-4816075e57emr8437144f8f.3.1786796568008;
        Sat, 15 Aug 2026 05:22:48 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:47 -0700 (PDT)
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
Subject: Re: [PATCH v14 28/38] phy: core: add notifier infrastructure
Date: Sat, 15 Aug 2026 14:22:31 +0200
Message-ID: <20260815122239.65405-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-28-b5ad9c68fa11@collabora.com>
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
