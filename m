Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88993F9F48
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491385; cv=none; b=AbSQnLzFnSQSbYNEJd+5UqKM+z0BU/dE2i1+1YLifIdJMwJhzbcmntZ2LVDlT1wqNU6b+iyUvSq7ZD/ER7le9EtDQ3HB7mnRx9pqu4dCByrL//ltJ0trG7SaUZ9l6xXQqESo51+T5dlvfezUpiygY0ExNgXDOXsIYzY6pE38Vdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491385; c=relaxed/simple;
	bh=MIG/8hLmHuma0CNnyl+85e+Hc/AR71sEQWPRNUZdWRw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=U8QOTzB0jM3nM1Ec/fFl/vPyc9Tzn95mELqk6FJ+ARC03pOspR1Bzv37ZpmlAJSMUXgLwxpNGxAy8XCojvxEev4rlYwvfgBzaqq6F3YRlxPAperotvsZ2k4SH8frzXQdc2IoUWzx4Rk//XMesJwEm1BYgcQQw5/rJXRihq7K/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rMdekB3o; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rMdekB3o"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 165E44E40970;
	Fri, 26 Jun 2026 16:29:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C329360232;
	Fri, 26 Jun 2026 16:29:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B26C3104C955F;
	Fri, 26 Jun 2026 18:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782491380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q0Ay+Nn4LPYfCIMIxKfuL34eMs2xRlO4A06aFPmJvUY=;
	b=rMdekB3octyzR3BlwL50+P4o3/w2gjcnOoiNdFe83N1UEw1jIJXEbmDaBSFBRZYQtMl+Nf
	mhjLkNZvDSHJS6BavFM59GiibovXVO20x1QrvJ+eyw3EUKDc9MiKtvw4oT3eFhjNWH6M+7
	isNZdGKxDn7W+yvM1xFsdWZLIndEvZaycDDFsuDo0DxFQ0PuHp5RVgXBQOXBkxsQTOGTzw
	np55BLuu9BYqC63ExvqsmJrQinu2uEQj4UGh259SbTm3eqs19aOSHOfYuOVSpQCLrvLiTi
	Ls7rxoycSWo5la/Y8tbktKm2dZ2HUiflyl5RVIvOMfloo/Z8oEYt9Qsx76w0Sw==
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] drm/dp: Add helper to validate DP lane counts
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com, 
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
 dianders@chromium.org, m.szyprowski@samsung.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260604085220.2862986-3-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
 <20260604085220.2862986-3-damon.ding@rock-chips.com>
Date: Fri, 26 Jun 2026 18:29:25 +0200
Message-Id: <178249136511.1374898.9104900523077961218.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 04 Jun 2026 16:52:18 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add a generic helper function drm_dp_lane_count_is_valid() to check
> if a DisplayPort lane count is valid. According to the DP specification,
> only 1, 2, or 4 lanes are supported.
> 
> This helper avoids duplicating DP lane count validation logic across
> individual DisplayPort drivers.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

