Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403263;
	b=xddpfAO+cmUEGVSl/anWFKZAG5alcmEgb9Mh1ghTzcP2cyAHBMoq2kGnl7FqdoitjpVA
	 +vwDFe2eIdjvlUayuelY0o7ejvUetDFgAsnIPC8vsmn49mbpzhdS1ElvqK/TY979KdCyH
	 IReOpSUgS2S2hI5T1SYr82ixu+BaRG6FUZLf2j+hwmn7h2Hyi8DfEDP2ITFsgZOcXyJ9S
	 0ZYxzSzN6oAl1VuC+m+xUhyE7M+6G5iCQGz0WRj/0zDB5z6uSTRfDAXDJwtctpD9hCuWA
	 QJGV6H6vYPFFtN2emkG2VErfwdxp04pwo1KRKb/S9RgfsO7J3y5ZQ58zxJ1HgVwm2BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403263;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=dNs2qSrMGxkRE07ZQnxznByjSuLxIQPTiim5dHCPvss=;
	b=r7uOLw/ornC0N6dahdCBaY0Cb4JDyn3VfHqWe9X8LX6WAlGguLOxEYc2AN9m8kWm6LGs
	 rghE5RxWQPgGlDkmlA4IJb3sIVZQSg2Ih1lSZapCQqJbT+bNEJ92uEgJcsjOP2lvalfrd
	 rntUQf/DoyuFu2PJmnW44l35mPiogfrb8cmNJYb0PJokDBpyLgPr+e2UOzf89IUl81xUR
	 uF+gjXJ6jrSmKh4mIl5kRcwpilEMBw6gngUM7PmbYUhEbVbuVzyDRJS9MzFhYIWR4OMzW
	 HgnTC2vV6NATcKZ1OXaWVzEM4lBEoHSfXboU9c+ejyn2Saf0z8Tt8scve5qsJ9qxmZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJMBLI0j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD656606A33E;
	Mon, 23 Nov 2026 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IJMBLI0j
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795403263;
	b=YeY233gpTVIZxGgkWT49aopcqu9JwzGv9bUoTSf8Fsesvoha2sKFgtmOzVvZUjGZ4P5B
	 AKRb6fZ5wDK8nLz50mbxJi2k7BXA/U631ipL8hP9SoRC+WdORtoy0QVB9E9/XeL1oYRkW
	 1Un2LmW2YKrQeLUVx4MwN40Dl4paMoxFdxUGnXM6ZUgYcRVxfslXla26/EdrEsrSPczt+
	 7OX4n89fK+ntG+cSob0NgVKRFgm+9AwNCuBoF31w8/2UaxOm/JA7pJVFrbm3+RprTyiQ7
	 xVsmwXjmKWOCZEdw+aKHYw/a5c0zZtPnvSqUyQWGtB0yjpSugQuw0iV/hF5icS1Tckw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795403263;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=dNs2qSrMGxkRE07ZQnxznByjSuLxIQPTiim5dHCPvss=;
	b=EqCuS5Igdx96UUZLGCxVxs6VCUStzne2/7Ia2SFcQ2dd7sGcjHkWNdFNcRj7TmY36Qml
	 CPv1ec4mc4qeq97qlnniwAaK8vx6phckma5lH61V8iE1TSAQ8Ck1FNnGzqz0hkp7rG6oA
	 fN1PsG+4HLQKKj2UanxkaLq5/0aSqTx29BqkfSMtmjtacAUEiLqjaK5Qz/frOR+W4XG/S
	 HMQvAFjA5gJxikmesYvVXECnlKNbeP4ceiJPkrgphCWz2JYU9HjBxmdnxHiyl55Tk78mR
	 v3u+J3InxV0QQXrLdRFkouy6SiCHjV+Jk5Ra8c1BfYqDHhJvd45ScPoe/fYL01xWicg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79EB31F000EF;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795403263;
	bh=dNs2qSrMGxkRE07ZQnxznByjSuLxIQPTiim5dHCPvss=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IJMBLI0jXk0tdU+xglrItiGEudz9tk8cGIbpCj5qCuk+gQmoQvf6ReFip9N3mSa0t
	 1p6/cIgipT3lusu8LJQHcrVJQuSUshzTR60Ea5boht6tDh2VG8xZuWmAyh2MHue/UV
	 I++qajKy8V03Iu9gVsEz3hLPowAuclWy/WwvjcfiK4c0WhTnnLJkFhBbzOmtlWrd07
	 S+p4mCUys5QHhi3bnAK8NlD42P8Oa+G9uuf//mMQV9vabZtfxUwbm5oxJUZCjff2jY
	 s4rkERl4r6hdBMkj6c/KMBvfaVJ6glSRnb7hX0SrraQVp/gqo4+xshyZNBxrhK90OY
	 CrQRJ13jJ/a4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A4D34C300;
	Mon, 23 Nov 2026 03:07:33 +0000 (UTC)
