Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42144749E5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785852336; cv=pass; b=ISFKBCBP/mVQDf55KMsdQH3DNZBHJpmroE9md77GZ9vryKJ4hZvxg+KJjzTb2uhdPMeRDPE/+QmcdUIwxxCA0ejpijyIGm3zSMPUFPvLljloLC/Jj9iG9F3uPrWX572Uv0StC59TK4Gy/HBhUuYB2hfW+NARG1kjjJhAAOclgIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785852336; c=relaxed/simple;
	bh=uh87EH3FNFHbG0MjAtvtPoh1GXZVe4Phu8T1IymeRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScFsymGIuQ6EekKytjXUtLaecbUD/HYmbdVaLwQqYnLdTyNdmSCMFAUAtwgumFxSnuXtNKKYNGfxsEqUwsK5Iv7yBwW/OrQEIe/qEENeRBAdtRiU8D9aSwNycu9IvOh9tX2jOrv+mF+zyCnmgpQ6LcuJdObiXb7as7DUP40BXi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLx88TWt; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLx88TWt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c160420289bso687383266b.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 07:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785852333; cv=none;
        d=google.com; s=arc-20260327;
        b=k8f42VYb06eqzRqh0V9CEvIJnOiLBVTMPP3hf3ACDXyNiCYAfoVHvvzIv+bL2zzH5x
         0L4qbfYPQFoODMHtAAiNLiTmUg9ORzc12fJSBSp2+L1xivK1zTikOw+JE7zkaF9YNtvm
         fsvjiTMbFwyFSJq4MKTP5MBTAysd+tUpd7OfRaMdm6h3ApWNBrCLIAIHrxJvr57CclAV
         LJCibofd+SMw5wCluWlDx4h6M2n2sTAVs+luWt2Xo7zs4URIl4VH8K9pSfDaQeF6nDZw
         yzsExWaFpzB6chkvjRMSjxF2dL+i6Z1eRXNHp5OQXBN3ngDoxQFQAE//gtP6pKCMmEyV
         CQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uh87EH3FNFHbG0MjAtvtPoh1GXZVe4Phu8T1IymeRJg=;
        fh=ttY4wJGt52rZdyZlpX+8w9Dz1Id+mVr3eEcvTPHp1gE=;
        b=EiK3KGRrthKfgwL3+0E/iPTLj0JRrrSJm4G/+eqe5UUtm+2UgGv5JazrUwuzAysO27
         eHYtBs66OE+CIxvvJue/QBB34tAjS9w8myHeIFB5NTQw3tuBHSnB4In1+Wtpt2A4v79w
         BNAiLouGX0nrVMFCQc2MmYAeEZaLtbJ1oai0J6fRfsgjK7yE6KVjaM0ZIlBVF00Wztts
         A5Hw14bK6EPeVZrK+cKvp7zcoLogkAJRYaWR5mP/i2NbtQIKPR1dTzM914lCbasN1YXp
         PhBQ+vhhYIB8Mf5Ya+gy53WC6gFwKdJhVn62FJWNx2B1AqC2hL4JOoj2W8gOPbIP/n/l
         Yx4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785852333; x=1786457133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uh87EH3FNFHbG0MjAtvtPoh1GXZVe4Phu8T1IymeRJg=;
        b=jLx88TWtb42V4LhKuLgwQVPmacJ894kP4ZaXch8u5/cHqRV6GR9ibkaz4395/ux6bT
         lF5YV8Jv8DEUg3O7FA4MvvUkthPp37B/2cM5etoFJbwP/jIlQaKhcXnciWreu6DjeT4r
         Fre9ArdoyGm2A2P/Z0A58T2NIPgqyK8ON3grx4sqGk1PVYc7FwkcnQ70Vc4mmj2EDP32
         gNxALN8uqzHi+0p8BLak4BmPxQrFISKta+jQFHLb2kiE13ooxUuPNwpnxFOStczSC/QB
         WWVxqe2s+J8Anley56H15qz0kxp9XxyZjkt3aC3y1tEPFNfORihh2n/g+Cx2yEt1mYxo
         mDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852333; x=1786457133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh87EH3FNFHbG0MjAtvtPoh1GXZVe4Phu8T1IymeRJg=;
        b=q7KVz6374gAjfEUKvQy41kpSEXRDTTRczQuKvc9TYpZy/JOZ/zjQE2Xd6PUMUM3/ht
         Q/Shdc1KSDJnxyY82lYaQFOrRNWVLffGU5ap/HfwGYBpz7C7tgwga8s3l1jAaE70iNwT
         E5zTiuqp1VtRGEZ+gJnXA34yAaBsj0Huv55+xKKnTf7LC+M/jzTeQH/oPRXYwsyEUO0Y
         9YEf/62SgB0+fU5kxfA7vxsFALeof5v6yywy4WkehWGESeGtrZ68Dj/XXIRgmGVUlkrb
         PNPBIuFHtIY1/yq2MvMfO0FT4mBJvesYfRenZbdsLuYn63JVrIdYOedsBShyK3+KSbCF
         uA5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMhx0PP39UnBpfjAyk/mI6Qa41bvmvYdkY6nnlz5roKN+DHejPzTHockdUHPxmLPcZUXG4viJMDadZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwvzzyhIa90R6RIjyJrtt0L0dDGcsxquhi+QCT6KDZ+kPGUw+rJ
	HeM00mdoQfdPItfcirzozvMlWR321d3dmekhMraTfo7NB6++C3tbqNMT2qIJ/QCgxttxzxVyIyz
	q2rUR7m3IFmBE/57ePYZ5D/oUXvP+JlQ=
