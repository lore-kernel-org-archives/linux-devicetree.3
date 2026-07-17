Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFA34389C
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284908; cv=pass; b=sRPBrpxgR1aQ9kgEeAjrydyuDmeOPEJLout/YKlPPmT7gRRNX1+0T++d08AD8Lka3eGEF6YcLguMyUW8hVZZymL1gb3lC5jtxN1VewVqPpcqY+wp3wTthv5HzhikgbNGTp2QhxxcQn/d+yAVFmtJRTgZ9CxFkt6tiFTQ5TpdyL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284908; c=relaxed/simple;
	bh=XrfucVrMCM8oIHYW1+hDEG4ZBglJU7no9wJ+HRtrGl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AENLRGXA3orJNHpD0XhaFer8ICkEm/GsnosAqiMqwXypwMe7JaXxDaB8RVhkhdLPxm1YJaYWD7a2GPtHTdyCqEPOQWnPdy6AvpX2keJAS1uLg7KVsYQ20ExfgS7A9PuHL1j5/Dq2KGRBjxBeHJxBBYbLN+0oLEYJSthMLWDqoxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjgHOh06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rd77X5uO; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjgHOh06";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rd77X5uO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HASikH1515701
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ua9pRS/rBw6i3Fo1FdGicEIBWEUHA+NkqLTFoW/Hyao=; b=JjgHOh06IkDjMS3N
	LnFjKlryPprQ9vArxMWhcPsxP1NaKXuHEA9bJL3gcv+4W34/9IDCy41i0o9LEzVt
	aEVSlShgauhDhZLoK1PYyhzwu9Xm9D2b1K5OONYzhrRmT+pZf6RYhg3DzCpAFul5
	PVMSKBSDontyBe8DOgaj9fWn6tdz5n82+L4HjwmFL3vr/aSMABnc73Yz08M6Lazv
	lX2UplD6vDz6p6wudYcDA4lHTyZ8BNb807mq0I+nMxsnj6h8N86E1sb+q+jpSpkf
	1xmVBPTWWPjXyEZ8LQXvbpQjIPegLEuIpmFSS2lwJd32KOXToPF/GONrxeDCMArA
	fw0umw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grwxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 10:41:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef18406878so146922306d6.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784284905; cv=none;
        d=google.com; s=arc-20260327;
        b=Yunvv80vgD4eIB7Yr/RfsBUthF+7HMlArXcA0b2qOGDG/1cR0eBMDlZJFqejbZdHdl
         OkZL3OS9jHJne9up2+2gULUsKmeUy1bSeMHt9GmERAhZl1bMllg6ojNlyLQtteNwEZPU
         RAHZxqy/NkFV/mHV29PjCTtlGsoUbfKvs7f2EPL7HzhYUp5SL522+DEVhEASgKQLmE2+
         GsqyT1s9ICniJ1nG3I62VC2wDcUDvkfWJ87XLMunRcHFNc13V4++NkTZdxRu6rDzi2n4
         eJvMa75Z12FqtuxBYr3mb0nmL7eNCos3F5KLcVsKA0WGtDl+LvQqOruOz+3wpWVTR8Ve
         WkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ua9pRS/rBw6i3Fo1FdGicEIBWEUHA+NkqLTFoW/Hyao=;
        fh=TNSilfw3WQ2dLyWHDCgIpy89+vs7yHbqVm7kUQqgFM0=;
        b=Od7wpY2lDnPuIh74WvD1+j5Gk8BQXPcA+3sQcTr6BJSi6y3gfe8J3+O/GuEshKBqYE
         xZYmOl082ywTjKrRkQPsV2JCLKJDImQZgl32s+ePjgp1VvfxcVi+dEkgtvBNnYSBSKv9
         u42Y1Yn5KORlttVtOPsQnpkm8wUSSs7RKKfWCXrj3dLGWk2XfnaYGEOAxvVfTMPgFuIQ
         mzZblMABItGrm+5Q79qeueuc8OJ/NBHzDB2ChhljxnL2BuXzrbjjRCD3e2np6yCTBW0t
         /XwywCd0YIjbKVJvSN1SmkbTSuDvbbqTQhC+ugycQdhRC6+Cg1yQmrOVSzn9HOiIYfVb
         nB4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784284905; x=1784889705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ua9pRS/rBw6i3Fo1FdGicEIBWEUHA+NkqLTFoW/Hyao=;
        b=Rd77X5uO4ohcqbLy8QVYoe4FD++uQ5LB3dpGq9czcMpmx7x4DoYkDcrzkf5kO9wNte
         JKSpakklKidhA5eVyXQoAYFcfkx5IuX+3RUu0jkkXBnESWlcDDnPSTagu4EifA46tqjd
         j8lxSg10cKZyUfX6mgnIcpVlDuDKQcwMNJYQdFc1ZdELQ/Iz8NvUmBGwoPjBoA6wel1X
         89obAZ7p+sY5vUTbFxtaVysNXZs+EbVks3IYou8vOLxKlAojukKF4iGeMkjAITjmHh4b
         4kL2b7q2BQidsfjjIiSPlb/NyqOZABRL8zHAcskjPvowmgKQWYmB+rFUTCqaO2m9cRUa
         gp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284905; x=1784889705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ua9pRS/rBw6i3Fo1FdGicEIBWEUHA+NkqLTFoW/Hyao=;
        b=AO5bHT0HPps018Vkc0QtfU0bzmERE/zEX+NwueCo+wq8+pFMuvFHeaO+9/ioqj4hp/
         rRsasmnApfdMAx/XY41UDND04aowzd1NW2NikwGj97tyJWzzn6hzelV/EQcl6DUSVdWt
         sd46+tpytt+hP+KX0rvAZcnQumN1SIBvBd0taXZ+oR/ZFWruxsQyU8bP5an5y6MbagKx
         BWszU/3H8+TKiOwRO0+FxNaC3Pk3wVTntwUhzOY0VsVFsGmno/Ye8LbuziX2U3YpDolr
         QrHV0PHfthoLVLGF1Vfqu0tsIUJXuBIg3wHwZUVjGu46gQph+pZrddUb+n/XERtUxjps
         kQ0g==
