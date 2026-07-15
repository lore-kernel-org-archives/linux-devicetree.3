Received: from mail-ej2-f1.google.com (mail-ej2-f1.google.com [74.125.228.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B34963CA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 20:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784145701; cv=pass; b=WbO7saWioQfFXzMjFAw/W4ub7K7xYidWVSdhyucWvRlFhgmUHsxACaWn8+2aCMAHmx8iaR6t/VVEGetsMw/CNK28Sg4ijzeYktekrolmOU1OgG12jWpMm/iLRQMvr4Y18lj/E9cqBbXUw2xy+sSIBrI9g2NnarXcflPrOEJu7tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784145701; c=relaxed/simple;
	bh=/nQ1DilIpOwATZ5PqozohClCfLj8D74is69+ZzRK1wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6Ke/g0CoY1IMPaY82U3aXwiNXZT16ll+00Z+iLcHCbAbZJngTDYSxvOCFgZcvX2nI/JELqmV/lXgcwle5A9gYdoOVBmvuzQdNYQb7d2ljS3+E2u4zvy4s4aGiz6TGQJgFsIo3KUgBZHo68Ox4QuC9uPEEOT25BDirXPDUh2ZS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXNXQN/A; arc=pass smtp.client-ip=74.125.228.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXNXQN/A"
Received: by mail-ej2-f1.google.com with SMTP id a640c23a62f3a-c15e0279316so110881866b.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784145694; cv=none;
        d=google.com; s=arc-20260327;
        b=Pez5sult4S8B8BYEUGYIe4+gjwV0iPXB33kaQUgs2jSJqII0guUzAfgZVsxbDyctty
         bTq5syEmzAQ94UwnNymdr3jjVbZsbs2A5ySbr7j1TM3h/NFYCO0I33wVHBhO2fOawlUV
         2bqsaLAFtd6/X5I7q2ZGaWS1whmCi6SgV2uzBjS6MB6QW4JjehsRznMi302McNCk6df3
         24FyI0sPS6NHD5KQZ+LOG1pPavjWgKScCw8KyMvM1urQ4P83T7H2g3GfKnwPHxzZmYxs
         CptRNUFjTb67wg6LwARdEll/iw3dHcb18jR4PHUcFmzlIUIZVGjZLYyQR/JNsAio1N8L
         GWjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        fh=KYRW+BlZJEqhQi+t74kMsaAuyPCkdfLOI4IUxPLABts=;
        b=V0E0UaYicRPdXdSzsiv9wz+7OHzWdhadg0Cz+QcWn+dWAoiatW8mahafcUiyIwF1OZ
         gZzKf9P8jMWhLJzxrxX745gqKd7hD9LKbdsOhTgbQ/4/yPgsFJtH9ef2PM4111jG9/H8
         FjyZ77AlJnwGw/3hgeWbjJmzfq6mxRagC2+6civVeiMuoWxOyUVCqjruAVDpcnWH8ySq
         9n0ry9DAOTm2J9H9CdelnJeByMvVGbaV+Pq26ntLv4ACn2NEPsHpuJBAjgvFDr3oF7Uh
         YOA3NiYXPbChm4t97/LMuhDVgSJqyRtNHffq/Vn4gXrGVCJUFxFa8cW2dNDWh3MkTV3G
         vWnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784145694; x=1784750494; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        b=iXNXQN/Awrx+ClkWv6wtvhWVXyLccuhTwEqWhIhQW2WM6h4Tvaxnx8o+Q53kfbLxQ7
         ES75M0wohUihnXP0kuw8j1/d0qEEnORPnqTylGcJ5TEMWQYePlbIQW+5jkHT+7XdBqXt
         M/fRohPglG16U/94KqvNuBD/8ffM//TcCLxXiN2umz6F0UgcgHeiEzOlcgIgIN9M9Tte
         ZOvVPrbcvpza7PusUZrMEE7DpQI1H2nMfEE5ntTgd2RgJV6M0C69izxDuxNqiLU4A+E5
         HHJjvBXR/g1oLjkgytHhlWO+81hO4//mRoOY2PzbVDgJdlqdQ9SQDfwrOWRd2KOcF320
         BisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784145694; x=1784750494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a2jfr+/m0lPzYMZ26qr8HScAjmTZxYpDuo9oJofBLFY=;
        b=cwYM8OaMJmkaee943ksiY3/aWXzgzYtJmBsVytas2UZNmS9Ugdxj0TjKE4DMpxgCBR
         XWS2ahem9gBnuc29xe/meJtSZmWrrQh5ii0tnHruPUgD+V5FDsGWlTLpEL/XMwokJ/Bz
         b4S0FLRPPUHfW7wuljnPzrGiABnCbHXxuJ9uN75k7PlliyfNpT3v6wbfY6Ce9Tk6+lrp
         ywlQCw3dJH2QBAa8bgegMnWmD6XQ/w4kYGrexYzd+H3hmrgAcNekjRNPFDUxST9S4/4K
         gYy63WXA1UdSvyPKgQXpGJiCoZS1OSVvzVOWg3ftCt8hq/0Pex/RglLO19qtYqTyhXo1
         hGRw==
X-Forwarded-Encrypted: i=1; AHgh+RqAgq0l+qn0mntOK68wDsfOtQI1jaY7rr5oZKOmg9OfeSY41CqQ5hW2uhWwT3eCQ9v+A3nhc7iTJRuI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQk4Ei56gbbmtw27BmsbJI0nlqrnYbQASFWPbqL68W9xiQLSeL
	eGB+biF3cRlhRo1FGs2Hff0axKZNtOHycpPzSkURsAJ6W9NI7BI8H5wULyuWo99sD2r2c3RRj3V
	IZP4+l3swTeMgOwf8wQU4+vP0YH22PEc=
X-Gm-Gg: AfdE7cm+NaWixNSZ50bKb/DB9K8gQrPNhXwsz/WcdS/NQRYJ+3LEA0xp+FyuCu1prhy
	hRozNmMjeENujCSEaqC9WirGN44BpRui2zP8x2azRR8AqsE9Kz/NtIRyjX7dDxjdOGnFzZWQOXS
	zZb/0B2lrPZgmDeoADuiitvvRw3wrhIEAjNXwDwpW5LzhqAWAA2fNh6gLZLCWtxs8Hgztjj7A3M
	w1JsNCAPQwpI6QddvUwB2IS0Z+GJCd28LzXFX7MMG8/bt7LoaN3w5aeWSPK56Te6EoRj1RswqQ=
X-Received: by 2002:a17:906:514d:20b0:c15:a1e8:c141 with SMTP id
 a640c23a62f3a-c161f39d844mr780858166b.30.1784145694108; Wed, 15 Jul 2026
 13:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-5-coiaprant@gmail.com>
 <20260715191451.515E01F00A3E@smtp.kernel.org>
In-Reply-To: <20260715191451.515E01F00A3E@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:01:22 +0800
X-Gm-Features: AUfX_mz1azszxJwrCVQmAtzoyTuEVivMl9NuC_fGRw6nOWKIq7dE8EPDVXJyALg
Message-ID: <CALj3r0hFMRb4iX+=JUjAzBskgXJPU3xdwz_pmg6G+v3f3+_XAw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, 
	neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> [ ... ]
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rk3568-cru.h>
> > +    #include <dt-bindings/power/rk3568-power.h>
> > +
> > +    pcs@fda00000 {
> > +      compatible = "rockchip,rk3568-xpcs";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      reg = <0x0 0xfda00000 0x0 0x200000>;
>
> [Severity: Low]
> Does this 64-bit register format fail dt_binding_check validation?
>
> The example is extracted into a dummy root node with default
> #address-cells = <1> and #size-cells = <1>. This means the 4 cells here will
> be parsed as two items, which violates the maxItems: 1 constraint defined
> in the schema for the reg property.

I will update the example to use
the correct format that passes `dt_binding_check`. The proper way to
represent this is:

    reg = <0xfda00000 0x200000>;

or with explicit address/size cells:

    reg = <0x0 0xfda00000 0x0 0x200000>;

I will adjust the example to match what `dt_binding_check` expects.


> [Severity: Low]
> Will this fail to compile during dt_binding_check?
>
> The example uses the PHY_TYPE_SGMII macro, but the required
> <dt-bindings/phy/phy.h> header isn't included in the example.

Yes, you are correct. I will add the missing include:

    #include <dt-bindings/phy/phy.h>

to the example section.

Thanks for the review. I'll address both issues in v2.
