Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56136654F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789946; cv=none; b=V9tvGzmUA9JTYhUrigoa7xFPhQ22MJoVssQLqVpPhJitCZ7QI0Im8ZNXZGrY/HxqnqpsAvIoI/eKUbhYzU3mxm0/Uz7qQTYQO17K3ZO3TdvkSK6X/Uya2/1sE6HCIarWo0CBiOsP3Nq5H/rZ2s9B2bb0xxF+8DyfA9TU+kxOcW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789946; c=relaxed/simple;
	bh=P3ZmNxoUbI9OvNlf/NE0Ngqab/uhfNYGIV5T1StzbFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRFS36k5h6dk1fIvfTl90iWvj2XEWJMGicANC4qOD7KF1PToO6wccl9y8IVGOuwoJn0AStawu7rfDu27zkZpSlA+osOHTIXbThjsyoVCmrULyH16SUE5bts5QrmzpC2/FQAEcd3jGWaoimYq2QlqqVG+iTt6+kv4UjoSTboRoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieF0vnri; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieF0vnri"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so134726f8f.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789943; x=1792394743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=ieF0vnriqp4V0cCrIC4ahDChh0RsJEQkwhYtlkM01uCTOZY+uDfKz9nhFRolmutAtZ
         yl7VjPC/2ZnO0JiAcOvYzp4R9Z5ngYhQyRgkJ/k3uuMO0OSx2hxIBHEJKH6UAe4/pv58
         j/f+tCkGNnpZ/L8g1zpDb7FLvnwfNSwpxxxnmF71S3YVyx2oefiy6yGgVPObooLdW353
         9MOLuYnkeY+zACuuleFEf2s8xnFQYgSmF184mqkB/+NlEN9xalauMorKdwh/IkN3dIPs
         t0w2xXzIesg0RguIdNSG6GZW7Yakr0zIpXxeCFCDcPL+jcIUraCsy1bYNe32xqQ20zM8
         cPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789943; x=1792394743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0X2fplabp5QOh4xkFzr/FigCgPmHhH9f7OOGboLoAI=;
        b=N/XU7xN+y95+fZ1EOznwLqii+9eNJWsb6Cgzo6V/gXWSJ/uauulvfwRkU3KK9Z+RRN
         MRT0nU9z7Lhmv0V8X/Y4d8SWnnmqnnzA0JBjinGr1NLiI1WuySBizLoF3DZNSuljBV0O
         Hfkt4g60NevCHmbqDGqJnoWXYw+RTGl65RYwAc8lySeNECkJ0Nu++aEBx2DlwpHl1UCr
         UyCoi9ZRi0WlVkluj3DfnuzMQpA6uH9o4XRkmrwR2OWIPjGp1RFy1MJ47+wnkXdjmNI3
         S3/5Yl8FxGgvP02i9fjmTgOiCXpqjqnO4Q1MIB4ITjzzYMlVagtFZTWGn25nn07gSfOr
         LFMA==
X-Forwarded-Encrypted: i=1; AKwUvBzs+uWbX14FP1n/o9HgXCWqlMDz78luuAlHi2W17Xw0cp58JZQ1hUpsYOyd41vcaGe8EyrfDdWNwE/m@vger.kernel.org
X-Gm-Message-State: AFq9FYKFnLVlnkH5jpNT/3A6jeUiHZLiET1DCWegho3aTXd00m4aX7M7
	cnxAQVT7UPnkwLwau/NY1uia0ncfKdF8HRSOcBzOu9s2iQwaA7VkPaEtxQBnc+Hxr+U=
X-Gm-Gg: AYBFou2EgfuB7wwZQ1VYN96gdFEH24M9d0Bw8sYR6exy5mSOrXHXnDlNdzdWZW1u5Fh
	2ZW8RdqPB1DCMc5iwFCIxbKJt/vfaj+05mvcQ4SXkiHANE87u6sa2byfl+4cU7/UYwQdVt9BYO0
	Hp3EbBdWaFnbRZ04z9Kf94YOO6cCxKmeGxzKVMvGXSAJzCG2UWRa2wOQQV22doiRcyWJ4N7JM7T
	5sy0WmEPZUCKCD4ErLS1392JMyEwYfS/Yxi3fwfCwgOvCEBr0Mh9UihdlbxJKj33yhhTbMOJKI9
	QE0ybHXuykpehfSN0mLrQZOzSUbpbpK8yrlz5CIB/DnKg8dA+gux9kFFy70W4Q9Membrmg71k4u
	uldUj7O/Szxn0GNtlrfeUh9asAT3zyJ2M4pBcYvh0lvCgJo/A30BytUEnnqyP/P/IRO/R5PDPw9
	9v6ZKjwdKQkXCug3XVjEE1RW+YWwXD55+NLpBmbOmjSCNoaXAhQginDj94dG61s9LTq8mBCX9pT
	ZORn/jsMe92qPnsqzWkJso+v6aSkNlEwGnwiMNey5lAHdnlcGWJJOHok1RBfAUp
X-Received: by 2002:a5d:43c4:0:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48dbaae8e33mr12493470f8f.37.1791789942797;
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:42 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:23 -0300
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: Add the Toradex
 Apalis iMX6 VGA DAC bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-1-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1045;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=O9xo6x/Vsususv0Ua2eMzb6/yhBucutOa+18ozmEW8s=;
 b=37sR/q4rsvp8/0G2BU7g+IBhwPmrrzyaZ1/VxQrnHcJjiWbLbf2XnbzLTPJEjCxDGsQuZuSjh
 HbRJlB47ZlZCC13TAqoR4wM22Qy2GtPBeeyW86uPQBEWd2NKM0i3WS6
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Add a dedicated compatible for the bridge, since the generic
dumb-vga-dac doesn't describe a data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..a86231a4a908 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -37,6 +37,7 @@ properties:
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
+          - toradex,apalis-imx6-vga-dac
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports

-- 
2.43.0

