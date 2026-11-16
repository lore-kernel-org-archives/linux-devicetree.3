Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862553;
	b=YWzqq2zQw7eo8iOLmlrAGO3cmc6zuME0o4Yo8wPI8PaqjWv4gSlwEmY0atdPtXHEJewE
	 jzesVVvNDL0H00H83hAVzagiLSXj5c6JsHriARgPf0gKJ2W27y3GXF2EJija19T9y9aKF
	 H7JGu5j4sNMprXLh04ydJqxOijwUvaWgAbVccv8b2cb3bpCw2FQZSRZ/EAg+sO6rYgDA3
	 bTCGEmJ4q0KudVnMhAcMQ7r9SPmvDJ9g8bMK7dMenglmrLVdCdBF/jxsmRTtwnQL6/8xn
	 ysSfWPEHZ4YsA5f1u+MEQavfPGzURj8Yh0L3L6XLkjxA58vu0ZhOrU7/riW1qbr74xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
	b=3W+pSmap9jr3RbvElvygf2uYrLSO8tH5KIDcKZ8B5u6wU7syw56fZ4ocybEHfM7tDo5u
	 VCBdtvXCrny9gl4EYNcv77d11siw0bGUng0UAA69YlVLRF3sHpMwvdH3WAY6w34RQhsMl
	 IkxMEHDsZODQmv9jilfDrHcoLey6jb+nlq+mtRRWGGBjeOc47bXnQos1LMX12BAWcQiLl
	 FQFl+hD4mWr5muBQMquSN0iJADV9LqcOIh6n2H/8LkC5sZruYs6GbsLhzCyL9ZigYr2nV
	 Nj8tvohXgUQmdF1WHrsL6qla5w/IjgrgSJxXggo73qQbc7UCJzxx4gaV8iDdcq9+REQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8F606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C8F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VhXSKqN2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15766905e9.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862551; x=1795467351; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=VhXSKqN2KUJdD6k1M2C4NY2RWNQXwLUMa7za0KGRNTAszgCYrmzIrdkvn3YP2iZASp
         Okn2ZahhPIfImI6ASXd9oczijF5PYBuze1NR3SYEI/SPa8igSIUyONqgJjxRqh0fggnD
         OAGgxT6vOcKq4YkYpXZwpRxKF8KioS+AU93pG5/WJab+tK+M7cUEZgQkfGjDBvJjpbMF
         OmGYDullBl6FYriNxEKpo6GxS/Stf/V4L0w1v2A75LXSX9u4WLPkm6a4Bw/IlxWZT1a8
         HseiGkliKx4G1IRTjhBU0w+LnGW8MvAjCoxKhsfkfCtu3fNSWNq8USbBr/UfPKMVXuuQ
         A7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862551; x=1795467351;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SkNYFxJc3DZZWcX5OljBGNiBGXFShyFqF8augBNqOFM=;
        b=p41Afh1IuhB86gCZe35HL00q2yOaU2Gh1hjc2uN3f+uEct0fGgt8QVQrSo1JueD/n/
         cQk/gwjWg26U4GYvDFUuraMyhQuypQ9NrFfHwTzMmu2+Zc/L1/EriO3HsZT37B+nBD1m
         9RwuHs8dV9lWJz4ByxqLhQJFTsY3CVcJs7eW3j8EMgtoGo/AuRpTvRujgtxmLuRyLIUc
         5QYmHJK9muEIElxyQlRUt5hja2pb1ed2h7L4yc/H51avycJowZ//sEPvIuTwzlQNq7OW
         pTj9B/3i2NiNT7kGTCltby8Qo9RUnpfqVio3oeuVU2WchuSaL4TR8EjJiWbl9awppTjb
         CEdw==
X-Forwarded-Encrypted: i=1; AL+hErGEDRAaT/IwbWrgXjqmYNr6I9DtUCdNHvntb1u8tDavMsaFjSuNsaCUCefzZ4GnRpk+ybxMwwBLJglU@vger.kernel.org
X-Gm-Message-State: APuU4Z9UtAIJw/gtZKCPdJga6Twd0DmkC3zF06bZHI40QOxGrXsdkwOu
	2FJqDGcPZZLliSFdqx+qxMBUVQnh3SuGgmo0Ix6YmXTb2J4AYrUla0j3
