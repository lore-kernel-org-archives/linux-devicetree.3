Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593638;
	b=gBPFduoSdX1LklwBFAV7u1KUekzyNS/XUf4cC+RWMdJ5orYu8YVM/POy4ZAwiAf0+7NK
	 vMjqIQc39g8i49xv4meBV1L7U7pTk907S3IMIODKhBtTE1lk8p0gEc2Fd/SENKswYqyKJ
	 ydy3t6aqc0jCJchy72pOzmuuiK9fns+I0YF3+8VVkZilnoq+r4hI6bWbbalxN346PbIQd
	 PqvwWU+1WKbx5luQNqViku8u3F3zmNbh6T9MQr5l3QCMANHRZdYX19rZEQNpnJSvl8JH7
	 REIOP2ejgGRnA2R6SsWMZQRc9kNzIDGKgsVXSZUQ3nmPxXKqgY3FPxmjV05SiCDcfnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
	b=UOvHqSCBojU9o+1f9wDyXgkM7qC+Gvztl1GC4o7/dTk+JjDwGKS0/SBrE/kcOzzhy3TV
	 aQWqakZb9BnSjn3LM6uiod0g4udGG/Jzgf7CK/8zzkc+Ne7qg1p5+Uz3zQca04QC1EYBN
	 QK17CIgQM1Rc65oTdyRc8dvemzwJgonwklN8fC0tTELtGggbcGzykUUDpYz/wPGPzJUfE
	 VXaD5ssOOaHYQQwxOTfKyW82HsyTRPHkMpty4fElhTHVdWnJmJ/iIA8GLZBYIVbRCHSWD
	 2tSNanCD7i9glBr83plYcz/LElbEWA4s5ZYX4HwHqzNkS+t5nvO407EoGeu6iKqaooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B9606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ob872DEf
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso7533781fa.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593636; x=1793198436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=Ob872DEfECdrJK5rcadxSeTINa2R3SWYjAVksQcx6u8Y0WBhx6DD9Zg6jjBC9Nw8CI
         jTwxzV4diaMg1TmE31UYlW3jQzImoeLgRbu8BoKoShkPwswRHP9/a22GUcPq3OXY1Ajc
         VqwSmPTfE3WzPO+jDE38J3B7w5Ejh2qv9ekiAqomoCG8hEsLXD1vkyhLMdDT5sCe1ast
         j7ouDyrB4GOphshdOqtB6MKyhR1CoCWbiD2a6rchLomtwTeRqNpPeoAcxWZ7jS927InK
         9ccycYhNXxgBB2pD5TWTFbqzHseH4abOHhPNhRYymBUa3d45TcN4cbVa3p7OKBZrnje0
         NLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593636; x=1793198436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC3s2BvnjO6vQTjfoPdPvCQ10NTn2kZauw9NyfW3CCg=;
        b=Qd0BmB9tPNyVUwfpv0BA1FdFrWRgK8fctsbruOQfD1Dee0n0H9Rn09kVIj+w4eLeFc
         BSGsGGw4ELqf+JM4SXJ205kU2jr7PRKbS4f6HVok+FpJLpOP8WRW5a/zyGQT9mMSu59F
         MYEot93rxt31R21Jk2HVAT4gOaI6zZuVgoFd9BTOREYS8JXQuvHLMBS+ZQzJg8oEup/g
         DycRijEmENy2aG2iaj8DfUh8yOo3VJDkBmDerSmaM0q8XBRQA4b8ExTGF4+lkUkXHXy6
         2PaOquwrn6t0EdqYtuajNWI1NBRDXyT8qTwjr4bd7dNESDv1opVoy77KYKub3psgxIhT
         NL4g==
X-Forwarded-Encrypted: i=1; AKwUvBzBe8EhOWTo9tfrDxdogdTLPRmaxZXxyTLRw2SHOfwuZyU1mOIgvAj3Mtc9RaaabVvq53tgAhtVwTXs@vger.kernel.org
X-Gm-Message-State: AFq9FYJO+Y+t5wnu+VFcIBs9KTxPNra56qTWOdQCY08YMZDRP7rD3f9v
	r9rfTp7dw6oLyUTE1io1pshoBASv31LOPp1Ju5r/SRUfPmx6+hvhKEPAV0XsnhPo
X-Gm-Gg: AYBFou01a7vqG5aZQsi+Ug2rjwBS8G7vrK5s2sVOEuOZ7ApQZiosPPp25tNFbLoMriy
	ywVjm2jTvGXDxSYHrTKGG0XgZ9uso3lCUX5J1vURGOUbw5h7q1ELVfbBX/eLrHAkdQip0rVgdZA
	N5wPEzpodh/9uDZ1ZuEO2CpHsDJE8r2VdiP6gTpK9+fmW+62/XhFW9N5c7dzNEnYmst3K8TygHZ
	Yz/qcploj84e0AqvYA4k5eWa79iUzA3xJfI9sfFcUyrwuoJxNvvJvWHRLOmQbaijXBspZXhjrDr
	CP3oZR7tf85eBUI2mRuNjvranPSNc6he4VmJ02EWqZJqUSaZhfy1SppRm1pkxuw+KRt0wAEiuMb
	aar9w9K1C0TndOd2tmvzmY13TWbQN4+Fd4+84+ruh8GXW4aQoVci1ebdHLqhHqXPSMNls9p7iDu
	rJbglWImsNyEif2velXHhSJB1pbFh5kuAo2D8Dg95JQdR2vBq3O2nt27WpLRbPk15o5AyNg5TaM
	C+cjRcw4R+xzGzv8kwJ8iLnp1yQfY48mr/QpvmL5wfAiUYIOvsX8+aue231a1Vmj7mIq0t9og==
X-Received: by 2002:a05:651c:150a:b0:3a8:bd3d:549a with SMTP id 38308e7fff4ca-3ac44145e40mr6460711fa.7.1792593636213;
        Wed, 21 Oct 2026 07:40:36 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([94.126.152.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563bf7sm358271fa.18.2026.10.21.07.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Rillian Grant <rillian.grant@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen 1
Date: Wed, 21 Oct 2026 17:40:34 +0300
Message-ID: <20261021144034.1636708-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179198409516.839288.2293417415100693160@kernel.org>
References: <20261011191026.149338-1-rillian.grant@gmail.com> <20261011191026.149338-5-rillian.grant@gmail.com> <179198409516.839288.2293417415100693160@kernel.org>
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

Hi Lee,

We can share the board-description code in ipu-bridge and add flash-leds,
as Sakari and Andy suggested, while keeping per-board current settings.

Lenovo's packages set IRFlashLedIntensity=30 for the X1 [1] and 40 for
the X9 [2]. With both outputs using the same current setting, these
convert to nominal totals of 467350 uA and 608050 uA respectively. The
X9 result matches Rillian's trace; the X1 result is from static analysis,
with live Windows behavior still unverified.

My earlier claim that Windows applies a fixed configuration to any
LM3643 was too broad: the sensor configuration affects the current request.

Both default paths configure a 400 ms controller timeout. Actual mode,
pulse duration and continuous-torch limits remain unverified, so these
are candidate operating settings rather than established LED limits.

Rillian, could you share the relevant SPB trace, including mode, current
and timeout writes, together with the installed driver version?

[1] https://download.lenovo.com/pccbbs/mobiles/n4oce17w.html
[2] https://download.lenovo.com/pccbbs/mobiles/n4cim20w.html

Ruslan
