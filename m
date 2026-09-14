Received: from mail-vs2-f18.google.com (mail-vs2-f18.google.com [74.125.227.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B725941F7D4
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377779; cv=pass; b=ukh2bCSQ9UYnm1MwHI9R5hx7krkDG/3Dvse5uHu008gQ3wmuu53Fo+ONGmYCiSouRCGRsHDhaB0KgnO9RbhB5b+BhXsqmaaydfwoe7Ilv3KGW8S8wSi/c3PzKwMGjQKh44vOH9xankAV10CNPQIwcTXXKhghojm3jQMxHqznOMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377779; c=relaxed/simple;
	bh=OQIDM3IadPguqK9CTcDIpxeqUSPP28I07Cp1akqRRk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLeYYDx0OXCJf0CB22sNKXytRUZkZb5Q8rimhrFoYPulByUTqoghjY0IaoV+TK5aQwAyO7TH09idEnWlZdboqd+4omkDroKwDMxOGbJsHNQN3jVsHF+UJq+Ik7aRWedZfzmJ8zKJH0HELVrZ+pt3uGbDYUIWUZ1kqDqrZxsI/GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN9yXWj2; arc=pass smtp.client-ip=74.125.227.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN9yXWj2"
Received: by mail-vs2-f18.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso699001e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789377776; cv=none;
        d=google.com; s=arc-20260327;
        b=al2ujvAZw5vTDwkhA1U5zidCP4Q28O3aTjv48BAVrGlNxf5XM3BLAfYBDB1KqqVejM
         8ShQO+7iedZO6E7VplspYcA2Lz6WIjU/+E1e1xzuUICVyUC3G4I+G9MZtdkz02XTdto3
         64RmgsTvRZLAmPaTQZPwTdMw5zEFxgxbUIDW09PRlOXv1rJSlhzcew4URLR8pSk2Q02l
         m4hCgoqB5xouPzCu6y5hkcDUnW7vWoxB5C/ik/gfUj/JqRoHD3cOB1hlsvNmD9nHiWEE
         15az7s28RCIqr7X0X6I9byGjTBcOkSeUzlISmTm3aNarZDY2or0VD6LClqKMCnhCjMmc
         /mHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        fh=11QH5ZO5b0nsVvdmNTmoCivFF8hyGlUmUf0Xxko+x0E=;
        b=n3mg1D+4Sl37Y0det71d6D4JVcfBNT//Av9EoDL8/9Rmy6Bqq+uhtMIo1CiVUYAC7g
         V1j+Nu8gmp3kGpaundTyrlTz2qcyu7RGKP4jSz03eYx0PGh4tQdemDY4QkaGz0Rg6W1u
         6d226JcnohjlC+9kYMe4u39PTexuA/1d0EC8yZSNcsvZmThf7SH1Z1uP1gMoi/HV2PMt
         TUqQI54by7BoeBfv3CkPs1LwGnaCYd4HmDUkhU+kmWYGy9ituQu2pl8xrzCiZwtZ9wLb
         ri/3YpB4OyqNR8aJHnAbMDjLp0kBAXrFXQpJ3tlZOMUD7scQZel+jIVk6Mup+0geJRCy
         CVVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377776; x=1789982576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=gN9yXWj2NwLeAygJFikNXoAQYCoJ++oqeZ0Y5hC7wNvahvx3+BU6UIP8KB2Wd9G+ha
         z+ppUR8y4ILjC4GZ+mhAqrXxcFu677LT5zmmzXqdmjjJ5v7PQCTFqPBGgjQUVfBOtHao
         JqKeeHpxuHbQsGO3UmboepPwIDyzYXHN//94WiD+d9zzbwxgPrCmTyVXEFgF12CzZCrZ
         eDsDH2CSNepnrpT0GZauLSwYMjN+wTiQo6bt0x9peP01nvXAUEGQE7Wg7ktK841UTmPr
         3XKTHe8qOpa9lnfhV6DjIS1DQ45n9nRqZzHutlRG1bJZjgnR/+AXmcXORoxq2/kxsiXp
         iNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377776; x=1789982576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+fyavDdNifniiSGc7Q4VRxGCTufa+XKjYswJwqMKYc=;
        b=HWJzxL2BmD/0Xw0DB9QMpv2OjGzRAbwFCcB764NJkcS1PiaLD8qJp6aMLbwyCmu3sp
         i/cT40eA0JPujPflwM5BIamrwNXoHxHpmoXMgKLF4svz5IJcEcnT70k3ucCi0dkNaTf6
         WSopepSZDLbhuYyTCsdqMqnCCdgG/mvHX3fPsMWV33hwhbApeEfk1nshUmU0vPUnF8vs
         sQq724GnvuWztayPR5T4+CjvLd4E5u/OCULfSGMoo4JWACTp0acl4iUPdPacu5c6/dmL
         TjjS9NunBqWchYhmideGV1PY3QHeFO/qB/Wu5oodjWvLBPFaJl1VWq8oGJEbCUGd7J0b
         Q6iA==
X-Forwarded-Encrypted: i=1; AKwUvBwWlyja9Xsls5fsT83zoujiGlJkPTEorW2OUyoDr4lYmoAZNJ5Jpbmk+KNFhkHGph+zIdQRL6EWlcPw@vger.kernel.org
X-Gm-Message-State: AFuF++nwxqryuq7oOfiP6sUH7spuyz3U5aAm/Q7SjKQDKTdDDREXu+mS
	G1fjBXi/DPxJsWoPtGI5ijvdxm1Buf+TVYDI3D4JENp5HqqvyrRDql1EiqtrHlarUXUQzUjncBo
	nylzL2E11iRVl35dlUBjF+b1YeTF+b9I=
X-Gm-Gg: AYBFou32fMtBzGlLDJfbJz67VfPfoCnT8TjQxXrqEQaWdkzAHJ+EZsx/w0QlQrulO12
	upt3e+Zq3u7KALT0Nf3hUWHKOf7D5f8/RBjGshmZvYT8F5dQnn/sAvk4tqz8JifEwVObYmQp+PX
	npB06wOo8C3L/BgUuyzgQ74CeQ49LPlwRZvEBYRKNQXdr1lZHQ2E1Z56kfq70Py6HeDeMo7d9PG
	7isv18fvTLKWdTzpoXjwpVUMhoX35MjiRQR1u9fa8M5Acl1wxSgIs5WbdHban/gO0xHx/YR3Oi6
	L6L1uJoZrZ3krfh9+zofUFjEJeK1q1w4c8P0brlSSbVMqwDh+4xQ1jUwBQ==
X-Received: by 2002:a05:6102:3a0c:b0:790:2ae8:32c3 with SMTP id
 ada2fe7eead31-79b58093728mr573931137.6.1789377776433; Mon, 14 Sep 2026
 02:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com>
 <20260910-add-tda38740-and-tda38725-v4-1-dbae7fabce09@gmail.com> <20260911-placid-clever-lizard-de1258@quoll>
In-Reply-To: <20260911-placid-clever-lizard-de1258@quoll>
From: Colin Huang <u8813345@gmail.com>
Date: Mon, 14 Sep 2026 17:22:44 +0800
X-Gm-Features: AcwNN1Vq0GUYmtB80Y3cnrvTLaVxABwghCq2riX6lN5HPRWReqpu9nIst8JoDro
Message-ID: <CAPBH0A_-fUYsbweGEu8gkUEYNHp=dXxupxW0bqNkKKr2vJH--Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Infineon tda38740
 and tda38725
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <colin.huang2@amd.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8811=
=E6=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Thu, Sep 10, 2026 at 08:35:50PM +0800, Colin Huang wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree bindings for the Infineon TDA38740 and TDA38725
> > single-voltage synchronous buck regulators with PMBus interface.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 46 ++++++++++++++=
++++++++
> >  1 file changed, 46 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda3874=
0.yaml
> > new file mode 100644
> > index 000000000000..28eeb85f13df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.y=
aml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
>
> There is no blank line here. Do not come with own style (like your
> version 1).
>
Hi Krzysztof
  Thanks for review.
  I will remove this blank line in next rev.

Best regards,
Colin Huang

> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740 and TDA38725 PMBus Synchronous Buck Regulator
> > +
> > +maintainers:
> > +  - Colin Huang <u8813345@gmail.com>
> > +
> > +description: |
> > +  The Infineon TDA38740/TDA38725 is a 40A/25A single-voltage synchrono=
us
> > +  buck regulator with a PMBus interface designed for industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/row/public/documents/24/49/infineon-tda3874=
0-tda38725-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725
> > +      - infineon,tda38740
>
> I don't see how you responded to Conor's feedback.
>
Thanks for remind.
I have responded Connor's feedback today.

Best regards,
Colin Huang

> Best regards,
> Krzysztof
>
