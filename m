Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794766119;
	b=PtZQYaNCKnvWBLmk9PgDAQrQotzSvXipBPC+gY2y82I9DvYxUazQSTjiZaaqM4tgDCOS
	 K/h5vsoLDJuFIVOaOfjCP0W9qLa9eECcmANbx6JzcCzgaBlnf2r1NYdTrlQZAXVwU09vc
	 ql/F1Giwy0cHFbifKqO7Ueo+Jtup5qT15WuaMNUt3W0z8DEling3oTUSDNZXafjiqP478
	 34Prj2T9/QnkAGhqv8hsX/7EI3T8rAObWQnqGSv6XetGGkJ0EYWYcogcJGPPr0zKALoof
	 a7oFM0Sl9hWVXJ8SiGPnvRedSObA7Z2nFjGkutmc2gwVZq+5/Cmp1nWs+xASFhOBrpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794766119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
	b=gtpmE6RSCRG7ihKU6s3yTmMWoskC6Sk3eBO62WkjW4nuMQqhM47SrOOs7zq07yFY2Yd3
	 j/cZfkC5MGShp9JE1P3TayW1qRmEXdezPM7jzVw1B3fRX4OCrUS8IEHTQzGMlNiJ0TrXF
	 5fIRTPphj5t731ak7rVGOQPyD2ckFLgNcCsLhwlX4JmzfBN/w+pUmAXUi6XTrg78EUj03
	 01+qtK05s3aMYW04tzXdy9eX+pvIVS/H1Ib9q2J8lTYYICxVh7GUT6sMEbZ3YHtioebYQ
	 BjgoAx5v3WGmp6vUcEA1ZZYUxN+i8OMyw+Q76mYIYheslAQQnEHcGEbuum01uJWUVoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE2606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59BE2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NJYwySQH
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67da69e7c31so890857d50.3
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766118; cv=none;
        d=google.com; s=arc-20260327;
        b=J2/HMQFpmn4d63SkLVyOX3eViGCLS+x8VRDTPJBp66kgLVNLmaQSpqQuf0rx5URXBz
         JGLDFUM+fjaIS4ngy5unRLwwa5BZekFpdW92FYIarNsMJ6S0alY856mY8sq6muqC1qhU
         gS6wc2ox3jAWHOw3+cgHbECEG5OmQGzQ91NdtSulCcDZbv/9XqfGwBVp7JRMdo4E69QB
         +kVNKFrTR26K0AnWFUl0UGZicY977qoqbaYKzoCWu9LeSLNN93o2xwUU+5SrawUB8Xu0
         jN9+tRO1xAv9sPoZxTytBFpkrpC31uH/uAcIoZXX+NJqWbdxO8K8Hmov+DVi9bMgjRzO
         32IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        fh=7+/0os2L5kGfzWzLl2dMlWpB2HCz0gS9o9gEhQv7ths=;
        b=Cuj2+w6OUpLEWHUFLtzrA6ALcs5JxQIqutXals/8rztkosQ0d9hrI5fJhIoQaFgalw
         yGLq7btpcMPU6s0ukE6Lap9WrRqzU5aYWwKlcqqMgtsXQM1F5WEEPrtvhnF7WxRXdsre
         N4Lr5HRZqkJZDoL0kOfBbWzErA+SSIsFGInJPalZv4LDPXvQZaNdptAQGZPw656/q2Fh
         nSoO24Fbg+O+kUn9NdP1j37mNMvN/h/reE0gcT8RxQpRlHlYaOz4c8e8n76CmhnXUM+T
         fqEQ185c63vQWPeEBZSWlWglUdchUT34e+H2++HZs5O/jTtZknOMLByVhYZi6Vv7LLS/
         X4Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794766118; x=1795370918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=NJYwySQHOYs29DzAZoCW8KTTN4Hz5eL3gp2kthjrtMBJgUvZUdGP/E5why6wGsaU1T
         lMwanMmvalvECH+a+Rz1SKSkRFhICLIOqqH9YtPzk7oiK6IXTb2IZnVO65swhS4C1HpV
         FX51qZNZ+UnmtU2DHog4Zf7b/XL/rNNkUsklcrv8V65AQML5/oC/q8X6Z0VCPAkcN1P3
         CwNl0gLixQryZLXt0MUFVFo+fYZ64qmoeV9repPHSkLYAvTOXcuZPCjm8iWsAX0YReE0
         Z4zQa+WdwkOiCym1+HdcxVrGnXddJi9qjcShaxIi8T5T00Sh/qRgG6exViSshW0pt0lF
         IWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766118; x=1795370918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=1bLS/yCnaq84WjB9/rCMPppgRWLMw+EUCgMnP/7BzwifHfbnWSjn41YhvySzcCs6Rr
         tr0vYMgwYHa6jPhxfSrSOUL6ue/DV6IcHsK86WEaf6T2Qk126CWQESt16+EuuFHU//ot
         cYzITepPjee6GRnC2h3/in21bqMU7GEqrRmseTaT+0zMes9gN08Z++lbRCeUV55ELpQZ
         TkcfKDP0GJd/UrOMQAjdJW964bVb+Ue8U/mpp9mow2+iAUdSNP0OBOFZSVx00Jjd4mH2
         JHf3Q8B6uBsK5/xjEHvs34omiJ9fLKab3PisSHta4iBfoDzYFfwHkQqRwXNq1nI20+9U
         ijUA==
