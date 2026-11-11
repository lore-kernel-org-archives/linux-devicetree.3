Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794384251;
	b=2xH636pUsej+8JtF+foirubSr1R0L+IT966a4eeCedjLSOOliKQ3o+4MDUxgSgVI6gRR
	 N0lDDscroHrbAg8WylhZx7dRIBbI48NxxV92mrAZcVLhAFbMeKQKvyNS+Y04ASDDPxlA9
	 6pXW3nj4Uo0lT5lpgZJevL95W5C6C7ss8iP+pspSUjB/TSCTTjGO8oJmwddjNrX/S3B6W
	 Syn3QX+5i+c/19/8OvxAJNvwg43OQha5ZYocU/efctHjZzvmbsQMnvXJDWP8F1EGBB3ST
	 49STqt1NtnT/ds8tVsHhSNHvsAneLGTKjV0VfaJv46FwfnAn/h2azEwbSl6nXhuhmWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
	b=Cu4Juml9wZ+LBWJXp6bTAKnaa0Mjh95pwuOEoDpb7IRVj0isHg28EaroU2VUjs3oX5LX
	 BCLHB1GSg1ObpU+xtXyJErutBJPmevOo3vLlmrhU994z15gsDdG+RWpaful6cLQ5COFyt
	 4dW4IbX5JsFg7iGZTtw3mVxS9eAns1/WYiP6cHKKjLDz6ds0Bx/ZEs3cBgEKBwxjccqN+
	 9rdr8mjkJBYRGQ9mt8MMb7V+btjv8w6SjxjRuoWUVpJmY4vh9BAa6ueUioCOD8RuwyFav
	 64M0sJEKJZm7MxpcYVOm5fxq7BBx8qqOoT64Vmql5AQCkYjv0AvKiynb3LMZ3Nbx3qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6837606A321
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6837606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzpLQfiw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4921625eec.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 00:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794384250; cv=none;
        d=google.com; s=arc-20260327;
        b=UeFPT7BfZs2mvMtNkgKm5orH6C5dFqQsDrywke5rFstql5a80A2OEECkwHOSFfi6Kr
         AzotJa8ApjLy5d+nHd+Xvb+yBmtgJ58BaN3T2++YL7LFBt+CiXmPJxHDQi6iM+CGpxSL
         T9qJZyO5S6s9Qd0tlOzSlGITQmsopT0GEiBNmrOgcEVHEN4CmInPnkamFdcglJYTw59+
         sfuR+Cqcs8sAgnsvg7B3cMVBFYCGBD0TMc76tzGZudjJZ7vd9ZDv9Sefe7S0uOZ19JzK
         lxjJv6+92r5hsekjEAO8wxFHi8qqF6ZokQmAT/dC+SFP9e/flx6fnyHwdAdUdf3slOPu
         zRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        fh=+BKICVCHwkCLB6WnfJc+DmIkbxcDDpR9CUF/eHVc7gg=;
        b=Y+H6bZEXq6DgkBI8MVHchoPcsb/Z7/AmcWMd/G01uNkeH7L2E7psdj27dqjnwg6voI
         +n2aEDGTA8tAx578hSNlOE9NtQI866aqIM1i9Bs50IR7rOsxw4gqO53BBReMNdFhgBFb
         jsyMIFfKQQtA8oLBEn6owvncGxPjQgFNLKAPTxGaw8mCcPLjXL+qfdqdHR2eGiqikQhg
         HNfdrHfyXxHOBVrSqBJyYcTxoFdjYtKxkhh7S8MZVCLBObTfqrllBhfpwg/DEWOm1Nk3
         A1BsrqYPUyvaoUU4j98C8vvaUTrs3sLhenV8MqSRkarr3/1XkWJMrinyFFbaJd6+qjzF
         X59w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794384250; x=1794989050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=kzpLQfiwu0lF3hZg9xt82iPrgOdaOSV+6MVvCpKSxyopwjMFtTqsiojJJNFe72Iu9w
         S0FlRWDuF4L0+fOBKFDZUYNij3m2zmKyuxxdhi56DKV3i1z9s9+Ff0XcnWuvkiMUOSkp
         OOEV7WDrtpUE5dhjSELEiWfTns7p9uU+uFD3cndCvIMlMqfl76EhWstj8n/909tB4nPN
         YBqKSQ72S9FJAjQXpfBZyASR99LDe+xmnBxCHLNVyGoSyu9E/YCw7s0loJKC1Dlkkiut
         o0OzMR1VNT76qoDQLMkJeXMITaRo0JpCbbmSkR28fFObutvBytpPPfle58m2dri3z9Sk
         nRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384250; x=1794989050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e02CISDat2rnFU5auy1swbmNQ1NAggjZWxzVKQlZOt0=;
        b=UkR5NuMFpJ1XwhEJB1LgCKTer9cyZYJ+XtXi4LKU8zk66Ax+eRM1TZ+U6Za+H3XXcV
         CZPCm2HawMRSV4HDVi9Vg1LmQNdYxSrsXec0gdml88UICdXSZ3hPxva8xFwrfP0nYUJM
         rhKy1u6UbynEAPR2AqqcAFqp+QjOowVAbTm5JoO4g/yJhAOMuXzp5bQ4cYwgVZq9yXRz
         RJrzdLrr3q8JhjsSZh4sLjokony8iOqS4CctWn5d8JkL92VXaW0cYse4c1oXMZD8yI+n
         J95YH3jcKTqMSsqE2A8rx/bPmwe9kAmIBYJEbrBaXHBRJ+7Ni4hXdzNAi9ZWM46CYplD
         uXHA==
