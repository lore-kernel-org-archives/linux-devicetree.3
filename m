Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44703B9D97
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281830; cv=pass; b=EAE5kWPW0/8BoRqgyYPkA3sWXfc5F2hG/xs161xAC7JIU++QKYgXQEGZg/T4qR33CPnhFS7h6usflDAAWhF4Z3kiJTliN22cRtznUqS1RS4Ukq8nSnmX5p5hIuwFD3DZGBWvCA1IIwz+X2FLOojrDUrltae9+EnyRrxM3qB1/VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281830; c=relaxed/simple;
	bh=7irbY+9rOd+NW/fVb9Tr8rkZ1zlhu5ctJUZovL+hxRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKYg7Tgb3Gh3mskL833szvB2cpkn3mfGIb8H0tW4Ov89xKZ+IAM2jvjZximoX3rjFHl1gTTblO9JhzvnCTJzXDPvAzAjItqujso1bEUEjeCIQ+bw/yMKPU6VpbY9bo1BJX/GnNKGNJWachFQsP42FMb9bma91ex53f3dzE4+rxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ0RPdAc; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ0RPdAc"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38bf47a6f02so2599431fa.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774281827; cv=none;
        d=google.com; s=arc-20240605;
        b=ZE9OWFzvXOk9pzpVcUigcK1YoyHWmlzC1mur1+sQcWKwsYvAciVLbSzVhHwNlHxZoP
         1KLYuhcSi+DFT2moax4cvvR7Yi1Tky4sxLY0u2baWRL/vac69IYNkPG0fZCyq8AX0blS
         BB/fcsBUSiUyuYC79TFsu7AzlNXJWNJ6f/AorHu/w8hr1b5PMeqF48RV7i6IAC/silF3
         BYCz0j4K5TGG2JG1tL/Qp6YcKhucPyRtHDx46mvzIuiMAHZiX2bnIe+etN2H3ypQ9vyW
         hgb3t0SKGZP1MbxjWPIt3rkBmDJX7zBHg+01S08VK2sOVxxp+WflB64t3yN1YJecwWlC
         vqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        fh=6ubU7SxfcVkSVpqgIprsglx1kY5TwTRmQNJsdUUQyPY=;
        b=TvUMWvSAeC0CvOBNYVMa08OnePnhQbDGMqzN5BB9tPCX6Q4PhxVAW/eXL4u1n0O40D
         C79IxGs+iEckl4EQ5SWYvwqHZHia1oPydLQacENY1DnzHag7t4V9phPS5Rkr+0TLzeVs
         uczXXTmjLxyPLKOExEQLvuOvAdP381JpgSEYccpp67QGUOv04/0Xn8wLj+wUotIUWbKm
         FoUfg08bUhmDrygUndPI6PNXm7X6nNbhY6F3reSZiKFuzrO5+pf0Kg1crT3kf64utCLq
         9Bo/wihK2kaofMLja1gxd3dqxbgtelCRk2N63VuFKoYP6cdkeprTPnd9nb645tkOVKKs
         DVdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774281827; x=1774886627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        b=dQ0RPdAc4HqNpJRB3XynuNYWgoZeu0Ap14wRj5yu4dwVgF7R9aX4ua29+6lkLc8q4N
         S77vD9WO3qBDEj5xL48frva8HFePhuCPCyLE4DnSMR6WE3X9YIPRxqyQescuCqIl/U4H
         VmR1m05fYUCdkP9NRvujM4NKQ3gwkNMeJElFrtzkUBTlbXMcwYF4odew5j8E8hdma2WL
         celEbxT1bvfOboy34GuqwFkNss/LJnYh8i9gNBS3VgNpiMKg/7El8bzDPEnMwJiFEkU4
         m3rtb+x7reV1GG2d4FJPBbCfO1mzROLQfiS/y9iUSvKQR4ufvreM79JF+Xy4F7XQeyFb
         USOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281827; x=1774886627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9trgAufF2igj2vmokDZA9CQWTVpioAWY1V9rx3C8FU=;
        b=rqQFWGMIYWSocS7atxA+MXBnGd46ZURS3KOxgt7SRiQUlOtg9gxEDR7OJdxAUxGG+g
         z/rns4co/61QrJi+xuLN6Nz1tAAaB6vIsKy7ddBJstZAIFXLnzDcyh6EZuNoMOX1jBNZ
         pzrQ33nisqaXGIVj6wX+7d8PYDO5wXy2LoVYNjY+m9+VaW7gvnCeN3dL9RkbCniIil6U
         fKzjxpY8q905zhjNOX6vZ1xoGvUs0GeZQrm3O6NtN26wftf8iGtEFRRei+ja7ZZ9FIQk
         1HEZQzvOQmCX4M6X+FlL67sqwxbXNGHkCDW7co3lPUjCItUo4K16JZTN79JFqLM+UDwu
         btPw==
X-Forwarded-Encrypted: i=1; AJvYcCVO8JExM/LcVimfcsJSWouFk2epB1E1JBLgU6jpYm4sVdbNbXhUuCdU+S+Y1eYMwlNqaeTQFq1R1YJz@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOai7yWKWiBrOj95E1Xp2wHvmibu1/bwwVGZ/kshj0RtlSZIj
	f8dYtgz1xG5Gi9/lZmXF+8V8eE/yu0/fv+tZvt6XmbIipSxp4G41GnvuiWF7ifaiJUoWQ0Osig0
	xJpTFM+ig2JM2xjlgEP7Dov1kn4UERCI=
