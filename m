Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=djESI7093SOCO+xVOnhqpx9CS52rFQMvws041ntYR996NkMqp8tUG6gdscR2iYunpnEo
	 fKr7pG4Rwul9dKMVNJnw0GHSNDKgYP74+l2XvihIbXbpYCBXMWwu5VpjTgLJ7/IMx3vG8
	 IPqYkOQbRqG/bHf/UIxzxsIUIxTQttfL5Du1CCiB+kip3gGwabhFUK3gld0I2PdKtxEjv
	 86kSSwR+M44zFCBy7VqFk7weHhcJ30lqk+oaBvTokI7plJSX4OU7eNgAM4rFlr+0gIStl
	 f3NMKocp217pjPtFh46wKrvJsnKeJbgqXdfq1w52PFcuf/MdsRDkX9aDDfOEH/vR3UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
	b=sGqf28/OU+VJ0EY3ZSeo2H4i9vmc6FhHMhG6HBxMwFcSXcxwsUl/jT8oj9NI/IbwXpL7
	 QOXDoGOJ173T6+cRfMb1reazdaAbbZX0FjglqjOEIZe6fG0eZep1Uw53gH1Q/cfuOPoHT
	 IIp6sR/Y3vGo+/ECFNf6C+MStawM1o83rDfK9SvxtYOlGQ+9+I3yU/DfsdmHeMQysWm7k
	 jULbRE91uYpnM5pS6ri2UmONy6ojK2EPRIci5UHu/DQ4ksuONbdKXLbG/wL1da7I7QmYI
	 a84bp3tLCwqnFQowdnJa5axdX0ykbOgTgYLpmf7wrC0DXdyxwGnyONSncuc0tKXY9Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SWuIHq/E";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1957606A32C
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1957606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SWuIHq/E
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16907505e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762712; x=1795367512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=SWuIHq/EFwUbWvv1PS+fH1cvpCjDMSLsTxs0uozhavLibz+Ot6uHmHNrlpkM4+UpFR
         z78q55Gf5zn56ECPTn5/4d5qlqC4Qoc2VjqX3NZR4Vm1KxXYjpojV/plB2tkANCzJzVr
         flpIfqay9VIhospYpLFn9JvNX3bqPLYDyJXHO2W/nFyuUC3lgkjyjKal0xrPn0lRpSzw
         IonbN+N89UZK6eNR7HYPyoLXiDR+flbRm9j83Kt7jS7gquOdFR5kOiRH9xFLjOcUDUcH
         SS6qFzsVhpS9L1jRafrUCkFLWm/sRhkMwTu60gANgjzOO46X1d/bWCekqcSXxUYWOcfo
         lysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=J+FxY7q5QUpN/BMdOyrLWPvUtM2QuVUYh3hgW/KU/QgJwa65mdRrAIiupIfJ4duQEG
         A72zh4QhQB9qawASYsU01MzjdAEqJFMx4hei0liFZRkYHTYHYrAm4nrk7yphWg6tdOby
         gN6B8g0IohKLhvn0bG52dROZBhBalf1093/exQ1MLZ6g/eAI8rpKxGe/pJ6+MjxQG4Qi
         EzDfsDFv4eEIEu4Wup384sI39ss7OJDp7rcnmhe+9A3lXoOlXewm9oAJqz6eYTizk0V8
         ChddT/2ZZWX3yWuANGp4yj6W5O5jjHkcIzqawqScGB66n6513IRCcOEeI6rG0YMaiB9Z
         OVgg==
X-Forwarded-Encrypted: i=1; AL+hErFbLSeC+Aaz3HZ+VvCIyjjZaZTlEsuP+Ic+RgxcCIOE9DZOfdt35u1+MRm9iWJ6551r41bpvOUe1qXc@vger.kernel.org
X-Gm-Message-State: APuU4Z+9H7gM0xiwJigsTo8qPyol0bugKtYgb4YRlFzfFg10CY1DaR8l
	xuTQs6tWKfObQUIkVTjrpfssRmGajg/Rr1W/H9AJLBizPyrDLWQ8ew0uHPwApqKX
X-Gm-Gg: AYBFou2zWE0azCfIlTW/92wCl9Sko7U4X42dLZBEK9487VvJa7bLQhMRwwVadny3jKY
	W9c3tDl1IqkM5kPcAmTYSf4MppiLpc7wSeL/lW/QR8WHEqa1p0r1JCFiod/6XBRDtIJNp4bB6dU
	fxyfM63TxrsRVvoTPp5L1aA3h/ww337SB+gkL/OEBAhBcWmx7lbgKwkm0vWR27rVJajYpEY+nTi
	ptEL+i6eYMQNhTlfW1eXtL/8uDxW4kiXtowTKnppxYBb30TgDSR2oTmS/zSzs8XQNBnpZc2X9Sp
	hvNlPkC6ST8dGl2R4HZK2Cxv+00amU9fVY94vQmlmftMcNDVkATfywTouuDaDlWOajIo4iIZZ6h
	dZNBgrhJWK/2MnMM/mwy6s+rTS1ox7lHAY8uCNqWseZsJGOuVXAikJKP4z1m8XNOByNLqWcq9a3
	ldotZJCg6xFFtvpyIz9RjfvHrd/j+6Htx5+RXyiZp1xMV/p0Hra+H9ewWAo0wk03TWRnZ3ObwIM
	WGYwqiUwuJszIRsMSGlC3NKjg1ZdiNShxDCM3I9vTwmo5y/lBNy83VzNXDiF1IE4+CYI10wgfvX
	7HRA/fQDRYnE92dhE2FY4dKnvvMyqmuKiqXqY9vJjK34mNDNtyLvZ65UwXjgTP1acZRb2t/mIMD
	9m6x6YgbWWl6FuW4xy+1qMUbsb6HZT114l+R5H+YK1Oe6fKJ7SlywHCi/GP5Aw6NE+lI2K1D3fW
	0YOHVkpuGvQeaFyF75NGKqBupNITFg76eQEwlKjYQ0O+zor0pSsp4vl3To+hvYJiHRHsyt19IRH
	vxqDtTsOj7Rhg==
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr101003735e9.3.1794762712078;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Sun, 15 Nov 2026 18:11:46 +0100
Message-ID: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The AC200 MFD and Ethernet PHY drivers and their bindings were merged
in v7.4-rc1. This series adds the device tree parts needed to use them
on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
Ethernet port goes through the PHY in the AC200 co-packaged with the
H6.

Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
from PWM1, the RMII pins and the EPHY calibration value in the SID.
Everything stays disabled.

Patch 2 enables Ethernet on the Tanix boards.

Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
direction, and the link comes up both after cold boots with no
Ethernet initialisation in U-Boot and after U-Boot has used it. The
TX6 mini shares the same dtsi and was not tested separately.

The arm64 defconfig does not enable CONFIG_MFD_AC200 and
CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.

Best regards,
Jernej

Jernej Skrabec (2):
  arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
  arm64: dts: allwinner: tanix: Enable Ethernet

 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
 2 files changed, 93 insertions(+)

-- 
2.43.0

