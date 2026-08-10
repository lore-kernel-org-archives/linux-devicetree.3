Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934B40DB51
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375608; cv=none; b=ROVuIprCcwSS1dWNQELVL6sVyHzQomxClboYTLfAFfegq2A0Pbgd94R/tSaSDlQhnp2aq3EQi15p/5yNtC/HCUgxh1orq3EGnXCKp90MB4WdG+Xls4sTddcNZnuZR+n20c3nKMLr6E3DtAJmP8YSYHLPQFgN0+iIjMbkCjgxEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375608; c=relaxed/simple;
	bh=qojpEXZM1zqUcd4Hb1bZu7Wvi6ygJ+VZs++N+cOMmOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/tP8jYLR3rmkz+8k+rK0nD+oUz6uk88iB4ye449539uJUt2HIh8P8fOS9oBgXF44xDew9+q9L6gciaDa0Z5wIsid4GpS0wvkkiqJsETNwfRA4MnQA7kp1iZPid2KtSwShejzWxjAmixTYUAhv/cCXEmYEyi5h67Pu28wqVuel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCUH2meg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCUH2meg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1127164f8f.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375605; x=1786980405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8CIp/0d4M5gEc+Mi2m/WthSFXtXGevzphjUBHHQhGts=;
        b=QCUH2meg+Bw/U/bZQFOOBvv0YifsKLY2F4ZvbUsUBCV4QNzCUGbc0dJL/Yx8rXOB2u
         RLGqLqxFCVvlWw9++tWka6USfxAJvSYxac3A12W6BedVgia3qZDLWAXmCHQMWURmTxpK
         asAAYFCj4fQH50OJ5+87jOwCL92h2J231hYSs2l8v+EW3kjK8iy/OHOqcB0oUICbM9b0
         Tq9xGlsISPMRZjCrcbRC9IXmo2V7lfCOlQo+uS9y+iJRrp/Xj9/F3ea9tJj2vY61RDRh
         7mAxjum818tKJuhl43PhiQGOMdqQUsjnS68gaPlDd/3X9YMkIKaPeg8FJnOAqTtUFxJj
         pWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375605; x=1786980405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8CIp/0d4M5gEc+Mi2m/WthSFXtXGevzphjUBHHQhGts=;
        b=YHvPpllwkIpyXnz9IvuVdz27P8vtfkiHXw2+pRUx31fozd7AMWBP+DqtFZSaPcaE99
         wfJ3KhK6x2mgbh37ujBe0b4WZvB1ApZP9ildgCC/VhwYZ9yQ1rGpYvX4CGIxWWPjjvBK
         AsZZb5oNSh/MUESIZAyLnvl9vz4jTneh01+R/dGMzTwbj3yQz11xlY2+Dm1WPT3scQt7
         9Pw0+M8kEqhfc9BmZMEy9AoEB6i+jmiERg6sh1I6Xeo21+1lQbe/sUZSgRxlEknlPH7S
         F1wWXOrkRAO+2zVWw59xLu9ebk46htAzFRVrUoczew3SZtHP1kF/zMjbk6H6LwZDCQ1m
         sqow==
X-Forwarded-Encrypted: i=1; AHgh+RpmJEtLAV27qKUXDLj7lAYDRQhFlY+Hp5cqjmDO3pm+wyQuSkxijXsQu2vDcUgQVgiFjCjV7Kyrh8zk@vger.kernel.org
X-Gm-Message-State: AOJu0YzVy7GbvNdHSHVyAEIwb8eSIRZ/opnL059flIlbumGX9H+YQzzP
	KCH2ZrYsoUC0Algc11KMdOFbYrR6oP76ijepvVJSnjMZnMuD4NUeFi+n
X-Gm-Gg: AR+sD11yaydS4atUn82M7rnc49+reT8Cv98Wgd3C7Ddt38mq5b7PF0Y+9MR0w64ZNwr
	5TyCKIcN8TVvCXKosbiOsQI+/osYu5mQB5fBWEWu1aelPn+BpONKwJ2PlJ/lIpJ2oG3ahfXKsX0
	NQ5lQ3f1wm3JY7wUL8tJva8BP95A24q/kHjxO7pvrqWc9ca8De12CZH13ePYSSkrsHuoqmmmAf6
	gzvZGBcqaYwneXY3DrlcohhQ7ig8v+C34h4z6B4COyAcAPdl7AhlIZ2MRm8bUR/XPxS8TkoY/kF
	gUvfdcoeMAmC+lwzXnVbPE3iTIiIyxpSv/dqqF/gMJx+/KKm+Cv9OBSEaHuGOJqF0hSs3CsW2mm
	fa7aRi8zA68/hu7ETsxQVYSXzXRWHU01djYansuD6nz4vTLEZN27SeZk8CI8Oyj9dtGl/XKqPck
	WxbIspGEWHsASnRtutvvvM4Mhk/7vQutgesR36/Fuc797YVc0Joh9QjDvdlkuVv3ORjTIr1f9P2
	sIaMzAV+xzFqDm88952wQH7e/MC+SF41xXEbEnCAUX81z+8
X-Received: by 2002:a05:6000:29c3:b0:47f:fe45:e597 with SMTP id ffacd0b85a97d-481455c8dc6mr3299302f8f.3.1786375605322;
        Mon, 10 Aug 2026 08:26:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm34952469f8f.17.2026.08.10.08.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:26:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Jacques Nilo <jnilo@free.fr>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Gerhard Engleder <eg@keba.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: serial: 8250: Reorganize compatible to single enum
Date: Mon, 10 Aug 2026 17:26:33 +0200
Message-ID: <20260810152636.658955-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810152636.658955-1-ansuelsmth@gmail.com>
References: <20260810152636.658955-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of declaring each single compatible string with a const, move them
to a single enum and reorder them.

First put the generic ns one and then follow alphabetical order.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..039bd392f876 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -99,19 +99,20 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: ns8250
-      - const: ns16450
-      - const: ns16550
-      - const: ns16550a
-      - const: ns16850
-      - const: aspeed,ast2400-vuart
-      - const: aspeed,ast2500-vuart
-      - const: intel,xscale-uart
-      - const: mrvl,pxa-uart
-      - const: nuvoton,wpcm450-uart
-      - const: nuvoton,npcm750-uart
-      - const: nvidia,tegra20-uart
-      - const: nxp,lpc3220-uart
+      - enum:
+          - ns8250
+          - ns16450
+          - ns16550
+          - ns16550a
+          - ns16850
+          - aspeed,ast2400-vuart
+          - aspeed,ast2500-vuart
+          - intel,xscale-uart
+          - mrvl,pxa-uart
+          - nuvoton,npcm750-uart
+          - nuvoton,wpcm450-uart
+          - nvidia,tegra20-uart
+          - nxp,lpc3220-uart
       - items:
           - enum:
               - exar,xr16l2552
-- 
2.53.0

