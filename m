Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0443BDB4
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537739; cv=none; b=sFMDsTl6D38g7OFCI02Q8YQavtxORLxSHY1wslWFinlhxmYsgCgqKVjEoQDzmfB+dYF0OrfPL9L0yLtgNzapzXi3eRGaRAye9N1QKLPuTykZFc/Cxno4Rd62d/IEZX6tezGjngw8G9UINKHJREdDN22ufAdQpsE3L1kU9h8OJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537739; c=relaxed/simple;
	bh=kdpZP4xg/VhgCdHAkccQ6ixZtjirtaZ2TD9ZGS0+400=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+2KrcJShcTw0qDc+pgoyGiEUj3IIN+kVEgWozyeIkq++/YiioRIi1/cnTC0cLS3SmQf/WEd+NtTkcDTnxR8AcAHmHb7kUnZKFUIR1d/BlJeII5zlYoERwEcwV36BeylgNmMGFvVBkkNb1muWfWDP6QMWujpOu89OiZvj56EqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EQ74UuOI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EQ74UuOI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc891373e0so14624185ad.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786537737; x=1787142537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPkqpQK/eCI2cRMpLKiUTi0EsWR+uqYYbKQlHRPEe9c=;
        b=EQ74UuOIX5ql8DD3ajTEmUCCd0pSgsukd+BDcBsHZ0pS51MoU6RqXAt9iX0BkXcjsc
         CUbfp54k4egzw8dvdcCy42vvbw+t1IbK5Ew6VOry09/UATPwruPdEmCqYvqfMtcjkYBV
         v8SZSQao8Z5AtvH+u97VSVmpBbrHMisTTNwvT75Ce6cCVfIk9m7mz0NkjLAnY5MOyN7g
         X5+di/xJq4H0D1iTZhj/piMLL4EcidWV5AFVJUoap0kIt0bFeGcUEPvFoGxFmRkzVB9G
         ZBD5AM3iaRQMJL86BuuSgn2pNI3XI+04SggPjHWa9rZjOuiS6yPyerIAEbF4zGpb4Nal
         ucxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786537737; x=1787142537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPkqpQK/eCI2cRMpLKiUTi0EsWR+uqYYbKQlHRPEe9c=;
        b=BY2Uvf81nq0ShifXz7lmvxqUSMBZOspRICnWoiUHY0jj9ePC5pEGPXYD/3ANOsH3oy
         TGTxsg6/Yb4j5aGVe31VUiabSG2TeuikitpFYmra9f4K+nidm0+D/u6Sd8z2SNEZD+Qf
         zGg/XOXd9PolYHfjQ1ISgD53edUwW8cWTpNYT3uIxlGEBn2ARqoeekg9A4KxMXpAMbIU
         2HpU+AZWHtHxc8zRgeTcQA7HtyoXcvfRncbHGJZlp57AMzfeW9B8dTD1xXSbH/YO/dV9
         iusTqRWZOGiX5sk/w4pZnIC+39fcZm5toqv6eg9am5GoHM6iGJ7z5h/zggO4RaMD6R1A
         +jbA==
X-Gm-Message-State: AOJu0YwoUmf0tM957zNM3wDsjQLYPCHp7MGt9q8S3m7Q2FIUIKAtuD6m
	i+KpT4NkJz70wuA244ZurljOjTTbBwlJfC2N+ndJFpuwIVzxYmBKbtBKMoAGFme+qUn+uGHhiH7
	/d1YBxsKAG9JK5YYEwrm2ozxD1wPo3ls6X/PgCYZghOEMwK0z7H+7qCMTeo9toeV2/HlfUoMKBd
	/K6O5SJbY88uxCc3xpylg8cC5+az5Jxva+zvJrzH1bt/uRLiyCNTEx
X-Gm-Gg: AR+sD12rua3KUCmuTwDJlFMtl/5l5bS6j6QIHXXRhgl8rsScoyc2TjHKZMS04xXwAgc
	Fa71zLp3PhSmguEVHtZdohJ9LhBjqqR0JEVbCvIpLKUsLQfbC7JP9az0SNDHTtkFgC5B+lAkUMS
	BONqjf82l6mmGBrqf4fzANl3EuSzvCVHs/UEgfL6NVa+Cq+OoQHGnBKLpMg9y41i0gB1qz8/Ges
	EpAgS1VWbw8rKk2ofSPUDrAUPk7zB0b2P2VnBhsaukvcE5C/+6grl3O/5D9GCWsUwlAtZwg1rh2
	qPLZku6NgGFOcqEhREdx+dLvBY4no3omi0rj/93zc9FMZ9fvfkOrVj9t13rhBUlWdI7fMyearAo
	dFOLM4s2Fi/eOuzCoQYI/eN5LBIoL9F0SjZO6Xf27qO6zaQjwUVwc9ah+2Jxa1A5C1w5m1A0J5m
	omPzWM3ob77cwHk+PehhQZymHQhZwWP7aRkPK77yr4ByNHTOK5JTeGzUp5iWgv+hgkMzqBHCc=
X-Received: by 2002:a17:903:2a8b:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2d345629565mr62290465ad.21.1786537736769;
        Wed, 12 Aug 2026 05:28:56 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d350fb02a3sm5735585ad.6.2026.08.12.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:28:56 -0700 (PDT)
Date: Wed, 12 Aug 2026 20:28:45 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, samuel.holland@sifive.com, dlan@kernel.org,
	dfustini@oss.tenstorrent.com, michal.simek@amd.com,
	junhui.liu@pigmoral.tech, darshan.prajapati@einfochips.com,
	akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn,
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn,
	nick.hu@sifive.com, jim.shu@sifive.com, zong.li@sifive.com,
	greentime.hu@sifive.com, robin.randhawa@sifive.com,
	scott@riscstar.com, dave.patel@riscstar.com,
	raymond.mao@riscstar.com, anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [RFC PATCH v3 3/3] dt-bindings: access-controllers: Add SiFive
 WorldGuard Checker
Message-ID: <anxm/dqmZ8J0v4aE@plin-1878>
References: <20260812122131.1534906-1-peter.lin@sifive.com>
 <20260812122131.1534906-4-peter.lin@sifive.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812122131.1534906-4-peter.lin@sifive.com>

> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +
> +additionalProperties: false

The wgChecker is always an access-controller provider, never a
consumer. Using additionalProperties:false prevents consumer-side
properties (access-controllers, access-controller-names) from
appearing on a wgChecker node, which unevaluatedProperties:false
would not.
