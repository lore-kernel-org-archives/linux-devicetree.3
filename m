Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A5D488D92
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044281; cv=none; b=SGGI8TZhTg8LFdhj01kXFPlhJkCMBT1+waoksqESQ3VOFIEtXX3HoKCzNrbRoKLKi/E2f6n4BGCUFRyOzbRIQhgH6VpOgE49SHqPQlWUbNusBDFTDpere65xykgjNzKkmarTtVkY2aZH940LdM9DLFKqGUOev+VczbfAVGS2VhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044281; c=relaxed/simple;
	bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To58QiBEdZiomUCebQVC0h1t7MfzQIUhDNzc94uL4qrr3u4zrvn4rq53i51YFpXtNQCq7eo2sNPAvmt1xS2TMuHbI+FbiCVTFoNvkoLagIEip/w8pjns8ysKAPT5ln+2UbYWblhGnOYrmUsnTo7OzQsVJXHLATUzp4Mgy6CYzeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1z8vucA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1z8vucA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369ef6so9633885e9.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789044276; x=1789649076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=F1z8vucAAaJS6wserE/YxUPorNq26A3L9sWyhoHpbv43UtLMoWrT1gpPSGj1ELGH1W
         eu4zdMG3s0hEUb30uy9JNUd1CrwLyNwQqq671IG38FSrKjl4K3SNjRascB565gb4RubT
         95Jj20n09J7wMdqx8Lzq6TVltlVx4X3TVQxFGzZ7wAoVa2G+AhHhEeYLtr6soK2a8+qa
         7h0SSn0gF5ZcRTQh/VqsAPSAwe/hb2ogtVGutQSuQ9ri7ItTbwuOQDY+F2/ufNKKEQLD
         Yp2oKYzV3iJ/g/9u2sDoCNq/w/z1p2dMl9hUHwPFR3K/+On4zXmtq18HME0EFu5iFqlj
         uLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044276; x=1789649076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rPs3zLWmwVwvVVM+gpBKczZPikUN8Un/vHgeN1cX9o=;
        b=m8N3hroACb0OA0lgDWIXYoozNCy31VPqw22ZWljXLAfCjYLrvX4VS1Vd7mIAyJVGe1
         GNZO/9PoTLxRlIZ5lWzaPpXk5jsQq3HQWwy9wrOEE8314jR0RWn4OaYGBN9oeuNJ4ncH
         09PygwVtO4/meSMmv+5RPVYDupoIZkaAmkEMrA7SOsvnBW6DZeyd3IvO8o5qcq8t3GtH
         v2P074jRpwoaWQs81dR/9bWNCXMyDVWmokd9QwSMuJWmh+bcbTzlVF/zVxys6OFT/nLm
         yosYjQnXqlfdhyp7EaJ8XDNSz7G27OeGyBS6gym9olvoqh8gp7RtQ7dyoZeSgAKP+XTd
         Yb3Q==
X-Forwarded-Encrypted: i=1; AKwUvByOf4/kua6aQJQohbWTpcjRhKnLWWWia9usGdwnsmJhYRH8Q5FUhpI7hIQxJzew6g4dPGKZfnH+RaPN@vger.kernel.org
X-Gm-Message-State: AFuF++nJyvjXskObFRoYoA41uAL7k42rtZ8wcpkNDXcN25aU4stG7pWr
	UxLp/Rt+uX2SQZu+cDtsDTb27HwCZk1+CSWaTicL0WNuckzRBUsxAYH8
X-Gm-Gg: AYBFou2Z8F7Hbh2lmygGrcZ5PKowuMYl/6MWZsK7K45mRy4TfZUnfSdxLvuhbv1Bp+B
	0FFtr1eBWaJA/eI1lVBm1hVfwyV8sZoniQxRUAawE/b7FID/CZABeGWID8yC4N0UWoFuJ5uOy/o
	ahuFtKguooDDTXPMxgeeU0o0zQC0/EV1xV0cE9jTr5hsEvY2yZjPxL90Ylwaa4rS9KTvLjrVXyi
	KmfxIhP6tSM/gskSopinrtU8UQht+7Z0rgRt8xkaBDlF5IaruZxW6VTeqcaX33gAVFafUaeBTjI
	S1KHZkWnJsSWswOcFtuhvFO6KKnEz8xQzfCYeH4m76GECm9TZwnEV/W8hpUkfKFD3uhkPFu7iXo
	9t+/Z1yXklNqnlB2LasvjkDo8G5ZgxtYnFdRFkGXnBoGEsRyKoH0M3HC1cBVRyHCb1UHHTYGKiY
	cbyt5HSejsWXbhebwz3vAvNWOGbjS4NFnXzVrceFUvFsg4gkXVTmfTY09PLHtsXVvFZidk5TTd3
	clHpwb1wVbncThEH46edu3c0OqLu0MnsAgvwUkmhPkpfw==
X-Received: by 2002:a05:600c:45d5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49d258f1d5cmr135945565e9.7.1789044275597;
        Thu, 10 Sep 2026 05:44:35 -0700 (PDT)
Received: from localhost.localdomain (mob-109-113-160-48.net.vodafone.it. [109.113.160.48])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm144440305e9.3.2026.09.10.05.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:44:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jishnu.prakash@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com,
	nihal.gupta@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	drajpura@qti.qualcomm.com,
	lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@gurudas.dev,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Thu, 10 Sep 2026 14:44:23 +0200
Message-ID: <178904426368.12167.11218867694394370234@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
References: <f7af73ad-f09b-433f-929b-cd6d22e2afd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 14:40:35 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Please note Mark has asked us to split the existing series, so we would
> be sending out separate patch series soon for CAMSS support and PM8010
> support.

Great, I'll test the PM8010 one as soon as it's out.

> Just asking, have you noticed any boards doing this currently ?

Only mine, and it's not upstream yet. Konrad's list is right - those are
all real PM8008s.

One correction to my earlier mail: the compatible does not change what
gets written to the rail. set_voltage_sel() writes millivolts, so 1.8 V
is 1800 in VSET either way. The wrong compatible only misdescribes the
LDO's range to the regulator core. Sorry for overstating it.

Thanks,
Oleg
