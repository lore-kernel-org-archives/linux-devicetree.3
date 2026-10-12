Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A923E9C1E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806659; cv=none; b=UuE9szYlmekAD5xpOHyvHwnpilmru84h4QmTMcYjIsT/3vENzawxyKmuErUVaFBXkPgX1By0ZRc9XEz15c+y1Tk/cua78c+vcTVoeQdLdyMdghVShWnhFyUIuIdA5LfM81UzDVTGmRSrNurbJ3yeo+NN7+hrTG5c6QvuIcJu9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806659; c=relaxed/simple;
	bh=Agg4QPystQPs2JjR4AaaDRI7V4S04XaGdJsO2+SBdZk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1hOEK7TD74L9M3JkfCWSpfnhIdYvnj9vKHo9EKso0YkLmaIkhs3wbujOWqpHTFE5W2mWllB18EZhg0DP3GPsQQdrJmbddiObyIB0DcVA3GhddtuMDbfdN+Cf1P8zSq1mEobR3T3E0E8BxwFj+KqXBmIdA8q+ZaqDTPrQ0FJLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9Tx+Hd2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9Tx+Hd2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c45111bebso994072f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806656; x=1792411456; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=m9Tx+Hd2NSrzwwvu8JKY67DiA//bWxyNTz6uMhysDF7N0aA7i9zaoyyyvVXqnvwyW2
         lhWI7QVMxDNBKVTaGMcp8qcRTNKKX30FPjOuQCgMfKMLRv7+jW5gVoST6n/Zdr3HvcWT
         gbC2tCxPENuZWGEO+JWT8CNiPuBt7JbLLf1tqHqshoX9Di2o/ayGqOTd2YcEflH4VKvN
         hxJleFaZtyE+G3kw+Obkr9KmJc6msrR7CoSfUpm0LETT/knODOnsEO27UnXgwOJVD9Ak
         MqgLjdACS+Hk3HyH85/Gb0hGWIaGkcASsONUCyMV3ehRhkFeVBYIz9fGGERZ+oFi+aKV
         usQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806656; x=1792411456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyTvhmMauWVTWc68u+mhiwkWRE9BPuGcFcjBW1ldEgg=;
        b=Tamx2+81zhbCFD8f62SFbGY3RhROFjaudTEnq8pwdIx/m9G1QnILzVSVq9yFnBEpU7
         5O0ERcM2mERwUhqfB3gn2mhL0BZzYp0joROFujaWg0NpjRdNWLfNG1MpZRK6Dmfgwb5S
         PG0E2CZaey+kETA3rkG8NivsrnkbRm3XywnMS5qeqjiF9xoYD6Ygh4jEhlLWQ62Rk05g
         +PKQg3a5yMjFWY58TZJ1JZnWawksVtTxVIvqzxId6s1IMSbOB2bXNpDZJfmFCx+Cy8F1
         FBe42stDJBpcRGa5ta0N2ce8zyI7s/no0NhE8228lQAL8uqLc7J8KKt65WVyr+FQpEhn
         yOfA==
X-Forwarded-Encrypted: i=1; AKwUvBwedYwuLVzfsKnlsiLcRP8SAShMOUJT36sSdog5E9UVTbNevZkwzreeT/qTrZN0s5BtnbyWjBh3QFHQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJNyUP6vcdcqzVrpUvk1XkSpYDSDWAZdKLz5JYVdiE2KhM2THA/
	iA0RlsPGY9xNU7FnzQKkAYnBZAsIWjF/d7hhcicXJINMD8G2QkM2xeVt
