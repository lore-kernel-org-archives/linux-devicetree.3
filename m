Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792564321;
	b=uNoas3pOIlzr0HKbwF5cX9MQTxZw4iXR4jAK/nKuSuk4QfxyS6IhcOp2UnzJal2Uj+Cg
	 n4MGOzb9vb0BVMjYQt/mLBo9jOC42agBC7NcRr+lrD8u1aFKGDLo+O3wXbWe/qRllSdnt
	 UhSeXwzukYBBj0257wUWDFizpeTekSlRjnf+xeSzLdfVh5XqNYo6b2ILNZtKa5brTH5q2
	 AdHJQmWVa64SGM2htVHhrBEJ8mVuIiUKLgDOX5LJsh02FzX0rWJACLLt6RLpQB4WK7F+Y
	 8VZ8iGwTbuPEMsGKy6EhwyKY2zPa/e6kGpMfYvYMmWsYcN5M5O4a9ebEbnV27VVG6vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
	b=tWUhb5iY3x0D55mv1iRh/URYmdoX+7aiPMF9w2CWy9LAoHAJmIgIL9AzzTiZABrh8L+M
	 +VC5nyXttXXeuilJfnHbnyIChVdBIVziwVQyYiF4KaE5Kq+VozsC6L0UPhDCx5cNC50xA
	 piBBW4uCbWma7zHQC/t/0blw3mFxD0oDajspWcNAupNlO78nq6DePFhwqyrIny03BWsnH
	 sF6aTjSIqTGBQySgDD7qRng1Vc36g8nFOQji1/IFv285JX3sw3pbXuylRiG0pi5hyy3GK
	 Y7/ZUrAisquexClkoc7GmfMbjQDxVBEOuEzHPQ2TcobgKyeXZn0zgJG5xlY7BmhPcRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NDb27SfH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EC606A321
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NDb27SfH
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so475934eec.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 23:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564320; cv=none;
        d=google.com; s=arc-20260327;
        b=DGk4HhcY8Ta8yod8sWoUVeNa5J5XP4ffV9rFf4sGHxEb//8UexOPPIt96ix3wplz6+
         n6AdXmAdlwABXf+xQ+xdf2c9aj/C5W3LOndXX9sfc0a+CIUZ9c+mcBwuU1hvLYDBAtMz
         GF4wV0OEE1H8Cn/LXvMJ8hU5sViJYHHGhbAPfHkPKizoqH5Xmzr7h5atYv+yJGhVZZjX
         82nepFgCvMPPsmv2OlQKuf4MyRyurMe12+l5T9A/dZu///Z9bgqaZjjebPU7adcb1HRj
         eMPQl7rNsXgNkv45aWW+mMtbzM1c7825qPnFWN/TM1kELE9zAGWy8G0ajXwZYTABWqIw
         y22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        fh=w5+UR+lUBCFn8S6P6BUz9nTz24jZ5iJUz1HhIZ4Qz0U=;
        b=NugQulBy6FtZv79yiGiZ2VWuKLb3eWjno3dfr86H9r/sOhBhXMuMEnNe9pr2hFKYg4
         Fg+9RT3+LrRkptuq4cg7NUD3n22tHVKg20KFzDCOEIGtu+eK8dDjqQEPGS+TqDJfyDLu
         KaylMBz+AgkkOGESdQ0GH1onRRgErjSi2cbYbYYhJHQumTEJXmJDmmpz1Ui6/B/U/YjC
         4ZkdEo7jifCmVnohtjnyTHWrbZfO5QjxuErSaEyLwdHmxRlyunvsO328eKKse6ijSQGW
         qoRc7ClcGDkAlNp4rAaWQwW0azvoiW4JuqcU+bacDCm1sFg8t/35qFdqDQwju8+cea5f
         hJPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564320; x=1793169120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=NDb27SfH0BlRaZpuZ8mtyCao8o1bV0M0rFx69HpK3CeifH54l/f+vPHYCab4u0FKvz
         /TP7DdpyvoUAcGkCRde2el/wk/opkc7A1Rpl6aTc891wW1se96gBRqO+uentHKdIEcQ+
         iPOLVVXX3DRijj9QwnPZ7+SOmCnLyV56jaJDEUpn3zTOR1Pvr/6jJ8AzImmA7Db65JWT
         OSISPTr36QZxIczLfSM6Ui5Qx7+VK108R+mATAbj7Snmz1WB0Ln3cs0SHt0H18E4fxnV
         hox71g2lyrY/h6bAbNi/lxzon25ChAJDj+b7OFeO1LtNuKqq8CIqO9+/RAf+qLOCKlqp
         9JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564320; x=1793169120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBVO2WGNEDxlxaqbKxDIfwB41AhhM0dka0vUsjW37nQ=;
        b=WpOJnJ888BTrpaWPDPdx1Tts7kaXeKdwTqV4aedsVD169+qV3ujmAe/7ZUYpM5xq1D
         ZpJpU+Fd0X4Ho+lWpQxewRL7TBAdBU+6fp/W5wfXCy00TpwW3+kDNZSMl6d8Y9dlGvyi
         13/Maz8ijVwUr2mwpuzP6HyUIc1zxWLedg55cic6q1RB+DGJ4g5IyAWBLrRQZ4KS7L6l
         k/brdVfR8IUmiDYvB8yGEWTnNzCCsrV+9QcXM/xeExyUZTs4m5Ar1M201ugy8qwkgVrz
         TkLl0iHjJ2zJjb52qampYDlD73/heNTtEwnkBAzD7RLpOXwEowHteMPTAgMaIFM7l8h3
         HWUw==
