Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912122;
	b=e5DQG9HwAi/qxaP3QCWRR5zgQIkzmb1spl9LhzGkiruZn584opVCn35GcayGhSqQ1Tym
	 TcPS9Epgxd6CgOSLTHvcxIsgj+aaYTTEpLQ73h5iL+8Zz7QkmsjxM/4zV1tW8M75M3cpR
	 YDbEf04RmDTv4/pwZp5TqSyZ4UWIGtcg1el1PXs5ktA6Fpz7fiDNYIph0rxPV4473UVyu
	 IWvQc7bPKfRk/F7vUQ2lCb+T7++qb8Ei4PtEoOw7S3rWbohliAB+dLNIcgtnWVLQe1zju
	 BCk17gQQgzDNCPxbkpmGayiZTe60uYpffWmb4rV7ZGUtXV8ZaEKad0PlmWz3FhYEXYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
	b=d8ErRq4a35pz/i5oCJ78Xt50Mo36oFtOa6O+Qkg8LHQ9YMnzBwrNrIfC4sov6V2S1UC8
	 lvAzFqeHMqrXdb0t6qLDAlGpmyuPcvSgsTWHQpIf/jNYTiOpSYwwDNCxWAXhLL9PvaL6N
	 n6lxGRt0plClH9VgBVBWhbJIdINk1M4obkIyS+nImsl8qcMJqRygLCrB5FFCkgC45BrD1
	 XSDy8+4F0MA0Iz4hDXwabxzJkkj/ijTa0VJ/gyW1Uq2DO2JaFQNHSuVf+2P4n9xuT6Qa5
	 E6EMvF4F4sCDvI9OhJvHrrgyQTJ6hF5UMNeTsan4d3HQMUHe/HqbKE3WZmbsYSlBIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4QkVIy4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A7E606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A7E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4QkVIy4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31564905e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794912120; x=1795516920; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
        b=u4QkVIy49fTaoNwvWvnjGQQRpk+tfWR6LLp+CW+T4swmBdd25jXMn3tdWpXy5yiFUu
         vTuksHTy2xKLcetJrE5+cHPrQ7SxLWJnqPGTMN9w/ehtQfjowZWh/o0MvhKzh4Y/iS7O
         6xYBLvzjnMShr5zzhLCdjsDSrscSIQQCSH02l/PcaqAJEQXPgl756vs05i3C9DwYCY5W
         vczinvhPLm0CpccEU/4tRsoE1aQPqsbPf4TNZnjbs3G/vgRwXjcBxn0XjaCSs0vVERNJ
         Gjc6kx/xzNqQLGXCep/9XGA84H7NXodhlQVV8d+mvDUdClsdwdAHAKjCq1WFYMkSzDsv
         vHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912120; x=1795516920;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS1VfaJQo8AXeb/IwzWbByg/SH2tTkW/13Vhf/xaBJI=;
        b=D/AowPYNVFoMtdYkCp9zWRmrK/P54NcWNwIRW/vjaBFB5RtIMTEeBSWbOJ6NIWCp95
         k/kaAey7nuiyRpS4f6bW5EbU2ga6hTxcRl20HN2r2nrPHQGbD0BmLEGMJ2lipp7BWdak
         1/MCqiXRB4mJNynukVcFuQPLCXMFqKPTU7NzmK7RU42dfFfUaf1whJZDxkH2lLfcvHNI
         Gu05dS+4pfH7ZXJ6FUQ6QiOj6zVWf8TlawNSQLObJzKf49HDRsG0nmGFQhSGRyo9tw7x
         zNtlCj0ldiEGvmLnngyFHmalI8RbLXvpLujR9UPwj07uB7mYigSdt5BUjPUcFChQQU19
         OOBA==
