Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034284;
	b=X1vPJAGzYoepyBh7aacWJQ6Op18x8ZtJMxvN3a0FIvglqdeLM+G31Ott3pEXh5YwDARB
	 cNoiS7I+EtFtb7yDxJQJ0UwZqE6w58JOdO1p9C7U1fryg5aAsYstPAkQiHSxxzCfF4zL1
	 dpIz19bGQAbkLa9uXI4odIZMGp+q1kTV9A+DVhb0bLUVIA4vb74jZbYoxBCLJ5cCuVFOU
	 ydhk0rsLKQWMZsllVWF94p7tMdMeODv7QQbwuFvMWelWq5rrkdZCW1UgdLwrKjczwiTr6
	 yTyFP/uiD2eD5/UGYgNZf34c5hzT2gEUr5ej2yPeqi3mbOCUnRAjY4xelVUPlo4UnsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
	b=01tisvxA4l9C8IYQND+UJ95uQ8kT+6ee9ihwmX/7+Ev5ePD+qBb5tTwmu1fgynyJbYaO
	 zLhnyFg4S7GIreTJ40ZOgd6AF/1TS8mY5q5/ZLIKB1Ll65A1qUSeh6jR+ktIRvJlLCEO9
	 XlKKk89mxeSCXZUNgrZNGDZniFT1/Aka2G/4HxvgPrSlCrl2wCPheuo/xo7w75jYAo6Yv
	 scBEklS/9d2hziKCFNVRjpaQX1gJVsp/GsCAIQ+gxNOSTDLTBCEvR48x3b6NkBNZCypb3
	 c9Jr24zgFX2bhomDqLO2fKqm8jXwoInt3wAHh2VC1FhJHtDajOZx64wpiS4tpBWYm+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BD60A2608
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 241BD60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LTYMQlHE
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55d2d380f6aso15636491cf.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034283; x=1795639083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=LTYMQlHEbQdTlKUxPBuAzs7VvXrbF1oiYVatGoqHremn64qVP2+VtOWCtRF5qWcysZ
         l5agRzunf1PTVH+OhcBmq9jYrHAzemjz4WyV3wBLt36wZrQ0x7fPwVhjlRLFVGESKxPf
         +/4B6655MaEsnAyT5EMT3L3L+5LMMNqr7/S/RSS3WUY0tltxdQDvgW5sBwl/iDgiaEIt
         NlvV7HMBuHOAHp6Gijb+5GONLMQZNPRG9xI4O5mYqn0+7y/TECNF/vOwxcJscQJ/bRbn
         Vlqk5jktTZtNoIyio7RbDVQL5gsV3UILZXv8IJLnDskLLzk55xz7abbhpMmUb8SqWpqp
         A9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034283; x=1795639083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoDhXeC9eAY7IXgT8Ctr9LEdWE8O3Jm6he0UDGeXJ/c=;
        b=MAti87M0HZduQmhB3JTFSHwds6vsQD8pcEX/aclw6z3dsNqZZUzNdLfjPQBREuSU8h
         A90DpiZ+DjNfKxNqlATyJwlcSX/dgadX3ZeeKfGD1B3CRfMbJWwOzeKWOvXqPfI0h1eZ
         0Yde1qOj4jcamV+vtKiHnRmWzMykry3esCS0xww6ssX6hYtnu3t/sJ59oh0YfeBMlgly
         yi9zTTORd+i8FEZ45hzJCHCzWKQAPUxTIFAkWwmYfKRuE8h+nVLr8j1j415jXaEU7yQs
         mHn2VoSkNe8/fvHZuEdkqwT/cyDEBpqcxxL+u2fIdZn/K6Y7eW021HTxS/X+SR3IgNmo
         X/Ww==
X-Forwarded-Encrypted: i=1; AL+hErHEd2Aixg1cw3GjZkCtKy99cPzKSbu7inRJrqwpu7inCBGEWov0vPhHOjtUcRVXJmsH7L/2/x7VZsk2@vger.kernel.org
X-Gm-Message-State: APuU4Z8VyndSQf4pyYsu26bSNdzJEs6rbjIlKzysTxn6n3JDVTE8IRxC
	rl3kpv5232MOrCyaMuxAU7WiFjCCQk2Ng4P3jefgDE+8x4FTLf5EdppW
X-Gm-Gg: AYBFou25TNGa15U7/etRsu2uYO7enkaAniEb4lMc4AegqiJZ1rEKk796iYsUaUUG76Z
	BOSM+FS8eMUejXIyZ1mdIjJvkFtpVDAad+taGjcOmNxvWc4HWyYHC8i1XIzi3WS+JCCVajJd9Xq
	j6VJ10Ky6fAbRCLfrUUgRdon/8wUnEyNAbUvf57FsMMO9SEbjh+zPgF2BUmJyUXMPLrWqdlxyYI
	r/y5GjCvykzTGAOmWSqRFgg+jD6o4FP7Im9oZsYEsRJQCPNRTz9dcly6vF5E2+a9khDIaVpdx6J
	JL9DHN2NHKuiWU2w5H+Wf64756XKZ77TsVdVEsSTE2U9HLNGA1mFPw/191uCdLG0JhEub71HqaW
	eErqbdAqB4k354hdUWCX+ubX1+VG2wU2Ywt4RSzONXvn6pKXr8b7roV7/1d5c5bqdIJhyADdS0a
	yGbEizw56o/NRy7ze1xBxl7ot4vi4fOhHc6qGsDZAIODMIBpavNcrCov3xsAt6CGyaAB1vQGabv
	wiXd1oxOWSFfTzS0FNG37/LSgCWkmxai5sH0m8AxB90Cduq7L6LBOmAFT50dyXGFmPBVwUPA06o
	rOLuuxbQTpAYcGvHC3smqXYpAEZ5+M6HcWtoXzoNumAuEnNDHeNqYhgwdvep55W2OoWqF875tdN
	is4A7h9tIBSFx4bc=
X-Received: by 2002:ac8:5d4a:0:b0:533:370c:7600 with SMTP id d75a77b69052e-55d5a57da20mr64973751cf.27.1795034282998;
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Received: from localhost (bras-base-toroon2176w-grc-63-174-93-36-89.dsl.bell.ca. [174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f58dbsm30837106d6.6.2026.11.18.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:38:02 -0800 (PST)
Date: Wed, 18 Nov 2026 15:38:01 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: pm660l: add analog audio codec
Message-ID: <av4MqUrrZ0OgMjlI@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-8-mailingradian@gmail.com>
 <avubHsbu-zkf5Uqc@zenbook>
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
In-Reply-To: <avubHsbu-zkf5Uqc@zenbook>

On Mon, Nov 16, 2026 at 06:10:25PM -0600, Bjorn Andersson wrote:
> On Fri, Nov 06, 2026 at 09:24:51PM -0500, Richard Acayan wrote:
> > The PM660L analog audio codec (PMIC revision 4) controls the headphone
> > jack, and optionally the earpiece and speaker, at the vendor's decision.
> > Add the analog audio codec.
> > 
> 
> Trying to merge this on top of linux-next gives me a number of
> DeviceTree validation warnings related to "sound-name-prefix". There's
> also a number of warnings from the later "arm64: dts: qcom:
> sdm670-google: add sound card".

Oh, sound-name-prefix can be removed from the digital codec and the
sound subsystem can just overwrite "PDM_RX1", "PDM_RX2", etc.

I hope overwriting the analog codec "PDM_RX*" doesn't break more than
what we have now.
