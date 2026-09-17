Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8215249B47C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 22:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683106; cv=none; b=UmGKLBggBPhiJWVyU/ljmtQFutxKLJLv7neGg6bGut+vAdpahkC4ifK4Nn2Kmlvk4UwVBk2sSESz5CY6q4DZUeyzQsC0Un0l05Bi/1GaQ9xXwNQ2Y60WHvLfjmWZ9MCb6TzSc5qNN9635i7gdz+s2j6g/6essavN6F33f0eEZws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683106; c=relaxed/simple;
	bh=jOlxdf/m6Y+j1QfMQQ12WJCRFexc8gkPxAks8z8FOGM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mQfpxYR0B7sJj1FfMVxAorJPRjUZFqqHW7kYsdGZMksufZ5Fig5OsM2JmMbX1ltckJ8wgh//VjZ7wcNa58mOGtNuKfeQzoiGp2PZ9qbyYsCK11rY9kO7N8w6xoeKZpG6MgoiTWR80rBhahtDL47CBb4tEuermPYvmrAwfubR64k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=dIcanz0T; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="dIcanz0T"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so14996366b.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789683101; x=1790287901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mb7i+gbo6kzJmT1apFAi0LX87LEqLWxo+73kgMMvIAM=;
        b=dIcanz0TCelQJY9YfrgzqE6S0EG+I8klaUHjbnbKO0kVa9rCRhtiMil9QXmkgR8flg
         I61DS+fsVbBQ/qlHuyhIUh/XRtdKZlFx9v5+bcI6bIWO1kWDMNTcna6aJdUT1M6zmEGQ
         hkeu7PU12e5fdypgpz3ySKbR6MTTul6uQ+BMmMO1N/CtSKDvCvD4u/YS05EyrK+X63U7
         ppkbzDhHFLiFxx2iXuqNza5GREU3ySppgxjMjQUQw7wR6WcqfV8o+/ckrm7kzJjMJLTW
         huansbpLWzcqGuXcW6VIL8yFO6cLGYCnDGbrrUx1N6xxC2ro3e3f/hs20DePPbX2H9sC
         n/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683101; x=1790287901;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mb7i+gbo6kzJmT1apFAi0LX87LEqLWxo+73kgMMvIAM=;
        b=g9QqQtVACCsv3GtG/tzq5GkiaNxxkiFSIJ5Hd6MsUDCXXPb/g3lKjokvdCzIujYfVw
         vwKDfEhkbcRRKfbjmK2AD/crzUP4+ZWhoKZ0/poasjM8eAR4rMDLEHwDfa9CeZsw+cT6
         WbMatwGCkigdu9Pw/ABMHPbTLO8snSLeZOVA7vzDcXRvV8bPRlQGEeMaDLrsHUmd1y9+
         svEAf8GK8kgLcBGlo4+W+b1Pyxb9HKimSDNeV+OiKfPp+PcNTXBwE3FpAlf2F6Ed1oOH
         5bDu4EjpPcH8Hv4gYG6c6JordaNugYB+1pWBs0SDEDOMOC5nSbLNZe6u3erQOnSbVrmc
         qg0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPam3ofxUKp5DoDYGfZo/LnJJXKOGT9E1dsyPWdZG2ksSPf9d7YHnQ6vTB2At9JlAOhr6kQFD0AUK1@vger.kernel.org
X-Gm-Message-State: AFuF++kd6WkfLHjjyCFp+RPsYK4ZWifBcoZR2D0ycA2hJLKEebRMSv7U
	VNyItyc04wNwp9fSCoDvaNUBbZtvctzbR17NFsVqCtT8egVWDgahB3iQ4HNjSlKKhZE=
