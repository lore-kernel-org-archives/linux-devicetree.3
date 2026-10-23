Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765986;
	b=3b/jG7suobs0v0L/VnHMNnAudsVhQX5a6jL0GSLuLi2sYHZpo3k6ECdEfiuNk+5Cp+bm
	 uLu4FvVKqoB0PXzzx54X0vbNYFLNDwA6sr2iprunmEgkwVXATi8inY0pf3alTDSTY7HFp
	 c5Le5b+W1WKsjsJEpgKYDbIc2U3P4ziv9FFZQ5rkrbIcQvKJg5npC6YEgwbJkSkyG4PVs
	 0sy3xHOfkcIHylhtE+q5Huh5gVSZevBXLwyxrWW6aRToMirdSI8hUhDNJ3u5+q8p15y8k
	 OuU5gaGXkAl/Cf6kJ3ICQYooW8soNF0ewaJLwl/XKqeICG3m1sZSWsk9II9bDyEOZMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
	b=UUHJgPuY/Mro06iZts/jM4MitDSMZg4UeCc6ky6mRxUN/Q4RyzqDnO48E0C/osjPKZXQ
	 +BZTJJhrpre+3rWQb3N5XnWJcRdcItlqbtY9fZIf2Ssz/M/WKx8uzT4hEJtYtNvaRnLAh
	 UH7qLXKNWiwZP3z1rbjmdpZXF+LLk0IXp7Cp9r/0xVbMhVD/Jr2Fw/rVR7Io3VJxCctOl
	 eyOzDZyj5Z1rkLC7d31h6YRt2TSJjABuI3Myqm5Gb7JrEYO3IMTnMB4X8cKx9ovtSovxX
	 au2KdZHg4utkiEZcg/0hnRgzomSYP9Wel/tz71yohM220TJ2UbNRpxKpU3N0bBnwIqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fsdGyEoA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B8606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 560B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=fsdGyEoA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso8914555e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:33:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765985; cv=none;
        d=google.com; s=arc-20260327;
        b=WuMTjkWPQAQqlr7sJuYJYosY+vWPDydA7HxyFfp8BKiTe6yEtmTgzFEo7QpsgY6CQ5
         UxILlax1YHOeCIG+1YCWSCJizpZzwwaGEz4r19CyNJ4QOVkuJITelOAXBE85ZIlCJo6d
         b1p56z83mi49tNWGh0VWDgPW/oSkB9j3fwu7F0Y8c9eS+pRs1it3/5zMB1661u+UlXX0
         VN5/x2UqYf6P3jGazpMdncelYfPKFL6xob0qMABtFlldcRBcYDLKI8U1BdpPQfFuFI3p
         agWoQwGBRb/lrz3mhEhk83Ss6DL44Z1CxF0l161VhdecPvD7YW0VI5zjA/Xxh4Q5W9Ir
         lwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        fh=Or60dCkIRZDyHias8mQeqIEVCuIFee9NVv/DvcHyA6Y=;
        b=Hamco9tHtvk7NT2QTMiUz8PE7NeC7vtbeUIfscvIs2KDF2Xg7hUX+4anB86qO3Yc5R
         jMGJBrfDLBGfyWM61EPAGrBKxNa9jTmm8jPZxVVXQKvI2rb3odF0QpW9Y9EC8oOJ3E6r
         keT/w7L70GTC+RaLXKpO8Ab7CENzaqSr8+WTAg9AEd54DcRFlt0Bx4yYDWgcdVstUSJK
         a3trbqce1gVsWuSadN55L7fWkpUBu4AsWUSISJiaNj3nJPfMCpufaM2MYTUO4LaDhHi9
         nytVaGhPwFMkCZYDl58cJYKpm2RhVQaHSxlzPGPjTCyvIpSbk+xwAGbfkLxfuUzweik5
         QIYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765985; x=1793370785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=fsdGyEoAoNi9GphXvUJSQQBOizAj9ksNPCJJQuwHlnd5RHHQYkLbpKAoY+uv1IRLzt
         TWuzRRQcxFpgyKv8WFbBHEMHLpHDP2AnNMWQGVIOtekq5t95HCYUjreXwL3LiUjc1y+F
         7yHfwFi+WKk2nBx65TJ57AXzxvo/lHFdrKxzdZiBUbCk/YlcxhV7XeshEFqoug08Z8cj
         ZGzf04fBpN/PcNy3wzdqdgS/Cc7pfg5S2sYcs2naMHWnBYLR+o98FckX8aQ5fwumOaCg
         cAuR+uPp94mAvN56rwKYB9IEgiS7f4Qg6wGQ1UMNbO/v1iBP2GG9Qk3JX3U9OL750701
         xqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765985; x=1793370785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9n1+s+asPmDaBeXYRe4kG+xpLIMptFUgjTnOa8GCY4=;
        b=JVzqF5ZzWTv+SK7qw8xglKBkFL4Mi/9UFZtWAp3gQL39jOiKA17dwufNzWeCZffQ34
         j5yX9q7zH1AsstYCBhVnzt9gg4uZgPvEPLsiH5LPPvG3ArO0tIR+pIJT9xJZMtSCZ6eG
         MpSvP9YY0eN2pP1ZN+ufM3AObc00JZTpWUn8jRB7ZXWsSrLsPDkb7R+1p31S80B/8OSI
         HEPfFFRVc08nfQrwqOOg2V0+R3zL5Vme/lOqz39oYuITzIZFWSWg2HBzeaBfebor4fOL
         FK3RwhhcJ3tzVUdfx/bvYeP4z1v35kg07SnXCaahw+nx5Yd4SsuT8sZXlVMvsWnJSyNX
         nqFg==
