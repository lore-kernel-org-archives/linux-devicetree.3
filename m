Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649A73822A6
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296990; cv=pass; b=XRi0vNHW8iR+2oEr2M8jQkx1ZwBIXK8bbQyCX5Ht5tSgojgmlF5oqJDcQtpJMMb0J+ls2N7lcPXWN7UE6fK7MvmwQQEF2D3zkCNNZXdqSPfX4H04cD+DI4D5x6K3eNlYt0CCjXt6cQXes0NhJ6Bhxu133Rhb6fO0dKCSDLZUTl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296990; c=relaxed/simple;
	bh=8Ab12z/D7dD3qz3v4bjUPqVyBL8xw+pAf2xD+edhf6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihbo2K0kxxY0bfrDNoLF/Cp+yUi0rVXjpwBrMh38brig2Ksc7aJKQ7XJEsZ+i/QfQxYrNiezOG3fqAvhma9AmgOOj5lCXCb1iVNi6TldQMyTNUIuHnZ258048oIvw0DRTE79QQZv9XYZbFVJ49mw+cZH5sGr60O0qXnoEhsCS/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ1Vwmsm; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ1Vwmsm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso1149545e9.0
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 23:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780296988; cv=none;
        d=google.com; s=arc-20240605;
        b=Cau1phNXoVkyQd0AEnRcIU6rU9zJKbviKlAcXMBzjf/3tVEOS0W+QNM8NRMGoXAkFr
         gDVIyaDYbf/OAoS4F/8JxcRJIBMkcyUaoKWUauOYjBjPsIqwz0IrUMe16NIQ2LjxfQql
         5lAMakoI+/1pqjRLPlVoZVYli/6B4w8DygLxCDUUfw+jzOppzbnAYixIhAlQTwVKuFYU
         NRizbv13RsFxiRWtEq8kYGk63a4JFcyC6SRwH/9GK5G99sWkYiWpg6Y1ioL3Z92radW6
         Ok6kHgMdXusR3O8FnzJkQWst8qK4zWVP7C/7GixGU1TYWKnF2nwsqvxiCdEBZt9mngiH
         L4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43qpCIHXvg02vOIiV3SVHpTCHSKFpgZfLjuxybaTwdQ=;
        fh=j9sx4isJJUkC9Mu8571j4pd8IOCuxKPY2WRRqyqwyaY=;
        b=jYrT8NVFBPS0rztieZYLkF7AvWl4OGU0DuST/w3jisRLuoWhBJseBQby8smpcQz5o6
         fGTVrev2jykLivQkTdit/YBVTSD2NqYNem97g0JIS69ZQVssGnf9BLZ4Gd08MwqG6uZN
         +Ytz/uvxLdBy48/pwJD3LdQ5edJW43ZPm/AUECBctSh3uj1b1fmiNi5+SFSbalQOMDze
         Bvr7+8FuRimM1bFjKEA0bHKLZCVkx+kA+cE1sARVx2992HlZYU8b74ObjKGSqEWTntCh
         pYTceF4qgTscXN9a8Bt+HSodmqWEQTzyZg9OcVi8C2nnLfzFJqcZm4rQ1vHq0cSx/nLC
         iNbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296988; x=1780901788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=43qpCIHXvg02vOIiV3SVHpTCHSKFpgZfLjuxybaTwdQ=;
        b=GJ1VwmsmBRqTTJpf4q1iXzPIE1ZZucmv1bdYjFa03uqbO0xOouzp3bBwIayB5aMjlj
         sSJ5g3ef9jdPBYCmpzCA5GgUye3xFqQiELhXmxf5NYJ8+/drMoMsqbX3xCaVOAoELdKN
         NTCcuLEv96/EzP8jnZ1h5nE6VNqC+GkhRb0tH/hJzqreiXFXBwCxgRWdn4sHsFGEZztA
         ARK6KZ1JRbgRcxd5yB8b7Oejbr3TDQB/dzlLQ9ISmZEEMkbAyFnjB0T+iuN881W0QItV
         LfvkXLLpFrb3NB7sr+H1svPkZTSVww7RI60T/2/HIujn96WAHiU9tl7RxLrf+jgtt8dn
         ndtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296988; x=1780901788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43qpCIHXvg02vOIiV3SVHpTCHSKFpgZfLjuxybaTwdQ=;
        b=A8UG3UdHoUALgCrYoyA1HBBumQSZn8rQ1O6gIdnxaiL3WAqEabibSCkly/9hMyxKt9
         Hn10vxu0f+bR7pR5NWjB1KVCIyPQ6u7nvD7QrSA9leMZv610Dw6xZwYRDDsR9Czi0EVz
         1VkjLG6/l7R9zKzMuL3gpOVVgmoor6XGnmfXzc8cKcTRoRTxdSBYsg82Je5BBarCMvpc
         MDpeQf+Qe4kop40Q0qEKLbnVwfWiTGU0WEtN/SFQjgNh3Uznp0z6gx7urUtmK34LzXa8
         d/yxVM4WfhnjicDLs8OdHeBjkSOlZ8kGfCz/9VxUG8CPWRMkjZs682c/p20ib1nv6GGk
         +g8A==
