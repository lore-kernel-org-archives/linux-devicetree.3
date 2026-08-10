Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AEE1A38F9
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399149; cv=none; b=FUsuNURRq+X+4QQs2CXbJepUVmTSkyjh9+na/qqGZ+6iWQXOkpmhQzHBd9wJt9l6lmHMs9y9n1avUd10kuRoPjg5uBIVkSyvFPYyyckAihT4zhdO5huYTIPgKMWPrn+aqmX2u/dgrMYcORM/Rcm7gIUMtmYN3+ycPyaAgK0XqGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399149; c=relaxed/simple;
	bh=f8/4j/TRgSENYcqClLBb0UBt6QQ2qJIY3W8vGPNaE58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHTtB50lH6n+UtaPTvj03HNoepTu8qUyDEg+yB6xVMQ9dAni849OyOcbYfdQ4Eq81PT6kQcxxi+VncHp1S1osF7+wcrvMxgxukVWhUshEATIpywkZKFgkS4AFU8Usfd/z1xh1kV3t6EynC3+YsWbrSa8W46DaWR55pRnWfN+DGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b1V+z6Lj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tq+FjGIW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1V+z6Lj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tq+FjGIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
	b=b1V+z6LjWPZEg4OjovWPfJn7a6AuZyyWlTKahf3Qk6ifsjndmc5o5No+w5sgVu6AqbwpEA
	LR7nBFaBFQ8kwfZ2LYzXL4okq8z2LxMn8Na7twTEVCRimxPr/jMAooKGJi0iEpSwDx/BJ/
	kEcUs5HuTB8L/FWDfPVaDyZDvSmnm0I=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-p5pGHaWqMj2EaqIOswBjcA-1; Mon, 10 Aug 2026 17:59:05 -0400
X-MC-Unique: p5pGHaWqMj2EaqIOswBjcA-1
X-Mimecast-MFC-AGG-ID: p5pGHaWqMj2EaqIOswBjcA_1786399145
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-667656a12c5so6802140d50.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786399145; x=1787003945; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=Tq+FjGIWGDfFsm8vyeschLnYgubRawdA3WZxzuVBXQqf6MXZ17mL0ZC6dhYNqxvAAY
         ujolijwuIUQOxvR91GabNE72rcqjdOSttznwdSenyjpl8t6/4xRXD7mZthvAZ1XDnqkL
         rArINGLSEGB/BvpVU1OJBZZ2taBZ6vMsNsQv5TOeECCLYoIeu2mxTW+rHmHFJiCoXzMF
         AzrgOL0uNKc3NtEsDzamnzdxYdUaXvcY7A+ta2VDtBOgLBW69RN+0NlZpLIRqdReR1HU
         8pEw/r0MRXJbX+syKCdJy6I6aSSoKQocuxScFbOibzexFVMWEN3uLNDNHqdFgOFaD2LM
         2Byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399145; x=1787003945;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c9CDIauTN7m7q0Q33ff28ouhlrdSOd1kpngNZO2bxk8=;
        b=GG0Hg1jZSrxNJIPgfHIur7bQITUJlACKAZjwYobMwJncM8zVdcAD6UQ/W00vCNKDnG
         wW+FWR4Qrv0fWTHM/J9luhKhMrpZPreSo/aJJwgkmadCCi8F+uAiVJmDqLncivb2rT/A
         7Xvhq4uon6bRJBukaYLmX4eZrb1HzSkzJzGJlgERyowsTmlkTRnVNQEltdiAZgopjRNX
         idFzsPZrMcuPz+BgtlFeJLuzsJgBgAOo3e+KJc3TrO4ijWSC6k84BgM+EptOY9yh7rSg
         4Ov3CntbrNObg221nZpmuL/BAjHVcRiw5U7raXytcW1mu7bdUalUDCNx4Gq09Jv352lN
         BhWw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4BQ4Mv/6HEA1V50El1eEO1fXfqws0w0q4D4LCHEni9gxbRuVRnJItzk4S1BSv2O+xKeaKZvJMJJ3u@vger.kernel.org
X-Gm-Message-State: AOJu0YzBxHZkoA10s0K0cDeGNRC6DyOwQdlmNUB9FNwZfnEpC9BbOJ6F
	F09JQXBaxeZAztro7XNcpLCH25ogGn8+v2AE0haUkak6a7Txmk5neFojtPgRJwp7oGztDvnGMs6
	yBUEv3LAL3nyHSFwqB2OGXBMW4D3MwsE0MiEpApeXn9VT5oyXffq9v5HHaqObQZ4=
X-Gm-Gg: AR+sD13VMy/FH5ROi+yc8p/gvW9PrdH7Uf2cH8QToo5nKilL1uvtT62+fzicl4ARWC/
	j7QLyUAMljnT5v4QBDViOabpoMReVH80pp1wojv1bgYlIg06HKgz+g6KDnXDVGFSuMoqKzOlarA
	j0zUkRMIWEYtl7Fd70Vjf8QLW2UfbvckFedT5pLoX+gLhMSRAjXANbcIJk19NGJdeaC/8kkkpIa
	a0aKeSg29oO0667BGAHqGNtCkAp1dbOO195dCO9aw714ZVogo/XYmjLzh6/QxEt9RexV/gmA8nh
	+fAjdEgcHtFeK6vtia49bLPfqWRbFXhoHc/+VeJzTg1kjU6uMgrvddNgGhEaRQr3FeC5MDi39Xu
	mNumVPQQrlbujVGtKNga8/+6FYuyTGAbkZlg=
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793260d50.49.1786399145058;
        Mon, 10 Aug 2026 14:59:05 -0700 (PDT)
X-Received: by 2002:a05:690e:128d:b0:667:b825:8543 with SMTP id 956f58d0204a3-66b12527c19mr2793223d50.49.1786399144641;
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae8584bsm7563368d50.10.2026.08.10.14.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:04 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:01 -0400
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
Subject: Re: [PATCH v10 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Message-ID: <anpJpQgo--a43EdA@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-9-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-zx29clk-v10-9-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 10, 2026 at 12:28:28AM +0300, Stefan Dösinger wrote:
> This clock controller controls high speed devices: CPU, DMA, RAM, SDIO,
> Ethernet. The only non-clock, non-reset registers I have spotted here
> are hardware spinlocks.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

