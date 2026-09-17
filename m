Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3681A0BF1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603552; cv=none; b=pAsdxdtpzV0stIuuVCp65BJrn3pvxRENH1fxJ++z0CUPB6quhiWxn/4i4Sp/xRML4/e9t06WRHy1XOHcLh6UBzAJIzPL+0OICG50I0x/SEBJPNczRic0tRIV2zT07pOCNPHwJzLCPM49CvaacXSlFEc9Dsv0icPJyWCz63lgyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603552; c=relaxed/simple;
	bh=YfBWQIfeWmSq4z4LF/oUiBx8g/eXxpGJ0xbwZkgPHfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQsfnOtmko272cxJ5bMW8ojdVfKbpAwkj+PbJcGByQwiQr7B+yXc0o+cKN5oF3x4STBI0DALLRnOklvhI/LzTuxNoF4WMKCeXlQqIeDs+FWKTggYrn8sJyzas2Dszx2681h0PhXPumUnxFgeHHubHpfqiCQ595GJul7oezkIkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDvGRhQn; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDvGRhQn"
Received: by mail-oo2-f38.google.com with SMTP id 006d021491bc7-6c901f4bfffso120508eaf.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603549; x=1790208349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=LDvGRhQn3VgrlTn/7I9Mp8PPtXW3tyO2yjU+zXNyOqfvmFjOsYcLsQaA71QBCORvlr
         OYALoQiL2dYZBd1FoZb75vl3IfSH6vZ11q4k5NPKgbsI+JcsaAVeb1uetQDhIB65mHHl
         zUlnNDW//JAxh0xacaCDz0rTFbYS6MH59qvacfr+72k5/rFR7r0HQHfF78oxMp6CNylN
         9ZjDUWpFj1YBw8JfqnTELXUZQ9sZFCMfJLJ7kgJjy/Wd4OjsCx4Os+FeM4Nfw/fzY042
         5ANZ/W6sxwywd2E1l7KGuX/Uyp6M+l4UlkgCjWECbyKfpBxtvDyDzCQ2xTH5c9j66TvR
         sfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603549; x=1790208349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=MCBN0RwH2OUvuESLeWNFKk5UuTC6e6Rzkt2XQCh/3NivJoBEfhKTlUQ3+1019gJ7jd
         /cYs8wnYV5/jR2h1FAObmiVUa6iW3l43ufXG/0lPNGGbfGUBCp5qvD5t1SKbhg7cd6/8
         1tTQ1Szrgdl4OQtCsWEEvhbGeD1MozkvLo3zQhN0NFYBhSlPQ1/oYHQwpgySx29eFnlu
         ujomcoXkducdtYPzTimhG0i6xiq1J4wk7QwO5AAvxk8E2SQ1aEcjk+Sfot6sqhM4mN0o
         Sw3ceuyDhpLIf46hmJscMmbeh53PG66jD771rhWze+G7mP0ULkNTIS8bWMUOaM/1LBa4
         4WLQ==
X-Forwarded-Encrypted: i=1; AKwUvBztuCQheQ426u8NMX2p8GCHnhfv35K58vhx2cx7I0q4pxHzXgOCKKu4VMfPRUxksu+sQe4y5rac/n1c@vger.kernel.org
X-Gm-Message-State: AFuF++kNog3ZY7j0WLPiseuAtitVj0UwZw5b+8ei2Bi9YYK370mjar1c
	0uxnL4U1o0pZQR/FqFdfqMi5RXd6VNIbvZj9GT+kxXot/xlUxeGkBzUa
X-Gm-Gg: AYBFou3FZgmGbE7we6W6fNYG7GjGyUnQUcNg8SNVv/hkizcDW3MtzFaSi7Sky3/kI/E
	/Y77FNxJ4Y2IXYKEni7Bm0rMQYgBFbvATAhuaNZUZcWe8pid4SH6X5W+Q82RQ4VfwlVsCFWg+T8
	bg5vrEAhgSz3CwK45oN/7i1Yi5x2nBlCOzxU/LM+ilNQNXInUJKatefoO62bfHnZvHEVLkoN18q
	WgtLmTppT1cSLfUBqXtEanqcnli2qOMSZ4KawVqJNun9VGPZsbQ+4QOgHuDTQJiSTVfdg6AQ3HI
	WVqJv9wN/BlOh7CfFFiVjC/2drxP+UhyEOiFqVNP0r6hrBIT5jm9igYuemdB2Y/uK5CkhMkCBN1
	JH/H26XMlG7G1r4qbBmUQ5+ZSEYPCw36SFPFhSq/a2qKfTEIiqqHFFm6kEv7NBGPFdm+HGSGXmv
	iWIwAqsX2/MzFHIZWgMcJdamhOBP+xzvVbpymN6exd1QHynBMK3fWE1HXti27hoNhM3DL0LHtD8
	juYm2CRTxpX
X-Received: by 2002:a05:6820:3098:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c7d46e698fmr4348329eaf.64.1789603549061;
        Wed, 16 Sep 2026 17:05:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm9349126c88.15.2026.09.16.17.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:05:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:05:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/tps53679) Select page 0 for
 single-page TPS53676
Message-ID: <54991706-16c7-4033-ab8f-6ee1149d1702@roeck-us.net>
References: <20260916235406.681131-1-sanman.pradhan@hpe.com>
 <20260916235406.681131-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235406.681131-2-sanman.pradhan@hpe.com>

On Wed, Sep 16, 2026 at 11:54:17PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() derives the number of PMBus pages but does not
> ensure that page 0 is selected for single-page configurations.
> pmbus_set_page() does not update the PAGE register when info->pages is
> 1, so if boot firmware leaves PAGE set to another value subsequent
> register accesses may target the wrong page.
> 
> For single-page devices, select page 0 explicitly.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
