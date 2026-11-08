Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794172436;
	b=GQliPN3EaJBZwpSGKxOxz+QpKYBZqnpjUP3+N6QGxPmg7m9etdw1p/GG+ns0eNVwpOZF
	 3tHEz2XDEI8SqDzk6f5/vnRaYS8TJy3WhynALa8UzMZYKF1vZBhMBurMSzmBP3OeZbrxT
	 FrVzNX+HHMyDV0yLxUZNYIziDmzkxswDC7HxB7BxZClL0rjX2/iOledLPyTQC5q/NApvK
	 44Xg+yraNjJfHuvcC04rX7geSrniA3OHV7tNsEEyEQEK16xx+qJv/Oc7BR1a5TGNNVTzx
	 IbZ6Zrx2yS8LS34DgpyjZT9oA+HXKR1Wc3I/gUy/UlQT0f20Xg+Bwm4c3gg09nCKoTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
	b=4PQEecRrkzHJPUe9JMfrus6UWiYhJVZXwVcTFK06vSOQThVNAxez6Up6vHZM2llx5cpO
	 vdLKPq3HsHAnPZIeAs6wuMRJoYcI7EueAusEnsq6GG1OLCgzJ5K4+nr6OQsw5t9RDkK+r
	 rDN63euwHI29VImeXPpGnYs4Vd1KzzR+nKAbKMs8tX9PMhhjVmYkq+m7O4Hf9PNEZngaW
	 HcgswKeJ1WrTa1f4IQqAAHSqjz870q2mAZRbmAHuOyO8y0cunLiruY2k/yihB5D2W8c6x
	 o52NCjM2gXk71FXrV2ICK0Foefti83LpORl20NXGqObIKyOB+gaSbuPxwayo4wCMFRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh6bg9I8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E72606A330
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E72606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh6bg9I8
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b0db268bd8so1676277b3.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794172435; cv=none;
        d=google.com; s=arc-20260327;
        b=IhT/NaErkIzc34rqYXGMLkbNeK6af3MWliBk06mbMJKFsq2laKJapKya04yAFvKuXo
         pCNbS/x3kOt0TLt0ZBuqPUkyPjL4Qgpu6tT1wEG341uzuOyGDvsEOsiYfS4NNbi/5C9a
         tJ77xjmnWSd09Z+lOYQICm4eOj5/Yma5VgG6BDO6mmsoYHeuNp4rp0VSHPODZXioMiAZ
         gJKaxuRMruUawvvuUKm5UvQJmvzCw5OK4HCNtW3hUbRx2//1eKAOXsPLAhdDHOwSx4VV
         I5HYTlqCMp6yk2XyP78jn34H5QDKBLwEQfi6AOP88l4wg0VAcVcrAE5ggzELMgMPKpVa
         gQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        fh=/qBD8cMvqcidIioULcqVXmgBGXRyq4ttQljX9hGCJV8=;
        b=ZKdIqsj86A5SXoVzepqcV35xrhn+gE9epyUHEGni8h77WGMQZpgtz+0KqX52jjwVP6
         lEluyHN1Y0PiAfN74m4ZchWptfSSq1EMQ7GIRHkyg2CBtZ12UUNfrdknWVmSbEFaXNFp
         Nc2j0OxnxSk/7jcIb+WLc/HkouhoT5rjFlOb8WfhRy3OnwcT6u1/AL7ksDyq/Jp0lFKS
         6pSJYgNVtkZ4NPspq7BhOGXixWyLitUTYer/VNppJOiI6oyDVr76YxPhRodjnBYhxl27
         PVGzq2Jv980VVBGyQLBpV09AFJHBj5A5qX94Hif4BpiflnzaoNupwwGU1WYOfAdBdJAm
         0tvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794172435; x=1794777235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=Eh6bg9I8Xv8aNFDUn22j+OYkxWliSEioMKSLE8BgeHxwbVVwjgCS4w3bsfjPJ4ULsc
         tQTaFKczOqjMhElp9c4h1W+iR/iSfwlHGKdudqCoP8dDhK8RF7xGPHUuAHDV/sf6QkMx
         Q93W7gijLM/FwZv+BHzx2+RijM9VBX563pjbbpro1/lU2DVrbn5h+c7AEKcx0bAmMbMI
         V71hj7E/Cim2q/CpycuXTa9zNcOByVbHn8YFH8/rmtrem5QM74hVAfS4gzR8hIxsjn6W
         taZuvxeObvJNFC8fu7xWwmx/wXuz8BC8k2rrS3/VYDfmgI4Iq3cOjkIwCvW9W3xYUxVT
         O4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172435; x=1794777235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RdQiDvGhrz2jeibJ/xmaH/ZZ1om+0FyGzyew07OZ+A=;
        b=iamHyLkxtQaYnWcGi5vfFvCtGrcIf/9comnZRnu9/kUNWfObEd7S4BibNKxhOny1Ws
         fDEY4ZPWbGwm4/cm49nMt7T+twmI1QmSR5GpzbzhBzu9b4j7tyhtJM5S+mido5PFTjDY
         riSERfEYZK8L6EpWy2i4HMLIEfHVE0F9pyLgcPRD2WHyOX7B+e1Ge1MT2xygV3ZfqtRr
         KFPPgOvR8BqLv38gnrP22ETezGUHdtsIg2nS0rODbmqqih32goIDsPerAdWZLMsmGVHb
         CP8QV6t5onrBz5RPxu2WOqioNOMduixB1K+GtFlH56DAS+C1aMrGY1tMRHP78KPd2MQ8
         9pxw==
