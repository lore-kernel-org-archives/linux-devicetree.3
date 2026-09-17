Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225DB5448B4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652476; cv=none; b=NNau/UFjtdxn1ruus8mZdeC7vjZIcO5tJT2Q97wIgD1i1LTTUUEDaGBfvK8HkJZ2cgYTSHTJwk12O3toTc/p/nN+RDPkrbBmemqFOZvuEKF0KT7a18V3WaE6MMvIGvs2herwAAqCfBzEsmRLbl+f+kLyS2bBlNnwx7Duk/ToWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652476; c=relaxed/simple;
	bh=KOaJCWghMntV5TzVNT+bkin6AYRjjP3DTNMu6mqyk6M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cIU1Usc5tcA68j77ihTmsPpiVT6e3lHMjVnpNqFeu/QAFY0W5OMk4J22dv0Lw1r34E645uVaU4nC6fYGDpbymYP27DITJnC919lpEsmyXBl+OMmvaHxYMCAP2+Ixc4cDVtdHYvn2975cCxGZ++SVHwLoxiKzKRnBfFesQtLAjT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=KnuSX4Y3; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="KnuSX4Y3"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f0b20so143742166b.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 06:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789652466; x=1790257266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dABE6Xxrz13aNXEetLj7J15+q28FsJ34U3AEi9ktr74=;
        b=KnuSX4Y3izRMU9XZbk1a7n7t+9Yx74uGbWU1IDRq+01FK3ay81PzZ/5pG9m9g67mbO
         zdmqfaDudJTYsb5hLOjR+f04pcjvbeDuTkB3FlVe1ApQh5qzKQ+8A377y+gbVewcPy9X
         sH+1R28O2/d+btx5vu3F3+0XafusB2g9sFsrb371w44K3LjVI/FGZPs6tJK/F2ziTK/U
         YC24QQ6ST+vVLrM+zgzfMp3YveaQj3I70UOJfox3doXwRO0wk3bP5z3qRJOAyRhOfXGI
         F2NOYEoLqxb2ejnAcP4bEh2FakLC+qvArzf+DCIzSer2rdQP9SYog/OS0jBCxQALdbd9
         K4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789652466; x=1790257266;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dABE6Xxrz13aNXEetLj7J15+q28FsJ34U3AEi9ktr74=;
        b=xX5c/jUW3w48Ko/Loi9gysG7UAJJHmL9bjyMnqdMb9qFljcQQTEiPPDfpjgbtRU01p
         sm7aWQ7Z/huYK/WA5oE1nXJW5fGa7PImYrj1L1F2iK/aKUGocDE4sdcP6XQL1p2UY4wB
         POsAll1BvGJd04/NKZdAdaWbpCz3sB5+PLmrKwsLI9hyGgWQZ/inHAxvIngEUb+3aiwT
         LPKf0HAakyQcqa8XuQzXO2vKsZxRCc3sfEEVoN6XxRemXfTU4Ui5zrcuhjMpO3WYStNx
         7YXa3uOCHdu2qz1vJqiOqQHISiNJBfjH+BriZ4VaGZIjgtlvfUY/Tjr2mzxcoMlqg7ZR
         e3Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxSUhvk8WLDfJxqV23PBvFTzRsGglQzLWMPOmTax8cKPNPvzbb1mTWgBFTZ4lJu8wjNgOnmzDlqsx//@vger.kernel.org
X-Gm-Message-State: AFuF++nzoks1/GyZ0QUTwYJtJSQvv1LBLVRvMxZ+c3Pn6wAvyT9/5jc8
	ej/yu6T6w0TNNNDEVFyxXxh17shGRRbtCTUeXM3aBXPp+SYongKhlpyWeQmoAAOVzoo=
