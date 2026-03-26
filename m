Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E7347530
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527645; cv=none; b=gyrdgMAec7+z92afYP/GyZHbIjxYoM9Muwely8WAQnZdNVYGbLnkKGd1kWTJJAEPeDbuU+lS+dpRMACjd6vBxcP8iImdd0DYoLmihDQHP3RAQukfgvWquHD8mLWq+adDe00HYS5Fi9yhZlZ/XFgHt5BveLxuy9LkvKSNIBrQjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527645; c=relaxed/simple;
	bh=SjA50/xzPCzBZpeiNlpZ1frmsgq4yd5aqt5t9Ve+hv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO0qX17jsg+rwwl/LN+0GuKBG3FHcPts+338EzYZczW7dQcrb/O6IvVWv8lU/UYUnTRO0vjYU0HTlqyjEqRQ92cOPbLLKENSbS1J0n6Irvogi3jnMX5e4D/dQxE6obCwFCJCd9BJEP13CEB7/huYVeNe32ld2rKLNPCv3wAJw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79ac94fc3ffso9356317b3.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774527643; x=1775132443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7OU8fAyOGvGnQIm42e3kymPTmEmyDZVdHe89ZVPV8s=;
        b=sf9Tk4Ak/9hfMRh695riVcFU+nwPUNAE17sLe3/6xSpXoHNngxgdhV+ufJwHyF3+nC
         FRMHc3VJo7mnWshN5YPLInpbYKy/Ia7uUeWOb3bdM1uIoCB96nVDoN8i/kaO26hfxlEL
         bvGkVQwgarfwuvs7qnqe1Gh3ynfTHCa2XC+ps8tRd+ZtL86s9b7BtsXfhvTDnSABeleQ
         ZTvQ27PWsVHTjxJi2sAEX0vVW0XXroRFpUwlmq0RJxdszO1Wzb3HEvu5DbVMcAL18tWZ
         smObuFpxRD5deLm+mUVsqDdXTc5Ty4nvEwkD+jO62aVQIAMtEnulKvpc91sRDCUisojG
         cpxg==
X-Forwarded-Encrypted: i=1; AJvYcCV9HVuzYEiuJn+weoyM2xSLxrfZe5z+rCzGdlbIeMvX1bZAqHYAYskLXr/VXJzKm6EiXq4u/DBCRrOE@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEWBUTAacGiFUT4U4NDXnl6Uat8A1UnAWU11c6+nyyG96DPyo
	kcsL70B5Z6izszd25PsXZ448mj2BV8BtQEpwNwHnCLZtmj3ChI95i7WJBBvK/IaP
X-Gm-Gg: ATEYQzzXXf92ImJ+/D4eWbTd6u3JkSYdp27G+EeIdtOpjjQa5g+pU5PNXND5klSJW1e
	08I/TfvAfk2keSa6A1RK9hSLdw5mEtjdC4DvN5oTKQT7qStO/4eGsaF+NJrEtnpVavSdWTipfcN
	5eTtUnZ9uM34Hq2TtauvPvjDYMq4kDEBLWNjynjaFyUGGjJLZwZAouZRpzlK5Qcb+3AxmRjmEeN
	BgQ3i+h+8aJeevXOTWcXGmBIyyxhQWLAhXX6nOVSYopHIZB7A+4hvtlEdajmVRdXofoeY/UuGop
	+CsSPe/I0Ney+rpvwcq+W/1DWORkoWaPmD1Nu63rPcmI/zSF2q7rLuOW6cEnlKWQTabG1wJarT9
	Mk8BX/M2X5kucAt+2PFwyYt4xSylGKUVG0ZsZrqlkfJiWJuHHBT51MSCo7WHXrs58EHujQ3UhL4
	j//Uogk9EHGhgMJPU03GYSZBdbSbGZ3jqTzdu9b4vecbmQdEIHX33CsvTJ3T6GzMOlciHCcOkhW
	/yDJJYsWmqmq7sMxmJG8nDWfyIr/ki2Y+gFMDpCSw==
