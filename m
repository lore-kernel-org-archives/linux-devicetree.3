Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012C296BA9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783495136; cv=none; b=fpzxPl5vEcFeTyAfHARsrv5fzZ5h2nNFoFYWzCQtMgnCIsp8SuoTBvwvnxG8oVn5OR/WydNMIbGAA31BBvhuyeB4qgttcVPUPQz6pF8mxIA5DmcVhkJ1OvtGxCU0bkiH68F0iNRkZVGKEi7Uc2seaAXV9t4cqXOI+QRlAC7T33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783495136; c=relaxed/simple;
	bh=/7ZP+/IVmowtLPWbf9r9wiANJPNp5BW2KJdJ/mhG5Hk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l/My+d9O1McQj5f3tC3wALlbaq4zRz7r/YmkLY4yeYiAUiCgBxkvXRtSujOAhwvTcpI7eL68jrclDpKkkM3P+JTuaWBghpdPr0HcVaNOIY+DSmqQLm5rr02u46TMAgokTAY4bjBel3jDNhzdapNcUgx9mTymlCDiqmi6L6lTLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeSdOQHu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeSdOQHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406591F000E9;
	Wed,  8 Jul 2026 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495115;
	bh=/7ZP+/IVmowtLPWbf9r9wiANJPNp5BW2KJdJ/mhG5Hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eeSdOQHuZq8I+iIG4F/+F8qSNFn+cY3TrZZCOVV0AY1aHSiEnr2/y3jBdnQplsPQk
	 aMLZ43Gv7KF1QYUcfuOAHgTHi8JHUJD9cHSDBOJZfjLpsRJ788tUmM35FLRqc3OJtd
	 gqk5xi68LVAc3UVkx2SObwVj39j47LzUbNqPpS+vduZkVotF4YYjKSCf5KA5DP/thV
	 YqQ6OylAR1P8oiE9TWEZmEy6z2dNnhPy8NQV8/9F6LjnTDGzDlbdPPe67QoywsZvpw
	 NH0+gjkrPGszGZc5qhHNANh4hmlbfdQqEsKYOUi8urllm/1dxdKEd6dyotZdr3naEJ
	 W6elkJPXEtxzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/26] timekeeping: Register tk_data into meminspect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-meminspect-v3-v3-7-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-7-7aa5a0a74d5c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:18:34 +0000
Message-Id: <20260708071835.406591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims to update a 'minidump bac=
kend string table', but no such update exists in the patch.
--

--- Patch [7]: [PATCH v3 07/26] timekeeping: Register tk_data into meminspe=
ct ---
commit cd57bf7bb63adf79fa48d7672596fd937addefd2
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

timekeeping: Register tk_data into meminspect

This commit registers the timekeeper_data array into meminspect using the
MEMINSPECT_NAMED_ENTRY macro. It also adds MEMINSPECT_ID_tk_data to the
meminspect ID enum.

> Register the timekeeper_data array using MEMINSPECT_NAMED_ENTRY
> with the "tk_data" identifier. Update the meminspect ID enum and
> the minidump backend string table accordingly.

[Severity: Medium]
The commit message mentions updating "the minidump backend string table
accordingly", but the patch does not appear to contain any changes to a
minidump string table. Could this description be inaccurate, or was the
change to the string table perhaps accidentally left out of the patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-meminspect=
-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com?part=3D7
