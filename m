Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D487037A82C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019376; cv=pass; b=P/Q4AfKpHePAIKq+VPurkEHvwPh3MFIOQHq0alQkEgbCTti8Ov/J9zKh5m4lW73YRZ+8O0xdmKi3AFTm5Bvk/rTWRCALpCnHK0em/RZpxClbqrklWsZKudtUV8HhgwB3e6N9zpRuIj4h9zVv0v2/nzexPsYnGOaYd7iHxInVvCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019376; c=relaxed/simple;
	bh=OC25YlyRx9xYw5QFFMPAEbb3+UJy6xb16cuf97R6i/8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=owhdSaK9iR8BOPEi3ezpyZTBXVkUNXZzMqw7mM/pO3ncBQJ+Jx7b1uFZk6hAiioNiAEUhHdyO7fjfDT5Wy7/E6eV68xZuDSi3e5qZ5ancYc/KPkAfBpiYcvFiAyvoMKqUA+ZZHLtZt1I62qmkM7NMKXBKWXasr3rZaXWFnQxQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXdGEjcD; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXdGEjcD"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b28814916so19925281fa.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783019373; cv=none;
        d=google.com; s=arc-20260327;
        b=RoYh8DrUd7c+AZcqAndqaLOxYl4RVYVabghAcn8D3sHT7SHIOg/Bcu0lqdcGrearyn
         nq/eHdSPObVVuotssS2rbjggXV+rT6f43wiZVOn7GSfLpoQv7nAgCUl8rNtL4SORyJUn
         RAYxD/VjYei5MiCZ51RCE6xGFCOlY7Dp/WDjW52ToicC2fdNhCEnw5IdY/gR1LQjKStb
         JekDiHqUiP35iQt1p7PRH7QfqMOIwv6mIuYn9oYkvbeKYLVD8hwigLqJsCJ2NI56Gyys
         QPUS+CEg33SdFeJheJjp2VuFnKmWP1cK9IunArZ5WszonU4h5iDDWH+RACKTbEGM/DAA
         7k+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        fh=APwMbNeKjejB60FKE+B8zmUIDmGTi9uzjNqYRNqkaYs=;
        b=ShwO608lOfyv17XHGuX1phtlOyJGhvvzBbixpgNUTTrOjdAFNxO/QzssMqEmUg6y7X
         TzROzR3wJwprr14lJAJRbXybsAG6OCLUvSas56L6OGofIbU4wlaohK1Hj0WL3o4HCoPd
         8wJKn6vFwRktopzAByz2mrDF8We4ihDbFUivcAUd+/0vZohp3l+VKslnb4IF0CTZE6BS
         /KqEaYIueoIVZiy58ZVqgdH0ZJxXKI2sr9vfCjk9Ys/ZsDsV780gWkIRME78lI7/Dt8g
         5imozImF+opMVALAASdaE3rfS4T/uZReXvXPCy/XOmtWtWOwDZZWk6Sr3qYaRzYohWOi
         OwCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783019373; x=1783624173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        b=sXdGEjcDZImjlwlqlUMQpE2XciklcPpA4EBMBdOJmWvxfYXRMRZ25FNiVgrdIwcyHE
         QDd04jbMHnk7eDHZK914wIfjFDMPh5/JhwK00WcJvzdy9RQRsL/VnaEINWRbv8dAV9Pe
         nRHKM7la9uqj1PPKcEEFEdvcWI2ureNTfLijVPOA6O0fDUGGNyiz7K+js3ebfdxFvmWv
         wScvWmQeixOvN3Z5itat2U5kE1mx9mwo3ve1l6YG5FyupOxgG0nlCxvSq2S29tNOkYqq
         q3DvM15XzFLxJW1JE6NJoI4QRM+O098i/L8qGROEru9g/4wteN5Y0NuP/bKWqyNMQqPb
         Qw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019373; x=1783624173;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        b=jVKLqNm2M685250Cke6Sk9cxWbwI5FFpH9cvBMizITPeQvz8PH9Xf+adarP+jnNjar
         IqPeX6FAt5WABN86JFYsqiYyEbWsS7Pa/MFdHBKSnIoo/ZnxXDpFESpV87FLDOK+i+nZ
         +nzi/5PUzhzvTd2zIY+WgDEp57a3MGNpLZDJqe7//MNzGIvUFTAiNcv1sRFloX88yB/q
         5tSWcV0S7yR+srCjMojT+mOah3Z5cVFVIHnAQh2wn22wWEzb7F0UYYhvl3gsJ0N/5gKy
         Kbzwf4jigHD1HKfog2eRukTMwQci1CPZRLijAhWC0aM4japZxwUOAxTGRFXqSXvxCDem
         vxGw==