X-Gm-Gg: AR+sD10o4PLEEgIsPSrhs5kGM15agQdPorx+5idTcTH2CkSXTCB5Qhi8DK/unZcE5O7
	3U8UVQkPgtatoxcbkj2IuxMfts/y+Ah0dOL2HlJM5aSwfzpAasce2RD6EeBiBknErmR+Nc8wg64
	myTeVRipWzQk9IEqbp4tkfOTEc18CYv1tIgsEe7GfgE8EsDPG66oCA+OnBUSqUidzXwH6HQR/C1
	TTOqeY6V919QxiQ9Z5lws533G2JZzGOIqDZoYdk18ZP1Nlz9R5px2gTHs5Cd6vX/DeN6UWdr+J5
	g88Q3E/qDBscwL+xj8uLEFum2qfb0TN71UjtQ1JxGfVYg7eJI7Yg2cuuag==
X-Received: by 2002:a17:906:d9cb:b0:c1f:7b9e:8400 with SMTP id
 a640c23a62f3a-c1fe817da21mr1039198766b.30.1785852332606; Tue, 04 Aug 2026
 07:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-4-a.shimko.dev@gmail.com> <239a7699-bbda-4fab-bfa0-604b1d8806a9@lunn.ch>
 <CAOPX744YEhdgmOFPT8PjfKp=v4tVq4XefYaRnk7N3J4MPB9sfQ@mail.gmail.com> <78ad6961-6be7-4759-8c7b-f4ce070521d3@lunn.ch>
In-Reply-To: <78ad6961-6be7-4759-8c7b-f4ce070521d3@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 17:05:21 +0300
X-Gm-Features: AUfX_mwPmNyhuHL06sDHGot-7HNxt9vk569IkwVex18nFN6qIuG3Dbu_KFGLeoQ
Message-ID: <CAOPX744zBT16jcTQHTPSDHv2rov1UPt=aTxECkrPK=7yG6FSQw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Tue, Aug 4, 2026 at 4:26=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:

> Ah, please add a comment about that. It could be there is a minor
> design issue within the PHY, and this is their workaround. So keep
> it. A comment will then stop reviewers like me asking...
>
> Part of producing a good patch is to try to think of all the questions
> reviewers will ask, and answer them as part of the patch. Either
> comments in the code, to text in the commit message.
Will do. I'll add a comment explaining the hardware reset defaults
and update the commit message.

Thanks for the review!
---
Best regards,
Artem
