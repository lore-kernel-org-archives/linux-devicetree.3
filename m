Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764E391833
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786832625; cv=none; b=HILtmDwLosJU6s7hpnSSSTH3of3K+hgrDMSCZNRiRuVuVY7qhOVXUcozJhBhyA380j+fSnZc3iDASzFYWzf49hv6YXUzmk4uWpxkObQ/xc9Cw5k/7a+Jw/gHB0POvMlsjJI7piheDrE1fQn4vmuI1i0dJwGAD916JFym247oj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786832625; c=relaxed/simple;
	bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAl1gKoH/XJdO+488w9TvTjleXMNXVqWqr2xwS4Z7e06EWD/WhnlDWbkvaOX/QC12GosuqTJyDn/vLm978D8qMy3V0Ya1qikVSoopCFpf4uVCp7DQK1PzbQodrv4z/P8T2pbEPHCcBZY8EwfeeuPLbw24JRFHKDSo3Hd0350xgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9aYm7RL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9aYm7RL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cffd93cdedso3714485ad.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786832623; x=1787437423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=a9aYm7RLwBLFvh6zrFHvBawObJjSFmv2kh1qSvp/HPffgoQ5eND6gad5W1YPNcFbI0
         q5wiHKLzxQG/pPmST0ajtgdWGN50R4l8FnFa2o+E+h3xHvAjJtVhZdZR2bspEZSCyjvl
         7FxSRSqVc7IHwi0UAQ/92fPFUXgvS4eexjIv9ROzZFjcu16PFzkQuX6y85euOLa7Q3K2
         Dh6oLAO0PpQYZzLwxzsq0aiKIhD7aoFvyw5FMaiuRhOtRPFptp3v0qwB0GWO5Ms9HSi0
         8an7DwTmqI/HSM2B+QSLWnbmyAwaQvouYGvBwyBlYWnQx3GYzOyMz6A0KYkRLRLgK92C
         HWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786832623; x=1787437423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=ThFrNx8ds3ADIvJYhPyB6k2jgNBT5TI5sayBwG8kSHWTnY95IddBBL3HA1AQaCOA72
         li7XSoXZ2jxpmNKjv31EubPD1g1zCog810yov2JkMVTwIUGXG+sGtEoa29w1NrvRmZSo
         vQEqBrs2tzVAcWr/pktoqzg7G7ZsteLDjdm9ZdZn0TFoKu1HZFNnPj56KXYKX+0ft1sz
         hFwctM5BzBpC5rFFKuy3n0P6TBZl+N90vJvT0HQn3bvYqTDFQj7tK23C3VAB1MleN/ju
         n42sVdCwCPdlqcg5TWuPyxr44rjZ9d+rJdgKPnoS86NB33+52bx6sL8xk0j4yNCXncvZ
         4FNA==
X-Forwarded-Encrypted: i=1; AHgh+Rpy735N0k0erH1Pz//LQlPsf9vT1AGrSUnuLqR0da9MHHQ1T5JGDm+nv+jPNiho4pqcSVOM7Ffq99N/@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQmZRq4/axL0ISbZIj0zOaJqDKkq0Ipplaj1YUIxhSosaHJrX
	HpC3CcXHU9karpD5y+/5FGKr4tmnwL7AZD7ophY0f/MTmARyLeNhT5R7
X-Gm-Gg: AR+sD11LWm0JvgiWXfoaD75VRHWOsT+b/qObDkLDLfPpx2wsukEwdOFqUujqIRT18kW
	OzBv3TPYdUG16dcqQBfvCBexFewIo0BJ+uewE8IcWOL76c9mwH98w3V8Rsh/S+5JQ20j3QGojQC
	2Uj5FdGADnfKO+vVqS+GgSNYqgPOl6/LSO8aEzlOhq3vS/hiZMWowFGDUFZ1fQpZLhrY2tlVCYH
	lBzaQ7AQ9pWj5/rALnzEwq0290C+DoMg7SeRZnNtYWKuBcc523xemR9srg1zCBTnv+2krlv2NpS
	8c7Em3Yl0UV++9IfMIvoN862TdQZBOWdCs2CA0YYlax5nPx6wFXvOajBl9B0YYRcBO/wsR/y2+p
	jaJn2xO7PpUiYjWFZk8ZXEdrl2Z1Vg+3QytsBNS2+svr+Ac42Rk1idVbFcD7qwXa2/7SXsNbJdP
	c6F2Enw27it/1l56GhRVPRyKV99ijrOUp134NyprLOphOgcEspB56JUMmBhuzaORTNKz1qb90m
X-Received: by 2002:a17:90b:164b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-3933b95a6b0mr12111918a91.4.1786832623309;
        Sat, 15 Aug 2026 15:23:43 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm23418743c88.11.2026.08.15.15.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 15:23:42 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 03:53:06 +0530
Subject: [PATCH v2 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786832597; l=1081;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
 b=eUJRkOmM9J44+BfxeeQjWmUSj8QETnGffAkkYLH7eU1JaLePYeFUhG++B8x/TItTPVrbJlEGW
 T8gQz6jKExcA89Im/+SqtjNeqgU5QHhQ9J4N7XodfT1Ch/7uUzpmf4D
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0

