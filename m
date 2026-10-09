Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0C4FD7A7
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570727; cv=none; b=LbSsXgcUapdYEICfPLrWT/+QGqRudU8RGhAYke6vGykw35dlX4R2rY4HVNJlv2i6nkoMc2wcO5hJB+jALfQp/xFXUZsxSvO9aYXOeFhJHMjf1dXhoqKoO2XvkH/FHMSylyjj8I/PiLxmbeVClV9EJB9jFhbDVoH+dbiYgpwN0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570727; c=relaxed/simple;
	bh=LyDjS/8+V+if69g/8tSmRRGt/NJFu3rP46F002zZ4Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trzhksw2qX7PLUWfFTVIR/5hezRDuCgvMGWroy5OUYnjKw8qfwBfJ0scgCQBusBjjR16ClNRiUfd0bmnwK5BjVMj2UbWMb8xnr/yTMhO9l0Gbg6VhgTnTPNxJVzLl5fEIsnSs85HpPCgqSSHBSQnqGThRcjJdQlenUgf3nlGYoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bc0/u3Gx; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bc0/u3Gx"
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93c3dfd105eso455027085a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570716; x=1792175516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3TR1mx/d+lJPdCos6SlZvIHemcM3rDJJZi+7utetLY=;
        b=bc0/u3GxHfiZhcBjk++0zACLW2yFi0JL45fOEXlahYX6MKqxS6PXG4lNCB8TRamlxd
         9mWp9Z+ICqk3s/EmXo7bvxSG7bWxhuSAdRW/41lyD0YW81gIEwWhfEGdPPbAUl1U+co5
         MioDLXx1fsgqC4oi2hbNZzM0uaeMsMjixLcD+IeEFaovw4NgtbVOc2+l/EZ19L7siqcE
         ai0ZRenOfauZfk960i4C+R2NzwZ8mK4ozKmNjv4dNSMDT5t0G4AZozI5UG9EwLj8ktSA
         zjSX+U8aEYk7BKqaMh7KDIoGO/Y8oppHeec+9gsJ4O5XvdO6GxUTU0TackY9EoyKNQ3Z
         NWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570716; x=1792175516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3TR1mx/d+lJPdCos6SlZvIHemcM3rDJJZi+7utetLY=;
        b=mRU1U/FZM/KpXxihsb6l/dZcnU0dWvORgT5mFlIAw9nj1yBeq9pX3MxW6EWAtTMaaN
         VW/2jvuYtN4oTD1JFC3SeUy2lfFHtOUshU4BJL61eKveT6FZJSYRxRSCFd+lxaC1hhR2
         DCNs47IYbbAID7NdF3nCDhDf4+Gdmp7uFS/qkUKyi9sOKQm8Hqe3/h+Hgdd/2MWXbYFJ
         4G7r2VDq/3o6s3buI0SktmzuUmPgYCj9/mgeZFbGD+6FkbVz0Vklm1x9HtzcwE9j7yW5
         h3sjFL/yvdgnpG+v/6QCsZR5vCUvAPv1K3MYqszyG/odIck4+TlOp87Rh1Oel5OMBtaa
         Bhgw==
X-Forwarded-Encrypted: i=1; AKwUvBx0S1OeR15W+UWDKLdMBKvQg9moDWz9i6JMJKubgMELnEPQ9EJVglgnjVL/8cHogDsXew4hL70uUiOu@vger.kernel.org
X-Gm-Message-State: AFq9FYKxkCcneqGwhnDP0B9ltgVqs50czqH9O1GHIZpwmMb6ZbShbVnD
	DRbvL4nms01rVnvUkp+RR6Bwj/JO57nT5XVHB+5aHueeFXoSToubOpFM
X-Gm-Gg: AYBFou26qCRAcAP5lvo9XJAG+CRgNfbwmw8ggpApMq5D+04uoA1uwQu4/mKFhQIYO+L
	Af0fDbN7VYrQ28/CT3E/mU6nQwnzi28EpXSQc3PCe28UiFUw14Nx6YHuADh0lZhNUANN+W0Iad8
	78QdIfGhbptjVvipMeL2wYqJ5dXfnYb3FQXeS9a07XIyvH1axticNc1+DxmDQNQ+Glkb1SDvc8e
	wvC2gDsjOh9D4cTfqSBN00UQG2F33p+2ciXLjpngykPX47sP+vAE7ZwAx0UJbqG0N5MsVZDM1Xp
	37QfJldL9fGsqlGbwhh4/HkyZEjcHzORYG6V8IMN2xPszorcyHjYVfn7cUaIWWcXq/W0gNXTOAa
	mEqFO1mUfOZtUhonUpY22E+08A68AnBro1vd4a2Hv5P1mNGTmQi8YLD5+AstlHtsd2iLHJiLUAf
	t7KUlhqV5GbA4/t+mG8b817iWIdE9u458Bd59oTVA74GoXyi+daLZ38D19oSWpX9gGRj0978crm
	pbOv4I9Ymffo27WJt7izqS1QScx5Olkg2FMEBUy+uW2I51TB/3J6hIp+DyoHmZ431aUBn+XGlE=
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6a with SMTP id af79cd13be357-93ec12c9ec2mr324347685a.69.1791570716065;
        Fri, 09 Oct 2026 11:31:56 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:55 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 13:31:47 -0500
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: Mark the lowest CPU OPPs
 for suspend
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-2-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1226;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LyDjS/8+V+if69g/8tSmRRGt/NJFu3rP46F002zZ4Cs=;
 b=J47TQSnGOTnk7vsmC3v8Kas19C3nd1y/Zu6+lW8xPqNDlmOqarof7ubUNN1IzHNMZfvh7R48y
 usvOVSj7ssJB5+xrCWh60GlbUy9459bvWBzwCVFOTeRmefrkRGhAbr5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Both clusters otherwise enter system sleep at whatever OPP the governor
last chose. On the Amazon Fire HD 10 (2017), entering suspend-to-RAM with
both clusters at their highest OPP measured 63.5 mA, against 52.0 mA
when they suspend at 507 MHz. Mark the 507 MHz OPP of each cluster, the
lowest in both tables, as the one to suspend at. mediatek-cpufreq uses
it for system sleep, and a kernel without that support ignores it.

Assisted-by: LLM
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

