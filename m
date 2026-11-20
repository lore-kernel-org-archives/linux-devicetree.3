Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795209387;
	b=NxDt4JTv8eMmxBqt4KoDi7e6PUazDpDj47HilSQt1vCgYziHR+nJll2YPBbhLdwuVyNY
	 ffcuxqWcsInV9x4lhCdBGFPLWMDlPYp5cOKu0GpITZGwcNM57osg/zM9Q8ZIuRJut9BpU
	 c8XxyVeVJngygIkjZ2osLmjJThd3gkaKCp0OwXjxtvedLlveQAY67GPmU3gyc4KUwDeUX
	 gXr7xOy2l3Qprw8IGtABySNKs+WMEJ705CgYrW06IWtbBgQZwtsWGahkzlvSpOh6iYSTo
	 VN83fXhgZmqija4jCr8MVKtU7jYW3eOGuzy+Gln7HYWhMFXOytiiRt9SczOXmwQSVbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
	b=Lp9WKCL4ZWEMzLw0LHA6my0v1bys0q2cWXOcZ0B7NU1Km8aQcf42eSTFIRlSbNfvMMWr
	 9WAVLEg9D2Jp18X0XrFYdtOg9v3+TfXEohWcw8enP13hYRg/Ot+2orIycd0vLWtKxKJA1
	 uF/4a52dAt1W/MwEp9j3N3CEJfAehJ0aso08sHrAvxQAWiX2jO2jwpMp1+Lb02t7kyt59
	 H/0LV1xekscN4rb0LHTAalnoglYFOz2UmxHM1VBSbyF3aYwjsqsRDJrg7gCKxbod3Vrjp
	 RT8VWYi5o+XtMrf1I+z3uWLfSNgeuDdiJz8Gri+4Z8N3UPOaQLNxpKj/gHpkQZRawGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9;
	arc=fail smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6743606A68E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6743606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3acef9307c7so11150201fa.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209384; cv=none;
        d=google.com; s=arc-20260327;
        b=nJsVvjKqkvo8Ajl6GD2cYTg1h2jyFlZ2hrV6Boisrvg8A9Usu75k1yJuwbnnwwCI6D
         DO7yszONfqvntAeYbT58zbG9UtwJn0b7nWbDYGnf2q2PUxxJMPMaGhlQwoqMYMfDw0dr
         CBlCYZlFLflOAI6TDUICwlw/qnqS2ikeUrjRi9gRjNDnr87K8r2YvZ85E7mBWkXhF3NF
         O24DfnckJHDyB9Tcrwe7QckmiqZa5NHHs8CCEpYM087drGfegue0L6tQQsDk9oN+leAS
         sqfXbpP1muhXaFx7rjjyJh70NK+4YVKKLABiGKbV6FL1h8/eXDHFWNDMFoaGeQI5HsD2
         lxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        fh=i3vrJ7UX8wSqujL+WkWfbowJcirXCucevjhT+hQpsrM=;
        b=lDfRBaSK8r3TvNJXyqcKnmQyAEQ5zdLmGvkHzF85Q1U6XZrJAzz93ogKzOK+XXwDbS
         caUn9WvPnZRuTkX2Ub8ubfnX1XDiIiWAirJ9sShVrTJdfmFq+mHxNGGoJoxOjddRFHOQ
         /vz1zVvMcAdMIwC0uA1kYZFH1MNBDQhvF9XtbZUkMP5Qx/gMGOhdNaiw+saisq2PeTvl
         JCrkIKAy1L/kwlAwuZT6Wwq2Ym1lJZZu6det5z4CYrLLw83SqYnDIqoSstnR9KbBfSyT
         TVBVmUF2pn6D/zvJ8MXQig8OHHikKxWA5wQS1+XRuracLF15iFc4oe7P1matzehTM4wc
         BWqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209384; x=1795814184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=q0ezxby914XfUpGLrhzfA6E1/m4QOv5ChuIclloI+bpZwI7pSVyRELveWg3VGGlf8x
         0ah6sTes6aaFJBTBqrSDmqmK8zeRZLPStCECxFt4dPRObKQN4NTxhbUgf3PGooeUOUoB
         V5av6Vxqu1RodwnduQCs/LIC06FqUqHLGVoQtRi+YpYNQcegi2LayeGPBGDYKO6k1HUs
         6RZ1441EVAo+jHUIpmaivLDV9OyMZm0rjt2rU/q4wkvtqqvqzDkPC3MwrwPjX0KgP+16
         rLdHJKs5CsP5+/40QnppnK2xzVaxqA9fxCMguzrsuioWYq+InT3/FAxG9QpEr4OyP9Bo
         bKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209384; x=1795814184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=Yws1SY1M6rDZNR5v3n7e6oJRdpjbOEMg/FZy19LNUDrZAKGEh5ywb7QCawxGZlbhO7
         1SrI0CyuAvNLQO3NuaWSqMKFuLkiMaXP5mbUbSn3Jm59k7ZSX5hD4YfPCKQHVySgUmQt
         htwB0aN12sdID/Q+vR3iMQktHzpbOnOcucBpDhcckK/bQcYyywfXJMtl1cWI5XuM3yyG
         FKm1Mu2ve0oIgd5srBeyrVoV8adlsu8ViOtwil9vIDwYNBzPA2xYPrhmgPnOqLxePPme
         fWV9nsta68khnhEg4a9xW3OMGUb7PztLW7VXKUOss1ie/83Cfl3oafCwdwjbGsA2fuZ9
         6yAw==
