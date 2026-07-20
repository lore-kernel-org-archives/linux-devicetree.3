Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762323E8686
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563830; cv=none; b=SJuox9cWUBKKPzcGszzZkYBzrTi2Cz0DuetO95jTyBcnawu2TJCfnopNsFG1JssJyAKcbKYq1yzM4zZx2g7IAJeU6bJTpbHPEQGwjfyr5YlDTfmMB0J0mAbCsDy8U1z7Rh5OIXMerbuIUPSdKrhY7ODqVKDbKjoAoIUi17ctm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563830; c=relaxed/simple;
	bh=yn9KL+gzo5WCfpKnYQt/rCA8kAl47sae10Qk9mMRStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IczmNkwur/gc+eDDAnryrmtEo6J3N+qDD1i23RfgCwuDuJvKriUKdKwgyCelidvDtoU+IsRzIMMHJSCAEij3obtsueqOBnHvx9X5McKwNOIfKcQFwV6BhxYxSQ3Oj7OCLsKJwVudWrIfH/WftSTytFbrcwtdGqouLloMDTknO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN+Ady4l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN+Ady4l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso79722875ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563829; x=1785168629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=jN+Ady4lw17M5yDYEPMlSGKEZ+qyjVhv6foYaStiKaFZAWCpFexHglEllE3ryTrac7
         kAKEe1t6ZjhCgnEPkqdC9OrEsd4lefxlj3sXcgaRYr4lNc+p18OxbDseBDSbBumjepvP
         VMVtc7B3x/JeT/z6mNjCu1MhaWSK1PbtWH4VKm+KOtFEdfiTw/gGqPaXmUwp3QZUWFL5
         e+G2YWi9PjViEtcHUSPLUYrFFsdcMnpSqZgNAyZ4FOgEqNJeXUzscKVQEjLXmrgu+cDx
         Pnz06eW2Zc+XzYCkTW+/86+ZcVBTbyGk5KkBuk9guDRlB3z4ZlZ1ziwtws6Q4pM7dLim
         sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563829; x=1785168629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlPWzBPmCzPImVf+9GWi56cJVlswcuLHqcL+2o3RaBo=;
        b=e9moapDGr82UM2InN+vEtJil/GRb8QnSPA84FXtTFmuYYKj5kYt+qnlMPaNpDAAobR
         58Bqu+ttHGaOj0DnpnqVmbMzByalj7P/Eg41aBVOwMh7FCRsYjfKIfpaldZeBBfhgEoX
         li1NSrz9IqiDPNWCCoblDMZpNHoonmdiASnAUpryPb0zBqUZIImOnvfbQPOM2QhmvnGW
         tXX4cIzS4enuGUNkponoJK8s31zf9ztKIEm95MABP21M5VDAwqhx7ynXSvtqCMYYyBe0
         AVeqba3SlE++NqPme2dPW1nD20+0iLNYgsswDE6Ic784IsvDozm2G5a0Iwf22WzDbG0W
         AGlg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+SXD+AxGf1m8FqYOaLBwn5TfUUhcPvzZDPZlPw6S5WeGTpWsiQebkKOJP5bIWH402f1dUENkdrbZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9AzPgAbq7mSMMY9j1HJBcWknmqvPI+13MGw2Ma0/mdiXXK0Q
	yogl1DOZ7ozYvytB7HH2aYaDjM+ORRTpcY0jP4wLW+fv7mZMCcjOtxCF
X-Gm-Gg: AR+sD1107KpZldePT8l8vnfLQ/yNnq7XQ4EaB/+R8X6IGEMTuRQVRHxl2YQBZFm9htX
	kCtYJYLcyhyTB5KhRChk3ulxh+ZckSfxF8eGfXkOowQE3tbfWxIt7LdJ9qcgEjmAxKWMxwsMXPr
	T6Y4BKI09yspZXAhEv/b/Upb4TiY8m3K4qtx667IF9oo0OQluvOKk12fqB6TrQwz2IpheFIX0O6
	ochBcjn4rI+fuMh5u2ILp9V2/yfA6AqwHucAvvf/OKtLPrm1wqXuHaRayRJZfAy1iuuCC87rHUg
	y7DWtq49mYnnvApZakUpc0zdqsiHhSKNo6yxP3RJSEixrOgvdGAjZTBkMqLqHwRIsTjJn5BpZm5
	uOHvWcU4RtZYM2MP3W+JiWAxkbCN3tP9CPy2AETHjwNTRe8B+VJeC2YXao24AfIV/2OieRH1gvH
	Pd1YTkToLIYEeeE6RbDM5etQYv5A==
X-Received: by 2002:a17:902:d4c5:b0:2c9:2ee6:693e with SMTP id d9443c01a7336-2cf34873ddfmr177182215ad.18.1784563828753;
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm40185272eec.27.2026.07.20.09.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:10:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:10:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Message-ID: <ebe0fffb-eeb4-4dba-ae8d-7153af6c2fbe@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-3-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-3-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:27PM +0300, Tomer Maimon wrote:
> Add documentation describing how the NPCM watchdog driver reports reset
> causes through bootstatus on NPCM750 and NPCM845 systems.
> 
> Document the reset flag mapping, the watchdog instance mapping for
> WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
> sysfs bootstatus reporting when watchdog sysfs support is enabled.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter
