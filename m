Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554973B3C17
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071640; cv=none; b=PZq/XeFBixJ//DiYVbAATTuGQ9TEjm0s3k2F1z7xDe/sazH+q27LKvJts7Nm7eVr3GFuCzJx1RG0C3JIOXJKMrM2eaYhv1HybbVKi3Y2DQRQEaW7R5TZ53xSCRxko/6hIyoOrRy9ceQfM6GDIsyMl6Cd0BcnMSxxzUBtW7JOvpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071640; c=relaxed/simple;
	bh=Hspl+mbeRJE8hJkCAm/QgT5mMB+rSBNdrMJ0iv+GN7c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BhuObDPjOaHJVYG19DHj3RorNKXYKYacx8NceVrPuZAC1gSO4cR4/JrY4x5H9Nl3yfWyqqdKnqBW6qT3CJ/QD15xMOmx7XBuQPJaLpW2irsWtKHwoKzYKhYdaCSviG+dSX6oiHacfIp6EWTL3+7IVvXfqVfnL1Pcf0Pq2umiGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GQA4xqTn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GQA4xqTn"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so693852a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783071637; x=1783676437; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNqqVjohsqY8yTYTK5W8wByaWx6IeZeY7y7Iq0rzlDE=;
        b=GQA4xqTnFkpzDPCIRgb5oRLjafe008dwoncaTQsxIF+qyGj2znNJ901FOsvrBYh13+
         j3Nch7FIIeIRSmxp1blPUr6thFcIf5UuxYUdoWN1Ktjye0R4uw9zcEaNvktd0pD88FEI
         Edqaz6fCsVMdyWwWxqzspR49fh7xrZi9NEtir8ehGVMl7XN33l70gN2s3bB81+FMHlR9
         BdUYvnfMgPOzbsd7jUm8+xZ+rT64N1C4mQYB3kMLHhgTe9NmRyhJJpztlDhlhtEAgZoa
         2zSVxupAias1Z/jzMc3XbFaQpMkD0D3ME+/OUnRLICdhshyqmJhtl3eWlMZkhbycz5M2
         u6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071637; x=1783676437;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNqqVjohsqY8yTYTK5W8wByaWx6IeZeY7y7Iq0rzlDE=;
        b=cryeJDRhoUxqsz2bDFgTSgE3bpeYO5P5koMRz17Dlb011GgLOz8iMJ+mkHY0mBJw9z
         kU6DYzvtXodA0DS+nXA3rKGyKGg9teT1sMjuT2bEvhUnmqzwRI42LM9bQw/CZG9W9yM4
         xBNLXvHMntoXMqH8WpJqqdmHo9hsfRCqVisSFHi0NoEn7LXDhuekaqpanaUCZuaVIa3l
         BFVykuxt9BhBUS3ow0F/wP0xqR0POjBRb4ZOcQJS4ic+o8qEFUllqbUCu26Ppuwubvdy
         j4rgAAnXjEDhVwLkCI06K9xITT3beSz4BOw18V1vjY3svcCw/veZ9JKbc8egndQ9SKAG
         zZNw==
X-Forwarded-Encrypted: i=1; AHgh+Rpb0SRo5Em0GV++x6LSxH+3KPvtfqh7+cCCD0ILLA8GyNrPMLlgVuQZuboF37zu4bLhttDZTyFMv+Vs@vger.kernel.org
X-Gm-Message-State: AOJu0YxgOIW3VlAmxkL+L0lv0ch+y9OA7+nSLMRjDrGIcgGQJzbEiMeL
	d3NJuO9Nu0+UDNjL2OuEGorZe8NcCavTi7g9IlHMq5w+MdaCxgm05UzLJl8kYrEunek=
X-Gm-Gg: AfdE7cnhvEC9btFhgDITMDPweZ8L/SvGwg4+beJ0ln3r4lKK2lqiQm+9200o/0yS0AV
	gDXVrb3J2bg6wP4MZxiNOV9+9YeLa+1HhpQhb/trQx6Ag7RyqO2FYdjwnKk/MCtx+Ooj8GjyyiM
	68zstx1vm0oBA9QRMsHScHl4Y8B+Hbe+KW/v5gxAP74Hi2+9qPD2VOj5uIsB4u10GyLC+9vLFR5
	tfu2tKC0FVKF+sGf8NAJkg2gqPpMR8m8MD3mQjDxX4zu6SNrzAD3V97M61jK9e2TXXo+M/BYlSz
	zUovR7efwYsOavCeoAjaoPlAsRtGzztAc7tt+czNh2IWLhMAd1BpOphy5gurWavpb2AqiOag+r1
	K5MEMaBXFWEYA8jl6c+IRAwbmpmnuiazq/sGxDSE+J+MmqEVJfRXjPBRCmGwrSu51BZHTYvkHaq
	4kzJhZhHVm4ePv8K+7VREjoXwqrLMuefhpJE5ELzH+bzJjOZyVW/Y48+/s7w==
X-Received: by 2002:a05:6402:444a:b0:698:3b7c:7e42 with SMTP id 4fb4d7f45d1cf-6989f3ad97amr4246456a12.34.1783071636657;
        Fri, 03 Jul 2026 02:40:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad100004sm2179433a12.18.2026.07.03.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:40:35 +0200
Message-Id: <DJOU552LDYD1.96KUPV8JI0B5@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>

Hi all,

On Tue May 26, 2026 at 5:29 PM CEST, Luca Weiss wrote:
> With the v9 data, that sc7280 is mistakenly using, the controls will
> have completely wrong names and using wrong code paths that do not apply
> to TX macro v9.4.
>
> This is an RFC to get some feedback how to continue.
>
> 1. We update the "qcom,sc7280-lpass-tx-macro" compatible to 9.4, break
>    unchanged dtbs (the sources are updated in this series) and break UCM
>    until it's updated.
>
> 2. We add a new compatible "qcom,sc7280-lpass-tx-macro-fixed" - name is
>    just a suggestion ;) - and make sure existing boards with audio keep
>    using the old "broken" compatible. This should be completely
>    backwards compatible, since we keep the existing compatible working
>    as-is.
>
> 3. We add some dt flag "qcom,use-correct-tx-macro-version;" and handle
>    the rest similar to option 2, by opting in boards to the updated
>    behavior.
>
> 4. We keep everything the same. We know it's wrong, both the
>    audio-routing in dtb and the controls in UCM have incorrect names,
>    but it's working apparently.
>
> Please let me know your thoughts.

Any feedback on this series? I'd appreciate it!

Regards
Luca

>
> As a bit of a note where I'm coming from, I'm working on microphone
> bringup for qcm6490-fairphone-fp5 where so far we've been using
> qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
> reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
> UCM to the v9.0 names and it does seem that microphone (AMIC1) is
> working with that, but I'm not particularly happy about leaving the
> wrong control names everywhere, so I'm happy to try and untangle this
> situation.
>
> I'm also not sure where this v9.x actually comes from, maybe I'm lacking
> some documentation, downstream kernel only refers to Bolero v1.x and
> v2.x so these seems to be a completely different versioning system.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (2):
>       ASoC: codecs: lpass-tx-macro: Use correct config for sc7280
>       arm64: dts: qcom: kodiak: Fix up LPASS TX macro v9.4 control names
>
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----=
------
>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----=
------
>  .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----=
------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----=
------
>  sound/soc/codecs/lpass-tx-macro.c                  |  9 ++-------
>  7 files changed, 48 insertions(+), 53 deletions(-)
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260526-sc7280-tx-macro-1179d786af1f
>
> Best regards,
> -- =20
> Luca Weiss <luca.weiss@fairphone.com>