X-Forwarded-Encrypted: i=1; AKwUvByTYxdpC3VZCqhVYDRKsqnCOIezrGBnFD9MVRD8GYtGBOmyAuyZu7qTA7jvtykCadQ55pc4Eo6fiqDn@vger.kernel.org
X-Gm-Message-State: AFq9FYLsHKjlX11Qp9pLTkL9Rql9q+qTIobzaXZIaPbzLulRwfel4zNT
	yw45WILM7yVFyfVdoJheG7Ultxpbh62PwQBu3zim5Duc3iiVbkpZbv7+kxwxDg6QwH1huF6L2IJ
	F2QeWuFNM2FkRv0xPfIHtctc+zz9vg85sRQ==
X-Gm-Gg: AYBFou1NTEDQwb5Ghn7i/krRJrdJXE6L+O+2jBwir27POemf+InyVqKrrrohyLcA4sX
	KJ5T59t5K2TU29PtHQyuHfJhpFrni1/cKBi+KZWVAi8DqU07TA94sG+qQhFoAbUTZDBSox6lAPO
	lBpUV9bVmLWsBGt/RZ4uc2GoEEXKDcuH0cTearhhFnuHJihiCps8qCJpbmiBtKsaUSaldxRWTwq
	1EuwOh18eyhqMHEPCAjEiPKcKxtD731D3KqaKmpMwyBVDTvr7T8J5I+FbWS5iMygmvf08SJLSdd
	ZaFoeE4EUp0qqlUYrztPMikOEgZlQsygHYke2vgrih9zGKD1mkJr9x5BHgpWvrA8enoC8jTcElA
	OsmSC/TOilJGjGdAyXZM6MkPS9F4yzrruXyiH+8ovoXh/tTEGCY662acO72EOwfoimBUaXw==
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id
 5a478bee46e88-3674c43c286mr3040666eec.10.1792564320159; Tue, 20 Oct 2026
 23:32:00 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com>
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:31:46 +0300
X-Gm-Features: AclHuK_QwW61N_9Foimi4NgaLY1jJdwADyBjJeIb9hmtc4k1Kv7HNMpLzSeTeY4
Message-ID: <CAPVz0n1z1s9aCLk1OzhuOq6V0p2SYM+cJFEBcSopHzB-fvcr=g@mail.gmail.com>
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add support for embedded controller used in Asus Transformers for
> managing power and input functions.
>
> ---
> Changes in v2:
> - converted sysfs debug exports into debugfs
> - added kernel-doc comments for exposed functions
> - fixed minor typos and inconsistencies
>
> Changes in v3:
> - dropped DockRAM commits (both schema and driver)
> - integrated DockRAM functionality directly into the controller driver
> - EC schema moved to embedded controllers folder
> - removed all cell descriptions from the schema
> - removed all compatibles from the cell drivers
> - adjusted naming conventions to better align with the ASUS Transformers
> - defined EC variant sets to provide coverage for all known devices
>
> Changes in v4:
> - grouped known programming models of EC chronologically (both schema
>   and driver)
> - call debugfs init only if CONFIG_DEBUG_FS is enabled
>
> Changes in v5:
> - added asus,tf600t-ec-dock compatible to schema
> - rebased on top of v7.0
> - kzalloc > kzalloc_obj in keys and kbc
>
> Changes in v6:
> - removed asus_ec_handle_smi casting
> - asus_dockram_access_ctl > asus_ec_get_ctl in control_reg_*
> - fixed battery Kconfig description
>
> Changes in v7:
> - added status check of devm_kasprintf where missing
> - devm_asus_ec_register_notifier dropped, added .remove where it was used
> - removed cell_to_ec, asus_dockram_read, asus_dockram_write, asus_ec_* pu=
blic API
>   asus_ec_i2c_command, devm_asus_ec_register_notifier, asus_ec_read, asus=
_ec_write
> - renamed asusec_info > asusec_core
> - ec-kbc: added packed size check
>           ret > error
>           improved key remap logic
> - ec-keys: improve formatting and comments
>            ret > error
>            switched to dev_err_probe
> - ec-leds: reworked to register both leds via loop
> - ec-mfd: adjusted Kconfig description
>           fixed smbus operation sizes
>           fixed saving of EC fw model
>           adjusted IRQ flags
>           converted to use definer for set cell composition
>           added factory mode states enum and handling
>           defined some "magic" values
>           self > client, info > ec, ecreq > ecreq_gpio, priv > ddata
>           asus_ec_chip_data data > asus_ec_chip_info info
>           ec_data > ec_buf, ctl_data > ctl_buf
>           added and improved comments, added structure descriptions
>           asus_ec_magic_debug > asus_ec_susb_on_status
>           removed all dev_dbg and most of dev_info
>           pronts with model, fw behavior, factory and susb state preserve=
d
>           switched to MFD_CELL_* macros
>           removed debugfs
> - ec-battery: swithced to BIT macro
>               lock usage moved to asus_ec_battery_get_value
>               in asus_ec_battery_poll_work fixed possible rescheduling fa=
il
>               in asus_ec_battery_poll_work fixed missing not charging
> - ec-charger: POWER_SUPPLY_PROP_MODEL_NAME set as the first check
>
> Changes in v8:
> - added MODULE_ALIAS
> - renamed DOCKRAM_* to ASUSEC_*
> - ec-keys: input_handler moved into private structure
> - ec-leds: added brightness_get
> - ec-mdf:  fixed i2c_smbus_* return checks ()
>            improved model storing
> - ec-batt: added status check of devm_kasprintf
>
> Changes in v9:
> - fixed i2c_smbus_read_i2c_block_data return check
> - blocking_notifier_chain_register moved before serio registration
> - adjusted get_unaligned_le16 bounds check
> - unsigned long long > u64
> - iterator vars made scoped
> - removed "magic" values from ec-mfd
> - simplified logging, detect split into detect and init
> - improved error logs formatting
> - adjusted handler in media keys to connect strictly to dock keyboard
>
> Changes in v10:
> - ec-kbc: fixed possible out of buffer reads
> - ec-kbc: set notifier_call before blocking_notifier_chain_register
> - ec-keys: dropped input_unregister_device which should be handled by dev=
m_input_allocate_device
>
> Changes in v11:
> - applied changes from Florian Krischer (read_size parameterized and fix =
keyboard response framing)
> - ec-kbc: switch notifier and serio register calls
> - ec-keys: used WRITE_ONCE()/READ_ONCE() for priv->special_key_pressed
>
> Changes in v12:
> - removed unused includes
> - fixed kernel-doc warns
> - added check if dockram client and data are not NULL
> - replaced handler in media keys with Dmitry's implementation
> - calculate battery time props with unsigned value
> ---
>
> Micha=C5=82 Miros=C5=82aw (6):
>   mfd: Add driver for ASUS Transformer embedded controller
>   input: serio: Add driver for ASUS Transformer dock keyboard and
>     touchpad
>   input: keyboard: Add driver for ASUS Transformer dock multimedia keys
>   leds: Add driver for ASUS Transformer LEDs
>   power: supply: Add driver for ASUS Transformer battery
>   power: supply: Add charger driver for Asus Transformers
>
> Svyatoslav Ryhel (1):
>   dt-bindings: embedded-controller: document ASUS Transformer EC
>
>  .../asus,tf201-ec-pad.yaml                    | 119 ++++
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 212 +++++++
>  drivers/input/serio/Kconfig                   |  15 +
>  drivers/input/serio/Makefile                  |   1 +
>  drivers/input/serio/asus-transformer-ec-kbc.c | 264 ++++++++
>  drivers/leds/Kconfig                          |  11 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/leds-asus-transformer-ec.c       | 125 ++++
>  drivers/mfd/Kconfig                           |  16 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/asus-transformer-ec.c             | 569 ++++++++++++++++++
>  drivers/power/supply/Kconfig                  |  22 +
>  drivers/power/supply/Makefile                 |   2 +
>  .../supply/asus-transformer-ec-battery.c      | 289 +++++++++
>  .../supply/asus-transformer-ec-charger.c      | 208 +++++++
>  include/linux/mfd/asus-transformer-ec.h       | 100 +++
>  18 files changed, 1966 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/embedded-controller=
/asus,tf201-ec-pad.yaml
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>  create mode 100644 drivers/input/serio/asus-transformer-ec-kbc.c
>  create mode 100644 drivers/leds/leds-asus-transformer-ec.c
>  create mode 100644 drivers/mfd/asus-transformer-ec.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-battery.c
>  create mode 100644 drivers/power/supply/asus-transformer-ec-charger.c
>  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> --
> 2.53.0
>

Hello Lee!

May you please pick this series? Dmitry Acked input commits. Regarding
adjustments to input patches, Dmitry is fine if I send them as
followup. Thank you!
