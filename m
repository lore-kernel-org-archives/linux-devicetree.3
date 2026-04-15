Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161043346AF
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245068; cv=pass; b=D8F6XX6w5Ik+evnApneFNly1YELMlNDa/35d9lNaNauiwR9wxkD2JNSxsC27zag1Rq+BoB6UqfS8vrRneCny1ELEtDtaju6ZHuGaDOQboFjeUuN3p0hcnPGTY7YaSEjIQGi7cV6MWKrsG0P5XlMcP7XgMXaW2Z1tyC5H9O2Od24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245068; c=relaxed/simple;
	bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuZ9TEgX5T6GPdr7228K7ByBz80JxUe3W+lcd+Uh6IW+pqgAuhWCM+OCEDeIhC9lVDj62kW3Ut/mwdK5pykDVQNHsrzDS/4WNCbXpJy/AzKBfPJ7Eawwls1vdYJqvByQiTjoGQyCStNZSvHxyq8aDPgkyCsWHcJAKWfSBfy5TGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGUtTM38; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGUtTM38"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b4583f0a1aso20868885ad.3
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 02:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776245066; cv=none;
        d=google.com; s=arc-20240605;
        b=QmmsC86JKGX7HADOHdmklClYIHzC30oETvcicIUAi0WGVReXueA0A4jjIOhdtmzA0f
         ByC5j5ObsI7RpyIPlxgHlGbElEL2VGzo8rerHNDJyGYNOimpS8JR2M0ZlI5ai0YprH32
         aDSikTZTkU2/1Roo0aZlh4ZOcA9C/nJOu99Nzf3i6XtUbgMLgqSg1YrJbOKuwHbtfDdH
         pwrKsMLd3PUIdPsJXOLTGSvcXLhXNVIVjJATjWqTKs3IAJTDgdMT0VBih3y6FYgB9qra
         y1J/tEpbsXuMrol8QIl303Up5nrUiHjj5LZOcZJjJEFaQos2jNaxW85hmEKFYZ4MXT4r
         XzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        fh=AkkJ/WpeHlh9GgaIpX+c6F72ITnUTx9rXVJHn2hoRUw=;
        b=XCXe/Ni786i/IrbGYGkgupBF7ti3PVHnT3TNEpANC61KlOQfCZsCZJ2jpO7AKcgPOd
         FfVnXdnX5MC197LRfAuUdAFy9X4WNg4U2eGEBTR6BSo2HXnA7YBcVWFG74yDl9oa9KBy
         Kq8i3hr10HTXZzL/hnHBS4DuEE8rtWDaZlPo0iimfetuCEDvU5DrrCSKhX/V/ic4Gdq+
         5cEj/ZfRSP3TCBpG0vklAadgROs1vDFJLz4QDGCYOW/k9Eld6kHaCxI5r8pU+wChPsku
         jmZD0069yLRQ7OfpcD77VW45C4rmbmuR21oMboejsBkchv0qX1yRDYh8vp/EFLFSoXYJ
         /MPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245066; x=1776849866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=mGUtTM38dQjb75GEAeiwxhmUL5NlyG1gzCAw7jlKl6mTO1mfirlejc/yKhKmZ+O6nI
         ldKOi4dJ0NXVmoAGKTc9PhsVHtOlMfsM/BkjIC/pio3hZ5Bgur1iwKMiFSpZ29xnuVGD
         BQ/zweB3qMHtXQhAdG24HQmUDerReb0YDmkwIJ8EdDKFz7X9rKcN7FDhQzKzTyCzBwmY
         IdT0U1PADUwQ8XCXCJG5ssz41n6OpxfbaSnCy9ad1INr4J7sNOCskXLZmyp54h+kOoFk
         p/pQNSRqtqFjjwDtLes5lPtlDrLtMzsLqHRuXypDnx31WdKXyWwLFHRSuzD9xFxi9W3R
         OAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245066; x=1776849866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJmT/w8H5lCvqR+3MrDYaPpMRfkvpZilvwhihN3HnHM=;
        b=o9ak5dde+0IfDKfdmHDAne16aRaxVUsaouebEgpiDy9D5OVrCQ8p6wOfQKXWlDTeAd
         qI9siFg0P/65SooUMBAtdasRNknd2ap7H3k1lZd/+orAy7/ciIlua9CNbS47I3AtJBne
         f8oTS96w5FK2HklFvRC9vZFt2snN8i7qqABOe6Yfmojch/8ZDvbtaqvbyivuOh2uwFeR
         uksg93IsiM40EdKdmkMItkFYfvrwtet/K7YtNQeg6yL8LbQe68mhZ+el2A0DebUCmvsC
         //uwY/xiT9flbq5LPTnCYuuVBnlrjxYy4TEDVGqN6QwJb3oDCAZN+bRUfyMdZDjcdc6J
         rw/w==
