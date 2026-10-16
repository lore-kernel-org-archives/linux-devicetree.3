Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16293396B76
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161690; cv=none; b=MRoDs55M11OLHG5ui3+8tCP8cAZCaZ4hzhmp+TFbX6l/U5mKDR7WjOeaki27FyYoZhAmaCyk62UVDPJiwrwbLCg/HPJUcIbhjHbEpq4cvOBY9AshM/YSB986hmJUnQgbrDBXow3zCb7FP+ybiFwZ0NmQeJ6R6yLXfzlMK1MHTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161690; c=relaxed/simple;
	bh=nesVO5b+FMOoHD3j2mKVeLRcR1Mo8Kg9GRD2c+fFh+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjlY7Ud7ApBuh5uq6VPjAhVkYGG020Y2RvEHns3PD1+/dhkYNPduroTTlZ6NPXLl7g5lGMhKRh97Hi/feTgybjlEMwfWsoa4VUlm4TyGu8jW3OUHiIB5qJKsZdHFfyrKsZ2Zqil2RaqR0aMezlawJuskZup+fU4Fc6MTPzAF914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5kGl67a; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5kGl67a"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e00eee27dso403897f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161686; x=1792766486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nKpbbRcagz/95Xy3I3HJP6MXZuF969V/i+8+al+dGw=;
        b=F5kGl67aJmD7/MqgHhft717hHD37i86ozhU0uhpHHy59Np+sp7Ll2jsO/09OZnRg2p
         qn3u8fH51Kd8kz1XPEfsVvWaYPaoD2RMrMrdlR45HDvlp0eylnzzQmVQW/E+be8zqtzB
         b/M6f4jWrOSS1RCfjbQqbdHC8XMEy1nXDkR27BlvdcDg4YgiwODQGOmG6OLVE+9U6cV7
         TtNB601/CWbBbFq5ul/SaMDCNQ0Hy6z6q5K9jEX05TQZLk1xP22Jcmnz8mQWykyusROE
         bcsIfnyCyb45q/ZJKekQXZrGZMdtkB/XdzKrpwmxDmQXQE1GK9HS/Uud9yB7DI+sBT2q
         KoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161686; x=1792766486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nKpbbRcagz/95Xy3I3HJP6MXZuF969V/i+8+al+dGw=;
        b=Y4XB78kURLQJ4eblW2SLmhKUUWSUOHkIYg6/UEQRbr4lBfKWneJeDemiyg0zTUEheL
         kB78WD7ddcMXcrMCr6VJ3hvkfpH64jZaMovD1NRzT5K+gJDWXzvDvQD47+o7EdyiK/NI
         bZEpHYgViTmY/iC4ULGXfEIqbMH61467EEjrZLMZQCflNrlPTLpdLHS8sW6M0oMaZU1W
         QOTBVrXTtU4BEReedDmI6R2zCFqH7g4mkOYAcTRsmXq8hnQpbl2bN1/6PTcsaKYwczmb
         Hu0GG0r0flvteWJpW7Bcsiqbwsx9ZhjCoCAMeM3BvAxcLeYD85K4hzPR+yZTp7P4iXu2
         IzYg==
X-Forwarded-Encrypted: i=1; AKwUvBzzKop15IDvzcoo8a/lvBAEp6PRs5HHRxmDKKigx6tdZ88CTKm2A/F5eOTWDKy2zqYIAlKQIaNfsPyI@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/jhqQp6+4vQZPnsy1fTGDlXvtTDbteWZo0/ftzpICJMVD2iVT
	P93IkrI0MdNk5EB019eeUxsFA8IIEJLBsgCmtpFeYcaOTutGF1Eu8XgnaLB7xeGBYdo=
X-Gm-Gg: AYBFou2kHrFUsEUJY2RlBNVYYG4uSeVIHr7y+W235c8xebpp0R5EUupashLMp4SzEKX
	ffpUddXUpwNJuPFpBDt3CwdjVuij3BQp40q9Jva32VTtzVFWhaxdcv2qoK1Pxi9BWRItk15y7t2
	W9tMED4Cjfy1UABbtuUni2NoLrBXHRPPCQbT5mhOvGNkeLIQa6f6HEQi9omDtxmNJ8vd7CvZzjD
	8UIyTHwvexk9LaUA9+a8Es4gSpnEMRq335D+tOF8dK0CBC2dvmGTTArrYPMiwFDBsOlp5mdmh2A
	xZS6GWBjbXc0tgE5vKRnisQFPgx5IYsmVcu942Kt6SIk+muCX18isBAJMhD37SBJzIiMLo9uJxT
	7WnFj6mvJiVruJ+pom3TlL8iV5iOVeqAnGXU1uwFIShq6PdGb+Q3ih4e90dSwqt+SLHKCeyrctI
	81q3wQzxdWhgZexaorm5+jL+kBcgWMEatSCqsVKFwytm5ctDnqfag6a4poG8CqQHmOwvbiUgUQS
	7f6rmpYRjRc87qw570Dr0j9ZHntiTCGIZ56iCmtZL78aJt8vrX4anF2VHk9bDLPPInFV0lTazmo
	bjhi
X-Received: by 2002:a05:6000:4310:b0:48d:ef7a:e59f with SMTP id ffacd0b85a97d-48def7ae6d3mr16320685f8f.17.1792161686279;
        Fri, 16 Oct 2026 07:41:26 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:25 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:19 +0200
Subject: [PATCH 04/10] ARM: dts: omap: dm816x: Fix pinctrl range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-4-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1218;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=v9YLfutCH496XMWZUUrGKakURi5WnlthJdHwA43Dlyc=;
 b=KmXjd5n+++ZyEda3KXujKTa1Z83U7uC/nkp9jH+tQZUgpwg9nc1vAtNIf1S5HgiRFvr4E1LHP
 r93ByMs+fqZAzTXD5QsHto+lcEIDxIip0Y7/KMFlxK6N+53Zi7rMIRQ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The range of addresses accessed for the pinctrl module needs to be
extended to take account of the fixing of the size of the pinctrl
register to be 32 bits instead of 16 bits. So in order to allow the
final pin control register the address range must end on a 32 bit
boundary, not a 16 bit one.

Fixes: 86800ffe84055 ("ARM: dts: omap: dm816x: Correct pinctrl register")

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index de4d48babf77..9c9d5e296e90 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -90,7 +90,7 @@ scrm: scrm@48140000 {
 
 			dm816x_pinmux: pinmux@800 {
 				compatible = "pinctrl-single";
-				reg = <0x800 0x50a>;
+				reg = <0x800 0x50c>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				#pinctrl-cells = <1>;

-- 
2.56.0

