Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BA342CB2
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786182341; cv=none; b=MhMIjTvQPxxjg6E7UGb10fvWOebztGXMGAXDxe3W8nCkx9j6HUvtQG0bYr44Je79sVXEL0lhLKTFjL8kIgjupv1U5GdnTCWtoTrEAX0rxTHXmcm/NmZ7sOuyKVlBVnFVH5BR1taWkjdLX9TYGe9+0BOfA5J0UVeN6yJe4dR/s5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786182341; c=relaxed/simple;
	bh=vHBCWX3GxVPZ1VL8oCPRLa0fRE+7Pjxzf2banjKJJRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlRFdQNhOtBBZ1OeaBcgyx/M3GAdeQSZghQMAjgwtT0r+FdyCsepdm8uFTop66KFhWdCB+bR0aDDr9Ja2CNx7yoJ1qDmAEHOxd1YVnxDmTQ9ugRBXh0S7d2+0xQr+03mTco5NteSmeXBAeb7uC+lCuMiBZqjZej3uIRIRfwzEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAAXB3gk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAAXB3gk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fe76491b8so17552f8f.0
        for <devicetree@vger.kernel.org>; Sat, 08 Aug 2026 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786182338; x=1786787138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=nAAXB3gk+6S7/47Itmm2n6FD/RkAAhSOtFfXmu4ZyV9Hm2cKi2YPdmrt1fgudNauM0
         lw/w1Ob8hXdJi1GBsYclNHmfgk7VmLoi7arl0nvsz3Be+obBca86P1V1ME+KBs0o090B
         ntJ9fA4ZTPH+p94EWC8BgeCWq8oey8Mem4U4Js6xKAkQPkHZw5jAGFFC3eFEFhJ6p/kK
         RicykpDNFp84wvv17NtBiU4BVO4RwD80mQVGrY8wK66Evd9oQcr5ceC1QInLnVpOTGEd
         gAiITMj9LNFaz5u5UXVUY5jutzUAa86c9WhKAxAwhan1/Gjik69BjwFOos6/rtRwU3p4
         9OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786182338; x=1786787138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7MAb3Uu0LO6yvv+qCiCK5kQU9lkaEhyw4ok7BL0cqY=;
        b=pAM8DTsVOj3WiipnxDcoPosBGCecdso8FetWKipqd+T1NzA9ayZ70gIzfbzzsyGmne
         RIhci88js/gHpriFpfKiBC5uQtq7fi17nz/sSl+TJdNPJpH7aKIt3crDLCfZje87aIOD
         cc+w2lDiGrB7gHI1Vy2unqo/IW1oNQREcu+mukMYxdBwAAPN+IPylqlVbRQkNXLvhjCk
         MOYVMEmsxCLyt+09tBFVX9sGCUYu5W9Q3/1ioKecIMBlWcSmvdaamMh3KWb4sfCjCKIh
         wQY7jVyrN7tB1Q4R5AokHyyOmOhKOZKVCHND5v3+spekTU2UZ5GA/OnZym9xXoVWS5tV
         EtBA==
X-Forwarded-Encrypted: i=1; AHgh+RrGgdtW8LJfkw7iL6TEjwuurIzek2SuJasY/KhgOlzqa370zvgBWz0G9JLV97xYeUQtfhU8jFYRiqKK@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwG5Kky99ycAUrkkpb4LC/cRJdmgRMEfIN4/FkN6Oc7UXfKhq
	eiBZ9hqZgh7Ght7HWW8enf66yUqMCyDx9dFlZd/evR7cjPChzWgUfq8q
X-Gm-Gg: AR+sD13coon6cGUDB8Cx0mzQbMjAIOhHnRuL3yL0+zQg0/JIClBffMbBeZyzT4aVui1
	jMiaEOJgKZ/Tf+CW57LMNimDdPDW1GHL+OPVJK1jPo/WUI9Z72wCiKwM9UcGlRIboW7CMoJplL7
	1BWatqn0UntghZcp9bx2y7bwwVT338VHe9YqrZHTCaSELhbWdQSO+tTXVZ9or19NHK1n/JcgkYx
	XOkBjooSaeFDxs0E5r6XiakEgaMfz/XxYSyGVr38ssjODrg9aJyGe6YBGPpQbZQm67HRTJRq5/d
	EgDoiq7PkNxu2wZlWvalQcUgWh+eqID8hcwMDRYd6yQ0fDMwq/mVSAGElXr7gjmuQ/PkPiGB64K
	eibyGvjCtjYyQ3zPqhy8dv+C9VmNqVl/kmOr+WPlqoVIWBUBUlnX4fcoVcHP/yHetyxYs2j9YVS
	jquelUti8Z/apP/V0953LY/mGL2n+pOIV3PqHnOXevEblpzZUQSuUCQG4Trh/2oLw94HjY2x1qr
	bzHNraBXqUYor+lZVIu76PVGdeMGVgikqM9vkF+PzqZZPiSpDZa11rNDEnyKw53mkJz1w==
X-Received: by 2002:a05:6000:290a:b0:47f:7526:5a0 with SMTP id ffacd0b85a97d-47fec47628bmr22114967f8f.0.1786182338193;
        Sat, 08 Aug 2026 02:45:38 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002145966sm12913518f8f.5.2026.08.08.02.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 02:45:37 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	William Wu <william.wu@rock-chips.com>
Subject: Re: [PATCH v13 00/35] phy: rockchip: usbdp: Clean up the mess
Date: Sat,  8 Aug 2026 11:45:18 +0200
Message-ID: <20260808094519.8417-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

The Tested-by tag is at the bottom.  It comes from the same test run
as my reply to the dw-dp v11 cover letter: Orange Pi 5 Plus (RK3588),
drm-misc-next of 2026-08-07, this series and dw-dp v11 on top, plus a
local board DT patch that enables DP Alt Mode on the USB-C connector.
All 35 patches applied without conflicts.

Scope, so that the tag is not read too widely: I exercised the
DisplayPort AltMode path only.  Modes up to 2560x1440@144 are clean at
the stock VOP2 ACLK rate, and 3840x2160@120 works once that clock is
raised - a VOP2 limitation unrelated to this series, which I have
reported in a separate thread.  I did not stress-test USB3 host or
device mode, and I did not run repeated hotplug cycles.

Patch 16/35 ("phy: rockchip: usbdp: Register DP aux bridge") is what
makes dw-dp probe at all on this board; without it the whole rockchip
display subsystem stays down, HDMI outputs included.  The details are
in the dw-dp v11 thread rather than here.

Thanks for the series.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
