Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558611;
	b=Xwer0yAj894UuHcWYyWVo8bZsfd/rr5HSMxKB6/hnf5BNsDS1vqHLrptTcrIjPqhdZYm
	 f4R0wWQvwfgTwhMYrVhjlhjklnxLsB/BIQB1QAkVsLD0w6DHJp8YFIPJ8l80n7JcyUYq7
	 W2hqRX9r0N3dLpItzNyPCgU0kofebEdA8n5/qIcHMJxilzuUkWmfqpXDhTAtYQsNOENne
	 608GOBSC+1684zGCcVgtJGYsz8caadrJx1LmF86/2+HkQh6UfDi3z0iKWhKCeUSC95HRq
	 377St23xHgyN6JD5t2omdB1Jpm6fRNClPYECBkzfjwpVmJJokWWb2gRn3H7I3RlaGSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
	b=wd1bWYaajlE21ufjqT08KIK7dneETi7YsWzay6kwLYLae01L+BTPk6n2rRazN5mjOtNV
	 ZOerLuFNnXvtAmSvMd95oNdQA+U7Jzsc5vb0BrWzdWVJN/iiipurZmSFNBPYOvk+mePY/
	 Hd4/LgE2/yajlC5muYkBsVsDCBicv6Pa8LL4h9h0Cc3fYuOa6TcbL+ALIPOPZX/uIwvtg
	 POeNZlMg2EpHEYRlLUGvZLSHXI60eIybHooHPDVvbS7f+D77vDxBwZ+l2O/JT98Y2N06+
	 jTcOIgOZ6A1FbSiWm9acsTwIjyMbC330YHW7YAqfoSfV179Nn5eU1P2BncvCwqWmocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40C9606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40C9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a3EZvP5O
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92123f02faeso52395756d6.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558610; x=1796163410; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=a3EZvP5OyowAiMtFRNJn08m3NhjGNxRg7uIjCQJAiDLOLA+8FctfDs3jn2KLTG+h1O
         2hDthh3ZjlvAk0RGTcTC7DFsEWzWATomdIit+FsIi5a8lP3BJ0PiEjpUbRwvm1u9Ea6S
         QtpdcQviakqrDzRYu8t6CWRkrkR0o2598OBWpj8ZgHBJO7dKmLYA0IruhH4qS1IYIXOp
         1IVyIO4zOvm4AsUA6rrt2DcZrqrs0xejEK8QQg0+oR8XV8tgXNST0WG8AhBKHnpHNFXa
         v5AdSj0L3dC6fYZDxTcFgI3VsAwlkLG47ZbE0YQ1fsu7HmnF416hH/35MvXcf9Q0G5FQ
         pLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558610; x=1796163410;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=1zz8BoZRqvRbtWAczFXHomthWPLNHRi/Y23w1faFM0ImDYqYwnCXUi2vjgYx70OA6Q
         qo7tjiBozJQjhRq/dIYJDjpQ6y0Tq6skdbdwhLP6oHnZsO0pQJ20evKSvmwW5DUlXSER
         QlmZPAg3Ltvddh0cmw4FL2sYPHv2fhDuvZUD3L39fjWS28Borim7ahEDeafN3mrN7ONe
         uVhXGhqt04+XDI1f9CJFBR+WybgGds+XkkJRuSbagjxlMG6kjkx48Z6EO8Le8k8ZTOtR
         cRquqQBLyJssRQ2eBpxD0oeM8wE7fGsloBCU8A2DwYejWkr8Rsh0HiH7WQaTeFVUlnIz
         9l8A==
X-Forwarded-Encrypted: i=1; AL+hErHa5MjNI951QYsl+dUy8YVcoXr9y0u2s+pQyIJ0S7XWkMzJfi0VKeKsSB3sFPYK6w2v1wOswOr947vh@vger.kernel.org
X-Gm-Message-State: APuU4Z+z0B4iy5OupfY3B8nP6M0ki1DrC2hFvQtIYWaBJlFKcM6Cv/Fu
	R9vwQCC23ICVqZEkdrALkKdnnXyCGFBGM/4HXwxpXI6vFdRiMbNrnwSGQR18eZPtSMM=
X-Gm-Gg: AZFdTZeU6djPcYS4qRWMMvqvSLvc7KNSlicUrElM+om/MoCh0sGcL2FlYjWi5PnnI4c
	p65OO/yqgUHYe+lgyQ7w8xOGe6OSua3Syqzc4Pj9kauGmF8dYoRAtgUT7e9wgyN1v+iQimMebjG
	V3zrFqItK6MaIbJ0Vke6b3HLn9AUc1QaUIQlScfiEYC/E9F2yphaEmHCRuBZqNv7HQ0f4wfsp9n
	Wvu1zKJZzlYXmca/pM6NfEIFeCKQ9B+rP/bSHnqPN6OOoekwiDYlHadrAceTay6QtHDVxU4ZtGa
	mqTqu/nS4EjFa943DxT//Po0cMqbwMYb9G5QhpcaPbXFlXTfzbZzTk8MD8qsQBz7IljZE3tFH6z
	k3YhV3Y2xeF3GmYQlNm9VQpG1heTopKaK7yTCzZq2kLGGiSZfuO6AqBQNS2GR+fDmTE2wK3/c++
	c/J20RWJpOVjVI2i6tkXjxRzbfPQOOKR676MnHo3UwrSeXMBZyag/GK0NVEaM1ql6+zGYXeqWwS
	NZ+9gArldnoQIqDpIwq0cC3mBusu3zihz/KOP95XF8fHYcPo7+xZ0vTo3EyvQxxhOkGZ1n0PR5/
	97nTXg01LbEeukMSKC20AvvxIh/v48YVmH+6r0M8NF0NFxCGPaI25GC9
X-Received: by 2002:a05:6214:1d01:b0:91e:f8bb:bfff with SMTP id 6a1803df08f44-92134a695bemr295012926d6.10.1795558609635;
        Tue, 24 Nov 2026 14:16:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm143924506d6.0.2026.11.24.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:16:48 -0800 (PST)
Message-ID: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:16:47 -0500
In-Reply-To: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fZhiUwItIuN4elZmSsKu"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-fZhiUwItIuN4elZmSsKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 922cf74c4eb8..384ff77771ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  =09 * According to the spec, tile_cols_log2 shall be less than or equal
>  =09 * to 6.
>  =09 */
> -=09if (frame->tile_cols_log2 > 6)
> +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)

Shouldn't this be 6 too? (log2(64)).

Nicolas

>  =09=09return -EINVAL;

> =20
>  =09if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

--=-fZhiUwItIuN4elZmSsKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYMzwAKCRDZQZRRKWBy
9BA6AP9PS5poldHn0LERh5sldYW2P73wx+zTyuozNl+3ELVLUQD/aj0MPvIwO2sj
O8VuT9IjLVqFj9L0GOL8uRcAYapAAAk=
=/mpK
-----END PGP SIGNATURE-----

--=-fZhiUwItIuN4elZmSsKu--
