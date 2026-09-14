Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0847A87B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396015; cv=pass; b=ZWppgCbcGI828CjN0retl2QRTKpoWGS8J8VabqvZN1GusrU3PV2Z5kSJytjOXxqnjQEabNBrwKIxwgSHcrFjCsB8I9Va8IrvpSLFV6LTbTZCQfhICTFoLZP6AZsYQHIPEExBywhPoOPSf2YKFUxfiHBHP4MCQZifCOamZiBoebU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396015; c=relaxed/simple;
	bh=81vJhDkEw0hvn3+KQOXHxZ2yc0dONF02B9FfrP65Cdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMD5wDQFMzTchKuVDrKtApWFzPbXlthyGECIUi/WZT4Pvhc0YOaU4pg044TNeC2K0YbIsSeUiueaICymsNcV4cLerY+fPqwInhnfraFF2d9IodsscFdZhJ9NsNttJvSFM0t1owfutlEtyRrBFrTSI0QTLXKYnm6mQAUSRazK9Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=LP6NjGNJ; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="LP6NjGNJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c25b661d37dso473426966b.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789396012; cv=none;
        d=google.com; s=arc-20260327;
        b=eFp/7jTmWILjk0IR5VMw7hH4AXBCWiqgZJsySPCAA8s0nDUWPwTaXPTU3NqK1MlJ4W
         UOxG+rkeTUhTmNyr3Bh4zBals8HK7f0MQz/ZHBS2AZ/Uyr1YamTDFKyOBgF0FXRBOoan
         VbaAqExZbsFbAkzQuEz0qsYxOkkthKOJrYixf+YiiWThaFBVMQV+jX8ghHqzIgAf+9wB
         WlTDbiSJhbzBIHuc/r5EvRIJLfnB9L1f8z2Yy1Wug2RB6UgyolQ0YxwNW6vDYvPwH9V2
         ZuMJaFWJc4513PPVIm2hYai/IaEGp51tLJgK025g9mCjDtjISPWQxC3/B7xfdYkMcHEg
         8QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        fh=9pitv8PlQ2ECanTu32n7AHATsHTMvf2jKmbGEYVwLJU=;
        b=aBETqET23y23BH/Uz/X+7wzlgmtsB4Hwl76y/kbqfuuowY3q7uySwseOQlOkiP6ilG
         lCSmVeLrNFMtoPSmVURiFdSHUZj29eeS/w9sizDFbJgsoHmcF9pYulJhEp379xwlx8ep
         9XAvqdJUPFJavO+LjDwd+rrJkNffRlYGHkRYbUNgJBY38Bqcf4YMrGzPxVxCBaFMsQ3B
         PRTKZFmXLiuOiKW+sMOt/WR3cRP54ZwxHQJihAajSf2f4K4RiwO3LvQqmpILgDLyQNnb
         KUMSVegCNY1x5az4KM//UMRVm6tpof5Lh0I6zgyQOHbIwOCy57lLIMvNk4WluUh0MN86
         1Z3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789396012; x=1790000812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=LP6NjGNJE+hKXOjbl9OyaZMTR1mXVdrIpNoixBRsgZ9XEiySkFhq2N7kY02pIxC3J8
         W+o7jWbiUR4d3+JUwPutShJQeS2QmugUdEW+No9tith4a9OsDcAeqwbFReoYSuL1r/Kw
         FK5fYDHR3YOsyt7K2n9ZGghK0TzE7XkWb3xbxg0McOuCI7Xq6s+wJLCZcxTAFuft3ZzT
         zsRV4u7alXzvMriRu+8WHAyKbW453y4WHl1WzFkHjlTUB35JefJWqb+t60JDt8Jb2dDX
         +PjTC3WQYKDzxNrSplUvYvaE/WB1aKFePGOQU4DfxIAjIh4cv3MlhsqOcEAuUIHAQcbH
         5sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396012; x=1790000812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SRl5RlCoBEMdB/onhWIkx4Vv9NPOyhwv41Rqd2HgvQ=;
        b=KVEsKXU1xEwPQoZJxrYWOiTReyibeQ2G492BX2iiwwUTYwy5gNdJYTBtpvMOm8Yu7m
         uTYvB5T33yq3DM6rniE3CIth7aHKikQTeIgr5kHMMjXjvB/Y5llK7H4F7XD/Ov8Jxnyv
         qmmgdqdMw4LvOhNcZAx0i7UUccbqhaKHfQHwCv20CziWdTHRWTmMvjXljFx65tEDWjd7
         L7+kA3y3j3mZsE8eej663EAVr1a+mxFQkfePMdm+bBUtYiBfZDD6aHVyPaxWp0edSDPb
         ta29JOAn/QuaE1NaRCclgZ+AhAFIwaek7ZE6xt9TOfQDoOz7UOrDVo7l41T4w5dtyLzT
         O9aQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4YGOQOmQg5YmwcS9m85Zy9xt9vtJ/yaTjkvtiElhPao5LcxbNoWOI8rOxgbo11RFqyUrqa2Qq8kJf@vger.kernel.org
