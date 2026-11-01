Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548754;
	b=1crySahZIK7eq5+Qk56suTFex0pfWgUIebwfk+66nxEEqS4Z8n2qV2esG0a7rpQjU+jy
	 o7h8HY4fnAV/vqkt7RWfoXbVFOt8vgCYzHE4tdr7Pvn5xRjrar+sB98dILRsbX6a3OI/h
	 gVZl7vS2vVeyU8IH2rzhfDmuzLjEqOzuTNZF79Y0N0vU3gkgpMqweoxwoQhBBfWkGCJO6
	 V2cvFwbZK1Kz+MZf/zLXR4aE1rjqli260ZEEHOreYiGDK58e4quoLjA8BCMGRW/I5DioK
	 yVH/9o4CdcERB8HVYUhkuspdoLvNJErCVwAXNUAUpDRoKwY6FNOakQoPIkzyOuGBm2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
	b=u2+MaEQitCIebJAvP5eIJR0sroPrzRauWpXNbrsrfO/OGCXQAiKo1FUTnjQ3TejT2Ecs
	 ikmRRzB1G0tc9NWrzhY8YGA54bHMw2I1EtxB6h0gAZm8t29H6p/aqJWBWuLiz6vTM+Fh5
	 8u2xAqS/hl9KMlOIKHDqzfy1ofZs0QJndoZ3zVvoQ3VXldCodpJDHQhccWQyXF9LrPbjt
	 0MzsDzylKNiCE3GZo11X6ThzSbtHJnBETKgakFzHWbHG9fDjPYQ/qoI5+MCIGmsXycNXG
	 md8WdkAZm0vEwafjNFKVeGKuJ+sqBK5u/GHHmDHL9PlNjX8BFawlNllyJrRYeGR+KvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6016D606A329
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 15:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6016D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vyOmQU+G
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535a54bed9so3399168eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 07:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793548752; cv=none;
        d=google.com; s=arc-20260327;
        b=MhLV1EDAviEa2ZIVU3yzNyN4WpBROU8bMJd3m46Tdz4tiCWb7G68VyyaLHhJax3rND
         1kcIsuXvuZb1pnk6+dPb9uIQUj5MuSLTcgx2+uB87YAlU55Ssz6Bc8te63Y6aMW9CFU3
         jNN/INe51fE4CoHMryZTtTGBgDfAXqLZSr3ioRAuWfJPo4chmf/3vMDct05Ey4HybJs7
         ucVIkGqm+1atzvc/z3/3JwimFKNujSLaTS9C6DrtiuqUbvk3tA0GkeNMEJSG9ZvwFVIF
         7FIdpoPIQYwKYhS8vU7X/nMiJ3RC9T3oUTtkU/iEsdlHA9SeirybVQ5dgCExntTFPREw
         n19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        fh=aQG3fXc4iRloZtFgitGcyOLowsn2mV7cNCB/CXh/cn8=;
        b=LQs89wVeVNZSDfxWOTrCvv6rWO0t04HvGna4q7zUDSTGigWtI1ElWgYdXnySbRRmfS
         1O+WIN1C9gNeH456305yu4/kpRPJz2qQ1yiMvqdbmlNVpLYtO9P/XeosR8QOeIAMqUbm
         Ch/so6focD8X5+fQHhnXO6VFLXVBxekiUDHjRTS+DKGE1Fc+EgzAo+ChnFQni4IgAagu
         JCV8o5aWJZhvZjGqBMUJx8xyqUKNcCCKNK4+O1PHoA++dQHM5kiKE2nJlNoxLTtWizxC
         N2AVnCwlEGUarqHlRS2mrNSr9gmnhhO8fLLJJjiPbLbF5HX5Esve3uqTYMxHX+Uc8kWs
         qCNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548752; x=1794153552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=vyOmQU+GIUzXlWzuISIAqmcM+65J78pwMqPSy/SmvKYrqsO5olf638kBeiXOM3v7fD
         7Gjz2ZgbU+Y14eCQ/WSShxwfOn/HC5FFJPn+gZia6EiAo7w+pYIMU2t2Ia0UWj+TUBPg
         PJDZOD7lvjlbUhpVweHCokLOA6EG5D8SVEorKg9Age6da+KPUy0x3ZqNQOIZ3sdcYOsI
         lf0khruygB9gKpxiaUoEzlksGd02/37GJ7qNZFPu2SNZAil98x/HUwjVANp1Xlcy+UWg
         056SSxMwD8fwFs3wlSDLNpmICXNxGhgJxtkxBA08Ee/r62MC2T6Qxlcy6FnEvqnVfVsh
         DI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548752; x=1794153552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaBbso/nWA2Q4yJF5+SbtI8vmJ4zVrnNgMLlXI5ZDPE=;
        b=L3um2GnvmKPqt7VJYsy4WVB36STKxX7XFBIii+MsAj2WYOnkVq6SGiQbRBBOEtC7xq
         LP7OCSGQhXuqwYqkLkgx4oj0VWzUyyy4jQFcrQt+2VdAZ7ka3T4kABK65evkqnN8cJfA
         y/opf3NV5CNft99wzFycb2lTWGWBuhiym9CcpsJ6lMCEKa7vzGcHnkZxzMAuMHCk1mlw
         SzYD37Npo9CdkxRvYE7ZwoK0Ex1nrMT0DazzDeN1B7LGdaIVlw9pjfhd6OBoJ1OHGFfO
         yH0I/d9DkBWGvr4XQYq2Rwboce8aPaT+HGcQ/WneajAo9BVYpS6tmSpW6MrgaztQndB6
         Y6OA==
