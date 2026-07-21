Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74C63358B0
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602314; cv=none; b=LTjXQwDjdcwbZFq+J30UuSoOYg6cHldv29PVJ4YIZidl3oSraxNiQ0pcXYcyz9NwgaE8hpzdY1aJ+LZsCI7f9my0VzIvz7t4lvZoCCxyG3UydkwoRrwRT/j/VOBcoWxxew1snoBJhDtcEWojQ1UTaO0Q5kKdIOA1LS9/3AriqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602314; c=relaxed/simple;
	bh=YJsPImwprWYdEz+ZKXaVKQBIP8+D5IdSIcmr1UJr7mg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cykbGd9nniU/haX3/ySIic2bigAtS7QJPMKwbI8QZSFPgs01tEOgFSVMLRSgA3O9Hw8t8JmliXA8Rf4DFOE37MjnxohDX6we5ZgA86PzuOZLrKF+iTpNQa2tNYL14KhDIDNmRdmFy5Xce0sMYdfMLzT5zUctgv3Z2+lzSEAOFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OsOU4TjM; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OsOU4TjM"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9d1fc053e0so6439034a12.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602312; x=1785207112; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/+DBEPr4uWvMVbIBmyNdw6JZxEfO9MH/309T1HE5nyg=;
        b=OsOU4TjM38D0cFv+gGbwNEfyGxyd0QfUBtBb1y88x61hgR3B653Pe/VASgPdjLxiLq
         5gtzJPoEJegCzOlsknTMEMvZyuIDElRxZOu8F+JNN1xmlvV/nJj/WlnSTSePlceEMYFw
         N8n9BOXsMeDLNoqg5CmdRpd/Ewj2E7mUwjYZBWqVSSKeKkaMsDjZsOoouTdXGRo6VeXr
         rXvHNQn4be+ANkoU2sKM9IcUihbCdo31ElrshPQRxoWwkiD9wEs0eK8mXzD+oKfX00R8
         uLwiKbLpAGGjsYb3hL11cpPxy8wxWOd9g5KECQP26TnCDNzDo+eHJCAXLUdmgHtRD+ge
         EAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602312; x=1785207112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+DBEPr4uWvMVbIBmyNdw6JZxEfO9MH/309T1HE5nyg=;
        b=ilmH6caVn8sR5YrZUGQn+CiCQdEWI3oOXAvBJxL0aPRyWlXbn8NkxwJffe8vm7YX2r
         2ZrMgDLn1/jNLSDOp6joh8z+5xbAOy/Gr/16htZ0KC7DBkd1IwgcGJOO4bVfAtsi2IlO
         G37ahuWw7Tvzn3u+LEdn5Ln0FrvPIpycHxjZsTkMPun1kPAsTrpq3+vCjglFqGFacH2G
         dDsEMd+YGRGLO0Txg3g4WVXI2Mnsi67N2I554dWYJNqESnBKSvlgxS6oq0x+17TfnDTf
         gavRcpExMrBnA0MP3JYN6qs4YQ8lMh71sL3nZZIuLSg36vScPNW4FJxTO2HPArVwA3Hr
         w2kQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJSK/Xx3f9VBPPkTgKJHnChkN806nToGCYFj54ztXk8IVKndnQoF3YLKevUrNcFfbbv+48G/x2d8uu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1jkWY2T6u5Z1dG/Bom6Hx+Udty/WazL2q1mkfGKZoulMrVwcn
	VQNx/fmRj1keHg8c+Diuq/aGYxhCcM3kTwYHWjRfwBzumjl4M97tzdAse2ryAFgxVuw=
X-Gm-Gg: AfdE7cmdnXgw7+wX/Gt/2mYKkFKazybUzYsrq3T7K28rXsM8MbBUfWbvdk+dSTKJfix
	UoypciybRonnCrQg95JtXe4qcgHqAGa/Dvf08/wFIZT61+CUKxEjae4BPW04rwMar3OHJFohyBq
	46MWjYpbxt+4itcjFVGlpUXKFOxahehCklFWoGyBw6iCxj5OqU8nZG+jQTtAXn67m4i3SJtcIeY
	CPeHJOP/HbgY+keaexkM8tkKD/+S3lcp8PrIBXWSDUy9pSRGm8SGu7A5M4cOAvFrV8H7jvj/iln
	nHBlAZWE+G3uG9V9H0tFyw4xUX++wgO+WjmkKx9XJygCE2sEJf0B9Vhasue3z2O7C1y18GKCW2h
	t8CW1WlKLiywcWa1DONXvnxbR1rhv2EGvo2+fSkfbB8gKmfSirBRpDdV2eRjGq65z92J6YGYJyD
	8ffA==
X-Received: by 2002:a05:6a21:6e4c:b0:3c3:7cd0:fc2e with SMTP id adf61e73a8af0-3c3ad8ecc7amr18216306637.48.1784602312235;
        Mon, 20 Jul 2026 19:51:52 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm46116476eec.18.2026.07.20.19.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 19:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 19:51:51 -0700
