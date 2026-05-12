Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3801A1DDC2B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546728; cv=pass; b=uFwm55KhcYjbYm7DPbdn1n9KDZneTGDZ3SpYUc6/bxthcYrFftOwf1JUe03v/ZY6ygaWY3tIYEhVqliNC3ZZsynf7j/+orNPW9tP6RBDajC7ljWAOOTSl4nB6eN3UQRxUNxQuuvrFqu22EQCGzbNQ4evala773fhGqlvAF0R2Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546728; c=relaxed/simple;
	bh=p+Lp/ChaLbnpWalt5P82X5ZMCegH8dNP0eCZPOq4EyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdZVeKW9mDshBx37qDHbhBLrKLAY3/Cf1J/PDV20Q6prMDzkQ5wQCGoT875GRuvGLb+30RdY8wF7hIOVzo7kDaUoAJLDdyzbEetc+rB99VfoQb9Hzfhw1ybVUK8FoaulkIJfLoYXRdA7N5biNBFhZ+R87xpwgijFNKQGSsoU8d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV5CDFzW; arc=pass smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV5CDFzW"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5a746f9c092so7710479e87.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778546725; cv=none;
        d=google.com; s=arc-20240605;
        b=d9PfHoxFyLvYhgTsEnB4JAnolln050aU+77zo7LU/uwrBDDg0koNoQ/7QQSExaNfm/
         smqeIasGxBOZaPGSrvRnPeDyg78KU97Nhl/lzSt44LcVgWrP2Iy6RCyLiMejAMmUKobI
         9ShpjCIor4mTeqNAfn1FzFIeiuMQrSeOAvC+DbJvqBEgcjw4fhwS9I1/38x/IYmwC/ed
         B6USYpXVoak1tmh/N3LevSVkkvKyVl8NdUQeqj8eodHoorbnjd42APyhLRhkhbUz3els
         rZSvU46IpP4M9DRTDJJ607CrievQ0/QBJRHQkXdJ2bI9BNd4mYDx03gPRWjAStwsumPs
         Lk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DjE2es2FiXMGiS6FgHC41XxcRzptayRAkd8ODfpJ5+Y=;
        fh=K962+ufi5OH/+OGuLZr0/zmpgV29fOfNP7rBaWlUBaI=;
        b=IU7Oamlj7Co5mX3Wp+8LCZAMpvR1BjptMzgyqCJ8Tk5EBusXKeNXdCg4JeX3UBO2hN
         XldNoOCp5/KuqB64YbnMy2EQynVn3puHu9edHxziZBDjVRuhKaDHhQ3Nw4oeWAmJTSHm
         Tr68VRqt1V3caP+EroN01JUAyTQ/K3zzEVvn8oFVS+Y1Uq64Nj5ZaDbQD/kvcyKYObz/
         9uZD8PoT429lfyPbT2ZVcXXaFySwdAeEMB7X37O50GQwUX98uiQ6YUxAb1Fhl6QHFp7+
         b10jtNKypXBHWFxETiVANAVoubzjbEIFeBXRPEWqmYAj1LVzKjsXJtp2tbazqIszoaen
         jd/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778546725; x=1779151525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjE2es2FiXMGiS6FgHC41XxcRzptayRAkd8ODfpJ5+Y=;
        b=QV5CDFzWF2ApBp/KRscSXUxiILU618mEl8Cl/eNTe/J8lMWK31kct/N6XP3WEshjk0
         RThhXQMF1PlJhON4bVZ5nCuar7ix2mqwMSmB0c2JBe+oCqwtz48uEYkbLQdRgz8V1kYk
         UOyAraEmIH4JMAne5jpG7/lOsRDT6sQuq+tsOr4y+Vgkv8TgfLMXeG4RgFH8279sy8Yi
         H/C3RAu1McdzJiUwZSDp6AWYBIQquhtcGjo9u5N1MJOkeHYT+nHeyQBhBGXIbx5nVP4c
         6Kva0c/l8lDWYZHGtUOoRaMxZD97HXjT7MAeDzB2888AoSxkBTAFiI9aqzNiwkdMobOu
         BFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778546725; x=1779151525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjE2es2FiXMGiS6FgHC41XxcRzptayRAkd8ODfpJ5+Y=;
        b=IwDQxq7eWiXHCtlrUNIRmdXMLpv2gVr0jQAmNVXUzWFgYqnJUl7s8K3ZoTxwATuXX3
         XkKNgGpuNz41irh1sxD8YPDDTsCQY/Yifq7r5xLjF6hvdWZVaCZINqFrqHhlFdSgPh5u
         Sftcy4+KxjHI3nh/MBymNKl/tppnBYH0+oXMnOCv1ZgIpJdmWudyDqGvZELQ8KUZk+P8
         X5jpQtLRCRad9KdqNqSPJnugElXw2YtIMXsiTpyq+bj25S1Aax4vuctq22Z1IksUyTua
         gtEj8hI1uU+hEZaI48QzXM9mv7mv8Tk8Ox76kqY65gfzUzgsCMmnw3hlvovFxDqhO2x4
         xQbA==
