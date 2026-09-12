Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67241478E25
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228264; cv=none; b=jOV/nSBTdREwY/VrTSfLgEHNz/oHJD2OVLCJHj6BS3vLQYwm4eKShhLJEME7GCZkRqsFWHUt/955MUwc7uyTnTaPiPbVIoy9ITQLnNczwJJCo7mSRq6qP3qFx6cqYPoY9TEcp+p3NpNvYknsLLbZK+rrak6FMOqH/O53bYgzcSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228264; c=relaxed/simple;
	bh=jYjhr9lQehwgsoB55McaT2/qQLnqXw43VwwgAETPBqE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m4XsJL6XifoDPA9CX8HV+XZtpwRIzI2jR6OAG0V8Wq+jV6PoWPV0cievS0AioTnjd2pwhJGUYNpQ8fH9GJnzTO7FvAAvxF2nQqX9YjtSHpb3692x32KZLJMiYedvk/OufL2HeW4feIrf59gfqCvL64pNIs9rQBGvgJJxwbeoYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B5Z+lMD3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B5Z+lMD3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so226793f8f.0
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789228260; x=1789833060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=B5Z+lMD3RMMj7NVb/nfYAe9DpW00iaTkHgayOvY05B8q+8RkWJk6fAJAFkb72iwiyJ
         O0loOWoDYolpvpWZ5rVs4/SMg/Hz8YlSiFAsBG050eftDr4RIAPy7rizLvbYtovn9VCt
         bTGVVGCEq9a9FBCXkMQpCMeTXNmsJRuonxg8zcxKzn1lOpAxlhanYHYOks4Edg4VnJ3r
         lMJ6JlJyjpGetWqBo0FiaciOd3HPSKCLtxZvR6XrXercqClTkajUAvcu/sQRUq8JRPHg
         56uZDjTmeeoO38w5PIPxUFX1f+AwvlGvySbq2/PCPeeEJuqXqURiupMHDE6d7SRoV3ff
         uDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228260; x=1789833060;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYsEok5/6RpeOa0+UdPPhWNeU1Av3CpfKIsBFwLi6qQ=;
        b=guPdVmCMgBDLF4vHO4tv/Srp0cbyNYoODTpufkA8Mdbq5kl86i2OOUz045aDfRiXhQ
         gOVTjaSTXSDj3TVT0aqvGSS8eeaSa75/32k9CkBLD/G3wiDTHb2E818YpfDRMLZtyvu0
         XrkvSph4f8sUDL704s1MciL8yltmKEYUDi4TXdA/ludgg3RdIp41kSJiYpXlTZdTTpMh
         BaNqBlTmIhRH0jgUn7MIKKvZ3S/lfOmyEWxtn2mKOU2GXuWcALTOUvnnfTGjc07Y7oGx
         Tjx2B0wDXKXy2NhqnrXNxS7MPVmDQQMlCPX1GTieoSa8CWWpfMpchauO0QOism4VQSMb
         LafA==
X-Forwarded-Encrypted: i=1; AKwUvByx9X7JSJo58m3hqlrrG1Funpk/ozvYT+O2Zi7ivvQsnj+AOfRTPqRmqRVdFi2xgCo9UvrIgu/0HMWu@vger.kernel.org
X-Gm-Message-State: AFuF++lc1FwkxkD24jT0T/ZRovovnVu2sc3VFvc9KTQ+vySqS+8XeBBa
	Bko/m3jqaYkAJLkUJZWjfCE9CeCcUtbiw8JpgmYd5Dno27sbPot8AmE8TcRxAtvheL4=
X-Gm-Gg: AYBFou3S7scIQjwVsfwQLe7tDyiS3uL2LamhUzdVWuYXM0S5KCJnBLYIZ2xsgieJzM2
	AXOd8GGewutQo3Xiw2OIK4GdmbEh3n7TXv0FCjJDzCzGykGHCWOcEhTPMVQaF0OADdgkO2Ycycp
	EXZIApyYS66IhE3gkJXgqL+WGrgkRSMbrevOKHsxU+RyVxI+XP7hd7EXzbSgz365ELEFzBGItfb
	nEKIQj6qiQegxYwUrJB7Bkfk7DDPflQMrFLUYqryvkWb2rEc8v6a9eP47exLgnfdacCsOfVD4d9
	cRL4FOii7QPu1K6K9XEhfEOH/NUmSG62Q10PYavzkrx2cbBZloZYnn6PUPrL+77ZzWbmdRV1Iiu
	uqc9fFD5R+4JE4hUTgBxmlAcbVsw6t50GxCm1JAHPzjVih6TuahBsn//jcVisNVt3LQwhbzj3Iv
	A4qfIm9amRDGhTV9jQ+2V67jmUqthvSEdvgMznkdRERFHUys/3oyc2GZzGUKqlPLhIjZCgLzu1t
	0/61ugQReMNAOa/2G3q072Jmbpo
X-Received: by 2002:a05:600c:8b8b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49e6cbfeee9mr26096875e9.20.1789228260689;
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm154001915e9.15.2026.09.12.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:51:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Brian Masney <bmasney@redhat.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
In-Reply-To: <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com> <aqSX-kUvYaixESxe@redhat.com>
 <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
Date: Sat, 12 Sep 2026 17:50:55 +0200
Message-ID: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:

> On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.com>=
 wrote:
>>
>> Hi Lucas,
>>
>> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
>> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
>> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
>> > identifiable consumers - the three MMC controllers - so marking it
>> > critical was the wrong tool: the clock should be referenced from the
>> > consumer nodes and claimed by the mmc driver instead.
>> >
>> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
>> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
>> > have no single identifiable consumer.
>> >
>> > Assisted-by: Claude:claude-fable-5
>> > Signed-off-by: Lucas Tanure <tanure@linux.com>
>> > ---
>> > This patch depends on the MMC controllers actually referencing the clo=
ck:
>> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
>> > clock must land before this patch, otherwise the boot hangs and memory
>> > corruption this clock caused are reintroduced.
>>
>> This series should be merged together in one tree? Which tree? I can
>> provide an Acked-by if it should go through the mmc tree.
>>
>> Brian
>>
> It's definitely best to keep the series together in one tree to avoid
> boot regressions,
> but I think the clk tree is the better fit since the core changes
> revolve around clock logic.
> Could you accept it ?

No. This applies on top of another change already queued in the amlogic
clock tree. It can't go through the MMC tree at the moment.

This clock is not critical in mainline right now, so
1) I could merge this and it and in practice there would be no
   regression. The problem you had would still be there until the MMC
   change lands

2) Or you can wait for the MMC stuff to land and re-submit this in
   the next cycle.

Your choice. IMO, (1) is fine.

>
> thanks
> lucas

--=20
Jerome
