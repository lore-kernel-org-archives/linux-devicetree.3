Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330FE41834D
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275049; cv=none; b=NjuO/m7HRTTJ9dALxX66b855y7hbwwmiowxVuadQQDc8BEEcZDJU77hU4otBMD0lhs6YmvxekxQDnHHVZbKY8PsATkbQIlAe4KvxHNMQu0CYmwU4mWa2dr5oALi9pSPWkDoV5wDI6rR/iKiDkG1o0b0XT4ZZt9UszqDkquAMcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275049; c=relaxed/simple;
	bh=VMBfELsDgdw4LHnXCPqjLHfbD46aI9SXxvEcWut9ryc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocO64G7984W7hSrcCda8b00bNUcikTwnZVT8mS/iOjVpaOKdXwpk5w9jYP+cJMfJHIh3FC9o9Q8dhxlCUpDDKZ9HiLlSFzxusX9ZNj5oPMQq1z/MsLCVllu0DpToFLGjwqqp+AcSYEXXCfRJZj241VQBSCfbzvDg2iRLl+C3gck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brmu9yGT; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brmu9yGT"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so2431842a12.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275048; x=1788879848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=brmu9yGTEA2F4WzPCq6ADcgF7oOZy++TTvE+0A4rE30xUoEOT6hWOz5XtZPRBGh7NI
         VdA7uNEsUkaBJIjyaNdrV/WEW218oPPbEwXuLXTYwpTbeAU5fPhJFRMuQN27pKY0JQgr
         9p5yXkCKY/anvFDdiOPEs0dbGhGAjhtSTbUXZVWjdsobeRL0nXh27qXK74EPuhhyZj/j
         4p+4gERbxqoZFE+vq5LvdyDZHAiyBqfEWeC/0YQbeIhFVoDq39Yg/l80Tlx8mpnsSSnP
         iInc1Fs/c//Zlt7ga4B3V+AMNVG2n7IdHs3tOWXqqMo+r9VH1l+RsJvnbePrEGWOC+mG
         460g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275048; x=1788879848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFOAryefyj3E8LprwQb6zM23kP14ZZpWJUCwFcY71vI=;
        b=DglEcaYQ4NucbakpORO+vDUUYce08vBr9NIY1QunYTeKDv+uw903+FZzQQgoifdDFp
         SzQubhiLF52zW9lcKkAlxwDIkz66tbln09HNM2yeRe6LTizYeY/M2TQw10hC8w/aK9Uu
         ZfJtqBODdPFuXwamxyRMoYEZwC+MpNtjzad229sdRKd7o7uHJdtL/cxhGTlLKvPdZOvc
         MqOzl/NB7y7Zyi4xrPkqQuuBRAnccKKeIT2ryyOGAHaiqon4Uv2H9GrGnD/P3EjQ9CHj
         l3idD/KXQffhBKTU2aeh+lrrhu1akDRnqV28ITjuuDqubf0inMke3mSKcWqLgfvFWjow
         b2JA==
X-Forwarded-Encrypted: i=1; AHgh+RqjfwlsOPMKx4q+EB7ORR71P72o+7MA/G5hg/LsmIrWXTPQiKUyBITMrDQmMj7gKbxp+Lz8xDQWfV58@vger.kernel.org
X-Gm-Message-State: AFuF++lX9EVet8Z+NFw54cyutxUgNEw5KWHuizRdN/IXvJzl5mCpROFU
	HSi6qMPa06a8Qz0fHitEsTP31A5S02NWH7wmMhQ0rCzljRoy1d5cdwsz
X-Gm-Gg: AR+sD11CB0wWU6pBaqoo5wXbIl/NFgCm/nkwz6pVNigVuDj/+tlWXlhr57BelOziule
	3wWCTvfgSYa2VaT5MEjyuotZoSZNXbxVWTT1gktUho+Rrn0tVRU0PuiDeSNOn0sA0Fwaf/+1GFK
	JBmcaoGtJGGTYBA2hzosm+qZsOg3zyIsQjciajXHvyhWpy+Cx5AtbKvGByQ62mkS30ffQ7AleZe
	iQoTeMTFO3ggbZAUAqqBwgNRbFlAheLUUa0osNo37njMx+fsBXkytsrMOpMf3naTDWdxy8RLTSg
	XV5g8H7mLyfnMKooe4YrLdKx6x0tdw9rfeVIKGRf1FfIh3EpBSbzU+LS0Zky3dLPfB8dZWAvilo
	xfnFJxUeYQGV3VpSBKrd5pqeP0FVg1OkLo/wz5KLkXILJ/Qd0aaUxaW0NmjTsS19PHjdERaKm5e
	bbhxnuYiU1oRBG3uXuzSlFaZ7hUiADRDcqp363r71Z6JC1zRy7B/9hYWjmclk=
X-Received: by 2002:a05:6a00:4501:b0:857:72f8:dc91 with SMTP id d2e1a72fcca58-85772f8de55mr39669660b3a.18.1788275020723;
        Tue, 01 Sep 2026 08:03:40 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:03:39 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue,  1 Sep 2026 23:01:10 +0800
Message-ID: <20260901150111.141037-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9..c3b17752cc817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23744,6 +23744,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

