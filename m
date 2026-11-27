Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779281;
	b=UUaoj9ARev4+0MVgHV7J2cldOh6uCdTeK/OThzjp4YOjwJ6k/rOPlY8FJlW/C11wrJZN
	 F+l4TcreE4dSeQ/SdxtNzVUOPSvO35P5MOi5whhWqG9PREXTRDT/XzgSEe20duW938FWx
	 Kh9ZZG49ZMeQopY8p7kxl3oP8YYf+8aFJCHEpPOLGapHASQ3yXk18lefkDgwcX2ZkExwr
	 Y65YuA9VveuOAg4y4g/MX0eLBt0qxP85tNwr6SL0eoRutt0tcxI4PsCCJ0Lig4UIOftrM
	 aQoKYTVMfxfUJQAgc8xVWL8aPSh1U1SaiFkd65RS0cFT/5s9MwKrvSgo7uu6fq2bLJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
	b=h4T86EmfI2b05WgKwqoN0QDMfZXz4qWXRspsviCGrIvOnzvZz6C6MiJkyzQweExkQYHG
	 +BWNnx+DqZaYniPTQnikVjzGeTNeIMnaUl1KDIzASR1+Zhc42VF1BJihaclI8lqGLy663
	 ZIahJwU+duxg4cwWHx6lIZVwBs8BuwSgDIbQJe0hH4Z/zQqEu3bBuRB5HPk8DIA2hJmn+
	 HiEOY4BY3595PTQuca1Lsqon+tBNlVQngSwFsLix1WC7n3ss3ZTDYskNksE/bEJ6KJqDd
	 0FdTJOxmp8ulqhlzMqu2KSNuRrBvpF6fMzQ+wALTQgEAYTnfi7GL+fDZIMHr+6LvVCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puaiTsm3;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7357E606A329
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7357E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puaiTsm3
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3725393a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779280; x=1796384080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
        b=puaiTsm36DSsa04ZAcGzKvjO5BieUQBfKg5/zjaw6B7HkZQ7kjZ+lqhWTNzG5UnDW6
         YUh2z8yHmXjCvYfSZ1cfqjwHXxzaL9lipf5wGrLxKfBY8iwQb+T/dZLDKDm+vhY+8nHe
         otvFiFZllZQL/1HuElFmW9iLD4+d0ropQoStgw6HUXtAT83OIOaeOBKlchBdim6V2J/J
         UPWH9U00Vc/V65vHWmvqbcdud35QZya0o8a+ck9Lg2ONGAyPcpj5rNSRLz91SVy4X03r
         dkMrxsExJOLJorc4BgysWLYOznUVJOpUu4lF7uRrWH8x/gUNxwseub7JXhjGq7auUt7l
         i99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779280; x=1796384080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
        b=xTt1OtMWg7ko/lRVb5DC+72zPIBHUBKVkuFaLBIDSW3CMFcAxdfmp/zqJ3oIkktkHz
         Jbd6nVnWysOdztooysNmltYE9EZl+aRf8aAwezdNx+rqMK/KYPgQG+vF8znqbl2WuIyy
         Q8dG0tBgPWPwHtuYqJ23f46HSvgo1ifppOYLMlFrUrQJzyC27AcMz6bEdc4NFt01dDs8
         ZvnlwJMiyjgNbFHeC3pVVMl/Z92oU6+RoBFnfnAz6pOQootJs6MIlsUubkIYYxEtuJCO
         PQEe59xvwq9YEDNjMMy3Si/gH442mZpI80+reyUr1QE4QAVz3dnikTAgOIraB7+e4RU3
         DIig==
X-Gm-Message-State: APuU4Z+PfB8CieLEHBFkGnEKM3LnlBUea46B5f3cDPL1dnKLDpfxr2pu
	L/4QcM77hQbwfuinS97eiHZ+4uvgig7jd/4h8CJk1jgY/MtDeF7B7b0c
X-Gm-Gg: AZFdTZfY80/3vr8RX1E6Fl953H+IYHQQ0kgY5g9M5Li+Yn0tLS+6ymOTEBqO5mAJlfH
	GUcacxavUxmJk3MLbhPcTjtMOQGPlCxAoa70PW5vwIu762/nMmWPk/Nml2xFJ2o35Xq3SZn6vSP
	n5elZ9zBunBLovVKpApBvkbsXDvN80A5sqIOuOZOBAoWCjPF0czeEvDR99sik9T/xVndUpwO/9p
	1Wf1ghGsd8rtBUfbWzDs3Zzy8jj8rMxx0UiDeigsig0j4zzopNR1XnIS2o61gHkF3cTsiGv42fY
	+AxOiAGaLWuDuCeECVrw/xv4/0ovg5v3/cffsa+HEUj6YZJ3TqV1ZTTqMR9HvjmltyfWl0bKfDV
	CG9wbTngSxIL/G4NgJEAQG2HhCAbzldlQSjizXcDNNin2QzXKh/BafRbNikPjdB/R0oNeJZyhrV
	cucsVvmGY0pxMmgU7BFP2ERHe+30Y+i+OzBDQLKOGfKtDKrwk/RzU+fO2ZGp18oJe59OsTY2lla
	y6CGU1CHWMcReoGIn93CPFzgiiUN91dAVfuplvqjpCBTRL1JzveMbX/6hIzXSjB6HoPW595/Bpy
	l935GNy7e5qo3L9y5j+d7xL88i6zVbRlU1m52EETVo4X7Vj5mOT5Ra6ztJUqrX30S150uws2qA=
	=
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr7522887a91.20.1795779279764;
        Fri, 27 Nov 2026 03:34:39 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm24875559a91.0.2026.11.27.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:34:39 -0800 (PST)
Date: Fri, 27 Nov 2026 19:34:29 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish:
 Distinguish display panel variants
Message-ID: <awlqxdv2MUpIaMjS@localhost.localdomain>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
 <20261127101942.3215633-3-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261127101942.3215633-3-liujianfeng1994@gmail.com>

On Fri, Nov 27, 2026 at 06:19:20PM +0800, Jianfeng Liu wrote:
> The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
> trees, but both advertise the same root compatible list. Firmware using
> that list to select a DTB, such as Stubble, cannot distinguish them and
> may select the device tree for the wrong panel.
> 
> Prepend a panel-specific board compatible to each variant's root node.
> Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
> generic board and SoC compatibles.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Use sm8250-xiaomi-elish in the commit subject, as requested by
>   Jianhua Lu.
> 
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
