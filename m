Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75893A641F
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472547; cv=pass; b=WUMvFJfEUg/76IeMpV+Ym5JZHvjbYzTSxh+wUXLGWwznqqI3Ph6z3BdpU9b8k7t5JUgEt4fLYPgrH++XKM0bwZWkyhMdU8o2ybBQLEtFDYhOsqw+89BF/BridPVfNXHE4mH7Iw4u7gz9ClYuXNTWVLPJwPZWS7HhmSzEWWMAioA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472547; c=relaxed/simple;
	bh=kPEaoQ8OjP+EXnYI8JRzPvxllsKR3GiBChaozvD7CNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMFm6b8r0MFnV85gtRjwx+JwKNQuJL90umLeIe7eVurl636FcyGhrPbUieTB4s5KE/lENKVfkMtUeH/pYkPPGZTZ/qOXdCjtTnWDN2Ckd+EMUo+MPhI/sPP1Lh2S0BDKFKIUK1rievSwYpnyjygFVwJT8qDSqtHewlh9+fzm8cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh4xtAy+; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh4xtAy+"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137dd523634so5397438c88.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472544; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdMBzJufrdMs3DQRURtCIBw2X1c1SAUHWjvCXDnVKjfnlx7+X0uuXAF6b9qxQuHfXr
         1rD0RnZYycf95zMhDq5f0IgE+9jyQg9YC5c77HfHVzyXycHmSbCUOCOu5As4F/vshabG
         H+DMtI5rTKX/d0KjhNOyiGj+7jLpYCiIH0dfACDCISOw5A5EsOBp39VFM6QIaRaQf50B
         FxCgabcn+KSlVS2MJB29K9eiZ9byu1EExhj3Hr4POe2xpnha02v9cz4hzI1ZeQ6y7xKP
         W6E12lNTzw5B993Bwvj4AkR3CEhib6TbutqWuFTVIdsHglRmM7+haJEa2oQxQE6baaL/
         +Gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        fh=YkPaZEzRCeQPtLF0UBEHzgvvzZrlma59DdEItUrmgwk=;
        b=f9fWFAEzfjr9NYm3J4MCIlbqq7DjszGaqAQeoYtmJlvHBCxQ2TPOuLqwyZXEUgU0Si
         HMzncZCJxMa88A8fbusXNUoSHyKubLiIrwNfYpDgPnAjRXnEDG6SIHZF1nDiBQcbKvut
         +t0zFZUlwFz1OVWTec35r7Y2ZPTjhsJVOS8EUjl9L2ATqZnleLfllE4vrArPkFlpm6le
         /02YoJOv8d+A2XUZVGLM/YhXIogaQ5x+7fAu18JQFrTttAHFJFgA9jwKFFS5uHkhnV7K
         j/3p5JCHuXQL9PMnrTI5yBD5Gw40EbEvZqrJNR2E/wjmO3FwyAfZoujAEpqY3TslAfBD
         bS1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472544; x=1781077344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        b=qh4xtAy+sTSvNUJcGqNqTqb8ubhlk6Nx4W0oPyijq71XdjrCwRoEGtv/xa9e7Sg2Xe
         +It0GQIQOFZoYXXm99XudycaVZ1e0FWurvdFt0YTqdz0eKe4j4xANbag939vyOjzPEe+
         Bk3CtpxB3DdQrjjkNUJE1kjnEr4DR8oCNPkgJT9x0KQD/pFE5IhxLbPI5G5sGapJyUm+
         GGmKFBqWU51moK3lhIxHUryM/CzgZDeLMAaiG8gXuT6LkArtE8QlWQd4s6MtyY1GmQc7
         xXkK1dn8TEQb1PWCGEZzcjo5bygwOeib6SD+TpCBndHTisPdUrxiu0rsPtvwzHMTEUSG
         QMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472544; x=1781077344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        b=GohlAUmf0x/mpvjU3P5UFYtLuR7O2FnWNh4Dv7twuhd76ecd4l6m1Ie9M0bCWeThcN
         r03i77MqzhUeq3LuYRmqrqZOuuVfYZhDyc2f3BMkaq7TLtDNP3OFIC9JkNud+b1MkoA6
         0WUctKKg58ZifIHSu4eunbOCC2j90msjVuQGo/B2jw7OsRmIIdkrUg8VdKBV5pUHbgk2
         wY5BCnBAGMgqCsqlTmsmdfVpOrfAAoDe/GQM6Kb6RU31yuTMHwsDQYgm+ARLk0BKBrD9
         0T+bh5j+kdosJw3l/dJnLZ4naQJYEnLD9Cu+4JEzZC2AvAUYzVqH6U6dWlccFn5U1n5Z
         XU8w==
X-Forwarded-Encrypted: i=1; AFNElJ9f9f2wypwMr6ec9Um+zg7cj8j9Ec/OBk0XWQj1WK+BV4hkD+3IEAE/G7u9YKqLSpH/ECVFlDFT+Nir@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hE9vns4d4NYr9hyqrtFnFhvUwv9D5eRQsLMrnqUMdmMHi6oK
	fEXulW9q96x068BWJa8IJOAMEU+o6nHT31E6d6RGMuayJ2U7oHbzJjNmCOY82ZoxhukLiSsoNxe
	C9kSQIq3o6adTHY76hb4uV8C+q7P5Sso=
X-Gm-Gg: Acq92OFQ3BVxxmhjTQQrK4AUQHmmOBv0czV4PD80aKFfTgWxG9UqO8mKCueq0uUhD3N
	kkuhAwINgW1Ty1oP809clTNNakpsVPgtPH7eUtGDP20d8MLD8tNg7fQrvstsWToxkth/+dmcyWF
	jrvsncbj12IUm9Dir5w4whibhJxWLQT+kbebyafufM42vngGx6+lkHI+slw9PZ95nHKii+BWx4N
	ZRcs0iKqhIiYC0RC9QNm3gc8jXoyjVuD7Vtb6rerMNq3zBiK1N+OaTdkufj1G3FkjXh7QRB8vGa
	6xx56VLomVunVtfF9fc/WE6YCwStyQ==
X-Received: by 2002:a05:693c:300a:b0:304:4f23:457e with SMTP id
 5a478bee46e88-3074fb684ffmr1181310eec.22.1780472543899; Wed, 03 Jun 2026
 00:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531092924.12929-1-clamor95@gmail.com> <20260531092924.12929-2-clamor95@gmail.com>
In-Reply-To: <20260531092924.12929-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 3 Jun 2026 10:42:12 +0300
X-Gm-Features: AVHnY4Ieen8ZoYHKJxqaa_bowmUWca3QV_nYMrOeqjf0cKthQQdJ7zZR2Kop0oE
Message-ID: <CAPVz0n12a5XjoFbCYDuwa8gzYeyg9jcjOzKRArqFZBSgMkjCkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1 RESEND] dt-bindings: media: mt9m114: document
 common video device properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 31 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
9 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Document common video interface device properties, such as rotation and
> orientation.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

I have forgot to include ack and review tags from pre-resend patch.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hopefully, these can be added without resending.

>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yam=
l b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index e896f4db2421..2b39614f5cbf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -15,6 +15,9 @@ description: |-
>    an I2C interface and outputs image data over a 8-bit parallel or 1-lan=
e MIPI
>    CSI-2 connection.
>
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -90,7 +93,7 @@ required:
>    - vaa-supply
>    - port
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.51.0
>
