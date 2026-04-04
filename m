Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2643246E8
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273509; cv=none; b=XeA1cIZYXR9wczKIhr/X/khN5AwWb4S1wLWjqcW54FEubm9rWHfPalc0X4VQU96k1OeDw6Na4NuvtD/EnIi3OgtZsKkYYMJ53Y2L+04UPyjbsxEvnC8waxqOHeTyKXjagZBuWAWX3Nmmy/YhAjCr3cixh7P7bYglaGD1nLuO7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273509; c=relaxed/simple;
	bh=myvzOKJS1/6TEZHDz+FEt5uniMoDvWvsRV444R4b1j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSRxBqbUL7td4nl0p6jxQxaKRLA8Bq1U7w8mGn15HtbyoG2QqEuXrjSvnfqkj5AIM53bx/fBYYR81t4RkzryOf2Rn9iihXQtDzYv3PyuUydalrkTRS0xPylphdQfJDfpXCJZ4xOj85N9uRldj8fA1ICsiZ1CUdOxS0bWzZb9Feo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb/Kuj2y; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb/Kuj2y"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-463a0e14abfso1414005b6e.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775273507; x=1775878307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=nb/Kuj2yCWkT74txP7r85wmHhJWBMiPmEvkIh3WfF0TQytQu5QdHhn8sZlouiNEQbD
         KFi6Ou7fzr5BU7kTgxzDrEiazNSBneednr8m4WpmCsb9JnJscQMxyyC7J8JxkdbtByEB
         hsKkWzw5wBHFUd4dB+nd0AKqJ3p5NKWgX61gXsjPwrOB/cWFZwrj2un0AfvqQtXw52dL
         MNpH2yFFLIQkd2DtsksjEMoM1YH1agGnUSnVRjXkuFiXU++pccR6Lm23Re5R6pdslBIn
         579vh1kffRyJxJNSDPlQR6la3HWXVujE89hjApec3qy26CGmLrWLvC1kg43v9AyWsGca
         7J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273507; x=1775878307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=hwVncMlQfaz93Npp+K9Y5Ty3hhnc2K5vfFsoawtxvM5NVGUZTY3jz1mWNsu2mfpPUT
         s1Tg/VCeJKrQiJcmNaDTcgza2gTTMvt7TfyZB5Mz4pznkJEFm+PNwfstpAvbw+frd3DV
         nTmaGRR9u9gwHWte8dHbiAXFKqi53Ct9p+Kiv3+Kike7v+FniFmvxS4eM7uw/F1npqs8
         hJG62RqZs4d74KMF2hNDv4SFVitfABRCtDSAjd8F8+5OPNKvjsiN9giHNvKmOYK/2dnr
         LEHgIqtmDuPHZDbIW9Fjj1H8ed9Qp6BkWEh9y/dF1tbN/Twfizmh34AXBFcgpOigJVmt
         ZqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKsxkfAXAzyE36qUmvdvqzo1dR32DipWgER2MQKLCIhHfcqBziEOJfA4D1i/X16841c7iUW8GTmlJZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk9HkrwU6XXMo6jH0HQH/onI7VqMdLAdGZMqRt6fe7VDAJX4ls
	lMmvxnZ8RisUuG4yCw8biDaF0AoDbOFf1zmGjKdYXOvL0O+hCkirepn+
X-Gm-Gg: ATEYQzzy7OaHD/7ubCCyzCNfxzKQZNVmDRimj0UpDvKaqDqtNzx27k3XTTMi1HWYgdr
	yBfMkB/hbzRf6eGrgF94HSQknxOG0o7oB3TLdEEOqXhHKU7In8ihG0sSXt4XZZH6OggjPFbMZIG
	u2bvWyahC0rDBSEV/Kmz/B+39N3FtlGatkPR3W07UEgBnRPZZ+KN/TuWM5U7V7euyx7W8mG97sz
	JaMxZnzyRbmzbNzvwfPlvoVwukya6EF/CKXucVwXb4ApMGYAjqmWpBZBRTqejzOUGbkD5hq0c2j
	SXy9cnYzVc+fnXZ01xDEFRnJuq1ZrbClNhL3Q3Vy6IxwZ4C6whShvx8by4+xKwdGbtxQvKxAzRz
	OaA1lO/tn0jUQycP/5UvEu4VdLAbbDuq0/7GKRdUPldo8ygWfNjFJnKNjFa20bOEZkaYDD5NXPE
	eoErIuT8RYG4QbwgR4XCtnYH+WUMX7bokQjohCrrQi0IW+M7pi+n6wFDeTCPN6bS4cn1wNWL8=
X-Received: by 2002:a05:6808:320f:b0:460:f435:2a70 with SMTP id 5614622812f47-46ef8845559mr3005591b6e.47.1775273507365;
        Fri, 03 Apr 2026 20:31:47 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d90447177sm4485675b6e.7.2026.04.03.20.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 20:31:46 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com,
	vikash.garodia@oss.qualcomm.com
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Date: Fri,  3 Apr 2026 22:31:45 -0500
Message-ID: <20260404033145.10625-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
References: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan, Dmitry, Vikash,

> > > But these logs don't capture, which buffers are causing the IOMMU error.
> >
> > I'd be interested to see if we can run this test on venus - instead of iris.

> At least when I tried testing it, venus wouldn't even boot the
> firmware on SC8280XP, citing UC_REGION error:

> 2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: non legacy binding
> 2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: invalid setting for UC_REGION
> 2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: failed to reset venus core
> 2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: probe with driver qcom-venus failed with error
> -22

The same is observed on the X13s, so venus doesn't load.

>  I think it was captured by Steev:

> > This is much better than the previous venus patchset where accessing the
> > hardware decoding would cause the machine to hard reset at least!

Indeed, the older venus patches would simply force the system to hard reset in
EL1, and in EL2 there is a fault (but the system recovers without the hard
reset.)

I do have a further question, isn't the information we need somewhere inside a
TZ managed context bank?  Can we even see in there from userspace?  I really am
out of my league here, but I'm willing to do any testing needed on the hardware
and I can use b4 with the best of them ;)

-- steev
