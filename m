Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795381892;
	b=kyjZxT3/16WWB7OETdT2xAJ4wKGx+7S1zVz3wjxwq1sSRmtiFuZ72UqLqetn6x2We72w
	 XFGT2mv/IOXA80cXkGVs0SB0/fDgEoFRgv9tP3OhqgUgeQUu+71aZrn6UsUqWLR83PpmX
	 GdVdqKNCiq3wCX2vU7rGtkJHQLVkMF3Kf5I43+V4+ysm8ReoENJ4yTQQjoFm62vjyD9B/
	 rTaMBqM+19tkZWpYHsx85JFCZvD4lNkFpNkvDafIml3WyEes0XJb2/1w3kJigkRbBFzgy
	 5eLklOcNKK//KUhRfQxxiovse8QDPcYZLH4FF4WWH618tma9ZHupbnUoeIuHJKRNwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795381892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
	b=rKDISqNbQBpbPVjsLxFqYrFIssGVlbWF7xinynysIRWdj10DJszbCn6MHsjvFMYkZKIH
	 E5/sFETbsX727RJ6OLHpOQUCtsqHWDw3YEnDJ/4efn8jQMD3jZCsnyoDXcPrb0i4peZbs
	 SMp+dIrgkjIGfGT5Lj3bKqEtNXU99/tFgTAV/FRIziJiJiA2fknmzRZNgHDKsnJUn66zQ
	 iUIjvNgDX+P2HXSAuhwGcvKEQkuI24Z0XPtBR7LhEcD40jL1oQB/FQIZihJZIyXb2+Fv1
	 Vw6Nrg6ZfqC7A1V8T0JRvdbkG/8fiJMvG8IuTDHP1DCMOSdxYq+aFOPymj1A4StOx9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jFz4jAsb;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BF606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 618BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jFz4jAsb
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19483895e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 13:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795381891; x=1795986691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
        b=jFz4jAsb0UInSseLDcDVLtsdUjFuIb2lcwvCt85BZQgR1AT6Fx7rZhyuuaVcztw7DI
         SHZ0U/ohb/0XMsoxbT3U+cWFyWwo5LwSY79yKpzQ9cGwZZ1rPtClIS8lccyn0YbSHO8Q
         /MbnqSeiwU3pJZcK2XqSv8Prdfql/n3LX6gHlHRTEsaqIK/O8NKYvVQTS65FbrWrUakf
         ohgh4YXvxQue+l+JfIzOS12pYHL4A5CVRM4zQZQhe1nsW3yo5Wd9BAdBZ/ebu6iITp1O
         cQ5rRqpwGZsqMLYRn8EO25QkPYSN8e64BTQt8kV9VFMArAkZslZyHa2vOjnruEv7VdVw
         yIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381891; x=1795986691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ge4eiVUKj3nX4tuUYC5k9dPzCXTKzLAWVgrNn1CnYhg=;
        b=w5nKHxbUUKkQkU8L1dQPGE/ACFIDBG0q03eEC+aHO+ihYLnTYUYHw0/E8aSIj4i4Za
         X5KcJ5Qu9y8YvzBP1qBlHKLJxUrvLiwVml7JUqxARWSp6FfT9Oe+GSlgm1Zu7WYX3yjz
         XH2z5A6t5O2FC2KdAMgLO9PbSpvkwblaKM7kHUfgvsejo4/Hfm1OgxerXowRAZlQ8X4a
         Nqz3/JVtpUGBeAmfK0ziBB9zApA6cIv0W35DgV4cJXgJKTKO2HC51b4gZyQT9sdAns+T
         e2tvi/ELiUU/UKT+zoWcBd3RIDXdWKmlaS52wfR05ogcw7qNJ8/aDML046F6Rtump5WZ
         HY9g==
X-Forwarded-Encrypted: i=1; AL+hErFQ9EdcRxJ+8Ie/h0KMiQdF6a72n1F2jcGslusIOfRmbfbNHz9a/HcaFAuduATwRKuECQhwewoTAFhB@vger.kernel.org
X-Gm-Message-State: APuU4Z/D1c3UJX7z6QTqLEpB6j7LilCpH7pc2tKdW0f8GlEp37bUzWim
	rhYLHwGfdz2DbF4fINk1BESRGW7Z7m1RdQCkPZMp1mAKvfbXxlA3wvQJv5lSOupzJpU=
X-Gm-Gg: AZFdTZe3QZQ1iYQ8ktgh0FE7A5jF5wpKLaWdjXBXQCnhsQB3qy8dt7hTmh4hfY4eCtV
	vBqAAB8LKShPGmjKOKWYCATGLn1vlBUdZCqiuKvSTtdJn72XWqrLf7IIvbq3N7oNKrWXEbHhm7h
	h1g8c6Ki0cVz87rVVlJoInTrOEjJ4zhmAkV/fkH8M7qTzAX5OccSYztTlcraMJD4LytnD2Bpbui
	Y5kMD8srjZJYfBqz14BM8/2AEDTlKhfmncREy/oJ0LaR035VIMKbK1j5XbKsBT1PUHUpwQqJfX1
	rU48AXNxeWOQRqmqsAN3kQszq6uUIpBHrdOjVSHw25EW2HKfu2H3kbZm4wHDYcdvkMqB7McKel3
	bisjShEWWyJ8arRlhB7QVY9WLHhGCnUAbef+z9dgY8iF7WEGhPBillU+Q86ar8NUUQxNkFNuxYG
	68TpLdtDWsyvqjN85Q7HXM+6+rEC4j78fZgbIMwRpOkKXJN/n70Os4FLJ6gjRRIB9QlsSEUs8dE
	1Gy+HacdJd1qSa3NnlLkD5Fj//MqoMDRq4Ac59ar55PelB4/ZKZiIs2dIoynEwjugNZWRYyV8Ni
	Q2kAY7Ln9GIbwZ7yteWjeucwanX7SGjGn2U/Ap3NdQU6j79DgnjtzY/kzNaZcQGy/2boSyEXzx5
	stfCwjVoJx6A=
X-Received: by 2002:a05:600c:3b88:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb888078a8mr229132545e9.11.1795381890664;
        Sun, 22 Nov 2026 13:11:30 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm123545075e9.0.2026.11.22.13.11.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 13:11:30 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Sun, 22 Nov 2026 22:11:28 +0100
Message-ID: <20261122211128.14591-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122205211.6c46f3cc@jic23-hlaptop>
References: <20261122190836.66111-1-gerard@teslabs.com> <20261122190836.66111-3-gerard@teslabs.com> <20261122205211.6c46f3cc@jic23-hlaptop>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 22 Nov 2026 20:52:11 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> >  #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
> > +#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
>
> Obviously the line above isn't great on this, but is there a spec reference
> we can make for this timing?

Both datasheets list it in the "Operating Timing Diagram" table as tOp,
"Time to operate device after VDD valid", 5 ms minimum. I'll add a comment
referencing it in v3, and annotate the set/reset wait with tSR (1 ms
minimum, same table) while at it.

Thanks,
Gerard
