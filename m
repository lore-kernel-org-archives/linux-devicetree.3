Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCAD4BC00E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819063; cv=none; b=M/r3M6ti9K3tXdVMRppv4JBIYs/dDaF9k8/W0FpKdGKHef38RdVFueKGRRvr955kK11qRafHpdzicvuDZDL7PAopB/Q0HLEI5hwIu+zQsb44Odtn/d53RfpPSwTiB9a97Vb2KLmdRBNF4NHfgw9XY70pT4d+IEk6Tm9Z417JTYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819063; c=relaxed/simple;
	bh=UEMwl1mUTJq51zU6rBTHe0+55FnjRFqfSf95Y/ByeA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTfX3XjxsfmXmoqNSlJeShmV6xuifbfgG/LByJ9vUmhjs06x7dlXaZuukz8xV606nVKXTBpDWXqOuIbDB2riKqRf6mFH65iUezKz5q+TTxvvWTABm3iuM6/8681o6xqKSvffoquprPyz+8uAseozNWBm3j4/k/zMB0d70NROJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AIW+4t7z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XgFku1er; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AIW+4t7z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XgFku1er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784819061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
	b=AIW+4t7zd8Y1oUAo60CQoLTCYEQCahxwVGTLdNO3JMZlaKEYoF+GUtL9VX+X6cohoJbQSG
	hL1SFDA/cjv5qrHkoRT2fbo/ibzMmFOEWUWlfl927nfrV/kzTSAU+UR22JHcUHp28SzGEQ
	Ad9fAD75T4ZkKYr7aIq6fU/htOe2a9s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-LF8zFQvkPAGR8-2C8aRB5Q-1; Thu, 23 Jul 2026 11:04:14 -0400
X-MC-Unique: LF8zFQvkPAGR8-2C8aRB5Q-1
X-Mimecast-MFC-AGG-ID: LF8zFQvkPAGR8-2C8aRB5Q_1784819054
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-522de3c645dso20629021cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784819054; x=1785423854; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=XgFku1erIFKjnCWJ294bJGfDCMvAg805NaEB4LA5LjtmogoUtGYVNBzDk+BQCmKltT
         q9z2NkU9MHJ6mkrLIHVp/gD41Z+MDBVAGrZGuyulECuvAOGDYDoYOk73q0QAJJdwGtAy
         iAVyOpdy9WkDIhkUplxygxaXB1zHLUXGd1V5TE6IzgsPVhJ93GvQUUg5Yg8GkY4WJpD5
         gu+OFglsQckTx9/3HxkFxUHcMNqQz1S1TrM+qSEXFLuxb7/SIAu4MhiDmFvl1xBpOdht
         yoFVbfpWX36Xtbmgo2dltr3x1TTwmZG3IhAnoEDaiJc062Mw65cbPzF08OsWbLCG57sc
         sIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819054; x=1785423854;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIw6GIPoYXkHISLGH2TozSxZ9dhllUdd+v51QggT3+w=;
        b=d86F2skRm4eWiKDbXxmKy3Tc3iSo4nv2+phMa6RHJjw0JcFw3Isg5zobbniaB6HTX4
         Rh+Svhn5QFxipdB1cPhYG5sSy+wIiYQyinBOu4QnP8VlBayIZsGzB7YO4Ro1JipkVprE
         U6LW+cMV/hC5BPcqahZPuaVEc+GXFd0jakKLuK/J6ER1kdNWFYQwh7xU+iWhVt19ZWPT
         Ao1sLstW9wlPxxB/vb6oXHaatEkgWe9yPwPdfRV0go6kmakYjBYsplx6pflUixlztplr
         vy5phtO7VIS4FwxgxjNNJpGjQIgR5etWDPG9zrZnKrE+f9Csp6KBOmn72TVw2dcuZx9T
         j4Bg==
X-Forwarded-Encrypted: i=1; AHgh+RpsLeIsfA09RcRBDjRo9HOoz+3MvZ+5NzEeXlISZh37G2x2aWmrJja4CiY0hUjC73YKG7chGoicljJ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyXeGtH2OJZtdoa+l66bjX6d+rsOWisWJAG9PHjgCclOKWoSipL
	o9dGXYkD11gJnWnmhwky9M2azsuC3rhWF7eTg4X2FgZNFDLfnEXL31LVr4Q/Na8qpocFZlzCc08
	ZZDWMohu4CYoSB4X3YZ1EF5bOYbl/HMoA3zNC8uBL7vK7mNQ2eDvx3qNpq3OI7Nw=
X-Gm-Gg: AR+sD10CIzs5T+YhhBHyNQn5sEdQd3m7RRsLc+dneVFK8InFX7Lne4RbDpvko6LHUDZ
	Rs8XgAbJ/Q2LqPQTzpldqvy+x3pVFsl/f8eY/pF8WwdX0Q3nJyVG4DDNe6mwWt6GMceHWLvIfUP
	VKhvyO6Zl/UKUsFlje927dY3SyRqeCTtTuyCuIWIf1QGrOJoLm51dkXdBKBcnRS/x+nUCIyqNSA
	gTXPFYgyDTbI2DSoCdxHTeOjIaM5rKc1PHDux34PW055yMZfAl5Qv1bSRrGrX1hHhtXkZo2yXQn
	tZ7WBa6wYSHlPtS5GGmcUhp4frm83Qf4sG8S6Gje6tk0+U1XRP8HVM4uA8CEn8EZ7PH2JOWC8XO
	rVInzx1FDdP9S4qg6HltaMesBSpIt/u3Zqno=
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32054091cf.88.1784819054010;
        Thu, 23 Jul 2026 08:04:14 -0700 (PDT)
X-Received: by 2002:a05:622a:244f:b0:51c:7b12:5fdc with SMTP id d75a77b69052e-5283e03d447mr32053161cf.88.1784819053161;
        Thu, 23 Jul 2026 08:04:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d402cb05sm36676211cf.31.2026.07.23.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:04:12 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:04:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 1/7] clk: Add devm_clk_bulk_get_enable()
Message-ID: <amItaLCmjtmH8SRQ@redhat.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-2-suraj.gupta2@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723123838.125145-2-suraj.gupta2@amd.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 06:08:32PM +0530, Suraj Gupta wrote:
> devm_clk_bulk_get_optional_enable() gets, prepares and enables a set of
> clocks with device-managed cleanup, but treats every clock as optional:
> a missing clock is silently returned as NULL instead of failing.
> 
> Consumers that need a fixed set of mandatory clocks enabled for the
> lifetime of the device currently have to open-code devm_clk_bulk_get()
> followed by clk_bulk_prepare_enable(), which loses the managed disable on
> unbind, or fall back to per-clock devm_clk_get_enabled() calls.
> 
> Add devm_clk_bulk_get_enable() as the non-optional counterpart. The
> underlying __devm_clk_bulk_get_enable() helper already supports the
> required (optional = false) path, so only export a thin wrapper for it.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

