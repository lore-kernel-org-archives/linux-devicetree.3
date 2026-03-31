Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506C33120E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975597; cv=pass; b=jkCfkSV5n9wnaaoG2eTq8aIwj8wgF+TakXa4RqdeKzaY9SR9fTYWfU0GpCwt/SJ2HVn4qCtNYL2icZiHxtY1u2KZAiKqMrpFc8tBtHnibzzdAgeKHjwQYJHX8ntiWzHWhQtGTXhU9UldByx/jZaB3wyY1sZhcX/oRPmljwzOkKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975597; c=relaxed/simple;
	bh=HzYbfwAcPnd0HwHQXnUiS/moFgAvTCCmXeteH0hKD9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoFdDTeAAf4kqlQkv18cG8bDJzIP3m5u31/MWzn+16fi4FubO1K6S/3cwc5OL4Q9ysV9DQRve7/k4FEubeHfqOsv8mWgS65L0BzMluFbZWgEvwJ2gF6OaP6O69dFWRDRDCmhj503Kogz3lRPJENLWZAs2VUBKT+JW6W9A8uxq6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=HAN7d5g5; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="HAN7d5g5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso10562864a12.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 09:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774975594; cv=none;
        d=google.com; s=arc-20240605;
        b=TRNCP2qhKd1ma3rCKi3fK4EhUGFuNuNDcrFc/69qmF0K3mX2eB/6c2xY/tH1m4NZT1
         CHLHOINtL2LiIKrbQOkHGxWmemULMbALbPBvDMg/1QkXyi9BrQvWp7jYqPvSrwOYI6EA
         3jl6b7nXXSdU/q4B+W51kew1W4qKTgUxG1a6scysGcdeY1rHHR5ig0awM1WDUCZMihZr
         Rx5B/oscpn14QireT8qmmepku0MDmX+lWaNSlUkheqXTDAtU4u84I7hlOybyZm2dNCSS
         EKwkWlZK0nTEtKAQnWmD2Wrpl8H8wq1qLTWugFudJH6uSI0Ys7uIGd71j6Wv9Lr3SrVg
         Co8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        fh=km9uLu+o34v/SrmXdLbdkP5Su5zzLA6zrvzC8LqAclM=;
        b=VRTmvRruVmVe5E7O46DcAHGkSmpQpsc/LH7fOVKoqdWkDLv3ibkYg6dZxMExIfVmiZ
         jQZhIgzK8uV8VirCVVqJJrZzoa/GHdni3XtWBP1d5z/YACls43w5RSE1ireQ6eetUeMj
         pW1c0MjxldDlP75XVKGipr2JBD06ahvByv9ifh+qzsXwM9W7Gby9L8nHOPocAUAvgS7G
         Bup533EBEHfsiWOGW5mzAk7kpj+pNM281B+PWTNbjK6L2PmdOU6otvOXkDxx69UuXN8f
         ifxWPeDlr9JsHHKSLATBLuaRXtf1sIXwMpnh4KaT3wvXLG9NT7wM3YVy2NrE5E4Jl9lF
         AU2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774975594; x=1775580394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        b=HAN7d5g536a8S0VxiVaSJhnocvOWPgJz4QXT9mKjHfILmlk0n1JmX7+w9uliqNKJfJ
         drSa2dlqAOE7nhnd/oiGwyYXKSaLsqAR+pvGSCFQwscDx7xc3ij3ggoFPhkJS1I2duSm
         ky/IErQoVqvLO0xh0H72gaQOqNIDq0lOWvSCOKxA940Lk1aLvxvAhZgKTYFjrSnw0n4S
         6al4rGxNQnI54F5DbzRRinWotP27yclMVMw0FyuO9FaAtoCRgFcmRYGWzEbl51QyDLUl
         bBswKqQIpvJIVKyFQJhj6fgl2h5zr6vQ5yJUfczOk20k9wRZ2rAqTpQoQWt1RS+bjMSS
         kg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975594; x=1775580394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        b=iiLcmDEHsolfQQ64eN5Sn3X5SZ7NkTspbH8LWsp7gj17RJCtRprTmN4/jVX+X/2ixP
         eGASmVFDeoPiWKETNAS4XpEYE7tBV4+vfWDnQXFesT1ndEtGX/Z1vh8OCISE4zFPj2rD
         lbYjddxWiOUrkAsPKZLgo67jlc3RPduY+OlJvMbMJx8pl5MCXFaMr5SoDWh8WkSotVaU
         IvR8LmsT/g79GgOM2mQdoSCmPRb0CaqykaKHaby50SyShlOVilmoqCYym3QcC62Xj2qf
         EJXWlKT6mIUYpM48PBjZXRgJ/PdgrTp1DWwbpHqw8jsjoctcyMNnGpxqkjpQGiE0EK+D
         qLWA==
