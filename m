Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381102;
	b=MlT3E2wb+RtcZlVQf9rfFqv5lYF+dYSEZTnSu1DOkNiMjBWL+c7LGFhbA56aW7BDCKDP
	 B7uzKqMH6gXCEIpzXHssEJA64R48KB1/lh86S0CfCINQ/fYj5PD4V+JjZEn/EnYhFwqnk
	 edKf4pPF978SAE5UFjwE77H9cmIV+hAKlzkxXEzou7+8bi5W3WgOPjyKPT3dY3sn7H/oi
	 5Deh2m5ov5LZNBAWkR60kII99+u72GVI9TBUNCnw3CutjyPbjgZsp5/DsLcAqwXiJohoU
	 BqHKZ0r6njFUGRtacbBKLLrUY6vX4xe3pykZSapdhjM/qVTqayqP+SRp7MPYy3QNsrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
	b=EoWsFnAF6Stfq3qPFfDUNSbElsDFcAzDbGbPRmWJDRA53IywdIP7mqWw0fqKZwlP7uKq
	 rDN11KIHB30IKlNMDQhJc7wqdSqDKs9xstog2NJ+iKaDRIhqf+TeMFb2la5+uaLQxQ/cd
	 hNDPNUDveS9q1Jw6vYficbHnW8vGI88tmV1CIU+Ev/QhOP1DrCkftPFATTttRtLBA5Gj8
	 NUCytIx2ROd76pwIt/UZS7X73w3/xm5PR//fkdRTmPoxhgkcJ5CRpqWf/r9EWjuxEl6rM
	 gY0ep5zJxQKWf+yeyFcsKXqvp1pOl5dmg05OQbRdilIGQ5dXcYYH+QMv+ht2HC/+vvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=s6oUx6ZK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D9C606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D9C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=s6oUx6ZK
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679aeeddc6bso3610805d50.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381101; cv=none;
        d=google.com; s=arc-20260327;
        b=lU73BrevFVvyKwCQQO67KK8SVhy0Eunfl/Kx11mbb/n+stWQV11q3Oja56u4ihOFmp
         Xkuhi0S1n8SsaZnHBoDMvQ7BLHEeyL28yYNGy7GREZM0g3eTRWE7m4TB05TmAL27Vid+
         UG3UGsDSqaLdfnMd6WW49zIg0RB/dZ8GxsgpMrJ6VuHQHMl1t/dxngD8jDN+5CJme670
         DZKHW/VzF2UGY4lKPxU6Ro6dTmlplP9ydYR6H7qVmcEq+TE3V0GLRXVB22LoeAAkhny7
         a/M8EpISBldXw4gRnZaasLy9K/rM4c15kTguMKlxRK6A9uT5RSyQfZTz1i1Km36y/NO+
         gUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        fh=y2c4SqaqjNkOK5DuztGQ6wI1nGbEhe+idGchMANZ37E=;
        b=FV3uVJYR6nGlz24ztvjsGyohw6VDNBqgCKEiQDPFl/PGvRdhwL7WV3ig/pKCIo5k5l
         SzY7FtNPYaWgOeki54Sf7RuIRnpNxmjt5x6OxaTEd7LH9nIr3Js12k2bRv5zIHy0RcC4
         NgAJpJHHM9wgjFS3J/RuCiAGp+o2AdQOQv9yAZAage7qa+GQxuDDx2mb1ewsTBwv//3K
         UsbRuvdcq46J94IdiDQJl6HNf9zMFBmdjuDxzz0uHyIYwXADuX5qZAy6Tb1fqBJt844r
         79OfVki6JN5cMcla+TJrXHSyNXGgRZra3eD1sxoutxyD8lmk5hK5NXT2BpXZwOtjoK2x
         /olg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794381101; x=1794985901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=s6oUx6ZKeevuidfRlwNMdKJPTIsPpbkp2mcs4Kcbuv8WwhUkLhNQoS1Z/3De7P+yUF
         BxKMBfQEfpMszWs+Xy4VLmarqGJW9Advzg0seCPQ4Gc4Iogmjw8UNBosWeprCbN4kGie
         Bnh2ne4WN2yNpyNtxb3fw/M/acEuNtH+ysqtQ59EnLLpUBfA7uVJ4TzQBLxLdqckyODh
         7ceG9EPfaGUdKYDKgGsznLNriDqqe/SvkJD17/T8EnbkPKYgbOH3hF9+wGqxuxLx79dW
         cHFzD+ICL9+Wo4d5wyKS5ejdpSl2A6PnmVphH7N3PPBNLlJJxqMuTsL/6kVCnGEXl4gD
         ewXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381101; x=1794985901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPBwBiiZBppGVA4Hfa+wR7Y2BOOxqWuwpe5sIyWKW5Q=;
        b=eqeKavuEhxRKHY3CS+5y8jvFc6txzOFJfh34f8VVAgbW28THIVBvAOXDfBBNkqaABq
         hhNTXWwOyag4PP6mKZsaCKBUfHBECWimKZ1WU3SyXsh9280Hgr4xHW0tNHFhabfM0h8x
         Jwm5Qo6C3fpfC1MLwy6kzE3Y4HK5YiBHP/mA1nAEAbYor5p0hI9bpXvilaba3t298i3U
         iyiRuAukDwiAEsbbgH1rv5Ny/DNTz/wWr2PPx6rS/3E+rFdkTayO/aLYd8vV7Bcsq/fo
         JpzltAUKQlWM5bkmPMdKIADq7bQfQQbn7q6GJ8BzYZMvpvleMGZ6XSOV6VG+I7D8GA01
         Dd1g==
