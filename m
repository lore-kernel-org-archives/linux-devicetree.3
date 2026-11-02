Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626854;
	b=ym1oem0QzSge3NVs4RHV85NBqRaCE81NEleFCg3i8cgMGrwO3r1b+TFZkEhcXkF5Y83e
	 vhPI/NzugR7fU83crWgKfSpYOd+If9w1SrqL5OGfKqfkJNXlm20kvFB1CZzF05CsycXQV
	 B25wPTFhc7lNpzBl2wj0PUmAMhiT52p79bVqZZcCSR2ckzecdopJ1Zf+MAXRgvbBJX4oT
	 l28n176qu7HMh+436Hwouxxef4y/+YprbD+nWQcIwJbCtrkxMVxa0SukaKjWIkdljuYsK
	 OyS5wdEOJW3qhh+GygzLNAO1LfKgCAFYvE+ymk7K5SXYFjj+5Sl3q2iu9wR54pr/9tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
	b=kzoxJETS69wnCpuFhCrMlDylZgzxty2srEKt96SIKu038AP1+gdmR+zmgRuXj3U/dMOg
	 o/qesR7Zk68EU1xntUaTEAp9AXpbVkkmEWrvWAkYRo9vIEYQHfmnemzw/MVEltHkBiKvE
	 /yC4OOen5nydpclL1vcYkUSVvXoLj2iljo+dzYiuk8aK1WsItslWwoTVnzTjtg0gZSfFa
	 Ebf7mXqD6vS6ZuJNHnj+Ay6fhFYpWwYndCpZg2ebLQtZelVaEg6VPM3t4a3zTObUzIWiT
	 BQb4i0QERHKLscto0/sKPpg2w7DNkcF5P9J6L9ABdGek0wo4FHejkt9Ds1Vku+xlt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6xD7XvN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2960A260A
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA2960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q6xD7XvN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19167085e9.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626853; x=1794231653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
        b=Q6xD7XvNzytBM4qyaicTSBR3zr8Da07RvUOzEBSs8b7PMXvjsoIaIlXo6uFJmLxSLd
         UXWMtnBboWfnX8lAsjRwK3Oa5yNUTQpnjp9kDekhun38Xd2M3zBGm7DHrde64fyX/66G
         FqwpCTtmsRe0T51nVojK2VMbu+Kv+7Ta2nEH+Y8WUCndRyUrCZ49hUB6DvvH3axKlYTp
         qvdAjalxITyK+X51gtof1gJbXiRDTB7fUz3pqhLDUBLOncsVd4xbqSuSlf4cO8nhIT5J
         v1XR46LqPkcAwuEW3Ss9VVzZkfMkg3Yd2MNKb8iNA2C3iy/MmwoxAE4e7Zx9vId24dbW
         gShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626853; x=1794231653;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up8MQ9r1m3V+JH2R7D4OF66kNdk3l8gmYgfzB1Td7Q0=;
        b=Z6GJoyWCU5u304UdrTcjB4N3amyqq/0mKoYYCzQWIuk5Lz/EOh4i5lzAGAFwCfh4Yw
         hfKzAe2GUx6QSRa5M+IWlaJDzD3060XzGmQ4/QkuUMD+LczWwz316DmhJfDDqUfCsFvA
         GdbBPpWePyDiAqXY3kChYEVFaZ7FmtZTK/e86QUNn1Fn8iQ5OfeLq0MAIH0la1wvbBdB
         rrxyALD7RmoBhCRhlOMpwehKjAS/XJh/3ExiM/r8pSuS5w8/T4ZphpFSKg/hqugjyqG4
         67ZPwC8jQZbpdW/25GQU3CH35nqmIoWPA1HnzsiO42yxfGz1Hskf1MObkYPdRIec79cn
         qU9g==
X-Gm-Message-State: AFq9FYJcKyrNfFOKioudAoeyxFMWz4gXfKyjUhuo61sAKNu9bgLk5NOm
	dMKVC7ytgwwhF0A2Hurb/IK4mrD5uzoRPSrCV9YUoepW3DzmHX7KPl7j/bg7G49wZwk=
X-Gm-Gg: AYBFou2M1972oreeRqYmZ50o8kI5qn2K53T1xhS1T5G+eZwDaamDjHdzbWq1i4KByay
	4Z+mBSzJCFo98Z3PX3O0UuK5cvBksfOsKZSy4ZOJK3zjs34NI1cHlXAbSZQSnlgTwm6vSxyWwVy
	4RKQ9mNKwwC/9y6qI1DPBRdazYdeSMgWNC2mpA2xpu6/eGI9AYNeTDhH5/4m6PVKkF0wnRr2SPC
	nkUtcGsTebC667qunpUgTdIEM7qfnJTScIYw24LMLOuYUir1WVNzaMNbX8e1PirRRMn3gPDxvgn
	yU+EL2NVIAylsoPESApUPivraSJ/0K9kzV5Zd189IZqqtH+udUhxQuJLXZGdMF1l/UjUeiQ8f6C
	DFvhXYhGKX0uKYLfJ+HMrWOr1LEsyLPReOyB+DjJQffHjeBnP8jwOIheLEHzdgN9F/oscgMEocI
	Mc/juavyuYx9KDmkFnd/wlrBML5iKgYTSk+nKwzTkLUmT3wiwHjduBfJvRWJyFiP4dex5u+Qwr1
	y9jgXkMyiziZ37PeFpEM5A25gazViPVSlmzJCnzUGXcNNDIxH++Z+J20r1LCiP7d39z59ILSO8o
	ZBFJbj6LEiITUHq2Mkha6Z5CyMcKk4T9JVNlBGRR2ThDuou4GxUk9vjii2vEdP+59G06MIs=
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr237096875e9.8.1793626852420;
        Mon, 02 Nov 2026 05:40:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>, 
 Han Gao <gaohan@iscas.ac.cn>
In-Reply-To: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
Subject: Re: [PATCH 0/4] drm/panel: ili9881c: add support for Mingjun
 MJ070BI30IA2
Message-Id: <179362684913.3310106.12917918779608270334.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Fri, 30 Oct 2026 13:44:11 +0800, Icenowy Zheng wrote:
> Mingjun MJ070BI30IA2 is a LCD panel used by the Lichee Console 4A
> device, with a initialization sequence matching other ILI9881C
> sequences.
> 
> In addition to the normal binding + sequence panel adding part, this
> patchset contains one extra patch trying to address a hardware quirk of
> Lichee Console 4A -- the panel could never be really powered off /
> reseted in hardware (the reset pin isn't wired to the mainboard, and the
> panel is powered with a always-on regulator).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: add Shenzhen Mingjun Optoelectronics
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f423a211f99ca820c2c99a84a3418aa505d6dd02
[2/4] dt-bindings: ili9881c: add compatible string for Mingjun MJ070BI30IA2
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ea74b623855291e60835c0f7fa7a29673332ad41
[3/4] drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
      (no commit info)
[4/4] drm/panel: ilitek-ili9881c: do a soft reset in unprepare callback
      (no commit info)

-- 
Neil