X-Gm-Message-State: AFuF++nTrm4utEpyO2GCEHFqfpIEnr+w//k0NJaaRAVSAKB8CyVzeQ6r
	ROGBdot2UdHUf8J4UCw/Gd5zIA+S6KBWdGLEG8QJQKLWzN79pY9pi+4yvSlnsAVrVKTDvUu3hFX
	NmnKddsWhbrto6JcjRdJzfEWxqWG0Th11fMmazkxnFQ==
X-Gm-Gg: AYBFou1MQP2+UpdQi9WcFiDbXTjTWot6QzcODwhWba13nWGAZPt3wwVAmmsCDq8Vetm
	uozyv0pe4h7tJbOHRhgeGoqflgBzQ3GVQ8lLjwkG5QevwXLZIr6ylct67enAwEQXduAjEpZPNEm
	FQ9xbeO9BfvjX7ntK2EbLvxGiZ3qd/u7eo8rMQFhJ2Lrun7vI1jqWJ2cQJ3K5G5lm0J1S7eCIqL
	VOm7+tc8+m3qxoQ8Gm71l9UWmrM8c66CwkeCge1PpIA6LIC2IfVFSoKV3zr9gHHDtSaLlyr1Ca8
	VFywBAM+uld/1mxEBtyHtve+o/ghoN9l5nHAnq5nt0N1GSZRW3Gq9uQ=
X-Received: by 2002:a17:907:1c1f:b0:c29:3bc7:c13 with SMTP id
 a640c23a62f3a-c29b861ead8mr178688066b.4.1789396011638; Mon, 14 Sep 2026
 07:26:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net> <20260914140821.269AC1F00893@smtp.kernel.org>
In-Reply-To: <20260914140821.269AC1F00893@smtp.kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 14 Sep 2026 18:26:44 +0400
X-Gm-Features: AcwNN1URozr7S4_r01G8CCPPRVZ26CghHbia4XeX1NY-TwCeIavw2uWVQYPLnZ0
Message-ID: <CAKTNdwGnbzJnvxdGJa58wf_ab8RPBurjPSt7uxXno-z8sqdqxg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Adding an array-based fallback compatible string without updat=
ing the `if: properties: compatible: const:` conditionals causes the new co=
mpatible to bypass device-specific schema constraints.
> --
>
> commit 37d04d6cb52639a3cc4ba9ade1878fa540a5cb3e
> Author: Alexey Charkov <alchark@flipper.net>
>
> dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798
>
> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website. BQ25798 is a pin and register compatible replacement. Expa=
nd
> the existing binding to include BQ25798 with a fallback compatible to
> BQ25792.
>
> Link: https://www.ti.com/product/BQ25798
>
> > diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/D=
ocumentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > index cdce83f058041..43afd232a6142 100644
> > --- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> > @@ -11,9 +11,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - ti,bq25703a
> > -      - ti,bq25792
> > +    oneOf:
> > +      - enum:
> > +          - ti,bq25703a
> > +          - ti,bq25792
> > +      - items:
> > +          - enum:
> > +              - ti,bq25798
> > +          - const: ti,bq25792
>
> [Severity: Medium]
> Is this a regression that causes the new compatible string to bypass
> device-specific schema constraints?
>
> Later in the file's allOf/if section, there is an exact match condition
> for the ti,bq25792 compatible string:
>
>   - if:
>       properties:
>         compatible:
>           const: ti,bq25792
>
> Since the schema const keyword mandates strict equality, it will fail to
> match the fallback array ["ti,bq25798", "ti,bq25792"]. As a result, if a
> devicetree author specifies compatible =3D "ti,bq25798", "ti,bq25792" and
> configures out-of-bounds regulator or current values, the device-specific
> hardware constraints for ti,bq25792 will not be applied during validation=
.
>
> Could this if condition be updated to use contains instead of const, or
> otherwise include the new fallback array?

Fair point, will address in v2.

Best regards,
Alexey