X-Gm-Gg: AYBFou3FNqNQrtXI5XgrFwpIwc2tB2+bhhWSz/xsaXLOkZpcDhwysJwr7GSGobb93Vc
	mq20cEIbW80K8kdVe/jBA81L5JEdszowtidpwzR3czEh5Byo4mEeUIaSz/nTnlWgFjKMs01Xkar
	oHt7P6YXOYVW3ZfbxMnZxpqigwyyEdqc/O4WeBJ5U6PSrcm4FuPRqHX6NOu5n7BffnCUGccIl48
	TboMeJRl8lbfLwHf71f7tWo4/K+RNXti8Q3TLhF9xQDdeqBTQOdo93cQlWkVW4XqnWeeQlXCo01
	3LsuxtcB4hZ8Z36ycWa67LON6ppV9/Gv8lBDXKantSpAb//ECRQ/UZDxbG1QgTLP090eGkkUhAM
	OeBQllin1ju/rPFUQfN7207n7qMYQTQmar6u/h/70BxeR2Nyo+8cW86ta7wdwLx6DQsMvVdy93+
	vBbQ03oObuFLxsPRHAcf20gDAbUrzicKodpzobmzEkPMJ50w3J/ubIbP1KbKt+sC8qyVs5icaFm
	BxHClC7gtF4JGHhxHWsVqkHbPtqFwor3iiMdQEDC5hE+q/pDj04dBjrMhMVqQ==
X-Received: by 2002:a17:906:f584:b0:c29:f5d5:5a91 with SMTP id a640c23a62f3a-c2a15810956mr55914166b.27.1789683101299;
        Thu, 17 Sep 2026 15:11:41 -0700 (PDT)
Received: from ehlo.thunderbird.net (ip-077-020-009-205.vkd66.pools.vodafone-ip.de. [77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de07ef15sm347128266b.9.2026.09.17.15.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 15:11:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 00:11:39 +0200
From: Conor <mail@conchuod.ie>
To: Petko Manolov <petko.manolov@konsulko.com>, Conor Dooley <conor@kernel.org>
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
User-Agent: K-9 Mail for Android
In-Reply-To: <20260917151300.GE4583@cabron.k.g>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com> <20260915133805.3249587-2-petko.manolov@konsulko.com> <20260915-swore-armadillo-12f821bb00fc@spud> <20260917151300.GE4583@cabron.k.g>
Message-ID: <B1132C07-1C13-474A-9086-84F6B94E4BF8@conchuod.ie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 17 September 2026 17:13:00 GMT+02:00, Petko Manolov <petko=2Emanolov@ko=
nsulko=2Ecom> wrote:
>On 26-09-15 17:29:29, Conor Dooley wrote:
>> On Tue, Sep 15, 2026 at 04:38:02PM +0300, Petko Manolov wrote:
>> > Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co=2E K=
GaA
>> >=20
>> > Signed-off-by: Petko Manolov <petko=2Emanolov@konsulko=2Ecom>
>>=20
>> A Link: to their website would be nice=2E
>
>I assume the link is supposed to go in the commit message, correct?

Yes=2E

Thanks,
Conor=2E

>
>
>		Petko
>
>
>> Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>> pw-bot: not-applicable
>>=20
>> > ---
>> >  Documentation/devicetree/bindings/vendor-prefixes=2Eyaml | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >=20
>> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml=
 b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > index ba2002969373=2E=2E276d62b848d5 100644
>> > --- a/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > +++ b/Documentation/devicetree/bindings/vendor-prefixes=2Eyaml
>> > @@ -467,6 +467,8 @@ patternProperties:
>> >      description: DPTechnics
>> >    "^dptel,=2E*":
>> >      description: Guangdong Dapu Telecom Co=2E, Ltd=2E
>> > +  "^draeger,=2E*":
>> > +    description: Draegerwerk AG & Co=2E KGaA
>> >    "^dragino,=2E*":
>> >      description: Dragino Technology Co=2E, Limited
>> >    "^dream,=2E*":
>> > --=20
>> > 2=2E47=2E3
>> >=20
>
>
