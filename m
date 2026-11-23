Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442280;
	b=dREWGg53hFCYJkR1IhkzlHatZZYSNY6YR57YdVhw7p+0SlVkX+K86hbLmHywLq7ofsmF
	 ryCv2BVSkh3qhvK1zuzKvydn9CbSDvnHWAxA1V5ndOxkpk5fzLpZIphHcWxBDYRkPH6UU
	 ODT5Ppg/ISWerfcS4qLkaiquw1/JvnvjafZSRp2pRgy/4wvyAs8oE4xzvm7yYCZdj1ZeT
	 iHqRA61uBys7gb2Mclh7DQxu/5BfluBEw1UIKdvtn3YaymKulk7PeBcPNZZIyJEa1JvI4
	 d7EWJ4JnLg2rFKzlUeycOg1kbzgKAnwU/o01hbzdF8pkqzlz15rBjCMT7OhHNspbcOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
	b=ChNmyloM8/CS56gXbKSj2opxjwpFpgXHdFEa5J+wBNA7IuQTzttUh8ljmDabKqL5h92n
	 yiAaQ/c4pjf9jGpwYJ+gVsrkg94FHWPv6jVNSgO4eYLKiiNOvtBsmbtoyaGQS/HpZceku
	 OJXtCU8vZjlOAW9/QapXmcbC8oN9+vsL0UWq7F+cWChbbTCGwke8kMvr6KW/xfPiwrnlo
	 yPBLMzB/MFhwxJ3QnYyRWp5yGlDWZDAKEb44pj61qi8san5KaG88VKJNCwa2CSN/wCJYG
	 WzP7wMLMjalo/lRPiupfiHaPOb4/WjeBJJi051rdw1QWXM5/noQrcLsY+5SMi1nXO5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32CB606A681
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F32CB606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzN7U8sT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so2387991f8f.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795442278; x=1796047078; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=wzN7U8sTKBWE0hnIdo4hSl5mB94unptq0osmgd7FUp1WlhAnKCMGAXL3l86ygWmb7V
         s/rQje57Vpi+05Ehs0Hc4IGwxho5PZ/5DOv16r/NCYuszsLV2pLx62EXeArjLORct3YL
         o63K5hYqGANmph5kBH99+P1hCQ+WsV0QnIUdc/fbLZptPdgXuiF+VSK6iP7qpIBHLYt1
         N8oXIv9CrsKz1vAPo0o5KU2KLytiauPMqliW8QMtnFR9RXo3oL5cEWPZuknt38kAUWNP
         /Z2zfQZi7y9XRtAJcICkVggmfN+A/Iqfv8LdLOQ0Dkl5qZMvxz7uIo2/ILhZdR13rigj
         zQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442278; x=1796047078;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NyaSsWAPZgC5lXTBhJenr8CDoN3h5umUpUBYZLSGCnQ=;
        b=axEr+8DYrLimskfT2ebSq+AbEA7Cww9S1kclgkkEph4oFx7rtYjzzj6E/pD73rH1iT
         ADsxT8PTxKOA/y/HYQsnHthNg1xLOIQ9zVqD82nP17IyPDPOynOISB7MR6Rzv2VJHi65
         kIAuAy6Dmipp9oe8NHc+5FRlVWlyMA/45oLGQ/TTTQaUQB4hmevAhpFv+bTEom+h9tDH
         EBA/X2hm1ehHTYwm6/lkExyFXUzcL4d1x1UNVs8IO0G1WR9m0M9vq4By15tGr3Oo6H90
         l4QfwvRCI6h5YgXqEd7rkMIwHn657hOWctjcgaVGYKiS1/aB9XGE+k4RQYk6I1gUudtG
         +m2Q==