X-Forwarded-Encrypted: i=1; AL+hErGRcJKx3074jk85TkJvF+dAPnAmEjyCq6vkbQJp03Pxiei3tmeZdSpp74zlEDAwdGoO4qZx5w3u/YmF@vger.kernel.org
X-Gm-Message-State: APuU4Z9+Z/+XIpbBt1WLD8IwM+Bx74ukf5scLRvY0YdqNo3xaxuPJ3Kg
	63uRebmPlnNUg7wZT0/kwxuHQeiam6qq5hoNlObXuaAoHr/6SpVjDt9n84w4TTPKU3janU51m0+
	GKi8+zY39TszRF7AAkQCZwH9dvODcL58=
X-Gm-Gg: AZFdTZf3KSl5CHXPrFCmqB89q7vGG45nvJyPNUmEAGcbFu/T0lf8/YPPDU2JVfqs9E5
	2j04rLTR1KH1hkfOJKTqEb8IMaWDPzksxShjiJczMDzjKVcXADKJFuR++pToDwq2/cxnDgbAATq
	0ZTSOx4rIfjQtiIMbgZlvMvBDgCHCa8zwLoiW7IkkE5UvErXOYHf7m8CbI2rau5GaBc8FRsvb1I
	/BRhNWt2VUq1j1TTZ8tt78B1+IX/Bw5eJedAZhCenAusMWYcrcAG8OlZF+vnFyfCLYvAfiq82Mf
	0ob6y/t7jwTLsLQRdIHULreOJPhq96bIsJGjo0NHDFAi3sy7celrl6peMbzT1WrrQeNZZpBbJsm
	PYt2WtX0QSxmZ7WTqONvm18uOXoZ1gN3+2lhodKLzKEKYEdS+AHJ2VhQmzo1ZrQY0LCp5NS5vOW
	B+4Hg3IsBE21/6dQXMswr5Gqxb
X-Received: by 2002:a05:651c:1595:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae7f9def47mr12754941fa.10.1795209383639; Fri, 20 Nov 2026
 13:16:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004121931.6746-1-festevam@gmail.com> <20261004121931.6746-2-festevam@gmail.com>
In-Reply-To: <20261004121931.6746-2-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 18:16:12 -0300
X-Gm-Features: Aa3M54oHDOEQ22OODjmPc2GutyOvkFljPYhxfBAHn2qECiQinM-o8DAEKa4qfsg
Message-ID: <CAOMZO5DFgk66C=+eNepzWwrNHa-t8KQ47wstPZRGW+tf548rOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
To: sean@mess.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Sun, Oct 4, 2026 at 9:19=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add keymap for the Ruwido Z3 RC-34 remote control.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v2:
> - None.

A gentle ping.