X-Forwarded-Encrypted: i=1; AHgh+RrpEJugsCeLFuits4ZFfuDSePWdrJX44pQjAvcxmgKDktRnDn9G/TDTMf12LFRannhRxAUZRng3TmBW@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzMHsF61yXqFtrRZz2RjPu9DcRYy5imt2M/07zxxikO6TyMOY
	rw7ztDtDaMiodwvmnWdMs6ZNvwd/ydii51ptaD3W3ejLolbg7+YatcIDUwqHvYiHupPA7mq5zd9
	ak0A/lhGpHzD5sPqUs09n68hYdLVngoUAlB7eskqE0ijMFNawhf5bLYxsfFK+PPJFyh2pbHO/7K
	DlZ8PepxOvhRunlKfIIJC4KfudDlIrNyZNh4O4UM0yNKzrjIQCVA==
X-Gm-Gg: AfdE7cnH33VjxcvS1Jmf30OBt1/EtBqMNdueek8iaT+4t/zzMk9FSYymvmum19pR8g8
	3hBb/fCOg2j2ZAyOB2WUuFsxB2gbkajpwZI9PGexlKaDQgrKOYwaoEsGIcEC0HNLyvcKuBXygNo
	az3/IEqxkD7D4vYN/v//voIpP1xSMJ3aZ0yG1fWUIFZnPjEdbFyLjklQS74Q==
X-Received: by 2002:a05:6214:2dc6:b0:8e9:f62b:bedf with SMTP id 6a1803df08f44-9077853777bmr20999476d6.47.1784284905556;
        Fri, 17 Jul 2026 03:41:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:8e9:f62b:bedf with SMTP id
 6a1803df08f44-9077853777bmr20999266d6.47.1784284905093; Fri, 17 Jul 2026
 03:41:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716232641.2659710-1-jm@ti.com> <20260716232641.2659710-3-jm@ti.com>
In-Reply-To: <20260716232641.2659710-3-jm@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:41:34 +0200
X-Gm-Features: AUfX_myV7bHFgy62QGyFKSW2TFvxOlR3TbiCr7q5KWVKha-aN4nPTJWJ9zgqy9A
Message-ID: <CAPx+jO8H=J-B-DgXG5Qrg02y2GZDMFr+mySt=oCP5L7WBbzZAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: core: Add post-power-off-delay-ms support
To: Judith Mendez <jm@ti.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwNyBTYWx0ZWRfX0S8OMpCYu6bz
 RrAb9vh8/ttMjDeZrKOKqdVKEbqpRtFjv5Z0Ur/+1lRkc/vjoVhhPZSG9cepUVdOjppksjX0Jk9
 hpBy8WTorjAo46gclRAbwBMNoMe0aU0=
