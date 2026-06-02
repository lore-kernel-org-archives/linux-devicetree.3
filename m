Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD03DC4CD;
	Tue,  2 Jun 2026 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403002; cv=none; b=Aa17thTRxIHnRJ6xXPXSkmbGZdUTz3HoOmHBad5r0I0rtRbS7b1Gx7sMQZgzbNEH0bmTgDrE8xGCg2QAOH5nu96O5Gs2aTeK5jiqdciHl8+JOkKImIcrjM1CAs11I/yf3367c0ofUpRk4XHtW4op6jCW3H6rBCj7lpmHcxqJrLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403002; c=relaxed/simple;
	bh=Z95sJuQCTgajvOD0RfQFxhKPMT4RoY6/+AzQrFXJPPA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IM/CnyVye9Uxje7pRYUHBAYfxaakfVmYdKHvqXli3IEuh59afCi+2F5MaLLxK5Fj4RZkz3OsXiyrqzenJootb3/4ujRKbRagjiHPseP0aulDj8w8fF/EglgE4u+oD00dY0IgCji1KinLag7dwehxmwUiNfCtepgozxULVzJLw5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QtyRN8j2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jTHPM8Kd; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QtyRN8j2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jTHPM8Kd"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3B8267A00A5;
	Tue,  2 Jun 2026 08:23:19 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 02 Jun 2026 08:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780402998;
	 x=1780489398; bh=hRhE2JS8VMDtVgLzaO+li85xbKbuR8ESfHzz9aiWT/c=; b=
	QtyRN8j29GKZF5IDSW+WQT8pgLgcy4Q3xWxOTXVQTcf4PpjHarj0ZnFQScY83XqT
	G4l8D2xHL7Xfz2vxSMdglyFs9bQNZVNgpjDjQYz2V3+4eH16hmxHsfvkpmhA40vF
	cHvVCuVjO/ANV8SnU+DBZy4L/IfqaS3EIaY6zCLzY+RwoBBiiCMsIX0hVZHzJsFG
	5UyRymkDkenHAIYmylagZ+SqcdrnGpaNPPA7NV9LTpBZ3/vVHJVxwABICowShD39
	gy2qOQ/n0SnbcsEk/tbY8TN2DkzYHrdKdFIF91ZvVc4OdukLK7QFVTtJ+ZvIgVfB
	/BLtzso/+vt/dLHD7L3LDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780402998; x=
	1780489398; bh=hRhE2JS8VMDtVgLzaO+li85xbKbuR8ESfHzz9aiWT/c=; b=j
	THPM8Kd7XTbXh3mZCXz4Fb/3SeDY0VprvCEbWlpXDVGK6tn+4jJfNnrfyzYdLexj
	JQUxMCgb8yh35vdun56MWoc+l8uTuGtVXMkDi7ggHBOtELsg5z0C/Ay1URRslPd/
	sbBjPDNxSMYR7sB1MjjgFK03X+T7ZK/7hvgzxH58Ii7ZFCJM9Dm1P5PhFjjfsQp0
	2dkas3HdaJPw6F25mGobI07+3W64nGs9dCCG1JRDQ1g+BPJFyltRDr6ZEUsluvz3
	hwUo2IqbjuobdVbF7HJJ8WamQ1tr9NY4W+T23qoM3GaLJwoliZQmpJU9V3kAbABf
	8qgrv5uVTlo1zb+yPyJlQ==
X-ME-Sender: <xms:Ncseasli4_R4W3QDYJhW6D38Gy6GqnBetSbVdAG5xsL4JOaODOfyGQ>
    <xme:Ncseamp5bMq5Xy8b_gbBuehb_kcN5n5FE0YIFwmf9e9trU_4tBE2raiCBkX8ER__y
    D8iD2cVce8InU5N1E9yyw7Ee8C5iX5ZDobhShydyhAvejdSxqhxEyE>