X-Forwarded-Encrypted: i=1; AL+hErGnRd8W+q4T2skjUIkBh2zjyHnTSkK/CE1AzGG9IN/B6HwvhI7ZAhztMS9CWSSQSvIBXeBUmFAZM8vf@vger.kernel.org
X-Gm-Message-State: APuU4Z8AlFYW4ALbOTK6+PiOmcLkJKfHtLiC4/oTHXTU3ygdA9tJ0L1M
	6+uP0gAcdR3kLAuGyE4G4d01cRnE07qKPJsVdd9NNpxfZ+Z4DM1TN/kkALop0HZ4M7LtF9T3yqr
	cNI7fp21tOtIOFYv1sR7W2DyrTTe1PBE=
X-Gm-Gg: AYBFou3f7KjESHBNDklFJgUsD29NbVF3JyRLUIFiJQpduYryG0qkGpS8P4eVH4JXsDv
	yhhcGX1UY2sxnD9HfYf30aFnvF/qsg7ku1qjNn41jb2O53AKh2GAiNVedgh8UBvZdMogjuARhQJ
	lujB/4QtGw4gJ+vWxYub0pqI6EL3g5tKNSZGrhEQy9KbpGM+9zJwmllS1hECvlJqzZ6USBeJZ6s
	9HN6l3l4s1KIOsZJpI3ewc2dClICAc4Q1MNhhF/MsJCJ4HIKZF0xPPf1/xxqRlGVlnxNy2QcbIf
	XZtIdAjHmdTldbCL+PubAC4F9t92zmoH2tYDzYHj8qLUGVAjitrd69ILdqkhTvWInQGjwbA5CXh
	6yP/kX0T6EFFK4PHDAp7Xb0hSP9KCH1VhJXEVnCowneTvV9GLRUv0Mbj6POC82evvKeptAA==
X-Received: by 2002:a05:690e:a4a:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67da6fc6d40mr1650517d50.106.1794766118350; Sun, 15 Nov 2026
 10:08:38 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
In-Reply-To: <20261113121852.334604-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:08:27 +0100
X-Gm-Features: AclHuK_ca4Ke1rBatVDRggo6mUiIuil3NWD_1WvhT9IQ3QzVWOrT84nkfXuKy0g
Message-ID: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Fri, Nov 13, 2026 at 1:19=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
[...]
> +&ext_mdio {
> +       external_phy: ethernet-phy@0 {
> +               /* Realtek RTL8211FD-CG */
> +               reg =3D <0>;
We've been following this for a long time until someone found out that
RTL8211F has a broadcast feature.
Can you check the strapping registers (or simply see if the PHY
answers on address 1 as well)?
I'd appreciate it if you could update this patch so we can use this
approach as reference from now on.


Best regards,
Martin


[0] https://lore.kernel.org/all/bc8c7c6a-5d5f-4f7c-a1e2-e10a6a82d50e@lunn.c=
h/