Message-Id: <DK3WPZU35H6J.10Q15VPVXDWNC@nexthop.ai>
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 4/4] of: unittest: cover /aliases updates from
 overlay apply/revert
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-4-f1e5d9889b30@nexthop.ai>
 <20260720071020.4E1C61F000E9@smtp.kernel.org>
In-Reply-To: <20260720071020.4E1C61F000E9@smtp.kernel.org>

On Mon Jul 20, 2026 at 12:10 AM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The test claims to exercise patch 2's logic but bypasses it by=
 passing NULL for target_base.
> - [Medium] The test claims to exercise patch 3's logic but bypasses it by=
 using an absolute live-tree path.
> --
>
> --- Patch [4]: [PATCH RFC 4/4] of: unittest: cover /aliases updates from =
overlay apply/revert ---
> commit 1237920f0bd1d803a084dc2f03f9e63aaf5cd6a2
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of: unittest: cover /aliases updates from overlay apply/revert
>
> This commit adds an overlay and a test runner to verify alias creation an=
d
> removal dynamically during device tree overlay apply and revert operation=
s.
> It asserts that the alias is correctly added and then removed.
>
>>     exercises all three functional patches earlier in this series
>>     together: patch 1's reconfig notifier is what mutates aliases_lookup
>>     on apply/revert, patch 2 is what lets target-path=3D"/aliases" resol=
ve
>>     to the DT root when target_base is non-NULL, and patch 3 is what
>>     rewrites the fragment-internal path in the alias value so
>>     of_find_node_by_path() finds the live-tree target. Any one of the
>>     three missing turns the middle assertion (get_id -> 99) into
>>     -ENODEV.
>
> [Severity: Medium]
> Is this description of the test coverage accurate?
>
> As detailed below, the test appears to bypass the logic for both patch 2 =
and
> patch 3. The overlay uses an absolute path instead of an intra-overlay
> reference (bypassing patch 3), and overlay_data_apply() passes NULL for
> target_base (bypassing patch 2).
>
>> diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/un=
ittest-data/overlay_alias.dtso
>> new file mode 100644
>> index 0000000000000..32532c80505a7
>> --- /dev/null
>> +++ b/drivers/of/unittest-data/overlay_alias.dtso
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/* overlay_alias - declare an alias inside an overlay */
>> +
>> +&{/aliases} {
>> +	testcase-alias99 =3D "/testcase-data/overlay-node/test-bus/test-unitte=
st100";
>
> [Severity: Medium]
> Does this overlay actually test the path rewrite logic from patch 3?
>
> The testcase-alias99 property is defined using an absolute live-tree path
> rather than an intra-overlay fragment reference. Because this is already =
a
> valid absolute path, it seems of_alias_create() will successfully resolve=
 it
> via of_find_node_by_path() even if the rewrite logic from patch 3 is
> missing.
>
>> +};
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index e255f54f4d760..a9f4a0bb30872 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
> [ ... ]
>> @@ -3475,6 +3475,53 @@ static struct notifier_block of_nb =3D {
>>  	.notifier_call =3D of_notify,
>>  };
>> =20
>> +static void __init of_unittest_overlay_alias(void)
>> +{
>> +	const char *path =3D "/testcase-data/overlay-node/test-bus/test-unitte=
st100";
>> +	struct device_node *np;
>> +	int ovcs_id =3D 0;
>> +	int id, ret;
>> +
>> +	np =3D of_find_node_by_path(path);
>> +	if (!np) {
>> +		unittest(0, "could not find %s for alias test\n", path);
>> +		return;
>> +	}
>> +
>> +	id =3D of_alias_get_id(np, "testcase-alias");
>> +	if (id !=3D -ENODEV) {
>> +		unittest(0,
>> +			 "of_alias_get_id() =3D %d before overlay, expected -ENODEV\n",
>> +			 id);
>> +		goto out;
>> +	}
>> +
>> +	ret =3D overlay_data_apply("overlay_alias", &ovcs_id);
>
> [Severity: Medium]
> Does this test actually exercise the target_base logic from patch 2?
>
> Looking at overlay_data_apply(), it calls of_overlay_fdt_apply() with a
> hardcoded NULL for target_base:
>
> drivers/of/unittest.c:overlay_data_apply() {
>     ...
>     ret =3D of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id,
>                                NULL);
>     ...
> }
>
> When target_base is NULL, the pre-patch-2 code already resolves
> target-path=3D"/aliases" correctly via of_find_node_by_path(). This means=
 the
> test might pass and bypass patch 2 entirely, missing the intended test
> coverage.
>
>> +	if (!ret) {
>> +		unittest(0, "overlay_alias apply failed\n");
>> +		goto out;
>> +	}
> [ ... ]

Will address in v2.
