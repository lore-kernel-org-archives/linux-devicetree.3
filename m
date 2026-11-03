Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=ZgaNdFb5imokjyAK59n7sCZNkv8CXzMkrHz4MB33tKNoOdwY3M3r5ifX+yj4vGKokf9S
	 NYW8s6hVO3EBbTzRFtz0VmM300n7Xaa8U/6HsXPLnTIi+NnGMW34iHBN/CM6gY9amwVjy
	 twHnyAhv+SwCMWdNdmYF5goPlSIQlszmeAPlUrCEuC1Pw1TljLB/6foReRakVOn9BJJkH
	 ALCjv1edID7EOr9LdzbsYBpB7vVPW8ci8wR+WJZTA3UsrzJNzKMxpklMGWGVX1yUS0Epv
	 eFjoeqLRn7XADNCmpDdTsgZwJLXMIyeSryYnbBezF5BMiPiDum7NsvmpDX7F8Fo6oug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
	b=Smznj86gPGIwAt7eN3MWOTRqQ6Q5Qz4swYBXKi5JUQZNt9GeOhn9c4+KXUa/yLyYbCdx
	 V+BugBedZ1dFD1fOD6K9DVk3urA5RJP21RwJXtPYopSC/7uys8ud0pVCK+eOYXzeKIzl6
	 pc9DsHEFAaDejWgxeGQ9DDK2RJL5KBkOFPpEuuKF+OL4if4l+pOPuj8wHrAqdAsHrNq9C
	 jRIgfe2k6qzw/VQrf5EzNxPwmw0mOZO/U6OgYv7JXK/5ZHacj8wXAESTWtaV7o29UmESV
	 7OxKgOpl4YyfulsVZ/HIcLz9w8X3dkcXd/yTHB4FHoO/ygeIf/tUuwomrJIEaCA4hVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkb1MIIg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9117A606D831
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9117A606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qkb1MIIg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so41023965e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703927; x=1794308727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=qkb1MIIgmABsjc1rkpRsG9E3H0z6JGawO3d7CoBPCvVtpaFp7DwlA4g7tjZuXmm6TZ
         6jVpjmwuCEXBTioJ5JVTXL+mPIKjCcjThKNAGS2PrpSWn4kdsV9mI9HVJMazfT9oIuml
         XvcsyAfEDuD56wQQlpk0bO0cjsGBAWWdD152qP3OioKkpRgZ0aFBGiBcUl0AQbY69ODf
         LKKe3PucahQAdpf2CVVGbJ1WsaQE+3X4+Auisq2shVWsQQ65Mo2uVGhQZXCpAADdoirs
         iB/JnwiPa1Knx2XK0koCJolIv7kmnq2VnF5+3N7Ly1+2FRKe8pAMyVZKy8cjNNh8KujK
         +dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703927; x=1794308727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h5PxuAlAW6HHJw+w6VONBfKxYmNAlUHhklYCRR6Yodw=;
        b=lHZfdQ9wGYe5rIQ7Fu5k+U1Y5PGBQY80Sd5/S8Tn7VLWbPl3Pj1ZKiVIMKTWlJSjgU
         Y/5rioTHnXKoRDnzJpKVBekhuWrpSyFiyToF2HSk3RqzhKy8Ha9TsHzsP2MfHHFQsq6g
         8iPbB2bNC5FL57z+3wu9S3gAhiavYOHEcH7ydojFyUBIEPzCb6n+4hHIorrUKj9xBJMp
         bGfN7HiXyZ8RsoF5Vu3PU8EPHMHekwfEZDqeMwqg97AYDJlPQi1aOdKGnOsCZHsgzJbn
         uFg1Iw8yXg7ZqKUXluaTfT2dHsnEZzUys1Vql25BA47G24T0DkG4w01rWQdwpy7Ll4+g
         GkUg==
X-Forwarded-Encrypted: i=1; AKwUvBy2sQ4cqskymewzLuvDxQ7V6xeEY2AJh8olivIzRjFxfQx2fcr0rY6ux3vlbEquXJ/ocDSfLw/sYTZU@vger.kernel.org
X-Gm-Message-State: APuU4Z+xACXFrPoq39ODNLG7ygjxrmPmEH4XvuJJTuBNnZHSIlmmo4dv
	/Grn8/EbRydTP9a2cl7UxdxXyl3aO361FAtvI61n2Vmdq7gk6Oh3OU0A
X-Gm-Gg: AYBFou2PqkbUJzpsPz5rq1Xn5odMOGBmP3Lhsqa0hbNEh2Nt8YIboTdgMiJ+B/V/5iz
	+80IhewMjLbNEiebWwelZ1PbPRHfeHvjsGshTADSkAkqjpitZHMo0uzovNtzC7I96GLYWPmqiEn
	X80frGWDRrN5gX1qR03eorxzQhJ9wji/S1+U04Ok9ib60dHLIAHnMWAZi0zXaoUxqzWINB5DWJr
	SG+S01krGWMgrONUVNQ8Tax1zdYnbiqWFn1Dswd9GBGxL95eExvTnt/BWmUfWP8g9pOjdOmPBoV
	e6nCb1kpbMPMQe+vVJYQFqK7jcDIML314+xnGAv4lLrKNPV8Xt1XByU9XbstVA8h4aRWu6rGQ6d
	N8Cs6FPAjS/1c9iR3KdwL1UO/XjhjgQgmZYSzfN6fQd03wlxVFDzc8hvruLQ8WHNaLNZhkRSzC7
	TE4513QjMDxcvQNFWMQ4UkKczhGeha64EC8oWtZUyjM4HCBtWZzSQ1MXmSTJnPXvw6243xcfpg0
	eA/jXG/Ol7+cxGSH+OYsirTRaTEa+OPqarVtm/+oATdmSIRwXXeHDSnKsl5nRI8C1SUdPQnAW/c
	eIl7F171Tp9zq2518vwG2iVI9Vco4hJloylWM19wE3eWPIDl6JsHbrb/RuqQO5T6XkGEDEQwf5H
	YbxI3UHiSuFqh9K6VhhEFlZFDUqxSv2ZcTL1pIZ9D7UcIMg==
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4ac17b2cdc2mr290564575e9.27.1793703926851;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 2/4] dt-bindings: display: panel: ilitek,ili9488: make the port optional
Date: Tue,  3 Nov 2026 12:05:22 +0100
Message-ID: <20261103110524.2812831-3-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
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

The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
driver does not use a graph port. A port is only needed when the host
links its panel through the graph; other DSI hosts, such as the Allwinner
sun6i-a31-mipi-dsi one, link the child node and have no output port to
point at. The PinePhone panel is described that way on the same host,
without a port.

Keep the port allowed (panel-common) but no longer required, as for other
DSI panels such as ilitek,ili9881c.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
index ea7449273022..016a573893b7 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -32,7 +32,6 @@ required:
   - iovcc-supply
   - reset-gpios
   - backlight
-  - port
 
 unevaluatedProperties: false
 
-- 
2.43.0

