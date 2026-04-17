Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31FA2989BC
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776438718; cv=none; b=EpHSSyps8bKaUbPwGrdS+IvO8MGe9sj6q3hJIKn3jsoAWTyvbIyBQzmvNhMBpj3Q/+lmjQ2IpzlArv92E1qfpmE5cxKW7JDtKeKOoaiNpAPmjMTCxCAH5LdI8k35+yd5ve9R7ug3RAqM04jRskc7LDFsXBHZzX6TOfVhe73mhY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776438718; c=relaxed/simple;
	bh=eG6IXyh4y0jftfvJQuYeuV3rZuFLFef4kpCOHmG+mBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNtBLgYXwiJiAs1qnJpfYicetPenqkCCP4+c4eKKFzEJ5QxDsVW2o60zMd4Kin+a4GKYC0sUgIuIK4DnZ9dCLgThFSN58Qlt+hJX0ZB0Sp9B4XUWtFb1g5EfSuvc1P3nSzp4GhrUe2HxhjtUVPjkwNVDOaMuFZEq2gIoIeuBgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=QkxLvHVx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="QkxLvHVx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f60944so592794f8f.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438715; x=1777043515; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=QkxLvHVxW2Z+SHbiI0NK7acDx14gZVT5ucGVy81JqXKA3lIFWUUwTf6MN540dn+nqX
         81LwSVZpZuQgVWuMMmpsavd06WghCRFDw8AP2/WHNTtwrPrJnDNxBM7WGoh6uVVYwJt2
         ENCY3pfshDEOHCGEAN5AZBOk9uvE/CIVNkyzkV4ayUiNdLErUUhOcx2Sd6F7sDDqhdk5
         f9SkFC55mR6J8CcqjA94ElgPM/3qaaeFpLCm+HG1tvRqtV8Y/8FI2jISWpx/54Ci4DsG
         mqOR+aTWuRCNvIYgXtrQMbBlf9cPyDLrE5bEigKIVpIuhPmknaudhccPFkp9QBE+79iG
         jeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438715; x=1777043515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQg7mK9oWEfVQ2/f5M3NYZgfP1n9UD9hwZDhumEKaq0=;
        b=A/2dcQ5VJlknEYX/8f6LUIVpc+gq/XGo6MA3JOt06Db16Xaql0UUIcywTaApN25+6W
         Yqa5MSypN4UG7rglU4Ep1LYjb61DeMDjK1EUODbHds9WcJEVneVVmjLesR5lAQtujp+Y
         DJMYgAOgzBOugeHrAOrWoF8t3aFRj2R1R0yMzZnxC6aWb3j+qREX9ZfBqH0nkfZmmsJc
         ULKM801Yjr1PFHWPz0pLRzbO3NSONmvg3GVpwx7Luko32XiI881OM0k2yrnGYSjLxr5C
         aIlIlWglA5chVY/YdxT4fRg2fjwee1X4+Bw/lZWduiDBO/d16oJ6bmuinrUCt6PbEGkE
         Jt0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/EyCymWp84DLGYZgdu9wF8hk/QwB2kfsHorXksa6Wkry4BELmGv+TmZFjOYBY6G+B9s0cgt9x5enc+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nhw1wNinh3sWy1b4AGGCKd4ojbIl0IAxLJIyKAFkpKct/c2/
	7hayvlhAnsguvOSb0ZbxGeHauflxp9MB7S8EnA5vndkUd7wb87yC/BJLGkKKq4prqtw=
X-Gm-Gg: AeBDiescJZsltcPdAJOldcmnPtLLyTsa0mUGQStf9hoLqxpTDe+frA2yKgFYKSRuaeV
	vAZqyePAmIdm4B1VDbCaYAtqJESK8yOxTq8Adwv5Qrp1H8jPA1x7zNvCwkPJh+3xIz+qh1iIiiP
	VFtcJBGtAuYxKLMWV0Xjh7G2aUVt4XbkUGj7FHKuvmnjwkBQ5Z53rKMVWP0RDBVGQMb3wdIpkiP
	J9MX473XZ4Ech1k/ADlWMQGspLuIazjPuupvsxyoLKDOqAUfTJ5UG9HhsFStMlTJljNS4dqfFws
	pJm1PXfQbZhovwsRDBNIlRDqLp8aqf19/RqiPiiwrMRHFb6voMw3x4V+kZOUKR9AemsKpIjs6DR
	jtUdOfcxsTJox9ukQYt85VN8JCb8p58pWP71/VS+iyC85mssS7lUFIs9hC6FkHBncHAB70WW9Bv
	Poids/VVAiFDevr3A4SWhwUWmSGN6HIW/jvX51bAKViga8domLNI8ZoM7pQaiD5PDdTsX1CYuan
	BKQpbts4wlQNA71