X-Gm-Gg: AYBFou04iesNhcALWZdVUqIsvkYMb+AkmxYB0yPBLXgf2HGhq5IDqpZzJYUzBLOEW4v
	DUc/StMJaYCOSaMkdwOddqjDUpKMC4oSMCuZuC36CLr4QeYR8q6UjZ1h7uiJ6GIcNxnGkPVbgPb
	rSSMlq9SaBuB5hVUpWGrywCLdEm3eTwdsegIXFoh1pOq0+bSWxjD6MkC3vZmox8yEiFJ6xW8ZuN
	tt+zzs8NmCjMbrV2crf2nXnEisvNU3gIrPKRQ3ea/balMx3S1H2a9iQHq+B699wq80cT4sq0RwL
	+Pv/31kwlBKVhvpLrk306R6jwyPivEICPUkfql30Aa4BvhS+5efhCKpjbRydpa6XfFMqdJV3cPc
	x5IzmCeR+doK2ZqmSztQqkysb4KASKD5dM/n2LyVTL3lgjzAKLnzl0G8qORvaRqk5pDOC+MkJqk
	qnOSl/cdjT+cHkQV90M9cJzKWVKeJhofR3skH3OAxIkEDVPeIUsc6Rw9bfv7BzRQA+6XXZQfTbA
	5Wo8jImwPQFm7Yvj02OL8Fo4MWXAuo7bor08omCObBNXe2Q0vKAMbW8
X-Received: by 2002:a05:600c:1d0e:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb55aa28e9mr258682125e9.32.1794862551105;
        Mon, 16 Nov 2026 12:55:51 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm24696949f8f.56.2026.11.16.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:55:50 -0800 (PST)
Date: Mon, 16 Nov 2026 12:55:50 -0800 (PST)
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
 srinivas.kandagatla@oss.qualcomm.com, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
In-Reply-To: <6fc5be59b56e42728e33595d5415441f@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciAocmV0dXJuaW5nIElSUV9OT05FLAphcyB0aGUgaW50ZXJydXB0IHN0YXR1cyBp
cyBub3QgcmVhZCBvciBjbGVhcmVkIG9uIHRoYXQgcGF0aCksIGluCnByb2JlLCBhbmQgaW4gdGhl
IHJ1bnRpbWUgcmVzdW1lIHBhdGggKHJldHVybmluZyB0aGUgZXJyb3Igd2l0aG91dAp1bm1hc2tp
bmcgdGhlIGxldmVsLWhpZ2ggd2FrZSBJUlEsIHdoaWNoIHdvdWxkIHN0b3JtIHdoaWxlIHRoZSBz
bGF2ZQprZWVwcyBkcml2aW5nIHRoZSBsaW5lKS4KCkZpeGVzOiAwMmVmYjQ5YWE4MDUgKCJzb3Vu
ZHdpcmU6IHFjb206IGFkZCBzdXBwb3J0IGZvciBTb3VuZFdpcmUgY29udHJvbGxlciIpCkZpeGVz
OiA3NGU3OWRhOWZkNDYgKCJzb3VuZHdpcmU6IHFjb206IGFkZCBydW50aW1lIHBtIHN1cHBvcnQi
KQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVy
IDx5YXNzMjcxMDZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU3Jpbml2YXMgS2FuZGFnYXRsYSA8
c3Jpbml2YXMua2FuZGFnYXRsYUBvc3MucXVhbGNvbW0uY29tPgotLS0KIGRyaXZlcnMvc291bmR3
aXJlL3Fjb20uYyB8IDE0ICsrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvdW5kd2lyZS9x
Y29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggYzMxZDkyMWY2NzkuLjJjZjJh
OGEyYmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysrIGIvZHJpdmVy
cy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03NzgsNyArNzc4LDkgQEAgc3RhdGljIGlycXJldHVybl90
IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJdTMyIGk7CiAJ
aW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKSkKKwkJ
cmV0dXJuIElSUV9OT05FOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3RybC0+cmVnX2xheW91
dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRyX3N0cyk7CkBAIC0x
Njc1LDcgKzE2NzcsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQljbGtfcHJlcGFyZV9l
bmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGsp
OworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5hYmxlIGlmYWNlIGNs
b2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYgPSBkZXY7CiAJZGV2
X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgwMCw3ICsxODA2LDkgQEAgc3Rh
dGljIGludCBfX21heWJlX3VudXNlZCBzd3JtX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAkJCWRpc2FibGVfaXJxX25vc3luYyhjdHJsLT53YWtlX2lycSk7CiAJfQogCi0JY2xr
X3ByZXBhcmVfZW5hYmxlKGN0cmwtPmhjbGspOworCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShj
dHJsLT5oY2xrKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCiAJaWYgKGN0cmwtPmNsb2Nr
X3N0b3Bfbm90X3N1cHBvcnRlZCkgewogCQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVy
YXRpb24pOwotLSAKMi41NS4wCg==