X-Forwarded-Encrypted: i=1; AFNElJ8TOB83aUMoL9POLLH2RRtUb/ZC3bF4sMRNoyy+0E/6OtgiCUwIfjtxvyFAlWaEtTc1NoRyWF2XnY+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8um279ctOU4BKJeOfe7xrD/+FIS4yWXQt8UTfV45uDRJ6K7hT
	e99ie9NjqGLX5hc5/PvZpjxdqt6JX+lsboapLb1JGtsdgk+YTFUvh/vXsJz7SX77QvD1t7e8hDL
	hw5cvcCWXDk7BRZGRqILVU6x1lx0oqzI=
X-Gm-Gg: Acq92OHDEgsWM33biaxtIzCJaPpXf1AN+7UxGBW8TdBb37+6jsbKbIPRelz02CX3r2/
	c00n3X+6AooT6q621v9MrIVyJpSz0JllpT/O9IG5ocnK6wO2l8OZgmD3T0VaKbFzqN3PZkH/epy
	ALmVG9r7Dx3mc7QvUO6FMUpHAR9eMcdpIJuQrJdCzv+5HBTWR1C2Eontw6DOyG4OOWe/PmbNFSE
	tmes9DICRP6YewYlIGM/6e3i2AnK4QZfqVN/yvIkMlqYi692gQchGN0GiSvsBrYZmGAd4Z5aul6
	45eAPymFD9zNYNG8ExC60003wF3G39a/gGg9etAcpg==
X-Received: by 2002:a05:6512:108a:b0:5a8:8d78:9fe3 with SMTP id
 2adb3069b0e04-5a8e0f375e7mr409702e87.25.1778546725141; Mon, 11 May 2026
 17:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509013745.80478-1-dennylin0707@gmail.com>
 <20260509013745.80478-2-dennylin0707@gmail.com> <20260511180056.07986443@jic23-huawei>
In-Reply-To: <20260511180056.07986443@jic23-huawei>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 11 May 2026 17:45:13 -0700
X-Gm-Features: AVHnY4KvcuTmWM3AIWx03nf5ddMfttDMncgC8jnUZQBfgJtpcBhUEHe_wSVgTTM
Message-ID: <CAGEkeHeTOkGkPYwTh54EHUfQ2wi2rmgEmMk793L_XqJN5NvHrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: dds: Add AD9832/AD9835 binding
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:01=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> As per v1 discussion that is ongoing - we haven't in the past put
> dt-bindings in place until we are ready to move the driver in question
> out of staging.  IIRC these are a fair way from reaching that stage.
>

Thanks for the clarification.

I understand that DT bindings are typically added when the driver is
ready to move out of staging. I'm fine with deferring this until the
driver is closer to that stage.

I'll take your comments into account when revisiting this.

Thanks,
Hungyu
