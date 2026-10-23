Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765983;
	b=v41MET5uvksk+7ssw1lPLUTd1tCXb9wKqAR+9ZoUTVtv/2ji8CbJ0aWRHGOtUyoznfxd
	 WL9WZ/6bEioEQoVsdMv4pYnXqcnQD7VRlL6PE2+z27nwIyYrC4FNfkMlCVXTVpxLN2yLX
	 85FEkqNWP5WOoSSlnzkQwekcw8ptqoZIqAwHUs8LgOBvc8Swe1mPACt0ky5W9XA9HWn5h
	 Rzq5zJ/UFn4l8ZCbWrHVpmwZVQcn3FUbtEfAGDxgGBl7J+nma0gBuYt6WeAdAFwkycH/l
	 m+O6w9iZrZcu6iabjVy36hMcn7pfF8j1cDce8RYDO4UH70/6qiFVAAV7BQpittlpcTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
	b=zK1d7WI/NhQO1B21BsxvY+HI4o/MG4dV1opvlupHIWAK7H3Tr9KBFCL5/LJqOxpwDSIl
	 4TI2raIVk78/itR6VkJ5oeZuExxRlRc/UulTfRrX+m5tVEmGZ++cc4TZK/HmwcigrjvTe
	 X5vzK6P9LPqEFWbnORRhiTMImuTWzwMQKsb38kvPKBcTZQOKKvmH6EGLQ6So6tnajPI7R
	 rM10c6AvArrbUmuqtnNwlYQkQiiObnwGxOgX80VfA6ydeFp22W33Azs1Glefop750bBVI
	 hvy77oPYKnwILFvldc9l/gY259PRUdGGDX1aFdwZPAivvptAilg5aiurH1OyoT9oLkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mRIYhGYU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F4606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 14:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=mRIYhGYU
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so5222255e9.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765981; cv=none;
        d=google.com; s=arc-20260327;
        b=L/Bl9BugAPZ/cgVR1mEzdL9d5/o7cFmYtUWoXC5A+1FcdtwGCj/aO+oVpJ8B5kMlYT
         FwN0B/JkmlHtN1E18cdHSy0guGqUc7m1/U2QAk9l7V7tujHvr0fIjphgAIZm74V4J3MM
         yXvB5KsdvWMuSm7JIQPvhV1Sofo+dfU/GMWjcW4Dix4b0kKDdLQhn2lL3oEo7eB+8fD3
         q4nd6CVsybAE18jtmXyy3+MY9Bm68jwBQnCcvP9y/y6ONrFkmE9HF2oMuwXF83UCsU2b
         Cywr8cP4mOQeYSILnjI9iVkLA2Q4J6OZcQrLU4xrXEW09A/e1tA7e5Qad7cK5QncbTUL
         93+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        fh=LeJhh86LtK1NbBqKwqyW1ccFLAYlJJaCtEZAbBb5rso=;
        b=LWOBsmz7l+/f78x6w0PcH+PViXPenKbEh0Q0kAno6fvzlcnRgt68vtC5q1iM2iUgpu
         zml9n4h9+YxfpOKvh27r4aQuCLxSrZTv5+NT1RgI3gkRtOBUxv31koENApBLrTTTiP+V
         waRo4lGEqgM4n/qKSRLrovLTJ1tZTvoYq53pffpvuojscUcfcvSoEs5DqIzhYQeelnG1
         z7p03+4wYyDrL2Ct5t478zraK7G9/B7WRX6BY8grLUlU1EgaydCQaqAP7nu3MEKZ/qFG
         BwLkHxKdcxOYN+ExqMtTeq+mjCITbI1eHu8uXy2EciFerX3FuBaJT6GxNd0BdLX+W+bF
         CcEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792765981; x=1793370781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        b=mRIYhGYUtluI+yam/VC2VFEW8jmwjRf5KBZHQ9t2e6uHACgEJOWLmt7xAgBZF77gXT
         QcUrihcjKIGNuhhdrIELfex+Of9qe1pjJFSBTDMDqxn/ICYjmwZqft57eDMTJseuLyIy
         bAMiHedcN8ew+mNp84J0Y7xT717o7ZUAQo6FPJOloWFXJun6+JULF9hqYnkp67SA9jlJ
         kjUDnuNfhd8QEQLA70XJINr945cAY/Tq0kz/qz/g8KlGoJs99ITinWTCVKxDt8G8EOdF
         gIgsP09umVS/ZCbw83b/gZgZDxi1hubt0v6Ac8oNE04WTn3XbPyCNxpYUinG+Wglgl7u
         HoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765981; x=1793370781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiORH5HeyqHq3S+unS2vP/s9eFYUlRmFwmUHIAZJbqE=;
        b=Tef4tJnY9w+vKYzimm0t1rg7ehscwS762ZfFajpHdxm/zBL8ZxrgGjrldA4TDxaywD
         qCMScZdaaQxYb1732v75QFDiVsFs9glMK2JhgMmRymiXTcHneKhHS7uife850Dab522J
         02p3NE/1BB+xlK5ojzPJWNHy23IkVuEkgaK3pURBP3QSOEQ2EaRjJmZdUwZdni4IZbP4
         FY7xPtQAfS6DX5Pd004jHYiSOFR+VpVS2yynH9eFNMVaW3wEC1UnA+Ig3yFKrihdPPl2
         sNSf0yaraNtQIscS19fn7h5R5WBvg58nQDh337BqOiyAGrwhmoG+Er2PoGWGiso5NfMS
         nrGw==
