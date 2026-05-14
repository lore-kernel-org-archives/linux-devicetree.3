Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EF23BE635
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788058; cv=none; b=rF60BRT9t9X5dM4nGg5yC65f4DuR0+Zsh3QMbc7rGt+LHNGGqFFBcF+IZ/HJwl0XAR4ECo7ykrDYQMyYsQ2Dq2kYe005fmFcJymaGuCQKVj4vc9D1bsO76ZITIZevtzjVrOmGuye/tMMpqIF/rCkZ99Qq7F4UJhL6KKxKYCKjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788058; c=relaxed/simple;
	bh=P8du4tIQJa0x4DFFIK5e28HEibs04qcz1KFj/ysRwgY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=elXD0fA/Ousav1NEZYcsHilIQKd221WUVaRqxW8MqXo3ramW8xNlRhcsAZmhEqybFmVQv+1KBJ7/V1gmBvLoXKHOsUNaSU69JVG8v6njmZ/y6td5qfZjO/J0NREtO1iNtHM1uoWXoWaqmgVYgBb2hAGYkTZbmi1dGnVh2DFrfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/vRSpM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/vRSpM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B4DC2BCB3;
	Thu, 14 May 2026 19:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788058;
	bh=P8du4tIQJa0x4DFFIK5e28HEibs04qcz1KFj/ysRwgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=O/vRSpM7UqAX5Q8uG3hCH873rE1Tcg3Xb+Al48YbCxlZy0nKIWDAEJn4ug3ub9hi8
	 HiWoRG1WxaXue2UIxpSx6lvovrdl6urSjIM/oGpOQSn0ytM2DRzZwWk5omPqGJ/w/m
	 gUTTjprzvLQrh3TmKY9ghdEh21zjRV6GHTn3IUKmVAM6+fmWUzApyR3rWxMTPg0Pdx
	 5P1rw8mN1SiPlprzoHZKz0Gx3greJZ2yNMiF8dsd4c5vIBMYqKvh6pwTjXpvyfLR6D
	 A+vipAGMWlpsYnVRX1M4vRXGOXrbmqsmvtrWSqP/D44ZbbQXey4RcVicy12lvnbsgq
	 nSn3rNul8+DzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] iio: temperature: ltc2983: Fix inconsistent
 channel wording in messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514144712.64374-4-liviu.stan@analog.com>
References: <20260514144712.64374-4-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:47:37 +0000
Message-Id: <20260514194738.56B4DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete refactoring / Commit message mismatch: The commit claims=
 to replace all occurrences of 'chan' and 'chann' with 'channel' in error a=
nd debug messages, but misses several occurrences.
--

commit f3ba963d38e5d70969e64d92b33f465e108805e4
Author: Liviu Stan <liviu.stan@analog.com>

iio: temperature: ltc2983: Fix inconsistent channel wording in messages

This commit replaces abbreviations like 'chann' and 'chan' with 'channel'
in error and debug messages across the ltc2983 driver to improve
consistency.

> Replace all occurrences of the abbreviated 'chann' and 'chan' with
> 'channel' in error and debug messages throughout the driver.

This isn't a bug, but since the goal is to replace all occurrences,
should the following instances in ltc2983_parse_fw() also be updated?

drivers/iio/temperature/ltc2983.c:ltc2983_parse_fw() {
    ...
		if (sensor.chan < LTC2983_MIN_CHANNELS_NR ||
		    sensor.chan > st->info->max_channels_nr)
			return dev_err_probe(dev, -EINVAL,
					     "chan:%d must be from %u to %u\n",
    ...
		if (channel_avail_mask & BIT(sensor.chan))
			return dev_err_probe(dev, -EINVAL,
					     "chan:%d already in use\n",
    ...
		dev_dbg(dev, "Create new sensor, type %u, chann %u",
    ...
}

It appears these were missed during the refactoring.

While the "chann %u" debug message is coincidentally updated in a later
commit ("iio: temperature: ltc2983: Add support for ADT7604"), the error
messages remain unfixed throughout the patch series.

Could these be updated here to ensure the code fully matches the commit
message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514144712.6437=
4-1-liviu.stan@analog.com?part=3D3
