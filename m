Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51B5480DCF
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732822; cv=pass; b=Xam5T22VgpeJFEWZkXYR7TdOR594EGCAprXZbjr/pjyVauQkkdmOtvWGdOjj/fAQVZiPAzmY/7lvZ2yWwAQHwvDbol4SYGco4qaF2+xkT44PM/IKGBaiS+XW+WoRgBUEKfnRASejUpsvWP5iHVEmNtN+Ph7gA78T04gN2iAkoKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732822; c=relaxed/simple;
	bh=8d5fIHcGxiBmuF/sD0uaRboGKU+fIylTceIvjRas9vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkK9f35YkpqiHWGPbGVIhxJ1cR3b2v+74N9UpnzQv21CAmdk06XuJnHTN51VsddU/jX1kyWJILs2+aEbrgO4O/rIAV5pRfjo0x3Ccb2xowGAe+eeIvCu9Pc184xG+XTP7TijfOv0bsO1m0Bueq14c/Dg0Ghz/snkf5tsKHsDbD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyH7j+e2; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyH7j+e2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so11595081fa.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 11:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732819; cv=none;
        d=google.com; s=arc-20260327;
        b=r6Xuh9rL9JsPEVFe5pb1+283h7zYXExXbncZxPNzKg8BxFO9zmafNbqbde3gHxgOaF
         PA7iapMYH+0dYUyZq82FLUXRe5NiXXxiWpX/1BQeWcnL22FixRZ37EV4vCoK15Thz3Oh
         1UDQDbKRoYrzPHtSA6h/NNHt+8G/PI9BG6LUxWyAAeFv/uvXQMbV+Wu0NVC6vHiDRXWj
         F36y8kRjp3MB4F7+svyWQrEh64im90h8x9tnjk617n7jsL6dcM0lcYo6z4zOafoE8gtU
         B/couRoxeMOy46MhUIjUR+zyGaOozrwns0TZMx9XFqXNa82Stvt+ImWp501hNW4vyBjg
         vP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        fh=ttASCDdvMdrvfRSHvYrVFlETOK4FEFEC9AZyACpsfn0=;
        b=SbETA3abCqeKWnO7khxaojkm1giYDDer1DS0f8HZz/ds5A2uVAbWBBbLvmWRCgrEr2
         UkUNrk4X8yFq5sEsY6VpA58EgM2RGPXM37VAkXngpzuVKN8Pm5q5h9jZlAbsLGBFfyyP
         COWOYOvDi8hj2uAMs2jeapA2qVwIx/XytTDDmYj7tqVGFDzRMAsBVj6ZUhifnEE3d9rg
         DjVwjkKQmgpJZ+orW5Xygyw+srD3YWff6GK+pAt+Klv80yoUrLSwB3gwxZyH+qTbc8Ai
         UCff0ulRuVSNnucbmFTuv6RJlOjuxf5AArWMghBJRA0hqmv8CBGwoS8v6lLXCZWyE6cX
         KaPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786732819; x=1787337619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        b=cyH7j+e290opi1nKETwybhOAbfjV8fZeWVYYMOuytD15EK6ELGXY6HdGHx+IrFWLmm
         MhxSsOlPPURztOm3bfIIz2zMGjhKkY/76KR/eMoTHWZP69l6lHc9LpNkfnxfq4YmXN0o
         sUF7DgsmD4w1Ux/xqG4o5QQ5+0sXk40u/+o2PJT10ohhbxZDSZvDhzMB2tUX8kLErDaD
         aCAC88LepO07iW/zwoWl+QeV5/CEo6UHYpJzieA4zsbmJLJ4RNDJ8u9afnJM4qF/rurB
         +vvvfiO9DbrYjzvDN2iV55JGICPmM0Gc9fZVePlEEO5xPdu0685+FtNuCDlEyhOtAUTr
         peGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732819; x=1787337619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ygIoIg7RActdGA1L4Eix3cXFvKMcEifV62JIap/v9w=;
        b=rFHPoCNM3v7CyqRkdfg7o6KIFNa1nLvdcSOn4lr3wlqwUfDB2Ph3pVgkQaSLVUc4Pw
         4LAna2vm4jj3paUQUWdKg4yD8/VHFyvhl55kEWDLQOBGUMLc8MTVc8a+qO718P8YQ/4m
         GSYtTyAo/lwsLiItPkz+UfJ2uaLoJpyQGe8qMgiznPDpM+Pei91zWjwz+Mm8IuuSfpo3
         9OhKzl2SBNNkNeZCaOIdtzMzd5l3sStnkfLodmysouNG6hqG0j2LrXTHZfPTRI7v0HuI
         MipRNlWc/cAMcJyApsVQosjQBb1yCQLcy91ZAE6Ct8PMjDWtzoQqb7O/TRCcYY1ZF/yp
         YaKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoA2PPhuuz13dJiHfaov9po3pb2oIDrtTjidc8Dt1UofMqfGjDtBUkoeLa8ECKYkMyD/9Ya2G4OAAqW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94v0le10zxuBe8fmVsufAcxHz5mdav731l/gZnPB8g/MWItvD
	GiNxK+dU+9endyC7x8kO8TTmFoLiA4go7ll9iU/QBSXGfT2tKoIdZULdBIBhZ9srrBa+GJ//8mK
	lUnINhVEsgdoywqY3TcGOjJTsUu/XZfs=