X-Forwarded-Encrypted: i=1; AJvYcCWHhgknq5wtsNvqrJlQV2D27Ph/ztojz1JSS2rJgS0kTCGYOFB4/RK1gtUopKrKpvYXOSnlxWZP9wJn@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNo0FHxzsm5048WQdfHKYLTcmXXhXWBVqaPQE9OmqPYhN5xyY
	UseSv3Dma+BIWCwXSE/SD9qVmu00h8rHiKOdIXPxJR46Bgtzs43zktVpd8X5ca8u/sFys/opIO/
	Af3itpt4qoutvBsgDNX6lOZiG0u+xmESRosKFXj3rwQ==
X-Gm-Gg: ATEYQzx3n9HQJNO3QGaTkeaF4Ox3u2J5sKFF1i/Qk3dd2rYdxguyV6Qmqw3DHHkxVJl
	dNWvlBcY+mdVNhMzStH3t7XjkxCJRJKbVyxfliGuo4Oy+6VeZAfyu+90JFEbks7uytxIPP59evh
	mQM9cu5JDXclgHuBzBaoHTQrsITCM4H8QC5X4Hvyyw/p1JhfxVR+fOZLc/VH8g3JOqXD/2N0YeJ
	rg1/OLPVK4ylpJPqF25ZqOPPMz/LZZjdOdWo4IpkfA/qK5ohR7lVbRzWi1TM7hEewDezdBele/A
	efs0N7E=
X-Received: by 2002:a17:907:d854:b0:b9c:8da:15ab with SMTP id
 a640c23a62f3a-b9c13cb9918mr23266166b.44.1774975594310; Tue, 31 Mar 2026
 09:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net> <20260331155246.GA1299761-robh@kernel.org>
 <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net>
In-Reply-To: <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 20:46:23 +0400
X-Gm-Features: AQROBzBF6QMV9ZUgiTg9Y6ZYRCRlZXMOMlDxfEHthEBqJ9A_mQSIAoXoi4cvHQo
Message-ID: <CAKTNdwGcXcE25QiBTrZO6akMad+Lny5iPvAAAmUt6x2Hyzu5wg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power monitor
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:10=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/31/26 08:52, Rob Herring wrote:
> > On Mon, Mar 30, 2026 at 09:07:32AM -0700, Guenter Roeck wrote:
> >> On 3/30/26 08:14, Alexey Charkov wrote:
> >>> TI INA4230 is a 4-channel power monitor with I2C interface, similar i=
n
> >>> operation to INA3221 (3-channel) and INA219 (single-channel) but with
> >>> a different register layout, different alerting mechanism and slightl=
y
> >>> different support for directly reading calculated current/power/energ=
y
> >>> values (pre-multiplied by the device itself and needing only to be sc=
aled
> >>> by the driver depending on its selected LSB unit values).
> >>>
> >>> In this initial implementation, the driver supports reading voltage,
> >>> current, power and energy values, but does not yet support alerts, wh=
ich
> >>> can be added separately if needed. Also the overflows during hardware
> >>> calculations are not yet handled, nor is the support for the device's
> >>> internal 32-bit energy counter reset.
> >>>
> >>> An example device tree using this binding and driver is available at =
[1]
> >>> (not currently upstreamed, as the device in question is in engineerin=
g
> >>> phase and not yet publicly available)
> >>>
> >>> [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipp=
er-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
> >>>
> >>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>> ---
> >>> Changes in v5:
> >>> - Reworded per-channel subnodes description in the binding for clarit=
y (Sashiko)
> >>> - NB: Sashiko's suggestion to allow interrupts in the binding sounds =
premature,
> >>>     as the alerts mechanism is not implemented yet and there are no k=
nown users
> >>>     to test it. If anyone has hardware with the alert pins wired to a=
n interrupt
> >>>     line - please shout and we can test/extend it together
> >>
> >> The bindings are supposed to be complete, even if not implemented, so =
I am not sure
> >> if the DT maintainers will agree here. We'll see.
> >
> > Given ti,alert-polarity-active-high is added seems like the interrupt
> > should be too. And the interrupt can specify the polarity, so is that
> > property really needed? There's alway the possibility that you have som=
e
> > inverter on the board too and the interrupt polarity is not enough, but
> > solve that problem when it actually exists.
> >
>
> The alert pin can be attached to a board interrupt, or (more likely) it c=
an
> be attached to the I2C controller's alert pin. In the latter case there i=
s
> no interrupt property.

Alright, I will add the interrupt property and keep the dedicated flag
for alert polarity.

Following the logic of binding completeness, should I add a flag for
the single-shot mode too, even though I dropped that functionality
from the driver in one of the prior iterations?

Thanks a lot,
Alexey
