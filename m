Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915883;
	b=xrL09+k29/r1LffSX1vgchS/Zz2FNszARwrofboofoUXONrQnjHbBIRFzBhq1F0Ceeyq
	 YbMHJM0BhYYzt0Goii86+tw3AAEWVZ0jTUFG3CVP4Qb2cZ9l5CckWSRm5oS0wPVOcBy9D
	 yp5RTWUHFjk/C9mfryOnjv33RwHVC4ZFdOp/Gfanm2TmmZetivs5RiYKTI86X/9eJCVT6
	 6hbGKyTq1+F/H2hK1BofQX/DhkfdGqd3z1AdaWYJu9KTcOecPAVVWSnMP/O/1iaI3vNBp
	 n7xZowUlnu+kCkyYbJpARLJsLH4YVE59c5Cec5la7JPeBDjcC78/nEQadGlfubffdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
	b=fJSnM+FAfFaEZ9DugZiZo567oeYobWJNal58/EWgQvkrzNzfe0W6Bklwqia6o5+p2jM8
	 YngyQQztgyz+eZbY206AlzTwYc5rcfOjFlP65Hs7tJvfmQqZiMMpPhaFz5Q6QFB6Ub2TN
	 GeVaQjxHGEv0cLadhiaaYLxEFudFrBJpHvghjcGyMJJfVKpHBzaTPJAL0l8OE6pWEylqy
	 m4ATVgISIYSatzlxHigwmfzEWFchaMDgmKWwi7fxrLFFbdAAzLOvstLZQzWr97uVvreEm
	 eFMnQ5V1IVG3aDOehugt29ehT/EqM6hqFC4js6SSixGnrnQjpc/UD5CvBa4nCf6aA/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEE606A33F
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DEE606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl6D8KA3
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso4639282e87.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915881; x=1795520681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=sl6D8KA3FdArmPRJE/9/3+w04VGmJDoM2kpUiE3bxNH3r6gjXuJ31wqpbPJm8xLQSP
         ReziKQZ/ww36NUUjGiK9BugbjFwhJGiKbpgb3teYqK1i/JL/DWtLuselX4Cktw4IsSzn
         BbS+lxVRb75D57P+c+oDj1oeo9TBDnsDy0dYgEs+bZBkveiGTIAT+dh9oDpb/3ydcdlp
         RcQGXATiDmRYmyANYlJNcW3h36Y2lZ/W2oQxqsSRJNQ4mh6d9h1jUgkLydLKZFO2Jw6y
         65VBX951hp9eNUwdUNBY0ktRDQ0mqSVT/Hel2uek/GoRydpA0ZdH5+mf9tHsdQhnKko8
         jJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915881; x=1795520681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r91xmQ4C8F0zPfOaHLbDfcjfSGGWxaZqZu765YmbgHs=;
        b=S7jonTcsXRuYbfkK8qdGPaWW6qWtun6CiFEl8wVLIS+t0Kj123qXeJ4Ukoelru5H1z
         cNQTIbtGRNfM1u8AF/QPDaTd1sZOF+zCq2F9JB68vpk1SbfPYMZKTk+XyvTVI//qp8Ue
         WbVTVQ+hHQBh/vlSJeblAsCvBDNTTmOn5VjnJf1+rXCrXxv2q1Y+RAKrmh4Ssw+D7FKH
         cW/65WiS9E/4OVObPok0cK7NR2ENj+zdTG1FC1gw2OhanHMnSMZo8tOrfUogmXo1W0T9
         neltE0aWfHpwuZTd1jbKTiPLr/nQjDZaOOJwTjyvvsPL+Or19+Yj9I/iALDxEpQX3uKJ
         fyUg==
X-Forwarded-Encrypted: i=1; AL+hErEINqNXSauGnOLOn2/uf6+UHaVLQtBUrwc0wGHVEcPkPmg6eH5HNWbGoVov0siT2hThFaS6fiJswK+y@vger.kernel.org
X-Gm-Message-State: APuU4Z/+LBIJ8q4OeRqOv+jVcaMAmWJMDlNrB79MjN+mYAZlv6lqiM6d
	tNgVlUl30mROIIvwJ4n763x19GSPv2PAl+QqJPvlURtlVcw52R+AIGzy
X-Gm-Gg: AYBFou3wTIVDP7WANhN2m3MstETFZgAB7qDXljyBgpqbVWNhucGVRIdAgG3lmj7xLrt
	sYk+Ij3mc/2tChEtq/uxBlA8By1Jz8mIr16t5Oel2a4GTYT6rvZ8ypr+8+w0euVLDIGKaQMSsbk
	D8Doj54XhnAY6QPdJ++BATaVgEMWVML/hoID4WfWPzFBF31+hWeOqr60mFAHzTpcHhRashYhCLk
	+d39m1NOQ1HfsOJ65b6Ll4A/fp8HqqAOCIWLzG0sFLRXSfXZlm5GkHEE/cHFdUtKD3azT+2C5Hm
	uo9BEh5QjM6CwQlcFsY59dYp3C155zvSaoj1Ve5vp8Sa1q+iIyUR3oEYdQ0s21CqlU35NrOk4Sv
	4b0JAON+Bwzfl8hc5C+46IpkusPB8OnbJ7CIPOLU5ybgS9XBmEzGGDVBSOQ0BR3/CLzasK/zyPg
	idh1qkT78T487D/xDjAPp5luejH1JxvnzfHeqiJ+TL6whwEulJ9pqMle5JYmXGtmgJfREVBIXyi
	pWKEem2RR/5GMJkAk43HuxRsL3cTkBDpKS7C6ZErtNIJETLUzBHaF23pTeYR+nmfQsqzy/O3Z55
	xFYDVBOtujigG0WEke3YI3Z/taNseWfzhBlFdsNZlPhTZvw=
X-Received: by 2002:a05:6512:2246:b0:5c1:56f5:fabc with SMTP id 2adb3069b0e04-5c1709b2313mr5888936e87.24.1794915880522;
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:40 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 17 Nov 2026 14:44:27 +0300
Message-ID: <20261117114432.2794961-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