X-Proofpoint-ORIG-GUID: s6rbt1KF_Mauu99P9tq6r0GnakhxE41l
X-Proofpoint-GUID: s6rbt1KF_Mauu99P9tq6r0GnakhxE41l
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5a06ea cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=sozttTNsAAAA:8 a=zrnE107Yo5mwZZ080UgA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwNyBTYWx0ZWRfX0//kClprNYJw
 M2cAwBSV/CX9lKF6I8bipg8C0FNMVjsp2OXqRL9EXddP0FAAYdyi4nDlPDsKmuKmmgPVZwB7RRn
 QS6j8N9JKvG1ll6v9CDY9LLoycG+LteiHYQg9RkwhZ5MqJKcdt577SksTqgpCrutXLRVwyxSU6A
 3e19/j83GV2MV3CMwfTe7BfGYCmFCK6WXZcuxE/qu9xyMuelG9wPiccTohoORIEAS5pLxR+ZrUP
 uhEekpxegPjGLc6DjsSADZ/ZnDbTtDhBm5lFqRQv0mXa5EDozneSnTy8l/epH68YqTX4UhbqkBA
 YO9DAR9wS6W9DbeInoJmRLKYc+m8loo0i5qMs3a/ueUNaJzUoEqXEhRSGdPm2v6an316fygiuY7
 0aGp+Ln1ltMGcJgVEFs7tg663g6oXksCsFMYpD95fX4O0Sy++Dv1W4NSJrIwJjBXtX1ypXcVjQz
 qa/+QISGyaYPCGSR9qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170107

On Fri, Jul 17, 2026 at 1:26=E2=80=AFAM Judith Mendez <jm@ti.com> wrote:
>
> Add support for post-power-off-delay-ms which shall be used to insert
> a configurable delay post MMC power off.
>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  drivers/mmc/core/core.c  | 8 ++++++--
>  drivers/mmc/core/host.c  | 8 ++++++++
>  include/linux/mmc/host.h | 1 +
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 29e80e5f928e9..f9049aaf44394 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -1394,8 +1394,12 @@ void mmc_power_off(struct mmc_host *host)
>  void mmc_power_cycle(struct mmc_host *host, u32 ocr)
>  {
>         mmc_power_off(host);
> -       /* Wait at least 1 ms according to SD spec */
> -       mmc_delay(1);

The above delay is kind of questionable in the first place, as we
already have a mmc_delay(1) at the end of mmc_power_off().

Maybe the delay is needed for legacy reasons and because of that, I
would suggest that we leave mmc_power_cycle() as is, for now. In the
end, I would rather see that the above delay gets removed altogether.

Instead, how about making the mmc_delay(1) in mmc_power_off() configurable?

Moreover, rather than the code below, I think it would be better to
set a default value for "host->post_power_off_delay_ms" to 1 in
mmc_alloc_host(). In fact, there is already similar code for
"host->ios.power_delay_ms", please try to follow that for this case
too.

> +       if (host->post_power_off_delay_ms) {
> +               mmc_delay(host->post_power_off_delay_ms);
> +       } else {
> +               /* Wait at least 1 ms according to SD spec */
> +               mmc_delay(1);
> +       }
>         mmc_power_up(host, ocr);
>  }
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index b7ce3137d4529..ea8f36827e41c 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -421,6 +421,14 @@ int mmc_of_parse(struct mmc_host *host)
>         device_property_read_u32(dev, "post-power-on-delay-ms",
>                                  &host->ios.power_delay_ms);
>
> +       device_property_read_u32(dev, "post-power-off-delay-ms",
> +                                &host->post_power_off_delay_ms);
> +       if (host->post_power_off_delay_ms > 10000) {
> +               dev_err(dev, "post-power-off-delay-ms %u exceeds max 1000=
0, setting 10000\n",
> +                       host->post_power_off_delay_ms);
> +               host->post_power_off_delay_ms =3D 10000;
> +       }
> +
>         return mmc_pwrseq_alloc(host);
>  }
>
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index ba84f02c2a101..b751b61b1116e 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -578,6 +578,7 @@ struct mmc_host {
>
>         u32                     err_stats[MMC_ERR_MAX];
>         u32                     max_sd_hs_hz;
> +       u32                     post_power_off_delay_ms;
>         unsigned long           private[] ____cacheline_aligned;
>  };
>
> --
> 2.54.0
>

Kind regards
Uffe
