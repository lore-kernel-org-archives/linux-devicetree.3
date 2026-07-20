Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25342EEB8
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563884; cv=none; b=gV3jGab8ojoJe/EFqn1D+jetQ8IGgIfVpJ1NEAuhlIsMZ7FQO5h/1kDt07LrOjzWTS2GHN9TOSdz7UPlEbp4KJm/4osjyXRxtHELJCJWUlQUZ6iIaudb7VD+ytB6Y1IgHT8tOa7Kn0ev5fPgYPVdEDuhV2Y9IKNnQ61z0/F+6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563884; c=relaxed/simple;
	bh=vZjpn444Dr+n9sHS9FJvINtAEvVv2hvJQ0560E8hhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxqlZPqYuVvVDdJ+Xa960oP2THwAs3IEJDYgvt/OxZtyVSB1K+t5XU+LLa4z37lYH/TTSW2gmmzlnX8nzSLFFdSR2Rdi7exJ4RQBdr2tpKrFKPzIaRP9sRET7AQW5dzNvNUTVVTniJOL6cnRp4DKwqTfwYJXT1aJEO8Q5s9+PQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adV0DpAs; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adV0DpAs"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so9640670a91.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563879; x=1785168679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=adV0DpAscnn60OPV4ssIBnmIro5NdkEphKZ35Y9Ayx8yamDO2bsnXMPp4l24tmSghC
         Cm61OgDX7QbuJEjgptRx/RLZlTWqH9suarmRHNWwOJqAEi0DEz5FzcNJujRhFY5/PfFk
         6PDcUQCIH6HpOM7qJwg8f+CzC8IFlVzblLVx8bYP+1G8EnFXrU+bpmaOpScPpmUe3qEQ
         loWPe5CfZK5RX0rt0ORujC8CJSKjGjKJZKra50rqBt/3cGVXXDbqgKY9LwYpMedMiqsK
         Jv4ccgEDNzgVe4k/dCOgsYX46imbogkq7h0Ie4rcuZF8FQ1g5nfAfYsVXCUcc7pskoC+
         8Cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563879; x=1785168679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xxRXY8WEN0UqvALfUo+QgEc7p0+yzjzyNQ5kB5akAQ=;
        b=cr33FLsWlMmpjyMELom/Lzc9pPmuh+66R1HbqIt72DkUa6Bks4zsYEpgvB4MVCxDLb
         q/U5d87Qul4sZvHgwwVdNJrMRRReLD0zDou0hwf4DasDR9lpDfbPYw9Kr77Za2NRDNE2
         zAUHDB7hdrXoBfWTGzDt3qKdtwdPSsr4spaIvZb5Xc7PrXihR132re+r0EGACEs48lnD
         bFYvkXWdZsG1mOrRWN0AUTdwlxnfl3lTp8Q5Lsg51F9NZzUmMKxyTESwg3W6ObXDCnwg
         +oqdIvJ5RPmiz6RJIxXR/l5YhS/4PBcvMGnpqxAEIkbGQhuluBO5VaxD/Mao8xzVBJhv
         iTYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2CYiEGuP0ks+XnvasYGxF3t3yKgKdErf6SN8cIIXPUERTFyKGSXr4nE+Lf9zRSU4LhP8ntC6mPXGA@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTF3gh2vgShWfV/dgBK28DWLM//Zzx2Hn6a2kvcIOy+vK8w0Z
	F0FT4EF+eb/0ljet+Ka94GplzJ7saLZ3cIfL8lggRfpLoC6D6OUnC3KN
X-Gm-Gg: AR+sD10BxrXe8X0nTRKQX5VTpAyrm1u4aVilKc2fFyLZ0PCzOZkBODd2cpvcZU/o1oK
	QycvDbx6eqSs/Hk4UDvYKviWYHRIXybsMA+KbS3HT11OnRt9Z8avDnrL7GCWfFnI9unSZvS3ZfI
	j/UtCm5Wq3M6GDVOPZ4q1PPa2GcNF2AgvHpmN/CqRUafxlk66oN+2+SIeaO8aqjHvszEE2rVPbn
	a7NWwrPiTb0v05hFFXje/xjizxUMSozQr6KUqPHneb0/tS+P0TdO6fSz7NVtniTdNBThQ9TG5h6
	0nkJndd5C87tPpv2B+74UhbawAONPFTv7NePXMWZCDNJIr6PipSQJuQtR0HrBzNy/EA9Wm2Rd/k
	8JpKEGh55t58h8zuAa2jgUJ7GmoGeUlSQwQXJMgK8QXSAkL+Zykz9wT34utcA9vX3LQEsXiiFQA
	fCjUxkxhVtg2ZpUHw=
X-Received: by 2002:a17:90b:2c84:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-38e4b422bebmr15575435a91.8.1784563879361;
        Mon, 20 Jul 2026 09:11:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm34678064c88.3.2026.07.20.09.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:11:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 09:11:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, corbet@lwn.net,
	skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v4 3/3] watchdog: npcm: add bootstatus support
Message-ID: <f0a8a606-0687-4c3f-887b-ebb500e760bf@roeck-us.net>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
 <20260706144828.3517631-4-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706144828.3517631-4-tmaimon77@gmail.com>

On Mon, Jul 06, 2026 at 05:48:28PM +0300, Tomer Maimon wrote:
> The NPCM750 uses RESSR and the NPCM845 uses INTCR2 to latch reset
> indications. Read those bits during probe and map them into watchdog
> bootstatus flags.
> 
> For NPCM845, cache the sampled INTCR2 state in SCRPAD10 after the reset
> status bits are cleared so later probes can report the same boot-time
> state. Also report WDIOF_CARDRESET for the watchdog instance whose reset
> bit is latched, while leaving WPCM450 behavior unchanged.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied.

Thanks,
Guenter
