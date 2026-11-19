Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119613;
	b=5YXXAQD2DioXKrVA2YAq9JRp7oCj1FsBb7IncS4ei2eAgtIVnaXKz2pwA924YtxbdOwX
	 BZJYkb3I3065l+/037NXff9Dl39Vk+FLF3x44ewWjGblTVm6r9pJIptbolQoHRfMcmtTZ
	 iHqUYzVdHBR48VTPxvqXQtFzc6vEkpHYCtsAAJt/blm0r1kVw0VGvmuGIM2bBJHDFfO8B
	 lnzfxLqBUDzzlcN4YHXhREK9hG2eg9s0SIe5hACPR2yVUDv3mgKXaPUl/ttXmP12pGEVR
	 U2KX98SFppdFZ+uXoPZQsjEFrC+gNNplOeaBjbI0GTKBu5+2ssbcEJ6PABBAal5y+0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
	b=b5LuTXTk+wC1n9f8sCyGrjjXSxoXVNfAHxU9JXgd5JGxNTtrJIPg3d7yeYN6xu5ydkYL
	 rcHUDZgG6XqSf1FoCniYQaKaUhFU+BZFEinyI8B5DnPEq6muraUYannBkEJ0L0ez84rOV
	 XG9MuwnbUXqTkfEOEQphSKlY4lXyenPdLLT1ag06ocVAPIgkknGXKLzU8Edi1aL2hZCa5
	 Se41pAhabzBXbHos/0iPawrB9ZSCrLSYcBNAeFQN0x2cTdf0vq8Z6tCS3ZBaTIlb5soue
	 EXmlN8XWGYzt561dHk6ccCOYYPlUN8AwwIuBFuEiPJ3msvh3L4xc4CeFAu9zWpa62IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9831606E4C2
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9831606E4C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRmY0MrQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so928025e9.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795119611; x=1795724411; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=sRmY0MrQcatai13CSp3tCaVymT1Jdx9sG8+PxtJ6vo2v8nOZIgAZr5TMPPHpfiIlo5
         YeuoYsv0bU3CF7cOwhMYGcnJjSdp9bSZnYfiOmii7KSkZaPayIh7i0ubLMe0y/GmTkSl
         UWVRD2/OFS/frqPDCs2oplroD1XKkvFyDNKbMg0NCq1oppThffMV+wUT8ciuERJVLFgz
         SFsPQiffpYXeuwpMZpV27b772hz62Y5powU21nIF3Lch5bw1KmX6DICLJs3U7srUMiEJ
         sTNZPXkPO5oIaA+KlBEbc8bXwD14HR56QIl7P7TplxCLtnEplNpl7O4fCynYkrsTGU0E
         wjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119611; x=1795724411;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUxQWUg0cFfOfFkOLUnILAxBRHkeTjUzpnJn7oclOAs=;
        b=R/RV/iEB601AgJNOuYEsu6BvScOj6R0C3AcdEvsRBYE2gAehp/ViOFc0r+f2Cl8DrS
         lxcd7h3DryxpTXVvJomkYYYWXJuYmGxMhjjg27Isj1BwAL/X9pkvAuww/XMKk2mMgin6
         hU14330GcsxL8Pk+t4VwtW8IhkrUKIIqaG3xUF7MzTYgqzNNU+LE4sioGkaTEON/dHes
         AbkEkrSE5hH0kteP8+HPHgQvPepORd+iGHtYzGUq5LWckiGh9lbCPxkki1LW7vdjsUur
         t9VdDWVrb3N9TjB4b3CiO+bdzc2ZAKZTZ3rj2IhcZvGntNGJgE7TNx/Cg2qGpAUMmXMY
         kT6Q==
X-Forwarded-Encrypted: i=1; AL+hErFcH+LxWJLtK8RhBvZn7utS4P1IGHKeN5avpmn+FSmxDZ9K9YzlQI/+Oum7Bs9VKiOYA6vVhiKXoNsl@vger.kernel.org
X-Gm-Message-State: APuU4Z9cEyyh9cyXr2NeMvAVJ2c/5AkgQXTnme7fe5Mp/1BuJrc6ohyp
	0wIzCpmsQESfMwah6EWU2iDVCkKdrPaGaF9rVo4KJJKN/MmG0TzQwtoz
