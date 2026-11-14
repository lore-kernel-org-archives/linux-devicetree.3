Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794622585;
	b=AliGyWBO+bFXjGW53enWy5M0dWjHzIQpZS3HwA7SbClX+jjv9lME5pYUT8JEs8JSOdWJ
	 bPlRf4Y0YT6MD/VPEL5oWD5TNX6bVoroOneMA/EHmcKoUQdE7fNjgn1p545q/pJyi8IzA
	 Tvs3AkWdckahbwTkTO4NsterANTRiPqCZu8GlBk/yGkemrMPnYevotG5kgodUYCSzJex6
	 xPfBf5Xx2FgaKbtj5EbtbmjFkkwvkESm0/2C4wfDIvORc6bA3K54KXnV9JvDFxmIiz77W
	 cKOAkQjKM1bsM2haB4U65vmHFYemqbRrJtvnAmiqB59EmfEC3DAUI2B9Yor0Fw8IKeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
	b=XpdLdEp1yO922h2Sj+7Lp09VXkvexNEKFQVCsb/OiZztOeXZHC2Jquh1GKRY+rYvQwXo
	 MRXdgR+Apo0LixFxypF7vaHoigL0rSPkVDVOXZ9as5oZHNaFYKQMVIU1oTp511fTsndct
	 HJyLXHzsCYwCUiAaifam7Gl1l478nnYHzPYBLSx+2KrdJZBH5U94odfv7pQcvT40CQHu1
	 grYcUpvFlE4NYJQFBO+Td3AjxF41k8LI7xuUm554IDQDLGTbCoItm2wAJwQeTWFhH3wcP
	 hcGKWBYGEMAn339Bj/DW1JZpfFJOJdHuzaRU8M6vQwvGG69IDP5/BF3qIHkGCO2oUkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zq2uta53;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96046606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96046606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zq2uta53
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab30d04674so2362341fa.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:16:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794622583; cv=none;
        d=google.com; s=arc-20260327;
        b=gWUTqv8tXy6p+J4pRrAH+l8k34hDAdN/khkSiu2VN5ay2jiuMlwMdE7RWJQQoEVyEc
         cVJXiKSaFQJP4k/fWZLN3As0i0lHlMKi+2QYTkagGdsSK/sTkAYDuIQ2vwQdVUJjXuAn
         iWXV+5rge9zc0F3mNBIjml/wzzSTxFcLNi4bwpqFoTYiYrgxwVwkCEeLP/4DgPfRNtuJ
         b+eScQxMwPWexhxzYH0CQxABofMT41fdyyUOmWJgo4ED40xE+Y7NhKAhi2vAV57ZW5uT
         ahsNxXwK7gJ3PhVD3e3Lt3AG+gnS1eyDIlawaXP4CUBNEq74PqdsNPUM0M6Az0H8v25J
         ipIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        fh=jlBv9+Xw61RO82aOy5OrcNUo9lcT5OBvSOXEAG3WHp4=;
        b=cRuuY/EM8k3PnzY9naJMbGw+76ooNAlteSQihb3O+KV6xF+ocCw8lud+HFXfdPowxh
         WjXdsJEApygEwqcF2BJs4lWb7SZNTNibCXbPHJQ7Xnzw45AgYzuOFXq9o/3dNaSIDKE7
         CQi/C8iDCXzfMfUH0rvzwwsEq7q0/CeSc07MCux48dQcB0li+3CkSKTt43P5qAh6y0xM
         D733BDGuLq0FRgHb0cS8XqKvAnK2XAJEwMDcYgnGZXwHUhhruUYPgIS+cxSemp/TpSaO
         HcxmSYu0o3kqj+3Q0p/yMs/6PxW5EMLtmGgy3rFsJghByBoIGkx/+cHf0M9TxBEPIuvR
         tnaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622583; x=1795227383; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        b=Zq2uta53oVjD0LIq0TrU1C++Y4NBDFWDpm96qj3FoZltP7bJ+o1WForiZwhumN22sp
         GxrqQVpg1IWerdRFq6+qJ9R+XPHCyOR5iE2uJ1KuACxrtfq/ZPhzExhNdp2CS3cMO0xL
         SDMEqz6ZAyrxdL3BmvzdMbEycQE3pCp7PAw1I36dICN4SkPI/uXE6JaHw/blbE4GwW2K
         x44G+UeVpu+nZiBRwiNcIB8+ZkycsSqFeh6IIlxA1h/PFlaSQB6HgzIFy4U6IYdcjii9
         4fAZEfQ948QwroZMSjjvjzLtbzMTn4QLjiFh70xlvuw+L3ADpK5yKqWJDQrYiAlBn4CG
         Gftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622583; x=1795227383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7hluQx0je7AzLQg08yQ6Lfq0yJmLSYFDYkKpRHTVUGE=;
        b=z2kfQbGTOqUAstcgS53WrIdhRfCOOG6l+5z0FjL4O3EPVO4X4K+JD8u061WIsxnNts
         Vf37o3JBp0topFLRFVnf/F5O9sOr2j2Jz+aTNVIwRvnvjv0j++xBhOfNhAXboq2Q5Spn
         XRk8PRTLPcahvqtDvzNJA1I0B5OAbdx021zFDwI84oJMEuPC+QauPdvD6S6V8+uJbOFI
         O6ByuqlIQA8rAS+9zqTkl3kcV89j4PMuVartTRY6i0Y/jK87JstDcv6zdkeaAnnVmbYL
         fGZYuvSgG/nroyoJh1q6gLwL48KIMvYlMzN3DNbUzPP5T8OF0tJa3lN9PXIkq7W+spYt
         WXBw==
