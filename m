Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78903ACEED
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199872; cv=none; b=o47iN72xEQSpq8qXJRO8yJ5f+qkRWavXrOJrLhpuQa9PcGm45jGY5/vJxke6yvqKbTxRXz/8hip2ktr1t5IDcuZ9+g/qEmkWAxtXQgF0WImEgs0VhqyD9LVpwm57Gr0Q0e7VjtB5xR87dgQ5Y+q/T4p4F50Zp6RixgTvRQRiF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199872; c=relaxed/simple;
	bh=VX9aq1/R5RrwRZmL7z7ZO3HDaJciT4M9uo4YXELNbqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JYoUpzseWs3OwB284h26Hkt+aA0zUxBlqa2t4Glab43O+TrOXuXPAJWTTXgyeiUu/RvrHQzhGJcVX+wQDYvJR8c6GYEeWXfcWJkICZE72pYbOjm98Uqj37pnMB0Km4bjZ+aHTmGEixK4PudrDBPT3ToopQqlA8zIcsrpciXCH9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fBfCCKAR; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fBfCCKAR"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbee846deecso99575a12.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199870; x=1788804670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Wrt3p9UIC2EP+ugVnAYAftXrBkKybsqm1b51KtSzCs=;
        b=fBfCCKAR9qEL2RzDJqdpp8hVecn3yNx0in8YWyfJ2MdIc4Xa3yHrYOhu6WjNAWIAez
         HJ1NAky5+sNAFQsvKKvoIUdSQiAs+dZ2fxaFsdivwomgbRkRk4AFaVI2YsUUzzzxBhsh
         wR4sDoeYlBL8fuRnlWstCEgxWvg1UQCeGiU4CxauGrtDZTIUqjgRPElejWFB9b2cgmq1
         /rRYvIm7grg6NlP6/hjfH2mxFyY1EYSiI8BN+YCtjbe9yfwTX07WPAtisr5Ju8cA1FB1
         4/0Sxeq1gIRWBhCcz8wZ4wiJnnlH63T7yLUrj9mNeA4mEBYiVkVDQoiKS45vgNYZNdST
         F4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199870; x=1788804670;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Wrt3p9UIC2EP+ugVnAYAftXrBkKybsqm1b51KtSzCs=;
        b=cU06q4u3b3fJJlhrObHAk3UHQqO37j6WZkw6esTdhw22r5jUafsFccq9ThUUG8sEOa
         I2hG3jysmt+P/VmH/t+C/TP2oavlYjqL9NH3ejHnB08O2nH9+gdU3bHsLSB1P3Ko1qlB
         GOoxdh6yZj1BIrXKN1EFZKc0zX0mnADX8Eb/gQqvWU/10AO68P0Z0f/0FtBS6OY/vKbw
         ltULiiL2faNg9SOLPgIHS/R+zALAsXMNfr9CX/Am7l0reHtxm3dMN0FgxcuITm4TbuuR
         zafMq6qqdZf0jcIkOlyedIUpVD9hrq3A0huU5ZYRN+oOGX6xHwz4j8B08kjjFE+aKOfa
         gEww==
X-Forwarded-Encrypted: i=1; AKwUvByVvsywi003d/ZNSeBRow9D44dqNMTN614D2AvBclGYLr09Y7DXRDG1OPYauEJ1HuA2junE2J6G7T2B@vger.kernel.org
X-Gm-Message-State: AFuF++lu6yuvH2IlMUDIIIXGnxWh8L2NB+86vb3ayuHg2x/9F3YuUomt
	veguWmaN5Yrb65juFqAEvwMBAfXVNlXUB7sOTN0RatPhYistTL9zLWiLNp+sBLl22bI=
X-Gm-Gg: AYBFou3XKR8/ndXqmdIdMyke0pGwKA+mBNcSG1ZT0g1biGqhx/+Cd2O+Z3yG+OQj1pt
	9xMkc36jAK9hoWA6EusFmlVsc7mwiA59IJfkW5Ft+EaP2k6UoIxfaYmkT6D29lq+k2gwUPdLqTZ
	oyFiDa2OU4EZ7zBc/5FS/rSXTUtNKXL3eYjoRxJtpkf5n/5S76DsyDvwFIujXGgFl7zAevVLod3
	R+QHeEj64qjtyUEUI76MYQ21A7PZ+qGy8YGzbFRhTyLyLqQA9ywE6g8M22uFSNuTWO3t7o+jtDW
	lFASNjTg+EWbo0ShGl1JC9r5cSqLgXQoFucm7FKqE4X+fBGe25KqSl5MrTV5/X6MMwPmEgjjdp9
	93yMMGaOSCBWWRpi6/lG6kTRUKsKs/3YnH8Y2EUCY1/h1ruuuYPPX1C2r7uA4Ggig7NnTUkidAZ
	jW83KhO+i0uwLOWiWcH13cLOCegnnCYUlAs7imqsbt0pgtVvnV579/D0nJIQ==
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr46228745a91.12.1788199870028;
        Mon, 31 Aug 2026 11:11:10 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d4ede7csm757891a91.13.2026.08.31.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, afd@ti.com, aaro.koskinen@iki.fi, 
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, 
 Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, danishanwar@ti.com, 
 pratheesh@ti.com, j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, 
 rogerq@ti.com, krishna@couthit.com, mohan@couthit.com, pmohan@couthit.com, 
 basharath@couthit.com, Murali Karicheri <m-karicheri2@ti.com>
In-Reply-To: <20260723102041.372148-1-parvathi@couthit.com>
References: <20260723102041.372148-1-parvathi@couthit.com>
Subject: Re: [PATCH] arm: dts: ti: Add device tree nodes for PRU-ICSS1
 instance on AM571x
Message-Id: <178819986914.2869653.5429087561211412067.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:09 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 23 Jul 2026 15:47:23 +0530, Parvathi Pudi wrote:
> The TI Sitara AM571x device has two PRU-ICSS subsystems: PRU-ICSS1 and
> PRU-ICSS2. DUAL-MAC Ethernet support is already available on PRU-ICSS2.
> This patch adds device tree support to enable DUAL-MAC mode on PRU-ICSS1
> for the AM571x IDK board.
> 
> Each PRU-ICSS contains two PRU cores and several peripherals, including
> the Interrupt Controller, IEP, MII_RT, MDIO, and eCAP. This patch also adds
> the IEP and eCAP child nodes for PRU-ICSS1, making its layout consistent
> with PRU-ICSS2.
> 
> [...]

Applied, thanks!

[1/1] arm: dts: ti: Add device tree nodes for PRU-ICSS1 instance on AM571x
      commit: fad89162c71bc2f81f99191d93edc63d5f6397a7

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