X-Gm-Gg: AYBFou11bxDyM3NfmUUzaxKTmITYB5NrByhasMK/56fVo3adP9yrp6K4s2f7J+ll1ZI
	Hpoj8sgOQHrw2nlqAV6t/S8FEozhuiF4kXCdBkmHTaFAZAwoZmJfYltU1dEZPacxp5J0GWmQPSt
	+SHBw+08OLrd1mdLTWdfYqCVS0e8hhtgTw6abX83CWWUdIVa2cjCZIkF/PpOIyyt+Fqt2+2pdJL
	nho5FimcfnWJZ4lVYIZxt6s4erzUEkTY3YP/oBAh9LQ0oxhvFNo77UZs0aoBLnSNEoPSGf2wvoV
	vSBfRZ80OUX3Vx0vWqj+wOGUvrb9NnIfLqPVhe1isbOz/RvCVkt6jVxxM7YGIk0GOlfaeWZXi1K
	HWl81Bw2rw6yk7sxQmv4hyBXJ3/SNNuUMdAgCksnoCorGJeSAAnTsT6BNQEwMEkQUkYT7k2/zzQ
	1AzOFwy5TImCH37rRal9Ap3Ra8D4tdt27+K17RSKxxVRqGPomP8EiNYNgaCL9Iw4AyvNgVJlpcL
	zMC8QCM4/cooK+J12SgHQwFSNe+4yd0aPGqyg3m3F9WVXQKDvi3ybiWILFgpesuVj7uv6H5Ougk
	tI3246UBhSz2Y8w=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr186999115e9.19.1791806655972;
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd574sm19738733f8f.34.2026.10.12.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:04:15 -0700 (PDT)
Message-ID: <6accccbf.a6a2e554.42efe.05b4@mx.google.com>
X-Google-Original-Message-ID: <aszMvJmPGCC5LVLW@Ansuel-XPS.>
Date: Mon, 12 Oct 2026 14:04:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, lee@kernel.org
Subject: Re: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-7-ansuelsmth@gmail.com>
 <sashiko-outbox-166718@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-166718@kernel.org>

On Sat, Oct 10, 2026 at 04:11:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: dsa: airoha/mtk eth: hardware offload broken for AIROHA tag protocol
> --
> 
> commit feed6f0245d293aabba2178225f4097258a1d66c
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: dsa: tag_mtk: add Airoha variant usage of this TAG
> 
> This commit adds a new DSA tag protocol variant for Airoha switches,
> updating the Mediatek tag driver, Kconfig, and Makefile. It also adds
> comments explaining the differences between Airoha AN8855 and the Mediatek
> tag bitmap.
> 
> > diff --git a/include/net/dsa.h b/include/net/dsa.h
> > index 5d12191b6f6f5..9824c63ad50b3 100644
> > --- a/include/net/dsa.h
> > +++ b/include/net/dsa.h
> [ ... ]
> > @@ -76,6 +77,7 @@ enum dsa_tag_protocol {
> >  	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
> >  	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
> >  	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
> > +	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
> 
> [Severity: High]
> Does adding this new protocol ID require updating the ethernet MAC and PPE
> drivers to recognize it as well?
> 
> For example, looking at airoha_get_dsa_tag() in
> drivers/net/ethernet/airoha/airoha_eth.c:
> 
> 	if (dev->dsa_ptr->tag_ops->proto != DSA_TAG_PROTO_MTK)
> 		return 0;
> 
> And mtk_uses_dsa() in drivers/net/ethernet/mediatek/mtk_eth_soc.c:
> 
> 	return netdev_uses_dsa(dev) &&
> 	       dev->dsa_ptr->tag_ops->proto == DSA_TAG_PROTO_MTK;
> 
> If these are not updated to also accept DSA_TAG_PROTO_AIROHA, will hardware
> tag extraction and PPE hardware flow offloading (like in __mtk_ppe_check_skb()
> and mtk_flow_get_dsa_port()) fail because the strict protocol checks against
> DSA_TAG_PROTO_MTK no longer match?
>

This is irrelevant for this series and can be handled later. I'm not sure
offload can work with the AN8855 external switch.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261009161102.38961-1-ansuelsmth@gmail.com?part=6

-- 
	Ansuel
