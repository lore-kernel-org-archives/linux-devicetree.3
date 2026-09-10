Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF884734C0
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039315; cv=none; b=Wqxqeny4ou/zf1qEuJZC56xMNZcVREHd1oF/QW0MdfcdYdQBr9GBijBCyEDih2bLyQHhv6A3RJ1LBIyGTQz7c5fX9CB0S+1DnqFmkQVUbE43SUTeE4bhxQsDUHyPkMHjvX1CWjKMhtiUdMbw3Y60vLyN7r4soISOlFFUfK6lAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039315; c=relaxed/simple;
	bh=bQ7EDgQbbXpJSNaeNFPpm9AtQY2rbEb9xngXnYeZMA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk0BTvVYL14H1JOlAplIEpTT9R/jkofk38KboyiGovSciGCOmAx8raeF3j/02P3jV139bKQ7hFttjHep4lo3MlvJ90EdPeEJ22UqlU8KDEFQfKFp1nZx2uph8wEFeVkFUE0Q1yNNizThkHsb4fI8wp572w/XxYxpLs4cI8E9ock=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hGJz1iII; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hGJz1iII"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4957eefd361so54725435e9.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789039312; x=1789644112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JuRvNfKlSmkziI3OYLlgbXnb4SXxwddW+G4p+yafYnI=;
        b=hGJz1iIIjhVbkuCGuTNRQkbWWNoWbS8YTrLozcm4YI8gYqcUnHSQG6zcQynJis4cty
         CkQyRQz21Upxtki8s4dUbl8DZRfY/rzkxVue2eBePRYv+3tRXI4MXVZtHH+IW5Ooe5Xr
         W5AeyhDgvQkchiyP53Q1wWIHgIA0ZVQUYzbM3aIDvLHFZ0xNH7Kkw8ZGS80+5qccJbfL
         IfmA70I/gGbIeramkmZx6/yg5Q3i3g5Tw0zVUXz4X0uX7ifAupxWwZ1F4qke5jJrIWv4
         cSjWJQJTJxC17tRSufHm0Shvq9FujNwhId4bETuN880y7hihfZ5eoUMEgLQ+rr8hAM7k
         84Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039312; x=1789644112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuRvNfKlSmkziI3OYLlgbXnb4SXxwddW+G4p+yafYnI=;
        b=m52qR51U/UZDVCEEmKmbKWV0mt+s4C/Y7eOrWQfUPvCCNzztjm1/KrkQ/eaBtLVmqa
         br+2XXK05eLx2T4xDVB8vw0BKj+c5obAORGwbr13satnpTtXJ/ummuEV6bhUDhW4aiaF
         k2ZRbBr91cHNo2cITigSxY2yQBco6DZ6cT/7/fN+Jivabb8G1LDVV3z3KyJrXejZy5Sk
         24vFD6EzkTJ1TGV68F8ep/R566GlXpS2sOH10lshNL2pWNKuF40SX+GUmwwFgAE/5ND8
         46Jvd78gZoIbris773DmosMpG7z9HRdPko7OW5B2ybU29MS7QZxsv2LftP3yVgJ/d937
         KZ/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDUV6hUNlOFuN7u1xfXfZYBSQwq8SxMfwbBRwiIsnzm9B2kyECAyM3tueYChp7sQRCaScY6c/QvQsn@vger.kernel.org
X-Gm-Message-State: AFuF++lOKkLIgR5J/mGIDkUROpifZmj3WUTHoTQ9ww3D3rSi+wVcCKx8
	Qmz7iUovLFWPFr4o9OSEQKPaL0Lwi5A8rUr1iUSzbZQpuMhDGSyA5m/hILtEvRs8s38=
