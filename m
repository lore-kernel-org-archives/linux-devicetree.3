Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF374078E1
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975864; cv=pass; b=oUkdXL2lDCz2VvyePskUOSec8K8SeyVJDDPeyOooaLHnmwHIpuqngjGv2LF9J2Tw4o3PqFo8Tn0r4bXBl/s6vYaKgNU4tzyEn3QzanxxyAN8vjWp7GIJM/DzhDvuVspYV39PTJW1RlQyTcv57GCMTRydPKrSilmVNR7iCWTKoxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975864; c=relaxed/simple;
	bh=+kodcrZ7Rfq3RbtOm64zvOegmrBogr+8Wwr1ekULfyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEZuM6Q11z+wjJ2+4McM+9vX7ipZnwUPQ6Xg8EbTZx2WUs3a0i9VLce9jyMfPL/OgLNsXp25D5ZRAhR3FiubLLOjhLqTm3s1V06hVc/yocU18CctVEiA3k9bShGs6/VgTM2fC0Gc+vKnhrnKq7eC7cBiBofEhkBYcsK+c3Kq/lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jD1gc/W/; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jD1gc/W/"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so1592881a12.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 00:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789975862; cv=none;
        d=google.com; s=arc-20260327;
        b=TuSpWY1sqwCRpO0VhDc/EUp4HknFbjXjFXGYBF+v1702ZxYQKF4EdlUietvdfPi2aO
         A6K2pyFC4ZyY98cfCwxL27KZpLmt4Wozjt67rkpsY+MJPDiTtPcpBXPEkAR0gdnwvsgo
         IJEIqg3qxEe7JBVDyO0RCjKOi8iYYMr9yekmxtosMxi0wAXBmosj8QUH5kbE5JpDdI8d
         YnBPeg36EgT60Fz6CuZonMf+1TOnM+zMHihjiTSXXA9ZEAuq8KU33uNZioFCusQXR8oC
         n7ckvX7YIwZvr6JlTLTfWJ5xJOv9aLnxxzFVv6Ipru6q52Q4Mkzh/KGFdWMfQR3N+8fa
         d/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        fh=L8y9VzacoOJeEwIN1JNZSJ5RUKIB+N9yk+kqU/od8wI=;
        b=QUQLM4Xs4iH3BkiKhWHNZqyNrQ3fvoHL5Wzyj8OBYEShpunAMc9gNB1RQkbyhr23Nh
         ZnSzR5FPKoGDtxNJTiRd+98yr9Bb9J28CfnSLXPMhrXY9pFkAIvVxSfAM5/WF/DBtFwr
         z8dkMDKnoOg4t4Lk5vuzGPpRUGelERpODL4wJ3AQBbQKswaCHrV109CjrjUxUz5EQJAC
         uNvryIdyVvIYsqwytfUuE/ZvPGegEllGMDiZ2d+KLJNeJ1GUnUGbvJnBMH/crKvHMvFw
         OjDOJiTt8nYrWniOk9ODBlX4+YJsS6cJms5Mq1MSLwNLOFTJfaCMTw/A6W0xesuvfdoM
         NYrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975862; x=1790580662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        b=jD1gc/W/eQYVqx+yirVe2qcyxe+donWRgWllTIa+7VE9+YQJpmeal1Rk0LOgaDcry3
         CuOI/JxJJI52Wsmu7eYoX1vkz5XJvFN+BfSEzY0Gn5YGMnZZ+WpXeMtv/PCNa3YpWlo8
         s9hlAknJ3Qs1c0R42qcLm2LyzNL24XghGRMB1PXSn54MvoQOde6Cud7hsfyOlSGdMN9n
         8FJXDNTZlmmR79EqWzI6FBGzPfCGDgiRg9UWmYQl9dgfe0NzixXKlHk5TC/12PLNK4zS
         RbqumxQSe17kO1x8LDxXCTnnBqvxMkz+ipuP2SCD7m6l6cbkmTgd4ow7pTU+7NgWu8UD
         wPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975862; x=1790580662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1BZ6sJCmqeFIahqjVQKO9ObElEe/vXNKUx/QqdQ6iE=;
        b=K1f9jCAw4yetWYy827RIID3vKO5RlCKScBjj1EA5NR/TMXyg/UBFH6hFP6RoqV9K5H
         3XnuD9zAlyQRX3Ogy6oJdJPsHy60Vg5Wq4MqU/fVDd7/R+D7QuQUcT3UK19VnOrlP0cV
         /MzEihOS87bfQyE9VemJ5FVPPlnRW+qxajwoevqPuCz64Ugo8Wqi/uUH1C+HqMlAiX6V
         REnz/QetYOmxl2Z7Aj+LyuUzBfS5WVPxGJFmTynhnkj8JzssW9zqDtyaW+AYuPs9SUxd
         354fX1pEoN92v1g8qz+dphxLjRVzQSoHgTx7lRbMXO3Tm6rfqwh/m0Rw6kBOQh13SmzM
         jqjA==