>
> Changes since v1:
> - Use RC_PROTO_NECX. (Sean)
> - Use media prefix in the Subject.
>
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
>
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps=
/Makefile
> index 38b84e34b225..525d203c0a94 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) +=3D \
>                         rc-msi-tvanywhere-plus.o \
>                         rc-mygica-utv3.o \
>                         rc-nebula.o \
> +                       rc-nec-ruwido-z3-rc34.o \
>                         rc-nec-terratec-cinergy-xs.o \
>                         rc-norwood.o \
>                         rc-npgtech.o \
> diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/m=
edia/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> new file mode 100644
> index 000000000000..8a090772446d
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Keytable for the Ruwido Z3 RC-34 remote
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +static struct rc_map_table nec_ruwido_z3_rc34[] =3D {
> +       /* Ruwido Z3 RC-34, NECX address 0xe310 */
> +       { 0xe3100f, KEY_POWER },
> +       { 0xe31016, KEY_MENU },
> +       { 0xe3100a, KEY_UP },
> +       { 0xe3100b, KEY_DOWN },
> +       { 0xe3100d, KEY_LEFT },
> +       { 0xe3100c, KEY_RIGHT },
> +       { 0xe31019, KEY_OK },
> +       { 0xe3106a, KEY_BACK },
> +       { 0xe31033, KEY_INFO },
> +       { 0xe31066, KEY_DISPLAYTOGGLE },
> +       { 0xe3101a, KEY_VOLUMEUP },
> +       { 0xe31010, KEY_VOLUMEDOWN },
> +       { 0xe31013, KEY_MUTE },
> +       { 0xe31032, KEY_CHANNELUP },
> +       { 0xe31031, KEY_CHANNELDOWN },
> +       { 0xe31069, KEY_HP },
> +       { 0xe31000, KEY_NUMERIC_1 },
> +       { 0xe31001, KEY_NUMERIC_2 },
> +       { 0xe31002, KEY_NUMERIC_3 },
> +       { 0xe31003, KEY_NUMERIC_4 },
> +       { 0xe31004, KEY_NUMERIC_5 },
> +       { 0xe31005, KEY_NUMERIC_6 },
> +       { 0xe31006, KEY_NUMERIC_7 },
> +       { 0xe31007, KEY_NUMERIC_8 },
> +       { 0xe31008, KEY_NUMERIC_9 },
> +       { 0xe31030, KEY_NUMERIC_0 },
> +       { 0xe31065, KEY_RED },
> +       { 0xe31063, KEY_GREEN },
> +       { 0xe31064, KEY_YELLOW },
> +       { 0xe3106b, KEY_OPTION },
> +       { 0xe31050, KEY_PLAY },
> +       { 0xe31057, KEY_REWIND },
> +       { 0xe31058, KEY_FASTFORWARD },
> +       { 0xe31060, KEY_PROG1 },
> +       { 0xe31061, KEY_PROG2 },
> +       { 0xe31062, KEY_PROG3 },
> +
> +       /* RC-34 remote volume keys */
> +       { 0x3506, KEY_VOLUMEUP },
> +       { 0x3507, KEY_VOLUMEDOWN },
> +
> +       /* McIntosh HR070 remote volume keys */
> +       { 0xca5542, KEY_VOLUMEUP },
> +       { 0xca5543, KEY_VOLUMEDOWN },
> +};
> +
> +static struct rc_map_list nec_ruwido_z3_rc34_map =3D {
> +       .map =3D {
> +               .scan     =3D nec_ruwido_z3_rc34,
> +               .size     =3D ARRAY_SIZE(nec_ruwido_z3_rc34),
> +               .rc_proto =3D RC_PROTO_NECX,
> +               .name     =3D RC_MAP_NEC_RUWIDO_Z3_RC34,
> +       }
> +};
> +
> +static int __init init_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       return rc_map_register(&nec_ruwido_z3_rc34_map);
> +}
> +
> +static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       rc_map_unregister(&nec_ruwido_z3_rc34_map);
> +}
> +
> +module_init(init_rc_map_nec_ruwido_z3_rc34)
> +module_exit(exit_rc_map_nec_ruwido_z3_rc34)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
> +MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index f167c37179c8..290919a7247e 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
>  #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
>  #define RC_MAP_NEBULA                    "rc-nebula"
> +#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
>  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
>  #define RC_MAP_NORWOOD                   "rc-norwood"
>  #define RC_MAP_NPGTECH                   "rc-npgtech"
> --
> 2.43.0
>