X-Forwarded-Encrypted: i=1; AKwUvBw4k9NqYB8DtKk2XAsoWGhT0DnH/gCbkjBgSmhnXUmGryS8/JHHYDf50I4po5CfwQsfJmC+l9g0jnCP@vger.kernel.org
X-Gm-Message-State: AFq9FYJyH2vhrHNqpEbJzobUcvY2sEFSrd8hbycs21sDU8Am6/WuioIO
	qEbI9To8K8MWw4fOi8CQm8ZnXyexUFS9G0R48JUPWENOdC/c1ol5kOCubgHHDQYAWzPCmJU3hYW
	cCbxp+gAo+HAzkNwgvdTK4h9y2//ebRCOGO8GLFQVuA==
X-Gm-Gg: AYBFou0HqkqFct2uWqFm64qCozC22kEjdIhfFALvzZ16MFAQvXr5z/ERqKMnz6Xiukd
	npNtco5wRbBcM3TCq5wfeE1F21fcO5MqlIzKvrNiw21nsIXzR5uHFBCe3MOWv5jfNxIRT0VtKNN
	3ZF+oDMVF2MyjC+R8TmeWAYLYjTmZbP9muWkheh2+ZbmkdIoGFa518gsG5zqZmuTfY9XBsDDS58
	EJHgNZSIXG0QkjLbAoh1JqMnSjOJ5GLNYkhBwNQhcwbwLDoRqmxi31VuC5XpT1rkxdj0A7lRpaa
	llKkTZdmEwrexndkt/1ehbemrTNEkuHerL3R+xTYwkp0cica7yEVDBk6PA2zYhkTfwbz6hHK5bx
	bGu0Vv5SnT+mx8yaZWPU03yDaeileOTDmeYGNwMLZh+JQvczRAP9Y3LGWJb4BQpMnG4RY6z/uwH
	IANKQMsHGIXvUYiv0P2Ohv7Lss5zdGg4upa6omWjUDPAnK1o9lDzgUnCn0
X-Received: by 2002:a05:600c:3111:b0:4a1:88de:9e8b with SMTP id
 5b1f17b1804b1-4a211cd08b8mr40623715e9.5.1792765980770; Fri, 23 Oct 2026
 07:33:00 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com> <20260807-counter_delegation-v9-12-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-12-58658104e487@meta.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 20:02:47 +0530
