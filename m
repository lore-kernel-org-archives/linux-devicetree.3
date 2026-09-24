Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6643B7B72
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790227554; cv=pass; b=Fby+CULejZ5ucOWQZsLx0Wg+iq36Yecw9i5t4ZCkxwmTHMEuBjnEp83AIFyP+Lf5OI9gWLlrO+lZTiAE6FhOSt5VyKctTC2a+WmjN6d8545tkh6c+CfU6QgVXEYo4fguvQW/p7Z+NNONgAC2vJWGJ5HrJgmaaWGkKBPsbOFZ+Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790227554; c=relaxed/simple;
	bh=YnSWqEYlcIxc6EKmwTVSgFIIELU0liQdEiKEpQob+bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ScOlNJTyjaOmtrWRuSiBAhlL7pMXiQKgxvYsQO2CDcpaaGlp5jP8Tu89Teg3FVXpVeStaSY58OIhywSyXNZO6GeXMb9pYfv0jB2sMGjiam1C2M2xcf74Ekzym9oxSXvkgvxQAG3/ShHJNZRdnk1SyVE6QgUw/mSP+DIwLOPShUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGVGTB1R; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGVGTB1R"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c2942718f87so66594366b.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 22:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227551; cv=none;
        d=google.com; s=arc-20260327;
        b=m0frqO5VjWPKaStFl4FfvC11NrRlm5sjwl1WdDK6i6e9b5G+3SPpQrL9TCI8Qs2twZ
         jY9pMJWWQEgwgTNgRz73OUDrlm8TKnojP9OJOAxALm9Bonr1zNwzocZqMPMP+lkbeeP0
         Zrcd5xbu3QGPalc+xfCvlXypQQSMJc8I98tnSoX2XFWh9mfncY155UioNGK8kDvWsbn4
         B/5z6cdooia/J3QBsh8KVWq2qXBvEVpY5SHRKKZtsJoI/vaEMEDXkg9XA4rp+IvSJWDC
         y7e1Q5IG9VlxZhcQaBADTXqqBSKkCafF1WE5gdTd3iREVOAZ9QZK29XaLPBLQKtw+jrr
         N6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        fh=/IkEdqSGuhHRGSqjQN28Hm301Q+EEYuMuQdRq5TABMc=;
        b=dNVOfteL8CqzHxCXAO27/y3Kf2tifdLePrAKUVd2ahYGuwx1rDfimXTa0qRakVhP98
         1BfoLm8F7qYDD7bGhcAvkZYNg3j6tVPsrQx4Yz6STbhItaFj4uiWvtGK/Kfp1GeTBnDK
         Kp9IjBgES2FPUa4tZyRqx8XTGZlFJ4SalFNHrJ1FOYcwXtP6DDVxG11APqe39jK9XnMr
         kaNpEZgzxmCtoIYsJ+38su0uSRuL6ymD/5plTlaUyCHGf6Wm7QnunFdbPBcSgFigPiS/
         Ou1kzuYmJ1+SPNn8nIg6KRw8+juYXSPiZ4i+4/dL17kK16Cw5rvPG8oTSp0yvt+GX6B6
         jQKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227551; x=1790832351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=LGVGTB1RZ0CCJ+y+8XehEGaT964iG66DU5X0YGqB2+pitQJZIi4tCUUuEPmPje/DBF
         1RkwdTRGNN4nQcKg7cTJwSGB++QTcoqNN1fWkfDJa7UM+59ByfVEPA0Ow7SxOnd/JYTy
         2SyuNmtVksuXYnpMQpbnjBA6FX2uoHTiLdPIgt4f5Y9pBAUXI29YQ+HyDU2xUf967I7s
         N2ZPrtPsrDqacmSLgPeTCTIpb6an/XdEFxAS4LI+DMB8b9hz8b1IJ3AahnsKtHI9pdmb
         ClzMxY8DgUhK8xaaP/BrqwBgccVHF/41TbkaHvL8p8CjhzjTFyCRCeUp0AJ7Ytx3O9Ax
         kudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227551; x=1790832351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=K7GpJEXc9tlxn+4ZxBvHGmKNEAR2ndReB1AbImWn+Y3wq4hLgrtWffbm06UKa1YYcp
         opvq0BRxVUaCCgI4LbsT6DZH6gAdmUVg96SNBlDHNVXqhKkkHiZVZx51DsEtdAnpMtdp
         BuRx0OIE8t5WJm3oFiSuLQh+pgnaFjBggEuqyXRcmBMi0eLCUDel3EqM7Sit0iBTB4+9
         vfZAjzmQiS0RA6SxUlGj6vCyAO3eaAu/gASxsIa893uUQpk61+Aku7qfBq9H+AvqP97b
         xnOCILpugvIq4RSRIMa9G/6PpqfaFGJdJdZwJhwcQSAGZ5BHikXeK3zfTaqmXjLMyAbA
         GS7g==
