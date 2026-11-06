Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793931082;
	b=Ayp5CKjZuM4qepgabeWqT0Vh12pfo/YscDqBEty+t5ksnGAIhYDpztpmB8GnT6NpTQe0
	 GB5iHGCPGCgCqKoK5Doun4B7KDPjQg+E30jiN3O5bN6WPHQ7p/vE0Dd37ZLNkjrw9HmVt
	 TTfvX+SCaomzqLhQ8cLG5yv8ihQduaVa25SwjAmmjOpSpIZPVFuBw3zgT6n/3aKG4hZjk
	 l9hIn3AMKtXWUrjgLsQr72lu/9COrHrDrDpUz2H6OQ0uPMnzpwH7/HLp+1pqMzWXhlReo
	 kXrVLeyVoNmgr9bo+q6foN5HvUYAIEQwW3dEIEmZfS1IQcJWxe92VkOrrTW2nBfilRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:In-Reply-To:References:MIME-Version;
	bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
	b=pA2ecDkXeq8QpbzWahtrYfdcG2BgXTgN7Ave21Fu7zlaV5kI0YeJhLcQwiy/QOJyf4Qc
	 hRdcOmdFrP7/c8sQuveUKE5JznMu3SUrrJXE6khUk5RiO+5/201XthTAYYOr7Vig3Q3yW
	 NepcA9I7Qdj7mokvKbfxVCLroeQt00ry9y3oGZJvQqmuxfb+in3feGQlNjG7ZIrIAb4sG
	 0jhG+Cjec1McXLXEtvmiHi0DaICQTbZkAcEGelOQJTdAM2QBcTxv/o/nu/fj/cUwjRupm
	 t2jXDK2B/gKr9TqoQXZQJtO9OklAEQesrZlH0fHyjE271zBs2r6FvJ1UhN1W/vLrhUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="bd/1gPIM";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70C606A328
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 02:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF70C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=bd/1gPIM
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso466768eec.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 18:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793931076; x=1794535876; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
        b=bd/1gPIMML4DE+FFEFx8J25j7lGYR+PX0sSnFmHkdk/bm6JCWrsXM9/nNxODkEmv7v
         KYTrQjqwUOlS5hJ32SIXnTgqZRCQUFhel1fwmuxL1iV4oDrFFbxGRi3/GoS4Hr/l8V7u
         tSLNPHRwD+6ezTizTFhHUmfV7in9PQDZmcVdoW+BOz98YatfDA9PaI8sFjVHMfVCj54+
         0+IsgPM2bWdNTaY/6Dz/IqRsPD7ndLzUU4r2wG8Skit2rcjfYkmTvAJCxN1oiFQ+vBfC
         hDxhM3rLfxnZ43TGzhYgEFDOscXW/0apUlg5ejiR/7bf9HwuKqb3YBc3gGzJFfxk6V/R
         L3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931076; x=1794535876;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf62vaeUsY2yO43cSs/blH2TUhxnaYyy44Chrc7BGd4=;
        b=oqG2YUQQAemrbDA0zyxhXPqSeXNXtsGuqLquaoB4LLdL1rBRdWAKYohxgiQDP6nOMc
         GnXJpF5kPotE562cLfpP7+LucOgwDCP2rvPW1+de2aSN2F1eLrhkLWuDgkKB/46vcxU3
         WtbYYdNJcfQyrsfOhvUk/rL+7d+t7TGh4CYKbqwLwv3c1ml+fhzO1xfVG4r8daww7wZG
         ylkBOrX+nc7j6a3bF6ChicECdfuRtFKNjfBmm41C7E18j9Vxdv3iEX10l9g2OhYfmTTC
         eAmPtYvxNR2EABM/aobAbJ2OiTxH82MDFlqVZVt5R0HRwEejeCHwej+rgeXae4uOdEcE
         /YRA==
X-Forwarded-Encrypted: i=1; AKwUvBy9Yx0mYzE0zcGoushBfJMyPTSaceEogoejC+70A0ukdP4p0M3fCOt7xbF1eWkuJ/+zX57nvjhprpde@vger.kernel.org
X-Gm-Message-State: APuU4Z/3gpggHF4PcW4HSiI0hCBI69vKf8Z0SgVblnagBaCM39ZRxbfU
	b+Lub0ke029g+SL6RG8TX+RcUTYoxCQzH28GK3fkadEzgZmVEB4FQJxY3LpnEJ7jB+Y=
