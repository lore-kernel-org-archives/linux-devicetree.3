Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC24F0539
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973040; cv=pass; b=HVAGaoAj9qIMXCVWAY8VppoBxGTkTo3XiF5hG0V4v2C0RQYHWz9A5KZ7xuEONRG1rlQVr96XTWavIKxrz/nY/P8vP/tm6p8OVCZzZI35b1xZVLb0yeYc8gzlNkJqJ9gzDCdRdyDTFELlHn0e3ty2DknL6RbQUFFQzcSJSz4EB58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973040; c=relaxed/simple;
	bh=LTP7G2+FpL1LCEYiFsbQFD9nCHZqmwYYze7/kvg9fxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBuT9DXWkR28dvdtbYpKQf2X4z9E4QI0DSddFCNHq/hGHPFshbO7ZDTTi5NZKp6dqq8I3YOFDjI4s9uonaewQs6BSCH20S+5RAphECEopzhZx/ODVRnjxFBzbI4nP7P2AjzRWfvde/wT0B0wIKd8wMPw5Ct9RDd/lJiUdnoeMvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g1f4pkaZ; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g1f4pkaZ"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679334baa1fso3278261d50.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 03:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973024; cv=none;
        d=google.com; s=arc-20260327;
        b=TKDLrIcmzozWdXGhhB5s1CwwRaYfBMsLqLAAWkQ6Ms5buBTJmj3ISfRkMzcUO6Ek/Z
         vFPgdLIT/N/8Ty3vAiaCpAf66JYXjNgHCZTmiLCe/3+AOYe2JN8bbCnxd4yAVspNT2GY
         R+LKPlA8IrPuP6+URIl+s8rdaL/VQ3ol+yS7Y3W/+FYp0zZ+9fDsLjafAyFKwp/iZ0jH
         5T+xU57ZU8aN9TEZjRo7NTWnqwOZxxPdrLl6I0MmIHAx11GPx3gA/1fGA71z/lhsjQR7
         4Px02DD/JHmCVAZz62ro+SzBuohmXP+Lmbkr/kryFY6YjAuiLJJRJfBod82tPsDpJsRU
         2/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        fh=mvyQJsugsaGtnzRjfP57VORlRtI9teVwieIZLHnHIfw=;
        b=nczbxMyC/voezypUOI7nmiqCqDthRRjdXO4mm3VltiqpfmWg/9eSljIuqS+NOON2eb
         oxNvvvhgE3s9rcz0CKFC8ceE7rQ5IYWwdWJ5HoNVEbds6J49MNUpknAqWrqEZaA1DDDq
         IbSC7iQ1iGbT7M3zZef9V8/tRJoTgu47H3P01mQxhIeo40MuMCOP2Sc+0Z4pFXBaUNpb
         Sy7rFTaGOk1naWmJRpd72JDJunxNhtdhhEzVF0mEovl+g95++lOq/gRExh5H0xQFcDTU
         gJFMMeeOuGnLsLNSFhO5qOFqfTPbB9Gl+sc/If5rcZEJE8uMseYEibCm2Xee3k60xyZl
         Qv6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791973024; x=1792577824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=g1f4pkaZh+JEZvwq0tiPI9MbQey3315XMqT+q25Zf+R4c5TFaJTQus2pwUhWXzJ3me
         vRdPmK+w2hAYfVRjSsjT9OW8VRCGttUoXdjSFuM8sX3Mvoa6qhWZoqx5JEDvz6fCN6Y7
         U8dipcs8q5DfZDpk9h77sL31yTHy29FYp+eC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973024; x=1792577824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=HrHmzHTaFm6Y0jo/fxFd3XwRAxYjA8kIiwNCCjEnnOGBVLODIPXgn6NWKadbnwTP1q
         iMSn/Hf6sManbHIlpCL6Ze+cLAM+Jlrrj2G2T7hn1UTJiHyn1lzuz/lzKY1Ivq6pHLCo
         qR8YWNn2Yb3jzajgImlnM9xq9DGLcjr9pHMGWI5GtW+XH9xqv8/oFGsvkSQSGBJpilNa
         wC5us2aXtIVyhbNaHSJie5WgYN8bSzTamn8NNU4XWwJetOs4OLyZvY+Ngi0YWxKd/tev
         nWJanxRstcH2WrYJvA3ubNFrm5M6uA1jauf/+yppdkm1rLRHxpV+LgBOQacYKwVZ3L6x
         Un7A==
