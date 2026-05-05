Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1995142DFFC
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976093; cv=none; b=Gqi68lHZGnhZzGBktKRMCRGgIi568+OJGgK8g0Ll8dtqFY0rieNMq/F9NthNzIEFMasO87oXJlDHg+IG0AsGcLzZ6jj3BzS5cSBJQQMhmbOUDqA6J0BNtzeYHB3E8f3/92nplEXhl9tnNH1xmKVxFaNnCDLiJBujMEt3ukkEwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976093; c=relaxed/simple;
	bh=qoMmEUH5+qKT5rzUAWCB7aevdooonfmGJC95kSlSBCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBdv/Hrkxf/9OnI41Y7l+q+VYVEjJSt8qp3KiRh6uhhsWuuxCspH1wP+MN64ULxh/s129ZuY/AqOcUOf3kcr7vDXWykwYd40Wms/zxYHaNPH82XQApsX+w7sTOoF+oVQhYP8M2a7ZRjGuZCvJN9IgxlpIfvEGSL6VmglkyQdriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kNJm2CBH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kNJm2CBH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1688645a12.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976091; x=1778580891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=kNJm2CBHJUx7bLSzcvAnq4oZFKrp5yh1Ig6quPbYDEr8QyrgJJPEKqwby9/HBta7nP
         2k6GkVmbqrSls352L5WSdE/0Kh0neLj0+RnQYj9s1Jw4fSByHwpeA3a0kc7zHPgN3uK5
         bCconx4qbRV+jg4nphPB13rCUXfHEDB1j3NyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976091; x=1778580891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcPj9jxKJ+7Gn13Bn4AR/zcbvWrepFf4+yuL7CK2GFk=;
        b=law2OYzGMkmc1ehIpwviZyCZVXre2sdQYkCH8yUd/qBx4u0wXKagGOYtuOHHT+9xnR
         p+REb0TG8YWpXFy0/xr+dKWZvgWhMRFryrT0DvP0CkPvyR/nJzrgHvvcpXSdK+Nfpq3W
         iR3sCkl05bAyGthenw8ooIvU6DMuQZQcPLIn6wy/hZbvdBCGt4Tky65OvvdcYLEZt0Oc
         N7gXypTipDN4AJK+xvXmv0vEdJgDFkfOswpEPYJXUNkRH4UZU4fMvYE7+vxeFWokOwG5
         G/YQVbBU0Ual/A6+ktLNNEa1yAaMdP7HV2JwRFrJfDsqbOTE19ZZd2UP3Vkc1shXRB7P
         JIQA==
X-Forwarded-Encrypted: i=1; AFNElJ+XH7/DYYTwadbOVkfsOiwpyFXcPz82jH721ZxNwYx+BfLWf2MgxOwLl4no8tGbrFLgiZnWV7MnM3LD@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBZIbuoTM0xGO99pnE1h0k5MY7WMvrP11IJBOfGR7ujjkC1HP
	D9hGZdSvwX6uLJ2jaPfulrxI7OW8lbYLTmp886oEIGkgnG8/WWHG5erUh6vikHZol28xTcGJ+CX
	XcCo=
X-Gm-Gg: AeBDietRC5qJCMw0Hs46HL/SVHcm7s7OUwG1EPg5rnncveaB7aeaigajSGjxDMkqN+x
	yH1K/vK5PW3CCg3a8ZiX2F2XL5iFI6KCo+J5x1aVa67XNmTwFMBqIQokF/uuJoUgY3cXvylivNv
	pQg+N9n26+m0rZDQu6uNXmafaOAj3bVtprvVL5cag6LdxjvNBKoXjQHBHldgtxHu6QvNgf5VJEx
	hBjU1tSPM4Hcw9qMo5U0d5AhoXsS+fWIB/HvuONWvNc8Rc+TaoYTuE3P+02kZQxerWT20TbgG8F
	0H40XwQgXZlHhDorJQnhYRPsrjYcgLuLKJm/+f+K2kkd+FdnD1JQmt4a7oe41aGPmOhiWn5IlJv
	0cwUlSbZGT/vzzwQoYmS4n6a2aMHmu5a7m+qHMfHKz96syOkUBJS3BS3Vf/KydKWOrnzqfZLeh5
	kqKfTh7U1bmzqX/qi2hF9iLqh0pT8aYnLEzsgP1JTNUX7Gk/n3MGA986J/T+Q6TaUSnxGNIVSLL
	aEbDZiAXI5W/mEK/tU=
X-Received: by 2002:a05:6300:218d:b0:3a3:56db:919c with SMTP id adf61e73a8af0-3a7f1b3ad0fmr13728832637.14.1777976091454;
        Tue, 05 May 2026 03:14:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:14:01 +0800
Message-ID: <20260505101408.1796563-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The two regulators that are exposed by the EC are supplied by the system
4.2V power rail.

Add supply properties for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index cf9855618494..bda1b0f9f72a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1431,6 +1431,7 @@ mt_pmic_vmc_ldo_reg: regulator@0 {
 			regulator-name = "mt_pmic_vmc_ldo";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		mt_pmic_vmch_ldo_reg: regulator@1 {
@@ -1439,6 +1440,7 @@ mt_pmic_vmch_ldo_reg: regulator@1 {
 			regulator-name = "mt_pmic_vmch_ldo";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3600000>;
+			vin-supply = <&pp4200_z2>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog

