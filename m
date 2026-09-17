Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617553B5E01
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663922; cv=pass; b=bmWOkXbo/aBGuP9rN/HWP9qCbxkoIDtg3JjttY3K/uIVv7q1XqFg6ThSDJUeh17yxoSz4l5XBkwzGAGoGlROnvCRVV6q/8JKMVPr9qK9d2ChhDOHmTM/OjywLEFJ72KW/CEw1+/fMNaiSk/2G0yFvVN9lX5D4D/JDXxr7npzESg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663922; c=relaxed/simple;
	bh=hEHMAKUllCDwfWN1D2DXADtsf72BtNJRtUxT6u8f6tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LXcW8snae5ryHN35gZdcumXpET4GO8KSqG2+LZYU8fQ3XHMyAmR/amtwRMOwLJlKT6BmFil4rZvzrJfGF0KgOJs6JiCKHIrCF02woznTvxrigZdlCMQ852H324xokx3IQ0NSWCiPX0sByChe84a9XYk7UAZUoeGgTbw0CbdMo/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Umdir/c6; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Umdir/c6"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso1771590a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789663918; cv=none;
        d=google.com; s=arc-20260327;
        b=hNTfeukEGZxloKR5cT5iMr22FjXoJbKt7soLW0cmSgfwGJFhrgbb8b6bDcxhLJEGrd
         Xcq0lmonuN2jcDKvgC0G1b7q7ak04oD24kxIDYVs37a8knXwjwVlDij7NFC1j0De88oH
         fafq5ep1JlVayZx1McO+sXkyQbZk7jUmgXxwKpCzSPLOHxgQr/ANpAaKlkSB1uKWzWbY
         v931+DaRIb3gK9Cf0k7P0+jtrH2hNJEjPySmnugJHjKLluyaCBqEqgJinhCcLWPmZMg/
         t/hZSSbibvQDA0dcMBR1jdBS/APUZTaqBsWuxwZ/LKzYnrQ6NvXmhlspXcmuZKTd+8kT
         Tzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        fh=BmKJpbS+760wGteu2MRa8yNDI2VUS14arCDPOYxnLE4=;
        b=MpP6pRV4fFnEHAfEc2OpHVf5dSS2HObGl23JJvvZcS7BjIryFHTE/M7K5ZFE/a/rKe
         R/9YBaVFhe9+ip+4KRNgyoUSKLboOc+NNT9s4PzoAoXcOl/kM1XDnmvzkaijYQtBdx/5
         dMDtXpHGRWATIuD4qe+kKt2PiVke37Ln747Xch/ziRGsZRSGOxIlUwFnf0Bnp8XDpKD5
         WCjZxG6vMD6VKGbacENtBLWy27F3AzrdmdkTf9aOUy7dFHneML7QJatMefhIjmgyioSi
         /6q3Rz3T2EbV3hlgi3abfD9pPRXbV9rOI/urZDtH+D8eIS/44gvABU7P5cJVJTF62rGq
         vpwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789663918; x=1790268718; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=Umdir/c6HrNFBOOQJduM6SqCOAdwSy6ZyL+u63FbbjqPSkqXRet/5s+yDMp4YNjYN3
         Ita+VQyRcFzmRG9DQvzdjIErpzAlOQM3yfnWdmoT+BI0uhEAmm7CNQ9zBBHIE4PTBJsT
         u4O29zn1XHk7lfqMIu/0IJrlYch/5fZv5NcCYTQPSHGed7rsq3bxmci86KIG4CKRPazG
         26n1ETA8jIThSMYV/LUhzaPBsjUpNVu5R2qhDe/PX2P05Y0mkxSf6WmsJfcI50NxbVuT
         zhHAtNqzxvTxNG7xhPfFeuQyvKu3USpvLpjVAoPyXm6bF5jAtEYIiIfgReVDGHskLX5T
         ecuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663918; x=1790268718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dTGZsVCSr6ANtWetAbHE4IIsX02FpxvKoMT01AVXUs=;
        b=0UPfRL2EypoflzMC6fO5LEzx8s+Bnb/NK1VwxTOQet4fn+oQQpqs1EmKytOzZofRz6
         di3e9JWU9aahyYkvHG/0YAffR18JlNpDkQqXA889CzgDBjUDU8+v0trykffr1DGkLv7V
         OzqKk+z+UEAgAnEpS8ukUNy9w5PNZ/5Li4P2aUh0QShpXE0BdcdmdCwm92wkXtHuhd7Z
         YIhbbvLWliMDzUeQ4kDHBCrouCXGTNju/uAiIRaki6qvFtIjKYkb/mvkHE6yLrtLfWrX
         4og3B4LZwJlO9H80VLEjtrXS0yRU7AL77BysO8xQKROu722CiM3Lt0A6nOUDfjteYLXn
         REkQ==
X-Forwarded-Encrypted: i=1; AKwUvByjEq/DEUbW0jONetVHVfdnNLvAG/sm3WVma+zRQT/QKV+dL8GmZYjUNIPxMNTEX95NJXert57VDR74@vger.kernel.org
X-Gm-Message-State: AFuF++kFvRu27JL4egexKcnozTFLeQLX0qVqbB6oVrl1imGB8wEoGMfx
	LDFAboE+xtY6k5Y9pccwxZktRnvJGBYCKHX5q2AZbFzZso5jEE+XwxuKw382GPI493x+xo1Xi8H
	u0XhnhQzOs8TQqp8TlMz/Khf8kLJniMA=
X-Gm-Gg: AYBFou3jzKD+B8E12w2+DGCODS7jlPxTRs3QcbssEeRBsBdk9Es7SrTR4h0w+JVCpK7
	dAxaUZ2ZEM0Gc3I2z63jiV7koVUyDjMZrtXZK5hKtiz3OWwyI3vH5cwXrhShKQGnkLYOhxxbT2R
	2lw3ep1fu46NQwwNBvziqUSjDoAjoXrDFKI70xblaI+dhxn7sY50G6jW4jm3JH+FDqJxVWoRI4h
	v3wpec2zASk+g4tBO9de7lAuaLrCjuvZ6y8APLwIlDflbw4CCpKxy+B5OJ1RrpwPRzelkYKxkg0
	C4sBZFnriugA1KStPa/4dzR7wNQkxXWkvSCNdjsNEOEu99L1yjN1WNM=
X-Received: by 2002:a05:6402:3789:b0:6a9:98de:6d8d with SMTP id
 4fb4d7f45d1cf-6aa2245fd0fmr5568315a12.45.1789663918221; Thu, 17 Sep 2026
 09:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902193351.185771-1-l.scorcia@gmail.com> <20260917143459.GA2348773@google.com>
In-Reply-To: <20260917143459.GA2348773@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 17 Sep 2026 18:51:47 +0200
X-Gm-Features: AcwNN1UCLyUlHms-nbsVMpe5KcLakQ0vi0ozu7P9tcFuOM-WKvxcQ6ubbojqdxA
Message-ID: <CAORyz2+rT-oNJtWc5BRDrpUjBPVbO6A=qrX_K+J7fAR5Ebm_3Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Julien Massot <julien.massot@collabora.com>, 
	Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Still waiting on Acks by the looks of things?

Unfortunately yes. Patch 4/9 [1] was suggested by you in [2] and it's
independent from the rest of the series; it could be merged without
introducing functional changes, but I don't know if you can provide
the Ack for it or if a specific maintainer has to provide that.

[1] https://lore.kernel.org/linux-mediatek/20260902193351.185771-5-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260520150014.GF2767592@google.com/

Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
