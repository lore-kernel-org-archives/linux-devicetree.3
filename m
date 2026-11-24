Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541955;
	b=CnDRxoDYqoBtewQj/fynuF+p+oUyxt7dJewPtE1yrQePRsuXU9sezLkv60AoHAIUP4A7
	 rm6oFStzC+YY4N0dRb7B+8OnxgfdQ0lZRPLJl/hctMM738svabxF0vm7zLdcQrrKapXXt
	 CcpCreZAnH+0qFmCcU+lNwBj24EZeolxQ90ixRGX+VuynlraMgKpNUGXJ1C2Lj4rwnEWE
	 VPWOlxa9G1PiK4sMzCGv/u8Wm4+JojjlGI2WNhltzHSD/SkH+1Glu04gcs08wCMeOKeWB
	 Se4OoqyXSqkWgfHGUDyqecxIUxWLk8jQO6Ng4ueDe6KHFTlt9IDxit/PbatuK71QJWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
	b=C8Q6XD5SF+vPYEMS8kCiL5arFC56QUnd8+WgapUTQtf6+pF/eQtK+oTszL8ZErHki/zt
	 gowArSGBun+KnusUyGxxnZBHIv98nHmJd58y3tMjIggAzVVsTvTJRCpQBN7Gb+J9OinpE
	 vHTkSzHvc8WAVBu2L5kpqP4HYacE/M5rUIPH4ZFP2O3T7jTXo7l03CQWTK9yjlAKNqU6w
	 4VZAJxxH/XiDCsKAYxd6Vr7TbtMkGoNb9ILtYqxHkBggidypH/f6wCKpUxBd5Dfy+d1NQ
	 qS5ggcMwd7y4dRnS6ZuuiDEOS4Dn+Gh1y2Zw09Gxep0Ury8JDVkgPZt4czkVGCrMhdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BbBJL9iX;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA868606A329
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA868606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BbBJL9iX
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4e18369c8so28352147b3.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795541954; x=1796146754; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
        b=BbBJL9iX19HFseLAZpNMrqk/cz7C7E4ItEZffQwvgffTsuM2UkPlOcyFFO+hg3yoPU
         BUaZAoyQvJdVhcLwgpFfY8dI+Y7oT6holR3Hn3ahHvRGxrVlELlG8o7Q4jpq9nds3JZi
         AEyDvCkLriXUxvZo7EiARVg7iHJsTN87EGyT7cub36IMWAs1LaZcY/JxYp76MWvRTPnA
         AY6g8pwMQ2V1dd0/t3kXGJFoeuVNqD9EEZC4yzKLY6Y4BpombrpMwyNtGmiecVgsOyNX
         zQE0g24FH43+nmbvst4iWIPtgaN6zibyjDMGN8AeSJ1FrzyFpd8cSNC5/G+qyhAsorMh
         lb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541954; x=1796146754;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBc309mYer5H7Xpcaba+ynW+B/78kXK1Bb+NRGqzY3M=;
        b=yqP6D9S2VGzUr9olbwD6ptYSiB4bbvGp45G7gbLTv9HSP5z+lNznvgov3PYYQ/OmdF
         2NbgUbHVIqWk0p1Lmq/pQff22bW/HNi2pSlUrd45AIHaqVkzgO0yOwHuSaw0YQ1o/Gij
         DL/5tzusNcICE32MN0X0ih2wW1kAV3WoJkPPwZPfq7+IjWbeld5NbT7sOHsD+/Qi84+v
         VLeS5cm7TrdSvfj2RrCgokK15TAsoxaE3+gPT7w1jlxcDWfkR+8ep9QGwis1ollmtG3a
         XPozqIRL5SMUZqCJetL6nTgJc+TSontTt9s+nxZWeHm6FHhNRIqugJpFif3VXyYmuAdU
         LabQ==
