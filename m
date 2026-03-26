Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC63BA24F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515760; cv=none; b=oEfysH0Y0RaIlVMs6tVyTkJkTlt0ItKPDqQOKmg7KM1l6V/gQBdhTBjfQQewXmYC0irSeJKbcuuzvPvOKLDZkMUyg2bUQDrq0ogjRD5DlfwWcIyAoGtC7HP3sGsbD6W4bohSFRbJtzd4bVyHovtYGfadNvw7Nq87soTbr7J+nME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515760; c=relaxed/simple;
	bh=bUK5WfVJ1QZXMM11/xn4MTw8mxSh31cYqEaq0Ns0sSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nimDX3y4TjuNWhUWZ/iZyf7J2bqlBWvQ4hfkKc3A8Q3v7RFGfPnSMkOpRs5S6ZidSpAQUx65sy85p9F7UkobsNUp+/u1rJuhGOWg0QT2SqpgSJw9oilCQ+dD9w9iybs5TgvigHvOvonw9UIEqu46ZuB9opYzrBPuKnaSSDIQZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z1ROGqk7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1ROGqk7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so641601f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515757; x=1775120557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBXr8aiIFTUZuAj4juafQ6eTiNge5AijolF1/+250O8=;
        b=Z1ROGqk7KEwCQuXEOd6OBVO86QRrWNcsbDjX+fwq5M0yMuhhqA3fiMnnk9Mm+dh6aG
         ZdffUqrYznWTjuEwY4iQEXiZ+N/0BVLfa+xsL/1Z1gxcxu/enTIyMzuOSP0BB5Cjjk3X
         FWPBliJg9Tbs/c+B7xLSQ6vbMYu9LmlyLfOflLDdXOjoYkfbjCVjS4lgjVmWUiGBvSEo
         Bwu7fvkTcezV8oQ4NARikqPJRdtpCwNKtnBdd096no7wpfdPrFx9jE5w8sHJs6TJ/nlR
         6niz2vF/USrS68x8cOaGeQkkunPZFYhPZe0CkjTnrf7ktcxmtwcnyywHq8XxBWHvQpaR
         gupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515757; x=1775120557;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBXr8aiIFTUZuAj4juafQ6eTiNge5AijolF1/+250O8=;
        b=BqbufMvdTH5QPLXl+BLRdEcJuNUmZkRJUjWLcR7GAbV3qow6u7S9+mzrXjifYw+elC
         beHkkA+gx1pIj/bVhMZXUk5AFbNykZbR5mRzwdcszB/UKA4ii7fBTFzJ8DJXMzwJ8xDc
         Yoebqgun6s/TqZs7dHz4LcHG4PN3vHQiZMcck/ZhP4fvMjkzk67KxvI48rkwOAbsjFIP
         0HiTnJzo9rzkeJpqT6s2v/7OIeMSSJxq9e3PPUghzSob7Wmbbms9IA+rHaFbJjSr9DAL
         6+ERi2gYGagRUHZ0FNefnRnuzPSyP48zdtTzEUqa1QaiYJKobdRYrsYLa9SZrTPnlmwF
         O/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVAeu3oIlfghcc7pxIn6QIbVhG2WeCNrid8tGhvSegZgeC2Eb6Y8jPRMUK74dPu7lVJSKCqXuPT6ipt@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36Rae5DCgvlrxVXuHoktCnbspmGT3qoRlsZKj71cZRSNQpa21
	my5ykqbYo2DJQ4AgUfEpFPPIdv/jJ2oJV5w8c0XBqfIhmzFMmJWkxZuF9afyw2lk4ZY=
X-Gm-Gg: ATEYQzwSPg4hLvHuiARxtC6CgIqacZKANdKNyHDpbXiZqRb+KWyJ+lwvjHtORxY5NjQ
	OZRP1+AhQ6+iJPDtJd5ISBSkVoBf4JnB1diSZYOs7yREzzCgrL5JJpHsaxu/Z1mArc2Ts1A1w5K
	VEWIaRRuK8clVh1GyJJE3lNsE6OzJ3FBN4d/FL3a4AF+eyLkAH5uv3+trt9kMMHkvRrUR7p7XIb
	TNSed8fe+Ivw5UJzkK8Fuu2ApjnWI4GeOF7zYMsb8QcXH3paJBmC0kLOZ9kp08AH+CrUu2ASjXV
	CsXOppJRjU+vLVgnUnDvS6bq0C9Oq8TQ6w8CuFSWXUbPJJlRUE9rR+njlXj5/rfDciHb2rOWyex
	rG7Qu9cZslyBc5zTiHbDcrDuQyRFYt+CwKjEyqmTUW+PJ35mDRIqWQroqiII49nYbUJqHFsrB6A
	qQ+EJo5A0pi26fdE2BTEncYURM6wDBRgV0ckpWgWfcP6BV
X-Received: by 2002:a05:6000:4381:b0:43b:5672:f02 with SMTP id ffacd0b85a97d-43b88a21651mr9446438f8f.7.1774515757311;
        Thu, 26 Mar 2026 02:02:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
References: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add Tianma TM050RDH03 panel
Message-Id: <177451575633.103892.6447334115682861197.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:36 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Fri, 27 Feb 2026 17:31:34 +0800, Liu Ying wrote:
> This patch series adds Tianma Micro-electronics TM050RDH03 5.0" WVGA
> TFT LCD panel support.  The panel can connect with i.MX93 9x9 QSB board.
> The panel's data sheet[1] can be found with a random Google search.
> NXP website has a link[2] which contains a picture of the panel together
> with an adapter board to connect with the QSB board.
> 
> [1] www.jetone.com.tw/uploadfiles/327/datasheet/tianma/tianma-panel-tm050rdh03-41.pdf
> [2] www.nxp.com/design/design-center/development-boards-and-designs/parallel-lcd-display:TM050RDH03-41
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add Tianma TM050RDH03 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dfefca41a4d38e8ddba78176978d679d7af01ab7
[2/2] drm/panel: simple: Add Tianma TM050RDH03 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/310b05505cc346e091ea6ab0d2cab0663855500a

-- 
Neil

