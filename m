Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A16242EEB8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617889; cv=none; b=tcTc7nnfXxXdCZXKu068oReHKWpWkuuR6ysNLfw/ytR+w2rb7/nfXy+ChHG3UP7pcPKsyOuSXlxOBmzGv9lg0bk+unnynaeTw3kAnOPZfXWbZjkTfN6SIa1owSj3uGAvkRU5HWaIEr4SAWogzlMnCyYkR0lB2B049vrp0jctgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617889; c=relaxed/simple;
	bh=Vgx42rr4Dwljdh4CJZ8ofHe4yB0lwJcZrZubNlvmSA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pgkr8KIzNjJAMFe+A9yBlWOpx4Fa1anRyj65tgHpQCmqxK2d7HuYTIoWzP+xbcN80VFL7TuAvcKAUJVd1+FVBZge2QBsDfI0r0pIAkFnM6BiHwNsE6QzwwctlSLi5beFbjc60/TW1W2kc839cyZUVnV2PMyBrUiBg2QKLvIIYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zbsqo7tD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zbsqo7tD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC461F000E9;
	Tue, 21 Jul 2026 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784617887;
	bh=EwJ1HtXH0OjhlZEWheuSe/MxuM/c7gssElVKwv3Y/1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zbsqo7tD6XtN6NeXrrBQ5rsg4DQZK82oZnWjxW7xHA5r81WtzwyCmVM09YhB7ibkN
	 VJCDXd10AXZ4/ikOa33spCK1lH8fEThsgEcVR4/sBHbKV5yZEUwsegNN6JFFOzLoTX
	 Hbk5sZU/BMqnpGb9f3Viwis3sVC09l/S2W7sQPuaOLXMtwPpLjkh2NPZsZ3g3qqwlC
	 meVwbqQ1JtJA1CmehywTcofJL+jcGyEZLZxd75Sa0nwLht3vd/RDhONfBcCstGyvRE
	 t53LvK6J1vzmFdJ7GJw/QVwAgJ8PrWtUedwwiWUVwcVYLGoiReQalN9PHE541+nGaS
	 xA+dMSxr/8W/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/16] power: sequencing: pcie-m2: Split Bluetooth
 unit based on interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721065413.2306137-15-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-15-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 07:11:26 +0000
Message-Id: <20260721071127.3CC461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized `list_head` causes a NULL pointer dereference in `li=
st_del` when cleaning up a power sequencer unit during a failed initializat=
ion.
--

--- Patch [14]: [PATCH v6 14/16] power: sequencing: pcie-m2: Split Bluetoot=
h unit based on interface ---
commit f51366c358868b77076fdd6f12a8c7c1273f47d4
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: pcie-m2: Split Bluetooth unit based on interface

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

> diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/se=
quencing/pwrseq-pcie-m2.c
> index 8ae55e87db74c..b713682a01ec4 100644
> --- a/drivers/power/sequencing/pwrseq-pcie-m2.c
> +++ b/drivers/power/sequencing/pwrseq-pcie-m2.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but could this error path lead to a NULL poin=
ter
dereference?

In drivers/power/sequencing/core.c:pwrseq_unit_setup():

	unit =3D pwrseq_unit_new(data);
	if (!unit)
		return ERR_PTR(-ENOMEM);

	if (data->deps) {
		ret =3D pwrseq_unit_setup_deps(data->deps, &unit->deps,
					     unit_list, processed_units);
		if (ret) {
			pwrseq_unit_put(unit);
			return ERR_PTR(ret);
		}
	}

If pwrseq_unit_setup_deps() fails, pwrseq_unit_put() is called, which
invokes pwrseq_unit_release():

static void pwrseq_unit_release(struct kref *ref)
{
	struct pwrseq_unit *unit =3D container_of(ref, struct pwrseq_unit, ref);

	pwrseq_unit_free_deps(&unit->deps);
	list_del(&unit->list);
	kfree_const(unit->name);
	kfree(unit);
}

Since unit was just allocated and unit->list has not been initialized with
INIT_LIST_HEAD() or added to any list yet (it is zero-initialized from
kzalloc), won't the unconditional call to list_del(&unit->list) dereference
the uninitialized prev/next pointers and cause a panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721065413.2306=
137-1-wenst@chromium.org?part=3D14
