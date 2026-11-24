Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508361;
	b=OuvQbikY0X8J0dEc/AhH5JqSrKrh1d6LQ16jp630LnTOcCn7Tv1h9GMqdqOCRwLbz0Sk
	 28VNKih+VYZHV9bMea759x7oBQ3c8aW/MIoCFFkXMb/mu7rN6qYPqeUdUI2EEdoE+P6Fs
	 AawTv1euNmuT3U+ggj6qvkHB2lpp1NZEXyeV4qb2lJFit+WYqBjp3MEmupOFnPNLqMV57
	 S5hIdZuAZdT26jpzfuzHXVlXy8HKF81H7+XCHkiBgnbcXQcVHA2uNKuFO39TsDtZmJm8K
	 VgqicblpuS+osaAmG/oeVZ1dwE599szzaUHZieSASngxfvgdgNXFZGk7c7ox9ixG2yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508361;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=8oyzW5Xhq7U02BOQUFs8WVt9Q7wuDOt/dl3tR8yBzUc=;
	b=NRljvb1StSviINMCjyPXqg2xZ8UnPcZJZ2spo6ks6IY7+eva/5EB66eZnKir1vpWoSom
	 mUOxx2Ep1LJ2iwjJSYXJKBqSdID65vZ/SqxvcdT+O3sbTndbgtdLB1wN0QwqTnHiRw5Vl
	 0O5G55RENEfX9eFWmYiSx8IcEffiYT8ejioToR0TzhcI88Jz9y8Ld16W8c0SuhzYPA4n3
	 VtBY0ppxLEjyD/BrKH0CLceSahBnEgxMsUgj4oyHqzCctdyNa4iQPT24VYUoojxhz/5/4
	 DYoK0WBf+8rBRvtmGqPjU6VgRjrmeEx9NkQfCPRoEvGRuVW5xEg66A/bhynW64mofFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=l2m8Ztvs;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360B7606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=l2m8Ztvs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=MIME-Version:Content-Transfer-Encoding:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:From:Reply-To;
	bh=8oyzW5Xhq7U02BOQUFs8WVt9Q7wuDOt/dl3tR8yBzUc=; t=1795508359; x=2110868359; 
	b=l2m8ZtvskeLJKWROZIXVNSDPHAAjpJTlQsqz9jTM1AXTiBfsyXpom+4nig4w7RYdS5WjzGXCRix
	7zIVN2zamJ6vSiYRq5ugw4DJR0Rdbohyx4+bVM3MWhXzdsTqI2U3U7SwtzaMzRQOShKc3ln/b06Kv
	b2fEYNHPGQEiBckHkCNFQCHcihvjUXiQKMqXZEP7ssdK3sFSOxHGEwThQRBUJoJwn9ukEvTIjRLWc
	uGgUHlyAz8CDt9nXi9SJ+ITW0MKS9a6gFn9rDfrw2yOfvxuLn+l+Qrdd2CH7WPPJz8xfSySDmebdz
	kdHFuAFi4EGZGNw7O1JwRzkcGvz2U0BF4+TA==;
Received: from [137.101.48.64] (helo=[192.168.0.17])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVlk5-00000003FWX-32K0;
	Tue, 24 Nov 2026 09:19:09 +0100
Message-ID: <164b646734156ec16171abdb0de4ce1f3a723b6b.camel@igalia.com>
Subject: Re: [PATCH 2/2] drm/v3d: Remove V3D 3.3 and 4.1 support
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Melissa Wen <mwen@igalia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Date: Tue, 24 Nov 2026 09:18:59 +0100
In-Reply-To: <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
References: <20261122-v3d-remove-33-41-v1-0-52152b454ad8@igalia.com>
	 <20261122-v3d-remove-33-41-v1-2-52152b454ad8@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

El dom, 22-11-2026 a las 12:47 -0300, Ma=C3=ADra Canal escribi=C3=B3:
>=20
(...)
> @@ -210,8 +194,6 @@ static int v3d_v3d_debugfs_ident(struct seq_file
> *m, void *unused)
> =C2=A0		if (v3d->ver <=3D V3D_GEN_42) {
> =C2=A0			seq_printf(m, "=C2=A0 BCG int:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %d\=
n",
> =C2=A0				=C2=A0=C2=A0 (ident2 & V3D_IDENT2_BCG_INT) !=3D
> 0);
> -		}
> -		if (v3d->ver < V3D_GEN_41) {
> =C2=A0			seq_printf(m, "=C2=A0 Override TMU: %d\n",
> =C2=A0				=C2=A0=C2=A0 (misccfg & V3D_MISCCFG_OVRTMUOUT)
> !=3D 0);
> =C2=A0		}


This looks like a bugfix, since MISCCFG_OVRTMUOUT seems to exist in V3D
4.2 as well, maybe split out to a separate patch? Or at least mention
the small fix in the commit log.

Otherwise, pending feedback from Floarian and DT maintainers on your
question about removing compatibles, this patch is:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>



