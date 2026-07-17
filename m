Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3263E5A18
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277911; cv=none; b=onkLt2Ms0iNnXRnv7WY4N+Ys6eP3ezlRpkaNbhVYjHK2ZKrrYknAAt0JtIGou9BkKKeXY6qCLA3TB/b+wvQSMuokr9+oDQS3rvIaXyv+7WiBLVLNJqdi1pLtp2rvvvgtsf99ipIfHZcoJvAs0p57uewui08Skr8fuXEQBJmToWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277911; c=relaxed/simple;
	bh=bA8lkVa6MhT21HmHeSNZxVJnTSK1jb7w+kbz7hqzzyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6+5COsV9QrIZu1nJQir7xNAdOWResyYOBqJkO72UobWFowtlYuUIkjncpr6KajfB5O+FuaQyCfyc7Ajtv4z0SSJsSq4omRW/oHHiaBKRjFrVYrhcPOYKNG5WIx4qmaFQfCmL+scf9qgwEq9OS0RyEcIrZ1fd8us2vnHkpz42pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lOqjSJXS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lOqjSJXS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f75f7172so56544255e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784277907; x=1784882707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvg1048boO0grk708g2we8TSqKA9YID/DFGl64E7ytM=;
        b=lOqjSJXS9Ui6A/uUoH4/9Jim1Bdrw3/hB6TPYJTGgY5VsC1AkSZdyUM8IaGZpowUxf
         NJWqneZzAnALIKt2LB0nvi5dBA5k5mQsjJtQqXf2o5T5SjmqGr77gEW0wh37FK73kvoT
         I/Ju6d+UrlPzBV4ZwzpvpWRc219/oQS1CuQT38XBJnrs1OI54jWw/WmROLtMRp8rSbLU
         b/KX+OrmvDKT1ZrF1NQ1PRrnfBx+P2qmbEn0jgGB9AAhplHMIq1XDQNgm1mWZbL7KW2Q
         7vSWHyXYpVLZAZTyfWhJlQShFUEAyV2WddSsDhepGUKgY4BrxwCiBNLY4R7ba05tzGVg
         6tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277907; x=1784882707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvg1048boO0grk708g2we8TSqKA9YID/DFGl64E7ytM=;
        b=UZTMgQR0C4yIWU95uT596FjAr0y6NIlhp9JVPwuK9HjUk29Z13+79lEzlsWCJCQHt9
         nQue3YOr4KKfHAf5IhDq/i3mFyS3rUxPjZICvt8g9CmrqN2ZgQFICQ7CGyfXcDGCgsjw
         5GQ91ArXrNd/Sxi3GzzegCx/KI7jTlmMLS+SaQmyVJixu/ScVHqB3D9wAdXvrLVadIQU
         Yon7+usSf/M6IBEav9mZaSeekvli2LLs2urrHole991Mt7U4XTO/wpvU3b8N6/lggCNV
         UZBMX6f9UdnJ1NA5gpHeXhaS32hHaOV/HIDS+nYHwfuTPjMeNCIarnAh9MbXtyjR7Mq7
         FrgQ==
X-Gm-Message-State: AOJu0Ywu5GeHj2lc3iTZ7prvTMGID3OaFQbX1Gl9svSHFWIU39hSSmkw
	th9jgnRw4CJTmReN6pj/h9CWoMSvFIz9cT5y8bgVj4IdSJsuHO9+EEVdsikc8KMwyK0=
X-Gm-Gg: AfdE7cnQCV59/O/lL9CKUs/pYpnbYyqidkBnl07Sh3+tt2sheSc6VP/VxcTkI5Qz+24
	6TK5hOx2TtdrA1/yWEshVFIHRdHE3j/C8xTKtGElh8N3IT+2ggr7g9HEOxX4whe9NO3AYkXe/MM
	w5TWYDhdcxQMar7qZSp5CT8XPIMJuIjeFmBqO1ChnCtiF2IfsnXgXVeMdSwteLPCD8JZBjVknB2
	OFoPP+f1j07BO38LgwZkpdOpOqJ6v+yHf7ygko16sWxlEtziOoP3ZhXhNYIAs2j3Dlu79e1ozJx
	dR+RIxk/sWdxKLUlRgl8vF+zIY07pk0PSYaxwFH8s6OAje5dzHNTjvnHmVdHF5cNpy/NMHCJgjN
	v197SwNKVEqShM/lCgvjd+9iiFiDEitrGXpT0VFoyFNBmPWHjr0Y+IaxD0e0I/0kdrnirlWjoQL
	+9mY0M6e41VE4=
X-Received: by 2002:a05:600c:4ed3:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-4954a513410mr17676585e9.36.1784277907166;
        Fri, 17 Jul 2026 01:45:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2a24b6sm30017505e9.3.2026.07.17.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:45:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 10:44:31 +0200
Subject: [PATCH v3 3/4] mfd: axp20x: constify axp313 and axp717 cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-axp318-regulator-v3-3-779dc1b97dd4@baylibre.com>
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
In-Reply-To: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=bA8lkVa6MhT21HmHeSNZxVJnTSK1jb7w+kbz7hqzzyw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWeuHz7+9BMxF+8DtbcXF+tDOCdMJr7DIsyBCy
 Q3HfIhQI6uJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalnrhwAKCRDm/A8cN/La
 hQLbD/45l/YQ90bI7HPXbSZuGilmTzBYXLFxkR0aDnbsueCktzPY1tekTIPJJ+VMPUQ5ZoAQzdf
 klQopZLUjLIFNIEXqpbFNDlAatpPCu+6B874IYahPpeWgwnYjHc+e5V4bV6HieuzpLUeaCR74HA
 9RNRByYYmQeswkhgyNRXyVW2VJB9zHgzwuMj0oxUldHlwUHt7Vwe6dNNQmOVSUvFGpPeoVeUc+F
 9lBG93u+l5jigXaVgy889MNSoPiXx5lqE0a6mRVZjJJVfsHBqJ3zS7DO7gAe33wR2tUlQud8VpJ
 /2EemjtTme8tYeIqiTOXMjJo7Y7+4+PqyuiRm0MGz37bNdH4hNDdKdiodd9RXMP96YmCcNOeAhU
 JKWz3ok103oEC8K8zW3PZK2U6Y24PwjbHO1SQ0/CLOKvW838EiIfcdG6cRlGVNVduMDVCVqr6vE
 +RdL35kYfEFCfDS/Nk25RzNX0jcPbv7CJToPzPQPKmgOB5A2u4nVSCVoGSzieGiS0tBjUqbmoHC
 E6Nb1+4N6lomuBP2EDI8K+1yZPxQyk+YN8qzoUB+n1pFDdPhDage7kpOs5oFzFQJPENz7FsmIf4
 N7+qq4E4LG++gNINZT8LZIvegakh5Mo27v/VEi642lriEpv/1X8CfguOqU7+feQ44CAX7Yyw5nv
 ByfHyU66S7Ge4sw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

mfd_cells array should generally be const and there does not seem to be
anything against it for the axp313 and axp717.

Constify the mfd_cells array for the axp313 and axp717 to be consitent
with the other supported chips

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index c8aeebd01bbc..2bbe73afff43 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1123,7 +1123,7 @@ static const struct mfd_cell axp152_cells[] = {
 	},
 };
 
-static struct mfd_cell axp313a_cells[] = {
+static const struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
@@ -1133,7 +1133,7 @@ static const struct mfd_cell axp318_cells[] = {
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 };
 
-static struct mfd_cell axp717_cells[] = {
+static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
 	MFD_CELL_OF("axp717-adc",

-- 
2.47.3

