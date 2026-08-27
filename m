Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5436E470
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 20:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862039; cv=none; b=H6yGWDwDKMPppL/mTwUlN+8g7+fq3g3vTuRJ6eAwmVWgi46rQ9PtM0lFUTYrRIm6UqZCGAhIe0tXo4u+IKx46Q7TPUnnVg1HnqX4OPz6uEqlsKZVfXm9Lr2W5mgvWeQRA6Ck6pMNEI8ndEjREC6WmWzvpecq46W0dvU5rbG545s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862039; c=relaxed/simple;
	bh=tJimLvz8hros9dSmfDJysxYfTDWnrLxW/FoUjUs23dg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FnMEhILPnQ+sJnukjMhRErXmtOtEms0TO9/tCaN86k01iASO+yL+FGeu3jVuYfF9sLbgw3DS7dDJRo8/xnR7dNZBTk6BhLzaZoXONOoKPB5f9SxjRXgA0Lw7yjvX9/Qvt7tGzimHc8ksfzXMl1FXAbYGdR3H1sD0oKSTQuYEmNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Fx7Khppj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Fx7Khppj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cace91f112so1082305ad.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787862037; x=1788466837; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXvemU9UFXdH/gZ9SK0wu8lR8TFV/Zr9aPAhcoeF+/4=;
        b=Fx7Khppj3qKTx42ADj79xuMpvxt7qK8gGEkl5SSXq1olQUdnl3wNGj0sJ9ts3Xikyy
         LZptGpZpN86NakQXGMNNrCo+V2hTy1WC+M1Oyeho45EjhLFglmhnj0mz3nJTjq2kQBs8
         xPgLtTVFvSpyIyTOoVeZQ/Lb+66orPQtpvMsHQjStaIw2gsLP9PnwU3cYoNQjWWOchfn
         GdXUeWei9WiihxomN4pXD7zgFKhRtbPbbtEBDisjEdxatY0OC9oK3HLmlKJrYwquWUh5
         SfpyEI0J6wmE5HTeWhpL0122cQZjnDOs7DalYEr6wmpCcgtHjzuGvaP0ohLu3LXbYGjo
         9F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787862037; x=1788466837;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXvemU9UFXdH/gZ9SK0wu8lR8TFV/Zr9aPAhcoeF+/4=;
        b=HmKRwpZNp/jvpvGsfTcTc/ZH1zXphNdrui5K3lJr/OjMqSNlejSX37qlf+rcz1OpED
         CeBkV7r+Q9w3s2LtOPJ2eY8ZE8n0Lu8KWQsFt7YEAHIWI8LqadgGiBc/jfRlMrEcAwf4
         Yy/lRrYTaazztW3cDcDExkigwPlN5O/tED8SAt/MP9OLJOz+A1nP641w0+vrFZMrx7mX
         I7Zc1xYKAkayjyiEh50qffvfIuCWv/7tNNJLi5sd43Nro9KQCIhZ3j7oj8IT8E5/7dSn
         kLCqmC7rnIVa+z4sZcMg8Cbx4HGDMkYKQZiCiU5MIiGADHXxy+I9JMpn6zkz1EWvKHcP
         0ZTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG7b1LxE8kH+eTyTY5pYNoxfWa/NFI3So5MlVTs2dIE0DenLYUHk7RkdXBNVuthwSSHrGNMk3D2M2B@vger.kernel.org
X-Gm-Message-State: AFuF++nCBBI9Er3L5YZk/ncwL03DlDF9S74IX+d8zkUq2q0kcGzFvOre
	OSp2jBLkkgMulxDA5bSPvYOZvDtyl70kDyT8/nLw+zE3Xuw2vKOArIygSLy6fl2FpOA=
X-Gm-Gg: AR+sD12p6Wq8zpseZWGBRxYH4nkh8OZ1HxfyOYiej8hAHrbiVkunlsKl6uOhUCqy5Um
	KtFlbeSkIHYQAROPOTfWMz9MY4J9GMZyErRQ9uiSxbuu0pe9ArHt1phr3e3qvMHYLPQMtRMirUN
	BDTac1bQUyF/h5MfwN5hroDqEKewDJHKakrpyDMPc+Qb8j/dFGyg+pdm8NllclNdcWh/nsSxmrh
	iqvXtLrCOTRtFbsZgcU8INtkLXnBo3yjpzpqq2opuIi6cTR6Ye7Q2zODDqj3gwgBFGjCV+BClzo
	8t44fFUAg1n6O3HLHwQlTggzcXMuR1zcaJDezJuOZ6UxSy6/EReUW3nmxnJKQ7OymenYwlcBoXc
	/VcaRQJ4gqsUyd7Ozpi8EiZEf8RWF0Pd2C/Y81cztBauyWHZhKWQdSDP7mu41JStghgy3A++U7V
	1vHwNk/e6yuXHQeOXXYkoFHjwF2DFDrQ3ii1Sa6F+AEl5uCO2uhHuRuecGxVM8