X-Gm-Message-State: APuU4Z+Mr0yaXrDcPF3PSahQFtTzI1TdcBREVjDJQVVAFWvLVI7WsW9y
	FJZeJdp6j68dvWlSejZPHIEqZo8WqulAuzsRi/Vyep+W98A6CZHtBkZ+R32SzrLScH0uvHKMYSd
	ZpWfWsLdasiQ+hOKAR8WDmkU3KNcNCzObIk2wGFoVBA==
X-Gm-Gg: AYBFou0Z3GPCQubs+bWVwmKMQ4pzryXXeEgerQnkN3RRRhWP8n+FbK0zF7ZcNd1ElsD
	JmkHgMmaUJjhiUFgS1Ahqa8YC0dg6pjArVi5BMTWxi/oQMei8wF28Q6YEPWV3wloUeOCB4pn1yW
	h0nKrzSiZVa3Vom4NOgYEqhz+fdQ8RMQ9fVh2MRMnGfE30btwKmzBz0MWOw84pU58vYf2q9hlub
	XD4NEOpo8f8W19g2V5RmaaB5QX2VK4CV4UNjH+BM6nodHhZDR8QRcSUjYtTlpvVeMSuysgk8Qk3
	SV9Go/8PeZ8fqRVs3l1MdzkXCvpdxABMx94Z5jPFXBSoW4NmaVhNNuZbJgGHILU/OllKhR1rsNv
	mp/FTtD4HWiJBNu2ul1OHix4C2eeo32F8jM0mHm5pVfn/kv6wXyyoOXhFY/iK3blq2pOJ/es=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr1957787e87.0.1794622582532; Fri, 13 Nov 2026
 18:16:22 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-iep2-v1-0-a8edde5a21e1@gmail.com> <20261114-iep2-v1-2-a8edde5a21e1@gmail.com>
 <sashiko-outbox-213935@kernel.org>
In-Reply-To: <sashiko-outbox-213935@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 18:16:11 -0800
X-Gm-Features: AclHuK-eumJ5EkgAdvIOsdvyNYB05MQXF1E8x5skysCUrSKB4NwrQuQYc1Sc6RQ
Message-ID: <CAEy9hNXWr-v2r0rX7QO+Cu7NdTFk4AydEcn4qL-YwyrVTMRLGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rockchip: Add IEP2 deinterlacer driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

> When pm_runtime_resume_and_get() fails in iep_device_run(), does
> iep_fail_job() leave ctx->prev and the second field-rate CAPTURE buffer
> queued?

Yes. v2 returns both.

> Can writing 0xffffffff to IEP2_INT_CLR drop a frame-done interrupt when
> IEP2_INT_OSD_MAX fires first?

Yes. v2 clears only the bits it read.

> Can v4l2_m2m_suspend() race with iep_release() and read a freed m2m_ctx?

From remove(), yes. v2 unregisters the node first, then calls
v4l2_m2m_suspend() under the device mutex, which also waits for ioctls
in flight. In system suspend, tasks are frozen, so no release can run.

Arun