X-Received: by 2002:a05:690c:d89:b0:79a:b9a5:9e85 with SMTP id 00721157ae682-79acf2e8b32mr73579517b3.2.1774527642420;
        Thu, 26 Mar 2026 05:20:42 -0700 (PDT)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com. [74.125.224.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e400dd9sm12005967b3.39.2026.03.26.05.20.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 05:20:41 -0700 (PDT)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ae222d978so956354d50.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:20:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCUhOVRWVyMgz0mu7tcwqyWdVAYXOyg7JWyo45KXql4iC890JbLjrrGqi+jRClbL/nG1hD0HCr/c1Q@vger.kernel.org
X-Received: by 2002:a05:690e:408a:b0:64e:e74c:76b with SMTP id
 956f58d0204a3-64ee74c0e9dmr6490680d50.37.1774527641472; Thu, 26 Mar 2026
 05:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325202005.29822-1-email@sirat.me> <20260325202005.29822-3-email@sirat.me>
 <acUHDGUqg4RdI7fW@ashevche-desk.local>
In-Reply-To: <acUHDGUqg4RdI7fW@ashevche-desk.local>
From: Sirat <email@sirat.me>
Date: Thu, 26 Mar 2026 18:20:30 +0600
X-Gmail-Original-Message-ID: <CANn+LW+26VVCvr1aaqgBc8OiY7-OM8K_vWYN7wz=8-S4ChTPyA@mail.gmail.com>
X-Gm-Features: AQROBzCbsxKRoKqt2OgrX0C5boggozm_EFZh5iePbC7NZOX5nXS6PRubvYu5qvA
Message-ID: <CANn+LW+26VVCvr1aaqgBc8OiY7-OM8K_vWYN7wz=8-S4ChTPyA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] iio: proximity: add driver for ST VL53L1X ToF sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Mar 26, 2026 at 02:19:42AM +0600, Siratul Islam wrote:
> > Add support for the STMicroelectronics VL53L1X Time-of-Flight
> > ranging sensor with I2C interface.
>
> Some ideas for small followup amendments.
>
> ...
>
> > +#define VL53L1X_REG_SOFT_RESET                                        =
       0x0000
> > +#define VL53L1X_REG_VHV_CONFIG__TIMEOUT_MACROP_LOOP_BOUND            0=
x0008
> > +#define VL53L1X_REG_VHV_CONFIG__INIT                                 0=
x000B
> > +#define VL53L1X_REG_GPIO_HV_MUX__CTRL                                 =
       0x0030
> > +#define VL53L1X_REG_GPIO__TIO_HV_STATUS                               =
       0x0031
> > +#define VL53L1X_REG_SYSTEM__INTERRUPT_CONFIG_GPIO                    0=
x0046
> > +#define VL53L1X_REG_PHASECAL_CONFIG__TIMEOUT_MACROP                  0=
x004B
> > +#define VL53L1X_REG_RANGE_CONFIG__TIMEOUT_MACROP_A                   0=
x005E
> > +#define VL53L1X_REG_RANGE_CONFIG__VCSEL_PERIOD_A                     0=
x0060
> > +#define VL53L1X_REG_RANGE_CONFIG__TIMEOUT_MACROP_B                   0=
x0061
> > +#define VL53L1X_REG_RANGE_CONFIG__VCSEL_PERIOD_B                     0=
x0063
> > +#define VL53L1X_REG_RANGE_CONFIG__VALID_PHASE_HIGH                   0=
x0069
> > +#define VL53L1X_REG_SYSTEM__INTERMEASUREMENT_PERIOD                  0=
x006C
> > +#define VL53L1X_REG_SD_CONFIG__WOI_SD0                                =
       0x0078
> > +#define VL53L1X_REG_SD_CONFIG__WOI_SD1                                =
       0x0079
> > +#define VL53L1X_REG_SD_CONFIG__INITIAL_PHASE_SD0                     0=
x007A
> > +#define VL53L1X_REG_SD_CONFIG__INITIAL_PHASE_SD1                     0=
x007B
> > +#define VL53L1X_REG_SYSTEM__INTERRUPT_CLEAR                          0=
x0086
> > +#define VL53L1X_REG_SYSTEM__MODE_START                                =
       0x0087
> > +#define VL53L1X_REG_RESULT__RANGE_STATUS                             0=
x0089
> > +#define VL53L1X_REG_RESULT__FINAL_CROSSTALK_CORRECTED_RANGE_MM_SD0   0=
x0096
> > +#define VL53L1X_REG_RESULT__OSC_CALIBRATE_VAL                         =
       0x00DE
