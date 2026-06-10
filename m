Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771953A5E90
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082778; cv=none; b=MSlU2tpdqIZnOdkZn3gBjecGUA+KIQBfB6oLa5rx1No/4YQtjERqL6japNstDBWfrdUFfiyDUV8o46ib9tUkFUp0dFDCVThsdFO4v8VDBt0zLVOwd53tSbVddp87KNUHhfS/UO9Xs0+VjYw+akRegCvNJnw0ceS/aAJbYoD/Txw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082778; c=relaxed/simple;
	bh=yKAUuOURd9y9p14tOY8p0TL4uJkXphHba6728gxQneY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fsE7VGrGTdxML4zfL2Tm9gnD4lGvq/sIyxTlsCUFdq2G4lS4KlNpsWaQ2GlTOqFspwz0t9f4ELkicO2Ag53xo5y2NvvU3VDleInaqhg5Io8G7njikb5I0UsvO63W1C9g60wvIhbf8+NrPqowW5O1AThVGfFhlh/mN4bBVsBNVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO DESKTOPQJC4P40)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A292A8800002E14; Wed, 10 Jun 2026 17:12:41 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 5C8B85373A4342B08C8F646CE9D15207
X-SMAIL-UIID: 5C8B85373A4342B08C8F646CE9D15207-20260610-171241
From: <zhangyi@everest-semi.com>
To: <krzk@kernel.org>
Cc: <alsa-devel@alsa-project.org>,
	<broonie@kernel.org>,
	<conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>,
	<krzk+dt@kernel.org>,
	<robh@kernel.org>,
	<tiwai@suse.com>
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF and clock
Date: Wed, 10 Jun 2026 17:12:40 +0800
Message-ID: <070401dcf8b9$4aaa3860$dffea920$@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: Adz4t2H8cwE7+5GoRNWBhStZ5ikWXg==

> You already sent v1 and received feedback.
> 
> You just completely ignored it

When I submitted the v0 patch, I received feedback and suggestions from
Sashiko.
I wasn't sure how to handle Sashiko's feedback, and I mistakenly assumed
that if my patch didn't pass Sashiko's tests, you wouldn't receive it. 
So, after modifying the code based on Sashiko's reasonable suggestions, I
submitted a patch with the same version ID.
As a result, you received two consecutive patches from me. I didn't mean to
ignore your valuable feedback, and I apologize for this.

So, when I receive feedback from Sashiko, do I need to wait for the
maintainers to provide their feedback before incorporating the changes into
the next version's patch?

