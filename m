Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0349A3B4
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842601; cv=none; b=EbvoH2MyEOqyF7WJhPqcci0nLdeWPzs5YPZoo/xw1p/E1G5zJMgpEUMySwBWlG2sdBd28IfDxsQ1aEm9Jq2zc1MhY0rvWPP+z6U2ypXUYV8/qZsV8+B/X/nF48dSsMucCpO79Go4NFnpxPlxFH+Eocb2gQVwxEIq+j5f99SFHhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842601; c=relaxed/simple;
	bh=ccgkcMBRb8nQz4mhj6wRp6JfLsMEvJb70e/Z6xow5TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqhYZR+/08jcGU/1ezbdlHWO9/Wot45AQq2aTE82c4hcGGUKgYfD4AW/rarRehphZBLCZs7GgVjxdSihtJZvPWPEyiVA6ytl+NGktrgT/iXaxA6mroP6lwvzID36ByTuqzG4hOPGRGu5aAbNHKhE7nxQwyKQvK+BggvJeObhS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFtjTjSP; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFtjTjSP"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-354ba08cfd1so4076050eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791842600; x=1792447400; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJs555dn0Hiily+4pUme4Llz0sW3A4Uyn/JQ8PM2fk0=;
        b=VFtjTjSP7l5j2UcUmy2yqHKzg8gTccWrP0jJemfQwFfn06TW4iyHY5WMXmn7P+AIJk
         kUNE7hgjFnseNrDmb8lgxKixeJYIHpWkQYbsAP1AdG+xq+otdvPIjfSi9RymNG4pT3R9
         8Cx3HuYUlzgpmenu8TGnfNRYAB+Zuc2kWxKvtd9vYpgzsg8ijLqtc87EMQqqte8ARNpL
         PQpXsD2pW2OZyOGQIGW6MP8I2gE5w9mSWG/iHACrR0NFvV589dijuQ+1Gv+Bb+bHZgJT
         b6OAZRyIqIRPHcPZiKm69rw9uOoub5GHceZGvLHxs4NDYs2j0fDgjZ8ZPkD7a6pWSwct
         VIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842600; x=1792447400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJs555dn0Hiily+4pUme4Llz0sW3A4Uyn/JQ8PM2fk0=;
        b=0bQXcsLOyCJm1o/CLWNAMgx0mUidOYoOlYDgdqeiLfIdudBYNw+u8Maw0X4+rcSb9D
         7Eczt8e8u5HbGxvcJLbS5OltIj1/Pt+wUpMHfhoETOVBV7n1gmMyCcg27wjbp7knDwDV
         yTahR5NYJjgtxmsVFkB6DHtnUwvi8se5APc1SmzrYPDZ+kPtEatYFTK+mVtGxSpMkDoQ
         h8jyFm6cvIYrw/xsnC9z173oqfaPRL50Wn0PGHU9TifH6QumicCxrN49/K8r/7IOk4ql
         X3wu2UYdMsr6njd9uEPfzmlMhORs+j1WIqZtRrf1vfpw0W2b2q3MXy05luH3TWvkh7aP
         9+iQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1NDSnKeMLMyp+N77Wsys7xuZU+Q2qxFyXm44TZbtW1KulPYNx3TUhNLtWpG3m5hNV4wxdz+CxMB4z@vger.kernel.org
X-Gm-Message-State: AFq9FYKrE4wT65qGbViXbXr3H3ekJcvLbao2JRL7P4MTplgqIUNQ+jv1
	gZ7E/be6SoWxXdJa/7mqdmtpofd4kB5nv6EllXNbUlg1Mz7gFG4vWDJz
X-Gm-Gg: AYBFou0I3d0Z+CpM8E28xRYDZ5/PdkkhV259p93zZNBTn7k6G0QkVsWYQP9m4GvtDL1
	Pi1DF5UkUqZg2cHXQIvOs7DoVyrKJEDWn3FUanDePDfrTNWV14rVM1AC2AhbR3crxjJkqqDPUM4
	iHsMoCSlXsTnXJH7QacnrcNJxCruAcUU6gz77S3rFirHkoY17N8QE5NPX77obXoRAJ4iIKWRaEm
	Ki2Y03RCONDz7ySFnGlgDnJzh87K93rc1bkIQUlpaMRrb7ev9WwI7Im/HdOdYZoct/TlBTB0HGJ
	CLOdHRNNr/K7a8QkoteC3u3bv0vNY19VDjuII2kkHmmt65Mq0eS5mh6LWKeCeMEjfN++FU1z6/x
	/OAoUuEJgxnou0ko+j1nG4Qd6YON45Mar5XilktGb8WHakW86PGgyurjxJGMoHVyNcvhnH2c2eE
	Y7g6oEqLg1pMKrWhI2e76GueyKzAfKqpbAr/j1FcvbUVeD5PbfeO4la4nrL1Lf2XvzayVl2lPWq
	+vm3Q==