X-Gm-Gg: AYBFou2m+4/5YyveApHlvRzRuXoqOASRLDVMr4ZWmCl0rCZgU1Uauf/hzT7mZT5H6Bc
	50GE3Ylf7pNaVJyLJcRgwz5QwTZ0+pwF04WCt1ZYU1mRttqSEUzrH02u2Bv6vTK+9qChWlSACkE
	8ZNpU7Uxa9O1fnTDIDVzeKFZn00WtdWeo4qz5ARInwzZBrHQft4R0aeR3RP8eeuC1SCWlfUCfe7
	zPg3UAkOwUkGtX9EeicxQB5O2hngRmrGWFrwgGzN7iUH/W1hEbqdezYPXB9BnVVEmSNPO9qwmdy
	JDf/0S067EKwgzmL6P9jK7SzrMhon/DwAFrtuSkGdIyeZ9lGXk+gCaQx8Nb9YhKTGNpEqsPPwl2
	wc/beM/nHKVuaIUDWXEJfbZsff65SqVzmNODO3gwaVbuQMAUZ0FSwreTzJfsN8HXb31g+gZ3+DX
	s0QvcBCdiXWkMnfoW3ECaFGKdK0RRKaPs+EshqYfOiJhJRklmTl4nxamwJ+hSWs+lXQLD5MSAgO
	Tf8dzMGdUaLqddMatmEqH9EdUOvHYY6pRHls2E4QnpZrpn0cAPPaQPJZHF1h+TIJdYEyMKSakWI
	oNGSBoSu2lRilGeOId5pG0PI0MX1nQ==
X-Received: by 2002:a05:7301:18ac:b0:36e:c04b:53ca with SMTP id 5a478bee46e88-36f76c11206mr1366102eec.28.1793931075409;
        Thu, 05 Nov 2026 18:11:15 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faaa8f1e9sm1136097eec.28.2026.11.05.18.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:11:14 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 18:11:14 -0800
Message-Id: <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105124030.GA1449284-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 06:40:30AM -0600, Rob Herring wrote:
> I'd rather have my added device working than refusing to probe because
> some arbitrary device index couldn't be used. There may be some user
> that has a working system today and then this change would break them.
> We can't really have that. I view aliases as a request, not a
> requirement. It's perfectly valid for an OS to just ignore them
> completely.
>
> I have no issue if we make the failure to use an alias louder, but I
> guess that's not your main issue.

OK. I'll drop that from overlay-notes.rst.

Watchdog and rtc already treat an alias as a request: they try the
aliased id and take a dynamic one if it is in use. The subsystems that
fail are the ones that keep their dynamic range clear of boot-time aliases,
which they cannot do for an overlay applied later: i2c, i3c, spi and
mmc. On x86/ACPI and other systems booting without a base DT there are
no boot-time aliases at all, so that range is empty and dynamic
numbering starts at 0, right where overlay aliases would land.

Would you like v9 to give those four the same fallback, with a warning,
so the behaviour is consistent across subsystems? For i2c, the alias
lookup would move into i2c_allocate_adapter_id(), so i2c_add_adapter()
just sets nr = -1:

	if (adap->nr == -1)
		alias = of_alias_get_id(adap->dev.of_node, "i2c");
	...
	mutex_lock(&core_lock);
	if (alias >= 0) {
		id = idr_alloc(&i2c_adapter_idr, NULL, alias, alias + 1,
			       GFP_KERNEL);
		if (id != -ENOSPC)
			goto unlock;
		pr_warn("adapter '%s': alias i2c%d already in use, using a dynamic bus number\n",
			adap->name, alias);
	}
	id = idr_alloc(&i2c_adapter_idr, NULL, start, end, GFP_KERNEL);
unlock:
	mutex_unlock(&core_lock);

i3c, spi and mmc would get the same few lines in their id allocation.
mtd and serial don't keep a range clear for aliases, so boot-time
aliases can already collide there today; I'd leave them for a
follow-up.

That would extend the series beyond drivers/of into four subsystems,
with acks needed from their maintainers, so I wanted to check you're
OK with that scope before going ahead.

Your two earlier suggestions, keeping alias and dynamic ranges apart
or only honoring overlay aliases whose names are absent from the base
DT, run into the same empty range: the first would reject every
overlay alias, the second would accept every one.

Thanks,
Abdurrahman
