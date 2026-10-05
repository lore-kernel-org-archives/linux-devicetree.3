Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F48837F735
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238366; cv=none; b=WItSFink2rr6UHdVsD+rT+j5uIHK1sYaQZ+fvE5ahEvaSzGdH8dJ2Za4bRmZoYTSKu3MMMd6Nug3jK3hbNYKgC8viQPaxbIuZNuAdPTTYMVYzvRsHoH9ibQS58DYKIPv6w3mjUz+EYCt2MJmHQix+LaUqn2sYLH5VqB2+JV2l1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238366; c=relaxed/simple;
	bh=uiMSdSCl9nLbW+ERvnYUHOdiPIoZdKrgoYeLoGR8K5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tO2fIYnFC3EqdbSbNxLOjO9bncknXymv1Gat3BAqRrvoxu/Gu/5FB5kDQisY3EQQZ5bPZdLDcgdeQ1+j4N0UMESJWjzlAeWSlK8CSsAnQZftXVxQqi+4JBEO+AUREDvzzRWvcHjKEq6M6kwhEYAEkdIbhUl/5IBXQEKYet8o/vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qqWk7J5d; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqWk7J5d"
Received: by mail-pj2-f9.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so10417445ad.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238365; x=1791843165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKGy4C88fJ5sur3Q5XgFQ7glpkb5tmclhAnLtMHskg8=;
        b=qqWk7J5d1AXew2LY/KikpvWKtGbyIhd+rTA46ptETzPg95SrAOrpA8m82BhGAow1T/
         5uR43pXEnQxKeI+o+qTNez9+Wf35kTU42u/Mr6lkE4VCghq3n1+2kkrjA9/5VLYgFUka
         bTa+X8q3tf9E4GEPFnvE47HcxZaAT7QXjZbutv94r2IlXBp02rUIs09tPSR3bTiI1Sie
         Exas7q8IOqxaBqwNxYW/euV3wWTBw6W7iC4LbqCPG5FnhRvV//1mUerT0TQNiEVbwXIu
         A5bLjCtVrAM6JVdtN/Qp6jhSNvN31hG+o1ny0PJciUMIvWdcddTQ57aqh95DeqrUriZU
         6wKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238365; x=1791843165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKGy4C88fJ5sur3Q5XgFQ7glpkb5tmclhAnLtMHskg8=;
        b=H13GWbO6glPvfVERR5cub4GBbLN1N8OYohF/uim9wzI2Nk31wzj9ZSMX0Xn7UXZhAt
         aPLvHRHYYxanZhBJEPOTcWGV/2/xbAWCtgIjvJ0BV5McBAydhN7HiF0eDHnESQkhJqI3
         Waxy/4UG9veLZliz8BU2/atTRHNoRKLkXaSmN7oapw9W+2BqRbMxzQ/onww3qmdCV7kH
         QRRF94+ZZSSzDLJPkGpQYZ0Mf088OsLF1Lx379ODvId2MW1GNB6F85pp2EOVqhWPqQLE
         GkPsV27/YUx22pjonDoUCVFdvluOOwH3SwhyHUQqUS837hlrL3jmuZHziw3IyVMnDi9w
         lPBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCmN8giSgzsNi2dwwx5EV2fbhLskWDwFh55N1I6SPL+3LeeFMQkK2zyEVMVRyqhoy7bKi6oDGeNl/T@vger.kernel.org
X-Gm-Message-State: AFq9FYLP0y53R+ORMKkcPZShUEg9apGBEzo5LIOjmZXXz/gOhGowZgdy
	kbAK8UMpqFM04ylbBTkqVcRP3v8PnD+RMZH7Ez/cxdHsNRBtVOAAafOZ
X-Gm-Gg: AYBFou3u8QV3jgWeyigreFDPqs/k0vN6CibNknsBzR1DxnX4cTUHQ/fDv8+pKdNTJQM
	W0xcpbQKh6PmKe4mVmkE617u/Snhk49lRWLdDX7hwUyaY71ImEPFqZ9yUbJ+/X6zwzulNjyaE1Y
	FBzEArmaQEjra2w0YANfxvPcdfDh8PWfqb5hvW2+uWeI6dzFXNxWffzYieO6k8TwqHYh9nfaJ5A
	oRe5CWzPJljlWD5zChHKX5Uw/iE2TwsggWnMIIa2Nm2JPUp0WS78N5Ik0OPT0/IJ2rROWF+Mkrl
	sJTPRV06xe525EK6zekbcs0UlH5TGVURdtqCOtB+O5gBzD6PETphUHT/WIJ/WvI9iaUHAnUINg2
	FNzEqI2e3RyxHbMrND18Fr979VIexhGDQTi6SD8ZNDv7/nZbjbRlifNNuEo1UI4SAKxP8Ba+J58
	Cdi/Amf0W7/HFAIN6Hwloff9KyHqdmEqx/AE+5OmzNHdqiRKu5wD+L2kb1QlEMxb1cg4Vp
X-Received: by 2002:a17:90a:6c90:b0:3a6:d94d:e147 with SMTP id 98e67ed59e1d1-3a6d94de194mr3494292a91.15.1791238364547;
        Mon, 05 Oct 2026 15:12:44 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm1719425a91.2.2026.10.05.15.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:12:43 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 0/2] phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568
Date: Tue,  6 Oct 2026 06:12:27 +0800
Message-ID: <20261005221229.1095843-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the PHY part split out from the v10 RK3568 SGMII series. No code
changes, only re-sent separately to linux-phy as suggested by Vinod and
Jakub.

On RK3568, the SGMII interface can be routed to either GMAC0 or GMAC1 via
the GRF register pipe_sgmii_mac_sel. Patch 1 documents the
"rockchip,sgmii-mac-sel" DT property, patch 2 adds the driver support.

From the RK3568 TRM (Part1, Page 229), PIPE_GRF_XPCS_CON0 bit 1
(pipe_sgmii_mac_sel) is defined as:

    0: SGMII routed to GMAC0
    1: SGMII routed to GMAC1

The hardware reset value is 1 (GMAC1). If the property is set to 0, the
driver routes SGMII to GMAC0; if set to 1 (or omitted), it remains at
GMAC1. This is necessary for boards such as the Ariaboard Photonicat,
which uses the SGMII interface connected to GMAC0.

The DTS changes using this property are sent separately to
Heiko/linux-rockchip, and the net-next parts (XPCS glue, dwmac-rk SGMII
support) are sent separately to net-next. There is no hard build
dependency; the pieces can converge during the merge window.
---
Coia Prant (2):
  dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel
    property
  phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

 .../bindings/phy/phy-rockchip-naneng-combphy.yaml   | 13 +++++++++++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c  |  8 ++++++++
 2 files changed, 21 insertions(+)

-- 
2.47.3

