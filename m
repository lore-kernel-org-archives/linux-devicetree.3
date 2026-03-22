Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A840DFC7
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774142242; cv=none; b=QSgRjJndKikNJLAt3Ge1CqTTGFAh1lIMvaMLU+IOBzCLuh963sVShmq3kVOlLmlfvYRyLv9sVMtnaOumglBmruuh4oDKKhtV/zpChhEsmtMba0ui+luTlNrc7fyNmfCn1+fwZGtSHiFBnZnPfI/dPOGostyI+fqFrWmPso+uJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774142242; c=relaxed/simple;
	bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JiLxD8xPHYdTNw3bOUYli3rifPYc9S2WNy3uQl71t+FCrJ06HePHpMsvsfkdveIjc9Ep9vwpwQGFBgk0sh363Rcm8EivuVWQqyS+ina/MNotVOGnnAn8Qc3HpQF63p78qov7MAkOBOAkJhgY/NKypB4dfFxc6tf66gLFP0ce20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNt4FT1n; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqqzyYrw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNt4FT1n";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqqzyYrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774142240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
	b=cNt4FT1niMZdO4MawkiCdK7Tv06Od0IYliHIHdYq/gXEEV9ubnixRZmGb+CtNOKbfQ1BVs
	/+RxXIx0iN7QsmRl31LKGGfQUen0VQz14CMlGEUskWTrn9H63spco4TmIaduejxAoEUnuW
	N/QH83ku77X0+SKup6ol5O+DiGxzrH8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-mzxz0E0vNGyjJEtQBhk10A-1; Sat, 21 Mar 2026 21:17:19 -0400
X-MC-Unique: mzxz0E0vNGyjJEtQBhk10A-1
X-Mimecast-MFC-AGG-ID: mzxz0E0vNGyjJEtQBhk10A_1774142238
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c5976a8eeso279670166d6.2
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774142238; x=1774747038; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
        b=SqqzyYrwQm7sS80r20iv50mFrB0m+/Z6Icm+4449B8IL2A66yLzyMAOQk+kaXdZRjm
         5yau4fwvoK2PfX987RFVDM8nW9haV6Ti/EZs333Ux2pHAvYP1rOgzVeBYQeLUTRcKNkz
         q+nGmoTv5t4aFN0p2+a4FpGFygFogtWVQ7bvYUWGVdSBtoX6ua1smQ7a7Gxuzmjy8c9f
         8pmoDPxn05cDgai1nux5UKApBRAnk9o2RdjXBzMYvvYQJW+9k51+DnDgWf20c+MxiyVM
         R9I4IpyAD6NUim0DTmQNtW7WHxb33hNU6JfXsU0G7hoQ5xkIPQKQKf6KGGHXsfNbIy+3
         BXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774142238; x=1774747038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
        b=OSNdhYORWgH80b/SdVPXYhgVJ75KOUNehbBKAfWiKwhN4edbSTfaeJNB7ivl/vMJUw
         wJXTXZgE34Qt9ZXaDdQmFi4PVIBdSMJ6PVRGqtB8/nhIiRK+85Iyq/pQ/+P/IFSURF5U
         cAOBcI5R/KEfQeHrVrkz+ADOz/SrIGD9oRbs5/sDiCb0fyUIFL867g8wiK8Jkq/4cf6E
         pIGhdLeLFmiCKG3ogRyIp2xE7t/x1uE7iI9MsK5+rVOg9cmv499J/MAqeooKQL3b8MOH
         8zLwn2iG+8hck5bJqKwaNmxgq1lg/vIrRBhE/pW2egPK2UD0x7v2r+5okd14bfDORy8a
         BZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCU9kk7o1i3JSLoJ66XoPKBm7cxikVmPgtD8DJBb2bY/xtXMUmn3C4hnubacGCZymdDN+84e4iNP7/Uw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+orEq1+2NqTJC6TWGM3vO3cJ6Ij/bbto6sCkOV1/l6N3+MWb
	17Ddknof7aPOQ0Zn3uMnRIorLxf55eC8kL06fOI+spkT2w2e7n6r9Du4cv518Qmrk4YmFveo0uX
	bu6gPjJuTYoteRxBPEsZ48bGUv3574L4Y2TJ+1EEKrbfGlaYw8zUw/UrOm1P8EYM=
