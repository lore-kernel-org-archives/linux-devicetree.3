Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490FE5A984F
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895250; cv=none; b=X9GLAQQQE+eRW+GObwKZsBvTYdLH9A7SI+t3Y+49TqlL4hPnoZxekvEGOqsHSulp00n+fvbLwYU28x9S73CdvN/lzD69GRot8KDX8K5v+uPyEyw7gD5mXUr9hUr8k80VTEPI9EfLAK05kx4NxN5R9xsWxWuBu1398KiTTUokQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895250; c=relaxed/simple;
	bh=jW/PXYbGXcOsgm/sewCquwvI8ml6GC9OlFuq8dt7Hy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jASms1/MsQqlENg5O+dQ8geha/VreO6J5UcEIVhrj4sGxiMNS3QOy91SYKl96QSoZfZe/avR617vlb/+9bSpBI11dE4IOtQnFVQ1hlUA31mJxjkvrAWb3j+9RmqRWNn73wL8EbIadEmlOnhujmXbQKWwjGJzH1fohOCVXpzHAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYQXQZJa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYQXQZJa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so39521555e9.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895246; x=1789500046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIYimkqxAApyl39451hRh+TFNEFHTBrpXx7umykIy6w=;
        b=dYQXQZJaFQC3VnABma6pOYmn4hGiB4oZkO/2UnaOhAALvHg+aICLcfJXZzc5QKvPsE
         N7x6DrzMZ44/XexUzEWD3Fz1nLU/Ksa6bHo+osXteHCpnn70mw7JcSIJhbZcWTdIc2M3
         7g3rrKw4KSJ/XYu36hww0jVHt0oi0RAGXnqAwZxhDWrzZYRcy26Bdzxtk7DKMudJGO5y
         5m+uGOLBFsLnI9GYFIsnlXoB6m22KvCx1i9+X68HtZH7uRElbYuNTiBvUJCv8GPNM6kI
         6t6E7gdid8bJ6//HXLEG7tX46iKW6DVFFntvisvLmxpFsRos1vIqWi2XiuTXeWlFUjvV
         uakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895246; x=1789500046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIYimkqxAApyl39451hRh+TFNEFHTBrpXx7umykIy6w=;
        b=nnsZ9+ZTJ4PTc9YzJXjgXuxaaZf/q5JiRNVMA/M4nOpGtbLiIJ0Ksizg53vq6QmqnM
         9RLc+rVdBw8iC71ZZU8PHbJeF307pwh0c+uNLIvK24hgqgR+tYPOs3lKbGDmoAn2qzjG
         AvpJ2DpFxxHab7jQU41zFM31HFmr/Ot/pXJEHqbaoRYyKIEzoRSDGeNYsfJvf3v54CwG
         z3uuTnYlsSC5tD1tGynKIkke9xD82KH5A0D8eciGFDld+KFBNHCOKD+QaOIF+2oPbuGm
         jGaQb5mjI5vmdWC+pXqXUhOY9bDEUhF5WP4mlxgZG1FSUYJKoNNqKpCAluEBNXxSH3TR
         ZM1g==
X-Forwarded-Encrypted: i=1; AKwUvBy+eCF0iFsExl3GjQsAeewd3cOFj80SK8O+xMv/FKBMsIw/vv9aislWsTF9ON/bZwf8vpO2+8JyTznl@vger.kernel.org
X-Gm-Message-State: AFuF++mZCQzJ3B6/Wc0dSeCiLjbVGOBTkNVBNTh8Js3cAjkXyMk1moCA
	Mx8q0UeOqbihAq0Vl2aQZAOllchS9dgNlAjBsxbHI+WOtq2Z59kuzmY6
X-Gm-Gg: AYBFou2amv2qv4Ljb8oOfm9vJ2yuuW83gY0GiCilHXAWHXn0u9C3bdzbmXV1+KB8otT
	T3RRVdAEGWIhvC+WHKxjeoiefUkSppsUPPSwkJvCW+jbdUjcBjPtFPUxAxT41IQBh79OHx4tBgw
	N5RPuidKf4RXBP/klBowF2rl0OYLSRGn6eXc+tqS3BbAzpkxuOB9QMpnH/QAbXjMiEWsuqdtKUh
	Uev++GgT7LoJBHUAerq5FYhXiaBjKknmkSkhzb1SPcIdRC/IK5Fa64t7O0WgeaRL/zb8m2p7Y1g
	v66ehpVowCiK/yRUMkT9DZQkHcxgWdwOr49gJLsaDEoIR8MWD0av8gRM1DU/8RJwsTdBw+HkF14
	mJMTcr5d8dWjaHFE7hrTU6T6aWg/pKXewqC49bsXgkOUGFRBGKR+lYYeJoZODQwqfmYNpY2PI9Q
	ApxooU/iVsFuz392w1RMn+AyY9Vbz39qLMbgRVlNtni9P3pF9gsSN6SsPYFS+vPtJDc5y+YsOtv
	d+aNwRVD1Rur1T9ZXXgzm76eE6E/HswVtez9PkHfduLtw3aib+H
X-Received: by 2002:a05:600c:548c:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cf8267dd3mr325897705e9.12.1788895246167;
        Tue, 08 Sep 2026 12:20:46 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm407885845e9.6.2026.09.08.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:20:45 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 0/2] iio: adc: ti-ads1015: Add support for label
Date: Tue,  8 Sep 2026 22:20:34 +0300
Message-ID: <20260908192036.8503-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch series intention is to add support for label sysfs attribute=0D
similar to other ADC devices for ti-ads1015. The patch series adds label=0D
property in the dt-binding and the needed functionality in the driver.=0D
=0D
Changes in v4:=0D
- Added this cover letter=0D
- Use Uper Case letters for "ADC" instead of "adc" in both commit messages=
=0D
and move static label assignment to probe as suggested by Andy Shevchenko.=
=0D
- Link to v3: https://lore.kernel.org/all/20260907152304.4992-1-flaviu.nist=
or@gmail.com/=0D
Changes in v3:=0D
- Return datasheet_name of the channel in user space if label is not presen=
t in dts. =0D
- Link to v2: https://lore.kernel.org/all/20260902172230.5234-2-flaviu.nist=
or@gmail.com/=0D
Changes in v2:=0D
- Implement changes suggested by Andy Shevchenko. =0D
- Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nist=
or@gmail.com/=0D
=0D
=0D
Flaviu Nistor (2):=0D
  iio: adc: ti-ads1015: Add support for label=0D
  dt-bindings: iio: adc: ti,ads1015: Add label property=0D
=0D
 .../bindings/iio/adc/ti,ads1015.yaml          |  6 ++++=0D
 drivers/iio/adc/ti-ads1015.c                  | 30 +++++++++++++++++++=0D
 2 files changed, 36 insertions(+)=0D
=0D
-- =0D
2.34.1=0D
=0D
