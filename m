Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBDC3C3432
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788227741; cv=none; b=euVOwkRN2wcgVzIiaf5xaia5ygEJrkr19DbhSTvbXrwgt5DQVf9e8LeCne3SWWN++XMVx01kvfPu1j1v1Tof9m7KKlTXkYf7Pa1mlsFAe7WmkXuSlYFRnP1dLZ/f5UGmGBrvfKQicjq8ncQwpxsVMpsbaaZqlWTcJ0MvNCS8w4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788227741; c=relaxed/simple;
	bh=mbOofe7RmZWJyGxz4Jt+Ilb924xCHvUnhjwTqOAUz4A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tjluxOrs42CZdTmss1K6whH2A297v1oVmlH9hcQeBhA76WDDMfV2gXo7K+8BHdBFdi+AJrSf41KcOwmDZlB2EevpZizv4ll9QtguxDZgm4q0v168hQ7C1ypj9Ghks8Km7D3QAZvYr0D1o77ru8qiZnv3pZkvI/hgWeRZ/A+1yXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3xEOcbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3xEOcbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D469D1F00A3D;
	Tue,  1 Sep 2026 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788227723;
	bh=Xs/2MPa8P4z/GPUKrVu972dwwAByBavZp934qGYZfmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3xEOcbt7oF62kW9PjwnC4JYi1NOMVShDTbxVNyhHseotOTp4kVDIBAITql3rHWP7
	 QROvmcr/al43qZbK77B9VXHCLP3w/E4mfRIbI2pTcWFQN9PY3igiWeoFjmH2VyzvgD
	 K0SK5rHUqUOxUxvC4a+OCmgkn1jIfNAb3WB40Ivl9Sb6PIvopty26/e1dTXaIqbd7y
	 hjVGtXL72xoQYNY0vXyakIpRITY1yGxgREGCAxAFkIqmNZPt7YTDqxAk9gQJx8JmpH
	 6/M/uKY9D4T2LVpJjX7TNMrhzAymP/FD+HkUjvDvUQdzUa68jDFVb8TZ2UFu/M1jLt
	 NDh5Zd60BgdKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/10] of: hold a reference on of_aliases during
 alias path resolution
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-nh-of-alias-overlay-v7-1-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-1-02754604805a@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 01:55:22 +0000
Message-Id: <20260901015522.D469D1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Lockless load of the global `of_aliases` pointer followed by `of_n=
ode_get()` creates a Time-Of-Check to Time-Of-Use (TOCTOU) race condition t=
hat can lead to a Use-After-Free.
--

commit 6d7d618928c35a7237faefa2eebe21725f461ed9
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

of: hold a reference on of_aliases during alias path resolution
   =20
This commit updates of_find_node_opts_by_path() to hold a reference on the
of_aliases node during alias path resolution. It also adds validation for
alias values, checking that they are non-empty, NUL-terminated absolute pat=
hs.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 378703dbc11f3..f7aa14d90e501 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
[ ... ]
> @@ -1002,16 +1004,21 @@ struct device_node *of_find_node_opts_by_path(con=
st char *path, const char **opt
>  			p =3D separator;
>  		len =3D p - path;
> =20
> -		/* of_aliases must not be NULL */
> -		if (!of_aliases)
> +		aliases =3D of_node_get(of_aliases);

[Severity: High]
Does this lockless load of the global of_aliases pointer followed by
of_node_get() create a Time-Of-Check to Time-Of-Use (TOCTOU) race condition?

If a reader thread evaluating of_aliases in of_find_node_opts_by_path() is
preempted immediately after loading the pointer into a register, but before
executing kobject_get() inside of_node_get(), a concurrent writer thread
could completely remove the overlay containing the aliases node.

The writer thread would drop all references and immediately free the node.
When the reader thread resumes, it would pass the freed pointer to
of_node_get(), which would dereference it to increment the refcount,
resulting in a use-after-free.

> +		if (!aliases)
>  			return NULL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-nh-of-alia=
s-overlay-v7-0-02754604805a@nexthop.ai?part=3D1
