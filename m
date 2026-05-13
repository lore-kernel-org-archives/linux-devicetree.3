Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8682C9D
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630975; cv=none; b=e0Y5sa/i9lS6OVYWguA0tBluL0tE8rtdu2AH/fuAnxMYj1CgwqIPqSna7VcU2LMsqvODfWJ6sYQWOei2Hut5MmmUbdb5y4VgAjz9bq88pOBXYW/OSbmKscYru37YGP7SqTlIDWkT6dkKsAUy9lBn42bKNy8wfJIAXD5Kmp2DK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630975; c=relaxed/simple;
	bh=vaultDQ8zF9dneJBQMOW5HIgnIo6UI8UNA9TdN/c3/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V6XxcR7jEOX7TE/SH9t5r9CNqTRE75zpy7pdysIsOD84KsCpCBUaTTtvR24FQafaJIRb//R+ES6RhvHQmHTKyOV3Y8wEMYWxIiSwisfrXjn5YadCxgkw0QiMCYNnWevwPofCHte/try7Powf4imNQTZ3eLZKtU9Oqa0d6nI/Qo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiCpCSMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiCpCSMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E066C2BCB0;
	Wed, 13 May 2026 00:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630975;
	bh=vaultDQ8zF9dneJBQMOW5HIgnIo6UI8UNA9TdN/c3/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=MiCpCSMyG2q+LwZB3pVogc2BiE4n46okR2rr4BjeuCaZUCLrcxXWQFjjq4F4rexJD
	 rvQbZCAccSRiRmm84XcrLriFzJ/ris/AhyVQ8OlhMmC4ZXfJePz50SypRj0VWUdL81
	 8ke3cN861M9HYYZ5OfBn+xU+YPyqyk819IeHfo3s6IsbF1mmVHcAUpG64rrFNJ6SHL
	 GrSvw9M65niRcZt1aUTNQaJYVgY2TzS8IyZRUaCLmrk0efljZmd2Quo94m9xHBQWEg
	 m+xnAsEpB6QV+z07gZzht+S4yuZ5G6bYUnpigzPDWJ2+ju4Wx1DraEHQ2eJOwWr6JV
	 2Ao8SlnsYZTIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: vendor-prefixes: add SiTime
 Corporation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <rouhi.ali@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511211143.19792-2-arouhi@sitime.com>
References: <20260511211143.19792-2-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:09:34 +0000
Message-Id: <20260513000935.2E066C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Mismatch between Author email and Signed-off-by email.
--

commit f07aed4ee2f7551cdd59eeae879a77c0e43ec6f2
Author: Ali Rouhi <rouhi.ali@gmail.com>

dt-bindings: vendor-prefixes: add SiTime Corporation

This commit adds a new vendor prefix for SiTime Corporation to the vendor
prefixes device tree binding.

> Author: Ali Rouhi <rouhi.ali@gmail.com>
[ ... ]
>     Signed-off-by: Ali Rouhi <arouhi@sitime.com>

This isn't a bug, but should the Signed-off-by email address match the
Author email address?=20

The Developer Certificate of Origin tracking usually expects these to match,
but here one is a gmail.com address and the other is a sitime.com address.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511211453.2067=
1-1-arouhi@sitime.com?part=3D1