X-Gm-Gg: ATEYQzzPmn9RxHEEPf1Zeh/3vyUCtCGWtRjMqlS9kAxokTodyAF4GDfIbVONZmp+Fqo
	u5ebqN4C3gBMV602Cr90D6vGWrW7HivFiZZZEfttoTYHlBYIeJGMQ1oH9CcyjbyneXZYINfyhZ4
	vRFbD803acinmYxn31kqV3Tc7AKSaifjTLCvcbN/P7h7b7ke6q6nf5rRt/8TAODhgZYhQtzXuO8
	RCJpXns1hwoJzJ2tpqyN6Q0jd/TLPOdaptZB3XvMAShI5lsLG8ieCr3vWoHXOdpaTCIAOZsdsoK
	Vkgcl3uBVMBHGd2WvG1jWNvGBBEX2kGH6tWpducwl/x21vAbZQ6CCF69yoq0VnG4Oo3ZuL91OKs
	O6P8Nz1rte22QPGtNI/+SqN99VWzQiC+meAlpMl5767fG5smViIPCvaSC5EAGaDB8nNXQfLp7AN
	rJRt1gNoO+t2L2rg==
X-Received: by 2002:ad4:5764:0:b0:899:f30a:6d9e with SMTP id 6a1803df08f44-89c85a55780mr150340006d6.30.1774142238431;
        Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
X-Received: by 2002:ad4:5764:0:b0:899:f30a:6d9e with SMTP id 6a1803df08f44-89c85a55780mr150339776d6.30.1774142238104;
        Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85256c47sm54343846d6.19.2026.03.21.18.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 18:17:17 -0700 (PDT)
Message-ID: <8e9aac020cd9fdedf0c0226fc2d6848b665d771c.camel@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
From: Radu Rendec <rrendec@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lei Wang <quic_leiwan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Date: Sat, 21 Mar 2026 21:17:16 -0400
In-Reply-To: <f619fcbf-8d43-4606-94b2-61b52c24920c@kernel.org>
References: <20260320205933.992852-1-rrendec@redhat.com>
	 <20260320205933.992852-2-rrendec@redhat.com>
	 <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
	 <cff35ebb2a9bc94ed2381f4ddda7b62d82d4d561.camel@redhat.com>
	 <f619fcbf-8d43-4606-94b2-61b52c24920c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-03-21 at 20:32 +0100, Krzysztof Kozlowski wrote:
> On 21/03/2026 16:12, Radu Rendec wrote:
> > On Sat, 2026-03-21 at 11:03 +0100, Krzysztof Kozlowski wrote:
> > > On 20/03/2026 21:59, Radu Rendec wrote:
> > > > From: Lei wang <quic_leiwan@quicinc.com>
> > > >=20
> > > > Add unique ID for Qualcomm SA8650P SoC.
> > > >=20
> > > > Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> > >=20
> > > Please keep consistent spelling of identities. Not sure where the
> > > mistake was done - either by Lei or you added his SoB?
> >=20
> > Yes, sorry, my bad! By the time I realized what I did, I had already
> > sent it. I'll send out v2 shortly.
>=20
> Does that mean there was no original Signed-off-by? If so, you should
> not add it, because you cannot certify for someone else.

It did have an original Signed-off-by tag, which I modified
accidentally.=20

> Please explain the origins of this patch.

This is the origin of the patch:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/cecaf4e3bec17fe4fb63=
c52e51a02065e60c87d0

And FWIW, the origin of patch 2 is this:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/8050aeaebdcb3ab120d8=
47658d831f20bd475315

Please let me know if there's anything else missing or unclear. Thanks!

--=20
Best regards,
Radu

