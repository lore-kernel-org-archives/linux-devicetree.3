Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036962;
	b=PuYB3tBzNTvbpyIUjnrX/Xsetr3sRNnJoi64nRwO2QiSYHzTPcDWCDEkSoo+wxoIHOPl
	 lU/wFYv5UvE55vEROitZJYa+mK5KwK+j6/mRi8GATBd34j16dYqSUZ2hi7sld9jsJIN12
	 K9Z31HE6JTlN1HYytZJ7mM0e6Cq2LnhP3wvo4BHbmkDqXQ8ck0mUbsyYm1jPd1wRCKGYn
	 fbxpH8VUM1VA0iYEPpipHkXERBzlDESL1nsCofOXPTLEp/QhyC62E+RJxCHFtUNVj0Rln
	 3JQheEucrlKjXb3H+2+M7zMvcoZGnt04Iz/FDVUJapDgx4juaru9BQqO0ZdKhLoh4Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
	b=Wd7SiB79HElVKyBjDxh9Ftzgf5V9DSEF2mAigGOSKgi8u2AAwnPZ4HI1vTdQz2gQulwR
	 NvqCAsXxaEGoXdldvF+78G/iJ31t2JBELnYKM6eqzIAuOzrSZYBTkaMFsjN0FEV9W+kmD
	 IKSI/3uaxLRy7JGaQusRjwdAA9CI+vDilaD+epcsd6HmJwE0JVwlPD1+ae7ogAFqXFYJG
	 AVBAgmntRxwXDWN7oCfWKWsJykH/vNSxuV0aJ7MmSMdyooBiWpr/cdyd3mOh1FHMqLTnA
	 W9xb/1ST3FAcNWZa07MNRywKFEIvYxrGRQSPl5JT87FETYswBYKXh3x3PfSH37k9mYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwVBLYr3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5F606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 21:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E5F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TwVBLYr3
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso13959101fa.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036960; cv=none;
        d=google.com; s=arc-20260327;
        b=gnwaW+dtzz9mfVcPGc472ZrIVkL99JXcEB7EIF7eZXeCo+T77A1Atl/IN3RJXhsTlf
         XQbSlXJWjR1asaMr8hFOWRVBrKuSprdF5CPXJbtj4exg/aPFKKXk0S9GDJ9nxPPB/2ex
         +XoZxojywfWwhnNvxpI4LP3i5GBXZj8570P631h4Vt7APNQfPczNR2PXcn5IfLGHzbGd
         S0XvvRJD6kaH+lLYX8SUsJNZ1UFgGSl7FtFQZUQBYw0WCa81wwOlqqvl6KnGjSm625M0
         ufAi08FMo+5SIfdqsSBojglKZY7LetHb1PyR1lGjb273SWjOBtp+H9NI9G/dUFDy+l5Z
         LJ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        fh=/XIphVlY87W9hP1kMhwuhYiq9/h++nhBOpL6Kh3TG4o=;
        b=P+4PFOEgJCANcqhxaIqhzBOY2WGCaH2zWkQFlqtsFfkDQyzBMQfMaASVtS5jYjiuAQ
         Gl/XlQzUojyVef+x9Xq9DDFw/T2b+QTPE9A5yGolFsXHpCZklbeUkvBGtPkVD2Y+UPCy
         cPIjFH6/9dZADMujfzBGOl56yOQW1anrdlnwOArO2h6CoM1eREu+TYF2git7vdzeHUif
         1FVZtVgKZ11CQjCGW0lQm1KmNCfzZYNNQ/sV2ut/5QnEd9akS2wHgdZzYjn9uB9SwgCZ
         l4s1oVaG57Pl3rCEO+p49/hgz7Byz8VRF63NqHTKsoY8/Mhd1tTJaz9l18lADhuwvIaB
         sebA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036960; x=1795641760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=TwVBLYr3foPwQ60U/t+biVaJU2fvwxKBOh14pJ+AhMGdhyO34J3Kx0jMypZkA1PDRc
         cVAQRdH8Bd3arTzs93vypezRQiFTZpIp58OTMnzo/cBwq+dSUTeSt44AjfvPpSTzrV2R
         PtaNbqHoD0ec9Rg72fdFgBlgKgxR3TlmKYkoLaT9L/9gf14TtpidpNZnmp8UMq/APc6m
         XQv9nlkuL0rZqEwAhSUceByiWQGGilCuEzQqyDvD7QLWpDUxJQB3REDMLvYWu0hQ27DG
         nunLHT1rxglRwBU1QTMkudlYKrJ2+Y8Hc9KD5jHTVr6luSspdKN+rvKihnaUM4IQxOCg
         dgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036960; x=1795641760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=xnCHj8Ha4Qrm5GzGWEuOvsU+lIDlkrtjVjjpqWC7mLNK8Yud+mIGPnIFvMKn4vOKUN
         psnwkfXApatb7okzrkYhtmYxy4utIVdpNoMn1QAMzCNhkfsi9NaRDWOyWKXU+7Zu1LbH
         cjgjS5Ob0twMioXE7UbEwijSI0sgW4FGIpLhK7z8dHtThdsPDsUGhEam2wQ1Cr3c1MC7
         euXF2WP+/a/GzJDbo4MqYE5f97RznPe4eLDKF+iYFoVGMSVyS9iVE26LFuiX/QM4oVTn
         MuYaWkUNHuMwd44bNs0ufjw5h24mTJ1h7hbSBaYwpu/6iKpDR2YOxHJ0s+gG0fyKj4w5
         9wHA==