X-Gm-Gg: AYBFou0mca2pDlYjwB4YWgxxCP0GdrF5mVD/BYecih69qZpfmixufwYObgcX/hCmp/d
	KQXQwjQfqFhEQ55xOSqEF8obcME0ERnogo/ERYqecqWa7CWxafIg9sjMQw4SAHqzeDhSaDX0uOX
	Y9w4xxVk7LTkK5H4+vN4Yg5DzgPiujkhD/l32MgUQH/zjciANdZbjH8CCTTB22fBKlHUKDfECmH
	Kmp8uixdFr/MlxfIJ+tuhI23Yk1muD3I9aMoZljk1z8lbq0pUak2takGa6frvQkGq9y3mJ9/4Lz
	TCYRgFW3VLbXOcIWFLVsCkzGkb7jE4egfhtDcEw7nWt1rwFjb99FZCsEKOnJseqhyJauLxYvxWc
	jzLMPL2IlnrOZ07trbDBpvfx3/oJIqDRWqN5R0XH8/2xgLMzoIxAMq68WVAfSKcGbWZvR5WjOTa
	pgEb0xVWs+wsWfezdggg4QRd8KVCSCcHfeeS0Hc0P4hMT0J3xG12Iz9y6AxlK0c4h+Mo9vNBnhA
	8nK8KmrEIXO+Q8jHCysfJa9UwiE6pJ0xzPEX5+bkUwIhCjIe7xtFANKleY/2A==
X-Received: by 2002:a05:600c:4f12:b0:499:da8b:1476 with SMTP id 5b1f17b1804b1-49cf825a5bcmr431125955e9.14.1789039311780;
        Thu, 10 Sep 2026 04:21:51 -0700 (PDT)
Received: from localhost (p200300f65f19a904b5d271c2a69836a6.dip0.t-ipconnect.de. [2003:f6:5f19:a904:b5d2:71c2:a698:36a6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d26be5b72sm60221685e9.4.2026.09.10.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:21:50 -0700 (PDT)
Date: Thu, 10 Sep 2026 13:21:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Kartik Rajput <kkartik@nvidia.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <treding@nvidia.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
Message-ID: <aqKOipmg5V4oqZlB@monoceros>
References: <20260909-tegra264-ufs-v1-0-e4a9831702a0@nvidia.com>
 <20260909-tegra264-ufs-v1-4-e4a9831702a0@nvidia.com>
 <aqFqhNA50674GtPo@monoceros>
 <45a04396-c6c1-41f4-ace8-0ee0ccbc50ad@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dz72gahbmwoko6vr"
Content-Disposition: inline
In-Reply-To: <45a04396-c6c1-41f4-ace8-0ee0ccbc50ad@acm.org>


--dz72gahbmwoko6vr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] scsi: ufs: tegra: Add Tegra264 UFS host controller
 driver
MIME-Version: 1.0

On Wed, Sep 09, 2026 at 09:10:26AM -0700, Bart Van Assche wrote:
> On 9/9/26 7:20 AM, Uwe Kleine-K=F6nig wrote:
> > > +	{}
> >=20
> > { } please (i.e. a space between the braces)
>=20
> The preferred style for Linux kernel code is {} (no space).

Looking at the style in of_device_id arrays in next-20260909:

$ git grep -l of_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/of=
_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort =
| uniq -c
      1 	}
      1 {
      3 {  }
   1410 { }
   1098 {}

and extending to *_device_id:

$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devic=
e_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uniq=
 -c
      2 	}
      2 {
      7 {  }
   2492 { }
   1304 {}

So { } is slightly more usual and also better matches the spaces used in

	{ .compatible =3D "nvidia,tegra264-ufs", },

(but I agree, the latter might be subjective).

What makes you claim that {} is preferred?

Best regards
Uwe

--dz72gahbmwoko6vr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqikssACgkQj4D7WH0S
/k72JAf9HYoPZJ8wxymKY1IzQfsS4PqPWy1ZdB4F1pajrp0c+nftHQ6dC58aZFJz
v0Gke4rN4XaOO0k9eUhQ3lcz9Ao9rvz5aGzrzLXLaNpYPL6CeRhXAjhm6/SnB8e8
nYxAgXmi8iPfPyzuvDQfFU6L4/rGn09JP6wonOcJe3WRaB4jfFafLDmcHByGcuq9
XSytQmf/ipMr10+mX/47ilou7PEfMX++0Zr+4Weavny2e7VFatxMxXI8AzISjafg
bMYyt3sn3E9GepPQRcBrsssIFCBfjsxkFHmtrIMmnENsUizlKogGjhK0Y718FDBB
ailpTwWtqmZiREUyg1lVpY+BBSRnTQ==
=uj5D
-----END PGP SIGNATURE-----

--dz72gahbmwoko6vr--
