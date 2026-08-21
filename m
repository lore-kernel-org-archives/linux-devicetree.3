Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83733B97D
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319590; cv=pass; b=L+Nxusmtt9KS+UllTXwtw7ukcpDpFrKGwHCfj/hl5GqtHlbG3yN3IUNB+3z1vPsexHhTlj0kVsA5mvJfbAIN2f68zPXmg0RnN9kEp0OSqfNhtVCp9MkTC0IVkz3LxJbm+YK5e+n15DZ7T2VB89l4fUE/PkUBnYE3zDKaRHJVu7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319590; c=relaxed/simple;
	bh=t+HdcbZ+oYnxqa233Sx9hBRsHHzyCOKwYq7ffek24z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qtf29edslaXMGPBMF0z4SsnhwOJm5H9Z908umxSqMTWadElsCDnIGTZp8/tz5DzcmB0s9iIkTUXxb0HkQ7S+j8Cwbeo5uZnovDiSVs3yB6X/lHqfeueY/uf3YxNQqERHQcB6xVjLisWnfCmztugA4Cn597aTWnBHa3VS2pd3I5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=j1D2Kkqq; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="j1D2Kkqq"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8111c0c7561so15448197b3.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787319587; cv=none;
        d=google.com; s=arc-20260327;
        b=RMB50T074nCqyWqJnX89tvCEn+IhZplF11x75sqg4FJHiJV+op/B+c7vZxfSQCcKuC
         lfgvjfcQ+SQsKRYXs70Sx6yG1wLk4DSpI9P2y2qUnp/0jhiIvfq04EfLh4M+kmzXox1p
         CrECAuUyq8FQE6FMFvxsNu+JD/Rbydrsm8hgjbRAhdthm//vVE2gNUhRjBbilmDHYBAF
         zjdD12Tn08yyr1AkSw2TRWJhOIJ7qZM209911zNQiUQvP0zi3V+foZlLnGRZVLmzpOhH
         s59r9DO7bxjmSFpVw5YOkMjqOV9NqanKXmMl81SMihh6HTBtzueZaonGfwcjOaeBzyl0
         8/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        fh=ciYQFzBU3IXbXz71SwhFPTNKiHmh3FBNsOxxbrPokbs=;
        b=sULGqoF0WQhmRS5243IEPzk7UGq7xkOo6pPC0yGc3OlmNA+0aVSTgERaQXc1wYsFaq
         eg/Gw856n68xLtnhqIsPy7bEDn+ndbBgai6NplHuuyuEnIsytERcaKnj7lsSN3U20TKk
         2LaHk37qryZrNh+ymqNOk/OERTTED2swsnsv80ASYAbHpCq4pmgHux9Sfpr15Sb00UUL
         WxBGMqj0izqZWNB7XLOMZh7OWEWm7tqb2uCFqP/+w4ZnSiiPnrK3/C1JaVUbgdCYxI3Z
         Z0gxvfwT8zsKqUOH31PfIhVde9+nG46evpzqonXjAG9zx4DOMph8Cbgg+Z6du2QpRDpx
         +Q3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787319587; x=1787924387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        b=j1D2KkqqXGfMq7L3EQXv5rbabkUl9ftzBa7kYoDJvP/uDlIJc/x3ZFReyu2oHAdjyM
         PhLDC5ndnRo1hHv8lqkRxzrSNTXX27DTg9DiT3FmOyQk/JUqMLVjCTFlJEFZeMmwRhj9
         sIJIbR/v9Ofd6PfxUUce2fOuoSQ4WURqX14e53XXzmdaLSg6dKGp4mnQdRMpef+CwlWT
         k9ZLlQJBavnc23xS9Q0ctrukjS6gDwssOWqqMD31PY/KO5mhfHP/s2EU0pIztvOu1g4g
         qVmzT/NjcbGJi7o6n2gweGmsnJftaoadHrUDYcZJSOcCup6wPsIPgokQjXMIATk7J0a7
         HtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787319587; x=1787924387;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8fx9EwVxpWHXqzotlrMOOBGlJybxpxQagNiOTJaiuZk=;
        b=Afh94FhAxlkx5yx7YB038ag+KkpUlwqNa4VxwbeAhY4pWtPdl5JLvpKZO+7uP1Saua
         /IFbay71d4tpHuhwqmLwW1WxVJ4qmQ83O2zVx9cAMBCMD+mlRTRYS7e13kd/4408Zlmo
         G280cnXqBFpIOqT651zA7XcuTKhHCI/kRLRRvR0/H0zLiSqIycXH44WaV9SwwJx1YIqm
         MWRnYN6/GBbgN1Nr5L0YhIEVJ8c6nleb8AZwuajXH//XVWc/WDeGp4fHkDVDdw8pQyPk
         SYWSRT+bzesoNCp60OB5y+3mf2a4qalf3QAQ5GBHOfnC5/ztGSibKl6T0Z0xO1HY2zuV
         4QQw==
