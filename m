Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265824;
	b=rEnD+/MnO98d3L7Hh7VE7Koep1rQ1fyDTIjVXK/sCKbu3toN/cs+l0SaMDbrOSplwr9w
	 WLtAsOiFv0bwPRBrumMs07MMB704idR5AH0DQID2cLtitfe/DJpWmJQgXS2p4JqrCAKa6
	 +4hBLnfAmrIRcXmKJW/P5RyuZFyYUxXdbN+wTkTHIZ7+D0sy1HbebLOhAfbsolmBskY9i
	 7guxB2eCMxqpJ/5y23zHC4kuSVQIP/f5b35gjBaTDF2VeZTtJRmBkmR5RsmXXUMyVBFIG
	 zKFKcyH2MKYFi+gFdWgMc1AR//QjAMzsCNagP0OihMFiGAEv3SrS47aNG5f9vvDUx+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265824;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qu5F5JdpLJxevi482ikd044+aImDcpPRmLobbJHS9AA=;
	b=OOA/zD7SYQ971bFr9NrG55CJQRh/LuPpcoQXA0Y9Mwa+7m7uT6f2r4At7AQlN0crgznY
	 I9amZTJx/7NH0PphZSCrKFKcSl3hyKZMEAa2g3nrHihoQaNTvnNeg2C4SN8BW7tROc3g2
	 G6p1u7hWC+vEoXSTr6nraPong6BTXLtowWPhJZ2LI6Z6LDqzsFNVOGVZuYXAOie0oLmE1
	 fjnAMnNv3K6e8q400K3xnTqrBfrOU3U0FKwm2a2OkhGDaHetZzbRN2li6DsKeFI5NyKzg
	 hhi+p9LXv0q5VXxU7Zfb7HQsdf/85JyN4H3kapQkKPrvMy02aelbOOiU6Hn150znRlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw0Jt9yJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF91606A31D
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uw0Jt9yJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA5A1F01825;
	Thu, 29 Oct 2026 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793265824;
	bh=qu5F5JdpLJxevi482ikd044+aImDcpPRmLobbJHS9AA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uw0Jt9yJSe3kZU0rD3iEXfvQ1Qu1b1CqijJeMd5+2md29G8vnz5Mv+y3YP3BJOisl
	 JWApbHtNIoXDucoY2QtHhJ7nQKi5a3ahVdqzGyFNWnO0ovenRcfpMwG7tQOBGBffyd
	 /dGv7kLGUASdmYpJVnBN/6Z7+UyygyQf6TX+4bQ42WuQQKxktjUXKqAFznoZeqpDHE
	 RwLZIAn4ePC2OZKq47qh1WA8tg7HEUm1ucAeSrsANFR24LIDrKKqSXIBvWds9DcyHZ
	 ahHML1Dr5NCYu4yrkFEnodaLQt7weA6c3VEFM2x8qQIESgcO256x/JiSi0sWZpFBqX
	 YXpmtrZ5RZ/ig==
Message-ID: <sashiko-outbox-189031@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 02/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-2-fa4b3ff1359b@oss.qualcomm.com>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-2-fa4b3ff1359b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 09:23:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] reboot-mode: duplicate mode entries in reboot_mode_add_predefine=
d_modes()
--

commit 06a52b916a06b4ea372bbbe59e432cb1a7e4b431
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: reboot-mode: Add support for predefined reboot modes

This commit extends the reboot-mode framework to support driver-defined
predefined reboot modes and introduces reboot_mode_driver_init() to
initialize driver state.

> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 328fa37598df3..fd61de2263836 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c

[ ... ]

> @@ -160,11 +234,38 @@ static int reboot_mode_create_device(struct reboot_=
mode_driver *reboot)
>  	return 0;
> =20
>  error:
> -	reboot_mode_release_list(priv);
> +	reboot_mode_release_list(&priv->head);
>  	kfree(priv);
>  	return ret;
>  }
> =20
> +static int reboot_mode_add_predefined_modes(struct reboot_mode_driver *r=
eboot)
> +{
> +	const struct reboot_mode_entry *modes =3D reboot->predefined_modes;
> +	struct mode_info *info;
> +	size_t i;
> +
> +	if (!modes)
> +		return 0;
> +
> +	for (i =3D 0; i < reboot->predefined_mode_count; i++) {
> +		if (modes[i].name && strpbrk(modes[i].name, "\n ,/"))
> +			return -EINVAL;
> +
> +		if (!modes[i].count || modes[i].count > ARRAY_SIZE(modes[i].magic))
> +			return -EINVAL;
> +
> +		info =3D reboot_mode_create_info(reboot->dev, modes[i].name,
> +					       modes[i].magic, modes[i].count);
> +		if (IS_ERR(info))
> +			return PTR_ERR(info);
> +
> +		list_add_tail(&info->list, &reboot->head);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
In include/linux/reboot-mode.h, the comment on struct reboot_mode_driver
states that if a predefined mode name duplicates a DT-defined mode name, the
DT-defined mode takes precedence:

    struct reboot_mode_driver {
        ...
        /*
         * Optional predefined reboot-mode table.
         *
         * Must be initialized before reboot_mode_register() and remain val=
id
         * until reboot_mode_unregister().
         *
         * If a predefined mode name duplicates a DT-defined mode name,
         * the DT-defined mode takes precedence.
         */
        const struct reboot_mode_entry *predefined_modes;

However, reboot_mode_add_predefined_modes() unconditionally allocates and
appends every entry in reboot->predefined_modes to &reboot->head without
checking whether a mode with the same name was already added from Device Tr=
ee
(or earlier in predefined_modes).

While get_reboot_mode_info() returns the first matching entry in
&reboot->head, reboot_mode_create_device() copies every entry from
&reboot->head into &priv->head, and reboot_modes_show() emits all of them:

    reboot_mode_register()
      reboot_mode_add_predefined_modes()
        list_add_tail(&info->list, &reboot->head);
      reboot_mode_create_device()
        list_for_each_entry(info, &reboot->head, list) {
            ...
            list_add_tail(&sysfs_info->list, &priv->head);
        }

    reboot_modes_show()
      list_for_each_entry(sysfs_info, &priv->head, list)
          size +=3D sysfs_emit_at(buf, size, "%s ", sysfs_info->mode);

When a predefined mode name is overridden in Device Tree, won't this alloca=
te
a redundant struct mode_info and cause /sys/class/reboot-mode/<driver>/rebo=
ot_modes
to output duplicate mode names to userspace? Should
reboot_mode_add_predefined_modes() skip entries whose name already exists in
&reboot->head?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-arm-psci-s=
ystem_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com?part=3D2
