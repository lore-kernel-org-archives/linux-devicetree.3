Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7793B47D0
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932427; cv=none; b=i2udJAgx5BWqJOhdEGwH7Jbrrvmf+AeJBmoAw9c/E1FkPk31aNIjS+AsmmVdd4WKc1yUulwRDqckC1OqTQSmcVzPaEa7B3qxmi26kYCcfGrC3GDuA6W5jOtPEQcSND9Urns3/f79KKxJ8CZM8+ArNDj0cW+7vg1zld+RddSpYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932427; c=relaxed/simple;
	bh=inYPmBa10LoLhP0KG8WCn1s1UNCmpvU9Fgklrs3mX08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oYrnU8ZMWU6rnSrLplYIyME54FSmYAn9w02XUqX3zsbU/O+uuS69jiKxYWZwZWnJVPsgAjgErFa0hCa/wXtwWPo3m7u9i5D7mI0UEi5dP3oP0+m1UQsFEnWArh0c6GleV7q/uRJBNrbj4U0MlgW4QHQxyHCawEklza1pTcgQEyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDZeQhXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDZeQhXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57341F0089A;
	Fri,  2 Oct 2026 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932426;
	bh=xGQXbG5AglX0fwlRBMrJEpjGP60KTWRcw8Lzh4jZ448=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDZeQhXHxZ5Liy8i825TQesNSjgGwizzYl9V03qtCjv/dR1jMMUfli7J5ai+4wgrq
	 f0iTn4MgFNwf3qGYowV92SQqxfTZ8JBVECR3kE83fKRQsy7qlm/QMiyIDULKP/0hxo
	 IoA8W+hcpW4JM452OJJMNaXRKDvbt752NW8d6Wa5TLfmnbKYs3D8Lryrm0WPzDePoe
	 ljNoxRHVjO7/vwe5yTwrK3JybpS4zzfp8eTI82wTv4e98RsgrRHHrjCvMaIy776U84
	 cOCEd8bJyXbjOsw6AwZvh7X7djXjy4MzIz4WrDorhYIsqTN+TmDWtznYMsPTqAZazW
	 U1/86zKC1N1ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] spmi: apple: Implement remaining commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001-t603x-spmi-v10-4-ff815c66c73f@chaosmail.tech>
References: <20261001-t603x-spmi-v10-0-ff815c66c73f@chaosmail.tech>
 <20261001-t603x-spmi-v10-4-ff815c66c73f@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:45 +0000
Message-Id: <20261002091345.D57341F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] spmi: apple: endianness regression via memcpy of IO registers
--

commit 5d4bbe94448e65d1ac0f0f10ab2dd3e91020bef4
Author: Alba Mendez <me@alba.sh>

spmi: apple: Implement remaining commands

This commit adds support for zero write and power management commands to
the Apple SPMI controller driver.

> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-app=
le-controller.c
> index b1c127cf5f441..9843dc871d6c7 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[ ... ]

> @@ -86,6 +85,14 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,=
 u8 opc, u8 sid,
> =20
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
> =20
> +	while (i < len_wr) {
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_wr - i);
> +		spmi_cmd =3D 0;
> +		memcpy(&spmi_cmd, buf_wr + i, j);
> +		writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);

[Severity: Medium]
Does this cause an endianness regression on Big Endian architectures?

Using memcpy() to copy a u8 array into a u32 variable before passing it
to writel() can reverse the byte order. On Big Endian hosts, the first
byte of the array is placed in the most significant byte of the u32 in
memory, which writel() will then implicitly swap to Little Endian for
the bus, effectively reversing the byte stream.

While Apple SoCs currently operate in Little Endian, does this break
driver endianness-cleanliness and architectural portability?

> +		i +=3D j;
> +	}
> +
>  	ret =3D apple_spmi_wait_rx_not_empty(ctrl);

[ ... ]

> @@ -101,11 +109,9 @@ static int spmi_read_cmd(struct spmi_controller *ctr=
l, u8 opc, u8 sid,
>  			return -EIO;
>  		}
>  		rsp =3D readl(spmi->regs + SPMI_RSP_REG);
> -		i =3D 0;
> -		while ((len_read < len) && (i < 4)) {
> -			buf[len_read++] =3D ((0xff << (8 * i)) & rsp) >> (8 * i);
> -			i +=3D 1;
> -		}
> +		j =3D min_t(size_t, sizeof(spmi_cmd), len_rd - i);
> +		memcpy(buf_rd + i, &rsp, j);

[Severity: Medium]
Similarly, does destructuring the readl() return value via memcpy() misplace
the bytes on Big Endian hosts?

The original code used bitwise operations to safely pack and unpack the
u32 words byte-by-byte, which inherently abstracts away host endianness.

> +		i +=3D j;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-t603x-spmi=
-v10-0-ff815c66c73f@chaosmail.tech?part=3D4
