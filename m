Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A82192F9
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 02:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779590574; cv=pass; b=IOQFxQKcPmAUzYFTg4lDJksG8oai7n6YnrT9PKbJAPnZ67xlf3ukYIXffpYbwnMiR6pMUjwNmr34z4hxX/IPo7RIDRGAEhHcpoc8RzQdLjv+YzxDVU9BKAGPtu+PH57eO+MKzlT3u5Mv+NOc+plytLilGB0K7VeuddyJsn/CaRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779590574; c=relaxed/simple;
	bh=Uazk3xK9wPBFQkKZppbojFNdUVou2Ob2+/OEgBGJQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFdS0Jjv9Tp9scu2jLpBb38jRQAwiHS+CfnwSbLSPX/D/ShJ5/K1FhC+XFo+dnaQZn3oCnF8/2u02Q2zcDhyl0gXXDfaYgKuxOd73FBtBX3HutzAb16B1lRWTBCdqAM4yFIK+f+AOrtCZU7FuED6jezf+gBH/X0zs7lnYq1r6Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ensqr8gy; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ensqr8gy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a884815606so9486649e87.0
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 19:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779590571; cv=none;
        d=google.com; s=arc-20240605;
        b=H//CId+/qLlX9jgdckITH85ctUOdBlDKMJYSoQIQwKRTmEJyAl1xlkhlJYvo9tyUz/
         kGLDk6DkwBloj0IoZp8+ENn3m+FLtLt7C4mt7Mni/dmI6Cuyk0YDq9wCbIrmgDs439ME
         FGyXBag9jiY/CQCUgomM/NOrQxVHyzqqn2vcz6QAMRvasq0qNtLVcnM7m4807qpd60+h
         7WJR9RuMoVnM5b10Pf2de6Bak6eM277l7DikEoQly/IPXE8NKFHOVEixg5OEBTwnU5st
         Fj9xAaQoUb9sd9vghgYWZ4cJx6E2avBBsYzBsxsn/5JnOo/xHqE8eu+Vs+gYulc9rIk1
         6u+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=triryNx+ggLH9l2yeoXzdiA8OekP3cVQgbIoDK/NrA8=;
        fh=8NDnWrGGFyVFCoSd+wev0xSf/hTjXo6KiD2eSLNZ9Hw=;
        b=lVxNxlcH5SewDyPJM4xiCqPQsbjTJZM4lOKby1FWg8eRvjzN88lmUZIbp3tCExNxBx
         P0ujyz6xUHyl5aK2eeu3AAOUuGba4FZXdxDZoK3V4Ody3yEu1nszgbbPf3a4UlYQSXo/
         wuJ+9ax7sPrqSRVsKMyXrnsJdDn0nq4JwC98VNpaLLVLwUiylyVpsZHjWTWYXt3xcHW5
         WjHWcUdLTSvo0BPHaQztFADhLh2sF09qwwopNzUFWhdDWwYQIz30zG/akKIMPnM/8jxq
         EQWWmfZXI4DZExwulJiD+DMDe34RvItfjY5M9qaSSQ9/ajwoZWJmqjtwZ7JfNy1TSAnc
         Ihig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779590571; x=1780195371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=triryNx+ggLH9l2yeoXzdiA8OekP3cVQgbIoDK/NrA8=;
        b=Ensqr8gyjeNcASciiKepYpn8r1y3sIW0UmqLRsnlpWb7+XvRXiT5mBgj5YkBV9io7z
         ZmCLRkkGEtxzWgNhi6kipkD1SDcBG6YkQ4UEO0bNQNQoLpCc2dFXuV3irjesIUJ2Ays0
         psOWVdOE3ZncDal9viX/ErT1D+P2fJUfUui/H+6UeQrhV/0DN8Si+dSM37zrZUkBEMW6
         YVetdjyczw4DVRCptTE1atQ3Umy81KdBE8jUWGorRZymXTl/ja90i9+xqoMnHmHnoMgM
         irkRBgqOSXY7H/nWB5TDNH1z+msKEpM+KDpVDJ91rGofiEADf6Y8vkoH96/D5Mcduccz
         F4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779590571; x=1780195371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=triryNx+ggLH9l2yeoXzdiA8OekP3cVQgbIoDK/NrA8=;
        b=NoeQWnMNfvqDNdEk+LI/fGNaIqvM1xg6ep/75b2rLR3C/tt/wK8gjWT6p+O/Ei5jIS
         KSGy5rxcjRZw4pm7mhOc+NgFmCXsKPMhwl+y0TSv1CwFJ/90BybxbvGZXLp93vqAyvP9
         qwqDOVWvQYg163P+r25qZgeB5TFxP2gmIh/Tez2ohyZ0OD/sfQEYYEPp1ZSZ/fujVmQ3
         4O6qZZAX1+hZVa/VpMzT9HRdytqXFagHy39uhXi/FDrQpXnong/Pn4VhmcT7X/N3fbRI
         ZSbG01jeHMRglcfEoUXz4WpNNtD+yMcXJSOaG29bPWOQXSv/HSKnSblTTzWBOK2T4Mm8
         R1nw==
