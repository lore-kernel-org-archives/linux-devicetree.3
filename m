Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D427438029
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856656; cv=none; b=kTwrznxMjoSC3AUIvW9Q1jcuuG6So3nTZaTY/sYY9BZVYxU0fnul7QvPp/FWr0Dqlk5WEMtCwiE+Ptf/wgXAJXMZuw/0lLCdnA+m3psQ0bUB5taiEp8PXbvPycoZwesedApuLDDLqILo+S45Pl6PULXS3+883VvbFgEGJW0QQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856656; c=relaxed/simple;
	bh=OIqYKR7x+vapQREvHec6EpfZXxtTZMYi/hDKDHZqrm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsBmCmY2K46diPvfYaC2fFxaz6JGNZEHsF3iyknGPWXTM+yBOyXU/DaygSaNmoi5gr7VYDPckOPcS133aMf/gcqyTuLABJZmmMIimuYeXRSWuez+FrVrywWsQFQlX28S7xlqg+JQpZhApAwquRfTXbDZ0hEI29Qlkae05gnHL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2xW/qAF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2xW/qAF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a88dfb65e7so123872a91.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791856654; x=1792461454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehjgEMj6/RVBDUJWsS+YpxJjQGwMw9r7SVgT28c/XUs=;
        b=B2xW/qAFFnVogtzldLK3C8r3rMFvBKygzqichQcRcpwx2G8LHF3PrksGC4lx1BFPlA
         M07jLgYIgTlJoANebi1MbiahUjU3l17SO8kuTrhJkb15K48gXnSLuiMHzFR8aqmUwjQs
         I5MhS5OLmqS3oTqmrbBk5f/GtvlFcdDy/O1WWB0gR+JEpZ5sYu0A8mt0KjoioBcRxVtH
         PKOKzUh+cPkSbKQcnif6vInI0JxAy45MqeM2Hr85IL7EATTk+RL00Sklu069Nt//pYXd
         c8NsUJqIpQ6831O9epq3cAkkAzJd3grjz/v/xHVp+KSNMwvCiq/cKchekPplC9HQUGth
         TKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791856654; x=1792461454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehjgEMj6/RVBDUJWsS+YpxJjQGwMw9r7SVgT28c/XUs=;
        b=V6sB9dsTZMH2myKFCn8offXOY4WllS4WM/ZUHiX18gWaDgUqQSwSg3eR+rdGP/0CnX
         2rt9xEDbjSw42dfafKwNBFSehWaYqSuq87PMrmpzVMoB818FuAH+Ep8IX2vUDpONuiPc
         ROKyQ6hF9fCUiOaf6J4MB7Tzxnwh65YBrsQzxJ3eRKBaRgI7npF0T7T5iCUAKxYXLVtk
         Oi/GwLMBhIf0rw5afbHe8CQSgoAzxt7ItOWoL5mUZfjqYnwBh7ASB0eo+NZIvO5DhZAM
         MrXs5TL5/rE6xjAiJRCXyy0pv3ttfhuzPhUuuIpJ1dgwAvPbuyxWySRrG2dhubAmcq1e
         lCLA==
X-Forwarded-Encrypted: i=1; AKwUvBwj464C7NrDKW1GOQRVrdRI+Dw+0pP1dVcFicTq+04YL/AIWAh+5GvDPyWnZnmvfjsKn0v4mr//ow/z@vger.kernel.org
X-Gm-Message-State: AFq9FYLj/IIlKeGwykT3DyWELdjYv8d4+uUDWyy8CNql/Yr0CiFt6kSb
	q5eMwFF4ddOJt5MzfR4YPQ73G/WeQHsD/lGfOeqYQpa2TaqW1tM3RMvi