X-Forwarded-Encrypted: i=1; AHgh+RoZaekIPYcToIfIJTbjLoQCpYgN3qM/fPRxuHVw3QCH29scPDX553MfXI2t86zakq0PngNp5skO2dqL@vger.kernel.org
X-Gm-Message-State: AFuF++n1u8iOA6IcjjAR9srdAxC5mrMtNZ6qepZtdm3DivHCYE5mDfr3
	bSf506hA+re1xkzgp2IKfkOBL1UB1gp65hoH0dSlLq740uNzfSAx7O7TjomhZ6W8GQaFbMxn3pQ
	Uq0iedXCLZZ9teredJsYkx5yJQijNURvTPwInDoOrHA==
X-Gm-Gg: AR+sD11u0Uwl+d5RfSczMIoO1XIr9CjWmoEn4+b8jIFhEaTZON8Dy4+e9An8hcxlQbz
	5Bt+7k4ZqhHZ8vxkgqghazL+alSH0ZOjoY4GiTqBjRKMbHqkZjA8oVrTQr/zXFLx9oaSbHquhmP
	Rs5c9JR5h9/+RPkM1+1oO9Wm5qPYREDTbrRXKJ74Gxw0W00eLHlHx7/9AnwSRTqO0ECeuMJEeng
	z8/MbLkqlBM+Odu4rnx+2Y6RBka5WxCgEVEBUmouQ8Qd+KFmQ1f4w2708sAJ/p8Yo4ralRquNzz
	gMHUBXZzYe7K3LNivzMv0wGhc+rExstqhGfGUJzVGBITJqyoYGcVhCUd07hsy2C7ePGIPouiwuF
	2YfI=
X-Received: by 2002:a05:690c:c61a:b0:809:fd83:a88b with SMTP id
 00721157ae682-849f090e374mr21903827b3.3.1787319587532; Fri, 21 Aug 2026
 06:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821043859.171871-1-karl@asseily.com>
In-Reply-To: <20260821043859.171871-1-karl@asseily.com>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 21 Aug 2026 16:39:36 +0300
X-Gm-Features: AcwNN1XnB_07CHskhgE2GtNqX7QkrB6ibl28GsQFbygwH8zOqjiTmcBWKkGttJQ
Message-ID: <CA+gvwbomK1Vr4nXnFYa-g8PgVCisoQG8fJB_QpSHKU=GVDZa9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: add ESS Technology ES9039Q2M codec driver
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Two problems in the clocking rework, both flagged by the Sashiko review
bot on the devicetree side of this thread and both correct, so please do
not apply the series as it stands.

  - es9039_setup_clocking() calls clk_set_rate() for 256 * FS
    unconditionally. That is above the part's 50 MHz MCLK maximum for
    anything over 192 kHz, and the rate clk_get_rate() returns is not
    re-checked against it.

  - The 128 * FS floor is applied regardless of 64FS mode, which the
    datasheet puts at 64 * FS. Since 128 * 768000 is 98.304 MHz, the
    768 kHz advertised in SNDRV_PCM_RATE_8000_768000 cannot be reached
    at all.

Both are fixed in my tree, along with the mute and DoP controls moving their
shadow state before the I2C write rather than after it. I will hold v3
until the binding has had a review rather than resending straight away.

Karl
