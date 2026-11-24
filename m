Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513762;
	b=LQn6y00O7rqI2hlxqUCcEufaKnoX9ps03PCbEoCsaze5CCwE+FOvP0iM/NJh7lAYjBEO
	 PCw+KlOfDSPxHCO+wHZpa739lDsV08+9AJbD382cJx8zDs/yDuX+MW72o3WxcTB61WklD
	 fqLrm1z54RPL6/481PK2xzHgDNApG7MYVy/Ce6gg2nScYsv+YUOG6ouraZmTeOYobSrxv
	 d+TqMdO115ttOiz+iVpHOM2TBD76otLzUVzHmVR3WXl7BN9u0Z43F1uRWiTYmbdE7q2WF
	 RJfovSeQTyPGxtRATHo2dFzMh/ZgHZuUdTYlYso56dMlBtkw9DNfFPIo6e5gTrLIqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=wTwLWLQsG4qXWffReqBVgXqa03lFuUkx2e4dYxqpSWV8WP0BIY99d7C+q5VFER1WzqT7
	 Rh1UWnvCqgL+veayANO8dJ9BgKJND9Fp1/FC8S+xml0G82AxPLztJVjcqRh+5ZDw3eMrB
	 0rw+LbBjzMlynLO6OjGj2skAGcIeLg2P2//foUnPZF4JdJstdvxlvhX2SKPXBxtb1NC38
	 1v0InvKZOf7jUvcM1ChUbypRPXGPtTry/jErl5V2SL5aqnSWDc8ZQugYHlXgMro+JoDbA
	 /nddgBrKDL8W8IgZHOSfsT7Ur4zVcG6iuWoFBWGsjJOeAYTZQ676zQcqpsuzhx1H6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD4606A864
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DD4606A864
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acd523a802so38455621fa.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513760; x=1796118560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=Vra8ahew6DCh+xOD3B9GVIIHTWftq7Q5Qh7dUmEvAMzOoV55LkwToKUZBLTG1gL5cz
         zIOdB95FAKOrUv9f8QxF6VCY0l9NqwLtppZdhJTkmZoTMQV7xAY0euFq//1pewgqhecn
         po9Dm2dVl9z31VrI21h1TuBn8VZEz6nZNh7cEnPDz8TNbitavR91C/z8Q6k9eATDavVM
         LA9SgmWNB+wDn8RA6EwLRxadydgqeVAyYHTMnZ23YoXee1W0n8isAaVPgOn20V4i/Egd
         hgFUp+cmqgTN2/nLV0MFuNzrfoSAKtcl4Awjy7NJhzulPebr3aMxeSmGZmhVaB8qteNV
         o+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513760; x=1796118560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=nrQ8tTpzSP6bCUK23Bri14AZKFdFJgRvJDHk81UoFkvLuQFf2Ida++Db6BAt/RsYl+
         sh67JRE+YpoZ/tmzj/e38HnoQMmoD6C6kvS/xoK24baO1DFi6PTZ1auaYIEEOgTvhd/V
         uNQ5d/nEJFHQ9j45Sf753EgE3MPAjhw2szJc3LT+qEMZGhzcLMdPD0seslMl/wKb4TMR
         VwT8tbaV26oq/xi7vDXseg8Xm1XB0ayFqjW3YxsOZslHzl1hnw5p1zrkQAaO/w6rEsPx
         4O2/CE1NY7CQcWzdYaWQ8PY5K7t35fFjdNwY868Li94iN/cLEQROge3OPf8iPKdE1AS6
         /Nbg==
X-Forwarded-Encrypted: i=1; AL+hErHbhYDOOOZG/EIN5Rq55A5lSQdTna6L654OUeZjs5WE9eBgQnLrBW86WLq8x9ISojUKziutOfy7qp/r@vger.kernel.org
X-Gm-Message-State: APuU4Z+unHtWdmeBuT6NliJ8NF9JsFhFhuwHgM1ROE3zvbLCWkUX+u+X
	kzsSHA8zwJnV1fLtdv4p5H20EFStDjpBJ1Si0qzgrUGVOFCJTMLbmYkL
X-Gm-Gg: AZFdTZcW1LoykyIKVCWstVaMyEhzConyZX3Lhzn0HZ7lnAuPKH/9vtcCDls7X0g5iMS
	D1tyqxb2EW1F463QKJGxijhEcRv6VsT28ITi5w8FkPVKVHnD11BOsEoi576PaiKO8JJauYnt7Ta
	rz/97FHKnWG1c9sHwhP1HeOoyaNulkilGM0xy7CveOrPC6f6Y/DXjOBz6BjGvCoTbKCSHkVBEV5
	qHGnh5vTd7gp+5B5ZBJSgI+BR0nvCyEgNnFk0AJH2rKsfccTgwwFeR0druJFgwbvs7jh+jh6hLE
	jmVWU1Z9Zd5CrAAmvsm3mIjZz7IpsL3n6AHrWgGPNsM/+mgrhkhxVDUlLqNrR6EcGg+LDu0CC8a
	4RIAUdAOW4yEFFxSmoqfguTOUiW1YbAlwqb/8kmCW4wsigVFpZaTCntnYRdulQ5Yumz8WZfT/K6
	5MRY1Y/H0//SgfBqW0i0TbdtX2dtJIwMZ5ofYWjNLidqyT+o583hiR3+x8n9wrAJcgs8QmLkOyt
	aYmLtUFtcFXePNc7e0HpDQuUUv001H3vhmmF+YX9uoSwAgE32iI6XdQjHj7/kLbZY3QyN5GTHna
	5/1giVHw2HM1VJ7a3K3N+4icUsxofU6BY5P/Sz2MBI3Zkyw=
X-Received: by 2002:a05:6512:3a94:b0:5be:5222:5611 with SMTP id 2adb3069b0e04-5c1bc86cfe7mr3678861e87.39.1795513759856;
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 24 Nov 2026 12:49:10 +0300
Message-ID: <20261124094914.2993988-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

