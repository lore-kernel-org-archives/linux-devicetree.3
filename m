Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793C33D567A;
	Fri, 26 Jun 2026 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461094; cv=none; b=fNpIInzr7/Cty05EGueEwyv8rM9LE4e+NDenwszOY4ZqOrJnL6Ola8xn9njPxesaXCAVKl6VA4jsPt6cY8M4/ZfGt6pKxHL6jmsNLngYRSsY8SyN6IzMLrEc1FkmSBokZfEEzqvYmVn8trbuh4lHAzwxugjn7ULqO5rV7tI+a9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461094; c=relaxed/simple;
	bh=p/3D7LQX3gQxlC8CNcpAmxB2xXnqkeOntLjWk5CBAn4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nMuf6mW+VR2D1NnOM+fJpOhns+TgxnCRvqRQwynYPBp9jCKMyGbU/SZVoPwKARpKLi7id/4lE3Cj94GS8n/A9RVsXkO0ZEbewxReu3sCPgrxvMEWYc37SfuCxG19tmUnfg5iRWdLh7rlyOewotxnn1XafiddihQq8k4s9yLLJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.182])
	by APP-03 (Coremail) with SMTP id rQCowAA3WuGbMj5qHavoFQ--.17430S2;
	Fri, 26 Jun 2026 16:04:43 +0800 (CST)
Message-ID: <2cbe37cbaf246f56d54288d8180d383fcbdd5eb4.camel@iscas.ac.cn>
Subject: Re: [PATCH v5 6/7] drm/verisilicon: add DCUltraLite chip identity
 to HWDB
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 26 Jun 2026 16:04:43 +0800
In-Reply-To: <20260625094449.708386-7-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
	 <20260625094449.708386-7-a0987203069@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAA3WuGbMj5qHavoFQ--.17430S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1ruFyDJryUGrWxuF1kGrg_yoW8Gr1kpF
	47KryDW3s5J3ZIyr97Ar4j9Fy5C3Z3J393W3Zay34I9Fs0kryUGry7GF98CFZYgF4xJFyI
	gF4vkFW7Crsayr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jbVyxUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-06-25=E5=9B=9B=E7=9A=84 17:44 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
> The Nuvoton MA35D1 chip contains a DCUltraLite display controller
> with
> model number 0x0 (sic, the model name contains no number either),
> revision 0x5560 and customer ID 0x305.=C2=A0 It has a similar register ma=
p
> with DC8000, only one display output and only 32x32 cursor supported.
>=20
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> =C2=A0drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> index 91524d16f778..7d630a667a3f 100644
> --- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
> +++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
> @@ -129,6 +129,16 @@ static struct vs_chip_identity
> vs_chip_identities[] =3D {
> =C2=A0		.max_cursor_size =3D 64,
> =C2=A0		.formats =3D &vs_formats_no_yuv444,
> =C2=A0	},
> +	{
> +		.model =3D 0x0,		/* DCUltraLite */
> +		.revision =3D 0x5560,
> +		.customer_id =3D 0x305,
> +
> +		.generation =3D VSDC_GEN_DC8000,
> +		.display_count =3D 1,
> +		.max_cursor_size =3D 32,
> +		.formats =3D &vs_formats_no_yuv444,
> +	},

Checked against the MA35D1 manual, and it looks okay.

```
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
```

Thanks,
Icenowy

> =C2=A0};
> =C2=A0
> =C2=A0int vs_fill_chip_identity(struct regmap *regs,

