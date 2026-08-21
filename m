Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CC3C6A5C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346738; cv=none; b=QUrtZZ91p9cP7rA4X0IjTCaQQytBl3TpTneQhQXbxm9qkALdpnY8fTll37Jkz87o9HadtmqkWD5ity68Gx3K5Ts3GmRInwrlIF/YP/1Mh66vRYDs9wXbv3HnmxYKrHN6ynleznNCfAaH8/jojO3va7w4cb7Gm5pKCW7hQ8ON33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346738; c=relaxed/simple;
	bh=bqLMPVulyGO3uPN192UU8p/Ih7Y6Dwy6WAN72JRYMms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqLHR/kisFJrtVebh84wLK+r+eyomS1vSJgAyHt4DOZgTUgNRpl8lsWqaROw1GfPBazprMGOOoCt8msev5zXEkPgnfdatwHQHfDgz/XIFDrL99ioRp5lZCp5N+k3RX3TKzsi7y8g4H93edW+BBTpCe/QX3f0+GPTEcGJAUZVOhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtMVtVPp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtMVtVPp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf52d15d88so12645685ad.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346736; x=1787951536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VufRgxSYxCIl2Jf8aNb9F7AHOcOxi7eWJscZy8FNEAY=;
        b=NtMVtVPpv6sFBmmpadwMhaDkNClKtuRnsUWJCPTpRdcO7aI43sjb9LBnfz0ZgQs3Y/
         9xitwiV7e+ygIMZ+RUQzv6nXq2ZMiI+19j3W5opcspf7gTZWn5HR6qI160amrqH+IiOV
         zkijTG4EAcLnzfjCg6H562c7CPstvOJAQfeCiu+mBmRYB8Y15E+P7JX+F44OTaeb+tO+
         ydFFc2QTd3GxZYV92tOqTd5lKto3vG2E4p3S/xEutS++m69Q686qLsWhWoehpHyMwRCG
         H8MkhzyltAAup5Xu+lPQtGcUIKTLIjkN+aweTkyzoIOncH08gUlk0vaqxzmc7pFVLP0u
         8hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346736; x=1787951536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VufRgxSYxCIl2Jf8aNb9F7AHOcOxi7eWJscZy8FNEAY=;
        b=L7GTpxjiJGcKfDhZvU5QCqaeM62Y06XmKd0VW+8zUzieekPKYeWnqTMtuvWxq5OXK1
         Hi7nXq0wRoDwRjSFhFAKGHVH+d1Ya86piqTZiVLQaiIrnscKAKw4xNrxSXa2qczYd7BS
         xM19shz/XH66JkePPkt5hwsS57LI3a3iyM1mt1a4S2Q1mwme8uMruGwd0goPJ4ekm4qb
         D0EtfrFgmG4TQKKFgzKCJIiAYDu3CnHWMjwj/svDNMGEpH1d9yGSbGZ2wQNCqAR3JM5N
         +udGssqRoY3aMo2R5UpruE+TfWqb1gG3rf32Hmhu9hG2Jsb39c84AtPbcgfVR31BedPV
         SgXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqjd0k4R7jlB8BNgTlXDp/YED1MJBP2qEtMK4aHwjDrgW0gQqLyc/NgF50UM1KsvQFPx4+sFDJvFGYr@vger.kernel.org
X-Gm-Message-State: AFuF++m+iZBvMP2iWOaJwSXMhqD5c6gT+BY0ETW7Y9ZE9FfpTq57dya5
	AClZ+RlPiTUKF2QzVcxIZDRCLnRJKwmRK6FEYy1FBcHCEbtw5DbuAlZu
X-Gm-Gg: AR+sD10k+IXm8FIesyAnlNITxiq1Wo/1tjIrP3C9IE3xsSvtd0jN2LVvn+/vMyAXt9d
	URfTUYfb2CmwxA2KpDGLWqghQewRHABSeYdU60OogzoVuoRXKE4At5lg/0mbcZz0F3kH8yf1oPr
	UnywuwbWgOWZ8Q5PLAuOR6SLYk0GRdd0V//OXVnuSNeUIDNDRxXkFtUnknB8FjF1VhKYrazLShi
	6ph9OwbkauSDJA0RSiZ1Hsz5hCXymQy7NTTe7aexTm9Wdg2o7kTKUlu0ErkrSoN+HORJ9n6bKw4
	RZV6w7Xpth2Jnr+GZkyA9XrCSn5ij3ASrVrZTmzNDg8LUzzp84WpW7V64M++rvJ/auepPljZSKc
	NkT+2wyXl9XjHv2e6Llm/ImyNzqkkWg0k1FXwqbAW2P9tx4sNWHkm/0R4y2ypG2ikxdYXLmul4B
	PzF6EOiwR9LLK6p0BCpZHuGurjWPFNwzWpaQqCqGhn82gNwrfO1JVOGOtCAPZaDssHHqedxmNOV
	G18Jo0Agvn0mYBpLqGUvtcTKCDiYl0DVxfX0DcE3vAXfFaH/Nk4p57l0rgN2/sLoOZ+YdBd
X-Received: by 2002:a17:903:1a30:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2d64adce8e3mr179152855ad.6.1787346735900;
        Fri, 21 Aug 2026 14:12:15 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:12:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 13/17] rtc: rzn1: Consistently use dev_err_probe()
Date: Fri, 21 Aug 2026 22:10:28 +0100
Message-ID: <20260821211032.13554-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- No change

v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7598efc31e09..9fc93afee1e5 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -485,10 +485,8 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	spin_lock_init(&rtc->ctl1_access_lock);
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
-	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 
 	irq = platform_get_irq_byname_optional(pdev, "pps");
 	if (irq == -EPROBE_DEFER)
-- 
2.43.0

