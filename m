Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795226869;
	b=REqXUznpDRkdcjM+8ora30kIQQsrikB/a6fGJHtZCiU7ThML5uclsbhB0oKN/hEjz753
	 rD6Ey94tvRB0s8NqAHchzR5dDH3xym0xmt8uPxkP7za3ZQ9q89h5fv3I7UziX8LDKd4LD
	 FhnNmPJht/1+x6ePgln6jPe8Q2aV2vqelTa61ktmADIzCGkVe/kRno/u5psRL0GeB4B7+
	 p1bL4EdGVFXYuMpwrmEGwRHFA+M4YNFklP6ku1QNw9g5Q4huMtuKzfh0zGxcDTcwUNX7M
	 0tUuspokRrabh63YIp7WRF/QZoNUvWJnzLNrMx69Ud/0gVFX8khrGHT2Yk6+3k60EeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
	b=EPCo/2i5fi1kaFsCuhcA6z0Wybw+DZKOUiIIKk5uQVASfp+efIwH9dTdHPb/NVu6/MXG
	 Z7hs+/12Y25qZAd6n++RZlHSxW/6dAfKaprwcinUtvQ0A05W/kv+JqW7L3Z10VpdXo+I3
	 oIROVU+nBQnkLZRNLM4JiTzcivjRAg30GyiQxcOMgPoBwmlXvryDKsjf0UHUPS0X+5rzP
	 a63JPD0R5P092igP7xZFB5qmWEmW9Wgr5SW+O4+Me+2irgcpj0/CNFLFB4tpB+ceii5Ib
	 FlRsjoJwN//0LyW5oWf5k6i+lOf5+bNoKqNmN84IdO2HouAiizWpnRBOdQqwFU/F5Gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA+7tVdp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F346606A6A9
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F346606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA+7tVdp
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67da69e7c31so1648948d50.3
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795226868; cv=none;
        d=google.com; s=arc-20260327;
        b=aDTHhIJEA1sHWc5STyJ2ezRn6KVYelJU7Esz0/yBFhlC3R/D2UGIgAXi2EXuvNlBhH
         9IhuKCXI9qk7sQvWxQhWthoAzP/E67il9G1IBTJdBxTioxdFhGrF12Wne+y3T/ll6SHL
         tRmNhxIETcmXJjXmmsCZxAwiC+vPmiOMKykucB7nXtpyFH4ZnLmQSQIBlJV5MvFtrgQC
         T/fEjcEfuOUSYIp2bR5mg+5vkkaapfUTJT1ludJplXIWkl3xJboqGfeIFwqIUKA/eBv3
         XpNHHtefZodBhyDHCqq+f5oWwKViF49wwHbiRhNXoP9b3my0kokh4i6DGvpunNQzAXBL
         OVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        fh=32A9ZuUqSrH/9tClnYJSJ01rVAMu+GNaLTK3KXuYxJo=;
        b=Vp2yp2z/SHE3K9zyPieNgv7qD5f7J6fqZXZQx6FQ0v/WhPO3hPI++IbSYGkTvwsMAS
         3jSL8KUxVS+Kxm9OrDRpE7yf0xFs2jd5zNMrhOIBkDb5Lgsu6MgolVAz/8btxhOPexvS
         a+n+865q8cAK1XHQfafqX6QyBFVzMMi/x+PSL9j5CAmP9tGOxoqIy8VhOW9f0yBvsDjz
         UjWvzg+EMglYHjzu+tXRFoYG7qpIvSg7tnIuct1VTvYOfbmBR8S068iD4LtLuGUDzQmX
         q2rq+fYIrW29v6p8nbtRNab3OO4hXiqJL+pQrC41XV8b5WUFHyISv0IfIUyJ0qaauVP8
         XIqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226868; x=1795831668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=ZA+7tVdpbNFh76ePdLx8VXUODKwDiYgl7Q3N29SoKVQ7H+WpK9KfBKCbrIrsA/YrUc
         dAYAk9aTDvew/fpI7/NKb0jmE8pIOFHkD4w7+PSm3keRswztQGEavcXiChr0RKRvpNbA
         jUxYcCdJ6JYQNuYyZdGKr8YNVr6AOMh27dRi12H+xIIG2h/pJ7ziibsICB/LRg2sJfc3
         hzWUWKZPH5QFHgsP02GUpxk6+c4LH/MZOapd3oQdqG97WgaZrO7SUbHUKzkUZ5vLvKPE
         iE4n7jZsWk0RlMH9ImSSvMc4fglez/kVpMF/pPtBIpyIHA7fXvyogUXLdrpGnS5D4AIQ
         ZtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226868; x=1795831668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGjW/MMwdvPFqEPVsERwdloYMbx3HCaULFAZmemW7gQ=;
        b=CiCKDTVnI6dIYP+bazAnIy9Rop23aJ/WheE4/APLOlaf3vjtXq1Z1eW4o++6rzKzJv
         MyDdIfQBAvPgj30odILpU6FW0Kp6ab1VfnKImaMj6qMho6mgEoMLsz4NweZk5JzkpSP1
         u1R9M3hgHvfKeArDhegiNS2VFdMur+ak07m3yMHmMqDWhfVrWkJ5cpAiYFbEC0gPXux3
         rTSYuPMSBgkyL/J19aoq9kgXcW8/1GDHL/fbhHgM+sEorxOr58kVx+068Q86k/64wHUh
         103FzMgBhJjDb/WwnR/b4Uh9xft2D1yy/9dh7gPG/0QtGrzHBS0fGksttFffD8hnC5EX
         5Oiw==
