Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342488;
	b=GHVkCqqrIvx/CK4QhlGO3lCOk1fQe7/sVd753MaXz4ZW6cTnAzc3G9wy1+X4s+tKzpwl
	 BMB6Sy3tqYSZ3B6VUu4/Ffd5zBFyBsEohm42VFxY6H1OyfryY9XzMhKH5wyP1ZzmP8cUo
	 DrkiD8bkzagzJj22Qm6wTIlRZ/Tq2cyqD2yZoqfrtHfkEzJjSwAvR5uUxbn4RvW92Kqig
	 ADSMXC1sAC1ROtdlX9p48LwbDIdbUQCLMm7ldgLQ17aO6S+9kGVfLtLOwvAfMPSLPM691
	 CemNpifQeLZgowv/jP9n8TZd4Vhmh5G4xlHWE3dK0YOVEaTGpMlXtjt7LTq+hPaK0sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
	b=OVxY4QRvANOllerlgJfZU6pbK7a7uGK+08H4x6I8ZMzS6lZCuzbprV7NlC3HhmHzkTxO
	 E66uijD76/PneMemat5P0tGYr431LxvyA2gBWyxyWrKARUDmvVxbmdvBwa1F0k0ZnBwfz
	 U1zVvUoo4Kfrqq/X0IUNSCrV88EPVSnsZ1PdNttuUQ9Uenz0E289Hs9UdJIgmMzhAOlBl
	 PoIBdd7AHI33rD0Ii0yAJEFGYNdNQyeOV/uEMBUgeXDnrOrw9mx4tTq6Y42rkt1/nBwcJ
	 Vm+3m66WC0lTedNkfznf/UIOy6apfrDpjUr7VpbUU/usec+XXA1DfjH8JLt9yE0ASVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE540606A32C
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE540606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aDHtyFnn
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21058995e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795342486; x=1795947286; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=aDHtyFnnrzRBtyyZhnLselLVunVioNXJxNB4EW9L94a61SA06PRXZmc+GnmSXV/box
         iaAHTVrnRs8ObBKUlV2SgkLchAD1Gg5exAGml6I57wEAEE8CkMx283jLvJnGJgYwfxNl
         07S9UBEOuLbCp0RzRUPH9DDvGvrV8UujOKb3nAahk/QYa/QTczCXMZhMUvvVdna9RUct
         sfXxsU49qmORv24iGjit3+/wTQHJ8Njrey/8/vMahEUMN4olrlunYHXqPfYlgRSeAfJ8
         F1QYeyhKHrKMTTvIDsVf1BJep6E9Abmi3UrRh36o0TfvO5etYUsWf1tBQ5UNUM+EZ47y
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795342486; x=1795947286;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouqhCTz8e1ZRJCnOLQkSSdpF0DuIultw4i6SPTlpXdo=;
        b=cfSlGrUaZlVdbO2703WNhR8PFXYqZ5yasdt9+l1HQ/L9aIGU4xlIdk7c3K3RfeZqTa
         hIiF1m05W5BWcB0q3SFqwtnu0WF2fLd3YgexG1NV+xxSzZPxObfg4npcj8BD0USuiROU
         iDNY2mK0IpStIWYHQ8vRqtB+qqC2kEAPIj9IKokRSzofMp78b04a1rDF2cJphgyLG2kJ
         bDGNVsG4xbfvQba+Mg5PlhetPhp4kuSSrSdzK2Dz9uRuB7lhRUG0ALiuHw+dGlhDgDgf
         UJ7GmSMXCX5SBfv5XmOVviRr/bROX7MJ552z0j9Bw5/fpnzrIdhMkzIgCX7X5fk6yDzI
         hsYQ==
X-Forwarded-Encrypted: i=1; AL+hErECuFkM1uEkmXzvm2M2HrvFF4juzQJ3eWxKa9HK1kl8zuyLFMrA3oXyUGllxDc7zvQ7yKOXjJbKORkK@vger.kernel.org
X-Gm-Message-State: APuU4Z/e1cJygm0Z2sfY1hpt2uWF1BRppBzDf56Vq2PtqC21yRjzEWJr
	aiNY5fpv6EXCDV1gl+DsuweHpGDT8fW2WKUbBKTLz4J/2JQi8C+iQ4Tu