X-Forwarded-Encrypted: i=1; AL+hErFWHwAn369n12+JMYfmwZrbBXPHT+zovbS85qpN8K/irvgvF+r+41qwWOXt0Tvun2J0WUdWvGuAroJ3@vger.kernel.org
X-Gm-Message-State: APuU4Z9Mu+pZrcctyHe7NRYCrPhqSyw8bcjsA2v8kzxNb9/jxDov+fJ1
	R+k7u+fPszk1jRKv/jT3eazwgH5NrOtVvaivd6xWKvNzckHhun1OBN/2gnfy4V2IUkA/xDSrJjX
	jXQfT6LlLBjPkjnXLehZfOJZXMvCZ4D1suQ==
X-Gm-Gg: AYBFou2XxwruiYnmBGc6ePMVS6YKSaQneQXu68FlIimoCWKYXITXOUBM0jjB2/Q2dA2
	iB9aSQlc40r3tmrvwF3hSxYEq8Tc6AjNT3OCEQnNSMyHT7tsyB1avRP2KZO0VX0Db29b6yVEfVS
	m45MJeAWqJFAvjAPNHfzG2jy+L/QQOghHs2syRUEO16sTBNpFCvnD+AdPb16zKTPkVvA0VcCURd
	o3fkQG+FObGtlfheV+y/hm+6vh5ovKA75qd4mtSTVmEv5mq5YoNqOCfDIcqKJCOp60Lnnmw/OiJ
	7jjCnBoZ1ZVZOCFn2Qqtu+iv0Tq+TkHuK3AJW5rdi3gZqKYAWAvRa/4h5Z3TBGm8n+yTD6zSv2w
	0hqUmfmzIium8pxgpKDWrlMzFlak9sNLyAdeCZfOSz2d00BOJyhh2BfWdl72qDC31KdjxGw==
X-Received: by 2002:a05:690e:14c6:b0:67c:2674:6992 with SMTP id
 956f58d0204a3-67c3d7b92a9mr1205372d50.2.1794172434690; Sun, 08 Nov 2026
 13:13:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com> <179369963832.2329937.7183164129825631720.b4-ty@b4>
In-Reply-To: <179369963832.2329937.7183164129825631720.b4-ty@b4>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:13:44 +0100
X-Gm-Features: AclHuK8wx9FMQM5aByRf496tUFpAvyiGNK18M8rQvRUAwwPg-HD-rkEq4isW6Fg
Message-ID: <CAFBinCA+4iF4u5qAMh78EVqjLTrx+2z68n2MC76bFHUJYbe3kg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:53=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On Mon, 02 Nov 2026 00:20:11 +0100, Martin Blumenstingl wrote:
> > The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
> > identifying it as a Synopsys DWMAC 3.70a core.
> >
> > Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.
>
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogi=
c/linux.git (v7.5/arm-dt)
>
> [1/1] arm: dts: meson8m2: add dwmac 3.70a compatible
>       https://git.kernel.org/amlogic/c/88da0c14921c8def2775d5238ecaa5934e=
603da0
Neil, sorry for having to bother you here.
Can you please s/arm:/ARM:/ in $subject?
