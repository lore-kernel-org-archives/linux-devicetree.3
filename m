Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E902346E55
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849115; cv=pass; b=S7UqRsnyeOYzttkz+c8mn6p2oLLTTu5pdGXorGSFcBdsxJmv/mKamoo0X17Jm3oDk0KZJf8/jnX2Q6ballyPvNWX7CTf53K0jsYzmtfvRhqu9iXFNSVbtPB8ihKeCEdSJlGp+55pachQ+Mwge9YTbH81QzpMIE5C4jqnybZggDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849115; c=relaxed/simple;
	bh=K1DnQZh7RTksEY/PnpmATjYf26gyDYwEwJXUsGJdA6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAiXAiPp9GY1Px/fMEFZ37OsEBnjaYU6iKpuF4abAnJytW/nyKh/j/UuTpmlWMuNxwlMD1w/M6jZ28zBhvMPto43NQImWrIhNt1ySmqF0UOGpdUHAejxlQHc92xxyf6/4n+hgEonE6H1JA/Zw0t5LXPRpqrvmvp2p2bID6vmOpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/oV6L8e; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/oV6L8e"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so1098741241.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 23:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788849113; cv=none;
        d=google.com; s=arc-20260327;
        b=FrnqTnQFi+RPenxcVqdeiSQA7K0qoy84pix3V+WhTLAo42DuTqj7jHFe+YrfnS5qBz
         W6PUR0fqfYJ4ihLEaOPGpN4U3rukr8wbZcMNLxorgmyokfG42BXXXUa49kFAtJ5IGXPw
         PZ8Bdr14d2+C0vgEUvU+rhG9yMQdaDEEQ2+HM6UyVI4veT0LCci079h26hP/Y9MFw3q2
         X2vL+dni7EI++zxT+vB5xpkLfu8YLPEDUKuz7bidOlxQvHWMr2AVpuayZlJjl1pcvRym
         6Mm1ji6GXF+/QOKj5epaGZ9hJCehH/lcUzVDx4POSANXOu71OrKMSTLzUkIen3KH1XVB
         GrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        fh=HykB+9qA/Lnc+Mqt5s5z4DaCM0mABAX3JsUlt+qnrrI=;
        b=VaRlEsoYTCYvdDKZFb3jyHQQi8mq3CQkYutuXBj7RVQ+weTTlIcQ5ZnDHUrZcE85SY
         DO6iI8Ddu7h478x1IiQyN2tBpghjrUfXQrcDBgYWtu2kcFlaFXZqJxdND7ODcQzzEh+I
         bFsz/zSkJMWxD2Ix+N2vrO19OrRlIrOpWvqwo+miHVgvjsIXzMt9EoV8yMzp3U1Yjw7L
         MlErjwd+55VFFUPU33vkDXIHOkneidXdfk/f8Eeizlx850P+LBXWLZnYx68x4CvQFvDt
         kFdV4Gr3jTqckSBeQavCRQSOHJhvS/ZgbLON5zn4b5YQPxnU9Tv9Ub9u5aPM4nO+ZEix
         sQTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849113; x=1789453913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=E/oV6L8e1aiLfGoBq7YwMle5u91Ur4uTXXkB72MF4JI6VtnAYx6NITO/tu2PmL5Uf4
         +TerQDVMNv53kBymdWmftUuluJhkxtzfEWKq6zxVqMcBiIHa9xksCuoZ3nV7PUlgoEzQ
         0qmuVsm/ZlFjkwonIKMPC/m5uL+NCOMSrD+y3K62v4JIFX0UD7l8ijoZ1IiwI0ZptScS
         DqaYol1xgwnx+9eHMtOyxlDf7MMfqImxU1L9dWFhvIFgVJ/yAvjzN8P1kHy0XHYI9zKu
         9SPBUP5E6NIjDjVz3QIfjCzVS1km7LdAfHE9uOFpVDCEscvz0PuweOQyL5uKVexOjP3c
         24IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849113; x=1789453913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0NVeeZ7CaBwnLyyfI9ekqGFl4BMkIYvBk52KFpKzqk=;
        b=F2FdIVf+pVvcKoKkTAGHIW0s0JvPjiv/f07MZ3Brk3hsiN0+cfR43TbK9bUYt2YWP7
         IUXNRyWlEhKA6LHivEylyR4ljmS4V6PQlHM4ZweitIVSvfVKpHDLgqnP/8Bashc1NjdL
         sGetGk4m1iiOla44KBcUb/cCZl57isgaWuaUqOSD5CIOjZsV5fPE2e6ASQ4z/l5Picbt
         FweQ+nMo88IvIj95v8WPYH1v9dUsUGNFXEdLvC1tEbYhGR0qpWEVnx8Z7qYnFvjQLomj
         BGxPGDHxsR4vn2dRPZK3d4pq6WlC7ZCFt5qL5Bn2EthepqeoFjYDmZCClVrOTDW8I0o9
         RgRQ==
