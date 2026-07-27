Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E64248AC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184061; cv=none; b=tAcF5/jCERNmO0vGJ6+kBJ+I6THm34Kl970j7upDp1eYp3u0ikYgQdxt9xlRAzXuJ7uWvdZrz12Ea8GeWqkJ5XN5TibFKI5iNR3XTMw8sv96E04hizbq1X08w4/Ad/S1aJDregVTOvWi4QIz3eiH+L/bxBZxQkA/jrMkjqXhGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184061; c=relaxed/simple;
	bh=qj9oi/cBtXPifCFhPDclVAmsrSAc4OFA8vU4uyn4LrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsDoKEq2a4zauJhlmdUlZ3gcMdpvrJo1vSBkybRnMqF/e1KGfI64KTFC4vGM2NER/CJU9DWh51DSmGgGNPfAQ89xivuAK3FVlVreiiUX8iho6uwmvPzx+JFYGHlX8lb9HHVkCBCNDojdN8Lw37nwdx3oS+2hVm+8KJpKfP8geZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoZgh4Tg; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoZgh4Tg"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb973e6749so3534285a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184060; x=1785788860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhJOyahO2VNaU9k107tVS8fzsZZa8vrmStmLuVi0BYE=;
        b=RoZgh4Tg/yjfMW1NTsA1eYqqfPdDV3huT9d+CEAaXxv3lNuG6KLQXb3qE+NpNozhEh
         h26fljIcoVVerCy4tZd0KPLDtzmHMzRHjFZ8ErNiHurd0CHKfGIexJ0OsZRlljVCYA63
         qaPKBq7EBLQ0GTFqM7B0c9CttQiwA3BO7lEKi7aWYzF0ysrNaXzzidoZOI9lMhXmBu/c
         9UtCgZvVb7sUanQR2HmpIY8kxvc1+SWjhDJKPuaGL+JK8xHk76GCilX0Vf5A+a8czZWm
         xpv6+eOBKx1V7EfLgvBbDQVbGYl1IsdzN6cX/ULy4fgBuxCyxes+6NaX3y5CDavsRYAq
         8K/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184060; x=1785788860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhJOyahO2VNaU9k107tVS8fzsZZa8vrmStmLuVi0BYE=;
        b=gY3nZALCUXPRDgAaM+y0uoJUKemOppcFQ2y5eQBMpIzhwpD8g2ywADrmyzwp6Dx450
         DApzqj+d3C7w5pinSwEBs5M+zGZa0HfssM0GovWEEZa1L7u3cnRuAe3o7XlCS6XqcR4t
         cDk9bpUAlbGpOoRoG7FybwHJ5uA+xdYC8HRq4skAY+gcd+XcFW+hF0xgpy1dZOik1w49
         WWR/ojRlqoZDSAil0lRTixmsmu5fx2o+RdVhiEuxq5IC1MAOMfRLTtB6LE4YG79uj4ud
         DQLwHLQMgNGP+3cPMbO39LXP6F/FlpIFLkpP/o4g2tHqfhk+bjbpUTx96BHLfsle2rIb
         79tg==
X-Gm-Message-State: AOJu0YxC3YYWY+o5CW/GHe8pbtxcWZiBwlZxUk0CqVVauepTBWGWL4lZ
	mEqFQJGk2mJXOdn8BmI4/6OyL5e/WeP5pEwGPnOKuIicaVtr53kZ5+3Ngo/kRt76
X-Gm-Gg: AR+sD10xPXOIfdWFnHngvTKcBzGI4+h5WhaNLYEzohHK+zj33vcKF1i5e5aSkg04r5P
	bOvitC7OQTZ6aD8MFisA3bGFJi1Z9P0sm/NLL2WqXLltNbCqNVCBxE4+LepBq5ItxJH6wU8ZPgo
	D6H/3JCSNck4O9MLfGER6b2NY0z2nCo+s0vmo4/JuPtBjApfZJgf014KPSWW9WlP6MdnAbDetvD
	wLky6MO/iA9PIrPx9+8NRDFk+iZLodSp5t3MjsyHT89r9Ss2SXBlVoAIVmOLK3JnBRiNin1Vj/3
	bTYHQwKYUNMA0GQQkh7b2v/z1A0h181dFimJloj2SYthgaif2S7T1sUfH6xCOVCDkH96+WA9xtt
	xIDXnXrLU/qZGgB16Hoa8dIQQ17S+WH9VQmiUFkC3brDrcb9/Pd6fWh52Y0pfd71e8URTuJY7Sc
	NElzs3ZTXhUtw/5GAd9VGmx8xslv2qVkaEnRu3/JJzEOLO1KwfmujhSWWm1o2pAIiJEdhLd3Te/
	bbofOWS4FzEoLgTg9hZqE/Lu/kvyHf968fjopViSlbqeAXemU6Ip6YkRbe5byhM0Q==
X-Received: by 2002:a05:6a21:692:b0:3c3:91f5:82ba with SMTP id adf61e73a8af0-3c67dfc1288mr9428321637.57.1785184059789;
        Mon, 27 Jul 2026 13:27:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm35331168eec.0.2026.07.27.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:27:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: DIR-890L: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:27:37 -0700
Message-ID: <20260727202737.21862-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WAN MAC is offset by 1 from et0macaddr, same as DIR-885L.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 3124dfd01b94..944d592dee2c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -114,6 +114,7 @@ nvram@1e1f0000 {
 		reg = <0x1e1f0000 0x00010000>;
 
 		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
 		};
 	};
 };
@@ -125,7 +126,7 @@ &gmac2 {
 	 * actually in use on the platform, we use this et0 MAC
 	 * address for et2.
 	 */
-	nvmem-cells = <&et0macaddr>;
+	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
@@ -190,6 +191,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0

