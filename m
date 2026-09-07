Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F49C449B11
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774223; cv=none; b=YWCUtJPpfXfw9HiaDfnEXtpu0NN49C+IQjMm+VsO3EY4TyvN21SGZkmmDoubeUsuwT0celJXpgrGikKorOc735EoZYYB9tB3ddvGX92n5sN0Ri16SMdGyfEUziwSrsAvwWeu83XWZZzJDYRLnwA1Yyxypt86MvberKgh21pz8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774223; c=relaxed/simple;
	bh=CZ/NYTFdqpahtrp2WCstu+rur2urPhfJWZmLTqcnefU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZE7iU1q0vbTB0womOriVuvtUIzvhN9v2UoeDQN1cXUVMsSEh9It9mIDEvmu0mDHwLds7lRHHeG0d1VBfoyWDmTvsbzookKlKWYlIeb9rL2mTF+c+kkREqUj7S0p5TbnH6aC4WYRkcVldTgnF0S0MKziXGTkNVFl1QRDB9ISGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOpUoWCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awX2PUsi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOpUoWCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awX2PUsi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bV3d3189567
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 09:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=; b=DOpUoWCmqyaWMx4L
	n7X/lrwJwasZ34Q7XqNRLv47M7ZyhLgl7IF0PgGZjuVK0SX3216QDFcTbXqoyA6v
	9f1g98WW+yoUlU2k9ehwmLMBdONwmkbVAeK0U1bCnO9Ubz9py2jvxqvmhMfuWxTR
	+7nfG9DlRToBLQ56a1GoTkIaDyoE6WEYpvMdQOx2Cm8SV4haEuithY3Qe5IFOU0b
	NLFgZWhCZ7wQqSVA2J293x9qhp2AXP7lPPFTNDCcBcKD2WEq9iQvuMCmd/Uvmqkg
	xrS7DDq5c7FyIIpoiKFaqeY2SZ80MOMcwwFW5dRXDiry2gtjK230WMm8WnlfAwqe
	tvy76g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx04j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 09:43:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso410154885a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774220; x=1789379020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=;
        b=awX2PUsi8wHS9zrDAyHelb8oPhB6MV/yGLp70PgO5UKEqY8wAOSk2kN1SvFm+l4PhT
         mAqaInaR+DqBQeqXqGvUcfF41O57n7vza3cnFPiQNMiQ8yhcE72GJFpLn89lnhcVyaLb
         JbCS+ODA8Hn2RAackzsdvB5gx9VldaqchhYFSvhH2GRuTnMk1ylSPqht+RtUDIxZsgG/
         WpMKIbdB+qJXbq4ilWm+0VYFext/BC7xy9WLNfJPopJYzNBl0tOtA6g84PjBr6LaJoGB
         aDkXNGeZrvkJ1DHrBEmvSEYpf55EEB5yXYk77ZONS6mYr8EsiUE1/di/rl1sGzCLZVWO
         J4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774220; x=1789379020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qs0T8N8aD5hgszx2SO5ZqVJjnsi2KY0Dk5GrrGTUh00=;
        b=C3bEpuySMbiVv+IB7cbKi/Jii6qFQ6j6TH9Fau4OI8S562w2mflQGy1OvRVqwUCMiW
         nOKRfTJHV9XajTyqjwKLlCq/Ks3hZrgBGNvxH8CsmlsmP9cKacNhey6dTUkJCSptRQ9/
         9u0r8quVNMk3sV2zhSpmTbSplWPBl7E+g96c3Vl0P868LkWpfMYW24/kqYBYxRT5WE5R
         hN5+xL96+Uyj/JwpNCoNBpkg1G1iBOW8MBbN8A3Wt68qcKadYEPgJFrN6Tmb7RgXcoSv
         zqH6bPWGifGBrYu53oQqrbCq7EAsNtcTfEDAqD62njtx3fBC0kTI+C265hh46V2Dujq9
         EHww==
