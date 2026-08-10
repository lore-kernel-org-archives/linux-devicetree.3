Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60B3B3C08
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398509; cv=none; b=OKKpp5nhGz+t+Zb7vjFq1i4bL3OKZ4d6eU2gs5KqRCh1mRVhTWOsS4k/VmgeQxrk9SDUsXiMS+Lj6zKqO+Pu1N+c5CT3dCD34FKUeC7IKLjpBJ+b8SDeczQ+yeII9WpIeAfpF4KBZDsKLCwAWRKHi1QDJqCoPRlg+4CGE4nlfC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398509; c=relaxed/simple;
	bh=LrsqqfM5Lf8SduY5JVzHWp4E8K081478dAwhdzwG6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIRWGBApuv0NBOYtIQtoUFgcneBK8gZacZTaavuIuhVDs6hQZOcgtufypGAX/X2r8AwEE2NHw4Xpkn5524HuLuZpAiXswT8a4q8CuW68VOFl04q6xFolobjCXFab6AgIC4AviLwmhrw2p2x30ZEe5Mor++4ZLXa9TJe9tLGQZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYUD+3zb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+PkeJtx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYUD+3zb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+PkeJtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786398507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
	b=OYUD+3zbw/Vy6r7YhWYV/ZamKwxZZvFchDCrFd+d5zYZ8XHu3FLKixh0z0WXlDEsB0/Oyw
	xdYqYbSzrqj6XQapqXWi96f5Bn+tL/m8/+InR8tSkgWbSAen7dXtrdlwPIfUzwkNLV0/T+
	rA55tU4Bq7hhnMSzWllsyAYRZlHWpqg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-D5UkfDC8Mpa35nVDXJNtyQ-1; Mon, 10 Aug 2026 17:47:59 -0400
X-MC-Unique: D5UkfDC8Mpa35nVDXJNtyQ-1
X-Mimecast-MFC-AGG-ID: D5UkfDC8Mpa35nVDXJNtyQ_1786398478
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-820111eb28aso37345447b3.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786398478; x=1787003278; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=P+PkeJtxjpzP6m8PgkxrSyuQwG0gYEuRUlt8q8MhvP9kcG1v3skAxjDuEgWA2dnbt+
         mRWqR0IYT+QNEk8bYYtdeA5vQNIShN//bfTHnVkubFn3XrZQBtv/4dbZzQZuab2kzGMS
         HegFx55QdRHxHw2MVhNO7U4fySi9u1PoCKqkC4rc65H18KZsjnd/Xa6SI8UfQFMVfUXa
         09qKJyNoYfjgK69OHp2c9quvfnQxfL00X8f8+0tB4dOVd+X2U3twVQpqMc/OQDVgEm3O
         iK1i5W38bKRfqKIWtcFJAT9/y+LwpTmdKKcM81ul56eTRxz3aDMrapZd7f1uN0Ia3H3O
         xZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398478; x=1787003278;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=kmFzcsbrI5zj7YI/Tncpf2ew6lMS0z759EuR9NoU+J3uoVI2CJIbar2suBDtUSukSu
         0hHrBZSA9ZkJ95aCCMlzlt7x6+k0E+BLt82JBFJVO5h3sGOtAHMoHi4/6KHl9R1Go52R
         N1Vv0AZB6pL4TdjYs3+l0GnUEPSIE+w81y+f/NonjuZAk9v5+TIdnpi6snYDEIeO8dHT
         7Ml81oxh8k7/izlZPot4mY6Q2WJErgYo/TMO8Pjtja2DDb/HXXju3r/RkQ0ITJCZZUTH
         jJ8EBO4xBAv/spWKvQSxsm0N4ae+ktWY63lt0aSVKfif34w5UKSzmWLhx4QQ+1FA45M0
         N/+w==
X-Forwarded-Encrypted: i=1; AHgh+RowY+N2cDE/z4wE6nqbVjFYqojRXQOgitV42jLq9FrmY2npv6hSx36o8njdOY14aECTFgWMgOtW+RV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvny/YFfi3BR/PevS0t/XAxkC3ay3H8WlOIYVNar3b8Ak4rUmQ
	cKTCyF8mwD5A5UM6t31+mclr75cl4NlrA/VFezrsTv/GV7I4EEcdz8eXd2t8WLPTwQiY/vgXgMj
	fX4tAX9ZlYHtunhqRHiRMPzXZJNo1Ntd7c55lNtFzb5PueoYRVdqm+fI5bmpMD9I=
X-Gm-Gg: AR+sD12aIIW7O1GRMA4tRKxhNf+lXmJTwyK2kqV4f4ZOv/RX32Y6gLQNB/8LPWja4HF
	WpZgk0vjJ3V9Tig/uUTzyQYlvgnZOSHXR1thk/B8hpBZeCNMK3jDlp/yKdG2yzHqDs5b1BEYbaF
	RMWj0lQB3/FYVM62jE1TR4YjfpMMfFYrg9O5otzhJInTBXCXdhFFvxEWZ6fMg2BSGffql+qw4E/
	kZMpO1josBsV4B1AI6QBW7chTjwsouMR6ocUA9qY9KIUSnZgIj8wXA+Y7jEBLMe4rk3l3+BULgJ
	LX75HDU29MSQ3SiZBrCHJPSWe1bza3lPqBMPxMpBieTDVHeiChBKt4SevVGID63/GRoseu/ACRr
	2brWenWx1ffdgQUjjA3dB2II3SZ5Fp/AIEfU=
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873597b3.2.1786398478519;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873217b3.2.1786398478040;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm64586967b3.27.2026.08.10.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:47:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:47:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anpHCvLCm1JKImC_@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-5-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:24AM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

