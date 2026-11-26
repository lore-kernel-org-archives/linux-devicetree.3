Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669855;
	b=2OXXuYCF2RGT71DtduIcoDPcfW24iyRM6H3ACZv4Acm8rxwuku6JQ47QzQJnS8p5bw0Y
	 Ron9myGeML8hHFRWFLaW6Y93wwn/y7H3j40MOgeu0A8uISxAcGu41v/WqI1oUfRXx8j87
	 MwA9byfD1ha1yFoYDLC+lek+b4gdG+tEQg256Wz85lelM3tDWoU66QJ0NNai7QJGoqIbp
	 WzXCFlxPRKUJQ3mPU1h1wZtuOOIy40wNN4003krFV/XtGOBzJPHl3T1/i5V6HyFAtn/dY
	 38BZQn8ny9FMg9D5cHtGjwDwzeA4WMc6HI24k2Ql5yoDfguUFI/v5FveWpizKV1k/og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
	b=Dja9Ifx2PaMuoiE3c5uYsdrRnEfhYRGwNxQRkhnSzc/jOOBQcWm5LFDOGjSEC6rQuZS2
	 tyGlmWC7qQT6guY4zBCFPqnX+KRVBJAHoqpUMM+PJw//v3BPoAgLsn+pF9EFSkD4TbRqB
	 3W2LGI9FdoCbpy0JWvpDgLVOTt2DjktZxNflrbIsFMw2IlIm6MuJfq65LdMze02DJRmYd
	 JvfupTHn8P1nGxalhdi4WERgz9sVNxfHjJks0CKXfEMPqjS3AQldio9nnaAqErigo7njj
	 xyzwcPZOz4BwFyjuNYzAhJUXZIsduLlP3dfWUyPj757j2Z2mOJd74jTDRHIL/ltgJIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FC606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 05:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=koo80xtt
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5005867c88.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795669854; x=1796274654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=koo80xttp8geMgFWEU8bag5Cp8NMbqNHiK7kwUEroiZTZ29SdBiyGGotzYoiu33bTa
         UwY/ptC145WUKHWBA3x8fQXypO5iGoJWBzrQa2siyDjf6QleJy3SlzLiFSjtpNBjWe/Z
         5w6olFcNx37XXa94u4v/C9gbqIJS10mENTxBmCudh2SAB1iuNImFNr1XQSZ8dLWcLzo5
         s7l605ESWnqrRYxZNVLgRDqQsYxX2Cxxat93m6kGhcp/Uy8bb/OB3gMKYEi5VufiL8S4
         cFavEYRuNUHr2c943YG3QEsDfSPrMUyN8QHZKiCv+91BrB/EXTtqOaUvAomAAoKij+mg
         cwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669854; x=1796274654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snVo1HNElaQNXOPEvwHsx/ZOqgseUpxA8o54IYlLJqs=;
        b=CkT2rf6mpo9LJhc7bHs6SyNgDn3t9TjSPW8tpqX1+F29hFMbo/uvcOTpbF0sFF3PNg
         a6sSGSwkaoR0p/nG4/srmzFsricSrjerN+OuYBG9uWXjuDHolpscQow8BiL4gSfAF5Pu
         peKEDl8iLC3dw/CR2E+sYE4FAsgtMMoEK6WVlo8n7y2iGYpQg2O55DR3YfenuCJN5t3S
         fd2Udr/Nj+qhMCy05zSHfhtnVCMutHrfjAWITYCf/+B2vg5aHJC3IL12SXBdBHcpjiPP
         PiskSpZ5Bdd5MTvRyTgcg7N56XcGTFwRbCcWL9MHZv0g2EtBisKvF4TfkLrqfRlnlH8V
         zS+A==
X-Forwarded-Encrypted: i=1; AL+hErFXygzdphlL+jNDa4a5DRsyCWQa3d1nhoi+V1b3RejA7TJv28lnoxd71ERXAd3so0IKmhiFAlmRhDlV@vger.kernel.org
X-Gm-Message-State: APuU4Z9h2cR14tTuFBn5Zu24UsnAFcserxSlIJNqu6O6LCsPTQMeV5eb
	N4Nq68e3jBG4V2nPke38LtpXwXkO7VWOBpidT7jDud3Ef2h4WYvldTxDiAZ4sOXn9rE=
X-Gm-Gg: AZFdTZeI32uybXrWAaEUYki1Ah0a+sI+gP51CGv7/LPz3gAOjvfb7BPZi+piidwsbtt
	Z0e8A88r+PbwoRiuOi/uARGnDsOL+Llyv0R24DllXuvy0uHer0aDiGUx1O6rKcrs72MB8k50QW4
	nUa4ykGGHCLOY9yJAJ7O5nOu8q+g/5hgZYPs13066AJfe8gcgHbRzYE1BtpWhCtE1ISkQ+SI57H
	Mv/N389nJujoCq41XTCdP/HxFqPjnaG6go7WfynTDLhtOdCcyUVX/3jsROtxsN19Lzp0sU3dJHu
	C3WeGjCM4Mg4CAbmrzcLas8sd9TTp6pJssZtOv4fonqsWSxgBDXyJg8YGWj1ypqK/cCpegEW8ER
	VKfe7n6DktsQA+FoiR9uidJ8Gq6GIqKTkbAEnRbqlCR+xoMOMeaYuZmUF0j1T1P5Q5rKwTQ/MZ6
	VXEE9h34BabNgS1nkoPFNqlnfU5Fb8oCq62cds+2tnSt/p3SyNgx8idVGuUOaI03t7iwOC5NGpM
	KD6Veaw9fz6yF0MGgD0FDqvHUKVChJefvPTZhh3AKhb2VA6l0xx+XPHFP8QyM71z9ojieIVK6an
	3SlmW3CLmZSlQWqPHsCKk31vEmjdmQ==
X-Received: by 2002:a05:7022:3f07:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1b5567b5685mr22918571c88.3.1795669853936;
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm38643650c88.11.2026.11.25.21.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:10:53 -0800 (PST)
Date: Thu, 26 Nov 2026 10:40:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
References: <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>

On 23-11-26, 20:23, Chuan Liu wrote:
> I have already completed the support on A9, but cpufreq-dt currently only
> supports the single-clock case, for example:
> dt_cpufreq_early_init()
>   ->dev_pm_opp_init_cpufreq_table()
>     ->dev_pm_opp_find_freq_ceil()
>       ->_find_key_ceil()
>         ->assert_single_clk()
> 
> set_target()
>   ->dev_pm_opp_set_rate()
>     ->_find_freq_ceil()
>       ->assert_single_clk()
> 
> Both of the interfaces above are limited to "single_clk", so SoCs that need
> to adjust the DSU clock in coordination with the CPU clock (such as SM1, S7,
> A9, etc. mentioned above) cannot directly work on top of cpufreq-dt.

Have you tried something like this ?

drivers/ufs/core/ufshcd.c:int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,

Finding the right OPP should be done based on the primary clock only (right ?),
but configuring multiple clocks is possible via the OPP core.

-- 
viresh