X-Forwarded-Encrypted: i=1; AL+hErE7Hzu4RAVotreJ8v9IhJ1J465jrUG36dYr8/W/v54mAavCGHzoRQkUHm88HavyAq4Ove2caBG43AMV@vger.kernel.org
X-Gm-Message-State: APuU4Z+yaCGWEytPbOmqJSbwWwDNvryzOKvmYdsMbpsQl/rIIW9Hel7c
	tYu6wWwZVjxPuNCwU4Gm9mjYSoFiXTJTiV4bmnLboSEU5yisr68RjtFrE9Egfvx1hhRlZ1gXBUB
	+IFCxIWB/Eh1uWP/WSNPeiyPFYx3sylU=
X-Gm-Gg: AYBFou1JxrwS8JDrcy/Mz1e94SMCULBZ7iLnwQVofaN0TXT1nm0ZleZrgUK5X3bVvTk
	JEmpOzX+nTsYHRrdx1i5p4thxTEAXklLh3Y6dB2qkGF5a/Y5V9n5NG364/JqQf4hxC3prrQWTOQ
	Gv00Qv8w768Ms198CwoFcwVqv32GsnDHR8pb5EPoqDhOn6Wj91HMEsMAfEQBqsnZrBOc730X0Wf
	gpBHcWvw0kOCWn031ZWirtu2Qkkql1hcNCcfht9PtEnKtet6aGWCrkzVrde0IrNsmp+hw6/OAI7
	/DsNO5sWSnqtWi//qU6cyV+GLPVkFcEEC18ef5qJuB6vtBlZKNCspXxo9yFDHwA3SeZKoWsq45h
	Kcfcr5yyDkcPmPMJq9a1984x5ID3Rf1iKK/hHJMeLA1GNAs34khseao10nFUDZejlu2+hOw==
X-Received: by 2002:a05:690e:440e:b0:679:ad60:a9e with SMTP id
 956f58d0204a3-67c680f240emr733978d50.91.1794381100740; Tue, 10 Nov 2026
 23:11:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn> <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
 <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB7491E5F7FDBD54FEA44C3735FF762@TYZPR04MB7491.apcprd04.prod.outlook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 11 Nov 2026 08:11:29 +0100
X-Gm-Features: AclHuK9fq2VWohEXOgnq_B_UqUHperL-B2npuqbYFfMCGdSky6Fm_yMTOOxsxcQ
Message-ID: <CAFBinCCwzqi13e82tVW-Je93R_1dnHvJN+ZRmqzseGJgozXrxQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: "raspberrykan@stu.hqu.edu.cn" <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 3:04=E2=80=AFPM raspberrykan@stu.hqu.edu.cn
<raspberrykan@stu.hqu.edu.cn> wrote:
>
> Hi,
> Just a gentle ping on this patch.
> I was wondering if there are any comments or suggestions.
Neil has already applied your patch, I can see both patches from this
series in [0]
They will show up in Linus' tree for v7.5-rc1


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/log/?=
h=3Dv7.5/arm64-dt
