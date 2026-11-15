Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748947;
	b=I8b3x1jDvZDHXDIuMUJpI04XsbOTQBKZwXT8T1MYsJrvLHz9zIekdcwwx2Wk+61WYstD
	 yKafHh7lQ0EZHqGqS/I5ViUTsz/vcPOqrnt5yAu1kofqs+LWX0KoQt0TbzWwtStQjJShJ
	 tMBhTmK6SnInTCmCs8Qvf0iBchG+7maZQ8FLTu5B20OKZm5/uPLulINwKN5SX6SjBbE7l
	 4waNrjJ9Py4zwx+rbDuvOo6cjdXk4z4iv1vmwt8RxFLHP/Cyp3r+ZZDQuznlUJ7YKkACN
	 gf9ujbds4X9H7PBOe7KuOUYk5Or8ZqHXctxYF7rIqq1e565ix224CnAR15bqDwweyKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
	b=A63c2EFH5fbd2SCiOOSufANQXKGya6cmSpK32YhFFvp0Wdh8QjvP2t7u0c59VrdeFQPY
	 llLCdaT34goSqQ0wJ+aih284mOWFBwP8TVcfYeYMpd0Gs1DDZJ173oIURNo+wqHsAbJz+
	 IZAi9xCkgTYrAVOMXq83anfOF2nDzworOVTDAIR4IBWi3I2V1RjpLrUKyJQz58V0f4o7z
	 6OVKtGU2D2NZBpJFqiuQac8hQmS0FVlEh4GdL0QI9nIcVNEFgVPWkWrscbqNlViNgAPEt
	 AD3z3rVWTKKJjQF/ur4GvvlNsZZ+iLH88H3KayiDNpB5d0WHMLWVl5BcphIDBuTJHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzWQKClT;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD3606A889
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 13:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DDD3606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzWQKClT
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1878700f8f.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748945; x=1795353745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=kzWQKClTNl9bBl9YgC4CWWkOCluChdcX+XH5aOd2jppkv0+8Qw1/gGICPRGRLgjbw5
         w4JdGhk84gFeTlGsPfH0+5ZR2slnHfIR420yPrAAV1cGLV3MogVQ9mHaHGOPz56Sl4tm
         HIsXrI6+pAuhkCmScj3H8PFr7KlQlVddl8O9yuGoPN2KpR6sIq5hzbJ9/XF+wGcgmIIt
         i4Jnlm8yH67C+DgHTOeMd2WQudULzcirT3i2AGq2Txvkfbvrv+Ou1TYbeMCykQnL+e1R
         I00q/U0SN5tEZ8v6K+sDz3sLeI20g7lLgV5KHRo8qsDhOW400RQChE7M1Z1kRTeybvKj
         DmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748945; x=1795353745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=GIZSNztanmPfVf6q80uRY0UGt18Sa6G80jM67oniaXaYgTgMzp2j+iGlE1Tm+sGUWd
         TIkEpx3ZKyYFKeCid1EBWQIRK2al4+zZFkSS0YC6W+Fr857dVgCFgTWtGK/Z+V9zuJPB
         WGhkaNNXspjwLTNWkfEGmtfUyi+s5nDpLoO7LOpXk6lMMF5cUMsMsMs9EiCq1WjcnBor
         puSd1yIrXh1xuznjsMgDQ+yFDGQH2/nn71IVN/Y0g5ExQwB18Nl0rGpyh0V7P4YS/b6R
         hPR//NczwwmVNnNMeIhCK77vpeOJ9ufpMBWCwl7PXi4CJLYSjs2AAm7TO/RM15N5bkWN
         ZXHg==
X-Gm-Message-State: APuU4Z+ifumFS+e6Du9FZi2/VsXHV98qVAKg7/WRwGUAT+45+y+BLLQP
	npCig1Z0j2MvEQePppoad5iM6FWYj0NlKRnBNim7WKa+yWTBGUZJwDIa
X-Gm-Gg: AYBFou0CEok4OtWM9VKb6Y4AC+EmbCJjqzZwTdLclHc3/FUopfBXDvGdodnE0pC9nwf
	iDMjDvY/2Fufw+IyhEnupFsbmwNjvu4PjyldvccmL4A5wZZPydbYlHOwj5/Vvj/aAFbX98+xHJ1
	TD6tCf7Utw7kMuHTIid3cWTSzye2wXjYcvLQzmybNK4rO13ICWBP1CTr3hAq7aiRukMFVA55W82
	YvRifjVZKdh6ggSdbEwCKavQiNctyGfV+ofKc9zDx+f5yq6ATXS3JH9LLnmtvh3cb+akZK6EuYJ
	jzyUKB1LUbNS+HQx4wW8AO2XGmvCw8xhmtfaLdeymurAq6OcSTAdOyGNC5wPsnBApgANOdZTs1b
	7QZTgQO5pD4BHud+0DQ1sUWa6tUxS64B01hLFb2ftizQM7XxwCty/bc5eJXXmz8PrNsBIzYZGI0
	rXUn1i8443xstfqP8JwN51loRLlCOGKeRtB4g0BCHfXzW99jb48xinfO1AqM1dSICuOjdpd+cUa
	ZlRzIoY3vHJqCADPxh7kXB7a/oUu3jCkXE58GouJoHjjA7ina6O//gDxgRf5FLW9dGlQOsN/OON
	y5pMrqWsRSnv2FWHxH3jUY7edBcctIRlyQ6KaPMQzij76x7kXFxeuB8cajxdgSLBrnSDDeQN5HY
	5ip5L61FCoMycKQrq8+MWjT0EIzCZ9moMoRkk3qyrxRj3qhNDacAOiWT1HlAa54PbWdip9v/WGZ
	Cr02HFxk756B/cF/BVQV/O5yZ2ed/t7jZxIHcSHtrLTJYF7wi0rIzbbNeXUOajFhd6t/1oy/wfl
	Mk99JYXex8ZuqEa82ZINAs9HN77MuKS/HM=
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-49c6a645dd4mr18844055f8f.0.1794748945187;
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:24 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Sun, 15 Nov 2026 14:22:13 +0100
Message-ID: <20261115132215.289236-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index cbe88ee6a487..40c5c42b347e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0

