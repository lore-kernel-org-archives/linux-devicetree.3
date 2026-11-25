Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617693;
	b=vATtovw4P8yj5hAjULi1N0sRAgvsGImCvM8yUlQe4dcuzmwqonDAhEeeD5W/tPPArsf/
	 gGhjS5DYvgsI567caIiIm9j41RUett0LXLhdO4gcrvn93MN/TrRjjipLXfDYP8QElJ/Bb
	 EgVKqDKaCzYWUCxDMUAougZBgQ5J5z2+n5tlGeTfFxkt/326w1G4/pNxYWQ/WNXl+nLru
	 NgBDQliPuCd6PaSerz4/METYt8eEA5ZKm9ApBzPpwChc/wi/wdlJEuLZ+1m5RBRsHcsTn
	 LiWru7EcYjC5UmtY6Mu+CJrxSlFzEOsdBQdvby90OI1ZhtHmQG2x7aAvyxsvhT7QYDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
	b=w81rKFNhwaUaOHPx3XAEbrOeOLONIlK7VdL4n/HKmXaK4yNig9a1QeCIfau1+AzD91VT
	 EYTaDs2brml77CU3QjM8GdrubEWOw9ltM+oHi9XrkE1SEYs4gpNJE9HzniZNZZNABMYcM
	 zBitnp1NXjmpo92vvsiuwEK1Js9aHyKPajuuyEjft7PbR43SAjgZvLtKutRQjnFUTLq4P
	 IEhVpBPwxwkDBJOMIN/s6fjhvDUI+G0zHWyRYRxahezcPWMBHpLP6Xn7tpKb6iUaoeXrD
	 oDMZ8P89gn7hKv69pB7B/sA8A43/mgR2+I3MSiCUu+7nFLCNeBDpDPzJuTeCsoauHeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRNsOJqb;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B01606A338
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B01606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lRNsOJqb
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1252248466b.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617691; x=1796222491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
        b=lRNsOJqbLooDIrdaILNRYzBksZoVQm+MOGWWmHhZTKPuzlOd4BrJtS/qiEiyblwJPB
         3UqD+vZlNF9kJPrul8t7hiVfBg6OTgjBjTKw4AgyoDLH+B9bXC4UxWP+vyXTRnc5c1s6
         OYY3SpDnVP/9dLXd69kKn2ORDPIllG3IRc+sGuul+uh6Qa0/WGSm+xC1ndI3ZhhSv5NL
         vHClbFZLRToGsOtloVhH/iRiZ4QVP95kW5/flAVApjY59rAqq87veOKyL7OxLfI7C83i
         DEVja0SLspaqRCObDoUYxbQPfXtweKFb4tKh0r4fvFVuM1Z4wowpt9/XcaBKg0FvbgcM
         7k5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617691; x=1796222491;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiFQrHYbOebwg4aSZm1pD7p5ODz57pewOJXxwjk/IsY=;
        b=KLLzo+Xsdh2YQ7oRxNoOFnfaanyia5l8XP/GQGoSFAecteI+MK6/pLRvBR1fFZxIGo
         YI8Fz5walajpA4ZjbWDtGJW2n+EoekRmJfxuYYjMI3PufkdCKTJpc0T1bl13NZsIjis6
         OR3l9g45zsAFj7eupjCWRQdK1x/RfaxeDajiplixJEKdLu2lp3AGfg8xJeJiwP81fiRx
         CQZ4GVWcs4M227y7D/LuZDU1OnLL1XRxicDd28muvUzRC4metliQNw4qGgwL1x+cNoIn
         pL+F3DYEF1WpXYKxHgp3PzQAdGiWut+HLhwecv+x6uJ2mZx44+BGQFdeDkkg2JabrOSW
         Vz/Q==
X-Forwarded-Encrypted: i=1; AL+hErHmRF3ih28Ef3xP7dschERQj1nUiMr3C/zj26ugFcHNAJzxODgp6WRMUQ5lAg+5vBFHvDiaRmFx6mK7@vger.kernel.org
X-Gm-Message-State: APuU4Z/XpPCwMl6xOgxtuh92Gp3ot0Ql/gu8sUgllX90KSXhibxFiitG
	ZU57Wn3ed+p//61RDsI25Diautg92J9QyFegi0kSVi4dCA8AwIPR0UmX
X-Gm-Gg: AZFdTZf4tiGhgFIaFVWRjxLHNGylexu5om/v/MN3uuV0oza8d+lO/RzIS1DQanhg9Rr
	Hnla+UBdUh0Q+Y5X4B6QxCtoKWgpQBMNWXZB8xjIXiE+1N6ZScofquB63/fOqtF8XtIGkKm8tdg
	5QJN1wD9Ru5tbeq0Gob6haps+AwrmuP8rv7sSzTgpFYB1sb2TizW749+424VYyhMopZT/IqkDXX
	LdJv4QMIX3o1Qgcbt0eikp94aPBuqGxoW4NE33ginphVEZVEgbRo7DfiJWZ9y3+HITsZgjBP259
	VWbRGG9WbfGrW4uMRtEf+3+5PSsKJ2pNQROFOnijjU9ahCsHN6wZIK659w/AUray0wcTvs4rdwr
	IE0nkHHba646kyXRissGOkPiu2tbLk9ho8qxBs+gKV72BM5gfxXfb2Yd+cwwwKA60ectp3ZxEQk
	3v21BFvDU8dZn5/0bV0L94nmUe3KRxLwhGIaRNsL7AqYIH1otRWE+3UK2o3JZ7iVKkyQIPM/wCF
	Lw1Zao+Iw2eUUV5BYF06qwxDDi/W3jBTot22XZlBvbMKQPR+n6TP5QTrLyO0mLqvBKCknM4zg/J
	Mtjol2GSvQ1+yQXMp85Smo+4G9YZbmiupXnfPc6XPAGWkX4=
X-Received: by 2002:a17:907:1c93:b0:c51:9d9c:c720 with SMTP id a640c23a62f3a-c519d9cc960mr349270766b.13.1795617691492;
        Wed, 25 Nov 2026 06:41:31 -0800 (PST)
Received: from localhost.localdomain ([195.155.168.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm653474766b.69.2026.11.25.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:41:31 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] power: supply: s2mu106-fuelgauge: add standalone driver
Date: Wed, 25 Nov 2026 17:41:29 +0300
Message-ID: <20261125144128.3951630-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123-tasteful-famous-dragon-00ee8d@quoll>
References: <20261117104328.1176951-1-tadilhusrev@gmail.com> <20261117104328.1176951-3-tadilhusrev@gmail.com> <20261123-tasteful-famous-dragon-00ee8d@quoll>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 01:30:48PM +0100, Krzysztof Kozlowski wrote:
> Even less relevant, drop. AI usage goes to changelog.

Will do.

> Drop, drivers should be silent on success.

Ack.

> Why do you need a new driver instead of integrating it into existing
> s2mu005?

I don't. Kaustabh said the same on the earlier series, so the next
version goes back to s2mu005-battery.c, with S2MU106 as its own match
entry that skips the average-monitoring registers it doesn't have. This
standalone series can be dropped.

Adil