X-Gm-Gg: AYBFou1mdOpjaDPp2974gQge+P5zWJEPsq9zq7L7zb5v9iSMbf2Vj1voFIi72q37z1V
	YRomZhP8C0M4Xzmp+bPRIXM2GHqxkDf4lEndKtTkkwzSruL2OCXRBsycW/epQrf3U6eJE/pPaz5
	lPtNZXcBrlghWHu1jVc2uEk2W/EReakXpgDiRkHvWj6gONA2VC9fMbg+y5QIHlkZYQGSUpqQwpW
	UosUXnDPyyoYC6igrBX44pOTXZR1kTickpCu/xzVM38QP1gR8NJKsR1ItrSz5VWEGNr3nYy9KmM
	vOArTEMevOwjKffPbk8NXNJ+QAbcr0TmpmQJVjhd2AEZ1Or65ABj8LMD8DryaXjYdhlR4C0pD3n
	0bpYNQOAToytfRUXRUyjDwZ1qjZL60QEpbpx85MpunpA9wRwAbciA9LWlRrKQ5RaBcKV3HAXkhd
	gPBsetJY2u5DuACfrPCSb+0cKkcsKkaK8xPr+Ysc3mLrByWlgQy6o6SkrovIHxpeYAXQparXDET
	3bNuMeuF1TPnnA2JQsshlVNd4Cd8S11RoLaB4DeYnhmwzc/5kyzy1HJx2Y7GztB2Ko16+MvYrgp
	Xk2oOThbM1ASrxTwFputIva/vc26eiglSukvA7jQvcBJ2qxZ9TbWNmBxjObHmGb4N+47iV8b
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr14648215e9.4.1795119610866;
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
Received: from smtpclient.apple ([77.83.249.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm94509405e9.4.2026.11.19.12.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 12:20:10 -0800 (PST)
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
In-Reply-To: <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
Date: Thu, 19 Nov 2026 22:19:57 +0200
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
Message-Id: <92CE2271-6485-4B33-AF75-480F9BD56980@gmail.com>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
 <20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
 <596F6C9E-4A5D-4AE8-8D26-7A7247050D7D@gmail.com>
 <85353f59-52a0-446d-ace3-65e2d03d0d0b@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi Sascha,

On 2026-11-18 14:27, Sascha Hauer wrote:
> I haven't been affected by this issue lately, but saw it when the series
> was still based on the hantro driver. Yes, I'll change to 3 bytes per
> pixel next round and make that the floor of sizeimage. Would be nice to
> have a proper solution for this rather than either wasting tons of
> memory or risk having too small buffers.

Thanks. A correction to my last mail: 3 bytes per pixel is not a worst
case for 4:2:0, despite what tj3JPEGBufSize() suggests. Since then I
built 4:2:0 test patterns that push the quality 100 scan as far as I
could: libjpeg-turbo writes 3.35 bytes per pixel of scan data, byte
stuffing included, for one of them (640x480), and the Hantro H1
encoder on the RK3026 3.14. At quality 99 the largest I found was 3.08
(libjpeg-turbo) and 2.88 (H1). The patterns, 96x48 and 640x480 JPEGs,
the same frames as raw NV12 and a short script that makes them at any
size, are at https://homenkow.ru/kernel/vpu/

With the Annex K Huffman tables and 8-bit samples, a baseline 4:2:0
scan is at most about 3.3 bytes per pixel before byte stuffing and 4.9
after it, at quality 100 (lower qualities are smaller). Other tables
give a higher bound, and APPn/COM segments add any amount on top, so
for a decoder any fixed factor is a trade-off.

So 3 bytes per pixel covers what the H1 wrote up to quality 99 and most
of its quality 100 frames, but libjpeg-turbo goes over it from quality
99 up. If that trade-off is fine for you, I have no objection; I only
would not call it the worst case in the commit message or a comment.

Sergei