X-Received: by 2002:a17:902:e751:b0:2d6:7409:7145 with SMTP id d9443c01a7336-2d74dbfe91dmr20727125ad.1.1787862036843;
        Thu, 27 Aug 2026 13:20:36 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm24757559eec.4.2026.08.27.13.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 13:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 13:20:35 -0700
Message-Id: <DL0074F6I9HO.5OPQ5ABY74KS@nexthop.ai>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawn.guo@linaro.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/10] of: hold a reference on of_aliases during
 alias path resolution
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-2-74f21d440819@nexthop.ai>
 <20260827145237.GA3212208-robh@kernel.org>
In-Reply-To: <20260827145237.GA3212208-robh@kernel.org>

On Thu Aug 27, 2026 at 7:52 AM PDT, Rob Herring wrote:
> On Wed, Aug 05, 2026 at 01:31:01PM -0700, Abdurrahman Hussain wrote:
>> of_find_node_opts_by_path() walks the property list of of_aliases
>> without taking a reference on the node and passes pp->value straight
>> to of_find_node_by_path().
>>=20
>> Take a reference across the walk. The walk itself stays lock-free
>> like every other property iteration: it can race property surgery and
>> see a stale view (a removed property's ->next is repointed at the
>> deadprops list), but nothing it can reach is freed while the node
>> reference is held. devtree_lock covers only the pointer load,
>> pairing it with a later patch in this series that clears of_aliases
>> and drops its reference when the node is detached at runtime.
>>=20
>> Validate the value before resolving it. of_alias_value_ok() requires
>> a non-empty, NUL-terminated, absolute path:
>>=20
>>   - an empty property has a NULL value and crashes in strchr()
>>   - a value without a NUL inside the property is read past its end
>>   - a relative value naming another alias (loop =3D "loop") recurses
>>     through of_find_node_by_path() until the stack is exhausted
>>=20
>> All three are reachable with a malformed boot FDT today.
>>=20
>> The name comparison loses its redundant strlen() pass while here.
>>=20
>> Assisted-by: Claude:claude-fable-5 [Claude Code]
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> ---
>>  drivers/of/base.c       | 20 +++++++++++++++-----
>>  drivers/of/of_private.h |  8 ++++++++
>>  2 files changed, 23 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 477017ed6f49..eca1f55eee87 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -995,6 +995,8 @@ struct device_node *of_find_node_opts_by_path(const =
char *path, const char **opt
>> =20
>>  	/* The path could begin with an alias */
>>  	if (*path !=3D '/') {
>> +		struct device_node *aliases;
>> +		const char *value =3D NULL;
>>  		int len;
>>  		const char *p =3D strchrnul(path, '/');
>> =20
>> @@ -1002,16 +1004,24 @@ struct device_node *of_find_node_opts_by_path(co=
nst char *path, const char **opt
>>  			p =3D separator;
>>  		len =3D p - path;
>> =20
>> -		/* of_aliases must not be NULL */
>> -		if (!of_aliases)
>> +		/* the load pairs with writers that retire the node */
>> +		raw_spin_lock_irqsave(&devtree_lock, flags);
>> +		aliases =3D of_node_get(of_aliases);
>> +		raw_spin_unlock_irqrestore(&devtree_lock, flags);
>
> There's no need to take the spinlock for just a get. Furthermore, as=20
> long as the of_aliases pointer is exposed to the rest of the kernel, a=20
> reference should always be held. Not that you should rely on that=20
> here...
>
> Rob

Agreed, dropped the lock for v7 (here and around the of_aliases
updates in the notifier patch, which are already serialized by
aliases_mutex).

Since patch 1 is applied, I'll drop it and rebase the rest on dt/next
unless you prefer otherwise.

Thanks,
Abdurrahman
