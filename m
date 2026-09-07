Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719DF3EEAC7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820679; cv=none; b=AJ7yUPUHwtE0Jz0GZ2I8WjwoHiwDZec9nByhkNvyKtzsIpd2Y5/rw4NNzPYljic+Pd2o188HqzQTVdVJ5coX+lq3VEEFUDmFjYUYsM8Xqq00cDiaoHm/wznNz0Pce8sZOTf43qnx1QeqqIgAr//A15lQiLnX20+A2Sqt8R4+mkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820679; c=relaxed/simple;
	bh=TZ4DWrxjbgCOgZGMyUgrWtEjIm1edbnu1qkrI7QgGP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubVnZ2DluuHIJDaYzpNSgx4z+dsOLJAcyQ7zBDAQ+6ostlcPAOWXx6+ljBVsE/hpl8SjpM7uf3jyw0QxoJrsRnI5UnVhbsi8OxHU/dWKOrPj9Z3uQZR1VrDbiIoSt04L6TO64MxhQZwPipzqkq1+1RgIDhB1KT3cOGQedPtuM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKFgZ5l+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjU/eFIh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKFgZ5l+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjU/eFIh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687KkuSO948240
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 22:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=; b=UKFgZ5l+J5A92JZC
	QyHm2GiOwoLt9px5CfUWrMjodF7pGpxHu+DHd7MLQEEa/rtZ4bNRu/WIQUXS8eYW
	3aXtbovulB6iFiUEUfboe6A1r+UZqILk5ZyW0sac87nK1A4J+pAqRNHi1ndCslQm
	xCPm2GKIVfxKVpo1FDiX+fnInZW9XST6DRxguxXBlS9R4L6Eo2BliJqDQ+xlVGx3
	K8c6xjGM+9665n50GEOiJnzaW3aLiGT8xIk2XsZYCrtcwlwzHeHdQorbC1VrXUCj
	rBXhDcHg6Ns70cU+nG3f4FvODTys5SujfAiH2YlMr12Ta0KSNTuXgh1vt634yRN1
	WzPO3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwgquy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 22:37:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so479504685a.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788820676; x=1789425476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=;
        b=WjU/eFIhXlnWRBO1I35CpKYR2dHiJvh8O436NuHqQ8esgJ9AeeHG5Hr4yMDJFJ4EFR
         S0IGQksdRW3VUrXGJLKmzT49ibaZmt7BOUnX7NdfrB14kXvJNWrBkNWC5FUNHNhJYA7u
         2YWXvJhFrKdfbAHc6i2CJR4UX9wtLK0B55kMmnAuDd2IydaC2GKhlKgktPOVAJFjsAlg
         cK4EZOwGMbOE/i89NjJQit5f8+hw4SNR9ZEpWLIhN27+H6XwTV4QdjhxC9w3DnpfirFt
         aE+vx/KqVTGnlMM1p7sKdzI9sW0DmN7MNt7JYKYCADWHWD34d0UN4zB6+XLZMUC3Shgt
         EK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820676; x=1789425476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=;
        b=GwdvPbtbsMvisz6xLGuXZfSblGZ7IS87p0gbg90yZ3cAAaX0G46L/oZcEwZEHgeBw4
         99gB6JKiXP5JFYvRnMfT7iz+qvq8iFZN9R2h+5Dcc4bb0T7dfK8Usb6zgcepZS/h8pLY
         xI5pur1oui0fkc3qtEvjOQldVsv5OwQHDn+pwlG7y8HtnLeZ/sTPZ1vJNX6rA5gF9S5o
         Sdk3ueXnAAIl2EYFiDVpYpzfH5W+AcKJgtFtRHkMx74zV5Szk4q+aomLle3wBiJXwzfF
         8Yre/2NXNgDA+8PhJjlEREdnHeruPcdYxhnnTJvUbTmt1fWFrLsD9LxFzEnAAO+SjYdZ
         nUMw==
X-Forwarded-Encrypted: i=1; AKwUvByn6KlRE1kN4eVSxoObSQVort1R1VrEP20n0gtceSekQDhnR+qoJlWW5m3J+cgeV96xef9mx7Ttjmpc@vger.kernel.org
X-Gm-Message-State: AFuF++l5Mupt1IlZDQzmvtIMxoK9sXYVjJH1GWJl/Wqx1+/Niz6suPd1
	YDu8peyU/I4RElEv5vrNthoeWkugAduu5v+YhVU9ss8KtaDv5Oyi0YVo7/GR0azEGKD8mbN9sSj
	74cJOZG8mQCkU+Hs2HD6L2nj5on7vdqpXMjnNUwwXxDvRQWXB3eMAQCPXx34sugma
