Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF294399E2
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510623; cv=none; b=tJ9/BVLzHUOpjIbqek68GvkW/HLeMyG0yu18tiev/6r9FJ8+WwZn4u2poN9INA7fTZrzupujXMdMPMleJsfMOkQl4Zr9TLQgu+67o9kHqywygDxg9denzDgedZD8irrOOKr/AsGaCZ2goLuMQS4BfjiNwqteUYI95n3YgS0aM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510623; c=relaxed/simple;
	bh=wpGoPCVk9564j2IMS5Qg6qRQkr2A6nGPBDptxpBxpzU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OK+FxLKq4Edot2y/8isrCfq0PC8lwyXuykezmSivcfDkFy9LyMMa0lVGjl6F7YE9lLdMiTC0Hv5UIY0DJF+aE9RpqWUFigdXXAHtl3nCJsO54LNKeP2UX5DbUX312JHMDiE93EtPFWBYhIiqUil2wxoayIHrNT3nEHqf+r1W6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/sBSEPM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/sBSEPM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C93D1F000E9;
	Fri, 31 Jul 2026 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785510616;
	bh=+w4I+WoqJUTNm24RCJPYkDl+sF9iwDu1k03g0UZhf9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G/sBSEPMDPt+8/rM2rIWQYjjMggrqJXIew1f9VKTdHUVkPMHdZG24UEnxaYj+zw7R
	 RM9Nu+Siv1tLIgWBpCPBBctfz8UFl3vxdFJ81CnJLovMgmUjYNoRa5gGIj6gCKnKuV
	 GyAFjYt7C7mujPzN3gLqpJhfsu4ktJ7PbKij241a/WBJn9+lTP3rIOiQsrDjef/buQ
	 IEJUZPibm3mv6Ao4mJn7VBIfDXFSPVWAzN72ngg14hgxiZs663eHMitbknLN9zmKE5
	 OnEvnDmMMTZzloos8ZM9+m3USbHSYyZA9i2uZ1z9TTRvnODxiIw4KUB/X+HdIZ6KW+
	 GtdSGR7FMa/xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] fbdev: ssd1307fb: add support for Sino Wealth
 SH1107 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Turek" <jakub.turek@elsta.tech>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260731-feat-sh1107-v2-1-0d2893e44ebd@elsta.tech>
References: <20260731-feat-sh1107-v2-0-0d2893e44ebd@elsta.tech>
 <20260731-feat-sh1107-v2-1-0d2893e44ebd@elsta.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:10:16 +0000
Message-Id: <20260731151016.9C93D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Uninitialized variable `ret` returned when `pages =3D=3D 0` and =
`page_address_mode` is enabled.

Pre-existing issues:
- [High] Passing a virtual address to `__free_pages()` instead of a `struct=
 page *`.
- [High] Use-After-Free of physical framebuffer memory due to unrevoked mma=
p mappings on device removal.
--

--- Patch [1]: [PATCH v2 1/2] fbdev: ssd1307fb: add support for Sino Wealth=
 SH1107 controller ---
commit e1d9663a6aba54b57c6911f220e7fb969872972f
Author: Jakub Turek <jakub.turek@elsta.tech>

fbdev: ssd1307fb: add support for Sino Wealth SH1107 controller

The SH1107 display controller is very similar to SSD1307 but the main
difference is that SH1107 has different memory layout and uses page mode
adressation only.

> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd130=
7fb.c
> index 644b8d97b3811..19dc7671fa7ac 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c

[ ... ]

> @@ -274,13 +308,28 @@ static int ssd1307fb_update_rect(struct ssd1307fb_p=
ar *par, unsigned int x,
>  				u8 byte =3D vmem[(8 * i + k) * line_length +
>  					       j / 8];
>  				u8 bit =3D (byte >> (j % 8)) & 1;
> +
>  				data |=3D bit << k;
>  			}
>  			array->data[array_idx++] =3D data;
>  		}
> +
> +		if (par->page_address_mode) {
> +			ret =3D ssd1307fb_set_page_pos(par, par->page_offset + i,
> +						     par->col_offset + x);
> +			if (ret < 0)
> +				goto out_free;
> +
> +			ret =3D ssd1307fb_write_array(par->client, array, width);
> +			if (ret < 0)
> +				goto out_free;
> +
> +			array_idx =3D 0;
> +		}
>  	}
> =20
> -	ret =3D ssd1307fb_write_array(par->client, array, width * pages);
> +	if (!par->page_address_mode)
> +		ret =3D ssd1307fb_write_array(par->client, array, width * pages);
> =20
>  out_free:
>  	kfree(array);
>  	return ret;

[Severity: Medium]
Can this return an uninitialized variable from ssd1307fb_update_rect() in
drivers/video/fbdev/ssd1307fb.c?

When the rectangle has a height of 0 and y % 8 is 0, the calculated pages
evaluates to 0. If par->page_address_mode is true, both of the
if (!par->page_address_mode) blocks and the for loop are skipped entirely.

This leaves ret completely uninitialized. Is it possible for
ssd1307fb_defio_fillrect to call the __damage_area callback even if
sys_fillrect aborted on a 0-height rectangle, returning uninitialized memor=
y?

[ ... ]

> @@ -658,6 +722,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
> =20
>  	par->contrast =3D 127;
>  	par->vcomh =3D par->device_info->default_vcomh;
> +	par->page_address_mode =3D par->device_info->page_mode_only;
> =20
>  	/* Setup display timing */
>  	if (device_property_read_u32(dev, "solomon,dclk-div", &par->dclk_div))

[Severity: High]
This isn't a bug introduced by this patch, but does the probe error path in
drivers/video/fbdev/ssd1307fb.c pass a virtual address to a function expect=
ing
a struct page pointer?

In ssd1307fb_probe():

        vmem =3D (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
                                        get_order(vmem_size));
...
fb_defio_error:
        __free_pages(vmem, get_order(vmem_size));

Since __get_free_pages() returns a virtual address, passing it to
__free_pages() (which expects a struct page pointer) will misinterpret the
virtual address as a page descriptor. Could this cause memory corruption or=
 a
kernel panic when manipulating buddy allocator lists?

A similar pattern appears in ssd1307fb_remove():

        __free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_l=
en));

[Severity: High]
This is a pre-existing issue, but does removing the device cause a physical
memory use-after-free if userspace has an active mmap?

During device unbinding in ssd1307fb_remove() in
drivers/video/fbdev/ssd1307fb.c, the driver frees the physical framebuffer
memory:

        __free_pages(__va(info->fix.smem_start), get_order(info->fix.smem_l=
en));

If an unprivileged userspace process mapped the device memory via mmap, the
page table entries are never shot down using unmap_mapping_range(). Does
this allow userspace to retain read/write access to physical pages that have
been returned to the kernel allocator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-feat-sh110=
7-v2-0-0d2893e44ebd@elsta.tech?part=3D1
