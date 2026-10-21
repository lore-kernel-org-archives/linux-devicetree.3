Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584125;
	b=4NfSBqLdhaQse7GL0Oywa1RLmXnRmrPqNRW1orlLpU0qhA7KU7LmWwdoPQWCqyE/a2Co
	 ku6zMHaSRHY6KgcAeo91dvKDwR9Nen3DUhfEaxiQ8v3UlhPMWGv847T3aFxG/Lb4dHRH7
	 W5MSwUrwogEwbNY3ZUzSq/8PuU2Yhu6gJIPIlHoP/8upzFnIh5jPuetfqN2Q9NwccHtb6
	 43eANYJoon82sInDBs5CZhlFr0ujXUXETHuMWVOSMk5mF7o9R7uiVvUzH/dNnTkMk5ubI
	 r6sPEd1ALCEQ+KqY1OEwd833Ku9gjk9SARn9xXakZWi8/z0yVft+mH1tP8pFnkJ8ldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
	b=eGoRHbE5uNtEEq4r2EYhlF71d+iwzfGCnmYD4SrAZyBTcfi+7NWbkV/oT6j0Jvt13SX3
	 qULCTinHQGXYS8Q5/fv+keGqDLoej6tzJU+h8FPkLnNFfDVfKtLDpsArHLHYZRmg+oGuN
	 eLU693KTjQMGwa4rSEPkxfsKwJ0Ih6HPO3BC85JxTI+PiJBp7mzVGGE1sKguQCVSoVNxd
	 zysSHK/X+7LMHxNn4ODR8hHFmCkJaS8SkloaRY38ta4X/0cQjXuryEicZ3bZTfxNTljY0
	 ZSwSg1de4Xo4pgAGVbwqnyIRwFAX9RIe/VJD/NZ3ISfG7IqW4/ACRNA7I4TrQayQp1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D65606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDmcwGFM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a73dsg16
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgA50977441
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=; b=BDmcwGFMMdrh1UPm
	HJxhGbjkjI5fXRmTJxaC7CP0Rn7Z+ropIamYnHW8bzwNXwH5sbdOgPBu8gqycnDb
	Lef3X/1wYhbswAOFYi1KWr5yV7uaOXCGzjV7bQSnPf+ch6PKWj0APqKPXYrapx+X
	4DKWROB51R3m4Lq99LK2ZT1rd9XPEkdlSvRrl+ftlc6RdzrqHCR0w8ZHHSu938C2
	et5fNLdv5QSHJFMrnA24FbDNSmxCnvy28qNSQCWj5/3NR535FfNgzWRgm+n0bpBu
	i8P9l9dKr60eTpHgDaYtDuzsRR13kTpv++0op8AwYeK4dVrnkG9Z1D5Ki9ERVXqX
	4CX3pQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs0303c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:02:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so844863a91.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584120; x=1793188920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=a73dsg16FchPeICaCb458DDfGMIwv4XWhn5emHDqjqlgIEq5MnXFljn3BP2cIeGIqW
         Z5uqrbHPxjw71Nd4U64kR9HgV+pn+GWvKA02VHDUoHgZ1MM8B7Wfj4b+0DnpFmZBBGzI
         YIAEseEf0HvcK716/JfBykknYoJyIgswYrYViQX0OcbF9C1sUvL5KDzBLjupmLpTtgtV
         HShfAEgx7JrAixRuJzZRiCH/mW8nhqvojgAT6eTvMMERjxmgPIjaspj5/rDqPIRjZsuP
         AUSRBWfxx5lxiDe8RQ3IeBGjgHePVUzaaF1daHxZEJT0y9DEVdvgtVwb9q23hClc47Fm
         WS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584120; x=1793188920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVBWhBNwvJnn7Ws+ijlz2Lxzn6HvU0X/M4KXc1HZ98Q=;
        b=UfSA6rhReWVLGcreHXE/N4V0slMIJigxl3jMoQUZQsbehZObSY0crcvo8ZR7RTrkO3
         I21JE8nq2997KTeuTh/i3fwhUBYpZo2e9tsRu216s20xYEWuwIiuFbOawPdZIbDwJ97G
         dnFKwhUqHVisCrJYcB8VstGnDFUK2sVW6DAYmxDi2NNX3xPzwQAxOEUuWR5pZzGr23rv
         KbUzGbFCE6lE4rD8G7OAuU36VQqwBBQTdIDjeV8FRmJFFrO9L0edp1p2xVNqAeAv2qod
         XIv+LWivtz3mobC3HHhTByPvJVFqC5ttG36a90ZjtQOi/7hFxu7lH+lJC7ssFgcgYoHj
         qm0A==