X-Forwarded-Encrypted: i=1; AKwUvBzHAKguawBolfup/uKaZXoalD1MAFULu2wTVXnM7VymV9S531wc1Zb4FlXd+ldziSwGPYVa2xdsyyQa@vger.kernel.org
X-Gm-Message-State: AFq9FYJS00mmCrUogYmiQNxFafMlXWyqCK/Q2DqFYKUK0wb1mJgzzHBU
	FNvxmE7kTT+q5lbTbW4oMRsSp2RQ/eWxwY6PHPanDf/vsj2qcuz+NLkKnXi4C9H7NHLgK8QQS69
	li5jEf/L3Ny9WXQgt/PCGItDCo1ceznVXmawB0dNAXg==
X-Gm-Gg: AYBFou2ZOWEkcElCc5TNAEwOtyJx4ZYUfH1YtoOUVpQF6CjgtVrEsKhS4z+Z3JlIEHD
	iOdDYVz47f+1hYMs/svNbT03GxPZ8aMQVgCCF24K7klXv9jhoPK6MWpGgucYo7/VBCDbQFeE1tH
	eIdLa2T02wVACHA9OxkvuExHwCi9DdphGp65e/bdjP4Rivjg4vM1jgDDrJx2tHakLhSJk0rHrZv
	UY2qWzclOimOJ9m/+RTHDp6HHQcna0nGsvCwix2CfM7N1V/1PKI0FQbQQOKH1xgu0JjgDVnxJ3R
	oOm+sk8U31bqu2n7wnP6L3MpNi61SkL3WuQIjQ0GTawP7JFuYN9rSIo2VNyu98t+3en8uGW1My8
	Gta5Jkd52MuJgoV++tJi9vhifYaUll86o8WWQfBUvSSQzF6PNnJ6ZVzHVfnxDh6yJm3kxdHO79n
	38/pD1Nedc0RUMoHH+/tZZI7ZqIKoR8/Yi2mOkvWvlwr/JEekmFzac8yZM
X-Received: by 2002:a05:600c:1392:b0:4a1:742e:3 with SMTP id
 5b1f17b1804b1-4a211ecf2d6mr37791005e9.27.1792765984553; Fri, 23 Oct 2026
 07:33:04 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-15-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-15-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:52 +0530
