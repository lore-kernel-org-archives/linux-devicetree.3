Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603782;
	b=NE0kfllW4hhqyxcdjpLN9bNxHXnF3TKZkfPT5tpkEcLhCkB+fjF2pYIR8eDxyC/OmdyI
	 lbinkSXXrjFpWhNylAk6FT2glmXdqXw1yv2XV9daedb48GYuOFzkpKRtuUMGmK8y7hppM
	 kgpcnYo5yjwsVL9ccIX7nLmRSeuXOnnyaNFo4NzMfeHVyUM3QH9GuhTalVq8U19y2nMSt
	 ZwSglcDEBPtUI9CxqiPzQj1wPV1dAgKI4yLdvfCP8N0bacadWJPGIDSekUYIY3bY7TNlO
	 5p+LwudlysOWPAr0T3joRT35W0RKMeqmWpPnqeyS2shD2YWrlAIQzfdWWDLp7ZJbRKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
	b=vda3z1MJxxDxMKjGBnt+YBs4EZXvscHHuR4cHqOf6+tPi/TdjjEfEIOOZ/3GSwO1T1Hg
	 vX/biRgR3cE4jDurv2w6B+LicHVvXZJfVsbjB0KUDCm5BliSkcMm2Wg6fgbsd7Dhpvxkg
	 p64FW8WHGeplP9NypzOtd3bSI3V4p1z+NZ9QwnL0r1fMJPts38QmdUOd/P12z6bEBMtJ8
	 GpTRkgVwKZI/gYbdivgKZvssSHkuVBpHrEJbKoqgf4a9BJZ7G+d/jASTJfZ/fi/7BwPCI
	 qcLHpWBnu3bldEDQi+FT/VWOYVG88e+REaEZLy/B16GTxJ6GtafEPG+wujk22L+Y69Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15552606A33F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15552606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so6426115e9.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603780; x=1795208580; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=CHLACVWhovnsNiZdUJHI0G3UixV34Vj/LecHfz/DFEkccalsYUW3udTSzkysCOGL1b
         aDqILnh4yZF59Gy3/31VIkG/DkCRlPI6iuNa3m9Me9GUazkGC3JEKcBAsqH5XWnZt+QO
         oFn/p0TQpQxOcESlUjguSqrsQP99L0DpeWO2UgyV9wb3LuQF+UrrTIgYAoVwcHmdZMjW
         h2oOo1blRZdaUOf0Bf3p5EVNpebP3WSOOrD0jZCUQk5DCGsvzItGoOJS8k9yGgbyUAq3
         PIQX4Q/zT8wZtnkDKIaJvCRm0fifsBFShIovQqDY2okGec1NyQ5uZ1F+HMyORVto6fOE
         GzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603780; x=1795208580;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=a+xhg4oFIf25OVRjgOraMSOj4rviMx9AApO/m4GED+D/tBsISqc1MneCwscdnKkmlD
         WL9g4tEuJ1J9eu2LSoRokYuij4NpS7bRUv34wFW3oZBhC1ASrt0zKdnLX8cNfwPEqA1L
         7lHXfJaM7j49eO6fs1JQNc9HFMn1grkAsTSOvdIBqTJHZINKgl13LvJrLR38vC+FlQ5G
         XrA2mt5+flwbQb4HPVaeno7xiwt0OF0BXgGEayAHuuXyJEpHtMQCjJ7DTBgreY8HhfN2
         xRzMReE/yCp3U9Avk9ObWWQjnIFE0XbeyZiP/5HGZ0KiYfsqUiNx379re9qHqoSANz8l
         4KrQ==
X-Forwarded-Encrypted: i=1; AL+hErGORrqPzkxQHl9+6Xh6cx6NLFLORBcuanyAWSfPvcausaS3oW88rU5Hdv//G7uftD2f2ZnN/ma2W/Rz@vger.kernel.org
X-Gm-Message-State: APuU4Z/TrBdu950A7Wc3XoXNoQgLxXjBAF5SwKs58gFXC3aLM4n4271m
	AZK/+4lIqTq2kmYUYJJfzxJjowEz3LwbIcz36fsXl7H2olNGg1FpT5HSt7BFXQ==
X-Gm-Gg: AYBFou3yQrcXpfVqggShgb4aLJIZP64+prDCyIQZl5cbO7KuVjodhoQn3ylU1n3FitF
	sXin1fND7MJZP1O9nCq7vU5pdY2nEtjs+P1PI9tBSfKMNcIHPKCbLqEe+kwaFJPjB8olorWD15P
	MuyC9GDQKiMbF9tiKgXM+UlHIBPnq2jqcuou4By7rRoitcz1zV/KkCcu4damAruBxHvpZRmigG3
	03MRqrZLVWrZnTJwjVU3ua/Lv3NhJUVVF7/MtVhnygI4bHE0yfyw+ah2UBhaxbxuVXzqFFCjlUD
	PE1e653noxLRyGLQ6ehUvegP9RLxgNbmM3YSuw6LCtKcVTo932qVEJlxNQerQww7YBa6PsHf1pv
	P+tcEx95EA5RKAGCAwveZpOOBYXciqMWY56CKum3pReayyAcInlDGSExzMg9HGZONpm9mZ0cg2f
	s0Vdb85MemIjhayklKrqEpJgaRalQAg7SJt4zi/wewIe0uJAq7cisJY/E3rWyY5W3VIVkHkIeZ+
	C9rsVfj4rdZaTX6VD9JGmBiGDHZtVkuFe5YDk9WgvOltUXKIdWK
X-Received: by 2002:a05:600c:628c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb55a7f885mr75593975e9.31.1794603780470;
        Fri, 13 Nov 2026 13:03:00 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:58 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:58 -0800 (PST)
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
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v3 4/4] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciwgaW4gcHJvYmUgYW5kIGluIHRoZQpydW50aW1lIHJlc3VtZSBwYXRoLCByZS1l
bmFibGluZyB0aGUgd2FrZSBJUlEgb24gdGhlIHJlc3VtZSBlcnJvcgpwYXRoLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIENhcnRlciA8eWFzczI3MTA2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNDczNDQ5ZGJk
ZmEuLmM0NGJjZDBmMGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysr
IGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03OTksNyArNzk5LDkgQEAgc3RhdGljIGly
cXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJ
dTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBh
cmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5o
Y2xrKSkKKwkJcmV0dXJuIElSUV9IQU5ETEVEOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3Ry
bC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRy
X3N0cyk7CkBAIC0xNjk2LDcgKzE2OTgsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQlj
bGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5h
YmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYg
PSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgyMSw3ICsx
ODI3LDE0IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9pcnEp
OwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkgeworCQlpZiAoY3RybC0+d2FrZV9p
cnEgPiAwKSB7CisJCQlpZiAoaXJxZF9pcnFfZGlzYWJsZWQoaXJxX2dldF9pcnFfZGF0YShjdHJs
LT53YWtlX2lycSkpKQorCQkJCWVuYWJsZV9pcnEoY3RybC0+d2FrZV9pcnEpOworCQl9CisJCXJl
dHVybiByZXQ7CisJfQogCiAJaWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewog
CQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==
