Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CA3A6B9C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169311; cv=none; b=AWeaKSExzMPnBangV0is2G3Ewby6OmD35iV7WEF23KL7uBX1uedijebVXFjS3y1L4lQdFfCNJ9k5pl3AihYpPSn3CwGbGcUYLb7aA/ejOkcsaYhGCjxLVM774IPF9oc+dXNwDcHIwVgXeIwpeo8YK2+VpMZQ6dbPrrl2dLluXwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169311; c=relaxed/simple;
	bh=1Dk0uiE6hYQnxA/reUwzj6Fl9+M3PF0yZCgiXZxD6r4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MGP1BK2WokS0xCYP67ZRI6g3ejsZWEQ40AK3Fk1CJfyaXWDmYlCmrLwJaWSmuM9gNOpmdyJzxW3tD3hf7IB52kWGgHY48T5sjtENAXOLzAaGqKgji115YlR5WTcw/iglze7LS7b6BMfKHqZkKil815MKx3lQDtlGwr05ptjniOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyKZbZEG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyKZbZEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E09F1F00898;
	Thu, 11 Jun 2026 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169309;
	bh=/p+Lvt8ewbTVk2z2hFitilux2l9kt1Db/QRRfFyX00g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GyKZbZEGGB9hjiWZiY1sQa9IiC5sIQpM6CyxyFHJY50b74+Du1XhXefQ9TcZYzdTS
	 OY+aREpqTErUceWsgAwmiEw/MzeABFtQoxZlt8BCjj9QsijwD0l3wDDqfRmKNjjwoe
	 6Vyb0xx3hvspooGfDvKC7EHUux9AAwdQWA/JqBl+oWDB9AEJMB+vOPvUyNYRVN933L
	 ue2m0W2GCI3qHQqoLWfPgRUsJ4mKt33MyuUMDl6l2StC6YK6/iLMhgQT8CX0f8VMIi
	 VHr/ucc9xsc8JAFdUUyjdqBJP72ynKyYztxesSxpjix1mFTcC/aerkr5XfI11ENWfC
	 LVCLpq/RRAc0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable USB_UAS in arm64 configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611090946.2790631-1-akash.kumar@oss.qualcomm.com>
References: <20260611090946.2790631-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:15:08 +0000
Message-Id: <20260611091509.6E09F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between Author email and Signed-off-by email.
--

commit 8dd2d2a3035d6deca9f623e43d26b74e60f0f6d7
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

arm64: defconfig: Enable USB_UAS in arm64 configuration

This commit enables CONFIG_USB_UAS=3Dy in the default arm64 configuration
to provide better out-of-the-box performance for USB storage devices.

> Author: Akash Kumar <akash.kumar@oss.qualcomm.com>
[ ... ]
>     Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

[Severity: Low]
This isn't a bug, but there is a mismatch between the Author email and the
Signed-off-by email.=20

The Author is listed as akash.kumar@oss.qualcomm.com, but the Signed-off-by
tag uses akakum@qti.qualcomm.com.=20

Should these match to satisfy the standard Developer Certificate of Origin
expectations for patch submission?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611090946.2790=
631-1-akash.kumar@oss.qualcomm.com?part=3D1
