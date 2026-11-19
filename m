Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099923;
	b=S5lml6Se9jqP//6XAY9L6LkpZKoueWYzk6oRYTWRxfnfI06Ww+ztwNhgGq2AuePCit+r
	 Wf0c7T96DysTAmylWTnEIPL99LYXB5H1TjRfaRPC5pfRnbsx9jIGh4VdVJv4kwqiAb1N3
	 rPgO0rYyApUIcLLoJmoCJ0M1dEoyVQu84UWgucHyzWhuxhPoMFpLNBjCF2RlfjvJ4YD0x
	 XLlv7+cMhZLoM+OFhrof/dPXqpgGuh2CvRFn4mGPsnKIB7WdaRV9BD8TpQs3Tx4eJngYB
	 pASfnZ3Odd4STI+Cw+gXEIDKfrWL8wjCgtkpD05xcu4hpTTOmDa9C4QlcmFlj9WUgvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
	b=AR/CuEK0CIJpoDfSZLSJgYARCbg1iRXxlQDrZFG2kdGk64mFcgMPp27i9oAu8wnLbOVA
	 8KeIcLPXh74kQbLrdSVPuNWjkzPkI4muhts+qKgt/SzO47D0xtsPiNJceX4FKptxy366M
	 LyPQkRnkTStnG5s4sGcPa0Lo8eZWpM0F/fQrquq5eFsVVLtVTnbSHlQPQjLbH9U7ZRkVU
	 92TXKNJszhxSh90t9gsj/PueUJkA8JAWqcsWXKuwRgTmTs++cZb2LSPT1o2OWFgESM+S8
	 O78ZDajb0NlhKoQi5S/g2FHjUbiQylozcqn4VlASGpRE1W2yFptEAda3Evo9Rk57Kvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K33iAVDr;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471E606BAAD
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5471E606BAAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K33iAVDr
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7777fa8f1ccso864572137.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099922; x=1795704722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
        b=K33iAVDr28WuDqdsKQ7c6BaLdM9PoKWwfFp/RVmBN2ruREIvpWU/CcVciG2GuHy/XY
         XOGuT8cyqW2Tr0sBsK3AEPFxOW1Tjq5imWBh0v75DOPsRzT3H+UFzClalx3Azancgmrp
         A/wMT/ychNoVIhpGSgg3HskeSpanL20YKxOLgu2dEcqlRReo2X+2IS23fygsWrx/pS7g
         gQkKP4lZvrEbArMfchoiO+q9vIwcMFnjhqR6+PMZNCtpvEwUnmze5zWfKGVUKHdKipUA
         F3cVE0JSC618twvZ2hmJq2c4HgvBPqc8qdngMWU8t3QnTe3soWwgSEMFi+/LjI3t2ogA
         avtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099922; x=1795704722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
        b=iEvEHG9jnmHL9bb7DXL/Bce7XYg1kOH1p1MeIKBs6XigHUBIXYCgIt5/BiLE3HmhY3
         +rX+pzTTJyccV7BDDbWihTiOj9EugJ7nTdxp46voR8JPNU9sYUq4aRygJHpc+kAxY3nN
         yTTMDSHCX8zxe/Ff5D2lybN1v6ZrRkgGnu1ZIyb7fJQS0pUEyvTmEf0UQdFEFw7P7gcm
         RYzEYDyNor3LCZuToNR2wgfVMXFyt43o9whhnDLmJweEaCCt3arYbPolyn1RNqCnKo/3
         u4moeL34AS/QAYUW4UAc1mutauF1AdScDZJ2QJYXHFOQH21XB2JCGYJ+2szqmosVw66E
         S2Ag==
