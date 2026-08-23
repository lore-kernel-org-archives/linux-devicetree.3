Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF170356757
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514143; cv=none; b=pujKcK2X7gJNX/7H9FEFMIw7Ov3OWtfNxEbVFvbtdD/AdObKLNWioY3HdDhgOIb1ySqjz7Kw25sSmn3UImYOzwLe0faZe2rFdySSFFWDbvaRPzrX/uTgBnnP/Qu0yJYH+1Xv7/T2pk/uvsWRZluYseerA1kkYO7hEaxC9Ok1E+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514143; c=relaxed/simple;
	bh=aPBoR/SrsNjXZtRLindVuRnXvTuc6wCuIe9LUpNd6xY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pMGISglCN5RCJcmQLbA6+0tPtegGTA2nT8ItlTqrVAzZqAIzHiu4M5AyapGyLe1inFr8JJy+F1x4FUyFKgFAaSP9jD7i0Xc8ltElE3pKK4pN1sayoYhnoUkkzUPgJyNUFu7aw7SK2kAzpqYRPocBEpEf+aaIzFXEaS+ORWNx2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=bUI6AdXG; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="bUI6AdXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=wgg54forqrhdrizm4bumlw33ce.protonmail; t=1787514127; x=1787773327;
	bh=UScXlwRR/M1y2OECh3339hzVY9m2bouWXTszntHiI1o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bUI6AdXGPCkTC2bHxkE9PD3xfmKrvq2GXd8gkw/2W8Hefphk6mEx7P9LrBXqqlZz5
	 3R0dL32f+ZN89lyNQ0UkDaL2+P3uJZM+nTjTNbIHg5f7nZa1XAQhaTGQoWZq5c+NEi
	 4Tj77nWDIiUJRYdxbD/wkuqYgewPbm2/o4CLVaksTbYXeriFAhkq5LdG4WQfSwnF94
	 ed2cdKNvvYINAnLQCoifB4ounI9tgq0I+uqz97jzN8YthPLDt3LY2wERrg0eCqn1wi
	 9UjQ3CThX6vC/BEbtY/Arii56eaPAssZptvpRtqTBY1+qjBsAvl5I8xdTwFdLOA+vN
	 vo85uo+ixK1dg==
Date: Sun, 23 Aug 2026 19:42:02 +0000
To: Luca Weiss <luca.weiss@fairphone.com>
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, David Heidelberg <david@ixit.cz>, oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: Re: [PATCH v3 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
Message-ID: <20260823194152.501107-1-isyourbrainfoss@proton.me>
In-Reply-To: <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me> <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: 8d39a5982a299822bc8981a11884d845d111b1ed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Fri, Aug 21, 2026 at 11:28:22 +0200, Luca Weiss wrote:
> Can you please confirm how you tested this on your side, and if I'm
> maybe missing some parts?

Cover letter tests were postmarketOS, these changes as modules on
7.1.2: nfctool -d nfc0 -1 -p on an NTAG 215, then neard for NDEF.
No extra firmware or userspace on top of the three patches.

That 7.1.2 dmesg already had

  nci_ntf_packet: unsupported ntf opcode 0xf02

I treated a found tag as enough and did not mention it. I have a
driver change so that NTF is handled; I'll send it in v4. The ndlc:
dumps are debug prints.

I also ran nfctool -d nfc0 -1 -p on a locally built 7.2.0 kernel
(sc7280-mainline, with that handler): no 0xf02 line, a Type 2 tag
in about 0.13 s, and Ctrl-C with no tag still left Powered: Yes.

I have not reproduced an error after Ctrl-C with nfctool on that
kernel. If you have the nfctool and dmesg lines from the second
start, that would help.

Regards
Kristian