X-Gm-Message-State: AOJu0YwB0KsrHwNuoy4NR7z301gaQIrRMvLN9z0Wn+JyVj3ym0lofkXv
	ZWpyDjJODOemTG3Um9JzRBb6qHRlMQUeElf9aAkQEDMuOnAt3Zmfh14Fmf1XowA60Gw3hW+bups
	EZxYpEoK5NaSxxEnjQaf9l9EHbxaunoemM1zB
X-Gm-Gg: AfdE7cmRW6dPJBv4L93N++V/eKF3PmlEb2pQpTGhmeyLo/jIMuPwYhPpiGjkWcIAy4r
	dV/WdDzS3GQaPLgjIvPCoN7YNPbIFjP0S0K0tbzih8U4pqD9Q+mMTq2ZQbgHOFx+LL3kp69Uk1M
	x3UHsIzTeEUHw9y8sU70foy1AQBUL10ICOym23ywSH3QSRzkfmIUb5kBUbZZApINCqX76IbWtfC
	zH1iMYV+YKiEPjzOJR942dEmNyfF65oYKKcgtMTsYosbv0uI9MsyKW4ocizgmc0YU+rxgh09rBt
	loJtVV0gAy5O39zZ4MoBGjEZXByvKDlKoSwlQ3WJU/P2qbvkoFHNXgrjBz/X
X-Received: by 2002:a2e:be88:0:b0:399:9436:15c8 with SMTP id
 38308e7fff4ca-39b36e37e85mr16121011fa.2.1783019372768; Thu, 02 Jul 2026
 12:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Brian Mayer <bleemayer@gmail.com>
Date: Thu, 2 Jul 2026 16:09:20 -0300
X-Gm-Features: AVVi8CdEvAr9zBugTIhbInCo1kaOhwZoytfXTRqItuxxgCr33NwvWgbLZiYlGvc
Message-ID: <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
Subject: [PATCH] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000057899e0655a58c94"

--00000000000057899e0655a58c94
Content-Type: text/plain; charset="UTF-8"

Hi kernel team.

I was testing building the kernel for my radxa cm5+io shield, and it turns
out there is no rtc in the DTS, so I got it from the radxa files.
This is my first email to you, please help me correct it if something is
off the standards.

The commit attached does the trick. I used AI to assist me in this in
case you're
wondering.

Best, Brian

--00000000000057899e0655a58c94
Content-Type: application/octet-stream; 
	name="0001-arm64-dts-rockchip-add-HYM8563-RTC-to-Radxa-CM5-IO-b.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-add-HYM8563-RTC-to-Radxa-CM5-IO-b.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mr3voroy0>
X-Attachment-Id: f_mr3voroy0

