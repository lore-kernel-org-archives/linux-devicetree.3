Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749254;
	b=ctxYd/n8h3U0tYbTQxm3840/rYA1YknbLlstZlsoRO2dMhoN/uH9+F9KMHqKN8WN6i9b
	 16vCAF8aSWpZNwShZo4BTTaNCy1yYB4YWUc43DCmLnf2TBYmVHqnt+Avt3xOIOSsLvhSr
	 WE3T2GsAit+pp64vPLK8Y8mwCOLoiK77OjGI0QetUKw6s8x563j7sok2uEtytFHyZ/3bT
	 OWRJkYZ8sgGU/iiTVuZQo60CZ81B36ABLBgRCjTIkpnEgdgRuhxGzuUxKi72SO2sUUraB
	 oqbBZPBojswhJHcwXwh7NvYZTjFUR5QPKb8alN9pWre0uFzH0UL9Veh5SRfOa2XroYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
	b=kWHJZi2K8hAEmsIUi+ejWR5vWbd6ri4/gcWjvMDkLFFj7dVCvPVAbKv5Og9LcSduQXFj
	 pMq5YYODRvEREdK3Gd2kihf5EBNgsXdQmvp96URFRQWsi5qSzoBGnzNjKDTCmVZidxLFi
	 HYmahIc8GxofjTg9/2zTGy6qegbIW2FFQ34yPw7KvzyAApm0g4n6BqYtbgGxjqrZ6asm8
	 iwtGqdWmpj4NMHk1q7cI/CKxulQHpLcCBxpnKImOl3+vWTpe6ptPJlSnfX2yMis0jsXC9
	 QVMS9ABbZYyZ6Tcga6lxBPSTgbWLfbg9LRsY/1cwMXPfKZgb4ZmDM0ggdE69g6tK3Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE207606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE207606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9495d543b91so456842185a.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795749253; x=1796354053; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=kzn4P6HIOv/zbYwhqG11ovEs8UbbLBUqqnN/DzSK4havfCIROjjWcg0BrcBmJo85MQ
         NPbAlUHSbbB5M41z/0WQSyM5fe2XNDZr0OBZgvZ8zx8+CcyQmSe207HGqcy8I8oiIPbp
         I4B7PoCSW+l2RpUL7Hv1TUKMkLsYLMlzfhaYbVudYzujMd0rb5RM2nfwTqZH5TlKxW0P
         HpEX8trpfurG4Z1t2A+O7R3SZdJQvK3StKsjR1Ec8GCNLG0AjS9r34Wer23E1KoihaPz
         YHVtcYnVFuWk8BVoztC3faEVBHll3EzRi+fgo4KU9nDu5amo6isvkNrJ4MRldH1yN919
         /wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749253; x=1796354053;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=zakwnwb8Z8FAsU2VSVzTxVCvRjb+uh46ubpJ9O/s3D9Adis/cnIaCUgsnRrAPBI5no
         5OVtAulodoEOwumjrJlL70TxuCdWL5iM4hPTS7rQVI4Z+yqK0ay8zKIM2YTUYmJyMk7e
         T6CHbMe6NveQq7U3/keNIbuPVi5pxCFdPVByXIUF0vr3FrjC4AqVdmMaA/M52Nbn4oAk
         +TJLHF+GrkmdxePT1jrZoXjK3nD07u2g6723C60T3yIs2XWBHPnD6tUPGzv4KjlQu4cO
         4f6agP/IyZCoJuuSVEBFaKK5wvbXpDIPymdpYs+mzu0QrulE5hc09vc9bOLTckCMa59n
         MRRQ==
X-Forwarded-Encrypted: i=1; AL+hErE2KjmSHU0Y1FkYhCwdHwbwdqnemOwYY46HVV4YEdBh937qYoxYbytvzgrWfuR3to6OPmWhO96SLXD4@vger.kernel.org
X-Gm-Message-State: APuU4Z+p0Hpvl+eIoQpeBaKMOczb1sxXw4+Tb4JDF2CyvWpXlADInTXh
	b9GGomow4C66iPQhXWxikX+rj0OcUDZMVX1MT8gdGTpcD7+yDYfVih6I0vm1KOPlvHk=
X-Gm-Gg: AZFdTZcsvLlaBqbLif2xd6hqkkO6PFFSGxNr7B/b0vHjLXCoQGLpgjaMBf5UizQZV0A
	yUZz110FadkXMgrYOVYt6NYCanbeKLJBusWrWJcwfLPx7PDIKfo0d9tyNgE6eYKbObJm7WskC4q
	1mPBZ/yMrtVMV0hJIbCOwQ9JCE3tQCU9tiaiW1KjSv/mnK8kACd80o5EN3dBNKWLArKU6o3CCea
	MpLC3quYcwUp0DAYUxIt70OsT8agm/If7BtAuccP7tT/w915QL5LXEzu7a4pie4Yme/vYn0JEFc
	BsSQax/3bdShBt1Wyhq3T28kQ5ll3KwdE8m8CLYoeCz064U62LL3ASWuNZCdkWXoqkXQ0OaWeMw
	AOb7IqEjlX4Ed8WgZ8oTCRx3TfXB2GEO4H4q/3+NjNeXaADqzTmXTw9VsIS4es85YK5fJXi30FD
	wMqTZvJRPnSdlU2H+gOUDJITDm982Rl+wPWCSJoFM5h4KLm89RjnPjrLJrZDLWsIfIpU+3Nqwso
	QmWIxka9ozDVVUmfjxXNC9odOqVR/36sKAJ1W0eOGbr6UMwBdZrSw2tVupUSg3q5tFP/CvWdME1
	NgLFOxZmos1Zkt4R3L5TaG6YrZ1ah6ErWUc208M8tpp4WBUOAlmzCTI=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr3894266285a.8.1795749252644;
        Thu, 26 Nov 2026 19:14:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1733363985a.5.2026.11.26.19.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:14:11 -0800 (PST)
Message-ID: <1f649c8c2c08c31f1f6ff7d7a17ea02301d89579.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner	 <heiko@sntech.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Date: Thu, 26 Nov 2026 22:14:10 -0500
In-Reply-To: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
	 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
	 <awanusdfmrjYpdHT@m3>
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
	protocol="application/pgp-signature"; boundary="=-KBWr4qryrDMK+mhbuy3u"
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

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 10:17 +0100, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> > Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 922cf74c4eb8..384ff77771ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *fr=
ame)
> > >  =09 * According to the spec, tile_cols_log2 shall be less than or eq=
ual
> > >  =09 * to 6.
> > >  =09 */
> > > -=09if (frame->tile_cols_log2 > 6)
> > > +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
> >=20
> > Shouldn't this be 6 too? (log2(64)).
> >=20
>=20
> The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syn=
tax):
>=20
> tile_rows_log2 =3D f(1)
> if (tile_rows_log2 =3D=3D 1)
>   tile_rows_log2 +=3D f(1)
>=20
> This is also what eg. gstreamer does. I will add that to the commit messa=
ge.

Thanks, note that I was also confusing AV1, my fault for hopping codecs tha=
t are
similar but different.

Nicolas

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj1ggAKCRDZQZRRKWBy
9DsUAP9PRVkjRHpiRiSLgzM8l9UhjnS0sDzgmwo4BJV1vzvvAgD9FAmOhu7fqhJ0
E9UOn92W7ZLiKmduKFmpzDXkPI9rEQE=
=QqIL
-----END PGP SIGNATURE-----

--=-KBWr4qryrDMK+mhbuy3u--
