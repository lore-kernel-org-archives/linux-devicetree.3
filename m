Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5E29408
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 05:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795641; cv=pass; b=SdUnKnbn2u80Q7ZsmVCOqEy53juQnrZg9ACaOEZVt+JgBpqSMKHtXwY9Shk0dqOEJ5SMaYAKRIXe7fYaC6goxLjC1uTCV7Mxy3ADlCN4Wg+vsslz2aW08Z2OuwGyQ2IQrcbeZa8uv4D030/OHyKwx6QOFI/m3D+0FU8SM2HNz2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795641; c=relaxed/simple;
	bh=7Ym68WkUnxb5YSpZaHGF4WPXNzm2GnFyeCYlwumjXfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlLwwU6aQJMGpX1QUrqqA8YYczfP222PD/XOhVh12UFKK2+LkTntPNTLzw+wdZDc5RpA2AxONn7JBHtAyPJvY8A7ZQm6K5a3iovAuaTDmoVsqfopau5l54oZggJykKPGsOYFEJeOkYSen+e+4NodTdDN0s3XcwBJ2JNXfUnsz2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=RnUOROrD; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="RnUOROrD"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab19127so1567823d50.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 22:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789795638; cv=none;
        d=google.com; s=arc-20260327;
        b=UknA39UTsY8Zk5FMIUMYhqBKZ09f1EQcWuGq+2MiDRzNSPeUHuMgTYGaNxrHJPVePm
         oHX3Vou3hdTZE7TOh+CbrGWAnGoDJxFncnYTnBseZCqKFJ5voDo+2X4RNEitvLBKsZtb
         zwkYSMCWGlGC72pURqdeZSijsCbMHb9ErpK3xyaewaQzwQZUpjLeW9dVJNomX+Xh6E5C
         kvb4PCtNgqUca+JDXV1esQizaRZmeBQEdeVJOKpSmevIs+qR7OQ+7+Ae2qlXAXp/JSZe
         0i7cDCjyg6BOcPG52HqNwuw+sOonOCfjZfJUIzcX/L70s2dhzpliYkk6s/mE3bKr44hs
         wZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        fh=szIh8LcOLCOIOggh08f7iHERNAlH7oVfTYOBHeOQDkc=;
        b=fMeB4Q5h4VJLUJqcf9cbi+nawmhHZBCME4bIAc/KtRxJmeiqmRDVrsrQFbP24Ts1Uy
         Q/8+xg4NEuYqeBo8EGVtw3SJkF6AVYjVP99kT6Wlkj9LlMfPeMGezCF2R+Ii9bBdMtrg
         Mr6GuxhFcXGaQeBsBeaLFB+ubJ1Ege1seVFFjSAG6mXx2NPdBiPRJJ3ZjASXIqq8PLuG
         Woov5FSABDngJbawx9/9bcscJ7aY1lG8rH52DjXzWWhXhLoYM4zFWFX/Fm2zqrRHDmAO
         qnQhvcPqShJLY8nwmI5mCP9RE/b/U/vJYlDRijG8aAtHfpf9MIjlDvmSm7vGE9OvcsQv
         hj6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789795638; x=1790400438; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        b=RnUOROrDa+zPmljAa6dw9uJqlttEMDMNjR9jWoryE6aOgVd8NGds0O+yj0ryyjPnO6
         DV+BC9jRaaAI3rX9dCZmygBzjRYj0h9c7dOsR7L9OklcxWCu6VQuz5Spzq5bkA1za/hx
         1bCffeeBCt/QrXBmo1W28e2vF+ARn/b1T/CCFFgnfGOq+tPZYY1PHMdmZCprry/Qs+Lm
         U2ymSTYapAwabL3MoxdCU59bgTkZ/D4I8gBwds388Ki0SfrgRbSylujJb5gVZ69sE1Gv
         SE0L2AmbY4oI//OlBn42svT78c6E9kKtqC5/4fBWt5iYh0jPheXsob11OdjcAGtzbL7S
         KFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795638; x=1790400438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fsOGbbrKrxDZ019/NpDN7Ost5CQsExzoQfoaJGWhuYw=;
        b=CuQ+XCyqtTpznbK2ug/jcOErl8Kk2WnGI1HiB3hRpadC8kP7881WR8ze/drlpcgZVx
         WmY59nj+cDQGXjpfZQFVfK+vPB31J1qk60TOxArJTwxiwdRa3zSih+F6+o9jX/EqR4Ya
         ECYk2JDtVSs5u++BUjqYZ1/qo++tT5Df1zduffLQOdTdKSj+CtT+RCvkCXefmpN5HGfo
         nhoQMCUf3smbwws9keNXX/0J5JsBxnqNGl0CYH2jwUHhihQx3Ha9bF6Lr+mD7znWnUOA
         JzZeoL0mWi/xx6hN0KCFa1sn7D5yTsEFrx7SneepPNmViYxuM4Bvlo5BjRlGxLBxmQbs
         OHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9s60+U+h1RvePGyPHAlii0JO5CC4S6X9sdTM6foboau2b2qEIJ1AIWnY8v5i7OPiDLxbfOQzUBp2f@vger.kernel.org