RnJvbSA4ODQxOTgxMDIxYjVmOTg1MjJhZDQ0ZmU0MGUxMWQwYzBlNzU2NTM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCAyIEp1bCAyMDI2IDE0OjUxOjUxIC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gYXJtNjQ6
IGR0czogcm9ja2NoaXA6IGFkZCBIWU04NTYzIFJUQyB0byBSYWR4YSBDTTUgSU8gYm9hcmQKClRo
ZSBSYWR4YSBDTTUgSU8gY2FycmllciBoYXMgYSBIYW95dSBIWU04NTYzIHJlYWwtdGltZSBjbG9j
ayBvbiBJMkM2IGF0CmFkZHJlc3MgMHg1MSwgd2l0aCBpdHMgaW50ZXJydXB0IGxpbmUgb24gR1BJ
TzBfQjAgYW5kIGEgQ1IxMjIwIGJhY2t1cApiYXR0ZXJ5IGhvbGRlci4gV2l0aG91dCBhIGRldmlj
ZSB0cmVlIG5vZGUsIG5vIC9kZXYvcnRjKiBhcHBlYXJzIGV2ZW4Kd2hlbiBDT05GSUdfUlRDX0RS
Vl9IWU04NTYzIGlzIGVuYWJsZWQuCgpEZXNjcmliZSB0aGUgUlRDLCB3aXJlIHRoZSBpbnRlcnJ1
cHQgcGluIHdpdGggYSBwdWxsLXVwLCBtYXJrIGl0IGFzIGEKd2FrZXVwIHNvdXJjZSwgYW5kIHBv
aW50IHRoZSBydGMwIGFsaWFzIGF0IGl0IHNvIFJUQ19IQ1RPU1lTL1NZU1RPSEMgdXNlCnRoZSBl
eHRlcm5hbCBjbG9jay4gV2lyaW5nIG1hdGNoZXMgUmFkeGEncyBkb3duc3RyZWFtIGJvYXJkIHN1
cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4K
VGVzdGVkLWJ5OiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4KLS0tCiAuLi4vZHRz
L3JvY2tjaGlwL3JrMzU4OHMtcmFkeGEtY201LWlvLmR0cyAgICAgfCAxOSArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODhzLXJhZHhhLWNtNS1pby5kdHMKaW5kZXgg
YWY0YTliYzAxLi4xYTJjNzI4MzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cm9ja2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzCkBAIC0xOSw2ICsxOSw3IEBAIC8gewog
CWFsaWFzZXMgewogCQlldGhlcm5ldDAgPSAmZ21hYzE7CiAJCW1tYzEgPSAmc2RtbWM7CisJCXJ0
YzAgPSAmaHltODU2MzsKIAl9OwogCiAJY2hvc2VuIHsKQEAgLTE5OCw2ICsxOTksMTggQEAgdXNi
YzBfZHBfYWx0bW9kZV9tdXg6IGVuZHBvaW50IHsKIAkJCX07CiAJCX07CiAJfTsKKworCWh5bTg1
NjM6IHJ0Y0A1MSB7CisJCWNvbXBhdGlibGUgPSAiaGFveXUsaHltODU2MyI7CisJCXJlZyA9IDww
eDUxPjsKKwkJI2Nsb2NrLWNlbGxzID0gPDA+OworCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiaHlt
ODU2MyI7CisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8wPjsKKwkJaW50ZXJydXB0cyA9IDxS
S19QQjAgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
KwkJcGluY3RybC0wID0gPCZydGNfaW50PjsKKwkJd2FrZXVwLXNvdXJjZTsKKwl9OwogfTsKIAog
JmkyczVfOGNoIHsKQEAgLTIyMSw2ICsyMzQsMTIgQEAgdXNiYzBfaW50OiB1c2JjMC1pbnQgewog
CQl9OwogCX07CiAKKwloeW04NTYzIHsKKwkJcnRjX2ludDogcnRjLWludCB7CisJCQlyb2NrY2hp
cCxwaW5zID0gPDAgUktfUEIwIFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX3VwPjsKKwkJfTsKKwl9
OworCiAJaGRtaSB7CiAJCWhkbWkwX3R4X29uX2g6IGhkbWkwLXR4LW9uLWggewogCQkJcm9ja2No
aXAscGlucyA9IDw0IFJLX1BCNiBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCmJhc2Ut
Y29tbWl0OiA4NzMyMGJlOWYwZDI0ZmNlNjc2MzFiN2VlZjkxOWYwYjc5YzNlNDVjCi0tIAoyLjU0
LjAKCg==
--00000000000057899e0655a58c94--