X-Forwarded-Encrypted: i=1; AKwUvByNfWP9OJu6W7Xxi4X7wUlknY0MoN6EABqc6fG3dYQ84SCpqLBxWmbSV5j28XhO20MdTWYeiIBeqZ1C@vger.kernel.org
X-Gm-Message-State: AFuF++nVEwp5QhtGbeb6IJbIZwjgPQCUG4JY91DHFpwzp24x+1xez5mX
	v/WcvIcKrKbPOm/ijXlONNMNbjIfcNh4CCR3x0xCVRxq49zvWUaKRBlwpHmkw4wKYHslQiheecS
	tfkSR/Tg9htNYCsEjwjCLWYeQj3gOg07nEeGorbKvtrUhRBD2FfdCWPrSO0fVd4lozfaWJdNS
X-Gm-Gg: AYBFou2/kNcjKvkZh12pr4SIXFm//URsrwceVLpLYHXXmbHv/EE2Tx8Wdb4LclIIB3F
	pfySsulVTlTTo3GvyjDUZMSWtyL3e4vPC5amMqKwe4aJ3mRzamhFCrgQPFIjNjV37Y5/13QoNwQ
	X3lYX5P21uiO46i4ToQ2H1TOUoOc7RgM/GBDuzzvCn4RIZsWZ7RenfZz7B9gKp5X+NYqmtEZ2+t
	0oy8bMze+ezrVM9Df3JSEqSf6TptUWLnqZuAZdxDR3hgsK9wmRaHImA9mJ3x7B6fYKN6Rwr+M34
	oW+eH/UL7hPGJflLjCPGW+b8IXF8UGYwpgxHq9s4iLBWq4v9N3740WFku1xfoZtD8JSKCW2WI2R
	m5+PK21cmdNlRFY1SQ+szFgs6MAU=
X-Received: by 2002:a05:620a:3f0a:b0:934:9639:3a4 with SMTP id af79cd13be357-939804af893mr1693140385a.41.1788774220408;
        Mon, 07 Sep 2026 02:43:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3f0a:b0:934:9639:3a4 with SMTP id af79cd13be357-939804af893mr1693137785a.41.1788774219875;
        Mon, 07 Sep 2026 02:43:39 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm29438245f8f.10.2026.09.07.02.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:43:39 -0700 (PDT)
Message-ID: <6eb266c3-b1f9-4f4b-8aaa-7805987548a6@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:43:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260907085028.110551F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260907085028.110551F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e874d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eV98kISo5-x9oh8RimYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: G0gtE-8wGFA3Go6x3n-j-AEiHdfVb_K5
X-Proofpoint-ORIG-GUID: G0gtE-8wGFA3Go6x3n-j-AEiHdfVb_K5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfX9uHSXMoBMjuO
 6Ue/e6m/gA7SC8EwX9o7BSj5ObZNHUqXxN3tlC7ki8dKI3wgFEY7k5gvLI954ym7e9Ai10inBTy
 fhatZ4NlAAM4pC9cVTIX1ihEoLBMq2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNiBTYWx0ZWRfXxKqi78RD3q7E
 4sy50B/2nY6eSahHit02yS09mtuOqSxbbBNifMvynYHok0kNlKMNrD+OYD77/l6QvY5GfZ+LZdh
 hRQcTm/g8p09KUc64RjSmc5Xt391wNBdaDeBZGKIWvG77Q4rjJcBChGTd1vtFSPTSaola81YX53
 sDM44SXNImt1aj50vesaObiSJhSuXZvt1T5sbs0g1tCe6exOU2lVF3KbwZTUgOW3NUAsf0/ioit
 PfMV/TrEm3gtDJVu/Ok/Y8DDHXWzQPM7NFO2btq7Ne3xR50X9+u6uq7evYRi/5aWE2oYK1L7iU8
 ydWoMql4Avqyeaj5LnK+aMJOHU5dBdE1s+AFqGYy8Szu4YSCD8uKsFr0QIAoTL9f0yBG/aNqACg
 ERTz3lhRBIHlDph8ClFseu0fg/M5uCnQWsh2WY6RfPZwsxLTVorXFrXEwJnJHAVvMUOqXLXD9z6
 Ojh2BGOUA686m5UlXaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070106

