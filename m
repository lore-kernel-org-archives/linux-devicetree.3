Received: from mail-qk2-f10.google.com (mail-qk2-f10.google.com [74.125.230.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9410A3C1D6C
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575100; cv=none; b=iJ8eUbLgZNDzh8dDJPBNuS7AVl+5X3B43W4u8iTIts5N8MGGQnrV2JpvFBWRh+Sq+qvytd6/2d30ohS0KzMzWU6zxEPZLxlBz7q+LjeOSeTIyAdwfxjKmeh7FrQGK2C/RPsqeo9/quEVvOvab3mNgIt8F/L8soC/dXch0RUwsEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575100; c=relaxed/simple;
	bh=6mQzJb6HQwk/MiupaE++x+vH8v5ByWD2TN9pKFcfIxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/O6LCY5+WlQjghUNuZxNPoOPHZ1VCmRJxXv2jKqPx8Hu0UFz2PeV8EkLYO57Lu8axG7CflgDF7aLHiz9QOzQYa8lKP1gz+Voy+SQyhTmFKam5Ab4YIaHvN1ZvWaIEbfCYIymqv5FnwF84sy7eNCfzyfjconpdyufjspxfKw7/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic1GyZJQ; arc=none smtp.client-ip=74.125.230.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic1GyZJQ"
Received: by mail-qk2-f10.google.com with SMTP id af79cd13be357-93e71a1ee3bso572885a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575090; x=1792179890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=ic1GyZJQ7vPj7sQ4ZlHdVRRNLG+u0PfXoSGCWDjz3CrzXEf9dlrjyXBq/1LYJX+/zb
         zzLviggvjYuYJf+s0BQOz9em9YdAPLpouHjCLgWbGv1Tsb2dXsAW3ylUWhQWP0d6Zfc4
         p8Q0J4Iz0txmZoqetn4Aqdm175sr1zJz0rQcWXImZwvX92AIe0dv2RmRKM+Ks+Cad0b7
         z/BocPvOtDImHC/c/v6N2mJ++7B6VjdmQbbb57Vq8qynNepJ1wWp5PaWwlSTm+dFRay5
         bHW3jwVhv/SLIqJ/bngXWvVtQz9YWKVzJ24kCpfcn8nLz5Gir2pfJOh9BFihY8mLBNnb
         DS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575090; x=1792179890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euHLhhJIoJOkj7GaOyOYBfCDgPoUg6f5MHX5Oe6p4Tw=;
        b=cf1CdMqMjmnGhX59sCrmxf8qwsZ1gAypP/jdVGtzt2jiAONBByY27v0rxS0vcbKSdD
         yyE7AgKiNHNeo4+nE9EFR1Tp5OMGFGnJ2K6MQG7p3q7ngkvJPlV4G01j720isp0Gyd1M
         okYIyne3RnFTt5hrHnlzGIPf68cMT3cWlE1ZUWvM+xHzPhXOaovDv+QjYyQZgPF5kuO+
         qZKOYTk16meR6sk1RV6WXiZtgChR5MEdm29aYwDv5ylQ2j4fHpWXZog6yVULlFVW2XsV
         CKeJcvqB6FRkRIiuKMWD+eAAc1myyAE+DIgo9wd5Sm0/+dp3ly1y/aKF5q4FhC/xVb0l
         FvGw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ2VRrvbtDNn+IT4PiYbFDeo+KeqTZD1UQnEC4ifBjsHv/tGLJ+rxh2vi4lFAqwNTtUHfOt+Wxeh91@vger.kernel.org
X-Gm-Message-State: AFuF++mzh/oWed17MO8Wcwtjx4EzhCvohp/51C1XPWF5BRPeBaK3cKxi
	V/1BhVAYwg1rubvZ6YreslB/mBBVhHRkAzjM4skaOzc38VGdyZslvAxt
X-Gm-Gg: AYBFou08suRwRhTbpju4A0mBvjBiC46dbj3gZRsMe565RLyEmyxRMZFMh0o6LD13Xit
	25wt+KB8getzfbVUSOcX+kUG+nHFpeR5EnfsOrQQp+pfxL8Z7jMwZiGiu0Hkj+noCE4MSsZfx4w
	Ef5ZxTP9GFefWavjXtWkHYc0hc8VLMnP93GaQF19s+ffBdzxevVqTxnpxjxGjLcc1AQKa3iutDw
	RY/PX926xbAenoSBMTkInaIWgZZyQgBnpU10JPnht4UZdxYWoRXe9J18wIIpjfFtgAtBxCHkZRh
	txLu81qDjNj9t4Kw2lGbAPK3/RkGarGnBFtFepHaKaA+YPX8gK1veTU5NZemKKw+B0CGDXiSjyJ
	BNDRXJBz64/3B9MTdmv3umsAg8IsVwcLFbYJyygUpbdB8plXZ+EjNknwHAnUHgHXDY4Ou3CnJna
	Ukcu5Cf5nl9xlmPQ0Sw/xeGp32c0WxQc/6/u5ciZN4E25nPyV4PFmHjztqoY94MDJTcmRS2zxCD
	DA9m99nuXc2xAUKbXW7pgm4z9R93pzoHq83MmTC2MfDGJJLxGFjLc2PlWWfMTbIKmaLS9dD8TU=
X-Received: by 2002:a05:620a:4114:b0:93e:c173:f692 with SMTP id af79cd13be357-93ec1740673mr344729485a.38.1791575090195;
        Fri, 09 Oct 2026 12:44:50 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:44 -0500
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8173: Mark the lowest CPU
 OPPs for suspend
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-2-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1277;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6mQzJb6HQwk/MiupaE++x+vH8v5ByWD2TN9pKFcfIxw=;
 b=gj/o9tBfq/u6ETFIfGltk7J8BWOdbJWMwl2Y6rCdaGMSFsSW0ix2W8xJy55yWtCQ3zXD6INIY
 13nPrTKxq5nAiEXuBKEl34WBlW0aJ9qkX1kzvEvLJvSkxByDdA/pOB5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Both clusters otherwise enter system sleep at whatever OPP the governor
last chose. On the Amazon Fire HD 10 (2017), entering suspend-to-RAM with
both clusters at their highest OPP measured 63.5 mA, against 52.0 mA
when they suspend at 507 MHz. Mark the 507 MHz OPP of each cluster, the
lowest in both tables, as the one to suspend at. mediatek-cpufreq uses
it for system sleep, and a kernel without that support ignores it.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..7f1af15cb934 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -56,6 +56,7 @@ cluster0_opp: opp-table-0 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <859000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;
@@ -93,6 +94,7 @@ cluster1_opp: opp-table-1 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <828000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;

-- 
2.55.0

