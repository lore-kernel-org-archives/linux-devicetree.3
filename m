Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5237C0F0
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615911; cv=none; b=eFaBZWbvIJHtxatNbX1Xl0LCnZEKgwX3h++PqTiNrYdckLX6azbUYZuAQFwj+iqJ+BswXGot9uXEnKKJgiu0bp7VkLjgW+3ToYMDhqUHsvq9f8uLilEoB0rwWweHcCK2BeCmK3HcI+TOcUEGQ0QztTWTTJmrnvLMA9WBouA/UtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615911; c=relaxed/simple;
	bh=s/mTlAGn0bObuTqVrR8xDe8Fg6yt56YXK2In/CNgXbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DgJRBXkS9j3v3KPQSR4udLDIjhkH8N0oQr708DOqYGuLw6DdpuSiVaAB0uEBCB7trJx3aSschKpBrUWtGkHHHidNDA3fPCGQ0bf0rvEZFBvV7p45/uBxn/ZvZSTzKzbjCiu+wqPluco9KdQw5o4mB2iJOc93/S798FLw1sofzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=wTolbVbD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="wTolbVbD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so16549795e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615906; x=1791220706; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/FtP8QfYvdqSZuTV1DgfaQnem0vOH6RafKPHcaYLj5g=;
        b=wTolbVbDtYhpCce6IK6o1dCqVffCVCP9blXXWdTzQSusspLs8slyjpb4aTwE2ncgHW
         S19mvCSEIC24BtYENhYqO+/CdCMxK81DqMA4z6d0I6Yrkd/mo/mn1+6ESjjg/ffh7YDy
         OE4OXIetK3M/CQXcNLLQCzY2CCDZK6bfrTR66sBsv2Kat6mOGeNHdm8saJADYP8074ci
         cRsX+2jVoXFe8TfOHZT48Jxmmim1OBYuM0fzsuHQTvKv7l2nPzmY4A+KjSvaPEO25Hwm
         TbmBo7rs98RB3wmoLlcRphX+i11DxCfDnHPuMtShVq2MkF6K24wkSEcGs6AWoCpvj4wK
         kNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615906; x=1791220706;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/FtP8QfYvdqSZuTV1DgfaQnem0vOH6RafKPHcaYLj5g=;
        b=cBnadRXH80eoxN6hgo4JziskecR92n7rmUSIbovxQWcFpZQ+YlF5Pl42P2KmGqqptI
         7IJDiH7QOSaQ0hVN6MyApwQ0djZnX14+JnZA+HbxAEpduTC3ItC9Vg94270fHfPah93b
         qzS5ECHMfPZhg9Uz3I/hBzo6ep5XVCYXmlJ3ig4q+Kqh8wa9VKVVjaRQRkAwE0G3fVen
         aPthkKTXS1InUOlKRXcoG575QhSCZhQr7lPky42Jwui523jqBl/Ubz8JutkFnHSSZhxb
         2uK47/cam/us5wmgcHMWfbDrPje0NWgndH6EvV1Jjy/G29PkUfc3kMZQNTZWiDTiEJeo
         YtnA==
X-Gm-Message-State: AFuF++lGkLqrvTyoyAeMINch48rMBnWyaFv+GmjvR2QWVNBBdMryk1E5
	qVHvCr/b123jVEdpDpRskE5C61wktn/FlxHJbqZzD1W7EnPwyrh2IKFtcf6sXdMv/TkxLPLas53
	XWoub
