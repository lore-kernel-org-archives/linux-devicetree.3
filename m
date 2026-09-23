Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16036D9EC
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154051; cv=none; b=CdiZhobxfDCGMexmUj6Rvsk7WXPcfq11/g57TfdWSxth34oh00uBMoJJ3cI7TfBhwcI4zZZfZJpkXXdswfeRfplt8ZAnnAeZIK5XI7vr/GvIYfaMWviC+elGU/oTn0TABMzkNkwJUUEZyxW7cygX0+tO/2ZyswytranI9LNA6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154051; c=relaxed/simple;
	bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9rFqskBL2UXfizYZXUXPdLI5rvwWQBWjOXchl5juiwh+hdYNTZqruN+Fxm0loHt1jzmhnG2J1nXn7szsA7dv0Lew4GGLnw/92g9XzgKtIY6/yI1QYBo5qWPKie6PpSsw7T+mJPgZMwSo3PutiTIRsIC073ty4B7n2lEIVmmt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmHTxM6N; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmHTxM6N"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b30c94so110850f8f.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154044; x=1790758844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=DmHTxM6NN5gNwGhjAByyJ5yPvK8n+kfdw3dXZ7BI0HB3GM3EIR/wFIBBcocOuOI+0U
         qbr5FhP5m81nua/tDx5zZC/nGtBV+JvEKnNA3ZN4Zj0uv5yIJswWqIPupJbwn+aE6x0x
         B5fxcYMCc7jzJN8BjhdI7Xiu9xUF6Zs7ZgSeovP3cTL1pNjkvIV2cnu4sYYGhdleaxQf
         GE0YCCrPxjCxxGN8l3Xhovj3+DyHKQ6uM3ppKbElYLFIA45cSEcru+YSGinnsVxSlk4f
         g2vMHdFF40yaa4C73DMm23Vfg/UmGnDe/LtsyZ6K8JPDoLoz9S0Kc9+0n3WEhjFuldUA
         nQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154044; x=1790758844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+jlf8HC0jzi0HPwewqu9aTCsp5Qe3C5F4r8ZihI4BA=;
        b=g7Z7GMhonkPsWpkKQKAMOcG1yN2EZM4iAuvRDhz0XE+rr2U5lC3kmdiqc8lz5BK3OJ
         WHnPSULilqWu8lOjvx0Zc1jqd18CGSjWZbj4CH858ec/6jX/rsX4LrD/b1PSqBNUeLYV
         CDn3GennBGbkMeTESGsbK3eEiMOR+209IS67DSWiW9xHFaFAstmaIibV390ibQhRjwts
         pEg3ja6L9fUWboT8wHbUIpYff+XHDnaOpBQYYazjrDq0b4e+tfh6g3HUm7Z+o1SdInai
         1j2VSpMNwy4LxZOpdhRK6rfET7WrhRjYuujjpdaLv+a8/8ARCVrd5SQVd2YtA//A6qQz
         QIGw==
X-Forwarded-Encrypted: i=1; AKwUvBxe7ZNUXOL5XImCAScX2/Mhai6DXwOPVpVVVCHuwrrJ5oBACQflAEOXu8J4KSN/4k93zlyTg60Oho9v@vger.kernel.org
X-Gm-Message-State: AFuF++k3PIpZ6lBKw76bOzIZbVkpMOTZZenE/rSj6idYdMxGjnJTdjkO
	qeS/5qpuSBx+CZaPrSlcCtJ+NMv7yAMEluVP5cocgg7qxXOhjsvSL7mJDZyaGg==
X-Gm-Gg: AYBFou1/R5DK/DvFwDrOyxI2weNpmF0GcX46JhF8lVtsEWhbJEG93I85IwHXIfVOnln
	q5Nl5a9hSEV7aYyUfV01gfthX1c86yejqeAal5z18DaUp1bAuhYFvWCFXfUwCPy8lDYgLGncSIF
	g13AtQ1Tkg7Z4thhiZxYw/kS83012UK0ECCyW04bco1H/aNTBQELmSva1nXX6LrXyY5c99hqqLL
	nLiW6Y08zsz7VDXo31fXEa1IhXKsRlVc0Lt5cQY7JgQ4SBG+xHG/2RQPQkPFykLcTJu/kT3UpyE
	wBYVDHWh07oEP2WtsiV8X2DZkXituTPFuzkrsRQw9D1kuRgCZ3uqyxO5zBfJICu9ZroKI2XPq59
	lSBEWqxdKuv+PPqDUh8KhyAcF+fZQyCJ57WYDNSKnhWvPUYSbdEKHhlPN0TdZWRNY4LJZTZlzCx
	A7wU5lDG00J4RDq33T1QsjnBWNCdsVl+s7RFboYKeVue+fXtsVtFZ2TfXpJuF7GaPXxtOX5w/BC
	PTR4on2rRMr+SQEwojkDShgpbwbDKAvTJsB+G1UxSSRaoEUkZ7LUFkwrqs+RgzchyN/cMvkvKff
	H4A=
X-Received: by 2002:a05:6000:4a17:b0:487:803:ba34 with SMTP id ffacd0b85a97d-488670c9e54mr2673656f8f.6.1790154044255;
        Wed, 23 Sep 2026 02:00:44 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688893a0sm5538990f8f.32.2026.09.23.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:43 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Wed, 23 Sep 2026 11:00:32 +0200
Message-ID: <20260923090033.16539-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721064115.64809-1-royalnet026@gmail.com>
References: <20260721064115.64809-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Heiko,

patches 1/4 (binding) and 2/4 (driver) of this series are queued in
the media tree (media-committers next, ee6a964dca65 and d667a3c4d003)
and are in linux-next. 3/4 and 4/4 both carry Reviewed-by from
Sebastian and Dmitry, and both still apply to your for-next (4/4 with
an offset).

Could you pick up 3/4 and 4/4, or would you rather wait for the
binding to reach mainline? I can resend them at that point if that is
easier.

An LLM assistant helped with these checks and with this mail.

Igor