X-Forwarded-Encrypted: i=1; AL+hErHyYBDnHLktQo87HywHx9Z9ar43E2wMR2E/cgDEC3AnOp/WTs5rG/HB0h0Mr1Bfw+nzjnAIirD6jcut@vger.kernel.org
X-Gm-Message-State: APuU4Z+BgSGdG5bi8/p5ZKJWQHxJNpK/lS9iIYKZ4ik/O+47PzmCs6nO
	GUuz4OnExKZQqF3D1b88dJS5o5wdkoPPClfppkj9cM+RnTJDWE/ZHzQ6
X-Gm-Gg: AYBFou28B5wdQAQuINgreJm0NwZ2aWBmQT2bb7B4fCm5fcSdVaH6JZ/pI69xeg9A5Yf
	aO28nwGs3oAjhJZBkVSA1yDR3KIX0DBaal+nU4ido0qeIvmoanfJ7XPmM8JQ+Xr52Ct2IzLoChC
	iocQvEb1eEzDByk9V4UNZMp2X3MS0BDHSg+51osBox+aTPEDP0gHzPlxeAzpYM+uTTB1GR4a+Vs
	EkOoxwnyv5Gok79x5t9eqO+f+EKeMk2gNj/c+fA9EamYUuaQPId+AntsdzNxZuNOIbAqMSVQCOl
	szNImBpjI9v/GIeiYjgrFXlmQuVqT+u6rECFhIG8jF+zokQ49HRAcY1Gz/KnLLyy+4PgKeEWuOj
	3lXChJmAi3dOkQ2utvoK35HTjR82uwCiitvZ7YQHzIORrvc5jzbgzNUyDUUL382H2D6AlGN4ZN3
	PEjlW3J16+eFPYPF7iHnngT0yeQwlOp4/Rr4PJNvp+zdlvWGPGJwEKKTUKRXvuSLPVjFd79bXxY
	KWaQBKCEDn21Pn4TtN+lPtJZ6iFrGTNfJXOnk+5vrooY6K1nukIUeTn+uJnkVJD3xE35A/ecxX+
	SBbkN1NHnLt6T2fT17EFfvwngeq+j6Ar9Hxj
X-Received: by 2002:a05:6102:6044:b0:7d6:864a:5509 with SMTP id ada2fe7eead31-7d6ba43b12fmr2019264137.24.1795099922016;
        Thu, 19 Nov 2026 06:52:02 -0800 (PST)
Received: from localhost ([2804:30c:914:4500:cd15:65cc:e2cc:7363])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm150070241.4.2026.11.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:52:01 -0800 (PST)
Date: Thu, 19 Nov 2026 11:53:26 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux@analog.com,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v1 4/5] dt-bindings: iio: adc: Add ADA4355
Message-ID: <av8NZpVuodpXM7GU@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1795003864.git.marcelo.schmitt@analog.com>
 <c7be62089d2b54dbf7fb57cdea189bdb1cade7c5.1795003864.git.marcelo.schmitt@analog.com>
 <20261118-liver-decompose-434eedb257b8@spud>
 <20261119025950.456dc645@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119025950.456dc645@jic23-hlaptop>

Hello,

On 11/19, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 17:39:46 +0000
> Conor Dooley <conor@kernel.org> wrote:
> 
> > On Wed, Nov 18, 2026 at 10:04:13AM -0300, Marcelo Schmitt wrote:
> > > The ADA4355 is an integrated analog front-end and 14-bit analog-to-digital
> > > converter with a serial LVDS data interface.
> > > 
> > > Document how to describe ADA4355 devices in device tree.  
> > 
> > Please explain why the 4356 differs rom the 4355 such that it cannot use
> > a fallback compatible.
> 
4356 has a different set of selectable input configurations that leads to a
different scaling factor to get to milliampere units. A system with ADA4356
matching/fallingback to a device driver only supporting ADA4355 would get the
wrong _scale from the IIO device driver. Users would not be able to accurately
read data in milliampere units. ADA4355 cannot fallback to ADA4356 for the same
reason.

Will provide this explanation in v2. 

> Also mention it in the patch description!
> I was briefly very confused at Conor's comment :)
> 

Thanks,
Marcelo