X-Gm-Gg: ATEYQzwVRERikQn5EygoNX1Ui7IvuZTtxMLvR4iHlBLikSZ0Sazf2+7srMviMHPBkI8
	WMfz+Hw8H9JBZo46eJM2cPKXCVRuysTsu49USp1nQao/fnVX1ELEXg/DxMv4NGcrdgMSF6DKJqt
	ik7479nI7i/wftZBL6v41Y29mBHNyjUrSbnbPeEUNSLUtjXhge3s4Km/jzMlNgpbfbwUj6O1Zpy
	FtwOrKcR3BV9LPRlTuZkJT6yBEKZKAX1Dn3+At5uAEE3U+GJBpHfElV4HCeILfZvo5I59fpD/mO
	BYu4dfASoYCcc1G/R8KFbNb8+Ayz/pqSpx0QCI4Z2r2RNiBeM2vpf6kgYg27a6fHLJlT
X-Received: by 2002:a05:6512:6181:b0:5a2:889e:b20a with SMTP id
 2adb3069b0e04-5a2889eb350mr4104674e87.44.1774281826562; Mon, 23 Mar 2026
 09:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
 <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com> <20260323-laughing-pumpkin-oarfish-99fafb@quoll>
 <CALHNRZ_2tUuiBBuH-QGi8VQbZSVhQg2KGd-dQVJMq+HKiGwpmg@mail.gmail.com>
 <2228bad7-b356-4274-a7b9-9065c9e35e9d@kernel.org> <70adc767-cf01-4498-b758-f221f0c81f11@kernel.org>
In-Reply-To: <70adc767-cf01-4498-b758-f221f0c81f11@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 23 Mar 2026 11:03:34 -0500
X-Gm-Features: AaiRm53L5Q4rOWiROqkyJg0La9E6e4uOYoPppMT9VXimIJsFCPa-A-du26CGdOk
Message-ID: <CALHNRZ8+sRm5VnBOtsOCp1t0Pih_tPYCZB1=wu4qBFSXdtGg1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 10:00, Krzysztof Kozlowski wrote:
> > On 23/03/2026 09:39, Aaron Kling wrote:
> >> On Mon, Mar 23, 2026 at 2:51=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>
> >>> On Sun, Mar 22, 2026 at 09:05:18PM -0500, Aaron Kling wrote:
> >>>> Namely:
> >>>> * Odin 2
> >>>> * Odin 2 Mini
> >>>> * Odin 2 Portal
> >>>> * Thor
> >>>>
> >>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
> >>>>  1 file changed, 9 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Docum=
entation/devicetree/bindings/arm/qcom.yaml
> >>>> index d054a8f5632d853509b7cd37f07f02473cf6bf71..ee68963c30eae10fd3b3=
a5e21bda63ab941893fa 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -1075,6 +1075,15 @@ properties:
> >>>>            - const: qcom,qcs8550
> >>>>            - const: qcom,sm8550
> >>>>
> >>>> +      - items:
> >>>> +          - enum:
> >>>> +              - ayntec,odin2
> >>>> +              - ayntec,odin2mini
> >>>> +              - ayntec,odin2portal
> >>>> +              - ayntec,thor
> >>>
> >>> I already commented on vendor prefix patch, that you incorrectly move=
d
> >>> it out from this set. This only stalls your patchsets, because none o=
f
> >>> the trees will have it thus none will pass any checks.
> >>
> >> You mean the checks that passed just fine on v2? This is documented in
> >> the cover letter, which apparently no one ever reads so I wonder why
> >> we even write them; and listed as a dep, which said checks pick up
> >> just fine.
> >
> > Checks will not be fine, imagine this scenario: Bjorn will pick up this
> > patchset and next will have failures, because there is no vendor prefix
> > documented in the next.
>
> There are also more subtle problems here.
>
> Because you included it as b4 deps, multiple maintainers might pull the
> same patchset if they are not careful and do not notice the pull of
> dependency. If that happens, you achieved nothing by decoupling it and
> it is the same as it was included in every patchset.
>
> I, for example, do not take patches with dependencies, so that would be
> a blocker, so again you achieved nothing. I don't know about Bjorn, thoug=
h.
>
> OTOH, since you have a b4 dep here and bot checks supposedly pass,
> maintainer might just pull this patchset (without dependency in cherry
> pick mode of b4) and not notice the failures.
>
> >
> >>
> >> As I have mentioned multiple times, the vendor patch is separate
> >
> > And as I answered to you already twice...
> >
> >> because I have multiple open series that depend on the vendor and
> >> there's no telling which one will be picked up first.
> >
> > ...no one will pick up vendor prefix thus your goal will not be
> > achieved. Nothing in vendor prefix patch explains how should take it to
> > solve it. People do not take random patches, so if you wanted Rob to
> > take it, you should have been explicit.

You told me on multiple tegra series to split things and list merge
dependencies in the cover letter. I have listed in this cover letter
that the vendor patch must be merged before anything from this series
is picked up. Why is this any different from what you kept telling me
before? Whichever binding patch gets cleared for merge first will
trigger the dependency of merging the vendor patch. And as long as a
message is generated on that patch that it has been picked up, other
series with that dependency would not cause a duplicate.

What would the alternative be? Say the vendor patch gets added to this
series. Then I would have a driver series that would have to list this
as a b4 dep for checks to continue to pass. Making a dt series that is
otherwise unrelated a requirement for that driver to be merged. That
seems even worse. Or much worse, I would be unable to submit such
drivers at all until this has been picked up.

Aaron