X-Forwarded-Encrypted: i=1; AL+hErGIRIq+dICD0RRkHGAFJ3TQnXKQ0jepy8jOQLxlGEWEJXq3Qw8qSSKL9DuWzNl+LHwjYu0vuUuwyiTQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/odT+CTKl36UVhrk/eUfKEvSbeb2Hp5BbLk0ld/Q/7fXEylx2Q
	eekVQO2VKOLIGkcaPlu46S7Ps0NocLwoON5SJAgdvt8Q4GSShBEHbOoGLxzDJOLMz7Xr+Hixllv
	n0YT4+5QabqT5rKSnszdRlVCcKpvCldA=
X-Gm-Gg: AZFdTZe4h8XCFvma/3TEXtps0my6DEjYlhFuA44v6Ak3Svu30Xn/pMRNQHk+jk+Bwg/
	bMNXsoqkGDyepU3LVkbIj8Cvtl5jtGaXCJ5+SMMBEWZoQsbVV1RAS2hb7tLuHXzQWQ7YFmBmO2C
	+gVumzVy4JNB3x+TwFbCVgUYausVXqrErGzsWIREqD9bw+NwLCNiGjKAvqf6sRlngFYTzZ9kDOT
	86jtYxzZkiNsIcA815922QP5gXJ0F88fFy4v8T2sFwioLLY6LjsigkGJbQ29YemjJHoavntFrNm
	NLjRcBOqCQ/IUlvdODjGzdt3cTVBrBMs7eDY3t1bFubYJBqVicMfpWwPaBJo6aEOqhHyVCmJ8qL
	wiMdd7yKzs/pQYrZE7R9ZqneP9sixxfFWJGGfHpfpyfzVSmatkSyiC1ajz8Y=
X-Received: by 2002:a05:690e:438c:b0:67c:2396:3243 with SMTP id
 956f58d0204a3-67df441041dmr1738856d50.29.1795226868649; Fri, 20 Nov 2026
 18:07:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261120174440.123487-1-prasanth.padarthi10@gmail.com> <20261120174440.123487-3-prasanth.padarthi10@gmail.com>
 <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
In-Reply-To: <f70eee05-1d17-4060-b1ee-f4845b74e3e6@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Sat, 21 Nov 2026 07:37:36 +0530
X-Gm-Features: AclHuK-XA1SyrZq1BHyksXey6RIqRcHtTohcQIWXmSS43XQq55hSKSbeB5ss5Rs
Message-ID: <CAMFFDGh9y6JCTJ+Fv+exsDUW=qvkW8Tsi7VfEFTowpT10bJRYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks for reviewing v2.

I misunderstood the distinction between inline replies and threading a
new revision. I=E2=80=99ll send v3 as a new thread and link the previous
revision in the cover letter.

I=E2=80=99ll rewrite the commit message to explain the hardware behaviour a=
nd
design rationale, and move the test results below ---. I=E2=80=99ll also
include a GitHub link to the design notes as supplementary context.

I=E2=80=99ll address the cleanup structure, naming, register definitions,
shared unlock/relock helpers, error handling, redundant
initialization, readback and copying comments.

Thanks,
Prasanth