X-Forwarded-Encrypted: i=1; AL+hErFYsvbxNzYtNPwv4KxQBvQ0MJ30vl6vzphpuL8MV970HIGAQVVQifly8dbEpRjZ+hFnu++BuIxkW/3d@vger.kernel.org
X-Gm-Message-State: APuU4Z/8n07fXcf2w1oaV5cIXzyslwmqlM+34dtT9/BCbhJdWTYVpPeE
	EjblSRY38SX6wxCr/7MrSNcTriexTR7jOdUs3WwYvB0EjkkcicsHDl09ji+SOymTTVESZw==
X-Gm-Gg: AYBFou0n3+h/7XJ2PW14O6VWCeN/DUBYN1DE5YAvSOpo22fovMAl0tYArt4ETxO2XQ0
	T62hfp4fdMxmOdhI+vvOC5D9x7H9C9XHq6BsxdJuoroNnFTbWAcMH21a+lQoNeLhwPZd7IHcdBJ
	jK0vGTDU0n3Z6rgwseD7Pn/LLYDE0pGw2x8dQic4RKe8PJKdgvhe4FtkoSHUZdL4Jkuauuuyj1O
	XGnVx1cY7HdCJ8VVpRTNCCrVpOIuWc0LKEgPDLJ1pby2aJZQEAW7dzPqgHtq54t2rlhxg4AlSaR
	fMkoolfGj/Flbu2JHB0e8GmkGgicjSKjKg4eU0UWFRq2DqGcYHCcI1yAFK6tqA3n/c+DgHZk5tg
	PYJ6Yk1fV7DFt3kJKFV+djDMBQalRwccerfc/604ZQgw/f2nV+GC1JpqkzYrf1KQm4OJ138JNkV
	opdpHEbgaK2P+15tUqZPzF+nsjHOV153gZGy13Nf2AO/eUSw/KIwWdMXqtWXmvUZBc/omHHE2eN
	23qE0Z+2v1xOnUROW4DCBjDbJd0xi4k/A0zl3KezjUi
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr281079335e9.6.1794912120251;
        Tue, 17 Nov 2026 02:42:00 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm52348035e9.2.2026.11.17.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:41:59 -0800 (PST)
Message-ID: <6afc2f77.2bb6edcb.1518d5.5d4f@mx.google.com>
Date: Tue, 17 Nov 2026 02:41:59 -0800 (PST)
From: Adil =?utf-8?q?H=C3=BCsrev?= Tepe <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106
 (Samsung Galaxy XCover5)
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

I'd like to withdraw this series rather than send a v2.

A review bot (Sashiko AI) flagged that patch 1's fallback compatible
(samsung,s2mu106-fuel-gauge falling back to samsung,s2mu005-fuel-gauge)
is unsound: a board using that fallback binds to the S2MU005 driver as-is,
which still reads the MONOUT average-monitoring registers for
VOLTAGE_AVG/CURRENT_AVG and uses current_avg to help decide
POWER_SUPPLY_STATUS. The S2MU106 doesn't have that path, so those reads
return garbage, and garbage current_avg can flip the reported charging
status. Patch 3's has_monout flag avoids calling into that path from the
S2MU106 variant I added, but the binding still allows a device to bind
through the plain samsung,s2mu005-fuel-gauge compatible with no
has_monout gate at all, which is the actual hole.

On reflection, extending s2mu005-battery.c was the wrong shape for this
chip regardless of that specific bug. The S2MU106 fuel gauge is a
separate, standalone I2C device on the Galaxy XCover5 (own address,
0x3b), not a drop-in register-compatible S2MU005 variant sharing a
device tree node -- it only happens to reuse the same STATUS/RVBAT/
RCURCC/RSOC register layout and scaling. A dedicated driver avoids the
fallback-compatible construction entirely, since there's nothing to
fall back to.

I'll send that as a new series instead: a samsung,s2mu106-fuelgauge
binding and a standalone drivers/power/supply/s2mu106-fuelgauge.c,
with no changes to s2mu005-battery.c or its binding. Sorry for the
noise -- I should have settled on this shape before sending v1.

Adil
