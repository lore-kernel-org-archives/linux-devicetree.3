Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D147F3CC
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932593; cv=none; b=Mr+VbnzugklLz2HAx4UvZrTdVlXQuxcy3ox+HCUfEx9V48yxtjTnhGLi9jnhIu2mKNqyf3k410ud/sj1jebi/TQzEF61FN5bP8agoKxuGTQ+gzyR8ywQrjWAYpz1AetgH46JVBDeDprd0Ffbyu2wUbACP0MEfURv5cwlyCHAH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932593; c=relaxed/simple;
	bh=+nntUQFMA9ECBC0mOxhUiGIwsa46qGwVCDJJZvNWfwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BtGmqvhWMv/yDruZqamIR21htuypFTCCf2VeM980nlaguI/UkmMinHUqDEI2p2poC6oGts6aYAzGpXZO3nMTmFmYrSBh2tIqmPg8GxnDh609bDvRtT8qAX/AQ0xA2cQMnhraujnlR2z0eh52QVZLjT7Gx897W4QIb/rOynN8hNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWjlzvb3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWjlzvb3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a006d3fe83so23369525e9.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932590; x=1791537390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Es1ESAl2Bi9P2/UjIit9xvYINnvS6VIXIVgcZvDxiCM=;
        b=nWjlzvb3VsqllWhdfOhaZ3GMPTTzB9YXUlVvG8xCW42TbMt91pjuUUVXQJvaAEpAn9
         CXK3+P78xG51gFdcOuMC3pn4LfYwHuM63GH1Sjc+OufE445feiuZ8oqfMaIdw3qXZT7D
         z1JQd10Owwjz0bbm8t1HRK6ZCE6i2KnWx43R74ZiQ0Qvuh4DaPaWu/zKlwE1KO9ltgcA
         G+Xg2OIpxkZY7+CqAc6CQAd8HCTRW5zAb4Al2G8l9phn8uO9yGEhkPOxobZknzuc0V76
         y0i6aE/l5L7VXxMTfzbCaOR2J+97fKaa0HCQYq0NFzWNJH/Na6+h/bWtKM3J+QpYagtA
         6FZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932590; x=1791537390;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Es1ESAl2Bi9P2/UjIit9xvYINnvS6VIXIVgcZvDxiCM=;
        b=d9rKSv8XFwvpa0DsEyiTVrWBCnUTRNKVmjrke8ow+2MSUT1d7svVaB5bA/IDMxD8pC
         aLORNHgRHfnsXYgCqmffOKumqzaAg1P7BBOyzq0lOf5GmevhMfa1ZvVjt6zYfCN3Jh0z
         7aLZtvgQI4/yUWZ3u6pLG2Dnj44ZF0QwnXkVWbO38/00jBy+NC/X+/FATGejkfsKsueG
         2bC2FlihjQOBvJkaTZDXoaQkqtH8NGzNbwa+nxKqKNbhWtuSSJNFYWqZKPqF7uCCjLQG
         Pgh6J3I7IvRD2HFSub9vgxAvuH4GGBPDqPkRV8GoLJJQ5+SCS9MsZw21nxPxLhZnEiVG
         1Y1A==
X-Forwarded-Encrypted: i=1; AKwUvBwDo7wKooNiqp7u8XCMFeSjW7Xl/Wu9ri0QP/DvTZWXs2JpFRRwzAYdvZjI+6J4zasLFM8smtP4f/zl@vger.kernel.org
X-Gm-Message-State: AFuF++ndK7QsUxveKNjHsCktaGYR0rktZrqz5MsLHQFwxJgvem2/dtyg
	l0+0v1wqvn6x+wjM7PMDDtm3N0ztKvdNtWreQ/x7HUHTqh0LwzJJpW7tRQpRPyeBS6I=
X-Gm-Gg: AYBFou2L0VmEVgFMaHKKAcRB9tyMHNlMGPgKVFUlIUtnsXK0gIdprrb1DOcNHW63F65
	yctWUdsvGx3YGxYBcvHODID21e+7mWKaBzJ3kgOfpja7zh0MLn7zjO/86OiAU72PzgWq1AruHTE
	MqEB9lIm7sNtmgkMOo4L6dDHjL2imF5nuMo7OAf3VTEyr/5UzeTVTgbJsw0oSP3A4vbTHc/foHv
	ISQZNDDqIQ/1hUhlfws1egAcMVYLON8dpvc5pUuXXeilmZ+LR64KcU+CDLqvvopLzjgKVKfepUG
	54ntVq2mj3TEbCkT2enZ6/EbNyXCLRGYpURtmAhUezQYcWIFJqhxfLSHYbbDVUKEEdMxAQFNTza
	J5dsmXVxKZ9/VscdADhW8ZzZr6sVpObmyxHxWZvtjxFSRMDtEEKOfPpg2GEgYYu66tFze9cizhV
	igOpXbpT8kYt4YWEkCBu7oo9thiynW/XLzSCyGTBnCzDnZagBqZZd6zL7X90+PbA8wR4FxZROJ7
	AH8UZj/kt+8naZ9sKY=
X-Received: by 2002:a05:600c:5888:b0:49f:d742:97ea with SMTP id 5b1f17b1804b1-4a01eab3237mr86257095e9.0.1790932589833;
        Fri, 02 Oct 2026 02:16:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261001-asteroids-panel-support-v4-1-fb228194ad91@pm.me>
References: <20261001-asteroids-panel-support-v4-1-fb228194ad91@pm.me>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Document Raydium
 RM69220 DDIC
Message-Id: <179093258899.2282096.1855528319289622159.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:28 +0200
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

On Fri, 02 Oct 2026 01:51:41 +0000, Alexander Koskovich wrote:
> Document the Raydium RM69220 DDIC and the BOE BF068MWM-TD0 6.77"
> 1080x2392 AMOLED display panel used in the Nothing Phone (3a).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Document Raydium RM69220 DDIC
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dfb7ce7880264ec69579db6c309c00f6c788256a

-- 
Neil