X-Forwarded-Encrypted: i=1; AKwUvByF8JKxAHanXjGgLISGRtmYAw3XtAj0wWWitw2zHpbvZCNOe0Qj56RzeenUcNhtiPzIFHkBdBvUXJMi@vger.kernel.org
X-Gm-Message-State: AFq9FYLbKdxNHzMenVi3v4CY2bTKhGkoEjap+bRfApuvJ0d60YA9QFQi
	e4xnELCNhR7rVtmIB2HG8iXCZFL6P5cv/8MzwF2H7gj5Kcbx2SZ+uDQjm0meIoqeAXq9AK4dS2c
	F0Uv0yUDoP0dSm/iS5be5y7dIV0k+/gFm9Plr25HQ6fj8KTnsGGuWlnpHx2KuCp46
X-Gm-Gg: AYBFou1iSEIzHYH1AzOs1hAP8WZd4U94KGXzzps1UP8geSeyfyMUbLw8wcVfiRwWGGl
	K3rMcecV7YtHXOZXW+svoS8865ywSXNUidBWbSwKO78DQ3jX41JphmPw96DAzbWHt7/K9ro5e0G
	X2FFjDqbxxKI/PpBzSZcp1BGgAV4pChONGYIwCmEaFAgZ7Vp7pudmaMSrVoud8XMe1zXcYhYLI7
	5xasYIQmyfxvVU0OwDXqYCtuhRUcozivQzCJ1fIWG8iScztt5wk5i8WDDjE6QO/KGF18ClLhJ4D
	jbaXspfUugjRXbkhLCMhgkpqIMigdD1irF5hePmdaF72A/U3oz8MPY6H7ScmTqo2dAhvH2uhI9S
	0yap2pkQvgRC0ndIxgsMH+O0P5CS2wYUVcQ==
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395077a91.41.1792584120174;
        Wed, 21 Oct 2026 05:02:00 -0700 (PDT)
X-Received: by 2002:a17:90b:510a:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3ad86d500ebmr1395045a91.41.1792584119294;
        Wed, 21 Oct 2026 05:01:59 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303567sm4221616a91.14.2026.10.21.05.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:01:58 -0700 (PDT)
Message-ID: <984bc755-07f1-4c7e-9efe-ecc6b2ee5d5f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:31:51 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
To: Jonathan Cameron <jic23@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
 <20261016182608.65bae12d@jic23-hlaptop>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261016182608.65bae12d@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8a9bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7hEWZ4R0ReQgp7LtlT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX2F3IzSQMQg6P
 bo8KuwPdIPRq/4541E4dPkPjUGZukmgpdVbktun09jRiNfCqS/liuhTXQrzSgOUquWEoCqMh79u
 7kfQrv6/6SC5qKOGnABPDL0nUMjHKEnrt5c76JM7Me+gx4ZN8YY4Bur4u185eq4uqt1khotzmhj
 FitIHpRp/Ew/lGuQl7hwergFpMWqcHSPm1pUHW2Tv6lo9I7/6gj2+Wd3Szg0pxsDuzCb9O8H0j+
 3tlqPtih8E3tU9vpQuNn9fmCcDxGr9W+CkKEFrHp7ATCiSqm6gRPEwYK3c8PtYjhF2f52t4EJjT
 QHPx04wHfVIM1kCTn30N3/IdXuTVybEtDbgVMKJG/DaI7AWWrMoi23glqXojpG4eOSa8ywW2Nmr
 ab+fh5DhXbR7Y41YF1tRig7mjQ/UX5odlxKa5Uoyac3vAS++Xg5qNfUnZedyFhzr9SpU9YzCVIm
 8ocPhPBvVlP1R0Z5BcA==
X-Proofpoint-ORIG-GUID: _KptEvYtBne02IsVIIvXxvs6v-OSFozF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX2CjX19gVvq7c
 J6SwWLqVeVgRPrpxpEsnatOA61eKtal3R2EmKF/SrlqfhgrOX717WHmXLCQN3vLibbUdWcGylbd
 hO5ms14Ql5/tq7hA50GCeMk0xgvJYOY=