From: Cunhao Lu via B4 Relay <devnull+1579567540.qq.com@kernel.org>
Subject: [PATCH net-next v5 0/2] net: stmmac: Add RK3572 support
Date: Mon, 23 Nov 2026 11:07:26 +0800
Message-Id: <20261123-add-board-ok3572-c-net-v5-0-8ec9012b578f@qq.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO6tA2sC/33OzW7CMAwH8FdBOc9Tms+GE+8x7ZAm7ghoDSRdx
 IT67kuzAyCN+WbZ/599JRlTwEy2mytJWEIOcaqNfNkQt7fTB0LwtSeMMtXVAus9DNEmD/HIpWb
 gYMIZhBey77WTWo6khk8Jx3Bp8BtZFya8zOT9d5K/hgO6eXXX3X3Ic0zf7YfStUQ7Rxn761zpg
 AId6Oh7aXmHuDufX138bHpht/w/7xZWDU6FUIobYTR9MPi9oZ4avBrWSD16543T9sEQ94Z+aoh
 qCDTeSmW4kTdjWZYfiACvxp0BAAA=
X-Change-ID: 20261111-add-board-ok3572-c-net-4d45887c575f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Wu <david.wu@rock-chips.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Cunhao Lu <1579567540@qq.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795403251; l=3451;
 i=1579567540@qq.com; s=20261015; h=from:subject:message-id;
 bh=UQHhwyG8zWauqY5P2aorWqinvFSQAZjeHBKDkCTUZls=;
 b=4p5/XmAiy4B5S2XOLaZSZ6dvkIZkf8L7VTVD8C7u+9o1yDDjiViLRYcVEj1/mkwoDeT2jgZTl
 IroqlK170z6ACyvkbYOwq/FbjVvtEQ5AgXIXE1wyvjR9KB3TpvT2GMk
X-Developer-Key: i=1579567540@qq.com; a=ed25519;
 pk=sUTWrzlIwT4C7ctjNfVZAzzg0G7QUn2XxRGpYsw4RtM=
X-Endpoint-Received: by B4 Relay for 1579567540@qq.com/20261015 with
 auth_id=1177
X-Original-From: Cunhao Lu <1579567540@qq.com>
Reply-To: 1579567540@qq.com

This is one of the subsystem submissions for RK3572 support.

This series adds the RK3572 GMAC bindings and support for both Ethernet
controllers in the Rockchip stmmac glue driver. It provides RGMII and
RMII mode and clock control, with MAC RGMII delays disabled.

The RK3572 SoC has eight CPU cores: two Cortex-A73 cores and six
Cortex-A53 cores. It also integrates an Arm Mali-G310V2 MC1 GPU.
The OK3572-C board provides two Gigabit Ethernet ports, three USB3 Type-A
ports, a Type-C dual-role port, eMMC, microSD, and UART.

Testing was performed with Debian 13 minimal and Linux 7.3 on the
OK3572-C with the FET3572-C module.

Passed functionality:

- Both Ethernet ports obtain IPv4 addresses and pass bidirectional file
  transfers.

Stability:

- Ethernet error and drop counters do not increase during bidirectional
  network tests.

AI assistance:

- Codex / DeepSeek V4.1 Flash were used for:
  - Reviewing and adjusting code style to follow community conventions
  - Automating tests
  - Collecting data

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
Changes in v5:
- Rebase onto the latest net-next/main and resolve conflicts.
- Use skip_rgmii_delay_props to control tx_delay and rx_delay parsing.
- Link to v4:
  https://patch.msgid.link/20261117-add-board-ok3572-c-net-v4-0-4e9da569395a@qq.com

Changes in v4:
- Skip legacy delay properties and disable MAC RGMII delays on RK3572.
- Link to v3:
  https://patch.msgid.link/20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com

Changes in v3:
- Deprecate tx_delay and rx_delay and disallow them for RK3572.
- Link to v2:
  https://patch.msgid.link/20261111-add-board-ok3572-c-net-v2-0-304466394970@qq.com

Changes in v2:
- Split the original RK3572 support series by subsystem.
- Add rockchip,rk3572-gmac to the shared Synopsys compatible list in
  snps,dwmac.yaml.
- Link to v1:
  https://patch.msgid.link/20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com

---
Raw dmesg: see the v1 cover letter.

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: David Wu <david.wu@rock-chips.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>
To: Jose Abreu <joabreu@synopsys.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com

---
Cunhao Lu (2):
      dt-bindings: net: rockchip-dwmac: Add RK3572
      net: stmmac: dwmac-rk: Add RK3572 support

 .../devicetree/bindings/net/rockchip-dwmac.yaml    | 15 +++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 75 ++++++++++++++++++++--
 3 files changed, 87 insertions(+), 4 deletions(-)
---
base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
change-id: 20261111-add-board-ok3572-c-net-4d45887c575f

Best regards,
--  
Cunhao Lu <1579567540@qq.com>