X-Gm-Gg: AZFdTZel4LOAKDxS/goZzaAfJmnATfiLZjKoyHKw0Jgo5iCpAUqsWea/mFzCnpuaJA8
	a82mYRrvoIV3UhgqcbpI2j6v/MkYrlbFqrJpLAOi/Dg5jcJBwDPnguRnhhDiNiWZMys0O1x2TGF
	ro52VwFMljp+Bh8ZANtvIXDDnlZHK18SUOpYCLVFk1vhrwRs5O4m5PwZlRi19djJF65x1zd2XQm
	iNhSQD2KLV8imtRu+yN88IK1BAC3FIzSxiCIN8LqDEQ7pzi8HVrMpjZ3G+dweZsIzeq1cJOXYr2
	AxkyiQmn6L39xbLN+PmJc8Y0+HWWJ68S1Wf08dqxi8b4K8LvyTCcTzKCviH5EHGPEoGdu2A/Hje
	+zkQPF7WtCQFVpZ1+EMWodZhjK8rlO4fi8R4J/P2CN7qceEgxW1ftpN4huQ8XArfi7n4MAwBWmx
	n3tPWWxcUYYtLO03CRDWNsRkjjD122s64nVvutNi5TkL2OJXeQkUEx3EVpV817HUepW8v3adCYb
	6N/Jxuf3jwvyiRpkF6mIrTrYWRxSeYV7lwO9kD7Bh0bkE9ClGnmJbSk
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr216757975e9.15.1795342486072;
        Sun, 22 Nov 2026 02:14:46 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm112778555e9.0.2026.11.22.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:14:45 -0800 (PST)
Date: Sun, 22 Nov 2026 02:14:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 yass27106@gmail.com
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA
In-Reply-To: <sashiko-outbox-217692@kernel.org>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <sashiko-outbox-217692@kernel.org>
Message-ID: <2920a713778046808ee4a8c2b12002f2@gmail.com>

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBubyBy
dXNoLCBqdXN0IG1ha2luZyBzdXJlIGl0IGRpZCBub3QgZmFsbAp0aHJvdWdoIHRoZSBjcmFja3Mu
CgpQYXRjaGVzIDEvMyBhbmQgMy8zIGFscmVhZHkgY2FycnkgS3J6eXN6dG9mJ3MgQWNrZWQtYnkg
YW5kIFNyaW5pJ3MKUmV2aWV3ZWQtYnk7IG9ubHkgMi8zICh0aGUgZGV2aWNlIHRyZWUgaXRzZWxm
KSBpcyBzdGlsbCBhd2FpdGluZyByZXZpZXcuCgpPbiB0aGUgcGFuZWwgcXVlc3Rpb24gU2FzaGlr
byByYWlzZWQ6IHRoZSBwYW5lbCBub2RlIGlzIGluaGVyaXRlZCBmcm9tIHRoZQpzaGFyZWQgeDEt
YXN1cy12aXZvYm9vay1zMTUuZHRzaSwgYW5kIGRpc3BsYXkgb3V0cHV0IHdvcmtzIGNvcnJlY3Rs
eSBvbgp0aGlzIGhhcmR3YXJlIHdpdGggaXQgKGlHUFUtYWNjZWxlcmF0ZWQgZGVza3RvcCkuIFRo
ZSBleGFjdCBwYW5lbCBtb2RlbCBoYXMKbm90IGJlZW4gaWRlbnRpZmllZCBmcm9tIEVESUQgeWV0
IC0gSSBjYW4gc2VuZCBhIGZvbGxvdy11cCByZWZpbmluZyB0aGUKcGFuZWwgZGVzY3JpcHRpb24g
b25jZSBpdCBpcywgb3IgYWRqdXN0IGl0IGluIHRoaXMgc2VyaWVzIGJlZm9yZWhhbmQgaWYgeW91
CndvdWxkIHByZWZlciB0aGF0IGJlZm9yZSB0aGUgYm9hcmQgaXMgbWVyZ2VkLgoKSXMgdGhlcmUg
YW55dGhpbmcgZWxzZSB5b3Ugd291bGQgbGlrZSBjaGFuZ2VkIGluIDIvMz8KCkJlc3QgcmVnYXJk
cywKRGFuaWVsIENhcnRlcgo=