X-Proofpoint-GUID: _KptEvYtBne02IsVIIvXxvs6v-OSFozF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 16-10-2026 22:56, Jonathan Cameron wrote:
> On Wed, 14 Oct 2026 21:26:18 +0530
> Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com> wrote:
> 
>> Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
>> firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
>> report per-bank correctable and uncorrectable DDR DRAM ECC errors.
>>
>> LCP/SRP setup is skipped when ecc_irq_configured is set (e.g. Shikra,
>> where DSF firmware handles IRQ routing). A missing lcp_irq is
>> non-fatal; TRP/DRP ECC reporting continues unaffected.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> Trivial stuff only inline.
> 
>> ---
>>  drivers/edac/qcom_edac.c | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 147 insertions(+)
>>
>> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
>> index f3da9385ca0d..b4f7b2493650 100644
>> --- a/drivers/edac/qcom_edac.c
>> +++ b/drivers/edac/qcom_edac.c
> 
>>  /* Clear the error interrupt and counter registers */
>>  static int
>>  qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
>> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
>>  	llcc_ecc_irq_handler(0, edev_ctl);
>>  }
>>  
>> +/*
>> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
>> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
>> + * instance's address space, so iterate over all banks and read status
>> + * per-instance.  Broadcast-write the clear after the full loop, mirroring
>> + * the TRP/DRP handler pattern.
>> + */
>> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
>> +{
>> +	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
>> +	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
>> +	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
>> +	irqreturn_t irq_rc = IRQ_NONE;
>> +	u32 intr_status, err_status, clr_reg;
>> +	int i, ret;
>> +
>> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
>> +	for (i = 0; i < drv->num_banks; i++) {
> 	for (int i = 0;
> 
> Fine in modern kernel code and makes scope more explicit.
> 
Done.

>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
> 
> I'd use a local variable to hold the regmap pointer.
> 
Done — added struct regmap *regmap = drv->regmaps[i] at the top of
the loop body.

>> +				  &intr_status);
>> +		if (ret)
> 
> A read fail, without any logging seems unwise as you may have just jumped the
> error.
> 
Good point — added edac_printk(KERN_ERR) for the interrupt status read
failure, consistent with the error status read path below it.

>> +			continue;
>> +
>> +		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
>> +		if (!intr_status)
>> +			continue;
>> +
>> +		irq_rc = IRQ_HANDLED;
>> +
>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
>> +				  &err_status);
>> +		if (ret) {
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP error status read failed for bank%u: %d\n",
>> +				    i, ret);
>> +			continue;
>> +		}
>> +
>> +		if (intr_status & LCP_DB_ECC_ERROR) {
>> +			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_CRIT, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, db_cnt, err_status);
>> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM uncorrectable error");
>> +		}
>> +
>> +		if (intr_status & LCP_SB_ECC_ERROR) {
>> +			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_WARNING, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, sb_cnt, err_status);
>> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM correctable error");
>> +		}
>> +	}
>> +
>> +	if (irq_rc != IRQ_HANDLED)
>> +		return irq_rc;
>> +
>> +	clr_reg = reg->lcp_srp_interrupt_clear ?
>> +			reg->lcp_srp_interrupt_clear :
>> +			reg->lcp_srp_interrupt_status;
>> +
>> +	if (clr_reg) {
>> +		ret = regmap_write(drv->bcast_regmap, clr_reg,
>> +				   LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP interrupt clear failed: %d\n", ret);
>> +	}
>> +
>> +	if (reg->lcp_srp_ecc_error_cntr_clear) {
>> +		ret = regmap_write(drv->bcast_regmap,
>> +				   reg->lcp_srp_ecc_error_cntr_clear,
>> +				   DRP_TRP_CNT_CLEAR);
>> +		if (ret)
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP counter clear failed: %d\n", ret);
>> +	}
>> +
>> +	return irq_rc;
>> +}
>> +
>>  static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  {
>>  	struct llcc_drv_data *llcc_driv_data = pdev->dev.platform_data;
>> @@ -372,6 +490,8 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  			edac_op_state = EDAC_OPSTATE_INT;
>>  			goto irq_done;
>>  		}
>> +		dev_warn(dev, "failed to request LLCC ECC irq %d: %d, falling back to polling\n",
>> +			 ecc_irq, rc);
>>  	}
>>  
>>  	/* Fall back to polling mode otherwise */
>> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  		return rc;
>>  	}
>>  
>> +	/*
>> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
>> +	 * Skip hardware routing setup if firmware already configured IRQ
>> +	 * propagation (irq_configured); only request the IRQ handler.
>> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
>> +	 * this LLCC variant actually has an LCP/SRP block.
>> +	 */
>> +	if (llcc_driv_data->lcp_irq > 0 &&
>> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		if (!llcc_driv_data->ecc_irq_configured) {
>> +			rc = qcom_llcc_lcp_setup(llcc_driv_data,
>> +						 llcc_driv_data->bcast_regmap);
>> +			if (rc) {
>> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
> 
>> +				goto lcp_done;
>> +			}
>> +		}
>> +		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
>> +				      llcc_lcp_ecc_irq_handler,
>> +				      0, "llcc_lcp_ecc", edev_ctl);
>> +		if (rc)
>> +			dev_warn(dev,
>> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
>> +				 llcc_driv_data->lcp_irq, rc);
>> +	}
>> +lcp_done:
>> +	rc = 0;
>>  	platform_set_drvdata(pdev, edev_ctl);
>>  
>>  	return rc;
>>
> 
Thanks & regards,
Mohammed Faiyaz

