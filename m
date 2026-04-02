Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FB3B4E96
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132103; cv=none; b=r/203wPReVUrnZx8DkVooLOOsbeZqRymiukpyy/a22tZFwtM424PzCZVyrsvNhZfo806icwq1GvP5jvWlJvTFFHzUew3ihHIzc+A+d8J8apB0zYt0BgTOF08ti6tv0q89JE0SaA3Vnd3gFUUSLDhAKKkDKTG0XKOEOebN8qUd+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132103; c=relaxed/simple;
	bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2R01oUbR2XmQPlk+r5EwatUxTth5Q0ndWWQUq2WutJu65f4GRqzHq5m+vg+9cGzyrfJO1TSagQznhbkl4rcfTDhE+nzhX8DwpcxZDVogFllg8DSCe1Td82oZw6O5PZuYG6qkYgyh5QuIABeDsWXBfwoTthc1l/RltXjFep1ITA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaJ9Sl6h; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaJ9Sl6h"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5091d71aa11so9016091cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132099; x=1775736899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=BaJ9Sl6hqC/1CK0Dm18yHz21tDSelOWGBg3loGpIA5BwBPjF9oIsp/4rALMzJndYl8
         s7O02AV8yffH0FjiBl24DMSivLlzXeCnd3LcxrZ+uXVjnSqNBd40vp7pCXfxDu4hR67k
         86UqBDj5Ka37A83hq5Uz9WfaCX7xrdvO16Iqa1R1RvbLs8meV4M65o9o4xS4s8zP5Noe
         c5LECKucssHGB0uSTHZMZh4R7RCYUfqJDEvL8QgmG9Sd2ypzJG6n3X9VMEDg3M5BQBgv
         7Kxm9re15VhIC0rK1oAKgHuamKEnTAVi0sngESNCCYsHou3eY3E95sHolsUwUs2RViWn
         XE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132099; x=1775736899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DvXu/cFzmhICxjcxmUUXxM0EdPHfNTmI56aSkFKKKjM=;
        b=Y1kHxwaftqGOhBgB4h2VWkVjNbrJcS5qyETEy/NvLNCKbQynmOJK0PockRp6cf67zZ
         t6WOjuwDRWlcD684oF0eQzto3wBjgfY/XeMgUMKXM7tPRqBa2/xyGtTV/+5Kh+cljBdN
         gAuheCvfJw7Zx67VfEUd4iSgUWiX/571zFRvfq3KT+G+gjk1CjaQQiGXHTYGYkfRN8uZ
         M5lt4wKtq8O05sHiGtqVjUcwO9P0Sy8jHAZjcM/h5o1jltQbaf5247rJIznlrMNndezh
         QVG2L4f42RFbaAjSKsHSvW0peR4yCPcWyWgKzJeTfxEVxqS9w5RCKXh+fI6dWnAfshv5
         ADgg==
X-Forwarded-Encrypted: i=1; AJvYcCVGFalhlo8Ldhm6OVI1OBENo6t5HKMZ6hKNa59G0v+Q1x4SMblus7uNlRPtae5fxIeTjTahHifAKRRx@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKr/h2oO8mNl7+AMHi5UQfAXcON4crRwUThJTlgwg3C2tm0TY
	6Iaeu6jGM2GnF5BDeJegHI0THi/0idTALD/l7jnf9u94fn0znQSUpVA4
X-Gm-Gg: ATEYQzx03Lbeo76RztEOextZgCCFBqiwq7YDc66MOCK4j4u6klxzrcCpHRLBrPx6KMT
	yy5qERsMPBdA6vTDbmjuz2IvYWdiw3OcDP2x2ESqKtG6aw9CjdODlhYggDl7CpAWCfVwNZD+MoO
	M/Er9y/yv9ELIrr4wvJwlpn7mIEnqZCmTwp8d87ZW7vpIM5Cp6MsbapltTCIMf2O68OUs3DIapR
	7minqUSC5vwS2XkrwnbKOCLIpHF1Yj3O4bfVS4NoZca17Arqdne7RwnClmyWZKMUMyZHQeyvd+C
	G/uZDiXSJk0eTkBl46PZi1TwiA0SHxuhJbtyRf/8IHnukrC8GX4qwe24i8tN5s1G5SZuPPDXezF
	doKCpAd2rtv8IXr3quNq1N221sCHiQItVFKnFWpYABJueWJKpqSXimhVE0gJjYd7rdCIm8OAR++
	F1y3Bs0np25bu4yJTRwUY5oePaDRsLeZIWQ12i5TBcoYYDc2d6+1vnhfNV
X-Received: by 2002:a05:622a:ca:b0:509:f1e:41fb with SMTP id d75a77b69052e-50d4fa37517mr23690271cf.6.1775132098611;
        Thu, 02 Apr 2026 05:14:58 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1d871csm23904961cf.10.2026.04.02.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:14:57 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:14:54 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 2/5] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <ac5dvp9-pvIwguAA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <20260328173450.219664-3-josh.milas@gmail.com>
 <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11e7fcc9-c8dd-4bf5-a600-3d130407bb82@rootcommit.com>

Hi Michael,

Just fixed in my latest set and will post v5 after debugging your eth0 issue.

Thanks,
- Joshua Milas