X-Gm-Gg: AYBFou0OjDIu3R2xMuBY78HMplDzcTMzeHBf+n+f692Ih4ZsZM5fXatZK8q9+euOEbo
	VoaVDbLFI4cwCEtI9e2anE5Os6fFPNi6d1/ztopnXvEWTpQCj/Z3RWZnK5BP5vEIztM9tKCf9hy
	EQaVvsMTQIswL1pEKBXvex79vb4oBWaJSgtNic6nHCUtv8rcpzaRf+5fPUUbCMoeurq7O6Pq/Sb
	2Fuk/Y0Bn/MgDStEjLlIgcTXTznIE/9K9qVsgCLldn1ILREwDUzkpdAlCuJiJNdZDmqFy5qWguM
	piiG4h21Z5dDpDAUfkDmKRAeHHQh+Vmq9SD1cY0ctxJ/v1pSN8hlqih8lEPK+cj2loNQQ5IHNKc
	u3sm6qoKcc2/PZ43/g+sGFl0QsFxWibaMcQ9I1sSFAygJMdHC0r0vnE0jZwiHRH42E0pJg1qrFM
	ICn2CIoHLOVvdXs9c8lbw9tpohNhTVwsq/MWWl/vlcDXyHAbV6dvXBNuM70TlCDLhakcQWl0XKk
	posCJLhwkNgPQ==
X-Received: by 2002:a17:90b:1d03:b0:3a0:45f7:b361 with SMTP id 98e67ed59e1d1-3ab3a8a4794mr13965643a91.3.1791856654310;
        Mon, 12 Oct 2026 18:57:34 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm18431400a91.8.2026.10.12.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:57:33 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: jactry92@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kaipeng94@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
Date: Tue, 13 Oct 2026 09:57:27 +0800
Message-ID: <20261013015728.43307-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 12 Oct 2026 22:18:13 +0800, Jactry Zeng wrote:
>I think we are about confusing the product name and the model name here?
>It is clear that the product name is Acer Swift (aka '非凡' in Chinese) Go 
>Pro AI; the link to Ubuntu stubble you provided also reveals this somehow.
I agree the product name / model name distinction is the right frame. It
turns out we can settle the product name fairly directly, though: if I look
my machine up on Acer's support site by its SNID, it resolves to
"Swift SFA14-11" in every region I tried — Japan, US, Australia, UK —
and on the China support site as well. So within Acer's support database
the product name is uniformly "Swift SFA14-11", and "非凡 Go Pro AI" was
only the retail marketing name used on the Chinese storefront, whose page
has since been taken down. It is not even a China-vs-global split — the
support identification is the same everywhere.

>Also, IMHO, I think we can't use 'stable' to describe this situation. As
>soon as the product is produced, it was given a product/model name;
>unless Acer renames it, this is it. The vendor can also remove the
>support page that you referred to sometime in the future, just like they
>removed the product page; this isn't rare; I think we always shouldn't
>depend on it.
I fully agree that web pages are not a sound basis — so I'm happy to drop
page-based arguments altogether. That leaves the two sources that cannot be
taken down: the DMI tables provided by the firmware (Product Name:
SFA14-11, which is also what Windows displays as the model) and the SNID
label physically on the machine (SFA14-11-QWU1 on my unit). Both are
model-name only.

I think the resolution follows from the product/model split itself: the
model property is human-readable free text, and per the conventions in tree
(e.g. "Dell XPS 13 9345", "Lenovo ThinkPad T14s Gen 6") it is free to carry
the marketing name — so something like "Acer Swift Go Pro AI (SFA14-11)"
works fine there, and users who bought it as 非凡 Go Pro AI can recognize
their machine by it. The compatible, on the other hand, is the machine
identifier, and it should correspond to what the firmware reports —
either the model-only "acer,sfa14-11" (my v1, following the DMI) or family
+ model "acer,swift-sfa14-11" (what the maintainers asked me to use on my
series). I'd rather not embed a retail marketing name in the compatible.
I'll leave the final call to the maintainers.

Best regards,
Jianfeng