> > +#define VL53L1X_REG_FIRMWARE__SYSTEM_STATUS                          0=
x00E5
> > +#define VL53L1X_REG_IDENTIFICATION__MODEL_ID                         0=
x010F
> > +#define VL53L1X_REG_DEFAULT_CONFIG                                   0=
x002D
>
> Keep the list ordered by the value?
>
> ...
>
> > +static int vl53l1x_chip_init(struct vl53l1x_data *data)
> > +{
> > +     struct device *dev =3D regmap_get_device(data->regmap);
> > +     unsigned int val;
> > +     u16 model_id;
> > +     int ret;
> > +
> > +     if (!data->xshut_reset) {
> > +             ret =3D regmap_write(data->regmap, VL53L1X_REG_SOFT_RESET=
, 0x00);
> > +             if (ret)
> > +                     return ret;
> > +             fsleep(100); /* conservative reset pulse, no spec */
> > +
> > +             ret =3D regmap_write(data->regmap, VL53L1X_REG_SOFT_RESET=
, 0x01);
> > +             if (ret)
> > +                     return ret;
> > +             fsleep(1000); /* conservative boot wait, no spec */
> > +     }
> > +
> > +     ret =3D regmap_read_poll_timeout(data->regmap,
> > +                                    VL53L1X_REG_FIRMWARE__SYSTEM_STATU=
S, val,
> > +                                    val & BIT(0),
> > +                                    1 * USEC_PER_MSEC,
> > +                                    100 * USEC_PER_MSEC);
>
> Use logical split
>
>         ret =3D regmap_read_poll_timeout(data->regmap,
>                                        VL53L1X_REG_FIRMWARE__SYSTEM_STATU=
S,
>                                        val, val & BIT(0),
>                                        1 * USEC_PER_MSEC, 100 * USEC_PER_=
MSEC);
>
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "firmware boot timeout\n")=
;
> > +
> > +     ret =3D vl53l1x_read_u16(data, VL53L1X_REG_IDENTIFICATION__MODEL_=
ID,
> > +                            &model_id);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (model_id !=3D VL53L1X_MODEL_ID_VAL)
> > +             dev_info(dev, "unknown model id: 0x%04x, continuing\n", m=
odel_id);
> > +
> > +     ret =3D regmap_bulk_write(data->regmap, VL53L1X_REG_DEFAULT_CONFI=
G,
> > +                             vl53l1x_default_config,
> > +                             sizeof(vl53l1x_default_config));
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_read(data->regmap, VL53L1X_REG_GPIO_HV_MUX__CTRL, =
&val);
> > +     if (ret)
> > +             return ret;
> > +     data->gpio_polarity =3D !!(val & VL53L1X_GPIO_HV_MUX_POLARITY);
> > +
> > +     /* Initial ranging cycle for VHV calibration */
> > +     ret =3D vl53l1x_start_ranging(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* 1ms poll, 1s timeout covers max timing budgets (per ST Ultra L=
ite Driver) */
> > +     ret =3D regmap_read_poll_timeout(data->regmap,
> > +                                    VL53L1X_REG_GPIO__TIO_HV_STATUS, v=
al,
> > +                                    (val & 1) !=3D data->gpio_polarity=
,
> > +                                    1 * USEC_PER_MSEC,
> > +                                    1000 * USEC_PER_MSEC);
>
> Ditto.
>
>         ret =3D regmap_read_poll_timeout(data->regmap,
>                                        VL53L1X_REG_GPIO__TIO_HV_STATUS,
>                                        val, (val & 1) !=3D data->gpio_pol=
arity,
>                                        1 * USEC_PER_MSEC, 1 * USEC_PER_SE=
C);
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D vl53l1x_clear_irq(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D vl53l1x_stop_ranging(data);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D regmap_write(data->regmap,
> > +                        VL53L1X_REG_VHV_CONFIG__TIMEOUT_MACROP_LOOP_BO=
UND,
> > +                        VL53L1X_VHV_LOOP_BOUND_TWO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return regmap_write(data->regmap, VL53L1X_REG_VHV_CONFIG__INIT, 0=
x00);
> > +}
>
> ...
>
> > +     if (data->irq) {
> > +             reinit_completion(&data->completion);
> > +
> > +             ret =3D vl53l1x_clear_irq(data);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             if (!wait_for_completion_timeout(&data->completion, HZ))
> > +                     return -ETIMEDOUT;
> > +     } else {
> > +             unsigned int rdy;
> > +
> > +             /* 1ms poll, 1s timeout covers max timing budgets (per ST=
 Ultra Lite Driver) */
> > +             ret =3D regmap_read_poll_timeout(data->regmap,
> > +                                            VL53L1X_REG_GPIO__TIO_HV_S=
TATUS, rdy,
> > +                                            (rdy & 1) !=3D data->gpio_=
polarity,
> > +                                            1 * USEC_PER_MSEC,
> > +                                            1000 * USEC_PER_MSEC);
>
> Ditto.
>
>                 ret =3D regmap_read_poll_timeout(data->regmap,
>                                                VL53L1X_REG_GPIO__TIO_HV_S=
TATUS,
>                                                rdy, (rdy & 1) !=3D data->=
gpio_polarity,
>                                                1 * USEC_PER_MSEC, 1 * USE=
C_PER_SEC);
>
> Yes, in this case they are slightly longer than 80 characters. But
> looking at the above this entire call should be a helper, so you can
> reuse it here and above.
>
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
Hi Andy!

Thanks for the review again. I will send a small separate cleanup
patch for this once it gets to a more stable stage.

Sirat