X-Forwarded-Encrypted: i=1; AFNElJ+99cvTbRdfuimv+mm/Fh8wmvMQfjrIOf4nPvxm0dlRieQL7XIQfbO/z2SeKyCp7qzYAuiKvN1ylP7y@vger.kernel.org
X-Gm-Message-State: AOJu0YxqspfggCw/w03IHNi8B3Db1KEih0fGl1pMA5E9dLMWgxigkp5m
	OFV2U3HFS5aPv4ewqzwbqzRa/wZBHi7Bjlk0ex5888eG/ZzXPr1fdayvYWn1ZxlbU7uRez0DvJ6
	DfJKCZng9PFQcH49ioRHmFY5BdbmkKXk=
X-Gm-Gg: Acq92OHcWgTbt6Dn/75kyNS96JqYKZlRR5AwMSNfx1Axsl72FudjAQLz5VGRp5NzEy0
	cla1J5FN5UaXOShWvofGqr52TatVcdYOcxoDC15zdCWiioPGD1mBkDKf1z+Htszt4Ag85ejEMg1
	87iTcOSVomFv0pQy5DWRFlo0qq1E8etgdYH0X6EMNmjJ0LzTGTkY6EunkXY+q/6QJIlcwAqcPO8
	68+DxyMBsEp12qzRaW5Uh7homkWKlfVtH1iD2LlT7rhYa/aEqJw3OFW9wz6kBFxXjI4rqWKVx9q
	cuJ27KYD6NDfXo3UCv9ttWz4754LEzxZdKiginWSlOyvz9CngwywG0DjShXmTw==
X-Received: by 2002:a05:6512:33c1:b0:5a8:88f8:9ed4 with SMTP id
 2adb3069b0e04-5aa323cb975mr2733941e87.30.1779590570698; Sat, 23 May 2026
 19:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
 <20260518220228.63322-3-piyushpatle228@gmail.com> <20260520110948.167c8e14@jic23-huawei>
In-Reply-To: <20260520110948.167c8e14@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Sun, 24 May 2026 08:12:13 +0530
X-Gm-Features: AVHnY4KGBDlPvL31bQmSmt-ZqeZ2ql2ufzbcRWI3PNEFr6Hx3R0iNdLqT5g0tew
Message-ID: <CAMB+xka2uJqf3E69r7XhB0LEkT0bWy4XCW2rCztTST9JX+KYaA@mail.gmail.com>
Subject: Re: [PATCH v9 02/11] dt-bindings: iio: adc: hx711: add VSUP supply property
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, 
	Andy Shevchenko <andy@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:39=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Tue, 19 May 2026 03:32:18 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > Document the optional VSUP supply used by the HX711 on-chip regulator.
> >
> > Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> See my reply to v8 around dvdd needing (I think) to be in this patch
> for the hx711 not later in the series.
>
> > ---
> > No change from v8. Already applied to iio.git testing branch.
> >  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml =
b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > index 1ea60dff98d5..a8eaa1f18de5 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> > @@ -33,6 +33,10 @@ properties:
> >      description:
> >        Analog supply voltage (AVDD).
> >
> > +  vsup-supply:
> > +    description:
> > +      Supply voltage for the on-chip regulator (VSUP).
> > +
> >    clock-frequency:
> >      description:
> >        Controls the SCK bit-bang timing. The value is used to derive th=
e
>
Acknowledged, and sorry for not acting on this in v9. In v10,
I will add dvdd-supply in patch 02/11 alongside vsup-supply with a
description that makes clear it is the digital input supply of the
HX711 (and not just a bypass capacitor point).

The description will read something like:

   dvdd-supply:
     description:
       Digital supply voltage (DVDD). On the HX711 DVDD is a board-
       supplied digital rail, distinct from VSUP; they may be tied to
       the same supply or driven separately.
