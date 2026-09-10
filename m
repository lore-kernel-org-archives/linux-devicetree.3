Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527684A6888
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054692; cv=none; b=PCuSAops3FKM1vknoT5zkgSJzHTzQiaxOiEbvpUpd24JxpSHhD3v72FS8PDqP8IFyglzWWQw0vyibTt2h/CVIWjyJU98eVkA94kl3XHDe1L0YTFsniR9RLs2ZAOaUr8JM562L4LTXkWQ1J1WBvF8ROcTmFYnWNFrZD3i+RSpVvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054692; c=relaxed/simple;
	bh=xzgmU+3eO8YII0oYWVrjp5IxxZ4falecarjMuKf3Ipo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDpDrTbs7bh09fO6r/xs7D5Y1HuEWXFFHX5pkNEN8LVDVhoEa8FmBWemNmSyCRBa9iVL96sMK/uwV/5zE3Ty3mPiWE7T5+EmYDCeNhzgaE2FJibib7Wio/osVLYuGkWCTUpGRXnNWnGuDh6Sju9irpsPBTPLUgq1397zqhnh/hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=g37y6Ceq; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="g37y6Ceq"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so13634015e9.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789054687; x=1789659487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTVSMjfFwifuGhbOPl5kVMZz0VGT2RwpXS+yJiNYpds=;
        b=g37y6CeqAw3TwRRgzu9TkSvXZI3soAHL6VoqrAzGCP3vrsTpft8XHcSeMCQtbl33qP
         CE3dtvcFu7wNW6WdsPWVYL0ZNtu0VFODGlVwY30O+wCT6wFLZdLveFydPKarofHR/ViI
         Nlalo/v9AV2Sa+LykR5foAE41A2qLuyd7blaOkzCyW01L3VZC5PdMREGdzIzlSqOPnIx
         6bx25Y6XWnswBN6jMvI7CRl6knAluqWf2sKVHlDmIpJe8WTSASY/3D/oJnTy2lw95dOP
         kd7U5IYHnIrdQvPQcAc6DNEg9N1C75rqWySuUj8IwEvrNgjVOv9bDh500mXq9lN6ymqI
         U3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054687; x=1789659487;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTVSMjfFwifuGhbOPl5kVMZz0VGT2RwpXS+yJiNYpds=;
        b=hTXZii4r6zkpj1gVgnapXnydAASCwnog9KBvq0LLrI9EcZ6WtuWNUiL1bjLYNnvYfN
         3Yah2PpjjrQ9RwBaJiFoOI7VgP6ivdoxDH8qM3Bg/bqurplwdDA1BvCqKY9Un06qFuJo
         GgPV9MtXrwVWdcQz/V2QtAJDgUKU5vQ0j5WX5uhia7wBNaup0AxsCCAJ9raEs2Ss6ZOg
         bVKWPJHFLqy3SMbM7mr4wp2F/to1OiQdH+vbH6byDpKucVj2TM2j8C5WpB7BhCQyHYuk
         PA28YVVAqPZitorcNfe/ZtJqxOGJcXvaUfUJW9j2TMx1DxHJgmI/xraw3AIhsKJH/cIL
         w/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxputDZAklF4YyUvMcKq9D/G6lBYOCY/VAQb5tBN9xK7wWFMwPdFpZGsxIWcaYiepRexjjOV03kzk+K@vger.kernel.org
X-Gm-Message-State: AFuF++khTyUY2iKWHg4ZchcfwrYtlBImxrbm8ZhvB/v77iDlCy2At5Tk
	X5yjUE9dXxU/2LKGGLqXiMGRZZEZm6rT00HEWLLsVVuFkIsL2J6oy8Uxy7AdHusSsFU=
X-Gm-Gg: AYBFou0XPeRQdRHnJCi1Gu6ZZ0BHeTC6gLI9TqzF4Gl5rhGG0KWz0dngOc100nfn7gK
	RLYIvhRIkglQaWDVT1FSfhLRKuQUl1UnTkxQOs4H3JWgbx+BDsIvIqjx/pCMMXNSryFId23Hbc3
	4m/CUME8Uj0GfmguqbNHAMFJNMt0HuR7m8mFnR4h4NjTfHQxCCcvg3O81tP4aER7feroy+8ga3I
	9Ol778R2y4L7/8MMZQvw7bNNDWuItahKMyqxvSiM8e9LPHdfRPyx2YHEdtuC+z12KtybeAjWmNe
	20F9UM/hPlczU0lVP6rONI0aAEIriMoh4Vw0W2Ow+uBvV888QVKSX2TMjuKXn2NgETWLmLvpIdE
	BoCYOLhbVuWc3t+MtlBL13Rb+clgZTxWMaQMlQAqlx1bHmoR0uCZZyuO9OC5S4syPGOStTED2nL
	fS/Q3tRzwPfnxiV+bScPC52eHrKeXphb2zkujKEb/qW47DzYciiSE6e8FUzIuH
X-Received: by 2002:a05:600c:698c:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49d1f35366fmr293842895e9.10.1789054686605;
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm50753677f8f.3.2026.09.10.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Aleksei Sviridkin <f@lex.la>,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next v2 0/7] net: mdio: an MDIO device driver for the Airoha EN8811H
Date: Thu, 10 Sep 2026 15:38:00 +0000
Message-ID: <20260910153800.777902-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <44f163ed-8362-4aad-99c9-f8709dfbed76@lunn.ch>
References: <20260908155707.4164559-1-f@lex.la> <44f163ed-8362-4aad-99c9-f8709dfbed76@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 09:01:14PM +0200, Andrew Lunn wrote:
> I think because you are sending this as RFC, the AI bots are ignoring
> it. I also think it is not getting build testing etc.

Next round goes without the tag. One bot did answer 7/7, but by private
mail only, so that side is not consistent either. The build testing is
what I want back.

> One way to argue it is that the MDIO bus it connected to the MCU. The
> MCU, once booted, forwards the MDIO bus through to the PHY part of the
> package.

That is the argument the binding was missing. It will say that, instead
of describing a driver model choice.

> Consider a normal setup, what happens when you remove the MDIO
> controller when the PHY is directly connected?  And look at what MDIO
> mux drivers do, which is not so different a use case.

It faults. On this board a bus going away under an attached PHY ends in
a NULL phydev->drv out of phy_stop(), directly connected or not.
mdio_mux_uninit_children() unregisters each child bus and frees it,
which is what this driver does. So nothing new to invent here; the hole
is in phylib.

> It is fine. I would also add a select or depends on the PHY driver
> Kconfig stanza to link it to the MDIO_AIROHA_EN8811H driver.

Will do.

> Prose is enough. And C code to catch DT authors who get it wrong. But
> you also need to be careful to not break backwards compatibility when
> the PHY driver is used alone.

The child bus will refuse an address that is not the parent's and name
the node that got it wrong. Boards that describe the chip as a plain PHY
keep working through the PHY driver as before.

> The location is fine. MAINTAINERS need to list it. What you might want
> to do is list it twice, once in the PHY driver MAINTAINERS record, and
> again in the MDIO driver section.

Both records then.
