Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EE93C5845
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742910; cv=none; b=ZcBcC8kR92AtkqQtDXiHA3xGi8YkR4JCpTwZ8P5uzyWEIXXfJxDpGo6iiSvPRmm0JaSnrtQMOCn84lI1ULhYNUb33oojjCeXLLBjarvia3z3cl0mXaK53CXlnCoBx2FqHPYqt2j4ReUVJhA2dmVz3AfWbiFPEpOtbWqAD+A4+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742910; c=relaxed/simple;
	bh=L4bI3PGgU9bSJgOhljQBgG0v7C7CIE/2yIrGX7MDOqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LXOQTeVtaE5YmeiTo2CGdfr1U0oBfetDSQTsm9bkS4O/aFCknkRTl0EZfIGzB+7O/x0XMDHhhTd38s39Y00wejM8+BsKSWmkvgsvqpUFMmpjYcDW+9HSk9Z73TzgKRR0pHct6AsmLggoAhGnWl0Y3KHBZds6RI5audqZbh5wGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cyWzPhFE; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cyWzPhFE"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8038a9f10so1140596a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742906; x=1790347706; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=cyWzPhFE7qdE1aFe+S4eLXfEmqXcs3wc5OKxabPrVzvOUlA1/CVsSGOSDK2oUBeAHf
         VTHuh6+d/FtT/VedI1JDFJYaYnSSS1KO1r0NoyKWq7kc1hm+HuV0BquTHazshHcwNrR/
         CYsEjhCTSRtjUZ5yCOcn9ToOHPGgfU2tL80eldLtBtIA/bPQi2Bo8Z8uP0tHFEgjHa4C
         jMF7axCTOcoTmYSUnwAs3UwuO1NDILwFkWymXVDr2RC863dwQAdz2BqvaEl5Eks26FVN
         6NSTxy/zyd5+Q40bdbDn/T+W5Q+6hgvmTH/ayxJjgn9q9cdlobpAuvIJFaWayy2Tx+UC
         Ozrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742906; x=1790347706;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hg9vfa4lsW5ktc6Y5Et7BMiTJemiUATqSiHMCuNMX5E=;
        b=AVGvrqlRlCUjD2Lup3AVXutu7/4NJ/FbFPxpeZJVCEWbTRWrezKlIuAEMOT2sHvGlY
         JE6grLiD5iy5c+0jTBw6sqqfgJ8DhyMiZqoyN1wWbJ8OrZ/At6h5VQjLl6/qyVsU20g+
         TJlgJASgzaXUGKE/UJTM0MSfJS2BrDZOUVguwq8Zcg4SvN4lezl2dCsSSKIf+MmzC2Kz
         NFFGO9HjQgyAISWuC/1ht8qq8sNE9pc2iXa5+63d7WEOmzmFBFE1h2yEFJhucd1H7FOk
         5OOcBZY4UuzSoCEObE1KToGgw0b6DOm/17oeodM+NfsmTXcjk4tGEVCt+bbo9cUg3HeN
         J5LA==
X-Forwarded-Encrypted: i=1; AKwUvBzpPUXtxzFagNr9ZJ1MKbcYg0Giw79QyMdQF2SECOH2jEfq4QXUNRc3TnNv16JbbtU5I5LLDHhZ62et@vger.kernel.org
X-Gm-Message-State: AFuF++nHMnoOqfZwoyP+eNm4mGfafKOeEOvpXRSWcyVTlUr1nL3r+YtF
	Nze/xay2lx4ufdDZbjzteH6H+7kFgaFfWCeiuHJlXaBu2HTPU4DPNqihWn2p4uHTM2M=
X-Gm-Gg: AYBFou1SUaUyTurXlr2j7UerxG29PSgeYxUARyJ9GIKbzQPvcpwhEsFXJX6EQVZific
	UVXR66WAaUc4r9w7PmwUF3CymAUvfOIIY1EC79D+xK5R2cP5+SZ8WlKmHbfYLWCoSix8bKuXuM6
	V1Mj6IbujfnQnl/eB0X2UfnrWD8I+CtAvDEDXy45RSoBQVnnmzEcKJMAQ9KaXjIWvRcIxoEauHF
	yH+NufT3k1qMASpx3GvM+dnGS0AJPIXWR53UT0xwbTasozmOtCp536MyI5NN53FLeoVqRA7WkXT
	9KwuW/9VkSNvzVC0nXmEbNNFKWU4hXLB6bp5IUitzV/NpRqs2quDQYDTXa4xmElemLIouzJcKsm
	RPZyEQhL8s/kdqNJ+TtTOX3k31/9tfIagBuI8xZxLW5HFVDYoMDPMmrrp7QKDPV+S987QjQz9Rt
	fVMp1Rs5rXWJgqNre28KF8BLq9I14E9djmlODPSYMtNGHIkHC4Dg96AIXblGfZW7u9TuYF2pgaj
	oW+LFzy6zzRzXnzRWmSCnqSkxWD15DmxLFlF7OGQrc=
X-Received: by 2002:a05:6402:a0c4:b0:6aa:4865:55df with SMTP id 4fb4d7f45d1cf-6aa5637bc93mr1670013a12.26.1789742906136;
        Fri, 18 Sep 2026 07:48:26 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3236esm980880a12.9.2026.09.18.07.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:48:25 +0200
Message-Id: <DLIIWS3MACOE.1MZFUJORZ6P5V@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
 <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
 <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>
In-Reply-To: <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>

Hi all,

On Thu Jul 9, 2026 at 9:06 AM CEST, Luca Weiss wrote:
> Hi Dmitry,
>
> On Sat Jul 4, 2026 at 1:55 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
>>> With the v9 data, the controls will have completely wrong names and
>>> using wrong code paths that do not apply to v9.4.
>>>=20
>>> Note, that this will change control names so it's a breaking change.
>>
>> Is it something that we want to keep as compatible for the old DTs? Or
>> is it completely broken and unusable?
>
> It's definitely not completely broken since a good number of devices
> work (seemingly) correctly with it.
>
> I also tried and I could make the microphone on Fairphone 5 (QCM6490,
> Elite audio) work even with the "wrong" v9.0 config, by updating the
> control names to the v9 names instead of the correct v9.4 names.
>
> In the cover letter I've expanded more on this and the possible options
> I see.

Any suggestions on how to proceed with this patch set? I want to sort
this out before upstreaming microphone support for Fairphone 5, which
has been working for a while. Just needs to sort out this situation
first.

The cover letter has some possible options (new compatible, new property
to mark the dts as 'v9.4-compatible' and more, etc.), but it's difficult
to send patches if there's barely any feedback :(

Regards
Luca

>
> Regards
> Luca
>
>>
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>>=20