X-Gm-Gg: AYBFou1ouYgbYewXAasni2UECt8BJm8WSpZi8fl5ebXmVF4wvzXb+OmWNuCa+PHlXkT
	GQQCfuKG5Lqm11PIGOagsV5XnFONLv274YykIJPBllTnIpPAS1OnYn2SOF+V/05YLmnodp7NAHl
	A1Qfb2T/ikhyyM2jFmh/FXAG7+WFDNbJ9svrHrBt4cK4L8k7nZ4lk2d+pxmuMai2kvYR4PvKeTH
	LfTAtuE6SlZ+032SPEDpZfIlTYeB7L8edDbkkqU8T6NYfeMdf9zjPeU7uCGN3miO7m3USk1ZCg0
	7jcm5uZGqhWeaC76k5Ol97MQ/CWnrce2eWlsl2AWgbXDpqsNpP6JuotfqC2Ghky4V2xRIwalsz3
	vl0buh2yx1jzYkBdUc4dr8IEs6o7f81U2cCzkjx/gA4PtrKR7/fS5y5Me7Wq8xTfP9upI8uDXao
	wZ85m/s13/7m/Za/w1IYp0AXfwImQeiYSEfQadXVwJlxXGcUjDvWNfU0KUMZb7v7xijMtbFCM=
X-Received: by 2002:a17:907:d92:b0:c29:f5d8:9c70 with SMTP id a640c23a62f3a-c29f5d89d21mr233167566b.31.1789652465825;
        Thu, 17 Sep 2026 06:41:05 -0700 (PDT)
Received: from ehlo.thunderbird.net ([77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48750fsm298989866b.31.2026.09.17.06.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:41:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 15:41:01 +0200
From: Conor <mail@conchuod.ie>
To: Quchaosheng <quchaosheng000406@163.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-can@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: net: can: convert ifi_canfd to DT schema
User-Agent: K-9 Mail for Android
In-Reply-To: <20260917092046.388076-1-quchaosheng000406@163.com>
References: <20260914022145.408976-1-quchaosheng000406@163.com> <70ae05a5-2415-4895-bc64-37b3d3ba54ac@kernel.org> <20260917092046.388076-1-quchaosheng000406@163.com>
Message-ID: <98F28A31-2DAD-45CA-9261-C77E5C10806F@conchuod.ie>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 17 September 2026 11:20:46 GMT+02:00, Quchaosheng <quchaosheng000406@16=
3=2Ecom> wrote:
>Hi Krzysztof,
>
>You are right, and sorry for the noise=2E I have stopped sending=2E Nothi=
ng is
>queued, and I will not repost the three CAN bindings unless you ask me to=
=2E
>
>What I got wrong, and what is fixed before anything goes out again:
>
>1=2E Threading=2E I attached new versions to older threads and unrelated
>   patchsets=2E That is exactly what submitting-patches=2Erst warns about=
: it
>   buried the patches and made Patchwork show several versions of one fil=
e=2E
>   The next posting is one series, in its own thread, one version only=2E
>
>2=2E spi-peripheral-props=2E Dropped, as you asked=2E The binding now ref=
erences
>   only can-controller=2Eyaml, and dt_binding_check passes=2E
>
>3=2E clock-frequency=2E Dropped, and clocks stays required=2E You were ri=
ght that
>   it is ACPI-only; I had argued from the driver code instead of reading =
the
>   git history=2E
>
>4=2E Commit messages rewritten as short declarative sentences that descri=
be
>   only what changed in the binding=2E
>
>5=2E One thing I should have said from the start: these patches were prep=
ared
>   with an LLM coding assistant=2E Per
>   Documentation/process/coding-assistants=2Erst they need an
>   "Assisted-by: LLM" tag, and mine did not carry one=2E It is now on eve=
ry
>   patch=2E You told me not to paste LLM text, and I should also have

And yet, this looks exactly like LLM pasted text=2E
That's an insult to all who genuinely engage with the development process,=
 who knows if you even understand what's been said here, and are just blind=
ly pasting back and forth=2E
If we wanted to have a discussion with an LLM, we can do that ourselves=2E=
 We don't need you in the loop for that=2E

Thanks,
Conor=2E

>   disclosed that the text was LLM-assisted=2E Not doing that was the wor=
st
>   part of this, not the wording=2E
>
>The bindings are otherwise unchanged=2E holt, mpc5xxx-mscan and ifi,canfd=
 are
>ready as a single clean v7 series=2E Tell me when you want it and I will =
post
>it in one new thread=2E
>
>Thanks for the pointers=2E
>
>Quchaosheng
>
