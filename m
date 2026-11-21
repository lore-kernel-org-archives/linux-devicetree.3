Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281809;
	b=Jiql847rOp9nfrBq2fnIvJyO5NfMs8mbFykhRmU6DeEsIbJYtBjVQtKAIG9w0WuIg0/G
	 8Xwr31CMSeVFuRy8msn++2A4aiDZ1lAmNhf3qmPJ+xXi1qkHnyR0bfNOkXrNCO8fR4DK0
	 kVSexT7dZIA3QpcDmgzC0KVWdcQgd6qGXUXFaW+SV7aYFOrLYuPwo6QRiSz/pENdTwxEn
	 e1OnskM/6lU2Da5rJkxHllzlvIB1/8IALQeorXDDBijb8vojfmcMHNhxyqR4FL4dstszN
	 moE9niZ62DGLf+VHM+gaPhS336UkoRm4mNn/gUdxBHdpvb/IT88YOJeyhjWeKf45i0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
	b=w2XuB2M57Ba1JFKF+QhhzQ7vBkUjJWuVJE/ElTtFX5E5XyPn8Uwxvvx340DAvb4rR0Cl
	 evClXvzCvDXzCrMYyuAWdbzgAjZaH6K7eHPWd6rcAli+UCxBUbLmt2hX4WH1FxnIGT6Bh
	 lT8ZVRnX3zqHyrPkFCCxPnSJnJP4OdQfcNuD76YSoJJMvKqJO7+86WJq44JijP7POVvWR
	 tuYQ2HHp9pynmmrE30eknLEA0sncxt25BGhBoEVUWDn+TI/URnaUu6lVn+D9CNYTfkBrB
	 af569Kei9GSt1IpgicuVrkYD7fTas8g+eFf+TPBqzl8pqi058j68F8yeww5Zesu4cew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8LmpFBe;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCF606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFCF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8LmpFBe
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so5626334eec.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 09:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281808; x=1795886608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
        b=P8LmpFBeeEHcocflIPBIlS1K9w6pTlbbXxxF7rE+383oIBdTofSXp75DxlWBqIC+TJ
         xDrN23DlA7Nj544SQyBZaMWQvuIxEv2xKdV+fmylyy/8wDTKBon7ajKNGjyUiUwRe6zD
         U5/K8xllqUiZ/yQDDwGJnWVEKHle89afY+SACk/iJIfVKTeUD3ddBgc9zwJTZvJ0jCjC
         ct29Fvv7B+KhPwIZ9BDxcGEk/7IDUJoj0zSXwAjuai5Kqt/JR6Trw9EGA3NWM5ko5HNX
         aTDfE1b40TpFlFU8oqwlqHxL3Qq1hT3xbePp7/sKIH9yyMYLAqIiiu4DaELWMcvIqcT3
         CPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281808; x=1795886608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
        b=VKQtPFTSKBBypWH5hhYma7aIZwMOjfaxIWGKjOWJQdkvgB6rIObSAbN46yuk1F8Moo
         M7UJ9Jb0J/S2eGD3cnLvY1Si96CtPmycuJue9VFuQv677FyB/a1vNd4quHGVQZ2yQcXN
         t1vrptWa4C+Fuj9VXYyoEvvWe/U8yALdfQHM+IImC3PORL+HtpyWKd0LYr28ZVeIpved
         qnuNDqm8XjhGHhJXBQU4DMotCM8qaKYi5+92vPj+5EGXMAurc5XqqbSab2CCvplWm3pj
         3LDw/XUtSLpFfCHhLdbBX3O3BLG23krCephgc/grcraM2v6I6sBQyWHJzUt9BkPRmNc/
         KZ4g==
X-Forwarded-Encrypted: i=1; AL+hErGcRwXA24AfnGfs4mxEpxJqZ8SOpfDPr3yW5qdm/NQXDPqOw8u6sUAn6VarJArlzIDv6Md9NkbvtHT0@vger.kernel.org
X-Gm-Message-State: APuU4Z++IoNCP3H162Mc+B2A1sHuNEJJNasaba7SeiItPyj2IgGfHVsr
	/nsQzyYlSgS15uFMU3Lmf86xiK0pe8QLHv+avNbHTngLoq7FD6F83/s3
X-Gm-Gg: AZFdTZe7JHV+kQq1W7eyuMOeIL6F0at8AgVhINAuD6VIIIom2nW9K/xzm5xggAgyazl
	mITuqXuQIwUiIqOlbgzMmmCveK/jDdC3NIOfkSwtczPzl8pKpkdAhDTR5WC2j+Af0l9IutB0vtt
	Kuq191krEEMj63E9FpGWrh7Orjej/XoqWKFJ8fiOOfdGSCFzXKzgN67s/8Et+pR4s4yL7uIMQve
	wstHXbIi+MlfJcQ8NkL858YKWNSvi/82mDOV9tbRmwIi5dxwMzIN4YMl0MCMDNCJExM6Dq0Cxcw
	HftYxkzdqFJbv76klzwoHubXEUsG1qEDkH0gWHKrNzDGA4VHSmNRYf6Ef3mvrZIhxXup9028qHu
	xcoZfoOdev1Usoi/59gIA5uJ/oq5VL48gBmiUChAAqFoom7j2QctFZGgvOMPmTkMjABluP5hevz
	+HTYA7rkxIrCV8SKIIEm5XHWYBaHxskGRxUYkkOLcfLFa+RrG9mD+UT+U0UG8GrkmEcFKZRtheM
	UnU8Pd6dG3fj+beQ76k+9pSjMf+MSWC5O8gEauVDZCUFNC3Pzhp4wLaC78wrod2b3yfWejg+EKv
	DFenIqV4NmmqJTqUPU9z9iYgV3mJFWyMLj0x
X-Received: by 2002:a05:7301:fd16:b0:385:8744:658f with SMTP id 5a478bee46e88-3858753a876mr6679805eec.28.1795281807535;
        Sat, 21 Nov 2026 09:23:27 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm18360832eec.7.2026.11.21.09.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:27 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 5/6] Input: aw86927 - handle the AW8693X play and boost register layout
Date: Sun, 22 Nov 2026 02:23:26 +0900
Message-ID: <20261121172326.846-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-6-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-6-xiaqinghuan@mail.ustc.edu.cn>
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

On Tue, 17 Nov 2026 13:21:11 +0800, Qianhui Xu wrote:
> AW86937 and AW86938 keep the same register map as the AW86927 but move
> two bits and invert the stop handshake:

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Both probe and a force-feedback rumble on each drives the matching motor,
before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
