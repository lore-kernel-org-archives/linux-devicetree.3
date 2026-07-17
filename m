Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4223FE37A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301308; cv=none; b=pddsAeMd1PT3UpDuMO+GxHa7ZLOMKEnF74uYZ7YxKU+JVgUcR55O9pFXOkzLi01UnYO7BNdcipQNsIRrx77cj1yKlEVEldPXWjuk+KNLLnXclqdDx64l0Rq6yYwqEVn2y2vawPgrMCyHfc/t6g0pHxis0ifU8gyVw9JUpXl4zoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301308; c=relaxed/simple;
	bh=FU6qDeHF6G2wnG84JcolMJ3imCNMGWHDGr+KH2C0qSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ko9kLucxoocdVQbkDeHbHW9I7jdUaBlYYT6/QwrbS43LIEhQrMb7NffZqSgyo8DwxaSU9DbC8t1XnrgRiXeC1juA8D8GEMTq8SEQRFmXAjIaurn+Nmi8j48FzERLvuv4P8HWLALP8spgygEZkwlXf1+nfxB1p6SbzfTkEPHLHsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G546tyIY; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G546tyIY"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so9482421a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301305; x=1784906105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=G546tyIYoj7X12dyMOeaBrH+YPgyUMrKGCqpOunVxO5bsMAaunEa7mxyDQWX5MiYiP
         VememLIZHKhyYcrbrnIoXlD9XfTOe+9JwBznXHcwyi5tqyIJiPqBfTVXdsG1/lIh8zUg
         Z9taNV9w4F9ZG6dCb7L3qOSy+m4xEzjzd1Neac1Dfxb4McATfce02ffCJ5oHFak/d0w/
         yi4YzpwdzifD11ZzjQHw+ZN/VINC6ZkXjskjC0sUlp12355Dx30pwie1KzreC/vu/qa7
         /nZBxvThBZ/RLDK9w3q2IiOjCftqeSmWzVLohXgQIOBoUo1i5UXd9HPacJ1sJx3k1ZPB
         /KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301305; x=1784906105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=fHvkR4IUNZdYm83L2YIAkBTFjj5HJHRvEcVkdY/KlYJdL2ojwXHAv6xcO4n+/3Cqdi
         Ic8yxyQZ0P2IOHIVZJdHwRtnsAanSI9vwQhW24ROA0iZolBDDWnsqN0zgfyKDE8m/FZa
         uEwAN2FmGjYHZSBgEM0c7OaazZ88pcgog6DX0xg0gi4ekOOj3bfyE7aluNTYDMeCYVZA
         bHKsNA3b2/EuR0wRnQIDF8ketkUSTX/5FVaosh20F5uLEt2QL66J33RuEUEHBsO+k4Wz
         bJdY4DVg84LRBh/wDo4p7vbvu3VQhqrK1L6//IsLhJ84lcpMALkWltHpN7L+LS3+TOxx
         ZflQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp91cdKzKkuXbDjuWtdfJvd8Yr97s4sMslhERm6wg5TPWV6UtQH9ewS9/8TmAH5rmWntVw7CDOKDAnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzticzon2vy1tBrUQTO3ypyFlk1zsjyRWq1qXCSBUBF9zmYjsIL
	tKDINfQpUSGqEsi5plmoT3fiIEFbEL/y/8gJhEq9oDFNuq9MCNg2XBbK
X-Gm-Gg: AfdE7ckCe/D1nHmtTS2ENKGHjl9rCA4JTxg4dipVMbTzWZfQMQruRImLLKN8ZP5FecJ
	B6NOvQdSPcvrfw0/Urb6mMp2qqSOSm9kqmGSQnR/tFZwJHvhCqSljB8BZpYT3CYU/+b5y7aguwB
	jot/jrjo+chyw43aYC0qS4+cUXNiUsXpS+ATV0nU0FyLZQ/44IEcWCBXdzVqX77Or8tACetPkkg
	kJF49o9Dy/TpZ0fakhrXMLzIA+JS3L/6on4lP6JrEJQiKOH2ZMp9scWASAtZ5/PJVAl+fGn8VHe
	dbirLqTquudI09tYr73PhvOpAxAm2CNYIHuNqz3GWGkFi2pRRw9tD7fQmjxFSKPB5VBMjG+EwlM
	H9/iQC7gxwLMBFFHkpMhZXq4j5cU9VsqfYKHnzAC6MzUimuKmm+vUuDmwup2kQjoI0FAfsm970Q
	==
X-Received: by 2002:a05:6402:388c:b0:698:81d7:b822 with SMTP id 4fb4d7f45d1cf-69e652ed680mr1129854a12.22.1784301304599;
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Fri, 17 Jul 2026 17:11:10 +0200
Message-ID: <20260717151134.678839-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and their order is different
from mt6589. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0