X-Forwarded-Encrypted: i=1; AL+hErEtALJQa9qqNru52pQHb4zO4i+ivs2W/l6qCTgaU31NNX8ILxImXb8dsrLprJDg+mRz6O1303FeTJGe@vger.kernel.org
X-Gm-Message-State: APuU4Z+h/56BOKj/r7xhBy0NB1FitHRI+oEVXtYu2iLAGHs1/VT82/c6
	/W4VKs1OCLu4kL0IYvw7q4NeD/En5eEN1y1kdhjdGAhnl8JY2n3UoCebaemnm0EyO8L9u9wY9Kj
	G1V3OtjfNazQaL5FgnCBPHt9T+eyBWNA=
X-Gm-Gg: AYBFou3yDpj/fetZlUD2aQ9y72cEvAQNfmrF3XSpIOknZXyw1hLioZYRBJ6AyKO32t4
	arutarlwmv8lL4JrIaNQ6HDpM9FEsCiPOb5U/hisGgt06jNGkwxXlm0//UXMbJ5oUo2sF8rWS7w
	Eqk7H0VKnurC2dEZaFaabssaDYjUhToJWhuOxaBn3g9hpV48g8U/QL8s+etWNRx3t9MMeypWeER
	8hU66gkYaz51i4xccq2dMRlUlfs9BJKMLAnxBHZDfKibgJoVWDnPyhKC6FlumPIh0dZ+/XUyoih
	fXergQy1nFxGwOBqyjNAVHuR7G5IBFM/4Inevfif5/yeO/5w0j8KztYDUf6CABEYT30EygP7um7
	uKj7omRdNBlntIJzyZTrzvMpPh2mn8esFphwu5eZURCpeQVHcpXjDG6s7H+d0Wc9Gw9qKdk6LDD
	jbunsgA9N+hDZabFTZxElzwxxqd6m85Q==
X-Received: by 2002:a05:7300:561c:b0:36e:2626:4ace with SMTP id
 5a478bee46e88-3768366a866mr2441050eec.5.1794384249564; Wed, 11 Nov 2026
 00:04:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108151348.204182-1-clamor95@gmail.com> <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
In-Reply-To: <8f84154c-0296-4c82-a887-de76558df94d@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 11 Nov 2026 10:03:57 +0200
X-Gm-Features: AclHuK8vaEcJ7SqWAmNPakfkNoxiPosAOmNdZbgEthELf7kS-7VilDYNl0DIvFg
Message-ID: <CAPVz0n1LmYHJts91P4OU3WFiUBwcU6sA7Z9McOdLK6cLu6PzvQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 10 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
3 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Nov 08, 2026 at 05:13:45PM +0200, Svyatoslav Ryhel wrote:
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Patch 1 of the series requires this patch:
> > ("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
> > https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/
>
> This doesn't apply against current code, please check and resend.

It requires commit converting max8907 schema from text to yaml to be
applied first. I assume you may just ack schema adjustment and it will
be picked by Lee, but that is up to you to decide.
