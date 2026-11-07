Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058753;
	b=LJmf+8KR9M8C8legUv9oPkXYEMgWHC4TrmDG4DxJa6IDMYvHZcU4oMUwEnBI1Kiqvnfi
	 Cce403X1+c5UFinfb2CP3AqL01ir2Rn2B3PFp09k5TK/kHDdci5ZFIYVQVof5/GrG37pZ
	 XFna5W61Ina1jiaEsHG1/3URgGlu44uA1IgDqj+vI3I0yrqAUyACVjv+amr2vyqnIm/mR
	 8UB7JwBuBs/H/PXBSeVo7pgJBDR50GoGShjAX4OvwPQYloHB3FWyMyrGOCw2eTnRHV+Vh
	 3H85YeR/0BleWGS5JAJGek1NX/240Vm42vmHqgsNe6mP8zIC5olhjpC8ct9GyLPP3hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
	b=VybKEmbhge2422S141AExK+YPEdU2ZLfzDCtr4jWV8CnGRSyLfuUZdYIubOhmei+tgOa
	 O+eNgJiNLdcUny/w1KvwVE8d4xl/4f1ahRU7NUlCMDZsKJYYgesZ8VSnPa6iy/+sNbE9O
	 9GH4tpjsdqAZm8SDl5jIF6sZ5/ZFuLr0s1lbCsSrkOm8HQ+fOrqfT3JWgmDzkyufdjSOH
	 i40o6y6DCF1d+nVW5EK4ApmK/mLQ6OJRjsxHQR8amx5Q/0iYC8u2KpvT49LuwUxScTU6D
	 q8hyCiHN3IeWtUxwzpFxWduVi50W0J678oPBxP4gX1LC8jLBosies7PDQxGS4mVTNVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC1606A331
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 13:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAFC1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OX9Wvyqy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so16144765e9.3
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 05:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058751; x=1794663551; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=OX9Wvyqy8007fdh0vspfUTVomQmw9PZiknsy2c5tog70UB6fuZRwbW7XHXN1J7dMO4
         cXCFUkWsD95cnboSABiiXlg08Uu4I+HTc8zjdUceXlI5inNzpxBtxxqr7R3pCSwDpXwo
         CE3OkHwSLTZgGnLpEurpgDeDaSYS+cn1atLNgSOQwkJt38Xbvu+2WtXjV/+89TBi4PB2
         p8cmW8TDjUbSZdU/FpDUWxtIKoIksCgn8i5FwRq371+bvUyjUTlSH2AdDzgovIP8LEjC
         2ZxPhknYZJWaE61ooUpfhdTnlOlt236Wi+ITT7QOF/E11WT63CmozubP+WAEAdiwBWv+
         vLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058751; x=1794663551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60HfFRLQNhaGSHuWAKIr0pymjvkfxobZad0q1Kl1YHo=;
        b=zjoNEZxGSMUb0eK1pDe2Enj0H9p0SrMRUfVatTc63/vQV0nM7cca5P5A+k7w/KXusD
         RBVNeSgKFs1/a7+TziW3o9UB1Sr7ndfruloZXiq0iMxThDdVTht8pmyjgGBYtCvtIVZk
         zBd3PFDlaFfaa3sJVeWdmYw72Eh1ij7pU221BoHp4fhKlRHk5jlbc2NK2Q3h6cRXl74/
         /h5/vXAnrChkGguMbWK38y5FcuBasG5xCwZjMSxNXaudt3jPvRHYTSmZC2IpEMVaeox1
         Te6G90hBniXgs6SCpbSMCcx+SVmD3T7On1JSYiXWm+cQwV7rD8LfRQMYjkWl/+VsZ/eP
         B4AA==