On 9/7/26 9:50 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] Exporting `sdca_class_pm_ops` unconditionally with `RUNTIME_PM_OPS` causes dead code retention when CONFIG_PM is disabled.
> 
> Pre-existing issues:
> - [High] Data race and invalid hardware access between `boot_work` and system suspend.
> --
> 
> commit 0f2e2cef51e8b87316164c383139022824389918
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: export PM helpers keyed on sdca_class_drv
> 
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot. That works for the
> generic case but blocks codec drivers that want to embed sdca_class_drv
> in their own private struct. Split the four callbacks into exported
> helpers that take a struct sdca_class_drv * directly.
> 
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index d7444f442c71c..88a29116a334e 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
> [ ... ]
>> -static int class_suspend(struct device *dev)
>> +/**
>> + * sdca_class_system_suspend - SDCA class system suspend helper
>> + * @drv: caller-owned sdca_class_drv.
>> + *
>> + * Codec drivers compose this into their own dev_pm_ops.  Disables the
>> + * SoundWire interrupt and forces runtime suspend of the underlying
>> + * class regmap.
>> + */
>> +int sdca_class_system_suspend(struct sdca_class_drv *drv)
>>  {
>> -	struct sdca_class_drv *drv = dev_get_drvdata(dev);
>>  	int ret;
>>  
>>  	disable_irq(drv->sdw->irq);
>>  
>> -	ret = pm_runtime_force_suspend(dev);
>> +	ret = pm_runtime_force_suspend(drv->dev);
>>  	if (ret) {
>> -		dev_err(dev, "failed to force suspend: %d\n", ret);
>> +		dev_err(drv->dev, "failed to force suspend: %d\n", ret);
>>  		return ret;
>>  	}
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_system_suspend, "SND_SOC_SDCA_CLASS");
> 
> [Severity: High]
> This is a pre-existing issue, but does sdca_class_system_suspend() fail to
> serialize against boot_work?
> 
> Because boot_work is queued on system_long_wq (an unbounded, non-freezable
> workqueue), it can race with system suspend. If the system initiates suspend
> while boot_work is waiting in sdw_slave_wait_for_init(),
> sdca_class_system_suspend() will force the device into a suspended state by
> disabling interrupts and setting regcache_cache_only(true).
> 
> Since sdca_class_system_suspend() does not flush or cancel the pending
> initialization work, boot_work will eventually resume, blindly set
> regcache_cache_only(false), and attempt hardware access on a physically
> suspended bus, which could lead to bus timeouts or crashes.

This is existing issue, it should not be necessary for Tambora support
series to address these issue.

> 
> [ ... ]
>> +static int class_pm_runtime_resume(struct device *dev)
>> +{
>> +	return sdca_class_runtime_resume(dev_get_drvdata(dev));
>> +}
>>  
>> -static const struct dev_pm_ops class_pm_ops = {
>> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
>> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
>> +const struct dev_pm_ops sdca_class_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
>> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>>  };
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_pm_ops, "SND_SOC_SDCA_CLASS");
> 
> [Severity: Low]
> Does exporting sdca_class_pm_ops unconditionally with RUNTIME_PM_OPS cause
> dead code retention when CONFIG_PM is disabled?
> 
> When CONFIG_PM is disabled, runtime PM callbacks are never used and should be
> eliminated by the compiler. Because sdca_class_pm_ops is globally exported in
Yes, compiler should strip of the static unused functions.

> this patch and populated using the unconditional RUNTIME_PM_OPS macro instead
> of conditionally-compiled macros, the compiler will retain the structure and
> its referenced static functions (class_pm_runtime_suspend and
> class_pm_runtime_resume) as dead code in the final binary.
> 