X-ME-Proxy-Cause: dmFkZTESgYyi6e4cEOd4bw/XAYmop9bp+Es/eLhRIz5HZQlg/9EMr78/xnJGNo1+hXDWsG
    HTKPM/336wDCh4Yzisnqt6fAwQYJimc26yQovtKNsvcUirJ30fMPswJyTBY9zr1mg+ejEw
    1mqoYpt/rfadcy6R0oEywDm97ts7NMZYeyx9CrKGOKQJPvkXsP8znJaqa88PTLyYdOQ1LE
    xlWDAUqB4umgEl4aTqGGOF9eFS1J6wMDT97kvzM/VCUPBCQObrb2RZJncpZzUjplexsjsB
    8mYTUaEHGHbCmIGDeFmoZYCc+kxrN4c2tNAF+TaQt88zs02gbllA2BK3v1un5gRgAfD1JJ
    dOJYz82z1UeYLXrFxVwlMsvxYzENqiZ4TLd2DQU2k5MPEmm2VuzAuWuGejlrvFsVVl4c+w
    LcoKCKuJBOdaDQV4aTJ/fdBfNGZaWB5XhYw9buY6QbkrzuSlLQg0QgHSnIrhenLb6Qv+J3
    +EaYk2rEzFam+7x8wEb5XGzg6+NdiN3MZP9Cx1zaZzovc0VEP6xn1LxPr8aOy+HsFQJ/6P
    ChtKluJeJdX74hfTjQC4emnYSUYbjuS+ZkU8RNImujGUf3WHpJrpj9TdYLgFwnbQv8y4It
    EF5tHitX3AJAOVBZ2lePP4txZSzdAxRnVWQ6Wkh/APzprwu4BsfB2CS2S3aA
X-ME-Proxy: <xmx:NcseakhJfhRJSqT1yYXRv96xxYAF8Z0uLI7BRiFSNFl4ZIN6wSqbYw>
    <xmx:NcseajZiZoAmHyRY8naS5-3ZEY3D8ad2N_MQpTJu0ff4EwBMi7DHKA>
    <xmx:NcseaoV2jILX7zbU7dane6jIkdvKUCOvAxpRFcNQanl1GcW8VpdBQw>
    <xmx:NcseajGUU8bRCkhiNQIrY4dbBS9lgZMBYgcyIhBF7DYCL-wEoGRHYw>
    <xmx:Nsseagr5NT5Vs_mvZCrzcOsoNkOUOqrFy3slKR94V_adQ4e2pYcqqDC_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4D44A182007A; Tue,  2 Jun 2026 08:23:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AkPwN-kLRsNN
Date: Tue, 02 Jun 2026 14:22:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>
Cc: bst-upstream <bst-upstream@bstai.top>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 "gordon.ge" <gordon.ge@bst.ai>, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Rob Herring" <robh@kernel.org>, "Will Deacon" <will@kernel.org>
Message-Id: <24f942db-ec50-4716-9a1b-11ae07923479@app.fastmail.com>
In-Reply-To: <c6e0a027-38c3-4054-b971-033f021dcff4@kernel.org>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
 <20260602084302.2101364-1-yangzh0906@thundersoft.com>
 <c6e0a027-38c3-4054-b971-033f021dcff4@kernel.org>
Subject: Re: [PATCH v8 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026, at 14:00, Krzysztof Kozlowski wrote:
> On 02/06/2026 10:43, Albert Yang wrote:
>>=20
>> Gentle ping on this series. It has been about 5 weeks since v8 was po=
sted.
>>=20
>> The MMC driver patches from the original series were merged via mmc-n=
ext
>> in v7.1-rc1. These remaining 2 patches (DTS + defconfig) are still pe=
nding.
>>=20
>> Both patches have Acked-by: Gordon Ge <gordon.ge@bst.ai>.
>>=20
>> No code changes needed =E2=80=94 still applies cleanly.
>>=20
>> Would you be able to pick this up via soc tree?
>
> This is not a patchset for soc tree. This is patchset for BST - you are
> waiting on BST maintainers. I recommend reading soc maintainer profile
> doc, it describes the process.

What's odd here is that Albert authored and sent all the BST patches
so far, including the one that adds Gordon as the sole maintainer.
I merged these from patches in the initial merge and expected to
see future work get routed through Gordon.

Albert and Gordon, please figure out between yourselves how you
want to handle this in the future. You can both be listed as
maintainers if you want, but to make everybody's life easier,
make sure that only a person who is listed in the MAINTAINERS
files is responsible for collecting patches and forwarding
them to soc@lists.linux.dev for inclusion.

        Arnd
