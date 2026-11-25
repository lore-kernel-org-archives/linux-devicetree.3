Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596692;
	b=OugOMu6Zxd+9o/nMIkz/mRC9xwGYXivlsVib+A+thLbNXFWuDgQFrxaY+GydttH6GAFA
	 kHUyyeesJjz85KeY3AemHyLwH6HBu/K2j0tPt3XWNhEgocDlIqRMPu0n9KdSBNJCXyF3Q
	 rIk65ORUZhPbXZhGI4P/GoO8GQ9sHDOSmi0vzhkQVu/vQwIXIhhhNgyOBXtN8y9xA8cBv
	 32x0dN8yWBQM7ezubYhcT0DZlZHJtyiZdTKGWGNsEiuMpFLziYqgyFyU9ZHIKuJKxrjjo
	 syZGPFQjI5ubmwHRRgE3Q3IAclMznLnv0iPCC4cLmqmk/zMAlflFFc8t0jY6MYY3dGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
	b=VbHDNmPw/YkThmVf6t1MQ1gNQlTvLfrfGiAi3x3P9v6ozExTwBNRwnfm2SoXN7b7QJB6
	 SBKXMgeIFx+5ilxoEm6UMWrPzJs179f5KefVchpI82kLLmLDe0VXhhW/SJqNs97LTSsGj
	 j5SXtfMumEOPuLVYYmdqPJwHGxATJid3VKCHwiplqeVuVs/Gg+ybrQTxUh52CXrguKmNX
	 jyAWpEF99W6CeQ7M8Gc1ciuQ/o/eklXm8EtckhK3IpjDVXqfETExlOmYUKIo/i8hpu+kU
	 xFnIqGMRElUPKBSf0kDqTDIX/3lXFHJUB6X4UTs001X1SprrCVOZiD0W4fthFSZyT6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6T6I228;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841A606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4841A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6T6I228
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso3332504a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596692; x=1796201492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=e6T6I228mNjFijA6R3pcSSqpOr/m02aqzwmFIkyHslr7sYbbf5f/8uofDwQ7hU9Kza
         0hZk4EOtq+hYd46fzJAHGHC4WmCnolpsAOg8YW54OsxnxpnXKhB49VmYVfSK1ZtGnzHC
         dkV/MfHh0E2ce/CPKYavkEx+Yz0XdQvO58jfvjUO7UodxaXCt6I5KBhg9BCoEXHdNbxv
         z36Quu14jvH6je5wKggCr0Lhu72x8qZATKdK/Fg6dUi9A8QCknr1hdY8oZuEdOsTw52x
         zYaMAZjYETATvVFeEA6wB6cWrMVZpUTK9ZydQH2+oTudLHomoI04Ag8p7nRA/v0zqBrh
         HmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596692; x=1796201492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=wo6afefsHskmfjN4aE0Oz6KHzwV9z6wCYsJE6lrVULmNsuQe8/apA6jv+af3oyYNXQ
         B4O3OmKYC9q7TyTSRB7PxuFCwa6lMeJihJodg90bQ1iONg8p7/J41MhlxHYktQvoFIVY
         kmPLS+8clycTvSaDTKDxSptRQbQa31TOtP7ZgF1hlu/tI7e++9O+ojiWqOvj+/ZMO1Ft
         OhZCUPlpb/Jc5Dlrwee4Z7xct96SbvjqGke72O6CjRyPpNce5LsSSgWcaIJwOILRWQP3
         zd+obEgz3fX/evg2yKGu3tQ+/fwl9Xob7+QnGuCnrcPPhF8NHNTe9oXCn1Hn54N0DOpC
         9uXg==
X-Forwarded-Encrypted: i=1; AL+hErHhkWZ083jCFt30tyap3a8qKTnXsbHm3vuDVVNl6YoRPy2BCMloCdcbJ/tM5dIhS0AsppA6tHgE3GPV@vger.kernel.org
X-Gm-Message-State: APuU4Z+OHkWc7LdjlQsXojLz8kxfkrv7RcpJBQFFKkOCnt80U4Fe3/ss
	dSpMySMMk0V9sGFFHITJ7Sb2VbigPOWWVoUM5fVq+VyS0LKl5F1whT7C
X-Gm-Gg: AZFdTZfzmyXdrTgpirYyN+kjkUF4dhBQ9uAnbsLn71+0PdwpY+Z74csoM2Wr5/HqSG3
	SE2RGhbOS1IDyA58CDBUC4dKdipVsv10RUkhsDz5xL4d0MhrwHU7b0wggyL1fXbXJ1tZEb4moiL
	S+dQORf6XP1Orr6FGegbPjoK/YSd/m3XI9E6zsXlJRaZQHi2zcOq7mwzIkDHmfEjjyVPcd1wQD5
	d0Il8ivmRmQmZkLq0jzvWEgLsB0K62Et7SCyutRAF02W6ECHnuTEL4RFt+HtI73bvwEETlKbzcQ
	1ejZ6droEYquUXD6LT3m9VGKYWm42CWnoj3s5VhuREdVxma7IeburcCcrUIojRmlM734bR9+CID
	eIUJylWJLkNlF3AogFwblHNIB9ZCekcQCZUnW8cBQv0AWD0uHDA/rYNzAmJq1ZnJChlueE55USt
	zkF6lzKRNyoG4q4Gt52K2SAbToVHUtI6MaX9SzROIX95jtuo5Ul4ksJfr7LNuwoksORtvJn71zE
	dpTpFtOyt0yMdb3hp2XjOK1hLv1KTrohl5mZsPO3MzCJa2i9m72uKZbqQRjIF6WpNmQhCH38kWZ
	pyYIFwyXnXefjR7iONKJJOHPQg==
X-Received: by 2002:a17:90b:55c5:b0:3b4:5b2c:2959 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr11827069a91.63.1795596691606;
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm26632567a91.11.2026.11.25.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Date: Wed, 25 Nov 2026 16:50:47 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <kahf2gbctnhtwngvtwkz7nxg2th2ecisdte66p2m7ukqup7jsj@7tmya5uxzg6o>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <awYHAU239WMaqVKk@aurel32.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awYHAU239WMaqVKk@aurel32.net>

On Tue, Nov 24, 2026 at 10:52:01PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
> >  4 files changed, 218 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> Thanks for this new version. I confirm the nvmem format is now much more 
> intelligible. The content for banks 0 and 7 matches what is reported by 
> the vendor driver under Bianbu. Therefore:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Hi Aurelien,

Thanks for testing and comparing the data with the vendor driver.
I'll include your Tested-by in v4.

Best regards,
Jiayu Du

