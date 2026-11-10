Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341115;
	b=zfaQyoT1M8mpSbkUX/QOMn706xFpPJBY5Rz+twnJkmFAuwWqL6gzWRpbvXY8npzBIDEE
	 foXHUqBWEwfOonX/K/T1cFSnbTmtBGPxhDDMA49O3BGQlpj34Gk4my49f1Ob7PnQrf2HO
	 d3rQXAzLuSWorOSiA75/+5winaDU4LugmW02K1c7YHb6IslAm/ApQ3GbWI9OAcBLpW2s5
	 Zf2QOTZ6IN9C0IWm81J9rPdcEhgjR9zikEYb+pT00vPplLbzeIbCBFCOLyhL4T6ar34eX
	 pcQzb7fAsblMfiC6QDak8xDAXHqrIGo4a6dsI4GHFanXGSo/fqtspvduClTQdjWSHeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
	b=qw9uZI3TwRrPXFbYJmHJ67Ad4YvQ07hAKZcwbNaM8JqUmjvpxZJpoA7G04q0RE4c+Xm0
	 oRTbrk6k1XDdQebPlIj0lui1OMd9ysyXn/t6x6sj1VGwbUTazfJ7f/FbzeOzNMp0ZsDov
	 fYKGk/yFGe5qQFZk/OCS5IhETN4cDRymU/9mmLm+uamt0Yq9cgh2rkLS5H/kfjDJInEG5
	 q2PG5IUWJ/dXU0NGVkBieU1n07IvaWkdXBtpHO77U/0jclEsfj2e8EbRZwP61wcTHWxIh
	 4sY+aznAgDDOp8waoHFg7GGcN/s9gjTH3q7Q4bEt18NkhG4X/XVU5tbuyeLT+/06V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5581606A323
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 20:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5581606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3JxG09s
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533861a59b8so28271351cf.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794341113; x=1794945913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=O3JxG09sfOPQXyY2Jbj/5vnyw/wprNi1mWfkH9fhwBL/IZqfGFDFKlC4qZSo4GR0/z
         Cm3zKVgy8FdT62Wy9KJL4yhL7YqGUNBczznzR4ZlfNRldoXJqT2wYz1GOvfbfxoMBDI1
         7vMJBBR6I5aVQLNI/NwS9ddt223r4CKtLy55L2OBQB4YJbW/yernVloAbeKnqNkiEfJk
         IMHJn3h/JG8GN3UZHhj2n7h4BPN5HQFAoeQD+Bdl4o6AsF7disKeWGLTzfGBfOkp7WwE
         dkZJ/oJ6DY30ubArQ32v3HdwmBzP3wFK/hBot2l83IV/nc/jGSa+m72yajjYiVit/X3V
         D9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341113; x=1794945913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygUwbvCgR8EJ0INYVhYaEUA+QbfoJ2U/iRHYIVhq5NA=;
        b=EVZsRTWFX+FAkiBw/FilsNPOzWesqsJIaOpqVgcSjrMQxOEVKUUWHvg2ml9D9Ojlga
         3Dc4hE/RSQ/Jsved2s5D8XLjEysokoUzqX2XfwuRzpLkb1Ie4ox64IwpEa2yD51qsuu6
         ZRsNMtjED5zqiohRXOJVTv/G6oPfgqANa7dOeLAUVzvI4KwTpuqzich6axJq94fFMtWY
         YsPaOA3GjLmKr+ZjvlY49ZmBfO1LAPizo7/SUrXhnwn6Hb7fZrWC8VdgK+JlmkOHmeQv
         G9MpR+BwCsWRw1Bn6mvCY56qaH2oNv269dIHQuuubsY83GqGT240fZWlIipsXDB4NL6U
         rByg==
X-Forwarded-Encrypted: i=1; AL+hErFV3BHz93wosT8u6zrKl+TGpKvQ/1sz+4HNLnW/3Fhlt8BDOGLJl0HI0up+qfUEGacLHEOL76ucYYF5@vger.kernel.org
X-Gm-Message-State: APuU4Z+4CeaZwdNHnSd2bSqxunSfuFQpOLiqRUOil+eIs8Xog9lf+lEN
	0/+EwGsIHf2wPEzDSkZa8nkmxv29yjmgYhgL4ce6IAM5ZTmicQJpKfoW
