Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF024734D9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826463; cv=none; b=t0GXKs68ROLCJ92YZbiq875WMFB0WuMKN0gBipGudB5idgim4C5cIAQ6WNcMBiNGcOIUK0IcIU6QGQVHxKxxRCJ8Opi4V2APwe/Q9s0WMNlUcg6ZX3im5kwy+1zqTpF22hI4qXlKm60oTfteV2oeRBs098HUYxzEbnOBSgmnU6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826463; c=relaxed/simple;
	bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=Jc5fmW+Exx6ZwWB5FoKu2YYx37OXZZ6n5zuXw7Lw8l5/DRipbZWmoppTVAjPuL8UW80nHyzeQvLUDusS9HkYjN+TILSvHYHlWCa3PTTYM/ahL7KTk/a61Ec84Kle1LF0k4ekShuBBSHnHB+6PeA3x77U6lR2RW6xGJnansOiu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OyLIc6+/; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OyLIc6+/"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca913a601fbso655198a12.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784826456; x=1785431256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
        b=OyLIc6+/YN28I5AylE6qg4fohBXBaAO+CPH0m4tL8qii1xDTEKWyK0VnbZ+KlJqg45
         y8kb0GoaJXqWZbVdQaGY3OHwux92zUiyppeh+bJtA5jpJAoVd85CZoCSNPFPPT+qXKvP
         D0oLpzvGvFabn/FgX3iABs8CkQb1xqt8IbDVCc+LfjRxHNPXklbbx/1n37cfls6Ig2Q1
         UQN8Qiex6rT6BHOcbbKY1LLAsI7cmbnnnv1vokabMUhglAlC/OmqmqqOjAqCf13CtX9p
         eyumx1teChkl78rVCMmLNNsrWOxy9/xqdgUKweVMunXb0yRYKqCV+Vt3wOGWIFYigPwy
         F/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826456; x=1785431256;
        h=content-transfer-encoding:mime-version:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oiQXYSZ0TDKNvY/2UoP3cUFNw+jZM1SghiduaEEBnM=;
        b=Y52LfJMNTNXSbO3fD9FAW1WGLF/XzhEl3rp2xZfQBPC0LmZcG/UTxyQj8wQ9Z39l99
         Sk6U7zaKJVhy4VK++CLCVeGQT4ppAODEKKy83cthTm74UaneaQ/qUG7K7zi0qfqY97Vf
         EDIdhc1g4LLerIiPHWGOeSVO3/wR36/anMhf8tBy2QA1q/L0kBIi3+9hPbIMwaz5RTsz
         F9687ChWUu8Oo7+huzqeSbG3Pre+V4HtnYe8mSg7G/3SGeWZVCdmvvER5RYBSAZJt2hN
         DCeoFzBwjiGUr0aWL/U4JD/B+ACjGt8E7rwij5wvspHJwKSDMgNPU2qxzyPkOle4MEay
         vkEw==
X-Forwarded-Encrypted: i=1; AHgh+RrlDlArlkyV1McabQPI6/Mm3RaH2164hoAtfOooTHguEnAsrT38eOV8Q8Tbj7EJosVF5Z+y1laxbW9G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34BLcP5FQHq19zl4HJuhxheFwtJWAqqWpMGnTfZ9q9AoSBGTt
	Bu7CasPiCFzI11tdryzuCCmFgSbQeAIsjAJRUMgfsf8RxuBOEcCwOFPlCFEG57+ns34=
X-Gm-Gg: AR+sD11rTNan1MSYM/IsgxsHBqNpYCa5i2yEGZvwN1Yvqxm6U9qCpyCRMDf2fQ5CFPh
	iZJUD/5fMCiSr9p7yKUXpHV0QL/hgZi2sWZYfXUsKtZeTu97v9p5iuyi/TVPOnoFlAYfNnygt7s
	Hl8NKjsY0Zq2MIMK2fhWld92cFesfBE3QhSEgOBLantV893qSEuWrj5YPP1+Xrd3gqq63jLDIN7
	M24km4iJ6gQvlmdOD67IG6/1lnfVHBHdnti82LdYH+G9Fwg/xm4GspVfI+b1daCmEpXFJlACiH3
	JjCwdV6sTSEFu8KALTQj8ekzDI4FjIiswku9EIyJK66pje8gyJ0XrtGB+s40OIcofBag63FacYN
	cLn3brS6Z5HcM6hAlBVjV578pR14WcX/nidse0pL/bSTV4MyDsqFfJmxtDbDrkm4+qZDhGTaijo
	3zbw==
X-Received: by 2002:a05:6a20:a126:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c44b006725mr4459401637.26.1784826456047;
        Thu, 23 Jul 2026 10:07:36 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a6adsm20460272eec.6.2026.07.23.10.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:07:35 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:07:34 -0700
Message-Id: <DK646A1WF1ZD.3TKHBS1F9IQB2@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <krzk@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] of: hold a reference on of_aliases during alias
 path resolution
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
In-Reply-To: <20260723033554.022251F00A3A@smtp.kernel.org>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-1-2abe2bb9cdbc@nexthop.ai> <20260723033554.022251F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue Jul 22, 2026 at 8:35 PM PDT, sashiko-bot wrote:
> [Severity: High]
> This isn't a bug introduced by this patch, but is the description of the
> lock-free walk accurate?
>
> If a concurrent writer (e.g., overlay application) removes a property while
> for_each_property_of_node() is iterating over it, won't the reader's next
> access of pp->next follow the pointer into the deadprops list?

Right, the commit message misstates the mechanism.
__of_remove_property() repoints prop->next at the deadprops head, so
a racing walker can be diverted into deadprops and miss live
properties. What it cannot do is step into freed memory while it
holds the node reference: dead properties are only freed at node
release. So the conclusion stands (the walk is memory-safe without
the lock) but the failure mode is a stale view, the same as every
other lock-free property walk in the tree. I'll fix the wording in
the next revision.

> [Severity: High]
> This is a pre-existing issue, but does calling __of_find_node_by_full_path()
> while holding devtree_lock further down in this function risk a
> sleep-in-atomic bug?

Known, and tracked in the cover letter's open items. It affects every
OF iterator that puts nodes under devtree_lock and needs a series of
its own.

Thanks,
Abdurrahman
