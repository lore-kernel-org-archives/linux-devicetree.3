Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20119C54E
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786582044; cv=none; b=X01T77p8TNvv8kl8fUgcfJ7IWgjfUGwJuqZI4fSqPbF38AI1fpe8dqKEwcocGueURfTHuKwWfWoN+Znak4Jd2Uhgg7xKgdVJBUJnA2+89MQwTsSJBC8hyTjg+5j9qfg+2M3pdW5FxXInG6tKHyR1GFvOS6Mv60qLJGaAB14mqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786582044; c=relaxed/simple;
	bh=nr0JbzfBqGevMUFWP5WeE8p+Mj3rdk2zYt8M2x9Q7UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbTlpjUuer7RWtzEBLpT+86UoVz8W5Ut4yNesPeLyKzBNB8EuVD4vjlfArRfil69CRBCUTMxijo/pso+HJv/visVtcy1WeQI/k5pB7IHzHfx7FyZeko1yHq7ujjGAlJyJ1c+d53TtaR44wiGoHfc3NVNuonNgvag587/pYq7lFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGV/t7bJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGV/t7bJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1739112a91.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786582042; x=1787186842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=tGV/t7bJ1m6xuT9Av+sWqexA+KMjlot80kyUJJqzedbilJiVR5C/sd2H0JCSYaEqUR
         O9LiJZXyT8wY+mDfw+l3Edwf1v7vdqqNXjsiBP2s0KhsnnO8giSDr3VXeY5hpTF21w6N
         6wgQbWxsDIBxEmswikLmylSjE2QTEtPYwOeUH0DuZ2fRVbxmHUW+UL1lm41PTRrhhI5+
         /SwOSZnzhvAEQG1LurT0hOOxFgUGqtree34gF70nf0ulpnMqml4PDLgTDipVKbFjz0PX
         XEY+2gLsMPLkaOC9tTVGDoAX8xrbvMCCGkC9PXu1pnfl+UAhM3wNW6KIM3bKraoM/gOa
         ZAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786582042; x=1787186842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=FVwMm3lRAIL0ALW9sbA4tsNGl5PlPHHwLsGZcuSbtG8aHgUbnnExGBQORCxgJB/D4v
         8cfXmFClnSIFhuBEQKSjtPxhHG+MURlhCTxWqMqyndckr33VGOMuNQP1WScjs26Y/+QP
         alDSJXqab+3HuqB/z7QPG23XNb6md9ExL1urjcZ7tchor6Zl1I8SkGYXz8vZVt5B34Vm
         7e2t0zkj+8Bhe0vPJRJS7mWrxmR9P9joz2KExPlHgdREN36sLfSlkoYppMrb+7nC2UuE
         GCJusYiRSU4hob5U9Bui0867xRH0rQIZL1mwd+jOLTUIZErlu1mvsOQQP+TM0NkJ/E5E
         VftA==
X-Forwarded-Encrypted: i=1; AHgh+RrsQsuU2gpWZYVSDeYURCk/uVVDJTHSf6sv5LRMVixQI5ja8C9g5bbwzH/Zl1pDygncqhDZTnYpk6h8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GYQf6Jp7CbLM8ZyKnsyrXXcC253pEWls6gzlYI4Re+4qY2SK
	KL0howdY1dQn8sy+7luNVrW8fqSfsowTs1sPhHJRXoJ40Jodbzl2mKKA
X-Gm-Gg: AR+sD13Dk5U90/RljGKcGf8c0izchJrlQtZMpxRpXAoqO1XmDDbgjU2/VcX8UXTcRYo
	uEmtgjyJXZJ8gqQlbK1SBb6QE8UnhtcRSGEbMIzoE+dgjmQCc3wC/YALHSmaZV3ARbeUy4pBaus
	1QJZrZ8l02z5Hb+YMJf/p00gsz+ZlTpnlBgyL6ItqV8BFOZZavkYntnu/v654G2R7mSXJvYfCUw
	N2e/CFAxjEoLGAR2gGXiKoN6oYh/ydZKeXzjYNayvQvafBgidmJD+8835GjYIdnIZ+zgRqzOLIr
	xGRd8FjjwaodDEyuvfsBnJz2bKPSpEKrGPAYxHMb867hG1CvBDr2c8fp2Xqqtqi7Gok3MXKeZrK
	AmpT6Z7N38V89FbK2aseQhuUo26aCvH2HHwIDpAMdRuw6H+HbTUexiXViwn/evRpnpn69+hv5ws
	BrnYi7tG6Z7rOhEn5JdrFtGdHr+sWEi0ZLv7g18eNX3bdQf1Fn4gUeFKFsfzJVPIIRDTaVZKI9h
	4yLCW9vuc8CoZ8SDWfZg5IBvnlnGQ==
X-Received: by 2002:a17:90b:4b92:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3931e079c22mr1944443a91.6.1786582042327;
        Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8656:b5a6:1038:61b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm1762331eec.18.2026.08.12.17.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 17:47:21 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:47:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Message-ID: <an0UEY6gigYTWFLW@google.com>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-3-wenst@chromium.org>

On Tue, Aug 11, 2026 at 08:20:02PM +0800, Chen-Yu Tsai wrote:
> Sort the include statements before adding new ones in the next change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry
