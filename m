Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8639DBCE
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900036; cv=none; b=WAvHCd3J6WSzzYvQNHkeazPW5LxCGzFvoqUO5Nvd3L2vSSCJx9MgHEY3oZ6lkVIa53qFZNMWPNgi5xcQiW6r4HIPVF+jRHEKD918v5OMb9FQ5wd+ESsb3GLDsBKGmEb4wPw9nGtYLpXeAgL8AQGXHuXEH9T/Pu5s/IOFUZVnVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900036; c=relaxed/simple;
	bh=b4dfFFhVxCppetsQCIQi6F2IzJkz0MkcswpGkyB4KGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRzLg1Bi/ymVvY1fzhwAnJnLNj8PGWgj6ATqvulx00dyZTyenR/DSlx9XTLQ4cMnlgInIR3/Uo7c9AgEXSgofBplC3MigQ5Gd9rBITTKoN3Bc9VDRhMdhMfqedy/mwwag6rHsFqUijZBbigvZkVBUTSWqI1kGs6joNRb3pgMT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQXF94Vb; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQXF94Vb"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89e8e352dc1so16116936d6.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900034; x=1775504834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=FQXF94VbsNoDPkqgVGjKra3yATMHt9c95gNuCvzl0tdzGSclmUpUvyKjlp+1LimHyw
         ANqeu9lBUBZCHE4B/M9NbV0gH7nqLwmQi/YYU4wcaQ5Qtq0rtUPg/+8/h2sLv4wLLEBm
         iID/KO+C/TO4ux0dIuhn2kcCRN0F0iVorqYN0FXIA2jiUeLq+bzIrNke04jeVWNX08G6
         Z3a2pJPc9Gz81lJLMGD2WhTKbfcwmcqcf1orRBE4tvU3oAwo27I8F78yhB9hbmhEsUvV
         KCaf4zaELl71yjFgA3N2SyJ8WfCl1kdYZmvgAV+MPnEnNyYfwkh9gH9oVRP+r1QRdP/H
         37gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900034; x=1775504834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wWujn7zEs4XmtDo8jVLXY8JrcwdbToQOe8VxaRy0AE=;
        b=rSI3dtgDsRhMYREBWZpo8S3guUI2evRQF2b93wfd0YfiVVJi82i1qNrJk6fZU8hYG4
         /vT5NbxoRUuDzbEWT8BtZxo1WZmr2M7SLXTNhlt9aQ78/NF8LROIoVtCWXgK/b9Tkb0N
         AwfhZjhS19Z2AiHKj5TZRqi2zgz5vI6lfRWbocmWhUmWVudvuMIIqRwJk4Ckrx024Ono
         00uvK349ZpyprS2xQxtGhlD+0rAazfmNDWo8QRi/yOVQdjwf5RTz4v7LM9gtzSjTLQxl
         sYt33j/tG3BjKPsPAED6AsAp7dCv1fdHYJcuk+eFo7BBzinBWFe+UMtYrLO0vqYa0nLP
         humA==
X-Forwarded-Encrypted: i=1; AJvYcCUqvTVScLDOI/XTNAMhye1c0+zVDpohy1dFaDBpvrVCvzW1zd7i0K7xb38cdquLYV0MlMJQnilTYQxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7aNFyLoXE9DfWD7YHcrpdZt0eZffH2hkUTBucYBWqe0lNJVGI
	/6EsBjyqqJqt8kMslJc6DE9+GOlQ2FtPu3ohmimayLyG/HIE8OtcZE/x
X-Gm-Gg: ATEYQzzvEnXuWleKxCXCPlAx+rdQlsY3fRnzOcdD+TgG+7gqDsnQTDm+GUptpDFFr9j
	VH2pzu3v/XHs04EMIy2m7HgIEiEIds4OsThpbQV54kq3mXyyydXEOUfnJ/jAeR8GdST9HUsfwv0
	o0sQQHBCHLQfvwh7xST5JfnOzj2FvQxKJxaaTC4RJlYR0CGBAQcicHYn66m/crZ4L/KV5YKRdUG
	y4h6/SEteFc/QvPUIFX7zxCal7GTe6ZRoYlzz30KsuMuWPRlLF0eyoZVE23CcVa/oCSrL0FdvW0
	iiJctGTt72qe8Hsa2trcSp+iZ6xOFlhIIL5jZAzeOGMjsvhRx1+7RmOcc90asx9FShvmTg6FVcM
	HTafU2Ywi2Imcd7JLQ7Awjw2Uoe9rMvYalbsSwMNcJ4qR0q8nvwBstteBqy5fBTAr3QqaA5Gx8M
	HxvShtKT4MBXeXjip5pwp4mF4=
X-Received: by 2002:a05:6214:478a:b0:89c:4b50:510f with SMTP id 6a1803df08f44-89ce8d421a4mr192997706d6.8.1774900033776;
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364e2sm72112396d6.45.2026.03.30.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 12:47:13 -0700 (PDT)
Date: Mon, 30 Mar 2026 15:47:57 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 11/11] ASoC: msm8916-wcd-analog: add quirk for cajon
 2.0
Message-ID: <acrTbcihqVJlNR5-@rdacayan>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-12-mailingradian@gmail.com>
 <aalV5dBloD1BmwzZ@linaro.org>
 <acqvm25ap4LTSB8j@rdacayan>
 <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84219949-8c5b-416b-b6cb-a77c0ced85a9@sirena.org.uk>

On Mon, Mar 30, 2026 at 06:22:50PM +0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 01:15:07PM -0400, Richard Acayan wrote:
> 
> > It looks like the codec part is mostly complete except for some trivial
> 
> There were missing signoffs so I'd be surprised if anyone had reviewed
> this, I certainly didn't.  Looking at the thread I for this version
> there's a bunch of high level negative review comments that you have so
> far as I can tell ignored.

Sorry if I wasn't clear. The codec patches in Adam's MSM8953 series
(linked in the message replied to, not my own series) seem in a late
review stage and I can take those other patches into this series.

> > changes (empty line after compatibles in dt-bindings, constant to use
> > BIT(n) macro). I can take the codec patches if it's okay with the other
> > submitters:
> 
> Given that it looks like the series consists entirely of ASoC changes
> I'd be *really* surprised to see it going via another tree.

This is not at all what I am suggesting. I want to add patches from
Adam's series to this series if he and the other author are okay with
it.
