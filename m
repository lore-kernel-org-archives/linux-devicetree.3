Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79F3FDBEA
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218966; cv=none; b=B9z9wfnSvwe2TRj0mNT/lEjv98b8FAdgUUAVwMEES4SDW+U+GvF4Fpcm/jzCPF15cWjEilXGofvPyv/Dr0Ut0wlRyNQmDvLkpkGFmwaRus+c0mi6AewH/3Nkv6DwaKYtQa7dfLgf0/Ze5ETTxjqptq021xGHDS/QNCuZMKEqUlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218966; c=relaxed/simple;
	bh=lvXJIYHg+Za7wwIfyKwrdptP8jCEhBX03Cv8tnpa48U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEMawoVElJqPjfcq4HMcnG1KXd/5jvd3xn4deJN1y6roV2G8oUZRcUOgjyzi/yKzq1npeiMEKr3zHtrIFua+TUoRtH+sUt9yR99x2SvEtcLOBNBKaYh/FIzvJrner8uahR++pskdxHOIqk5CsGb4RFBd73axm6Dv2jE4ZZh+W7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmSKwNBf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmSKwNBf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so17119905e9.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787218961; x=1787823761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=OmSKwNBfRXl3HffmJ3Zgtv9O9cXY9ahV1itKzw+q6P9mVQo0A5qpTlh1/xhuVPnzmu
         0uP8UTDiP5HtTjcXSlKWFQyFUE5Nwu+AtoX83t3dhSh17U+cSMFIp26wDdJz7asN8eDh
         kE+FtJD0mxIN1I4hQpwfwlGsfMQVW0oFAvQRxUhWVusgWrD9SUA9dQozJco8/nZllMiA
         qIfzaeNa9y1Gz5WPMPSGm8kyUNdke8z+Wwori8GsBhcrtNlNZpAns7UuP3MqNxJy9x3y
         xQ4jsWhy0v14jt29yau0Gp3WNFCoI48UFhqAduYzMp+qNV82r7hlGNfNyY3FzaypB5Mk
         XtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787218961; x=1787823761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pna/XzfqXxr5JhHe4C9RpqDZzth/Iq1szA4HTr9J/M4=;
        b=eHhVHwEjIJPV4s1dLMcDnjeV7rBfKIXLOJw1oXIDqP5Kdnycc+3zcMN1hlZGtOlXn2
         OdSaOR8SJTS4huuwiIFZcwlbBjHCBNgXeO+Bx1NNTpIQzE2GTXN6CfZ6x+qspjjGLH8D
         wH7SVquufBtqfCxGnHsxiyTXKtQ5Zm8mw3VcbrrqHPOsEnxULyXoF0+V0iQZ79IbWi/h
         4v+DplTtnM8dK7QFeM9EIUVmmFkTUogjSRuNt4/T/Ip+Kq2MuNJPOKY+mmw2FM/+pBOj
         lS9D+jv1SIaiFqlSvSgg5XhDSVq6RY+IjQZBiObN2DKpE45oO/EPatbYDCbgheAafWKS
         lHVg==
X-Forwarded-Encrypted: i=1; AHgh+RpXJJ8VDRoKMaiOjGKOcvqrKkltAkWpoNr2j1pW/Inxv6I65VisiAbQFRxYtxSnDtFv+iPm2JG9KqAz@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSTXij4l8+bR7nSaWqk+tnfjRhyWN2CV+Is0qVmaPX6ev3paA
	E9LmI/xqfv52QpHKCjxQTA/Eiiuj4mXKvT+XJ5J1qO2KRcodc6+ZQkSv
X-Gm-Gg: AR+sD11iHLg34z3COkCjw2449ZXpdOlA1pBKzKE/yglheuK2UDvMNfjNha/C9T+m4jZ
	spBxKWiBOXDU/Xvpy86C0Wo1jrdiJ+3q/kL2sDiFtTbmzMptgR3HbFUviziNFd/0v5mmPmTCtze
	XXysL2tIHc2lQ/MbSncwY2hG2PCrv8Sm8O420B34X+YwN6VpHgk3wO5mjUxxXt3ALpPDx3M5wTy
	A97BAk/z7wyKVbrLbrKKANQH+nzvdFzDHeaBEt3VRJ9OUEwYMqbabcws9MJpPCkPR1NiFfU9RYm
	xfA5qmokY/gIxu+EXawVZoYW1KNJjpe0GHqU4NVpgL5OZNP5h/RvHPVuAJx+S3q5aGhw7gRY4m8
	FWZHaXQj4hOY2qP9P0MikTGSR7wVxMSQS9H2MbqQlEfVLfiIFB3NkrfbOw/QX3L4cFzLisVMFMU
	FKW2BEITGMvUfvjSDzAgdas/nc+fvNSYizGQVrfVv6k3PPS9seI7Z7FOme/6gWLBVEKCXAszEDi
	EX+lortegYOQ+jccJRz8snt
X-Received: by 2002:a05:600d:19:b0:499:b4aa:3d70 with SMTP id 5b1f17b1804b1-499b4aa3dd7mr11458805e9.14.1787218960974;
        Thu, 20 Aug 2026 02:42:40 -0700 (PDT)
Received: from [127.0.1.1] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm11788090f8f.6.2026.08.20.02.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:42:40 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
Date: Thu, 20 Aug 2026 11:42:24 +0200
Subject: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add LeEco
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-next-patches-v2-1-7130d68183d9@gmail.com>
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
In-Reply-To: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Adam Skladowski <a39.skl@gmail.com>
X-Mailer: b4 0.15.2

Add vendor prefix for now dead ecosystem company LeEco

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 136681412501..dd0762d3334b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -947,6 +947,8 @@ patternProperties:
     description: Shenzen LC Technology Co., Ltd.
   "^leadtek,.*":
     description: Shenzhen Leadtek Technology Co., Ltd.
+  "^leeco,.*":
+    description: Leshi Holding Beijing.
   "^leez,.*":
     description: Leez
   "^lego,.*":

-- 
2.55.0