X-Forwarded-Encrypted: i=1; AL+hErGFUmc6coj8rkjvLaGu3hlsFnTeOLjjnHpa2am6QKJKmHA8sOhRU5TdKVKZXaBhgYMsJUcMIu6k43T2@vger.kernel.org
X-Gm-Message-State: APuU4Z8/6bTUKVfnJuaNGe+LyVDnMcTKw6hNXgEP/x6a6AUFbTvJd788
	srY6FkcPt6uN2YjfbBAJMR1cigQHn5RuPtFUis5hPc7bpbqKev0oloDLb8nq6/P9qus=
X-Gm-Gg: AZFdTZcMWRTuEW4XjclxzNCBOvr23zKMvpqtXL+ZJfc46FKs/SJSj69VVkctG0Wl4i9
	d9mqETEama7TUSGbPQ+3yWFXRdUhi00GR3/8LjHTFx5ky7LD4EDL4jG5TxlHsy6G/m4ae0CSLCj
	x3aXhrl0ndoamLm/969OwQS2TJ8AymtezZdHJdZoRbpkqTUgPYLbpzgVoteq7gGccafM1ZEF449
	zXk7KyuaaQorFRfhoMAA1Sd1lUlCKx0qHdLv95EE9lmDkAtm6MJfkhMcsW3V689e7a6XN1hgb5j
	qzXnlSLZ4Zy20JoS5/vaZeTOlDyjKN6x4NtjwNR2DleR5/z8dDdNUIfti6vtKDPcNQflv20+oTC
	4AmUXUwhttaZ8qPaEbuffe3H/wdWvk3FN6XmoPpKfVU6DhAwBzqjy314hFElt9Jkgd5+ZWCnKFu
	dUzXZ/juII+PY69vtqMslfkilMXabIZNT3+tWUyE0Ty9gONOR9hjrA4Ll8460Tkqo3BC4Y31eDc
	zuIbTJlnY/Fy3Z3tEPWNQ4vT09hC6sIZSt6ftaXCVGpcNN1zC67omHMxD61UvKc7zM7391CQ5SH
	Vu7rvLLYlxVHi+Gw5vNBX1L8fz3S08lIIsqPJWfuLgYLo93FU6oi7l4=
X-Received: by 2002:a05:690c:990:b0:8b5:6a83:5e0b with SMTP id 00721157ae682-8b56a835f62mr4475197b3.13.1795541953703;
        Tue, 24 Nov 2026 09:39:13 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354be4sm61097717b3.43.2026.11.24.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:39:13 -0800 (PST)
Message-ID: <87e98f2bca7ceb60fe0b786a2bf63711ada2572c.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Tue, 24 Nov 2026 12:39:11 -0500
In-Reply-To: <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-8-charvi.mehta@arm.com>
	 <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
	 <162bf4ec-c23a-49c6-ad7d-7485a5cce2b7@arm.com>
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
	protocol="application/pgp-signature"; boundary="=-EcivsMOo8ZMd140z5HSW"
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

--=-EcivsMOo8ZMd140z5HSW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 novembre 2026 =C3=A0 17:26 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> > This is suspicious, the vb queue already do some locking in most of the=
 vidioc
> > call.
> Both queues assign `&sess->vq_lock` to `vb2_queue::lock`, but=20
> `video_device::lock`
> is unset. The V4L2 core acquires it for queue-management ioctls marked
> INFO_FL_QUEUE, but not for G_FMT, TRY_FMT or S_FMT.
>=20
> video_device::lock is unset, as this driver uses per-session locking and
> format ioctls are not required to be serialized among different sessions.
> The explicit locks therefore protect format access against queue operatio=
ns
> and asynchronous firmware updates, which use the same mutex. They do not
> reacquire a lock already held by the ioctl core.

I missed that in the review, please document carefully your locking somewhe=
re in
text.

Nicolas


--=-EcivsMOo8ZMd140z5HSW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXLvwAKCRDZQZRRKWBy
9LX2AQDqtWe+/c2doI6o6r2GLVgta+8/CIYTXwIAm9OktAVFEgD+JCsYrreT/btu
r+NQEKefI1SmP+05yKhjlmTDl1hgKgw=
=bWwD
-----END PGP SIGNATURE-----

--=-EcivsMOo8ZMd140z5HSW--