X-Gm-Gg: AYBFou0tzM7TASnZLbRxgpqK1apmN8l5txrTDyo7O14+p1Xrg4wR3OLjPFcv0fdJZDc
	Fg0k2CFzqNHS80BTWLoDvOplcyolnPTUP5kOLWhoVvriMXn8z5J3DSQH5rwHbx9MzshUr0N6lQk
	SUvBMcyQRiXOmTRVE/tS8uP8wqYlqjR6xBOG7Cu8tn2oNjQNwQVJcAIuBbkQ9iS/xLQvNGAeax8
	J5SwS9sMRP3DqpXmNf7mxtoipXqEd2ivZ7tM+jrTOrwGEov+esHusfBdWjkfr1im5Qz6OcbtI/2
	u2JY1vJUSu3MxauFGFAf9pZX9EigtYvF3yd5p3ZgUJncgJYhr0rHfFiXuIoSLQvCyKLjoSDnlaW
	VpqQsdhEURPGR+QmbzmhWQk8TGnrmQhsBXwQIxDrrT6zv10YIJJ1iaEhlpOk84zpcRAfCiL7f3u
	GTE45QM0G1sjD5tUZjomr0ZdMF9u2CznmhRZiIy+Sr3fsJCYeighUoArHfPJ5a2X1GIvNniM16G
	NaKu2f3k9nUNLyLxS6H5FUgLR/LlT7C6uTFt/j0vBnckFBjDrtnev17PBdorJPuPaZlNijbN6vU
	dSN/QJFCndQYSF1gTmfejBUrFwCn/llBJnXpzEGMmnBJG6ofamdTuUyIaiJDELD5NDKu8nmGcwS
	uoJoBBFQLl3mlFp4gaxupbCVILLlDWMXKoLxuCtOhSfr2wdgmTpqegB5gUYbNcSU+pE06NMABwL
	9a6Z+Ckg952vudZqlH1RDtF0gyys6tBKmkAZHjnCCRh+3gMC2UZrsYEgnh6duUM+15/7h9ReICG
	fLtgWi3/a2Ud6zRuMxTzBrbGn+I6KjMbU3F3rXmnteS1w==
X-Received: by 2002:a05:620a:4106:b0:93e:c12c:4416 with SMTP id af79cd13be357-947b00317e7mr4760385a.82.1794341113438;
        Tue, 10 Nov 2026 12:05:13 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm305084285a.16.2026.11.10.12.05.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:05:12 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI transfers
Date: Tue, 10 Nov 2026 15:05:11 -0500
Message-ID: <20261110200511.71673-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
References: <20260808172211.137577-1-jesse.casco@gmail.com> <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com> <CAEaxeoQUZKnCQPG_W0B77gB2VfC__-t7ZxY0mkVsqm1Q9pk6hw@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Konrad, Sibi,

I tracked down the timing issue on the ASUS Zenbook A16 (7.4-rc1 based,
arm,no-completion-irq removed). It depends on whether PSCI cpuidle is
already running when SCMI sends its first PERF (0x13) message:

- CPUCP_MBOX=y: first PERF message at 0.37 s, before cpuidle starts.
  PERF works for the whole boot, cpuidle included.
- CPUCP_MBOX=m (arm64 defconfig): first PERF message at 1.1-1.4 s,
  after cpuidle starts. No PERF reply ever gets a doorbell, so
  scmi-cpufreq and scmi-perf-domain fail with -110. BASE replies still
  ring.
- CPUCP_MBOX=m with cpuidle.off=1: PERF works.

In the failing case the firmware still writes the PERF replies (the
same request through SCMI RAW message_poll returns status 0), but
RX_MBOX_STAT never gets a bit, with EN=0x3 and MAP=~0, the same as in
the working case. So it looks like the CPUCP decides at the first PERF
exchange whether to ring for PERF, rather than a mailbox driver bug.

Please consider the DT patch withdrawn. Sibi, is this a known CPUCP
firmware behavior? In the meantime I could send an arm64 defconfig
change building QCOM_CPUCP_MBOX in, so defconfig kernels get cpufreq on
this machine, if that's acceptable.

Jesse