X-Forwarded-Encrypted: i=1; AKwUvByobBkYIh/Z8l0l0v0CRBU/HIKO8bf1/FbRXb2tfXfAQ5ntIeO6+ftDk+zw4ubYM4CCJwPBnVF/vV8H@vger.kernel.org
X-Gm-Message-State: AFuF++lhQq/FAcfCLK8KqE1YNy3fVBHB3/+JAuqYdlpTSuUiWFbBJY4s
	kuRxVPpjiHlCYFEvU0jwfP0j+qGyhHVJLf9x8XTnZNDtOZCf8v+H0P3t4yLvIq33jFr4NKuNX2S
	YNp3MGo2ixQGpOtM3xzbZhxBMxRv/HYQ=
X-Gm-Gg: AYBFou1zIZ4qviGMi+je1BJOKKoryIHn5Hec1g/MU9lMEViz30ewEr4V0vG93+ufYRV
	0yo5cW7b3AjPMEL8EAGPGsGeoQLl45efX5THfFL/chl6UyWzmhVVlhir+juJAE8HkLnQUjOcsNG
	aYto/Ozr0vqTytz9XDUPvGNZx2TS+u8Nv1KTK7FMc42EErc9gnPvo+pr4jieA1wJrPSAOBZGhdC
	RLsmIantlNfGlSiTaDFkbJuQf/MOZFPC3GSglC8c7X1q3h/5mbiSyM+zOD2RczjzsxjN2hZK8VM
	gy/XVn+e1VnBNQuH0n+iZL5VmBsnKRQjqswwTk7pn4EOqPI=
X-Received: by 2002:a05:6102:e0d:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-78a4a91077bmr9190993137.9.1788849112904; Mon, 07 Sep 2026
 23:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-add-raa229639-and-raa229640-v1-0-8f7218cba85d@gmail.com>
 <20260907-add-raa229639-and-raa229640-v1-1-8f7218cba85d@gmail.com> <20260907-chimp-pectin-20f4ea3b772c@spud>
In-Reply-To: <20260907-chimp-pectin-20f4ea3b772c@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 8 Sep 2026 14:31:40 +0800
X-Gm-Features: AcwNN1VlTv2SntxcoxVK5N-Ex2mESc274Ua-5DjlQCs8MlAthNoLCriEU_XA3R8
Message-ID: <CAPBH0A9GZSD5R657xo1woijKfgS6gecUND4uabguaqUON2exXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
To: Conor Dooley <conor@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=881:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Sep 07, 2026 at 03:03:29PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add Device Tree compatible strings for Renesas RAA229639 and
> > RAA229640 PMBus devices.
>
> Driver change suggests fallback compatibles could be used.
> Why aren't they? If they can be, add them. Otherwise, explain why not in
> your commit message.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
Hi Conor
  Thanks for the review.

  I didn't add a fallback compatible because I only have document for
RAA229639 and RAA229640
  and could not verify full DT level compatibility with any existing
supported devices. While both devices
  are handled by the existing raa_dmpvr2_2rail driver variant, I don't
have sufficient information to establish
  a compatible fallback relationship.

  I will clarify this in commit message in v2.

Thanks.
Colin
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 2 +=
+
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl6813=
7.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..3537c7ddfb09 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -60,6 +60,8 @@ properties:
> >            - renesas,raa229001
> >            - renesas,raa229004
> >            - renesas,raa229621
> > +          - renesas,raa229639
> > +          - renesas,raa229640
> >
> >        - items:
> >            - enum:
> >
> > --
> > 2.34.1
> >
