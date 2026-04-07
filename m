Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066740DFDF
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 04:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775537345; cv=none; b=RBs5TDeHYKxe3DNftBPtufPf4PzSH9uGSwL4JVPyLKChylsDhmozubzXPwYPZ0DScnJXAZCuorulkoLuY8OOs89QUqSMLNFREjHhSdYVLp5nt6hURrS/9mjdgOS9i1wYzIDw/GRiiNbqYe7ay/G769Zywhy99jRPjCHy0S7789E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775537345; c=relaxed/simple;
	bh=KN10ixWyhSiQO6k2rgognDXtkp2e3lun0UE56kDb9Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbiJ8atHYyP9ah4Kynf0KeOqbin+qqzN1zs+KLCsez87GNdrRFtSO9r7dPjaDFDYx0lr67OvHqxLBcvL2Ez0QalEVCmiwfV42IXGfBqLKeoySgKiquENiaStoRBNAMlTCUDh3kIJYRZrGYboSMvbJOB9otKUxnp1St3efZZHsoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N43ZuFzD; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N43ZuFzD"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so5309567c88.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 21:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775537343; x=1776142143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gk8b5C5Z9p7AhhgVp7PgvI/D1cC78P2Rxt1Jreg7P9I=;
        b=N43ZuFzDCEkb9OyW8Nnts60N57hAkqcbfWr8VScF7h3HdB4KisYXKuxvfI6di9MPMe
         oqcI9fRx1gZhU5SLzSOrYVDf4NtDLjolzk8TRFXY7UkeF1n/v6N3BKBty91tOQ9MRM6U
         uEnKu3KZUa8xyybdb456yrEeFexW1Oy4QZvdnXTibWx0nBzxNvT3RRb29pqJgK/Td5yW
         M2T3Nu/Z49pdKoe+Hmei0JjvVEeYdb9bkzB7/PiEauce5sNlPCrEtSOLAxQB2nSIvrBR
         bGHx9+/JBQ6mS/03bfSfGD1VlnMIcu/zfTxlUqwtkxsrqf+bWqZshJ++Sp3hJN29HwDe
         Fs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775537343; x=1776142143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk8b5C5Z9p7AhhgVp7PgvI/D1cC78P2Rxt1Jreg7P9I=;
        b=Lnh83dB/b0qortgSpjBAMEKRpy61XUJ6j3mIIO6YDB7sWcuVqjNtCxuL4k+PFF8Lc/
         AGJ3fPIglYumNHNOJmX5FvPQcuaAeOAhkoGkZzwIdep6dOKmsscsODGC8xwFud/9qU4u
         PpW7gzuAEXyR5a4TEzx6Iob5lGPG3iIYWra1oKIeLhnXn4wxuuOg3xhAvIQjuxu0gYlT
         3647F8DkkNUkblQLuseDHmTtvQb/191l2k28x+CGHZMSUBmjc33KXIQqg3hv1I6I49MG
         D3IVq8BFVQ6x/uKCTu4pQgUUbVCH21TbTrMhaEaTfFc1hczxdSFk7+v5ZL6QjoP0jVoK
         sYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAF9GlAXMzzs0DQ+ZTFIws8OCXmWGNype86T2ytE6URvQs2hW8IXAVgBJrxpFrQEGjc0ETqFI7rIIm@vger.kernel.org
X-Gm-Message-State: AOJu0YzITTYCOyWrvAqpFGrEEiIM3f89a68IIinfhOsLYTWeGgapyzNV
	t0zoLoQas3s5wUG4IXoPBHB39CubXY686TBvNM+4b1Fk+L65zC+U4lPi