X-Forwarded-Encrypted: i=1; AFNElJ9S4GJax+dWfd51bxaz8mdLG8xI8qGFN4aHf2cN+cyYfDFfP8eBU1uLRuj2dfNyhvwEHC8SnpoyL3cK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1/geVTFUy6prQqwc0inoJ1tk89wNAwafIn2WLRSF+Pda+AoHF
	x/ymVmljFXW4q5jE8gdimltsfau/ODbZl0w1z8Ql2trxWigjR3IYwlLbH6ItXIYqpn2jjOiyfKx
	FkiSsD+ZVVzP2nCogebDLbG0GQCOkPoE=
X-Gm-Gg: Acq92OFUIU2LSfk9j7f7RtDeE0qA5a/wX6zIugGMe1ik1r7ynViWw306g8zp27aDppa
	Jy94GovnXWW4NoLsUpJX7+TxSwS8MztFRMSHb0Xa28f2kD0NTt1bexTml7ZtwpJO4Q/KWp0yiKi
	7tIqAaJHqJVoNDqwBVOTpNxt4VK63Bu76CTYcmiLfAb+038M5A/jpVR0znt7SJw/J8NrwujpS0o
	/BvJZeoSnXcSOSOn5XPDfDIuTxiTtXMiIwPO3cv2lhBptF/MArbDLXPcJp9RfrPP8QjZiEjehxZ
	MfOWCB3TTh3/XuCIJGpRiDxCT/ATrvD3eYau8obW8wl8gI3QdYmdvItTBukW44TUw6ThQwjmHxI
	mpBgv5PusGptOJArYzT9Bc84KLRGDD7FDTqXvwO7b+0d/VcykCrVmVyMly4R9hd5B5gZFIFmQ9V
	Llszp77ZelpXfXtQ1Q
X-Received: by 2002:a05:600d:6414:20b0:488:a502:8955 with SMTP id
 5b1f17b1804b1-4909c116917mr137259915e9.4.1780296987555; Sun, 31 May 2026
 23:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531-veml3328-v4-0-f9b65d71d917@gmail.com>
 <20260531-veml3328-v4-2-f9b65d71d917@gmail.com> <DIX3Y0PCFW9J.14RSKP23REFBO@gmail.com>
In-Reply-To: <DIX3Y0PCFW9J.14RSKP23REFBO@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 1 Jun 2026 08:56:17 +0200
X-Gm-Features: AVHnY4LTHat7tTE5D1RjIqkHLfa1fzh4fC6JsS4mAl-GXhLn9Voa-V5QUOjJkfU
Message-ID: <CALoEA-wtEVO0+GaabshH03FLGBJu0JkyQi_FjSETzcAySAKERQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] iio: light: veml3328: add support for new device
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 May 2026 at 21:26, Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Hi Joshua,
>
> Just a nitpick I caught on the fly because it was missing in a driver I
> recently sent as well.
>
> At least linux/mod_devicetable.h is missing to include of_device_id.
> Probably that's the only missing header, and it could be added without
> sending a new version, but that is not for me to decide :)

Hi Javier,

Good catch, I completely forgot about mod_devicetable!

Thanks!

-- 
Kind regards

CJD