X-Forwarded-Encrypted: i=1; AKwUvBxmv0feq4V7hmlU9U7yv+gpguCLg5F5weqWQwvgKw+Cnk70Zd1woJ/7K1D6VWvcFf2ZNU1Y0XN9kyew@vger.kernel.org
X-Gm-Message-State: AFq9FYJLjDXVNDuIAiadpb6iYy+lsURLxqXndkZMNFQ1hMW2Dv5sxfgQ
	GKWlKqNgxzvLmFAQgmz19t38X4Gsmx8ml9hYGHvkF5HydvqUDVbw1RmmcEk0AbwvLG5GgzlCg62
	T3YbiItxr978TgyuvYCVTtHIRrMc0XJeuMW1oIQkm
X-Gm-Gg: AYBFou2/XLe9jVy5TgZ6iLnFNSv+uFo8xyoGZSfxGSOt7yTwzMID8N6I5mC3+Qrq6OT
	pUxT2Sa1NlVogZaoV8n7HK8f/QR6LQX23Mm/wDh39G9pJKwxbJ1+yspEroCXBet4QlpMVAql+ee
	Ky5Lv05nVulSTSJmPru+HQoK1I7G8/xVkUZS+r4kBw/mdSngHHHlYeQo0ZPTvQaJ4vaB/4icvin
	rRnu9kdilKxOIEUzdR7aqV24tkYgxWXmztMVMe2SOZhD31Pk3huzgwQGp1zlqlXHOZrwYV4+wtQ
	h0XOSRLg/cut+0QT+GsGJHhfmnZJDvrHWqHcjcXjwCrf7r+VNX4zVWlx
X-Received: by 2002:a05:690e:b49:b0:679:8dd7:1d19 with SMTP id
 956f58d0204a3-6798dd71ef4mr307524d50.74.1791973024101; Wed, 14 Oct 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
In-Reply-To: <sashiko-outbox-171010@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:16:51 +0900
X-Gm-Features: AclHuK8vB58kVrwUvnG_FV1Bk2KZp5BcyBdkPIRhgzNfIxk2PQPvWDXOfCqkhAM
Message-ID: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: usb: port@0 schema constraint bypassed
> --
>
> commit aaa6107663f4d524c266c3a18264c416a86a4bb4
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: usb: hcd: Add downstream USB ports
>
> This commit adds a "ports" child node to the USB HCD binding to support
> connecting downstream USB connector nodes via OF graph. It attempts to en=
force
> that USB downstream port numbers start at 1, and updates the address matc=
hing
> for hard-wired downstream devices.
>
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Docum=
entation/devicetree/bindings/usb/usb-hcd.yaml
> > index 45a19d4928afa..24df99dfb243c 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -29,8 +29,16 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: The downstream facing USB ports
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]?$":
> > +        $ref: /schemas/graph.yaml#/properties/port
>
> [Severity: Medium]
> Does this local constraint actually prevent port@0 from passing validatio=
n?
>
> Since JSON schema patternProperties only restrict matching nodes, a
> non-matching node like port@0 will fall back to the generic graph.yaml
> reference.
>
> Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
> port@0 be evaluated as valid and silently pass, completely bypassing the
> intent that downstream port numbers start at 1?

I suspect I need to write it as:

    ports:
      properties:
        port@0: false
      patternProperties:
        "^port@[1-9a-f][0-9a-f]?$": ...
