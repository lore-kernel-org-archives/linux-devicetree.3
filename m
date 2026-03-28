Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CF4DDA9
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691925; cv=none; b=hIWAA7KtQRPZ8lM+u0P0qFs0QKsPt9QVV6pKVtlridNfzqXDvd+6m0f/QzxH8JFzHtSSTlWgYlDndgJjIgJIV9av1fwX/zEyQM59VJDG4HAlj/pzFv/yGGMD32nBTe3Kivxfl06t5gFbSkI0W7Ry3xCjvuMLF+cR25fbkxYPOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691925; c=relaxed/simple;
	bh=b3JlCC4tL2Tz58FKwg2YL+SyAtOwXrfA/gsgi5WMt/A=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=fEGhVsWerYfux3VahPkYYPtUJbsGeRyH15mf1zy7gFaiiN0xAlE9ynzDPv38qffWz6AUpAS8qKklG6QnE7/3k/gv30bDPHsbET/z9JD4tk+y4GeQcImqUaQbD+lgzIbX8x/QqLpeuMtpEtkohUIBP0/oRqSwoCiO/pmIbBCexog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlhYebPa; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlhYebPa"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2c160308a54so3849638eec.0
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 02:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774691923; x=1775296723; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=hlhYebPa5oD866bhGrd/E9DOI4xLPqqIBTNB58MI6CdiLe3RE62TMwDKXlT5JD9JHz
         616BnPap7CdTVnFhBgz1vNAQGISSEC6UKbM+tOLvrRlFVcbzBcrI4cKky7sUu2qgJ4sX
         esb+fG8/zEpOtMtAeSfw2QmIMue8UJ7bZmIBGfob3rD6Xv3MJ21axcBoS2W5kSerVQsE
         tfEGaebsgJnsUaKRNCmsXAcsz2vRhOYZP4/0+OcB/+t+DV0zUUDuXDPuQFc5W/jLyaIU
         yVE+fCtnWhzPC8ODrhs8bDg97Pn1/4nAx38AKFL8cWIQjWzg4YCemqayURr4y+W/0avQ
         5OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774691923; x=1775296723;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPZRgmhGXKGLV4+N3md+ZOqvfZ5oB0BV4k3AKJQbhLw=;
        b=CDRmLwKJdWrz6EwDbnm1dKDFwI0z/s1bywMYPM840iEYa7ZaVAn9YJ5YlvpndgWZkT
         bmtkjHJQMnSCugE07L0Kazxm5oiJkDzyp4m2b99wLV9L2bpC1lGpH4y3X3ttSqobMqkd
         9SigXhuYhC+plY38fDnDhFsx9R7MeNnoFfiPJQ+qa0Zf0L70XTBrvo2jYwNbiwU9SX1/
         RPq3zEI4zhwdhJiIF1gFDAFdn7mUbf4FpxEG3AqAbClbTfIC6nMCa07qwGBeJ4Hw7F7W
         DNsuNrRo0wv8x9LV/rMba5n0vrSCsgxBZ2P0k+UrQ9RmGJFyF5OmhR055MtKuTpSJDET
         atlg==
X-Forwarded-Encrypted: i=1; AJvYcCXZFsKUHXbOyMuOGel24xmzTdfGnvHBgWuEvYJV4EMrcW24gUlAiwnsKtCpQaOyg/GBsSiq6s1w+I8l@vger.kernel.org
X-Gm-Message-State: AOJu0YxiiTf8F7A+/nA0egnjHMOLllA6dR0tyUUV3NCbayENPZdTSatP
	QbFw6XCKgyYFSkezpztKjL22o3g1fL6ppJa2u2Wui8bRTBdQNQvHpWT+
X-Gm-Gg: ATEYQzwM8Tj4JtKpB0FzZz+CDvwN17TdLIwQLFJVjTDysTGArFE+F8bg4Q/xAXhlf6r
	7/YF+TJyP7wBOm0tOnZ8aPKG07/UHMZluMccStwMfAVSvY9tLaJLA/tvVsR5tOnY4ocoJFaGgKJ
	0SngrRMLlSHxa8QV11isZdhSX6Nr0/2rek43G83DQ1K7+8i1MxLoS397k0Y2HfF/1GAxcv+MiKF
	fFBzgxdJ7C8MATKrJehZ3/jOtCGZJgAAIhnKFXCzeqvubeKhsVXWvbpsTr3fYCxWtW0lxHNb+KM
	8ydunB+oVv3M72vPHweeFvVRFXO9pQURo+TsMMHMR9wcA7+NBumZ4cvea7uU8xTIdK63hCe8L6x
	SoJRj26402xMJulurH66xrPHOokgj5UylXtM/XvWRfR4ghkAT65jsVASz5P1wWIfNy3I3IMFRL8
	h+xCSgelLE68BNqVD0C0WfIFj9Olg=
X-Received: by 2002:a05:7022:b98:b0:127:33e0:ea33 with SMTP id a92af1059eb24-12ab28e4da2mr3105409c88.22.1774691922629;
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
Received: from localhost ([104.28.227.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm1866524eec.31.2026.03.28.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:58:42 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 17:58:39 +0800
Message-Id: <DHEBS4TLJV5W.3AO0UY2JXWAFE@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Guodong Xu" <guodong@riscstar.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-clk@vger.kernel.org>, "liyeshan"
 <yeshan.li@spacemit.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 request definitions
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
 <20260326-k3-pdma-v2-3-ca94ca7bb595@linux.spacemit.com>
 <20260327-granite-giraffe-of-infinity-ff49a3@quoll>
In-Reply-To: <20260327-granite-giraffe-of-infinity-ff49a3@quoll>

On Fri Mar 27, 2026 at 3:30 PM CST, Krzysztof Kozlowski wrote:
> On Thu, Mar 26, 2026 at 04:17:18PM +0800, Troy Mitchell wrote:
>> From: liyeshan <yeshan.li@spacemit.com>
>>=20
>> Add device tree binding header for SpacemiT k3 DMA request numbers. This
>
> Why?
The DMA request mappings are hardware-hardwired and differ between the K1 a=
nd K3 SoCs.
Therefore, separate header files are required to define these unique consta=
nts for each
platform to ensure correct DMA channel allocation in the device tree.
>
>> defines the DMA request mapping for non-secure peripherals including UAR=
T,
>> I2C, SSP/SPI, CAN, and QSPI.
>>=20
>> Signed-off-by: liyeshan <yeshan.li@spacemit.com>
>
> Name looks close to login name?
I will contact her and confirm.
>
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  include/dt-bindings/dma/k3-pdma.h | 83 ++++++++++++++++++++++++++++++++=
+++++++
>
> I am already confused what is happening in this patchset - so which
> device are you adding? K1 or K3?
Aside from this K1-related patch, the rest of the series focuses on adding =
support for
the K3 SoC. I included the K1 header because I noticed it was missing in th=
e upstream
tree while working on the K3 support.

It seems my attempt to 'clean up' K1 while adding K3 has caused unnecessary=
 confusion.
Would you prefer me to remove the K1 patch from this series and submit it a=
s a separate
patch?

                                    - Troy