X-Forwarded-Encrypted: i=1; AL+hErEzOFFG7UpmfmxlB4BrDWrwF0Hrbskk9ZHSMKEU1+Ww/ZUQZ6RLBomJvqJ9PyH0yTInJjtvbt8BdwXt@vger.kernel.org
X-Gm-Message-State: APuU4Z9bdi72bPcT/KbLnBMWmbYnN5dmu6FDzIhi1KH9yKOClNu1mmcz
	epni1+lmkAECBnpwdagzz1lYgb/laz5T/EoB4fjwvtUZz3N4YobXnrqQEUuodVXaWYzLRh/nHG0
	QcqQI/xlPBUs9lW9+eShQhS6QHclyi/8=
X-Gm-Gg: AYBFou2G9sMC7kLVF0wxdUfJUECzN2eCqHKxc6k9v5rewPvspuvAvV8FmrihGVgNY3j
	YvsDHuP7f4EtkNFbMwPxSTs3S3KKC8M1ByBjn8mF3fU2ymZerqm49EgPyyD7vXHy3A9vu1GOYoD
	XEf3VYWNBVWYrFfIdyirBaGCvpt9zPMeWuZipEIu6Lv96cTp7wAbrEGD+zE0x8Auj2K+2iCWdzr
	OIYRLf2VuBr1WsefMO7A56xGGYRbx6aP7wCVmv+lP2I6FMRa7cabsDCSa87xviRwTkGiyzxU3yW
	xs8V7ISuwAV4cmdJ4kAMO9Ml6e6iFFxnyulz/wmjAx7SR5laQ1/We1EWtLGzP70t8zz0u1D8oKM
	PfocMcrBh7V6zIUydiV0vMgkMTSG4PgoTwuBTA4j5RvZykCyPiC3gcxLXGIO6blmxI5Oy46UfMb
	GrG5Q/8J0VV2lObX7/qE+h7LC3
X-Received: by 2002:a05:651c:e18:b0:3ac:e304:65 with SMTP id
 38308e7fff4ca-3ae67323879mr13145831fa.29.1795036959773; Wed, 18 Nov 2026
 13:22:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116111802.2442456-1-lukma@nabladev.com> <20261116111802.2442456-3-lukma@nabladev.com>
In-Reply-To: <20261116111802.2442456-3-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Nov 2026 18:22:28 -0300
X-Gm-Features: AclHuK-Y6IDFt9qpjrJDNGTsfQL4BjSsgswFvwywajIkisS3KGgYyNt_017jMzc
Message-ID: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree definition
 for Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.com=
> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.

You missed addressing Frank's earlier suggestion.

Please use the imperative mood: "Add support for CBASE..."