X-Received: by 2002:a05:6000:25c6:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-43fe3e0d44emr5071076f8f.29.1776438714844;
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:11:54 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Date: Fri, 17 Apr 2026 19:11:43 +0400
Message-Id: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK9N4mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3aJsY1NzM92U5JxsXZNkS9OkpCQzc1MLQyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AIDnryliAAAA
X-Change-ID: 20260417-rk3576-dclk-4c95bbb67581
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5622; i=alchark@flipper.net;
 h=from:subject:message-id; bh=eG6IXyh4y0jftfvJQuYeuV3rZuFLFef4kpCOHmG+mBg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2WWV9R/clycvGR0/uPTWCN3dJ9VT99gcTL/Hd5f
 GmKaUv4OiayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq9xmMDGuFlPK4MlSmfOu6l9yp8VWFYYnYIr53Sd8+n/vLFHqtfTsjw/UZxlM
 2PbvjOunWdh5h59QtF+ewbtocl+W88rtRnJeeISsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Dear all,

Need the help of the collective wisdom of the community.

The problem I'm trying to solve is reliably obtaining the exact pixel
clock for arbitrary display modes supported by the RK3576 SoC.

Rockchip RK3576 has three display output processors VP0~VP2, each
supporting different ranges of display modes, roughly as follows:
- VP0: 4K 120Hz
- VP1: 2.5k 60Hz
- VP2: 1080p 60Hz

Each one obviously needs a pixel clock. The required frequencies for the
pixel clocks vary greatly depending on the display mode, and need to be
matched within a tight tolerance, or else many displays will refuse to
work. E.g. the preferred (maximum) display mode out of VP1 is particularly
awkward, because it requires a pixel clock of 248.88 MHz, which cannot
be obtained using integer dividers from its default clock source (GPLL
at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
outside the tolerance of e.g. DP specification, resulting in a blank
screen on most displays by default.

The clock sources are of course configurable, in particular there are muxes
connected to each VP for selecting the source of the pixel clock:
- Each VP can take the clock either from the (single!) HDMI PHY or from
  its dedicated dclk_vpX_src mux
- The dclk_vpX_src mux can select the clock from a number of system PLLs
  (GPLL, CPLL, VPLL, BPLL, LPLL)

While the system PLLs can be configured to output a wide range of
frequencies, they are shared between many system components. E.g. on the
current mainline kernel on one of my RK3576 boards I've got the following:
GPLL: 1188 MHz, enable count 20
CPLL: 1000 MHz, enable count 17
VPLL: 594 MHz, enable count 0 (yaay!)
BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
            predividers, so are less flexible)

So ultimately there is exactly one free fractional PLL (VPLL) which can be
used to generate arbitrary pixel clocks, but we have up to three consumers
trying to drive different display modes from it (e.g. HDMI on VP0, DP on
VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
frequency on the fly to satisfy the requirements of the selected display
mode.

And this is where I'm stuck. Trying to satisfy the requirements of up to
three consumers while changing the PLL frequency on the fly sounds like
a poorly tractable mathematical problem (is it 3-SAT?). We can take the
HDMI output out of the equation, because it can be driven from the HDMI
PHY (which is capable of arbitrary rates) instead of the mux, but that
makes the decision of which dclk source to use for a VP block dependent on
which downstream consumer is connected to it (HDMI vs. something else).
Even then we somehow need two devices to cooperate in picking a PLL
frequency that satisfies the requirements of both of them, and change to it
without display corruption. I'm not even sure if the CCF has mechanisms
for that?..

What follows is a brief set of patches which illustrate a partial solution
for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
the rest". It switches the VP1 unconditionally to use VPLL as the source
for its dclk mux, allows changing the VPLL frequency on the fly, and also
changes the frequency calculation logic to allow for nearest-match
frequencies which are not necessarily rounded down. These are not meant
to be merged as-is, as I see the following issues:
- The flag allowing the PLL to change rate is in the clock driver, while
  the reparenting to an unused PLL is in the device tree. If these go out
  of sync, we might end up trying to change the frequency of a PLL which
  is used by other consumers (I presume that could be dangerous)
- If VP0 happens to be driving DP output, it won't be able to produce the
  2560x1440@60Hz mode for the same reasons as VP1 - then it must also be
  reparented to VPLL and allowed to change its frequency on the fly

It does bring me from a state of "always blank screen on DP output until
the mode is switched to something magically working" to a state of
"most monitors work at the default preferred mode" though.

It is tempting to just reparent both VP0 and VP1 to VPLL and allow both of
them to change its frequency, while leaving VP2 on the default (fixed)
GPLL and relying on the fact that 148.5 MHz (the required frequency for
its maximum supported mode of 1920x1080@60Hz) is conveniently 1188/8 MHz -
just what GPLL can provide. Then also force whichever VP is driving HDMI
output to use the HDMI PHY as its clock source. But we still have the
problem of DT vs. driver coordination, and I'm not sure how to define
the policy for "if you've got HDMI connected, you must use the HDMI PHY
clock for the respective VP, whichever VP that is".

I would very much appreciate any thoughts on how to approach this.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      arm64: dts: rockchip: rk3576: assign dclk_vp1_src to VPLL
      clk: rockchip: pll: use round-nearest in determine_rate
      clk: rockchip: rk3576: allow dclk_vp1_src to propagate rate to parent PLL
      clk: rockchip: rk3576: add ROUND_CLOSEST to dclk_vp1_src divider

 arch/arm64/boot/dts/rockchip/rk3576.dtsi |  2 ++
 drivers/clk/rockchip/clk-pll.c           | 16 ++++++++--------
 drivers/clk/rockchip/clk-rk3576.c        |  4 ++--
 3 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260417-rk3576-dclk-4c95bbb67581

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