X-Forwarded-Encrypted: i=1; AKwUvBwQN0WBuqZUzPJv0LTZHiqih7uVRIpZec1rGe7aPgFDdtH6FAcr2/IKa9Yz9kEiIXUj4OmvALji+fBb@vger.kernel.org
X-Gm-Message-State: APuU4Z9hJz4Tb8riMTje2JkUPkGmPSF0oAcpRtfeDDa+jFDG/iL9S1k6
	/4tUCw1aD22CFZYtR7vcG0kIxNk1Ep/pOaOBckehmNtS2DGiSnapoin+frGho5f2HSZCZaqjM8g
	wngUV4sefxewHCc8rwYufqM40D2i7vyE=
X-Gm-Gg: AYBFou3ajfOwhf+Rp5YQm5RFtNsECrx56KgQkiU6TWZq9ruiEBDjDfvOku9oJjVA3GA
	ZbVtaZ2A8CYAJ+5yywzZyZ90SmlgFbxP6sVO22FfbnZeY0Nv9CeOXYB3Icf6yMIv2fXpEcxiax/
	bE/IPn6vYTqBOIYI2e43GmTj1nvThvF65Fk2c5wSvlPO75PuJ7oEeE6awo9LfTGtDBXKTTN6pNY
	66l2HAYYGx3idBBq3K9aQDN8FIaovn17tW9dggwaGB/U7O7dkiXL3tbgOcWriMfH8ji0l9TZxN9
	X6mqaNeQxQpsFcpZAi07Q9LD/ed6+3OQWGrJtMeAu7wu3NgSBZc3dB4CCFS0pWdTVJ7b1S9KAXI
	w8Uk6ahdZ0vpFBgcIqhQt6ANFoq17jDiLDUZHBWKsMc5gZ3Ld1XP+f1HyGexGFHRPiWk71z8=
X-Received: by 2002:a05:7301:6198:b0:36a:1e9e:ae61 with SMTP id
 5a478bee46e88-36a42602aa1mr11000618eec.38.1793548752284; Sun, 01 Nov 2026
 07:59:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-upstream-iio-cm3217-v1-0-5e1724cae7b7@tsv-stahl-riesa.de>
 <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
In-Reply-To: <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 1 Nov 2026 17:59:01 +0200
X-Gm-Features: AclHuK8C4vxEYccTnlJFTZvavpWf-GCXw0Ej68N8q_v5q9HytmNW0NUmwJ3LSVo
Message-ID: <CAPVz0n2YSjPsmhYHnm9UfNtU5gg-pWcxe0Rybpf12jrXUKn1aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: Add Capella CM3217 ambient light sensor driver
To: admin@tsv-stahl-riesa.de
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 1 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:46=
 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> The CM3217 has no registers and no ID. Writing a byte to address 0x10
> or 0x11 sets command byte 1 or 2, reading a byte from 0x10 or 0x11
> returns the high or low byte of the 16-bit light count.
>
> Command byte 1 holds the shutdown bit and the IT_T field (1/2 T, 1 T,
> 2 T or 4 T), command byte 2 the FD_IT field (800 ms down to 66 ms). The
> count scales linearly with both. The driver exposes FD_IT as the
> integration time and IT_T through the scale, so the scale list offers
> four ranges for each integration time.
>
> The datasheet is not public. The bit fields, the reserved bits that are
> written as 1 and the startup setting of 2 T and 100 ms come from NVIDIA's
> downstream drivers for the Tegra Note 7 (drivers/staging/iio/light/
> cm3217.c in the 3.4 and 3.10 kernels). For the resolution, Capella
> gives a range of 0.01875 to 119156 lux. The driver takes 0.01875 lux
> per count at 4 T and 800 ms. This matches both the upper end (65535
> counts at 1/2 T and 66 ms) and the 0.3 lux per count that the NVIDIA
> 3.4 driver uses at 2 T and 100 ms.
>
> The sensor has no data-ready flag, and a new setting only takes effect
> when the conversion in progress ends. A conversion takes IT_T times
> FD_IT, up to 3.2 s. Leaving shutdown starts a new one at once, so the
> driver passes through shutdown on every change and waits one conversion
> period plus a margin before it reads the count. The timing was measured
> on a Tegra Note 7.
>
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/iio/light/Kconfig  |  10 ++
>  drivers/iio/light/Makefile |   1 +
>  drivers/iio/light/cm3217.c | 383 +++++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 394 insertions(+)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab P1988
