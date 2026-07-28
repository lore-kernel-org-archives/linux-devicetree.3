Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FD1378823
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 04:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211205; cv=none; b=ZDO+7Mi+s+3/1zfkY3YcaJHfWijOudby7lm/DC1E6S69f1uaijfOgJjowOU4HOjl7xSiA+zRBSZ3n8dqYXRWMOhL+KvhKAbxOFVlLvAwveYrXyAdJv2LQpcD8BmnGm/qPSGEgDP2aytYs1X5PA221QCatuPuInAkyQBZVgJCZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211205; c=relaxed/simple;
	bh=4rYyVkWrLewnatl+OgNqafohfRUU3haCwwyXtLQJcTk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzV4RLWErh79JLMIAN4OUu8fajO/SJSreW6IeJAyDc8KYSfTHqABxJulv4HXTK/WqZAIyhMFiPhbgZsZ4rM7kcZrZanmmQc+RguqWgEPe0cRh86iv7Sc6ME8MeinMxouon/Y5ZighhUoZGfq0G+NMp0DivSkOkGuJcRHxeoq07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9XCLLXy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9XCLLXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87D21F00A3E;
	Tue, 28 Jul 2026 04:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785211202;
	bh=tILFeDezqyENo65c7pybCsnCY38O+9uF30LCpwZj/Vc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9XCLLXySMgKTo1+6lfDXpZxWFDtq4O7r5XGJUBQ55shBkCaZ7E+W5Iunb8Cib24E
	 KgnbNVy2g+l1iKqy+ZpZZlHarlSthiwt41cmL++mKp03wjY+Cy/Rv0f8G5WakPPCaK
	 UpCffVPs/y9KLdjE75dvI8VIoP1wzrq19JB1bmY23ZamKK8gXWgD95UH7O6qJe+3jP
	 pQ6kDr6aONCZQVEneDUWDdktM5whOc802iBlwh6pk/Q7IZ9ZT9wjfif+p38mCo3OPE
	 7MP/8U/YVLyYp7UAzcODl/1Jqdrm7g0u/jUStYWhB5Y/Nt/Kc5w3yrVpj3VOnOudUo
	 kpa9U6E0IjJIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/5] net: dsa: mv88e6xxx: decouple the PTP
 timecounter from the register lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luke Howard" <lukeh@padl.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-mv88e6xxx-ptp-fixes-v4-3-10b4020155fc@padl.com>
References: <20260727-mv88e6xxx-ptp-fixes-v4-0-10b4020155fc@padl.com>
 <20260727-mv88e6xxx-ptp-fixes-v4-3-10b4020155fc@padl.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 04:00:00 +0000
Message-Id: <20260728040001.D87D21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling cancel_delayed_work_sync() while holding a mutex that the =
work callback also acquires leads to an AB-BA deadlock.
--

--- Patch [3]: [PATCH net-next v4 3/5] net: dsa: mv88e6xxx: decouple the PT=
P timecounter from the register lock ---
commit 23ddfde2f70b36ac19aedfb1142d819436fc0957
Author: Luke Howard <lukeh@padl.com>

net: dsa: mv88e6xxx: decouple the PTP timecounter from the register lock

Use a dedicated spinlock, rather than the chip register mutex, to
protect read access to the hardware timestamp cycle counter.

> diff --git a/drivers/net/dsa/mv88e6xxx/ptp.c b/drivers/net/dsa/mv88e6xxx/=
ptp.c
> index f7603573d3a98..2a7f97625e375 100644
> --- a/drivers/net/dsa/mv88e6xxx/ptp.c
> +++ b/drivers/net/dsa/mv88e6xxx/ptp.c
> @@ -231,15 +231,37 @@ static void mv88e6352_tai_event_work(struct work_st=
ruct *ugly)
> =20
>  	/* We only have one timestamping channel. */
>  	ev.index =3D 0;
> -	mv88e6xxx_reg_lock(chip);
> -	ev.timestamp =3D timecounter_cyc2time(&chip->tstamp_tc, raw_ts);
> -	mv88e6xxx_reg_unlock(chip);
> +	ev.timestamp =3D mv88e6xxx_timecounter_cyc2time(chip, raw_ts);
> =20
>  	ptp_clock_event(chip->ptp_clock, &ev);
>  out:
>  	schedule_delayed_work(&chip->tai_event_work, TAI_EVENT_WORK_INTERVAL);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this worker I
noticed a potential deadlock.

If a userspace process calls the PTP_EXTTS_REQUEST ioctl to disable external
timestamps (on=3D0), it reaches mv88e6352_ptp_enable_extts() which takes the
reg_lock mutex:

drivers/net/dsa/mv88e6xxx/ptp.c:mv88e6352_ptp_enable_extts() {
...
	mv88e6xxx_reg_lock(chip);
...
	} else {
...
		cancel_delayed_work_sync(&chip->tai_event_work);
	}
...
}

Concurrently, the delayed worker tai_event_work can fire, and it attempts
to take reg_lock via mv88e6xxx_reg_lock() earlier in the function:

drivers/net/dsa/mv88e6xxx/ptp.c:mv88e6352_tai_event_work() {
...
	mv88e6xxx_reg_lock(chip);
	err =3D mv88e6xxx_tai_read(...);
...
}

Because cancel_delayed_work_sync() is waiting for the worker to finish while
holding the mutex the worker needs, can this lead to an AB-BA deadlock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-mv88e6xxx-=
ptp-fixes-v4-0-10b4020155fc@padl.com?part=3D3
