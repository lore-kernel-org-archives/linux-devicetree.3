Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A037755A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 18:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955676; cv=none; b=XCragm76b6G+JiQoOjOl8D1DvX+HGYL0eWWHt62EcX6wU2hCtZIr7JS4TmHHUq3oxrdIehZh6gN229uBMfgLfabyqbxIL7QsgXBADzrBok5ShaAt9YpR/eb2bmRGsmLVhUGryBipGhGhjBN0Z3OHfn2o4wMULEVtYes5jsA32fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955676; c=relaxed/simple;
	bh=XumjtvdYNUTjuJIkdsqEWpFTPQsUekL49pxS9GwogpM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=NY7odiAOaXeC2VmrwjXjVe3kAOJgKyBZEc7Ye4/32oRP8j53OgYMFb3Tx0sGPFyNWXuKVCNe6VCLjN0QfT/i+Zt93iEx4uKXe2NDYkjsWKqMu2a6UZGmHvafg/UI1XD3bFqRdlVTWOTgP9G/5PplbqqOv6wr0fzVWRAkJjhlVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=O5jB32+M; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="O5jB32+M"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1017757a12.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785955674; x=1786560474; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XumjtvdYNUTjuJIkdsqEWpFTPQsUekL49pxS9GwogpM=;
        b=O5jB32+MhEMXauPgRJRNTEDwUiqYQkPcKcNOSPAZTNPlWN+F8Eb1xmNhjHgGouZ5TU
         FIU9R4n+nOGpM3GzrV1nBZxmNoDmNDa2bW08+rfkyoeci1TSOVuwDDamL1AYcgmvkIiO
         83BnuN75ESt7yj3wi3HVVdeCu968QwLWJOo3TaqWV4AOR0ZaeSqN6yitY3VlW5FCoLIo
         Y/XXEzRyX7YE193fldICA/hReZBbc21JHdo/iF1j/cp17/OtzK1WjHKxJcmw/r7T+aCq
         gXcFAGPHyPsPn2D+sMMnWdHWSkV3UFddeOQ7CGMPna93VFnO9QiCZjgg1PZXOEHO+KbA
         RlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955674; x=1786560474;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XumjtvdYNUTjuJIkdsqEWpFTPQsUekL49pxS9GwogpM=;
        b=tDMO7PPLpsbqbNTOxhT9BetuFGxoWzhmVKbxND6Kl2Gz4bmfWLlfktCtK0D2O5jtyj
         yzOB6KPj89dtu4a5Frcla42A9tRSxZsOcBomZe5Dk8q34LZ75rr9437h6LtAC06Wumyr
         E/YAWtmyhkA6iQQbECkhrbmlZkGtAvIeRTuk8r2qUbRZI8FiJ50skIxc98nHHz28rIMr
         w/lNv4oMG6OmRIPKCCIyR17jEiiGBzjhDVC57H5y9gYGm9vs2QMkslC8ZgOmwsAHOAEO
         ogCPXEEuIuFWLx6Ssui6yUTn3Pn7lfbwEp8xWUGBGGyt9a0mvRgQKk98kcifMKSd/s4a
         RQNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrH+PqdVtV7eJZKJry/8fyWsAe62LDd7ckmLKSkoFhAzUoCMMsKtfOH80RdnuHqCnDqdjZew4wU11v+@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOn8jMHtUxAK/MiF3roSgNA7DOWLPWgaUrK14uWd4vzmz3uOf
	TFv7GqKikA43W0yJfdDk7vCn/iH4J55Vbesy424bDDQ9c5VCSqLlp+9n9Amg7vV7COc=
X-Gm-Gg: AR+sD11ivgANAU6j1KUHV+ZR98Ly+jV2fyi7QqDMrcQbflaVzQ6DUgB2UneWyac5SS3
	M6Gch9Mh0Ndof2OUyZ4z9S3qWx+r7ZVpmCKwfdOK7Z7GQQH6KROf5x6z0DxPeRLRqPDrjvzAUPM
	Y0PxowIClfvn+HIigXjXVKj479rKixQIYkjHxsvn9sIte4Z/AZvIcrxZwITU0FRHxqQM6FX3Fq1
	P8sT5jU8zJqS7EgrTBu0lgLmZRLJE6uHzotW4bW/Zf9zUIDoJTSkkI89cc6r5s/iuUg+UEL3eJK
	P8UHk1sWz34N8Ga0HONVePenqUMNmxWbMQhXB1L4SheqjzlBGtrUWYi3I5ZofxPdr58sR7Ncljc
	GJ5Qh1MbpeikPwL4wlmVIdoRR6HBcQ6MDCv8daZbIDPYF6ih3bjc5DMNis+0GNQ8Kl48pVqAcni
	+a7X1tsrUJZBmNYJ2sNy328aVzD9HLk2TudYWaY9FpuE2aXQuLFKHri13HFxgwjoA8me95yMI=
X-Received: by 2002:a05:6a20:6a08:b0:3c3:a9e1:a819 with SMTP id adf61e73a8af0-3cb85f44592mr10042387637.24.1785955674588;
        Wed, 05 Aug 2026 11:47:54 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fd2b3sm20434536eec.7.2026.08.05.11.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 11:47:54 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 11:47:53 -0700
Message-Id: <DKH8G5UIHT8H.25XKJIEKX4XTQ@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/9] of/overlay: don't keep a negative id in ovcs->id
 on idr_alloc() failure
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUG0RH6sFpBxp-dXw4S8kdS0oyyCL=wzKE=TkheWQAs=w@mail.gmail.com>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-5-2abe2bb9cdbc@nexthop.ai> <CAMuHMdUG0RH6sFpBxp-dXw4S8kdS0oyyCL=wzKE=TkheWQAs=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed Aug 5, 2026 at 1:26 AM PDT, Geert Uytterhoeven wrote:
> (Alternatively, free_overlay_changeset() could check for a
> strict-positive id)
>
> However, I am wondering if this is the right fix?
>
> All error cases above just return an error code, without doing
> any cleanup. Failing to allocate an ID doesn't add any extra state...
>
> > goto err_free_ovcs;
>
> ... so shouldn't this just be changed to "goto out_unlock" instead?

ovcs itself is already allocated at that point, and out_unlock does
not free it, so that would leak the kzalloc. Going through
free_overlay_changeset() is intentional: it copes with a partially
initialized ovcs (the cset.entries.next check, the id check, and
notify_state =3D=3D OF_OVERLAY_INIT from kzalloc) and frees the struct.

Your alternative is nicer though: the next revision makes
free_overlay_changeset() treat only a strict-positive id as
registered and drops the reset at the error site. Added your
Suggested-by.

Thanks,
Abdurrahman
