Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9824371053
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252505; cv=none; b=JyZ5u1WwgJZsQ8fI3AznwBhEicLrKJ3yCcg1icTVCnbwVbpydPLinyUbPM2GZosJ8n/V58uJ6p45e+RCw0UNf9xtijAjzX6HrAPXs9ASZgJ2F89EuLKbiLzTOHFOnkp2HUojnHo8gfdProR2IZBvPtT/Y79Q5YlOVMLCfUCMQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252505; c=relaxed/simple;
	bh=aNqo3VMozaVfeBSUz7AnkpMWki798TmNnJ8/9zzdduE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSzc5Rehx8fCGpI4+4kHfesPK5InFtvZqEdrwTyibnE9/c+3v/eI9OKPKy8vX8bcOUF+H/hxLaAOSc6fnSApR49h2Ejb7eU9ieqNqFpz8wJX4h+fEhshe8Gwk2uvgTw73bUp1NFxJ3F3qxRibNjWTRO1kxdkbBpL2UsMzIG7DYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiaUNzmM; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiaUNzmM"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-67f921159c0so1026067eaf.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775252502; x=1775857302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVNcwvGWChEYY43mjLuxLc5r/Yw+nmvsqVmyVp0sV/4=;
        b=UiaUNzmM5opWIzreUxi8kKeI0EQbHvFnUCZpS6Gll9SbV5DskLdlqOc/oBizh6NKza
         OFQSDo2Nf4SLG+8YVtM0mzQ2vX8/4DI0IjZZo1d4yjCMJ5gclETo5PIhnIYDmD1k4UGk
         6A1Zo1S2jvTcLD9F7kSHlQAqJsWTVDsA/SYOD2RXwrT6hmNoAggbcfcPinyxom6L4oi9
         aGDhf5c/S7xpK4ZzKi0/Z82TjRJ6lOuL5VXyYLoG71rfBnpT6TPjv2r3tV+zi10y8LND
         fPEt1+M8JJYUixHifQPSqBD9x/PF7iVVlL9FxqhCHLIDiX4YFuquo/LUmhoxygmoSx3M
         DjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252502; x=1775857302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVNcwvGWChEYY43mjLuxLc5r/Yw+nmvsqVmyVp0sV/4=;
        b=HSI2wOYYfxzdyTNtcb0LNS3ph/iDBo9YQDYnAx8iH8Awc2pOXAefQoBmcq1qP1pZPK
         xe4iiwYHh3VqovhRq4CuU4nYURAKRhoIFJ7nMgQlRJVwxUccj/JTLY52eCu6nDEh/+3F
         HCNIo1Y7RYQfVFcX6ySB9u31jWct/tCEpJzTzre0g4ynPG24yZ3FZQnMH7TVfRI/qzvU
         ItciFkgFmofnhsCAXAJawL0wuuwniKVu3zXzloFwDErqo/2QzT7sw4Bt6e1WDf45ZDs0
         0gfyizpYaRiW4Wyole1vc+9V8rQ2RAL5V3bprO9lfm/KQjWJUF4V1H7ZXGXCRiP4ieoh
         mCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyUhQPLBkiyf2a4QsK9yk9nH2cY7WKpXxvo7sMaFp7z+YsuYnpYvfi9Wc8YupbrvYnUaVFTf6/uBg6@vger.kernel.org
X-Gm-Message-State: AOJu0YyujSaNKaa7N6ZR8/2aVqPlu/tCY35GMTcPvnd0+/37IM5k8J3g
	XYjmcCVHMuAd7vSnUvibBj1UpMs10KZ3yT9QygjnGdjGkj6FQiDtCOB7
X-Gm-Gg: ATEYQzxufjNDAqB4nxc6mRnwrfBwaPJIP3m7uin7+JS7ZWxMrPA79ER/mUE5//WUg4o
	7lpQKc6yuxPSDS1WZkd0rvVVf1MUdg/CF9Rd5evfIoH4njay4EXQKaJizQ+wRjIfDE06Fqf/qOs
	bvNyeTJixo/hbC6RgDf31WrEk+94DEruqcYQWWF95bns6DlcCXApUSZOEjjyN3+hbuDhR+a3fd+
	YMhqUGyPzdmIl1UAktbcnc72smSuoJECSubU9JI9pA/BLc98Za4a14UR1zSjKtVNl9AWuIkd1BU
	LenBCf4JCi6+mB0nj9oa5k9tPhcHYJmEdaVTSA2M1ZV7fCGnYRqArE1opqVXNBaPKnUnRyXqjW6
	mq/7vf1mGZfAMhEc93JUAyypqna7KUSLTROxLFDdkbXUbub22dHACqnU7O903leisRR3x9vxYw4
	UT/hzXb9/yFyJd2yBdquswu7RQ1C9woYvzjLe7JuoJza+4Fe6wlRS3wAAu/E8hPvWTfxFeZEU=