X-Gm-Gg: AYBFou37+3fvO6t3UMgaW+YxYFK9nkjNeNPhI9Wij9ixxNIqRycMZbzJJVhyGYAznv4
	kSnWbWMVTM7JhL8aollosqxeryIOMJsSYa7yoaQaNBGvoAYlyLwpdi/8o8xOsaefu+h062XKt/C
	gaqK9waKxgCFNea7/poAJCVpiQH60/yxklDxYpA0xUTVtilauFU0CzJho3rEGPSDg3sKUQmKZf7
	K2yHcmRqk4wwLdJCNL97MqXXh5UK4NQYTZd1aiBfJ8O5uLRQb+yR0QbdEoFhIZeYT5hMnXJGGFm
	XhhGFmyYAuVk8iuPErlMRH17acZiymN6hgXvGdp9aJJk6R8Zrtku+yak9tfqQLzOswBSOz+eHPk
	56n6QYoa+GC9TwvL3fXymVUsNcms=
X-Received: by 2002:a05:620a:6890:b0:930:f337:ebeb with SMTP id af79cd13be357-93980379720mr2890722685a.12.1788820671646;
        Mon, 07 Sep 2026 15:37:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6890:b0:930:f337:ebeb with SMTP id af79cd13be357-93980379720mr2890717685a.12.1788820671090;
        Mon, 07 Sep 2026 15:37:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm468229645e9.1.2026.09.07.15.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 15:37:50 -0700 (PDT)
Message-ID: <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 23:37:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9f3cc5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=D19gQVrFAAAA:8 a=D15zt_m3DPPUnS_4hLIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI0OCBTYWx0ZWRfXwIBNYSEqMxrX
 naany4OgcdhlpTctsIeBJSKQXUcz1awFYsSLcs/DWsD19FdclhYhbSMTXFeESqE7Rm/4L3FZx7i
 8eA3YVEDFMMcUlhJHaSnZlNU8xJMTiV6EWexYA7dRF/IsNGuuZQWIpDR1qJXadBbomFzG6IpfmV
 T/+aDWeDcwWlBiA2PkDE5TQ5xUgHa4WodwX8KwQyAXEGXf1QTIpESZDKr8yJBppD7fzK2mOMyp1
 zcHdK5lFgJCW0SMwDtYgLcvAbf9KEX7xkqQGxRb2imOlQfOCAquHZ5648EMj6J3Dt5LPG/Cgjht
 14/4M9nSdrA4MgCuNou6zL4b21u5vg7Z3mv+iYyvLZfYXsXbJh8IceLAmfI8oIvry2UjhaPIob3
 sZB1GD3xZxjkLAZjDX5Cp7GkkPzw7a4fh7LjSUxDeOYsObrV26hFqYy8TxsKtYtTrgdOyNxWMaS
 H+ANrwvH9z0aOefnuFQ==
X-Proofpoint-ORIG-GUID: vfZWStf-KLRb7wBLWbo23jCXtlXZ_Kod
X-Proofpoint-GUID: vfZWStf-KLRb7wBLWbo23jCXtlXZ_Kod
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI0OCBTYWx0ZWRfX+7JCTvdnUx+E
 X83fNWFb8CIGkWPL8yLjGAtR9e19mGYHfSIU+ww7JwuwlPm6fIHQLDajlad6IyaWIu9XlsrsNkv
 7eX2ZgHsEEcFa1zUDB/ZzfSiaKkXNPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_06,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070248

On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
> My take is that rather than encode all properties in C, it's probably
> worth exploring a DT representation of the concepts that *can* be used
> fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.

Two things are getting mixed here:

  A. Representation: how the SDCA info is expressed as ACPI
     DisCo, DT properties, static C tables, or a firmware blob.

  B. Reuse of the generic class function drivers, which ultimately
     consume struct sdca_function_data.

Whatever A looks like, we end up at the same struct sdca_function_data
that B consumes.  sdca_parse_function() converts ACPI DisCo to it
today; populate_function() does the same from static C tables; a DT
parser would do it from DT.  Same runtime after that.

Static C tables at least mirror the SDCA spec's own entity/control
structure, so the code stays readable against the spec rather than
inventing a new shape.  They are also a byte-for-byte match against
Qualcomm's QcSimpleJack.asl and a live Lenovo T14s DSDT, so we are not
maintaining them as a fork of the vendor source, they are a
mechanical transcription with a verifiable origin.

We landed on static C tables here because the previous DT round was
clear: "if it's derivable from the compat string, keep it out of DT"
(https://lkml.org/lkml/2026/7/29/1166).

As Mark pointed out, DT + SDCA has two use-cases today:

  1. Devices that have a reference ACPI table but boot Linux with DT
     because no ACPI enablement package (PEP) exists on the SoC yet.
     this is what I'm working on.

  2. Devices with no ACPI reference at all. I'm not sure any of the
     SDCA codecs in sound/soc/codecs/*sdca* today falls into that category.

Solving both in one shot requires SDCA DT bindings that either
translate to struct sdca_function_data, or represent the SDCA spec
fully in DT and share the same parser flow.

I agree a DT expression of the *concepts*  not a literal DisCo
mirror would be a better A.  I want to bring that back to LPC 2026
DT MC as a concrete proposal grounded in the earlier DT-maintainer
feedback rather than re-litigating it inline on this series.  Because
B stays put, switching A later is a change inside populate_function,
not an ABI break. so landing this series does not close the door on
the representation you're asking for.

--srini
> 
> Putting everything in C seems like a code management nightmare to me.