X-Forwarded-Encrypted: i=1; AL+hErGLnFNNPyAtqIIdDuvZqx1lj/A7POsMYWRo8XmtRU+cih7td6KwdkyGU0u5rDVDJTPx8LoGM09q4wZw@vger.kernel.org
X-Gm-Message-State: APuU4Z85usQUvOA7CEf4oacUjiocN+buZk639lZz6e8w2yTfYGoFRX9G
	YtS7LuIjyawPuYDTswxPRA8CmfhXSi50gI9Nq24fl94bDMT1OhRgZYlC
X-Gm-Gg: AZFdTZexSxihuue6WtGxkTK5wlI6tSG1ekb/qBreMOyd5uGv97CTUnHsRR8+yZqGpGW
	ppOabdte8fIQ+ARxI2v8CwWFPSHCdim85upp6PtWDBBaGJihONgUHJCP4sPQlpK59Ig96vKfArs
	Ld7EVtUnP7MnceEdzj30Smradqji5mAUKT9yAv4/rXrwynxxMpIQ6VVVxNBl3KE8QHC0cvfZh2Q
	StHCyIiFrXQvUy4nkiUaGC+gKEf2jIeklyB0jVQy3bXxzogDssBQccQYCEJ+JjUTyd2QFF2i6z9
	tpUieDSAKcCEYIFIbCq0XEPKkYPhy1oWBaMy3QVI6SXas98s1l8iuIgUQEtVi/43cObmdopU7zT
	Urnf3AAiprXNlLybak/KGE7OpwZ8SW/cTL/wlldQtJx2sLwwjcBcO5HBTk0/Y+6FYTE6TBUefZC
	7UGYsJtgBi+jMg5KpCJm8yzjhstKfy31FJRhocDhi6uXwC6cpd0mnArMgETBFaVtM9NPz97NM5E
	xBms+4CZZjEUxniO30eT/eg2vFx4XNpGuM6vMkC6omj8GCkKdrw5We+fL0odg4bXkpiS8YLCLme
	aOZHNg1uKhlrmFYtRoL9vYHTuNYQbkJnloDVhuErv90yllmcys1T798wAfR+y2DFBA==
X-Received: by 2002:a5d:5d10:0:b0:4a7:f82a:7f6d with SMTP id ffacd0b85a97d-4abaa9769demr24794089f8f.6.1795442278093;
        Mon, 23 Nov 2026 05:57:58 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d6f4:1401:6558:1dff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm22109308f8f.36.2026.11.23.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:57:57 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/3] Enable RZ/G3L SDHI
Date: Mon, 23 Nov 2026 13:57:52 +0000
Message-Id: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIAGBGBGsC/23MywrCMBCF4VcpszYlSbFFV76HFMll0gxoWzIS1
 JJ3N3bt8j9wvg0YEyHDudkgYSamZa6hDw24aOYJBfnaoKXulVJasI90S5+puwuUbvA2DC54D/W
 wJgz02rHrWDsSP5f03u2sfutfJishhTOdtFqeenX0F7u2CWdkw61bHjCWUr6C+u8sqQAAAA==
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442277; l=1266;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=nfHK27eamabda+l4/yT+G4It55FfV4xdF374TgHVIUY=;
 b=jF4MLo3rk6NOxho8MwZU8an6T6CD2cpRrIil80n/V1/95q9+MXJEWUH3U9O375bYUx7mDdjCa
 onZ4gKACfplDkOhk+Q1Hx7o57ZOt1V2HaE+d3yv/6W7VRWvHy08GO0p
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
- Disabled sdhi1 when RZ_BOOT_MODE3 is 0, so its pinctrl and regulators
  are not left enabled.
- Fixed the typo RZG2L_PORT_PINMUX -> RZG3L_PORT_PINMUX.
- Added a comment about the SD power signal.
- Collected tags.
- Link to v1: https://lore.kernel.org/r/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com

---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 102 +++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 405 insertions(+), 1 deletion(-)
---
base-commit: f5494a6f6d818ca30f70063a573eec8c982ad747
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

