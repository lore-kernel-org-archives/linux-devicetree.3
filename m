Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974229;
	b=SaSUmro+bIM+pn9GHfnrAoot2phI8qu//kwfpU/ufHjYjyNLAzgXe5e34d5rEgEgZdOj
	 UQcxr0h78cku+P7AD7cJiwr6YCRGawij9uAl3Z1MsKtU15IVj+xAGw2KedZSv0oSeXsDj
	 GxQK2oGfk38a5JyIb40RlpSiQk7dsCyyMAaSC1+0zZs0smEbrbn3NNcKPioiZ39SoJI21
	 0j0G+Sn3VXM8lL7btJZkI8dBlj5GeBAzVr4uoeDi0hv7JSGYv6ncbNf/9IPvJQYDV3cFJ
	 0YtujD3ZgkThj0HN5q9kAs65mHNeYtZAEUYSEiKKWzTMI0GecdXejET9+1e/LpEVSzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
	b=kWHuXo3r4T5ouNDyT57EaWduAxteXrcsUIEqEbMIY2qcvrLJG5Lk90Zc5S2XLJhhMyEU
	 aUjb538X3T18N4o1nUaWDKdrgJgS00aAE4EFW/yDuGQiFFvm0/7Wz8Qfejdar+uHIiw+O
	 uBxZB5EyWMBZ+VnyURi508kRr29AYP90F8EiY2x6FBR0YdZnUDlTBYYyHoFID0MlAmi42
	 XMZDoF0k4EEbMiz3ZYrvJFV8IBLsgdAoHlTELDn5JeUX7nWe5VDQ59QooWZgpcmjtVaeJ
	 nD6hskGDhtwwzX08+DfsJR0a1kcf4Ef3vlTf/lPiuCoOqs8NmehTe6jBqi7/DyadcNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c5O6rA/0";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09491606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09491606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c5O6rA/0
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1731181a91.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974228; x=1793579028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=c5O6rA/07U3TPiUdjyQl+0E/1QGQKFEd/BuZr146AnkMngEg/j6CBnibvZSqG0Fd/U
         e4xYnAbkCcJZ1k93qWPPfj5VllNNTSBCgJV5StBfQdExN/DGAdLuzUg0d+8BpiUz+dWF
         8k8Yh1uPDnH3nRhntCgLGxU/EuI7hZF/CcR4oFQkXMUVcuTWXLK9tsE7bHqwgN19O4Zd
         Cyeu/xE4r6nEEXj62dltqk3zE19zxhJyrgAJVuQnqGgjnQ/LBWSIkIOro2427PZKPcis
         CuBDXBzun4bni3YIS0qe8Wr7agcu2YNAB9TuCWvtGR2SX0aXsXlmznXP+M9fy4lE0ZeB
         LV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974228; x=1793579028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOAEuxqxBYmK/0PL/M0euV7RCcXgDliX7E86NGaLuy4=;
        b=a61hrEXJzumXPoa/OjFIwNNe0S7+4YH0y6rCnLnRY8HjmmyjL6QU/ft8d9ESzbpAHf
         oZahUXJ+I1OA1y9h/G7dwMArWJuqnW+wkL1WETqSlT7kinwzE7CVbzjwQJ2GsFohzc0i
         OhVzOOuTdUkWZZE8Qq4MT3sdRazm6GcFuA9b1M36wfiqMJyDl1mY7hHUPI1g+jmfw+gt
         32tqkjaG7i1sPhcgFTCa3bqeOmmpypItF9oTRl0aLXZjDbl+nmiFMJosQqR+mCWxMgXT
         Vq7YZOK33RHPdK7EfkKPFlvqao7OYhyHjaa+CokKFGzkzpd7/PN5iTK9H6jUQkxfgsUE
         EIQA==
X-Forwarded-Encrypted: i=1; AKwUvBwh2CU710XkbI3BzueudoGNdGe3L4Bj4UqUuke7tvq05w7J/tBFFhgYcHHSiib7XqAoRBgDaXC/D1FX@vger.kernel.org
X-Gm-Message-State: AFq9FYJEolMQmfDoxZHirynspwnW8AiFu31ydCuWK5Mu8BXi7R/dAg7p
	/YVG/QKhq5rxOehTEpkLB8UD9Z9NteGUwfoNo9FbFuporUkvxZwQz/fDQLgrBg==
X-Gm-Gg: AYBFou2ui2IWtyU2abuob7+1PjbCJf808UaFUfOZnZotqoF3F7edT37QD4mmcxPqZeC
	arcs8LTwHIfnBDDxOm36zflGT153Mj1a9C41qHvcpw6jGIrQqBBb5Xjecw99IzayoAo7j6T+8yv
	g2KT3Xz/vnX3jp33B+KidW2Olpc5Tp36rOW4Q9CtC9cj3xpBTtl2fMI1kRP5kNUnOajx/TD8Wfa
	FLTBJ1K3FqKvYeDHi/N6KfozInfXC3QKQnWDqGLagKzDZqVBSQh397gcWdq3rah4ziUBdl5miZz
	JFYxuLd9gKch2XVFneC/5XYHr8trrPRzTqN1UD9QzanmdEGnP/1TqCYdmeqJJyONQ20r8pkKTQt
	h6hw1duH8MMOl5Xxe1G1g4zHst78dReSz1zU4ahpM8IH33u5Vm4UPgFFce0NOj4514BJwzegs2n
	M8RqE4Zn/fzWKV5MXfuFWaFPnPLtfhZqkzwXS5p7l4oG//tNyAw0eTDM4vBiBgxJWXucNUD6jB8
	mG4DmB13KE6MGy+quX3ZzRcV3qYCOi8OMU3T3RKgVvCxjnYEiC9Wk9GRENbPkyINDx4sg==
X-Received: by 2002:a17:90a:e7d1:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3ade9b2ed8bmr5091396a91.6.1792974228365;
        Sun, 25 Oct 2026 17:23:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm6406037a91.2.2026.10.25.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: (lm75) add MAX31875 documentation
Message-ID: <c5cdf9e3-919c-48c9-9717-8bc801ad207e@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-3-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:49PM +0800, John Erasmus Mari Geronimo wrote:
> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks
Guenter
