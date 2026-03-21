Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214CC318BA8
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105936; cv=none; b=IQDny33kGACxJeAqvWLOU5CfrtFa6OcVZyxkhtuRGY1aUqyM8mDLEP2KY0+CClF6wkkdcamxVFPuaW7ob4kxrAZl9SRbXd5eEV08Qr/R0N/2F+ODgE+R3c6tpNr4IB114c9GWTZ+Yd3A0T57LA86uWjBWU3E/0qRdABvG0wLgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105936; c=relaxed/simple;
	bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWbXQs9cdc3l04QbVOPUZR2VHGGn2gf9GBUwQlB6YasXxxJpFwzZu3thhPulMg2pvE9jRmhSwpLIcj6Z5BFx873QcdC8WTCUJcqhRJvSiJA7eda9aErcNH/9K1HIsEdeDoQd0mckC4h2e3q9qWJnJSrCXJc9nYScWS+GOqZjYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LDsvZBzl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pL91Aoer; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LDsvZBzl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pL91Aoer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774105934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
	b=LDsvZBzlN5HSEPRLIYrQYuGzf7JJvxkHLg1myG2MbRLcPGALwqvR7xOUeihushdO9QsVLu
	qspBbCOzwOYS1pVQhFlPl5ShRxhtsgmIXM7Rmq4FUkF0ZQ3aMAaWNRPttsqZplDH+SPaw/
	953yVUZOINvmKUnzJZmhGR1hVUy8WbQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-jslFt8UtMLqSwnEZeEReWQ-1; Sat, 21 Mar 2026 11:12:12 -0400
X-MC-Unique: jslFt8UtMLqSwnEZeEReWQ-1
X-Mimecast-MFC-AGG-ID: jslFt8UtMLqSwnEZeEReWQ_1774105932
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a0258c5e5so18484496d6.3
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774105932; x=1774710732; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
        b=pL91AoeriMxo/wv61W8CTIAT5lf7f8JzjGkKKdbgwt6ngFKCLFNiQNiRUYOz+cR+JF
         nB8Z5Cjxquw22gRymcBj4ZfAhd72cGq3MxqknTsrIMsAdw/TH9GcrJIITKLPHYWHkqEj
         9ElnZBSWNbGK1/sPRugXSYnDt7lO8nrzBztGOvAQrE0yzghqpTLCuHz4RMo1DjelFX8P
         NtVaONmgLR+B9HK9JpHsr9kAT3bHm1qiks4JnwUTQr8OZ0ycr1bx39RKrrVH7mJGRRLb
         sRUjrE2FYhqF1M/O7E47UysK66FqLIRjYX/1hsCfXXmtkdiKyPsQHEZzk6SOwOYC8fNe
         ZgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105932; x=1774710732;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
        b=eUlfCoAbzkA+1Wa8HLJQdVqN4aBvIH3JScU4Q0riSa5ZD2b13nP8dPhCgS+2yUoobs
         VgH9HXZKoagkB+dm6e2m1LsBMUR91xif5huXLQc/vWJUu4OBH+5fjtV3xRvbd7d5fes7
         xZkOEPEO3vMCG0jAoOzB6unwkT0CUNGyk9SyhrcrbETstvYF+D+sQt3/gWyOcadkJNiP
         /bb21+1dVA9PN7M0rrYyzb11gZQeONZG9MpXwR0IMlJpMa+iomJlSI5yhXS1v1dnQGa1
         cp0gDjJvdu7PaaQew39Nf2IsoBuVqd++yxQ+t+k5BhOZnFuDrsvFSJJwv6ljng/+O9sW
         fLWw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2HLr/knoi6Cicam+mjpy3tUXEUENcuycViWh3OO4mch28cE7mTeGD2bhCKtygXfVB12l/hWxDnGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8oA5zBcH4QFfu5MNbAfzFLd9+zVP2Tsl4lvrMAGY+4ohfctMx
	0IyBaJoJViGqVtTA0WRdwUvbbTxrZwty2ZrVj5aKeBzfWWw4jjifMX4CIGNBCFMxU0HA4y1tkSm
	UtjcfeowF/ys3Mfx8Znj+5CygMa9WD+64ICYfxZguBBvhfhzYsAlLxJ3HYsg4cto=
X-Gm-Gg: ATEYQzz2jWYN2l7ezlXNPgE6FNK4j11d4clLfNT/jfs9RX2zMxQEnzl0dxDSJQzmlSL
	pUvCx8ZGm0QZeVpLp7JaqoQuXCQIixAphJbeTybeqSRr9haYxLn+ZUBAvWRy9SRdusniT5F8rxN
	0RyMqa37r/Q47FY66JG31qvlZ5+qNuP3ywgNYGoEK+vMpuIqNW5tDjIJwonYYvxXV66L+vRTCRB
	NIfaNITqlat7Yo0FQePvDLttymOxDghV76trCyNr38444F93un0NbXjn9Purym5ULdeAyfC0era
	s60HrxJWo3YCDRbw4MXTV3/OhgenLhkU6X22CTcsRqkAJtvYeVAQt1DrJNfXSoDTlSN1z3jz0gp
	xPAbKL4lIXlxMcJciU3HmSgPORg7Zl8eIUZ23Wsf5geSBn1fHiKRqE50jc+F1lNGekvDWScVVTs
	rKAzOhzm2KEUIoRQ==
X-Received: by 2002:a05:6214:4613:b0:89c:4d3e:fa41 with SMTP id 6a1803df08f44-89c859f9842mr109600976d6.12.1774105932241;
        Sat, 21 Mar 2026 08:12:12 -0700 (PDT)
X-Received: by 2002:a05:6214:4613:b0:89c:4d3e:fa41 with SMTP id 6a1803df08f44-89c859f9842mr109600576d6.12.1774105931821;
        Sat, 21 Mar 2026 08:12:11 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534cc4asm54518066d6.36.2026.03.21.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:12:11 -0700 (PDT)
Message-ID: <cff35ebb2a9bc94ed2381f4ddda7b62d82d4d561.camel@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
From: Radu Rendec <rrendec@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lei Wang <quic_leiwan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Date: Sat, 21 Mar 2026 11:12:09 -0400
In-Reply-To: <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
References: <20260320205933.992852-1-rrendec@redhat.com>
	 <20260320205933.992852-2-rrendec@redhat.com>
	 <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-21 at 11:03 +0100, Krzysztof Kozlowski wrote:
> On 20/03/2026 21:59, Radu Rendec wrote:
> > From: Lei wang <quic_leiwan@quicinc.com>
> >=20
> > Add unique ID for Qualcomm SA8650P SoC.
> >=20
> > Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
>=20
> Please keep consistent spelling of identities. Not sure where the
> mistake was done - either by Lei or you added his SoB?

Yes, sorry, my bad! By the time I realized what I did, I had already
sent it. I'll send out v2 shortly.

> > Signed-off-by: Radu Rendec <rrendec@redhat.com>
> > ---
> > =C2=A0include/dt-bindings/arm/qcom,ids.h | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20

