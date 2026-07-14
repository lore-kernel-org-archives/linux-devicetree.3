Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF3345CCD
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067522; cv=none; b=q/cmEI/Q4xAheh+1WdxABecBDXFm7Xs3jLHmUyg+8kQb0iA+iqQh52/bwFlLU1OPW91paZvZYwN11ZdbGwhHHvQjTvGuQ6CMCT64CtoWZzuilLXwdpeRY6J9V/LyaNu8hMd/T1R+uo7azPfJxrajecN9drd09IP6SHuAvTGOa08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067522; c=relaxed/simple;
	bh=zE4/VqVuqJcmLrVH3FOoILkeVZE5/aWlHlMGboDOFA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcpJFzxOSqVl0AwKA1lKrXMY59NaRaZOK+Ki2R5clVGNURfM+IcBM81Mepskh+wYFQ1mGEG7xe89vSb2qUq7AQcjsNFRm/Pl8tMkS5yyfmBptUB/DlX1s+BfNdiNhT6zfVZYzPFLKphr7TIM703ERCd8Ygl/5zjPuy9PYNdTu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iczIVJ4N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iczIVJ4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372DC1F000E9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 22:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067521;
	bh=eIZxXxv+tXPpBDgH9el62yWObQ2/JLuBH/QJ8Rckin4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iczIVJ4NgscbrqaFczNkEXAZ72kR6NInSaVwtT+g0fM/45cx9W+8Ce9CSaq8gNz+Z
	 iFe+tnz3DsA2xCPnoMNmfluvogNNWdpNeq9Wj1XxOUKtDwjXn9hPJ32ufIhKggAkAH
	 I+cReVFKKUMWLil0JJKv941gU5ibiF0KoXVGjeVhpZaBvel7cxPES7WxoJlpjkajMe
	 sSbQq0HeP7rD9hc5G4RFb051LYVR3ne5OXQZtjXpvdVcANFm07a0stlWGI+5YkMIfG
	 mwndiKRFpIoEI+nAA6KasM+yNdmyriKU7jmA75zM4vQJ8uI4MDrM+ZEfZCBsgwMkPK
	 RV/5f+jm7kY9A==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1614804757so493222466b.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 15:18:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoJixSuIyQ+MrJZsrk89TEi2AVTpNfTUmwC08HyWKFZJxLBw3XGy0wTShFBqF912Un/JIPwUPs9mDb+@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEBL4ETI3Vs54aUjXsSJe70/ih+10jEXP8Kn25Hs+6+Y0v2Tv
	qkWk5NbgTCUOGjdG6d4Jxk8FrBU8mCzCWGQxXnTg9uk0JgNph0J+pXddVYLGO8pd3ZRXBEqUfbb
	vdtXxhFgYrTKk89VX3by/ZQ60Ue3yeQ==
X-Received: by 2002:a17:907:d80a:b0:c12:96af:acf7 with SMTP id
 a640c23a62f3a-c1679307be0mr35724366b.43.1784067519854; Tue, 14 Jul 2026
 15:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
 <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
In-Reply-To: <178362531886.2423236.15524151411935053875.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:18:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>
X-Gm-Features: AUfX_mxZ5H3Dmc9Ije2tAB7DSx5dWyfLqdISdj5COsPt5qCVJ_8IyPPkRM0tWRs
Message-ID: <CAL_JsqK8vEN48DrS=aAyu7QMrMZVTWGCSADPPcgwAd77GzCPGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 2:32=E2=80=AFPM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Wed, 08 Jul 2026 15:29:23 +0300, Abel Vesa wrote:
> > Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> > with the corresponding OPP tables.
> >
> >
>
> Applied, thanks!
>
> [1/1] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
>       commit: 4e967cad02bce8983c4e826cd13ef0e730692832

Either wait for the binding to be applied or apply the binding with
this if it is a binding only change with no driver changes so that we
can have fewer intermittent warnings. It didn't help that it was not a
series.

I'm applying the binding.

Rob