X-Received: by 2002:a05:701b:42c5:20b0:151:2e62:fe4b with SMTP id a92af1059eb24-16a5c8d48ecmr14556937c88.23.1791842599340;
        Mon, 12 Oct 2026 15:03:19 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm31002276c88.10.2026.10.12.15.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 15:03:18 -0700 (PDT)
Date: Mon, 12 Oct 2026 19:03:40 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kanak Shilledar <Kanak.Shilledar@axis.com>,
	"andy@kernel.org" <andy@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, Kernel <Kernel@axis.com>,
	"macromorgan@hotmail.com" <macromorgan@hotmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joshua.crofts1@gmail.com" <joshua.crofts1@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jean-baptiste.maneyrol@tdk.com" <jean-baptiste.maneyrol@tdk.com>,
	"dlechner@baylibre.com" <dlechner@baylibre.com>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jic23@kernel.org" <jic23@kernel.org>,
	Henrik Grimler <Henrik.Grimler@axis.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: iio: imu: icm42600: Add ICM-42670-P
Message-ID: <as1ZPOocclBgYkko@debian-BULLSEYE-live-builder-AMD64>
References: <20261009-b4-inv_icm42370p-v6-0-e53884f185ff@axis.com>
 <20261009-b4-inv_icm42370p-v6-1-e53884f185ff@axis.com>
 <20261012-adventurous-corgi-of-fury-01219b@quoll>
 <fd4181c7e2f48e3c64530340ae1a02adde1f342e.camel@axis.com>
 <da8b6047-419b-4c3d-8416-e5c871ea4dec@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da8b6047-419b-4c3d-8416-e5c871ea4dec@kernel.org>

Hi Krzysztof,

On 10/12, Krzysztof Kozlowski wrote:
> On 12/10/2026 12:43, Kanak Shilledar wrote:
> > Hi Krzystztof,
> > 
> > On Mon, 2026-10-12 at 10:58 +0200, Krzysztof Kozlowski wrote:
> >> On Fri, Oct 09, 2026 at 04:12:06PM +0200, Kanak Shilledar wrote:
> >>>    It has a configurable host interface that supports I3C, I2C and
> >>> SPI serial
> >>> -  communication, features a 2kB FIFO and 2 programmable interrupts
> >>> with
> >>> +  communication, features up to 2.25kB FIFO and 2 programmable
> >>> interrupts with
> >>>    ultra-low-power wake-on-motion support to minimize system power
> >>> consumption.
> >>>  
> >>>    Other industry-leading features include InvenSense on-chip APEX
> >>> Motion
> >>> @@ -28,6 +29,7 @@ properties:
> >>>    compatible:
> >>>      oneOf:
> >>>        - enum:
> >>> +          - invensense,icm42370p
> >>>            - invensense,icm42600
> >>>            - invensense,icm42602
> >>>            - invensense,icm42605
> >>
> >> Why aren't the interrupts required?
> > 
> > The interrupts are only required if using the device is used in
> > buffered mode. Which will be added later and the dt-binding will be
> > updated when the buffer support is added. Currently, the device works
> > without any interrupts.
> > 
> 
> That's misleading or confusing. Either the device works or does not
> without interrupt hooked up. Consult hardware datasheet if in doubts.
> 
> Driver support is different thing here and you cannot make it required
> later, because that would be unjustified ABI break.

I looked into icm42605 data sheet and saw no clear statement about the interrupts
being required. The timing diagrams only show protocol specific lines and it
looks like the interrupt sources can even be disabled (not routed out to any
interrupt pin). Maybe I'm missing something and the interrupts are required for
some sort of reset function or so? Otherwise, I don't see how the interrupts are
required.

Kanak, do you have access to any of those other chips to test whether they work
without interrupts? If possible, can you also check the data sheets for the other
parts besides icm42370p and icm42605?

Maybe
  - if:
      properties:
        compatible:
          contains:
            enum:
              - invensense,icm42600
              - invensense,icm42602
              - invensense,icm42605
              - invensense,icm42622
              - invensense,icm42631
              - invensense,icm42686
              - invensense,icm42688
    then:
      required:
        - interrupts
was a documentation mistake?

With best regards,
Marcelo
