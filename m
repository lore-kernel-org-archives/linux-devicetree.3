Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D954B66F1
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564380; cv=none; b=CFkXNpjyU5PfrI45wC51sb1ySwBnyIrGIrvA9TMcIBt7T9NXFWHYTsCUAZj1B9S9AnNmKQLCXyEo4UONuTc8f2QAdFvJ142aWtfz3xqEJ8KXaIHdhp6TcoDFiNvnV/4bj7Nc736iJwXAiv/mCGINc0wLcw9aviJ6ynQnwBMsNuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564380; c=relaxed/simple;
	bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5EKqk5hURKriwkd4lNVRxGKFvRJa4xU99wTTA0ZIPx7aNw+9J9XG5dRLhMBSG+TST29MaHo4vwHgB19FHC2rY6I1pMTvM+YblXDWvuvxcdxPjl16kXUmtKdgbjiX9zNrV5quL2HSMkSkcIPteN+Xbi201lgOnrKJQw3+c9UTLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUjOZt4T; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUjOZt4T"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a810so70880a12.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789564379; x=1790169179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=AUjOZt4TpQMfheZN5OUULN3BgYd+gWwo58iOQKiYPCRGKxlfuucHW9uhW3FhGC7ZVX
         g9FXAcvf0bYixDSUxhFTyDbsTEJFo5ZU5s8SJWsKjAjBeGDmCF7W0VM1wcQQm4D80yKn
         z4I4MzUMIup/YdHNvina5HG/AiosYZKT6fOa7OPP9BsiDwTsAnz+6NGk3YGjROWh35lp
         GakXiaCiyP8ysD4te/tOkM/xWSfPuuu0ey81S4SfC8XfGKm08k5qW467yS6Zy2WiFZVL
         /M/JMFYcC6c49XEqa5Lcc8IpP00snQW8t5OVFGWcHzW2/MQuFVbF0xOHys5td7fe6CbH
         x/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564379; x=1790169179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8SlgHAeovTDqk6LwNJJCxL6zYMCFEkGRKFkqjjE0U=;
        b=sfLWi+UQ7wewRzcjPLTpytvyzR6+Dl6VfKZnxl+D5N+GTme7Ci9doT0RK2V7srK2id
         THvoIxevQhgpHowz7+giOd71XTTQEVhfe2Wrtoq11r2TaLvBeJMsTfCWQVZrT36SOU6Q
         QRMrFmxD5BHEfnUOWXxL8wYpTGDBmdVPfWRFGlN6UTJdc4Kjyd1/AbuZEM0b56TDYZyQ
         AxkEu9FJXCm9zP6A9rYJ6g9p1G5mi4qQjUQ67iKhPnQv87VaMr3xNC1F2eZnLqmhbp62
         2JhYo89tpfvVNhTIXco5tH0iE6QF/6TzxVj6QJosnQF+4OVtKHAg4fLVvMqsLZ67zNfQ
         9cuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJAOJbihINBWgeUrs6pdtQdv6boezXloi/B54lH+lW4bD72d2bIFSEDqDjnzlnZyDvceR4OlDxuF/I@vger.kernel.org
X-Gm-Message-State: AFuF++m9kdovES1rGGl41VSE4YK76YXk5U7UOcQsrXNvpoVNRxyZRvvc
	QTg+8HugPEKXDl5HG7aqKq/m+ILJ4sk6d7zKwAzHordkThUG0QmsKMQb
X-Gm-Gg: AYBFou0XNrX95GmJ6nvMKExgwCyRN8E+u6PbIrNYwwQ4yoJotyDjE4wnIg9hxOm5Zpz
	E0xjgmtI/7UUTHZRiCbHt6xko5yMBgKeRFAMeyOTy/T78n238CW+YLKNYL7QOpxYnBO0L4OSR1Z
	xX+H3gvVctpNZ5rtnRClKpgaD1G/P/Tds1644u6BeE60h3Jw0wBtdtHp2xtu+TnCWjlhieKTBOr
	8Voytukg5rve9Z2GV7cLBCvI4pvVZJQw3p76c0LrKPm27DYiNxczZ9J8iX1bHedchHZekIt5SNQ
	mXEAyPeKuKuLeiCY0EEHaVQQRefArP5Sgw8T7L22micdO0q34f33LiGPO98MhAtt31YlpMGAIBX
	zBWQBJN2LfF+UKl2aMSMauJk4E/qgqFsjaiZWkuXEoHEBY61cLXMfJkbbe9DgKJpwvoLmtSmqGM
	ORZYZ+qGzZ0tJw0Fww2pIUrF6KRQ+Lx/yBXsghdJ1INN34b9fcH8RqxAsbDcxNICqZLMevzgD15
	CedvR9BrR3TH1NqEqRfkQ==
X-Received: by 2002:a17:90b:2703:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-39e1e4b2c56mr4218286a91.3.1789564378929;
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
Received: from [10.107.92.252] ([2409:40c2:5413:87f7:9fa7:eb18:a8e7:30a7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm9422972eec.14.2026.09.16.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:12:58 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Wed, 16 Sep 2026 18:41:26 +0530
Subject: [PATCH v2 1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source
 and GPIO hogs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-ti-tps6586x-v2-1-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
In-Reply-To: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789564321; l=1169;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=o+kUdx6oM4YKDVkr1OH5tjWm5SLV6fOsv8ZE8kTFeXU=;
 b=tpEvH9KHIwfTAC1OsUi5VlGNptqy0s24Wwu1XzlMVjI2obaXalmbeok/qLK/BloCX1pzhu24l
 n4BFew6fQmaDo3lR3iaTnzSxj6vIqAmT7b7+Sj4GzU/TxtejoEVXMtr
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Device tree validation throws warnings for the TPS65911 PMIC on Tegra
boards because wakeup-source and GPIO hog nodes are not documented in
the schema, even though the hardware supports them.

Add wakeup-source property and allow child nodes that match the "-hog"
pattern.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,tps65910.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
index f1a76f88fc0c..caff9dc0b2bb 100644
--- a/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,tps65910.yaml
@@ -37,6 +37,8 @@ properties:
 
   interrupt-controller: true
 
+  wakeup-source: true
+
   '#interrupt-cells':
     description: Specifies the IRQ number and flags
     const: 2
@@ -163,6 +165,12 @@ patternProperties:
         vcc7-supply: VRTC input.
         vccio-supply: VIO input.
 
+  "^.+-hog$":
+    type: object
+
+    required:
+      - gpio-hog
+
 required:
   - compatible
   - reg

-- 
2.55.0

