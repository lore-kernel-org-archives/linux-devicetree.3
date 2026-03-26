Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9582330EF7F
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511250; cv=none; b=HJplY3klYd/f423UdomYTdPj9LB8DLGH1PaWt7/LpMKYoRNnSmYxpKWtTa+NXIJQIALuvOb2MM3tTwXttF+UBwL6hifwjApEDyX3INPyBY6cfGEbHD3MWF/d8wnoLYxmAraNIhx8407hpPq7+lFlTXyCusVTW9px8H6GNjFsuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511250; c=relaxed/simple;
	bh=O0eARiw1G6RmntTPXYAxLsbyESCE+Ern2D5WQkar8Lo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GAAHpZMN9F/roLarmX6GgEAAJvwcv71wIAmBhlMt4CFioO991LPAiHyd23fmG25O5TvS2GNjh3RCg2BO0Y3W9TdaeE70lWBSwoMmm26W1GyaBA6iRD1bvbzlC3XsiFjoulrKWCXPmNJMhfMg9XpD9gR6h2442cnN9IlNrKJAEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTlQB8ly; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlpuwW/i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTlQB8ly";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlpuwW/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774511247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
	b=OTlQB8lyqYiPtmwramwqWPJa8xnfXgCV9GIvYY7FXLhVQQv6VATiLjSILW5ukBbETj7LaQ
	ngmKrLR+CtaVxpTNtfAaLpeu2Hs5eGPg+y5r9/9jTY1UPxFsMAdqBND3uBSD/k+EHnrvN0
	/b7ZEMDKbJHS7HMjqdQoPQQABN4kpdw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-tfhB3thyOLe2vhSBCKZecg-1; Thu, 26 Mar 2026 03:47:26 -0400
X-MC-Unique: tfhB3thyOLe2vhSBCKZecg-1
X-Mimecast-MFC-AGG-ID: tfhB3thyOLe2vhSBCKZecg_1774511245
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b4d3919e4so385998f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774511245; x=1775116045; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
        b=DlpuwW/i2APYEE+T67EIHWFHSVDVVlPHzscIcHUHCH8XS0rgRE31eLf5EfRvXTiwNv
         89sZsIVxCCTGmNYpWP4p6UTcdZoVkYLKQ4yWXCNnuzN1iwOhX75qXbs+6sS3PvlvoS+N
         9497EH4hMHXLEhIfobnEHVJoaMtWkb8H0c8pRsPz0wDUgh/WFNISKsc4FdeSbPIyRswE
         Bfp3pmPQnABe3wo69ARuGxijRJrEViEVcJ8t3Ej2HcjGBboIvSn8VWsqrYx5+fY1BAHI
         /+SbaxkPaEgp+kXBKDWQE9G4TIhO9fJMirtuu/5skHc7mfwj3xzKcaqOmr8pcSNKz5P6
         JGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511245; x=1775116045;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
        b=Fe3Kp2aMH0zH8mnQ39794cSpxQXTzmCTo2/MevJxSYPI7iYrv7eVQOyx8t81PeJeMy
         WhVDFrGcMBIrPgjsc/iWedqg6N+iWx+MxwTSTR8orLC2g8xGytElIzKTF+W67+2kPvJN
         pj4opfkthGVGtjK6somBJX/wKk6P1lVb3DoLjLlbe5Lxgph3xGw9yH6hSr/ZJK2nDJSs
         fNvx63Lg2z5BOooSLbbrkon8niNfk6v0hocm/DeH1m3l8BcCCXw+8GMyg10oStjfF9dz
         pwOF7NZ3tYlKx+h6Gha6j7OSu1EVoYO4cf36tBq7QxWs+QGgcn01n7KTWZJKC+P1ugSW
         V0VA==
X-Forwarded-Encrypted: i=1; AJvYcCU6S6x5/An8dDLxyJ8ZfabJLO9V/F/GNpjZsopSRQ2Jj4GnJbf4X68JvEZ3/JqeEksMkFMz0HOi4AhF@vger.kernel.org
X-Gm-Message-State: AOJu0YySRkss15lalUGEgnIk5ZqhZespDd4AsVk4CWioZwnuFfYhYIBY
	HCIboLZjPMZ/IATrP/JRvtJqvW2UqEesh3wVNF7WfJO5Ly7O7Z4dVxsmDxhh8JPQ/8HKlPcfjaf
	mz/PNSqqA+FrcubV0g6P/Rq0YdwUudafkhV6AYfGXIaxcrH/1tY/W0BhjwLyzpTU=
X-Gm-Gg: ATEYQzwUSYrzBUoXj+ayuT2kMY/6I1+SFJc/dCo28NNUtxVHpnBDjcu5Hnmzq/U0GUE
	nlqqnGjvaPgMujz1LrRMJXIwbEd6ny7P8N7j9n6v5bGjXHCuUHW/wWaWAIszjvAelayakzW650r
	6XLEh1JYIZm1pH/K396bTLzDT5mnWv45V/GzPzVzcuccgV+Jpz/lOjAhtQyryC++6y3HdzTBMzP
	TAvaowQI0lBs/Al8DwSqTBsJ2jrxv7MRssrOZNftTX4UgnL2KDuB2OdlYPO0DeEu3lmBrKBhULB
	/h5L/emvWRYsKp75Uu4q/Ao83VmCVthrWPskrVyxwrn5IxJ3N6QHc3BLbwuMW6g48EDGOAd7pgm
	IU8hfgUiazl1NpfCXiQ7mM/bPNFus6nHIdeR9PDGZzREabSFGVz8SxHTW8G/UG/oL7EVWdsmBPU
	fA7pbM
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887125f8f.39.1774511244659;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887076f8f.39.1774511244195;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm5509708f8f.35.2026.03.26.00.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:47:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-thinning-apricot-c156914803d6@spud>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
 <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
 <20260325-thinning-apricot-c156914803d6@spud>
Date: Thu, 26 Mar 2026 08:47:22 +0100
Message-ID: <87wlyz6nhx.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Wed, Mar 25, 2026 at 02:20:13PM +0100, Javier Martinez Canillas wrote:
>> Yixun Lan <dlan@kernel.org> writes:
>> 
>> > Add a compatible string for the I2C controller found in SpacemiT K3 SoC
>> > which use same I2C IP as K1, so make it fallback to K1 compatible.
>> >
>> 
>> If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
>> used in the k3.dtsi instead? My understanding is that this is the meaning
>> of compatible, and there's no need to add another compatible string for k3.
>
> Your understanding is incorrect! What Yixun has done here is what we
> want people to do, because even if the IP is the same there can be
> differences due to integration that are problematic. Having a device
> specific compatible allows us to handle these kinds of problems if they
> crop up in the future.

Thanks for the clarification! It seems the convention changed over the
years then.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