X-Gm-Message-State: AFuF++nVYE/a2oOruqWPCyRAs4C6/DDbuHHX1td3r/ze9f0uH5syJFMH
	zRBmzQ9FSSNQXdnSfKcpLUSeSBldlifojxLu7rSxH83r00kn9TZu9lo5EcWhtV7L8VeihegAkTO
	7o04FdK8dzihECLYskBiURhZRh8LnJ14IXRejRuGpYA==
X-Gm-Gg: AYBFou2oh2oHSRxk6yA8l01M5JNCnzwWWXmSPajymlxvnGoyxYHg5a5FDVNol/wbBf7
	P817n1jbX01kytkbN5QZ8qnOr0Y0wW/RREOEI146XpslO+CLSWixTeyKh0X+C123pJ8SK2fDkAF
	CagdtYKaDShdEFdSt7MXkV01DW41GP53ne1NJxcg+o33NXT4ZaKdF6Klw3CCRbHaOZbt4b6bodm
	hStpR44nYS1u7OTOKtvO7ueJDx36hnB9b/u9IuT069WpDeYo6mmJf/EdwyZlzZ+xKzitm2R0XkB
	Ud2tboB3Y02LRlIqrxs5rwGlmJYDrFUVIXaP8uxlcTKq+nBLeJtiIWfPYjKrNIm2IbJAb2Nl8QR
	EI+qyKuqNyHHtx31AQiPTU4c=
X-Received: by 2002:a53:ac90:0:b0:671:3add:3af8 with SMTP id
 956f58d0204a3-6717fc61354mr1406656d50.3.1789795638457; Fri, 18 Sep 2026
 22:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918182317.143223-1-karl@asseily.com> <20260918182317.143223-4-karl@asseily.com>
 <20260918183931.CE0831F000FF@smtp.kernel.org>
In-Reply-To: <20260918183931.CE0831F000FF@smtp.kernel.org>
From: Karl Asseily <karl@asseily.com>
Date: Sat, 19 Sep 2026 08:27:07 +0300
X-Gm-Features: AcwNN1U8eqVCHpfs6q-7BtlpiMzLJGyEq1TzZdYhtWj64BwB1WOouCpFGOqiras
Message-ID: <CA+gvwbqrav5C9e=9Jx1i31nrEZGDko73tAAhGzzexeRa1f72LQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> Does this copy include the ALSA TLV header along with the coefficient
> payload?

No.  snd_soc_bytes_tlv_callback() in sound/soc/soc-ops.c passes the
pointer through unchanged:

unsigned int count = size < params->max ? size : params->max;
...
ret = params->put(kcontrol, tlv, count);

There is no &tlv[2] and no size adjustment, so the driver receives the
control payload and nothing else.  The payload format for this control is
raw coefficients with no type/length header, which is what wm_adsp does
too; SOF embeds its own header, so both conventions exist in tree.

The hazard you describe is real, though, and I have met it.  A userspace
tool of mine did prepend an 8-byte header once.  Because the callback
clamps count to params->max, the driver still saw exactly 384 bytes, the
size check passed, and the two header words were loaded as taps - one
non-zero tap in 128, about -33 dB, found only from i2c tracepoints.

The driver cannot defend against that: the clamp means the true size never
reaches .put, so a header-bearing write is indistinguishable from a
correct one.  I will document the payload format at the control definition
so the contract is stated rather than implied.

> [Severity: Low]
> should this use a named initializer

Answered on v3.  sound/soc/codecs carries 202 i2c_device_id tables and 136
of their entries use the positional form, so it is the prevailing style
rather than a deviation.  No change.