X-Forwarded-Encrypted: i=1; AKwUvByO8qon7y4vswPZdmdj14WK2TnCBrNMFS2F/VTxekIUka2nR2Nd1ii67l6LGi10Zg9z24Mb5RAZxrgG@vger.kernel.org
X-Gm-Message-State: AFuF++kggcQXiU6LlGV5fge3GPyMtfm4yTm0hHwTatBTgm3VwvzWjkw9
	EOpxmF9AAWMzKck+5XkpjAxYqqyyQutveWEGsUk8KKWO+yqCsmU8qqFoNjb2llyxkekHiBhqIwi
	pr6rCcEcX4st6ldc8l4K44lwLPwmy8gI=
X-Gm-Gg: AYBFou0bpG4HsCpNoei1P5kcLUYNVHRSstovb8sQ/dQk2HdmbLWcZrS7jlDHlRJMRvj
	QQRKffrWkidVHGsLPLOGrOBhHoLLm4pCj4unNTY8oqEONGYAoohZH/DE8uasQiBFN3xpykS6FMk
	lsE6pRJJBh2q3PJWLAMi2qWW6/Y9Wyt17AyvAOUWoOKhtdATxP7wZdGN5y+IBX2geIyBga+RAnI
	qImEMP8ZgsYhGMGV2tkTXChZ97OCmYQpOpJbuJ4twW/mlChGXHEgABxpZbPiYs2dF4vTyuimK3/
	n43lZgtEQRlhp9fZT1JY7cnsfn9ABm87/SZ9/0FwC9cEBYZCreifCN1dCQ==
X-Received: by 2002:a17:906:c14f:b0:c2a:8b27:325c with SMTP id
 a640c23a62f3a-c2ac24c6f74mr93439666b.24.1790227550909; Wed, 23 Sep 2026
 22:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
In-Reply-To: <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:25:38 +0800
X-Gm-Features: AclHuK__h_lDVDtTJPJ1hE5XUrq-ElYVbuKeNXUkTTzBjP1E-2gaCgXFCmYTLow
Message-ID: <CALj3r0he_NrY61dWo_ib+rj4msXZsRbBJ5f20xGEou0BfOWg5g@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=
=91=A8=E5=9B=9B 02:35=E5=86=99=E9=81=93=EF=BC=9A
>
> > Non-existent MMDs
> > -----------------
> > Returning 0xffff on reads and silently discarding writes is what a
> > floating bus / unimplemented feature looks like, so I agree with that
> > direction. My pcs-xpcs-rk does the same.
>
> Did you read 802.3?
>
>   45.2:
>
>   If a device supports the MDIO interface it shall respond to all
>   possible register addresses for the device and return a value of
>   zero for undefined and unsupported registers. Writes to undefined
>   registers and read-only registers shall have no effect. The
>   operation of an MMD shall not be affected by writes to reserved and
>   unsupported register bits, and such register bits shall return a
>   value of zero when read.
>
> This is what i was commenting about in my review, returning EOPNOTSUPP
> is not correct according to the standard.
>
>         Andrew

I hadn't gone back to 45.2 when I wrote that, so fair enough on the
standard. For what it's worth, pcs-xpcs already treats 0 and 0xff as
the "no device" values in the identity path, so the glue follows that
convention rather than inventing a new one.

Sorry for that.
Coia
