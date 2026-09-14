Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87646F4B3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399722; cv=none; b=XRuI2mE93lBw/a+DBHUPO+j4ICj4P6Jc2mRfznWimjrOwdI2QFW1UouiYQTQ1/MyxFqhwmh3MrJcVUJP0E0EFCA61xsxK+cElW4Ge1PAIrsU/8u6+42R7/GV7bK+3C1naY+dOqpZ7ucI5yR7RmCW023aDzquWPBaabxB+3r+KX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399722; c=relaxed/simple;
	bh=/5GD500jhxrjrGdu3756syYeLWpVMCMPoBV0ibDiq+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IS+VgaOVdMVqdsmKAaqrCDoWwkst6mFX2gValyCmQb0sQRRnVlgj7cRnnDlNA9rNUnGOBOGrOFiNvP2Curb1RZ5ytwYiB/yYqsUzx4xnyga0pWjchAybmeQ5GENvHjOtrh9f1fXm4Vf5e1rfpnox2adm3LI6lR2vCMnkoCYSIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko2q6DFA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko2q6DFA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so2592724b3a.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399721; x=1790004521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=ko2q6DFAjx/o+eac30ySmNqgpBKJnOfuY+7jneFK5LLdxpUzTS5AhAX4HMZEJh1kmk
         rMG3TrXQ3NJKyBrHcaot9gRyZn4M1IOOdA5NOBQCPO+Oc5BsWRNz21VtUDO5s0iJPE6l
         Y6YBX/AFRCiLXYyXqoSsgW2y21HQLq1OfXgCIts5oxsfh75AwEC8L3HLeqrz45QNpl9G
         BRgc4Pt4oGPCqXMSjoxyT3UnK4qZ2Ho+92ytRb7BKCkXGAhRWbDv4KpdQ51v8fqQBTuV
         ppjq75Sn7RQewbguvj8paaVq5H7zytk3n1nDBVYTeMO74V+2h2RRiF4e5hypORlXusUI
         ta/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399721; x=1790004521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=bV73fapnqHbyvo+yBoE1CwKx43KsgAQk2TbMqY5MLzNAUDIPqRB73B+yq+krKzkzf2
         hdQh1v8+HfrxhTALqoeT0W30W/C0oR6BqcIQjcODca1MdKLnI4uBPS3VMiHeid3NCGqI
         npwGOS2QaHrH7GgKsVW+9mXQ1gkB7hiUz9vxUx3yzNYDb4L6I4eTDcE6vP2kAxBum+b7
         qL7iZdsTSwPdFkI7qFI/9q2UQ/dOHuxNsGYL9uSflCALGqXHhzW1kwQXBoE45Sj6Oqfg
         57fDMqDqPF7jFmxMysX5P+lnh70QeexEp0Noefg5LpA3R0cxIYkysNnd4IQPAppxCPO0
         7aCg==
X-Forwarded-Encrypted: i=1; AKwUvBy7EG2a3X5Uo01pNgwJwhPBazuExurWMncfors4otQYfBi78h/gLceYGryKzvQGATjS7LWeR0R+PoeC@vger.kernel.org
X-Gm-Message-State: AFuF++nunec45kv3OnCehJARPnZTeRhpwiMnUDHzrBJRQFyXJshRZrvr
	+uAnorY52UOcYGC4RNEKm1N/dIcrf/R06rPHSQlDI6TieHRbUo4BIpol
X-Gm-Gg: AYBFou07JkrOLi/5M7oclaX0Wtn+V2bhqZHcxO1bLLYpp7B9+aHRmm4ps9/ORbFv50k
	JYUYJRG3EPJTmsnfG5xYm5V71zl0bqu2U6/l0mVfogFitj4yy+xbKfPhcol9/bjjuAVWlaqJzkj
	G5fdko44YM0ep9do0mFzHC8n3A+21KhU482OoLbYh0GURcOKrFYY1rdAQjOsExBbavHAGmwhUqG
	fOgFqTehlbvOjNxwAQAQpoDbzhirJDujdeYDfk50XLmn8eRtRBW1TF51Cxi7eCX2iFfERY6VkRM
	JfZcL4Cl+yZsLtJYf8+Ac1nXQkeYaCf2KmhFoi1g+SQ+SROGNpAZrRrjhWGRJeSOUejwHQ8X3L7
	+fJ2q2VmeSaw5lzxohfXdpSEA9zbwmpnvOZR30mydkA+sCZJy+OScvJOVNoyxtDwGp4EaJQ0csM
	ivdI2JVdKBkDQTbnqOUNvpG/chAFxhHJ4kF2vDroedoMNmp/SQXZTUPV4IPzRJtFpJMEocLMSZi
	/kWlRnqpFpl
X-Received: by 2002:a05:6a00:1797:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-86f865b48c2mr6631339b3a.26.1789399720794;
        Mon, 14 Sep 2026 08:28:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm4929479b3a.58.2026.09.14.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v5 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <db900549-54be-456e-9fae-5f04c69e7d1f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-4-522def70acb4@linux.dev>

On Mon, Sep 14, 2026 at 04:18:04PM +0800, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