X-Gm-Gg: AeBDiesEC/GhLSoA/jpjadDXlEIEcNvU8a7QgHGeV2Em2MiazvsvwDpBZ6IOk41ssN+
	E1WFrGEZpIRbB8ZBlKwVk/XqWsJ8AKZdVfpwsFn+NIwmBekrBiF2/mdrXkSAZ32/B6MiztHPLN7
	RpgC5rCkdRsD/onxbKSWT722M4rxvbKRlU1Z/HxUgYnFsm2/fI3paFwq5iYNKyQQI54wwP1pmoA
	u78MTu7yvdjCOTYw8QYlTz9VOkQCorM6OKXBtrAYQ8NKVaFEsMk0fXr2aT9sXAC35ZqV6OlErat
	37zyBFeXr1ljY8vOdRFwgw9kIol9fpJg7h09z3+jBpVVRaf9dC+cPgclnl6teFUxdvaKysxz1fP
	C4pqH+Ta8+wL/MwE0ZDuXO6cm+IFcM5LqPgFVPR4keFK0JWgPOSKuDuu6Ib3Vr42EtnEaDiO1Uv
	FGDJt//AzLREQqxEQNhVTg3OHAl9HjXdakMMIQzOuxKPzIqDmvArcdULhuk+TTJUN6n4uXAwZaP
	6M=
X-Received: by 2002:a05:7300:dc88:b0:2c5:b23e:48a4 with SMTP id 5a478bee46e88-2cbf69984ebmr7281281eec.0.1775537342525;
        Mon, 06 Apr 2026 21:49:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:dd71:7176:b4e4:a7a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ed3sm14644119eec.6.2026.04.06.21.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:49:01 -0700 (PDT)
Date: Mon, 6 Apr 2026 21:48:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Casey Connolly <casey.connolly@linaro.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Message-ID: <adSMQXgbco8fvRLo@google.com>
References: <20260324-synaptics-rmi4-v8-0-2168d2df68f5@ixit.cz>
 <20260324-synaptics-rmi4-v8-1-2168d2df68f5@ixit.cz>
 <acLpBXc9Qi5riQO0@google.com>
 <5630a4af-e18f-4daf-9b04-ea61091d9e51@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5630a4af-e18f-4daf-9b04-ea61091d9e51@ixit.cz>

On Wed, Mar 25, 2026 at 12:33:23PM +0100, David Heidelberg wrote:
> On 24/03/2026 20:42, Dmitry Torokhov wrote:
> > On Tue, Mar 24, 2026 at 08:40:34PM +0100, David Heidelberg via B4 Relay wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > > 
> > > Mostly irrelevant for authentic Synaptics touchscreens, but very important
> > > for applying workarounds to cheap TS knockoffs.
> > > 
> > > These knockoffs work well with the downstream driver, and since the user
> > > has no way to distinguish them, later in this patch set, we introduce
> > > workarounds to ensure they function as well as possible.
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >   Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
> > >   1 file changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > > index 8685ef4481f4a..fb4804ac3544d 100644
> > > --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > > +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > > @@ -18,9 +18,14 @@ description: |
> > >   properties:
> > >     compatible:
> > > -    enum:
> > > -      - syna,rmi4-i2c
> > > -      - syna,rmi4-spi
> > > +    oneOf:
> > > +      - enum:
> > > +          - syna,rmi4-i2c
> > > +          - syna,rmi4-spi
> > > +      - items:
> > > +          - enum:
> > > +              - syna,rmi4-s3706b  # OnePlus 6/6T
> > 
> > I thought that all the workarounds will be keyed off this new
> > compatible, but I do not see that. What am I missing?
> 
> The compatible is used for sequence in the
> 
> Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes
> 
> where it is used to provide values missing for OP6 (and possible others in
> the future, when added).
> 
> From my understanding the series, only two patches (1st and last) are
> specific for the OP6, rest will likely benefit various TS not implementing
> full Synaptics set. All measures apply only when touchscreen reports
> something wrong.

If the sensor does not implement RMI4 protocol properly it should not
use rmi4 compatibility. I will not apply any patches that work around
incomplete implementations unless they are triggered by a dedicated
compatible.

Thanks.

-- 
Dmitry