X-Forwarded-Encrypted: i=1; AKwUvBwFtYscTKR6zRSLzDaa3gP+kUleffrmSVkNGjcVceO3MTQGTspu9aFYfkyouBsBTklgMn8iY0MWVJL1@vger.kernel.org
X-Gm-Message-State: AFuF++l8ICB3evb7hiU2hiVbyiy9aekY1FZgKWQFXsRa+tdNLWrEBW9Z
	CUrIc6R1A5iEdnIAHjMWih+wQQ+/uC31pcuho8XizwNYRHEueXHag9beXfpY3+C7iXjGSRhwt2K
	xZUmBIT4swy2wuDFT0/SNljyBUWlXogQ=
X-Gm-Gg: AYBFou1FG1vBbFqptjMkV8LcPkLdKOuBshZxs+daTj0y9aQo6Sp0ydvxl86lxbwzDMI
	QEc8R/b/A7965gkabD8MxmGJVa+4exo55AtHZ0+QwbPaTGIo+B/D5f7BbAHFhFne2C+Fcp69u8m
	jodtM83gcxUWM15uPUAoxSzWXpOg6OIxIvdDW/eGKCLsMFsULXqzXNhiNLwXvozxNIk1ibPCyvZ
	gz0zMco7S9JAw4arTs/whpXRgLu2yJdQU8/CZSy+Sm6OoYLpLxtaAI7+TF8nrM0/0mjuKo1zyCj
	nk62S9ia5oZ0zHK3pl2U9chlpySXdN4L7jPwe2zXw7KsVMRKsLDJHHw3CeVBWmIES5MkAmH66cz
	OsMiKPYzWXXLE
X-Received: by 2002:a05:6a21:6b05:b0:3da:c2f5:a2aa with SMTP id
 adf61e73a8af0-3dd8c3323a9mr17128224637.18.1789975862197; Mon, 21 Sep 2026
 00:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <20260721095654.429346-2-clamor95@gmail.com>
 <178463529533.2776661.17291216407355479584.robh@kernel.org>
 <20260909162654.GK2133376@google.com> <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
In-Reply-To: <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:30:50 +0300
X-Gm-Features: AcwNN1Xwan51ardBlULGfF9_kTLOoiJJ0xUxr2pfFDkGmuB0AEVFXrA3aSj0HMQ
Message-ID: <CAPVz0n2o0OYFWsoXrYXcoAPNz2L4sKi2=JvXPdQzfvha1mOm_A@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
To: Lee Jones <lee@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:50 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:27 Lee=
 Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, 21 Jul 2026, Rob Herring (Arm) wrote:
> >
> > >
> > > On Tue, 21 Jul 2026 12:56:48 +0300, Svyatoslav Ryhel wrote:
> > > > Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TX=
T to
> > > > YAML format. This patch does not change any functionality; the bind=
ings
> > > > remain the same.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
> > > >  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++=
++++
> > > >  2 files changed, 42 insertions(+), 29 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpc=
ap.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola=
,cpcap-leds.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > >
> > >
> > > doc reference errors (make refcheckdocs):
> > > Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.y=
aml references a file that doesn't exist: Documentation/devicetree/bindings=
/mfd/motorola,cpcap.yaml
> > > Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt ref=
erences a file that doesn't exist: Documentation/devicetree/bindings/leds/l=
eds-cpcap.txt
> > > Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml: Docu=
mentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > > Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentati=
on/devicetree/bindings/leds/leds-cpcap.txt
> > >
> > > See https://patchwork.kernel.org/project/devicetree/patch/20260721095=
654.429346-2-clamor95@gmail.com
> > >
> > > The base for the series is generally the latest rc1. A different depe=
ndency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up =
to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit after running the above command yourself. =
Note
> > > that DT_SCHEMA_FILES can be set to your schema file to speed up check=
ing
> > > your schema. However, it must be unset to test all examples with your=
 schema.
> >
> > This one.
> >
>
> As you can see only complain is that reference in the leds yaml to
> Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml does not
> exist. All cpcap cell bindings were converted one by one as separate
> commits, so this is natural since motorola,cpcap.yaml will be
> converted last and patch doing this is included in the series. It does
> not bring any regressions in yaml and dt schema checks.
>

Hello Lee!

Is this explanation sufficient? Rob left his Reviewed-by to all DT
related patches of this series.

> > --
> > Lee Jones