X-Gm-Features: AclHuK9X4t2_Wp-iA3viS1hPfBa-r77osa46AUeHd9u6gOQJy4rh2geNlywyhlQ
Message-ID: <CAAhSdy1zHzqf0Ozgoz_nT81_tjg6ojsNgGQMUpeXNaJ6AN4yug@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] RISC-V: perf: Skip PMU SBI extension when not implemented
To: Atish Patra <atish.patra@linux.dev>
Cc: Will Deacon <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jiri Olsa <jolsa@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 1:40=E2=80=AFPM Atish Patra <atish.patra@linux.dev> =
wrote:
>
> From: Charlie Jenkins <charlie@rivosinc.com>
>
> When the PMU SBI extension is not implemented, sbi_v2_available should
> not be set to true. The SBI implementation for counter config matching
> and firmware counter read  should also be skipped when the SBI extension
> is not implemented.
>
> Signed-off-by: Atish Patra <atishp@meta.com>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/riscv_pmu_sbi.c | 55 ++++++++++++++++++++++++++------------=
------
>  1 file changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index fd4bf8804c9a..f0b8b6eff2ea 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -493,27 +493,32 @@ static void rvpmu_sbi_check_event(struct sbi_pmu_ev=
ent_data *edata)
>         }
>  }
>
> -static void rvpmu_sbi_check_std_events(struct work_struct *work)
> +static void rvpmu_check_std_events(struct work_struct *work)
>  {
>         int ret;
>
> -       if (sbi_v3_available) {
> -               ret =3D pmu_sbi_check_event_info();
> -               if (ret)
> -                       pr_err("pmu_sbi_check_event_info failed with erro=
r %d\n", ret);
> -               return;
> -       }
> +       if (riscv_pmu_sbi_available()) {
> +               if (sbi_v3_available) {
> +                       ret =3D pmu_sbi_check_event_info();
> +                       if (ret)
> +                               pr_err("pmu_sbi_check_event_info failed w=
ith error %d\n", ret);
> +                       return;
> +               }
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i++)
> -               rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_hw_event_sbi_map); i=
++)
> +                       rvpmu_sbi_check_event(&pmu_hw_event_sbi_map[i]);
>
> -       for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map); i++)
> -               for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_sbi_map[=
i]); j++)
> -                       for (int k =3D 0; k < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i][j]); k++)
> -                               rvpmu_sbi_check_event(&pmu_cache_event_sb=
i_map[i][j][k]);
> +               for (int i =3D 0; i < ARRAY_SIZE(pmu_cache_event_sbi_map)=
; i++)
> +                       for (int j =3D 0; j < ARRAY_SIZE(pmu_cache_event_=
sbi_map[i]); j++)
> +                               for (int k =3D 0; k < ARRAY_SIZE(pmu_cach=
e_event_sbi_map[i][j]); k++)
> +                                       rvpmu_sbi_check_event(&pmu_cache_=
event_sbi_map[i][j][k]);
> +       } else {
> +               DO_ONCE_LITE_IF(1, pr_info,
> +                               "Boot time config matching not required f=
or smcdeleg\n");
> +       }
>  }
>
> -static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
> +static DECLARE_WORK(check_std_events_work, rvpmu_check_std_events);
>
>  static ssize_t rvpmu_format_show(struct device *dev,
>                                  struct device_attribute *attr, char *buf=
)
> @@ -712,6 +717,9 @@ static int rvpmu_sbi_ctr_get_idx(struct perf_event *e=
vent)
>
>         cflags =3D rvpmu_sbi_get_filter_flags(event);
>
> +       if (!riscv_pmu_sbi_available())
> +               return -ENOENT;
> +
>         /*
>          * In legacy mode, we have to force the fixed counters for those =
events
>          * but not in the user access mode as we want to use the other co=
unters
> @@ -999,7 +1007,7 @@ static u64 rvpmu_ctr_read(struct perf_event *event)
>                 return val;
>         }
>
> -       if (pmu_sbi_is_fw_event(event)) {
> +       if (pmu_sbi_is_fw_event(event) && riscv_pmu_sbi_available()) {
>                 ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_REA=
D,
>                                 hwc->idx, 0, 0, 0, 0, 0);
>                 if (ret.error)
> @@ -2132,12 +2140,16 @@ static int __init rvpmu_devinit(void)
>         int ret;
>         struct platform_device *pdev;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> -           sbi_probe_extension(SBI_EXT_PMU))
> -               static_branch_enable(&riscv_pmu_sbi_available);
> +       if (sbi_probe_extension(SBI_EXT_PMU)) {
> +               if (sbi_spec_version >=3D sbi_mk_version(0, 3)) {
> +                       static_branch_enable(&riscv_pmu_sbi_available);
> +                       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> +                               sbi_v2_available =3D true;
> +                       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> +                               sbi_v3_available =3D true;
> +               }
> +       }
>
> -       if (sbi_spec_version >=3D sbi_mk_version(2, 0))
> -               sbi_v2_available =3D true;
>         /*
>          * We need all three extensions to be present to access the count=
ers
>          * in S-mode via Supervisor Counter delegation.
> @@ -2152,9 +2164,6 @@ static int __init rvpmu_devinit(void)
>         if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
>                 return 0;
>
> -       if (sbi_spec_version >=3D sbi_mk_version(3, 0))
> -               sbi_v3_available =3D true;
> -
>         ret =3D cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>                                       "perf/riscv/pmu:starting",
>                                       rvpmu_starting_cpu, rvpmu_dying_cpu=
);
>
> --
> 2.53.0-Meta
>
