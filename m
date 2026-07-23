Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E971476681
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827623; cv=none; b=SumwcwCD9tpPu5DsX4S+Pflc2SwsZvHnvfru/1r8UO4IbiKIHtsSPzFVzW31g+xrI9OpvmdVxzhhi4WQz6bLVMgzYb+UlECMtFRfRCbfvZNV2FVACSvbuC7rWbIuMrQj+wQW6pTCf1eI0kW/lPefMnC8IXGjHfHNpaTxCciLaSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827623; c=relaxed/simple;
	bh=+VA14SVQz356LlYHLAhZ+li2aadA95OOjpAO85Zzm94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzmOHtTTogSkqMXgbHAJ+E5+TFDeJQhInhgYNqwmHP5ubY3LbjFqC6s76ZQHG79aFea5nyR+qjFh/HXEyDhw1EAvtkVsH5JS/mTVkFbqz7fIRPl0sLql/mkYr7OrRzW07t8vbiDsxn/BKn7LJJjzAKTugp2n4tDBprlo62LnNEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEzTkdjs; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEzTkdjs"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f703a9d05so578660f8f.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784827620; x=1785432420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elNnZUfys+k4IsZdAhGREqHqvHAojuXZZ8zR+tYCV30=;
        b=SEzTkdjsH04WXcO/eXFXY3fVWiDamrNZlSe+KUHqhlvVkmjIPqXkeeHwz7Ha4j3hQa
         dPS4QC2FW7DX+LvR76sIc4WoX0Nq1VhN1mcZFxxmp1DjmTgIChcJ8sFdEzlGZ9xW2EoT
         XgXa0FO3i4xMLOkGi1Cn5Nm/2ZTg68bbFYleM6IaUzv3Ns7925hRl476EqvA5LgXzXTz
         M+E8iglCRHfQyFlVpUhZa76eu2+52G505gPMM/c3wUYdQiwPXbdOGLf6vJ6W//Zqw+hQ
         8itwlffwPsRq29/XoJ8aYTKFHsR0AZuQVCMyeViI9F9fxgwgPUmHVUkMECsaV+lvbJKZ
         /OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827620; x=1785432420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elNnZUfys+k4IsZdAhGREqHqvHAojuXZZ8zR+tYCV30=;
        b=Syw5OB6tiqPEgiBTeq7XH5eE5oRBnWN8cM0AOWiBPXBeberGgWVA8GJp6Mj3FfEVra
         lG1D/DS7P2xJCbkWxLeXXYJeBgcpnFybVLmD7bkFUMO9iQQHEFVUrOOHVxsmQiCA6kIc
         ldr4sxAtZ7TxofTyEUxqlONMUfVChLsOGgcgMAyPMQsb9U1GPEh4tyFg+90oRJ6/fpNX
         s435+MXYVfSSoWvSzsmmUBN7PpWm1VhjjDGqXc3iw3JjQDK+kbku4FCMCXyJrGp6x2yC
         OPxC1LDj7J05OLTgMbxCm5+JLsdnYPiZ++VZGmb4njsFwo1HO5jFlIgwe9gCE6I2uCKX
         sKPw==
X-Forwarded-Encrypted: i=1; AHgh+RoZ2dm+jnhBJwJDXR9MqWtjwLQ0hR/DokHF5ijLzXLNO4rWqNIN7hskYOYunKT4hJkM7niqcLJPv88S@vger.kernel.org
X-Gm-Message-State: AOJu0YyHekHDhmNyuYaxmfP7veJ6Moalr4YfYZIewkHu5FByCynWrmLY
	mNoF1exfPxxdm0WipQnK0+kdbd/tqJf8c/UHyPD1vC8wVC3gRAjB6iIP
X-Gm-Gg: AR+sD10TcwirysapLRJGyd5ELXdUYP866kDRYFyh6PfvTfJGSi4zVT3PBZLdGHIcu2k
	SDZ9OonKfMvZubK/CCHGWW7Mr8niTdfCELiE1bHAAC7mR9iDUKlzDuasasxaU1Oo0PUAiCQbLIf
	wfm51sJo35z7TsaI+/hBzNM0X/2NpImPi7UFH5wGyQwNOSXAe4cOFG1OofTWhMF5C+yG1ozJITT
	oG9vV0FRNquHBR9IFsadXYncmZQ1GgPOb0ceK0hI9uquUFdFHT3petWvbevVT6fM4I5UYZwcHUQ
	oh+Xf4AJKE6DRhlY3vtZOYjieAmbwpzOC+5BUfRNMwpZeZuvxxKRtPiCE4nbEVPcJNTdRv5srxB
	CzmZfWWRB6Qz5m6R9uS/3aWShOLGZ+j1FjSseIcTTJEhqcJmmWrhP7cNYdIs8ZzX/RIB2vLrDyI
	f1chQICoykigkPkOg=
X-Received: by 2002:a05:600c:524e:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-49573c8d44fmr47076895e9.2.1784827619498;
        Thu, 23 Jul 2026 10:26:59 -0700 (PDT)
Received: from antoniarch ([78.212.250.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6a14csm7615325e9.5.2026.07.23.10.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:26:59 -0700 (PDT)
Date: Thu, 23 Jul 2026 19:25:13 +0200
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: rtc: abx80x: document ABX81X RTCs
Message-ID: <amJNgGCVCmHtAx_N@antoniarch>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
 <20260722195814.298552-2-apokusinski01@gmail.com>
 <20260723-briar-hut-82e980e9996a@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-briar-hut-82e980e9996a@spud>

On Thu, Jul 23, 2026 at 05:44:03PM +0100, Conor Dooley wrote:
> On Wed, Jul 22, 2026 at 09:58:09PM +0200, Antoni Pokusinski wrote:
> > Abracon AB0815 and AB1815 are RTC modules with SPI interface.
> > 
> > Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
> > ---
> >  .../devicetree/bindings/rtc/abracon,abx80x.yaml   | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> > index 355b0598411a..234a103724b5 100644
> > --- a/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/abracon,abx80x.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/rtc/abracon,abx80x.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Abracon ABX80X I2C ultra low power RTC/Alarm chip
> > +title: Abracon ABX80X (I2C) and ABX81X (SPI) ultra low power RTC/Alarm chips
> >  
> >  maintainers:
> >    - linux-rtc@vger.kernel.org
> > @@ -21,10 +21,12 @@ properties:
> >        - abracon,ab0803
> >        - abracon,ab0804
> >        - abracon,ab0805
> > +      - abracon,ab0815
> >        - abracon,ab1801
> >        - abracon,ab1803
> >        - abracon,ab1804
> >        - abracon,ab1805
> > +      - abracon,ab1815
> >        - microcrystal,rv1805
> 
> No ref to spi-peripheral-properties.yaml? Do you not need any spi
> properties, e.g. spi-max-frequency?
> 
Ah yes, missed this... Will add in v2.

> >  
> >    reg:
> > @@ -96,3 +98,14 @@ examples:
> >              interrupts = <44 IRQ_TYPE_EDGE_FALLING>;
> >          };
> >      };
> > +
> > +  - |
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        rtc@0 {
> > +            compatible = "abracon,ab1815";
> > +            reg = <0>;
> > +        };
> > +    };
> > -- 
> > 2.55.0
> > 