X-Forwarded-Encrypted: i=1; AKwUvBxEr2mDCcSEjGsSGdpRLDEUiLMZOuafbvFxuUhw2oa4ogqYKlo+Dx4zeJVlKiW9O/RC7WTUNQv6L8f9@vger.kernel.org
X-Gm-Message-State: APuU4Z9x/I/ditcsnAdmMNoKzPXW1AZsWm3ADr7Fz9+Pt/EbO6MOBAVe
	bFfMxLnWKay9Gny5RC5hCgAUWokcJjn/UXZCoy9uFXO6G61dpD0SA8Ip
X-Gm-Gg: AYBFou1RXaqC2PY9IizZ7U9mMzxCw/eWJre2icSVtcyJQOEsNETJ6YGAnRS8mqte1MA
	xT9BpDq96bXwfJZH8Ae2+Pw7GLhRYUY2+WSKEahig5G7T3gMz+wNnyk8VPueqNxH8xXchyvS6ZO
	QX9ZHeIbvLyssVDlg3UolCqw37F/F2yR2YgFNAlekuOjt3RaxkjTsiOZL0b+f+95QPZsDJZe9/U
	hZSAWFgG8EN6ZmHgisVJLQ+sYL4zhsZElrYXixFbRBB5sOeRVQ8xqs4wXhJb0ia3NqojJJ1m8iW
	w8QZfYCRwGDP+g+U0v0wBU2U6cXDYDeZ6JdXN72063GnpjhMeRF2SKYdzzfoxEn1eXuZqDHEU/r
	/Ta0750eq0DgY/7f8G/00mQo3bvA8b01nPgT8yveN8uiuFwhQRgghWzAf6n0D6SrNIAkN9owNF7
	/SQykvosGY/VY8vejFW1L7FOwD/NVF48DoPzOm2v5k6yjFXOsw7SI2B4BzJFOKPX+xHqWJkJPsR
	sNe7+J1ZogRy6FDthNx0PSsx/wG1zUMe/aTws9+zFLw3gBxvwuJbrbwuPYMB38oyzF+dVR4bmLa
	+JLzh441TKX/7oBZaZJjumXRicsQWwMvp80pxMmLoGRF/EP9gLZQAa3P7XUhQQCNEMKTBUc=
X-Received: by 2002:a05:600c:4e05:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b6de973c54mr87477975e9.10.1794058750949;
        Sat, 07 Nov 2026 05:39:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e2e9ad7esm71189685e9.1.2026.11.07.05.39.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 05:39:09 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Sergei Khomenkov <shomenkow@gmail.com>
In-Reply-To: <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
Date: Sat, 7 Nov 2026 15:38:56 +0200
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

> +/* Bytes per pixel used to size a coded buffer for a given resolution. */
> +#define RKJPEGD_CODED_MAX_DEPTH	2

A valid JPEG can be larger than 2 bytes per pixel. libjpeg-turbo sizes
its worst case in tj3JPEGBufSize() at 3 bytes per pixel for 4:2:0, 4
for 4:2:2 and 6 for 4:4:4, plus 2 KiB. Quality 100 noise comes close:
2.75 bytes per pixel at 4:2:0, both from libjpeg and from the Hantro H1
encoder on an RK3026. Such a frame does not fit the default buffer; by
your commit message a truncated one fails through BUF_EMPTY, so the
client gets an ERROR buffer for a valid picture. I can't run the VDPU720
to confirm.

The default only matters to clients that pass sizeimage 0. GStreamer
1.26 asks for max_width * max_height / 2 of the enumerated range; at
65528x65528 that wraps in its 32-bit calculate_max_sizeimage() to about
255 MiB, which the driver keeps, so 1.26 is not affected. Its main
branch (08ea5bc9fab9) asks for width * height bytes of the stream,
which the driver keeps too, so these frames would not fit. Both are
from reading the code; I did not run them on this driver.

Would 3 bytes per pixel be acceptable as the default, and as a floor
for smaller requests, like the 2 bytes per pixel floor in 6/7 of your
hantro-based v1? 4:4:4 at quality 100 would still not fit, but the
subsampling is not known before the header is parsed.

Thanks,
Sergei