X-Gm-Features: AclHuK_Te3oHQWEvlM580gwTI1GU6fdT3Cr7_323gvlKeM0VV47C7yWnVu4KXHg
Message-ID: <CAAhSdy0PAGqhX2CaRDFKSVY45pQ-QAQ+Or8BWFY39N9bDBMmzA@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] RISC-V: perf: Modify the counter discovery mechanism
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
> From: Atish Patra <atishp@rivosinc.com>
>
> If both counter delegation and SBI PMU is present, the counter
> delegation will be used for hardware pmu counters while the SBI PMU
> will be used for firmware counters. Thus, the driver has to probe
> the counters info via SBI PMU to distinguish the firmware counters.
>
> The hybrid scheme also requires improvements of the informational
> logging messages to indicate the user about underlying interface
> used for each use case.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  drivers/perf/riscv_pmu_sbi.c | 151 +++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 116 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a8a197d341c3..1a1430059909 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -66,6 +66,20 @@ static bool sbi_v3_available;
>  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>  #define sbi_pmu_snapshot_available() \
>         static_branch_unlikely(&sbi_pmu_snapshot_available)
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
> +
> +/* Avoid unnecessary code patching in the one time booting path*/
> +#define riscv_pmu_cdeleg_available_boot() \
> +       static_key_enabled(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available_boot() \
> +       static_key_enabled(&riscv_pmu_sbi_available)
> +
> +/* Perform a runtime code patching with static key */
> +#define riscv_pmu_cdeleg_available() \
> +       static_branch_unlikely(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available() \
> +               static_branch_likely(&riscv_pmu_sbi_available)
>
>  static struct attribute *riscv_arch_formats_attr[] =3D {
>         &format_attr_event.attr,
> @@ -88,7 +102,8 @@ static int sysctl_perf_user_access __read_mostly =3D S=
YSCTL_USER_ACCESS;
>
>  /*
>   * This structure is SBI specific but counter delegation also require co=
unter
> - * width, csr mapping. Reuse it for now.
> + * width, csr mapping. Reuse it for now we can have firmware counters fo=
r
> + * platfroms with counter delegation support.
>   * RISC-V doesn't have heterogeneous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -100,6 +115,8 @@ static unsigned int riscv_pmu_irq;
>
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
> +/* Cache the available firmware counters in another bitmask */
> +static unsigned long firmware_cmask;
>
>  static int sbi_pmu_event_find_cache(u64 config);
>  struct sbi_pmu_event_data {
> @@ -867,34 +884,44 @@ static int rvpmu_sbi_find_num_ctrs(void)
>                 return sbi_err_map_linux_errno(ret.error);
>  }
>
> -static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> +static u32 rvpmu_deleg_find_ctrs(void)
> +{
> +       /* TODO */
> +       return 0;
> +}
> +
> +static int rvpmu_sbi_get_ctrinfo(u32 nsbi_ctr, u32 *num_fw_ctr, u32 *num=
_hw_ctr)
>  {
>         struct sbiret ret;
> -       int i, num_hw_ctr =3D 0, num_fw_ctr =3D 0;
> +       int i;
>         union sbi_pmu_ctr_info cinfo;
>
> -       pmu_ctr_list =3D kzalloc_objs(*pmu_ctr_list, nctr);
> -       if (!pmu_ctr_list)
> -               return -ENOMEM;
> -
> -       for (i =3D 0; i < nctr; i++) {
> +       for (i =3D 0; i < nsbi_ctr; i++) {
>                 ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_IN=
FO, i, 0, 0, 0, 0, 0);
>                 if (ret.error)
>                         /* The logical counter ids are not expected to be=
 contiguous */
>                         continue;
>
> -               *mask |=3D BIT(i);
> -
>                 cinfo.value =3D ret.value;
> -               if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW)
> -                       num_fw_ctr++;
> -               else
> -                       num_hw_ctr++;
> -               pmu_ctr_list[i].value =3D cinfo.value;
> +               if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_FW) {
> +                       /* FW counters use SBI logical ids; skip any that=
 collide */
> +                       if (cmask & BIT(i)) {
> +                               pr_warn_once("SBI firmware counter %d ove=
rlaps a delegated hardware counter, ignoring it\n",
> +                                            i);
> +                               continue;
> +                       }
> +                       /* Track firmware counters in a different mask */
> +                       firmware_cmask |=3D BIT(i);
> +                       pmu_ctr_list[i].value =3D cinfo.value;
> +                       *num_fw_ctr =3D *num_fw_ctr + 1;
> +               } else if (cinfo.type =3D=3D SBI_PMU_CTR_TYPE_HW &&
> +                          !riscv_pmu_cdeleg_available_boot()) {
> +                       *num_hw_ctr =3D *num_hw_ctr + 1;
> +                       cmask |=3D BIT(i);
> +                       pmu_ctr_list[i].value =3D cinfo.value;
> +               }
>         }
>
> -       pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num=
_hw_ctr);
> -
>         return 0;
>  }
>
> @@ -905,7 +932,7 @@ static inline void rvpmu_sbi_stop_all(struct riscv_pm=
u *pmu)
>          * which may include counters that are not enabled yet.
>          */
>         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -                 0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +                 0, pmu->cmask | firmware_cmask, SBI_PMU_STOP_FLAG_RESET=
, 0, 0, 0);
>  }
>
>  static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> @@ -1158,16 +1185,54 @@ static void rvpmu_ctr_stop(struct perf_event *eve=
nt, unsigned long flag)
>         /* TODO: Counter delegation implementation */
>  }
>
> -static int rvpmu_find_num_ctrs(void)
> +static int rvpmu_find_ctrs(void)
>  {
> -       return rvpmu_sbi_find_num_ctrs();
> -       /* TODO: Counter delegation implementation */
> -}
> +       int num_sbi_counters =3D 0;
> +       u32 num_deleg_counters =3D 0;
> +       u32 num_hw_ctr =3D 0, num_fw_ctr =3D 0, num_ctr =3D 0;
> +       /*
> +        * We don't know how many firmware counters are available. Just a=
llocate
> +        * for maximum counters the driver can support. The default is 64=
 anyways.
> +        */
> +       pmu_ctr_list =3D kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list=
),
> +                              GFP_KERNEL);
> +       if (!pmu_ctr_list)
> +               return -ENOMEM;
>
> -static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> -{
> -       return rvpmu_sbi_get_ctrinfo(nctr, mask);
> -       /* TODO: Counter delegation implementation */
> +       if (riscv_pmu_cdeleg_available_boot())
> +               num_deleg_counters =3D rvpmu_deleg_find_ctrs();
> +
> +       /* SBI PMU is only needed for firmware counters; delegation is in=
dependent */
> +       if (riscv_pmu_sbi_available_boot()) {
> +               num_sbi_counters =3D rvpmu_sbi_find_num_ctrs();
> +               if (num_sbi_counters < 0) {
> +                       /* Keep going if delegation already gave us count=
ers */
> +                       if (!num_deleg_counters) {
> +                               kfree(pmu_ctr_list);
> +                               pmu_ctr_list =3D NULL;
> +                               return num_sbi_counters;
> +                       }
> +                       pr_warn("Firmware counters unavailable (%d), cont=
inuing with %u delegated hardware counters\n",
> +                               num_sbi_counters, num_deleg_counters);
> +                       num_sbi_counters =3D 0;
> +               }
> +               if (num_sbi_counters > RISCV_MAX_COUNTERS)
> +                       num_sbi_counters =3D RISCV_MAX_COUNTERS;
> +       }
> +
> +       /* cache all the information about counters now */
> +       if (riscv_pmu_sbi_available_boot())
> +               rvpmu_sbi_get_ctrinfo(num_sbi_counters, &num_fw_ctr, &num=
_hw_ctr);
> +
> +       if (riscv_pmu_cdeleg_available_boot()) {
> +               pr_info("%u firmware and %u hardware counters\n", num_fw_=
ctr, num_deleg_counters);
> +               num_ctr =3D num_fw_ctr + num_deleg_counters;
> +       } else {
> +               pr_info("%u firmware and %u hardware counters\n", num_fw_=
ctr, num_hw_ctr);
> +               num_ctr =3D num_sbi_counters;
> +       }
> +
> +       return num_ctr;
>  }
>
>  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> @@ -1477,12 +1542,21 @@ static int rvpmu_device_probe(struct platform_dev=
ice *pdev)
>         int num_counters;
>         bool irq_requested =3D false;
>
> -       pr_info("SBI PMU extension is available\n");
> +       if (riscv_pmu_cdeleg_available_boot()) {
> +               pr_info("hpmcounters will use the counter delegation ISA =
extension\n");
> +               if (riscv_pmu_sbi_available_boot())
> +                       pr_info("Firmware counters will use SBI PMU exten=
sion\n");
> +               else
> +                       pr_info("Firmware counters will not be available =
as SBI PMU extension is not present\n");
> +       } else if (riscv_pmu_sbi_available_boot()) {
> +               pr_info("Both hpmcounters and firmware counters will use =
SBI PMU extension\n");
> +       }
> +
>         pmu =3D riscv_pmu_alloc();
>         if (!pmu)
>                 return -ENOMEM;
>
> -       num_counters =3D rvpmu_find_num_ctrs();
> +       num_counters =3D rvpmu_find_ctrs();
>         if (num_counters < 0) {
>                 pr_err("SBI PMU extension doesn't provide any counters\n"=
);
>                 goto out_free;
> @@ -1494,9 +1568,6 @@ static int rvpmu_device_probe(struct platform_devic=
e *pdev)
>                 pr_info("SBI returned more than maximum number of counter=
s. Limiting the number of counters to %d\n", num_counters);
>         }
>
> -       /* cache all the information about counters now */
> -       if (rvpmu_get_ctrinfo(num_counters, &cmask))
> -               goto out_free;
>
>         ret =3D rvpmu_setup_irqs(pmu, pdev);
>         if (ret < 0) {
> @@ -1598,13 +1669,23 @@ static int __init rvpmu_devinit(void)
>         int ret;
>         struct platform_device *pdev;
>
> -       if (sbi_spec_version < sbi_mk_version(0, 3) ||
> -           !sbi_probe_extension(SBI_EXT_PMU)) {
> -               return 0;
> -       }
> +       if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
> +           sbi_probe_extension(SBI_EXT_PMU))
> +               static_branch_enable(&riscv_pmu_sbi_available);
>
>         if (sbi_spec_version >=3D sbi_mk_version(2, 0))
>                 sbi_v2_available =3D true;
> +       /*
> +        * We need all three extensions to be present to access the count=
ers
> +        * in S-mode via Supervisor Counter delegation.
> +        */
> +       if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +           riscv_isa_extension_available(NULL, SMCDELEG) &&
> +           riscv_isa_extension_available(NULL, SSCSRIND))
> +               static_branch_enable(&riscv_pmu_cdeleg_available);
> +
> +       if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_availabl=
e_boot()))
> +               return 0;
>
>         if (sbi_spec_version >=3D sbi_mk_version(3, 0))
>                 sbi_v3_available =3D true;
>
> --
> 2.53.0-Meta
>
