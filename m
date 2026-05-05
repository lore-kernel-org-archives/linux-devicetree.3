Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A433385A5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975521; cv=none; b=Iyzcl7jcZ63BcgG9yN2S89KVUho7GpV/+UXTQ55JgySRVpRHnYINXeemDx/hRT+RKV8b2B5txm7Bz8d+9kjanqtQA4CP85UQDNB6qjK5XqnbcYfve6Py1p006glAf+C0uLkqYxA8GJ0XshJsg6aOEFKSIaJXxb4j2hTn9BRj7qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975521; c=relaxed/simple;
	bh=INi+3eDK8rPLr3lDA9gd3zyk5ZNP9jI3IRZ35dlCDxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TMcB0Uat8wWm8JHouB53lLvLoQwUdbw12bAEoGsjVSXc2VhYrHOLUjZxTubKS4K4BvEwcSpU48KgSQiR4Mg4mB2NdXH0eQeaaYkvHAbzACKwWgfIKBLzqQC33jdfypRnA+Q0lBP6tLubCgU88yIiAfHZZtRF8XJrXVXgD4qm8qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APOABMRM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APOABMRM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so25700635e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777975518; x=1778580318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nbWgbtcXuwTErzUFQqplIJMzYF6bebd2YisTqpEd1Q=;
        b=APOABMRM+HJbV8DTQuZWR4iJ5j0okqYfWSeO+G5SyYKqnVN5dvV5QllifkE4zSjmUr
         fNNkwXwp3F4E/tvJeKUtQRm3bhtjVPG2pAZ5mtBl97kmQx9LV1bCN848jIDHu/DoL6V0
         uYd5cL5JsRhYsJTmtZ6A/8ZCP0xjBIEmQD487p4odhP1sHEx/iftPnOjr1OOYAoVVzdY
         75V7AJfQuiQ8HD/8QesvtljcJplpzNPulvKbRq9suZxlGlDrGO4Irw16EPLtoYcBMp14
         G3CbUFJCB0+WKDUyfdhAtDAoliDJVcSi1VzYQRXiauMRUdhQ87r0KVux+U4R70TXr9T4
         1fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975518; x=1778580318;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nbWgbtcXuwTErzUFQqplIJMzYF6bebd2YisTqpEd1Q=;
        b=Vo9TC9VGWsMLz1FlcLHLwlupC0VNXbsrGxglgPI1+fI3LbpdHGs9ppxsGY6dsDA8RS
         UF570aj/CquwhLp3W/6YASfRSVyCym05WKnPGZtjtB27iEBn+6LDNM37JO+o4ChL+wZ7
         6KpxlBTNvrehZHr3VT/5akhMKIqUEG89QyBHbULoXPcB/gchXt+Q42pcoUgcMOtJq2LX
         7A84Xcy/1fMp7pQhgPwK6w6Hmva6yaGo+7AEmquoSFbS9tk90ZghJcDq/YXx85nA216w
         3xm0WqYEOkl9xJYA1yz+Tnm7QOaSukh6XV0wdxmkzncR7Hjcq3gezUGU+9l5M61aq/np
         QcYw==
X-Forwarded-Encrypted: i=1; AFNElJ+J1Z2djUc8xOx2RcqblLNghLY4FLSYKONnRVsW2DCuNkEFz340dGE0kqxu+qFji1i9Y+tWpxizSDDe@vger.kernel.org
X-Gm-Message-State: AOJu0YwafGKhpUyG1d/Ef2pluZNoRGIbzXh8fTTXVHyo0gxrDT14DSjt
	xu69eQF/GcYyCXVe7yXCP7D9qenaa4BEPhXjRFdzTHKC+th6WLuAnor17ATZP9z+beo=
X-Gm-Gg: AeBDieuHln4drEcpWJdWh+/V1NPbo44Y6DohQ1GzKT5aGrIb40+09F+yAh12dv2IySg
	vmkagL5+rjjB949svMnivDv8VQweusooNYeRhTfc3LtsNf7cGQVA2z6lc7G3DQr7imV5ymrRTzs
	Mt8wpoqAR7N7RarkwS/7DgKa34PmyK7bCyA0fYQUHzs/8YuAf7mBKgkRS8TTLJnDXiBk4dFeHV+
	WxlmZBYBJjtfS1oevRmhvwns7GlFTIJajiOqwayJldM0wni3ztTBG0J7IpjqoxsayeflEF33sdI
	63O7Lg/lTtlDiKePU1R48wEJnRFr8e8qqREJ5uY4PiegzGN/Hl3IofoSy11UbxlUMoNQBa/wzK0
	9bNU7OugUTbqYaJQTDuYTddoEUePbibL2nC1bKg0KGV/mHJ4Vr27O1kpuapYRipblf02bufE/kN
	nE4iTCdKIR2Eq+jaANuRcgnoDUfgTtcaIjfVbJd5Sxz+N1z2VofgLGges=
X-Received: by 2002:a05:600c:a401:b0:48a:53ea:13e6 with SMTP id 5b1f17b1804b1-48d18cf5601mr31474315e9.25.1777975517675;
        Tue, 05 May 2026 03:05:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm381856295e9.4.2026.05.05.03.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:05:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@nabladev.com>
Cc: Kael D'Alcamo <dev@kael-k.io>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260422210806.80948-1-marex@nabladev.com>
References: <20260422210806.80948-1-marex@nabladev.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
Message-Id: <177797551670.290023.6200666868470005595.b4-ty@b4>
Date: Tue, 05 May 2026 12:05:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Wed, 22 Apr 2026 23:07:23 +0200, Marek Vasut wrote:
> Add "displaytech" vendor prefix for Displaytech Ltd. .

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add Displaytech Ltd.
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/42112cff8cb78ff6120983ba71bd14d52ce9dccd
[2/3] dt-bindings: display: simple: Document Displaytech DT050BTFT-PTS panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/852345e0a9f3b5fd9b1ff59dc5bafc14c81283e5
[3/3] drm/panel: simple: Add Displaytech DT050BTFT-PTS panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b70c6922072f20898d5d0ec7931afd2384e567e5

-- 
Neil

