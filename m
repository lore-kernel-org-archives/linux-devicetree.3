Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A743EEAD0
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899928; cv=none; b=DTc3DCVkbXZeorutqaJDWpskvJLN2orXXVyplDN8BIppfqvMokV8DS08tDNdE50KbhIExDYpdIViLbEoTK/VugM7Bpx8S3Ft3SFVbMJfYQ9RwtVE+trYbg10qApurRXwYJzQ5ocjJJJFxnPTmP7KAJPfB3qS3fXuaOJlfYDs/OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899928; c=relaxed/simple;
	bh=0Np1LbgOU2COqkelej5O9F7xaeK/nC4fC20mmvMutBQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=WkMWsuDQHQV6LyrnM3ov6VjTAZ2GqnxHpXdN+Rla7ymWewkPTvhtsroLNr/5M3nBa6kRl03MeJyR9dc+mrEnouvdb9XtyL0M/eJ3I5U3hHcAcF8Rtoa2UzTcq5m+ct4N4uubz1l3qoVn5xzFogAFP72RVFLmZZpDXgtrMoCkNYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee4qzXTw; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee4qzXTw"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2c980dac2b2so1400165ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899926; x=1783504726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=;
        b=ee4qzXTw468JQAbj6Mq9FQeK8mokWRYTee5v8YSkVhvBnD+aeU89aSz9973MUzqUoe
         ZM6ko/aJmwUXwAtAdM98AYxgRBPOiS0OeHuljtIZQQyklZYzthe6mNHu+8AncIpKuTk5
         fToVT7agnu/fScc/3e03Ti+R9FX+im04ZrH5U5opIBuUkCVN/UZ4HlSibuFi0zaRnCZD
         M7qEFyzJfy5H+c5OoD+oFQWutE+NB/5JtffFz7WjUtYbHhtARlAlRq3GpFX6vrX3YpWF
         cyOKE14sl1suwY6t66TesOSEbaI3lzjNWr9/tJh2Kr+he5boimuF0KgrLShpYhYWbq2S
         JG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899926; x=1783504726;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=;
        b=FPIUrqsrQ9KXBdahxOeTGVxhOFtklwg3/Dzo2x6/3JF7RVcKyU3anLGg+alFpGhsoN
         /5q106EAtlWG/1D7pNKsM8B0y5eabXpfIbS0xy2WXA/I0f1kKXJq4SfTlil7GyMvomxP
         E77/Dt2iO2l9nvnOgTG9ziL+kmnBv/RgDmklB6SRSMbRskUBG7Qnfup6nURL7HWHzG6p
         d36n7KuVPcHGShxJDuRf0A3nR9kyi1B2/TvB14/G44PllitmT8S9LZOJDRxHBMmu1IRv
         4eJMjVUIgMGfbcLPaCkNIi9Ddd1XRdkJ+zC+pOZ4qL+p8mvz/1fWJKG8v58W59aCyZlb
         GMEg==
X-Forwarded-Encrypted: i=1; AHgh+RoZvNSlsZkSBvJjwdvAAlkokPa59T32r+qccKsxriZpHXOJ8AwVUWhIEEolhRaFqVZqToyqqYQe6Bk2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs57IhFc8JWyUY7VlQdYplMZqeRvzDxU/5MLLu3wp7ORf+U5hP
	ZCalaYhbIhrVRHI2g+I2JPLvb1jQm7QnLTZZaHQxNahtZSgVrhNkviIN
X-Gm-Gg: AfdE7cm8XmN6UgsjAJwTFgp1KNAH7obFqz87lhvNPqqpb+VcRRm6taIcOAgqt+HCOfk
	wcRmUpP7apNWNAJdgiDOJ2DSY8pmcT/57ryk+GHEVlu2TArIamN+INuIAx3kC57F6KTJi9hlwUw
	IY6Qm78jJJ/9mLHxlZUZbUPuam8cWE6bvOedKFzFJ1a0rR4zFoybW3pIl+N3kigo6KayTpyATuV
	o80CG84TNMeNQm+oNPdqb3VUmblozfOUmx34nQ4hWMssc4mUzUF0P5z5ovF9GWCGPH0eubsN1VY
	r1CUeRdxruRGRDQ34PhlieWgE5gNK+5JUcCSrtFnaGMBlRehPeC6+VgEWZf1HHLkUiTO37n6C5J
	R6f/WSiIsSEuIWRDfynB6mWsWwvKJcqaHHXm7yWC7bhRhwPfM1BtsKpeFXV2odGKuBoD1c3rC5V
	SX/1fT1+fuBSUaupcj
X-Received: by 2002:a17:903:46cd:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ca7e8c6253mr10964195ad.42.1782899926244;
        Wed, 01 Jul 2026 02:58:46 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2603:c024:0:1f00:233::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm29144285ad.80.2026.07.01.02.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:58:45 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:57:33 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_dt-bindings=3A_arm=3A?=
 =?US-ASCII?Q?_rockchip=3A_Add_Graperain_G3568_series?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com> <20260630153810.3574714-6-coiaprant@gmail.com> <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
Message-ID: <7A7E4706-D4D7-48C6-87ED-F1F7B4DCE0F5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 1, 2026 3:07:03 PM GMT+08:00, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> wrote:
>On Tue, Jun 30, 2026 at 11:38:11PM +0800, Coia Prant wrote:
>> Document Graperain G3568 v2
>>  which is a development board based on RK3568 SoC=2E
>
>Broken wrapping=2E
>
>Best regards,
>Krzysztof
>

Acknowledged=2E I will fix the text wrapping and clean up the commit=20
message in the v3 submission=2E

Thanks for pointing it out!