X-Gm-Gg: AYBFou0dbQS7LrWYXjTpOmyUA47LanSQd8U/4nzHsUxuaF1K0mxH51D3h3qgZr4jhET
	j+DwavSERQQF6M11WrfkqGIES/eUZ40Pht5tlmRax5Urx8CMynb3ja2mqdsJiMej4F3O4F+cMrn
	EPMV9j/kY+Fp8eIxGn2sw0UEcu3ZNQFwwriDkwsU3Lk3cOrwRBdGSpHCsgCcppvECabJhu/jzDm
	PuSAgdzb3YzbVkh8ltHfugb8H9zXC9oqexPWAnoVr0H6hgIUYJXG60BbB9Q6+2lO+aatitRgcBS
	WCxXPan1GgN+ysGAzq/lanQ/UWQ2arMxsId8IalCw7OpkqyxURIoXo3Jixg2mQWlMiUOn2b9Sub
	nju4WWpbzPzhGiXpkO5SSqFC6YfR1UILApDqJPgVVkev5wP6bW5S/VVYrpbGuAryYUpUkE9Hyv4
	CT/WDCz+pTiKFwwihtnr0VXA/9533K84h17SgFy3/iJEpXlipOSIQVn6GpfbSldo37jj35XfPd9
	Aherr9haBJ7w0ue
X-Received: by 2002:a05:600c:1d1c:b0:49f:bd3c:bc28 with SMTP id 5b1f17b1804b1-49fe6712809mr247163255e9.35.1790615905740;
        Mon, 28 Sep 2026 10:18:25 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:25 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/5] power: reset: syscon-reboot-mode: Add support for
 Rockchip RK3576 reboot modes
Date: Mon, 28 Sep 2026 21:18:15 +0400
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJbSuCVzEuKP3R0UjJFA0J4
 e5WXX6L91bKUEGmU7WS4i1Z0liw31XU37rxCpZYTNbY2rS24eBZH+5wrFkRUpr5mSI4usZ4uDY
 OxlNpJ8Ugy+97vvydX+GOfv7OaNs+19H5QHkAAAA=
X-Change-ID: 20260928-b4-rk3576-reboot-mode-d3804e39df04
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1836; i=alchark@flipper.net;
 h=from:subject:message-id; bh=s/mTlAGn0bObuTqVrR8xDe8Fg6yt56YXK2In/CNgXbE=;
 b=kA0DAAoWsqLYjxBZ1KUByyZiAGq6oV6iNH/VmmFzlQ1hQhAYxvpamHsdpOIQq94PE4kcQtNIB
 IiRBAAWCgA5FiEEnfakPZUyDpq6SEj1sqLYjxBZ1KUFAmq6oV4bFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMywyAAoJELKi2I8QWdSlvdkA+wRRO3lgERV5W1lHYPI+DQvpFJPuu/7czqqt6XFZwTG
 PAQDw9MHAy9l+53NYrKPFyIz2M01jBJjFuVhK7mB7r8c2Bw==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip RK3576 supports reboots with a specified boot device priority
mode, allowing one to override the board-defined strapping config and the
OTP programmed priority setting.

Supporting it requires several changes though:
- The boot mode request needs to be forwarded via TF-A to the boot ROM
  (upstream since TF-A commit 2a97ba20e901 ("feat(rk3576): forward any
  boot ROM boot mode request on reset"))
- Some power supplies need to be kept active across the reboot to prevent
  early boot code from running into a synchronous abort
- The magic values for each of the supported boot modes need to be defined
  for the OS to use

This series enables the above with the RK3576 EVB1 board as the example
user. Other boards will likely need a close to identical change to make
use of this functionality, but need testing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (5):
      dt-bindings: soc: rockchip: add boot ROM download boot mode
      dt-bindings: power: reset: syscon-reboot-mode: allow supplies
      power: reset: syscon-reboot-mode: enable supplies for the next stage
      arm64: dts: rockchip: add reboot-mode node to RK3576
      arm64: dts: rockchip: name the reboot mode supplies on RK3576 EVB1

 .../bindings/power/reset/syscon-reboot-mode.yaml   |  8 +++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 16 +++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 36 ++++++++++++++++++++
 drivers/power/reset/syscon-reboot-mode.c           | 39 ++++++++++++++++++++++
 include/dt-bindings/soc/rockchip,boot-mode.h       |  2 ++
 5 files changed, 101 insertions(+)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-b4-rk3576-reboot-mode-d3804e39df04

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

