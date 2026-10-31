Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446019;
	b=Bb3BveqXV5RhsvNGFVLgHLo0jxXrkB0Xh21peIcxts76hFoGxq68QJyXNBSJZWurCs1L
	 ieJ6sIeNE1rc19iJMi1nr9SYBubD7zjMD+FOqFpIqGsbxkb+c7w0Olz1f2AfcbO2rt+83
	 xSuNOZapexzaPlEIqTTSLx7+vjCreFXkGSy39xv72MMCadsrIwQ7JNoqnC3Zx+8Vf8gLt
	 8oZpJUc+7vqcE6CZ3r+GiDdWgQAWXiR4yjpQdGpmGyrYjzmXFFPGtMkJvXF25sW37mC+3
	 +m2Q9BqfUfEnCTSFACL0XjJdrAI9z23NH0txtxJD2RfOReQSR6mdwP3sx8PT0jCVEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
	b=u9pX/1PMtC5P/nnPUIRNuDM0Zlik46wTFesTHL1G6mR0lW+65W3wBQE+PccTajPGioUW
	 3k1r+3oiq6F6wBhIgHqA0TOXeMJjdMv0rDeUhsBGY+9sHa6olPCpIe7zkRKqlqRv/5N4d
	 arxp6siyPkxRpGK/mtuJEyC/kormgYf+gPguKBlHvPr37lL4kUtj1MwwM4UdiwZ2VusRS
	 MY6Qr2IwCiUclw2+sfWws1MqMZC+uoRF/tBjYriYTHnNZ2lL/Jsug2FgSYid2kOW+zv4U
	 wmWzUcM3BiHn02BeeSZu+ri7pzfHWfdRBSut+Sw+G5GP9we/6GsETk7XWMPuNLogPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA31606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OOHFPiJv
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1007885a91.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793446019; x=1794050819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=OOHFPiJvJJp+Y8vZjZ0nvwcq0VjDLqEY0recjcf2GspS9dMsfqZlPeR5uLbH1VAgb1
         ImUtA2/oSWkURP9z3Ve7mYKAlbqumGkxj/mVlnRC5F40hh32RIdYXwz2u1Jp13G2qiJa
         h3HAWvRG/fMz8z2Dg5dYecnZT79LHQ3HlKAGcmkhWRBWng8CStQ5BcH/sfce+uAl93i7
         +hM+NRY3XYz1mXB/sj9jwPhtimenwm/WVCClkuoROdDITpbUakuSFRdIHeVtOS6etuXq
         XEfzvrhDSPYLDX6E8gsuC7AXrRKXu+QT3q5f4n0h/Wfsm9VhHcEIYA6mCncBZErfpBy6
         Q49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793446019; x=1794050819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBAqeg3P7IjkzEoe4Ha0kzpqAxzRiyS3drMdSnkFfrg=;
        b=qXU5sRWkxBMCKXduE70uKOcaoSlgbiODtLDj2exQecPlXVoJFMu8b4NKlsfndwv4If
         vRFAxb7g9YBbmn3xQUFSouvLsA2y1A97FnvbXyOH8BWHIqpXP+DBvJt8HSZyLmk/aTsq
         fTzI7mH52BY12nWGy41Y6CwitTcWuj7GcE1c3By4BdehN+QiWaOUyyqFcBhqsG6xzvQ+
         vepB/iR4f5S57OEWels+FHQTYn7LdOrDEyKRPteZZPDo4zSO4XUqRABaUXLUYBc9CxCv
         ZD1fChzFMJmpdE1jSaDfkhr265yn+mES1rCqPShNvoitjIsHFFRnpPztqt/T+i4krvmk
         78iA==
X-Forwarded-Encrypted: i=1; AKwUvBzrYKfRCtkxqSgPLLBORbS2TW41XyS5kV2iOGIvCxj//Bk6Xm117LfTfblrgJdR2m2XFt2hojzrd+d5@vger.kernel.org
X-Gm-Message-State: AFq9FYLByeiAANkkblEf4GHcvoSrh7FGQoKCxXvzBCEfEC6gKRTLxoOk
	yZCOWuOXVo1Db/H7g8XDlCuhUUhja5kKzX0f9YBXlZBE2JatHFh9ioBa
X-Gm-Gg: AYBFou34b7zaR6fpj4PAbXqx8+NsGndd4RZR0hkNly707vfosR1cS4cKaQXmnUafFUD
	v3yZykoCImOMceyM9ulKbnMF9jO3O/zxm7AbqKdhej+LJfkHwmYnoabMNrsWX49G47lm/fvPn11
	GvaGU6tB2R2hMCzyOnWYxNa/XoAfeiRnEBcWbIGiLQ/7wgj1xtQF4WuxkpcKw4FWj86VwO49QHQ
	jzAnIXV+yHG6xknBYYoV2drza0Gwe8pZG6v7v9L28oVzWfI9ahJ1uZbsW2mhTlDTu1+nr3jdyGp
	g2PMW1jWfpR62MCjPJyqDeHqxp0VK+AgmYEJ2iwd2IOxgwARNNkQpdJhNLneP1F0SaFInvD/F5x
	0ndVK2+oomT+GDsoQ5Jtnj3A9/lXRkIUjHT36gUPKJYA/drObYk1sCDynCgCkjzlfE0BWPY7Itj
	rFt37fEA3WmcVmpgsjqmZyRvHkdCNSkY8AnUuBlC6ZeQnTupi0uc7ln2lLx5IEMkRLxmnhB6lxw
	ncTAQFbQnvwR2TnlJFBzBFNYmOc79xA+QoDh2KpUNvBpD6z551MO6VShU/PzuBzP5Mq1we8WoCM
	IZrBAWANN1ehmjKi1mSbng==
X-Received: by 2002:a17:90a:e7cd:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ae897ccf9dmr3920644a91.16.1793446018866;
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2fesm11638646a91.4.2026.10.31.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:26:58 -0700 (PDT)
Date: Sat, 31 Oct 2026 07:26:33 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auXQaY25XfYzxEb1@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-slider-finished-360b10521e0b@spud>

 
> Okay, that's good - but that's more of a response to my comment down
> below about splitting the entry, not a response to what I was asking
> here about the lack of a git tree. Are you going to send the SoC
> maintainers PRs for this platform or were you expecting someone else to
> apply the patches for this platform (IOW, me).

Thanks for clarifying.

Could you take the BL808 platform patches through your tree once they
are ready? (If that you okay with this way)

Best regards,
Kwang.