X-Gm-Gg: AR+sD13eWbkSkN6aRgsMjP7ZnMs+asDSkqlUd/ja/Gaak7RLuRasULsPD1zUXj+Fr6o
	lrQjvcA1o1D+OyBORTcGn7rL+SkfbOp1qpwADlCdg08xlQn9pCxQnwolqm3Tif0UrMfHY0IuONw
	IcTd6iRb20G5iB1QphrvzNVBck/z4wF+iDjliJ76nPOmvGCUAPrzcheeOy7iioyCjBdHqil7QDD
	cUn7OwKCzm7LFZlH5MoxCQw35SB04e18oNmjEM51u8YmzJQJsXabzwglen5mEGZN10k7RRrwGt9
	4TYkhjmy4mXIgmNSAbciR/AAE2JYsUhLO/ri1CXuCW+xxFU1KM5LfNkHwJ7c/biBnaEphjk1diq
	LLcNxA3sLqL/yfvXGzlXb/d4coS9AQ7E=
X-Received: by 2002:a2e:a54f:0:b0:39b:15b4:79ef with SMTP id
 38308e7fff4ca-3a13249d4afmr7736551fa.17.1786732818596; Fri, 14 Aug 2026
 11:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-2-a5a365ba3dc5@gmail.com> <20260813-tuna-of-pastoral-mastery-8ca99c@quoll>
In-Reply-To: <20260813-tuna-of-pastoral-mastery-8ca99c@quoll>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Aug 2026 13:40:07 -0500
X-Gm-Features: AUfX_mzDUb6yCmFQOqV6Z_Inwx5K-nKduw5VZvYKwLZcIntAcJyWm3qdaFbJMHE
Message-ID: <CALHNRZ-jfdscwM86cDK3ya4XC5pKVm5y+ZMcdoDYzowDCmF1MQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Retroid Pocket QCS8550 Devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 4:23=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Aug 08, 2026 at 12:37:56PM -0500, Aaron Kling wrote:
> >     Namely:
> >     * Nova
> >     * RP6
>
> Nova what? This is some cut commit msg.

This is the same structure I used for the matching AYN commit. The
vendor is Retroid Pocket and the product is Nova. It's marketed as the
Retroid Pocket Nova. The vendor is listed in the subject line and I'm
listing the product names in the bullet list.

> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Document=
ation/devicetree/bindings/arm/qcom.yaml
> > index 954be28203017..52ef669d6fe9b 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -1161,6 +1161,13 @@ properties:
> >            - const: qcom,qcs8550
> >            - const: qcom,sm8550
> >
> > +      - items:
> > +          - enum:
> > +              - retroidpocket,nova
> > +              - retroidpocket,rp6
>
> This goes to the existing enum.

Ack.

> > +          - const: qcom,qcs8550
> > +          - const: qcom,sm8550
>
> Best regards,
> Krzysztof
>

Aaron
