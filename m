Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54423F12CC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 23:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009093; cv=pass; b=LkIblO/E9CYo+/ofidIyqdYUvHYVnPsqQgACqzkuNG5dyuP0I4L16Buy6HuKXaOlZGppv4kKP6bRm07i+HySlviqiammu1LhY7ukvHS+xEDQDAYC/wXs8W114azBFsknoS+t/+5K08O8TuO1rOvEva9vpejlJH7G0YvZP2RlwA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009093; c=relaxed/simple;
	bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+23zwFjodDQLf391O/EUYf5S1RpZgCP9TnnJ6eHT8znaCejLaO27VOd+pYHy+6kIU7E9hSI/OxwFdPlCjEm1tjDGqWIKp4GB247HNuxzAc4P3+jebQ0bRCrz59kTp2eu1+tiumJl7Gf3iFQyuPtUvwrk+9xcFykH4yoDFB4rnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqYPC+Uw; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqYPC+Uw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so205933a12.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009090; cv=none;
        d=google.com; s=arc-20260327;
        b=CeVtMJB2xYaWFikK18akwiBA653erPKY23wLA0g/3opT7dZnlfNYxNSPMih5fu4pVb
         t+3denL7G9fmwRBE1OfsM8dm5P6WsmXMTdjZbS29x6OEy61oVJQtpFLNCCHIFtlTZuYy
         UouPByx91NZnlMpxz8BDdk3Gojp46/4MkjcWwKIHgvnuLRqTUrRBo33wdq7EJ68nX0lD
         BV96fR2ee5ZZ+xHllb+1cLUUImIA9DAYLbYJO92FY7DoEiCWaJ81xLHbJeFeqrHpgYiy
         NTE9QHPLOidlKEfqGveuJFdjJf9k8hu0ZFpTEC7VNmwX2+sswUZPxFGpkKPIDOYP/L75
         fiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        fh=scMZS6s8T8MJrwe2PE/cEWaN2ABRj/7UnxMo5V01JwU=;
        b=cZF57wn+21GSqxsdH6YzDFrqXPF6lkTb9/YxutJfRkrPeurNraYKF3oCZnFBoSTf4F
         nEkFNbf/oWtyzAwJ+q36g5oHO+g20qDRIXyNTFVn2njanOe1tWgnbyjKEe78gFttsTUY
         Psn22IaBd64ngnZJLOt250dHRi/KHCLOb5TPK85QApkBW1eOuQxIfdD90lPefBBRrIim
         cnT9F+QspCVvL9SEEDG2nkG320ryFSlQhK68osKkXyYZOCMEG6I9t88cPOEhGpXuvTPZ
         Jprs1cLAgdeyY8ZkSWzFHRa40fe7W0NJ+dBoKGW+pzjnuHJUNcqYSMQLQ4RXoRRER0TM
         xajA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009090; x=1787613890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=GqYPC+UwlRI4t9fUjSYh4v/Rxk5pUmwhP7wPggqGw99MSgWfWraeP0VvoBiQmm6inf
         egu3uZ5zySjeD44NEvvoE2kfnVpj4HRo7atxtvL9QsK4ZtsyVSVL7YWgs6qUD5rTGWYE
         PnaaL3JxJ0Ho8iZw4stXgcE2BXWcgik/2kRC+8jDPYhJPtiq0+OhjrGNDLl/6lCBnJfE
         7eILRnuD+7b0cgiVeXmFMgSPlme482UreG9//fcgRJPXIXh2Til5v4U48EcV3WcXZobd
         tFfrm8AzO8fWL6uqhnV6l405qBfq96mAnJXPPv4fpMa2GWDqNztulLw6YRVXyzUCzJAp
         6lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009090; x=1787613890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIYXnjCAjNr4smxO9uOZzqY0HcNX6do2IlpDo8+jIR4=;
        b=QL6VsRlbmhpz1khr4k6Lio/8z2tEMfRjMZmj1ex6xOExumFjZAlc9cGrm3gvt93e4a
         Cqr9WmsGfk2h1AFilP0Rfn80igiAPkkLEYSBK+oZ1//igfHqWT9umG90V7wi2VzD2rJ8
         BQDnqyh9ZMylCIla+9rbpke5lm9xjrHzM/q2y+Fg5ncgYoFKsfa680gGeHUYmeYlWDyN
         9hiLUsFOpxQ5+diXXfbemjnWJdevIzCSI6QOs44hJ8qOT+6PEVqL5Cg022Bvh9y8dWYb
         vxWzVw0TG61kaSc+0CulySZHTUtMqAVymrm3yO/+RkGq0vJSg7GaKH/UZ32peZZTOuY7
         Z8nA==
X-Forwarded-Encrypted: i=1; AHgh+Rq08Vkw07BpEiTl3OFJzkKVuaObxkTH4blIpnDb/hpesman9yH1mM9CbTk9Ut+szjODajykYpbH+ViQ@vger.kernel.org
X-Gm-Message-State: AOJu0YytpcCGp5p0s+ZxQl9xl9D/rZYdeRPBXItohC1HN6/Uq/DwzCD0
	qoBMTDtVBdr/x2AH6bAAdw5u1S116xg6GYKUSadRXoOmLLS21hfCnLHfpYPSSptX+RmT6/eH9GB
	jAGV0qic5zyDQhQJzfns4utCWaEI+BRt4jQ==
X-Gm-Gg: AR+sD11OAm6P8pqRekhMkWqpA0sf/bL9Qx9Myhqf+Se3XFpRaSvp+K3bXVz9JFyJStR
	lEdZViiVARBNNDxhdt1Sjna5L4oMSb+8QdceKgiHf++OS29Dt3vOBfv06yDOZaoeg0RBewjQ6+q
	RoLkg0pWn+RLNP7/6zRRpJJMUTJykspbdzApRV/gwyk4/Y+bHcRWIQmJEpaEqa6/btA8AxjbGRi
	40wI4PYsnz0oS0YxCwVa6WCa21MGmY3tTnp7u2juhq3HNe8LjJPSUXV75pRnqpXhqpmgTA0vJhm
	a+usg9YbDXvMwjkMET96JUoJIya5GTa1h/fk7W3hWiodXiIpH2DyM2Q=
X-Received: by 2002:a17:907:9403:b0:c1c:4ae9:b935 with SMTP id
 a640c23a62f3a-c212a22e029mr832073766b.3.1787009089753; Mon, 17 Aug 2026
 16:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-4-69ac5f92df45@gmail.com> <20260817215828.978C41F000E9@smtp.kernel.org>
In-Reply-To: <20260817215828.978C41F000E9@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:54:38 +0530
X-Gm-Features: AcwNN1WTyBaZvgcQdpeEh6FbkgnwyFmOSVf8hYf16WKHI_bRxJfpI64Z7g1mdQU
Message-ID: <CAOWyW_4GF6iCzZ6VMbrPtn+gkgQe3tZ0U+WP4S1vJDsGxMYPpg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, dmaengine@vger.kernel.org, olteanv@gmail.com, 
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, vkoul@kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The custom vendor-specific property `mentor,ram-bits` is missing =
a type definition reference (`$ref`), which will cause device tree schema v=
alidation to fail.
anything that ends with bits is already defined so no need for $ref,
there would be warning if $ref for this is added