X-Forwarded-Encrypted: i=1; AFNElJ9rncTZr4ERo/eAem2LFXdSY1hBd7sJZjql78HSClIEpYve9rLtX02UxVbgrNzH3qMzISqlbZb5QRW6@vger.kernel.org
X-Gm-Message-State: AOJu0YwBeUF9tQgR083qXoCmWvGzFHfyoedgGycpRCyF7PVKtW89K3Ag
	NjVJsHzGODJW4dZhRPpvVV+N5Yp1neouHrZlubOo8RxXwfptoDcKjCc9DKrrD9wwv88P3N9YY+Z
	3loUOAb375zbd55FRMukcOzkGkCRvQMw=
X-Gm-Gg: AeBDiesXphHNFPX2TVFWYHavCqhcnL11NW8Gb6glDz9+NG6pz4hJSNQCkOJTYtAMVRL
	W4IgDBzCL0EArSI4zcxAba7XqIVri2T+Jz23+nHOloaSUckboMn/3LY181+mJwqp4KPlYdwjp1Z
	Ad8pqwY90oVO2be5SqyTXhH38J1WrImWDCumCixA0ZJ6hngs34QUD1noyJKaIKHXt7I8bs1vMC9
	jbmTcZRuSbC66ZzyYndqj0uhHeAdaCiKC8Rc17Iatk49LjcTr5slI648omji2ReR8skWW50nIQ5
	aeeIlQOw71KGA9HNPcgkRWHQWDRMNW6O1lJlbUCz4zBOStka
X-Received: by 2002:a17:903:2cd:b0:2b2:420a:b48a with SMTP id
 d9443c01a7336-2b2d5a5b40emr221045375ad.32.1776245066382; Wed, 15 Apr 2026
 02:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-5-phucduc.bui@gmail.com>
 <87qzoipdo4.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nERzKW=2vZTWNuTcjz4KuVyc+eaCKBNP6ZGb4UAYw3qUQ@mail.gmail.com>
 <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wly87rgg.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:24:14 +0700
X-Gm-Features: AQROBzAxV0vtDPyTesfAsCOTSD6-ZvXhLNdBVP4mPf3ihKDvrCGQY99VGP4P4-k
Message-ID: <CAABR9nHApZ7KWjkeut_2oR+AmstOfbYnVe6ad2W+EaWRGPbt=Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.

Thank you for your guidance.
I will split this into two separate patches accordingly.

Best regards,
Phuc

On Wed, Apr 15, 2026 at 11:55=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui
>
> > > I have mentioned in previous mail to just move fsi_clk_init(), but wh=
y do
> > > you need to move it ? It works without any issue without moving funct=
ion,
> > > I guess ?
> >
> > I moved fsi_clk_init() below the two functions fsi_clk_set_rate_cpg
> > and fsi_clk_set_rate_external because, inside fsi_clk_init(),
> > I assign these functions to clock->set_rate. Moving the function was
> > necessary to avoid compilation errors.
>
> Ah, OK.
> So the patch 1) moves fsi_clk_init() and 2) update it.
> It is including many features in 1 patch. Please separate it.
>
> One note here is that /* clock function */ is for all fsi_clk_xxx(),
> so don't move it.
>
> > > And why you need to call fsi_clk_init() twice ?
> > The FSI controller has two independent ports (Port A and Port B).
> > Each port requires its own clock resource initialization and configurat=
ion.
>
> Ah, yes indeed.
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
