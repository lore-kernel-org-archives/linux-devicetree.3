Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729487;
	b=kDdmzPYUKsHzDOIH59zXXAMEDB7ih49RO0PMd+eSzlMkts+0fMmt9pwP936jHoowYqZO
	 bTc8kwUBEPlt1yhTksCS20RiDterJtxvQZTgp9Y5REzswCmwWmQ69tfSnlWBimq8cnukw
	 7dYhX1ILgklsNtjTuENf5WvYeRD6dz8oDQVpOacLdJSrfrlcowBh8BdLIga64oJwNJnme
	 4V2F3m8dYRHMq7sXp9Y41jwjjVURAw43Ta1eihYgfMKbfuSrh2T/IPFfpZVogJw9wlIzO
	 xDWRLZEGjnZLbyyYbQ2anIfZtcq8W+VyIUvj6AwjR5tIJJmznuxBDiYPB/VukCshxXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
	b=p9DfmSxrdIGIYacN8vNlWxC4JWe6bPLIgK6w0jyazIboEJwsLXElp6k8a80oU7ZLPK9e
	 mTISmCMm8KnPBXQPAEjlC/XzMXB3kg8eB4ekVP9yrnX8jfVbR5uL1VjKYskYL20gBY417
	 +jI5sn4wy9F4kTBPpb0iIUzyHgtRTpnf4QCBBEsyqBHxrkiyE4A+7cnJPGGjlq/ODufeV
	 zLj/axvDjslJPOso6PEvqhApG3kDyMT22aEuad7jR4SUPImD94V9y9Pv3RhhMSwjEkm7Z
	 JB74pUYghoiJBgBpF8RWzTksZ3EsV8jZNf+bZY4S7NDdxVtkqv2xVLoXxDMiC3BhGXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2fnCsf1;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082AF606A6B3
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 082AF606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z2fnCsf1
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-497614c95f0so4275670f8f.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729485; x=1796334285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=z2fnCsf1MrGS8du7uy74STXVZgP+RCUZ9Bg7j2mvA2sELRaOxBn3KwT4NACo4GD+1J
         8fBSwYBYTUfOAo6OcF9e6yDpZ0oIYegmk4r7+PzeTsSSRHQowcYXQ50ECbpTLpKFk7pe
         mAfunw9gJQUu5sVEig0wjOz+GkYTyf1EZdxS2oOVcF3WhnjwIjfK646ON/beuo4s5b6R
         Lzo4Cg+VBDfKVXdaB2LqLfck+TA8/kjbz/XH1/7prvda2A11GJH+q9QQ3rnECEDBu0Dv
         TMkr4IqNWa413wKd8Ct+qu73RQ4RODT+9hByV+JForhDr+wZEfmxT3zxFBcHL6+NR/Iw
         OQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729485; x=1796334285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=UMPGOSN5jVd/uXMcfcZbeI+O9CbriWQ43skBJKQ8O51ByIKSs9hInNp6ECb2pqNP+8
         STdUxNrY2SR1iH0Dx7fmuFO2Jw/r5fPeNrFSbRZBa00c/86s0xxU5vwAdWMJSNEPx2pt
         hcQak5rUPrRZwZ+EXb3Yp8HFGWW+NYGLMdX5ly8EBNo26c5Frhg/ZEtKvLPllqK5ANET
         hvygrnoU9gE6joZarLhwpG3vVxFBt8J08WjYjEpSSv2shb/+A/9zwtcJN83tMaVF+zfH
         0HKcv3whH33/ZI4eVLkMXlRi+9Aazz+BmVJPzNUFZK+KULir/lH3aOU7wpBIHkhHXSYj
         I6eA==
X-Forwarded-Encrypted: i=1; AL+hErHadiJ4B5rJjbtxZI29zvGNKThaPriyriogdQuVFiORcr2mMP4M3AtzCHYhqtJnQRuwcfrRpgTSTBER@vger.kernel.org
X-Gm-Message-State: APuU4Z/eLuZWQ0K0KfJpyni5hF0AE5kBRJkpbptN+qaaC/xGUSOYW4SD
	Uj5+31NCPPnmgtRbwM+ZNdUNFmNsCWaPLVR1Fa2VKwEpusEa5P1A0hbV
X-Gm-Gg: AZFdTZfSuL6TX0tweU0aHuLXnL9GPf/x8c5oYW6U1at1mdOjp+vYqFPpE7B8x/ZuZIl
	Er/l5eG76FlS4IP9YEL9YvHdaJY3xbRhUKv6obA0il9dyK6S46xQMDR9i0dn+JVdAudS19kUbjF
	r145egM4gUIlBoExCUjbhvnzXQUih8/HEgC0yh7hjAoY60df6vTDEYg3YDJzHeYdXOSg0V9zLlI
	5yazAWXhTGuvO3H1LrkMF90lF5sBT3jGWMCur5nh7ruSSMNJqFQffJTNouQDir3wTICpupEkKNm
	bvGdpPd2fnqkayTnzZDY2iVmpEOCCh80IU1xFVkil9yA4NeVDfxal7axOL+i9HaNyxPESS1dh7V
	Agf0RVANRSNbItAsCNX3IryS0tK9bOeZr1JUKQ2LXVbjgrILozhrW3gVngMr4O0O9zJtZgIp0IS
	xalN3sbQY9kqfCHnnFPJwYrr2Arl2vtTjtiyg75BijaF3V9oMJo7tGkwSbYPnxxhec4/W4iQWp9
	axEKxM4wcPPRLqL1LZWyw66VPC/tIOetsaEWb5JsdVhRHLIxfaCEDEczFySueu5xylc4aeSWfmL
	+ND/n3LGvbGHGhCBSruOGowim7dZ0nW4fWLmuiwcCCLc0dGbWb18kYne+OBaMGgkYZTDeexENp1
	aBEN2OyLvQFKDBq0Um3dXCyjyYzfhfkEckOtIf2mSqSdXIkij70AwhN3iDI3rk/up3hvCK3deod
	mLJUiIVksWfOrI3z31Vr6RDmQGHYt8lgVhNEdpiQvE2iJlF1Saq2KKsrC/gvH3Ndsgf4DvjlMaM
	I6mHNilJEhGksPQemTuxyBNu5Qg2ThETUCI9/azFg==
X-Received: by 2002:a05:6000:2b8e:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4abb55185b5mr27115538f8f.49.1795729485342;
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] drm/sun4i: tcon: Request LVDS reset as shared
Date: Thu, 26 Nov 2026 22:44:26 +0100
Message-ID: <20261126214433.3562326-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

H616, and other SoCs with the same die like T507, have one LVDS reset
line for both TCON LCDs. The TCON driver requests it exclusively, so the
second TCON LCD fails to get it with -EBUSY and the display pipeline
doesn't come up when both TCON LCDs are enabled.

Request the LVDS reset as shared. The driver only pulses it once in bind
with reset_control_reset(), which is fine for shared resets, since the
reset core triggers it only once.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 20740fa10ce8..77b6026bc895 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1170,8 +1170,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		 *
 		 * If the property is missing, just disable LVDS, and
 		 * print a warning.
+		 *
+		 * The reset is shared, since some SoCs have one LVDS reset
+		 * line for multiple TCONs.
 		 */
-		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+		tcon->lvds_rst = devm_reset_control_get_optional_shared(dev, "lvds");
 		if (IS_ERR(tcon->lvds_rst)) {
 			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(tcon->lvds_rst);
-- 
2.43.0

