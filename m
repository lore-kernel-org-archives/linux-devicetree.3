Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A3466B63
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268109; cv=none; b=KTkqJqP6fSB90PpY5LVscCWCuOwxrMt5S/AtMgIfzjUCucs9JHFSKZMfWt4XB0tZFHU0rSMakfQf4ySUlMdsP6mxGLwtD6H9M6VKE7fXCJHNLOgFeU96kG4jOxs0Qm5190ho4A6LerpmDiq9kbdwZgUjImbV2trZp8V8KL1RHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268109; c=relaxed/simple;
	bh=l9FOnVihMhd0h/vlJZ0tVI8d0Ule/9V1gCLn5f6ATbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MmNNF8capWz4Bv6VQcSnhSK+DGxqBzryTObJFrNeq8925jbHIiETjIk4Te6cqR5Selk2aAfz8hn9pYH0FhHlRIKD5Ev56VHZfSAhEp5Q4fef+yWyQYGKECyqcirP4sg85TVI1CmwdE7x4dPF45x9WipKIhXfTDRPIS/UFmM4+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=TaU3xVcI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="TaU3xVcI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so380565e9.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268105; x=1790872905; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4xq+z5Rkg98S3scIWDNq5WxGtnS/EofIxpErOXF4wRE=;
        b=TaU3xVcI2vmqXJzNuV+zqU+lDfnrVml52xe2HB33zMxsbGyf/gAWvQmNCcB9DNHEEb
         l9iJokYyhBDlhYYz8vEk/9GzNyL+3GCR1BPTRJp71xJOEfekRTw/hhAfQk4oNXyTsh3n
         VJoki0VFT9kJLtvpLGFm9yG019Ufm73Wo8eg4eEE3aB5dm0f3vb36a4D3I1kBDS/UVnM
         JXK2O3tOOVC6Gaj3C4Etj1A+s/KrOBgI4VlqoARQX+4wtjdlBGyXy8HZoM9B5nRa0qoh
         qLmpa56SBPrthiHcaXq5aU6OCv8wQ9HxGfItj5kj6qfJlEyoPdqJ6DmmIhEqM6EnxhEv
         9lwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268105; x=1790872905;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4xq+z5Rkg98S3scIWDNq5WxGtnS/EofIxpErOXF4wRE=;
        b=JZjVYZjUKRVTVdhCJwOsefk8CNCg3u951uH1XCG5sB5OGCb6Xt/+a9pNsujaYvQTYY
         lqHoFvPchFTKc52bNkORVsTQIPcYXQEbLcijyB3MR7WwP49mqPUHHEtq85Q3rc6yMgBF
         vy1rd0okwtEJwmMYsDotBO/OLRqb0BrVRFZAJ8zdA3H4mubp4k+CSBXVNkbBqatNNk7G
         e8sds5YedCiaKPf6o5tzf0ixRMsVy1QhC+ifYFXsgliWNPvE0ZA6x7Jgn4tK+iYDNk0V
         uC+/EmRiVuGl33dzlZ9nWTnVQkpvPFATrkQ1mGbeU5Q7XJSbUAz3tdqmGt68x5oCQGIl
         /sqQ==
X-Gm-Message-State: AFuF++nAzzJPnpemeUhYk0fHzhBITUybdziNypef7HZUirC6BJjW65Me
	EA5nV2fKBRbqzPJt4DCEsXhupaRVI5I6PZ5fWCWIr2eGh/RuVG3/uE+J1Fk+ScaoR4w5g3y35NN
	QG95ccDo=
X-Gm-Gg: AYBFou2LeRe0Ny6QiHLCpPdluEw0k/opjGtq0ddEru6HQHtozHshfTE0k2n8gWWklbV
	AZkZ2uf6VEWXwDfmJ4BOXH45mzTp6WLHSrrfpStsEVV/mrNKSNqXt4OKeQN+XjwSVYiWJKKWYef
	i3i+XQBJWJ/5L28uCsUgXWRWwfqB/0VvnlxUYWCQ0LJpwZCua60qrWGwCpDji9ibLgUXJZG7gqt
	94wcVF3xTDeoCIFoHMJLassy2pItIsiGTDmPSGv/XM6CbYfSV5cX7zAqkc5hQA+ElNaNcbLOP8d
	Rf7lIUNtHNppOn/XjEQ/h/hrLn63zPSMIgnZ1QiCEdESgAl8Zp/4mStLuF7XmXYDNv9xWYsjkO5
	98ii1h0cx3jla2/3VlsbmNvx1Djat3V++tPxgTFZPxj/sIeXZGDNPTGw95e3qVuny2/1yvS+NTM
	+Z0Ek8ZuIIn+bvUry6t9+6e/aVX0wf97HPYfD7umSwN+3DZez2WrEGMtQQRccUtP2Sj/D2pdb33
	ntgLGdJarC5IMHdEA==
X-Received: by 2002:a05:600c:1c25:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-49fe66f19demr59231595e9.18.1790268104562;
        Thu, 24 Sep 2026 09:41:44 -0700 (PDT)
Received: from dev-ag ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9f253sm89780515e9.1.2026.09.24.09.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:41:43 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,  qinjian@cqplus1.com,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk
Subject: Re: [PATCH v4 0/6] arm: sunplus: add Tibbo LTPP3G2 board support -
 withdrawn
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Thu, 24 Sep 2026 17:28:38 +0200")
References: <20260924152844.81705-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 24 Sep 2026 18:41:39 +0200
Message-ID: <sa67bkavby4.fsf@dev-ag>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Gaylard <ag@ffroot.co.za> writes:

>  - Patch 3: add device tree nodes for SP7021 peripherals that have
>              drivers (PWM, watchdog, eMMC), plus a label on the
>              gpio-leds node so board DTS files can override it.
>              Also: move memory@0 to the DTSI (512MB is fixed in the
>              SP7021 package), and remove unused board-specific pinmux
>              nodes (emac_pins, sdcard_pins) from the DTSI.

Apologies reviewers, sashiko-bot found an issue with patch 3:
some of the changes were not described in the commit-message.

Please don't review this series, I'll send v5 with this fixed shortly.

-- 
Andrew