X-Received: by 2002:a05:6820:8c3:b0:67e:d8c:9f87 with SMTP id 006d021491bc7-6821d23dad7mr2348863eaf.5.1775252501679;
        Fri, 03 Apr 2026 14:41:41 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-682ba3cbe72sm1309071eaf.11.2026.04.03.14.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:41:41 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: vikash.garodia@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
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
	threeway@gmail.com
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Date: Fri,  3 Apr 2026 16:41:39 -0500
Message-ID: <20260403214140.7307-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vikash,

>> This is not just with totem, showtime shows the same issue.  If I let the video
>> play, it plays just fine, however, if I attempt to skip forward, back, or even
>> play *after* the video has played, then I see the smmu fault
>>
>>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6

> please log the info about which "iova=0xd51e3e00" buffer is faulting in
> this case

I will include the diff that I applied against my kernel, in case this isn't the
correct information, but I get the following output in EL2:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:11, data2:deadbead)
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4

And the following output in EL2:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4



And the diff I had to come up with to get this output is:



diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e29..a57a0e4971c8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -214,7 +214,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
        iris_inst_sub_state_change_drc_last(inst);
 }

-static void
+static noinline void
 iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 {
        struct hfi_msg_event_notify_pkt *pkt = packet;
@@ -235,7 +235,25 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
        schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 }

-static void
+static noinline void iris_dump_inst_buffers(struct iris_inst *inst)
+{
+       struct iris_buffer *buf;
+       int i;
+
+       for (i = 0; i < BUF_TYPE_MAX; i++) {
+               list_for_each_entry(buf, &inst->buffers[i].list, list) {
+                       if (!buf->device_addr)
+                               continue;
+                       dev_err(inst->core->dev,
+                               "buf_type=%d idx=%u iova=%pad size=%zu attr=0x%x\n",
+                               i, buf->index,
+                               &buf->device_addr, buf->buffer_size,
+                               buf->attr);
+               }
+       }
+}
+
+static noinline void
 iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_notify_pkt *pkt)
 {
        switch (pkt->event_data1) {
@@ -263,7 +281,7 @@ iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_n
        }
 }

-static void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *packet)
+static noinline void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *packet)
 {
        struct hfi_msg_event_notify_pkt *pkt = packet;

@@ -593,7 +611,7 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos= {
        },
 };

-static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
+static noinline void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
 {
        struct hfi_pkt_hdr *hdr = (struct hfi_pkt_hdr *)response;
        const struct iris_hfi_gen1_response_pkt_info *pkt_info;
@@ -631,6 +649,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
                if (inst) {
                        mutex_lock(&inst->lock);
                        iris_hfi_gen1_session_event_notify(inst, hdr);
+                       if (inst->state == IRIS_INST_ERROR)
+                               iris_dump_inst_buffers(inst);
                        mutex_unlock(&inst->lock);
                } else {
                        iris_hfi_gen1_sys_event_notify(core, hdr);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..45f349bd8b71 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -74,9 +74,9 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
        return 0;
 }

-struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
+noinline struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 {
-       struct iris_inst *inst;
+       struct iris_inst *inst = NULL;

        mutex_lock(&core->lock);
        list_for_each_entry(inst, &core->instances, list) {
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..5cc47e900c83 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -168,17 +168,8 @@ int iris_open(struct file *filp)
        mutex_init(&inst->lock);
        mutex_init(&inst->ctx_q_lock);

-       INIT_LIST_HEAD(&inst->buffers[BUF_BIN].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_ARP].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_COMV].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_NON_COMV].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_LINE].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_DPB].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_PERSIST].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+       for (int i = 0; i < BUF_TYPE_MAX; i++)
+               INIT_LIST_HEAD(&inst->buffers[i].list);
        init_completion(&inst->completion);
        init_completion(&inst->flush_completion);


Please let me know if this is the information you are after, and if not, could
you provide a patch to help me get it?  I had to noinline a lot of things, as
you can see, otherwise I was just getting null dereferences when trying to get
the buffers.

> Regards,
> Vikash

-- steev
