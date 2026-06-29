Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2A2F0680
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735186; cv=none; b=GD1i7tRpNuSUFEiq4WVNgE50l/rJQRFNOI0WwDJo7pwbXC9vNkyO0J8Yx9Tp5Ezm0Eo1e8mU2dvlJ3MoAzfyoc88hBSTmukwa4mw/NIcYPra75eaNSsg/LFJTgVHxt328/+CH9j7TknXOsbnLED5SHPL3uHKp0AHoLh+jQ4k++8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735186; c=relaxed/simple;
	bh=WREysdBr691NZfx11yc49SQ+tj5mZqJ3+6r+Kpjn4pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUO9vTeLOSPTXpP8NKwrGcSgMAHC0qlnjOrRQ+jK1kzrJnq4GOSXdHKjQIuX6B8F4JkBwtQwcZ3lGbN8yR8GdjO6uyQJgD+Pz6uCupKbOJLOfsH/qTB2xtAS/Ybe2shBPS+m1sYyqhctnsSHgOaln5cySYcwT3Fmt1zhuo0YCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7MgTE8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW4KezON; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7MgTE8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW4KezON"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASvU82603468
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=; b=W7MgTE8u6rNvamdW
	A9Q6ZjZIW70nDHvbbioqMu3kMg1Nd10w9gs4n4B38V5qeEwDbf8QoMD80rkx4BoA
	AaZS7Etc6HiGsWRLDRRe7G+hUKvLSytJdLC6GQy5RQP10xZLJ3/BLsEkzAtS91vz
	VTlwNc/XB26b8uYyNUPoaMO3maM6DbU+0JH/h50kUuL2Di58n+pfTTSej8XqXWqe
	sBUhSfSG3pHQWCv0c4XkCS+ftNA/K6fUrRTpSSVYDq7TdGglarzwPB+IPWoT27qh
	FI1u0Zv0+B+OhBhCk2RYfoG4vXwEIwof4zwRXLfU/mP2gb2xecp4cHbZC+gv3Cq9
	P86IcQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq88pxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:13:04 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd91d5907fso63061e0c.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735184; x=1783339984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=;
        b=LW4KezONwNMugla0YiMlrGzfjFFzK/KPGGBNgLKCQ2GoBAeiUjp+nug2LX2UIS7NI6
         RlAx+2T6OSihHQR/XAhor8ircBZdbt/xcGpknzm9Lm+aNDWdX8z9Vru5X9r/bYlwwnH/
         TsHbO79QZvNEIGlkxVB08fwy3YGWwh3COGSK/KqUG5j7mHAZUyGdWEKvYdHmdlDae7iX
         MfL6aR4C+j4gQGqXZqIaO1UzljISt7++pTWDDF0vm5od3SqsSyAuXW5p1WWDg3jWRjsU
         aFLvZ+dZ7x3zzz4UnTdRhZqokj9FVgOt0LkIgaMgc0gI741ZucQyM7m+cHvBmAcAdd6z
         BUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735184; x=1783339984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/uaS7qRJI8R12UYCfO8jKUbFRKEmIwJPtmalvvKLMs=;
        b=SqHKsfKO6TC8zlmgo2UaqApUNu7CJSz2LH/hVxn10Vk8loofjmID7ShT3SVZrsjYQT
         oyId5bQGpW+o+hJfef7s+BJqzwQHZnLVmDIHkwIJzU4qpq6fXx7iwFMNpNfE8vNgjFRL
         EXwtr/MBMBq9jSEoxeGQtPk6Oxsk0ZAmbp9gDJdyNxXyNDlPFuJb0+EAosnsNcVHpvml
         p1R7ErljZbB+CPz6uXAXsHuhq1z9OVl6kirqEQoekebhlKgIc/6syyaztj5UixwzYgZ1
         tkdFBLBOYj4WHV66T3wa1UIam7ACOnI3oOkIHUKNGacRQb1Jocg3z7KBigvTE1DH3hpj
         AWFA==
X-Forwarded-Encrypted: i=1; AHgh+RoZqI/+Nw8Jp6BhJpy+I5WocLJT4pCtymdV+iC/DFlwmhX2YeXm5cD/g/kim71EcG+SKtPmFut1YX5V@vger.kernel.org
X-Gm-Message-State: AOJu0YwIEqMnOHbzF+0luJFtqRasAZ4sXthkHtqfFLg4fsGjfhmnqilq
	5HJmVicWVpQ5HntTDOdqxtJVQNEK/6vL4IzjAx6yfxtEFvR9qrYmZtYJn1vA3DimgH9e8lInoWN
	hdNUFqNXX6U09S68v5+yKz4H5e1VFnBII+6HBTXsc8kS9oQe4QVPKkM03fphWRPhT
X-Gm-Gg: AfdE7clgnA/prhcXvh2JJlDVrK/vNmbaiHk1EmlgGQWaApRVsbcAe45QtI818AhTr+q
	H/uc0vSdQX3I0yK8b/BmqRD6SfClAllLthaLzKi1yVu/CwlSH4v3dHV6EtPtdap3Y1T/PckcPvb
	yq5ZEv8hQZ6vv8raVNm5eZxaeV5jHl+8z0zbye1lNYXItpNS2dHwhGTxutE40S6BN9fWphrCB5Y
	74Gzzk3Qc1GewvyYdlmNKWKuF22I0CMcMGZFYax8tlAlGy4Acqxwoy9K7nydhkIiBWRKjC6CPA3
	Z1ghRpnyE64KdKcEr4eGzGtOTIi7itpRsE4YB931kjUoH+aWGsJk50AU/BbGID3oCjr8Qq9gxol
	jO8cIGc1UqGh4Z9QQVcmI/LqQAZxbyicVmas=
X-Received: by 2002:a05:6123:5c8:20b0:5bd:9565:2e8a with SMTP id 71dfb90a1353d-5bd95653060mr664833e0c.1.1782735183612;
        Mon, 29 Jun 2026 05:13:03 -0700 (PDT)
X-Received: by 2002:a05:6123:5c8:20b0:5bd:9565:2e8a with SMTP id 71dfb90a1353d-5bd95653060mr664826e0c.1.1782735183128;
        Mon, 29 Jun 2026 05:13:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac461csm6870601a12.6.2026.06.29.05.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:13:02 -0700 (PDT)
Message-ID: <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:13:00 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y5pf5JFeafjvkkYbJqAIdqZ7qthgn6NO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX2yIenLnNOaLl
 8cFXcN4KMGgMush3mvZtKoKs9pP+8wQKmkpjwnDEwJE6F+SVgfuA/7DeM0SSvNrVsV8xUL7vaZP
 kg9+zK8bLfW5nyKdZL3afmevj7KXiFE=
X-Proofpoint-ORIG-GUID: Y5pf5JFeafjvkkYbJqAIdqZ7qthgn6NO
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a426150 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pryAGsrBFMLCAmXlw1UA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMCBTYWx0ZWRfX2cQy/EedI+v0
 t9xR7ZwUydcFgU2r6s1cvrj7cj3lSifUgmf8OVpbx5xcihmhlBfiQRl/6VqglTUo8REGOLH0H7U
 is5aocHDNCVvg+6Rr95CMHEb0J62zgAP4JeraMCQZByQ1zzFgL6wT6aThgd4NjKXOcqSELrmSYJ
 6ji08GLZz3r8CdzAGmT9NRJQ2r0C0Qvu5s00zRs0xOrhD/i9F7KjVEMZExPzRnCaxevcv0Jc7O4
 +sQcBftvvT0NHQQdpirBLbwfX+Qrk9UC8ONpfcyNaD+iwpu0zSn6myng+88XpokLxWOAYjq/Rxt
 izt5iuMyzcK4QM/GKTjALo97TlPAaYRfN2ySpR0b36z7oyyIjO0efnTQtE0VDMBj5aHIBJFtvi4
 ctgyXKAPuxQhygCR5rN1UMesX0bYJg7nQUFkGb1Ljafpa0O1hWhKye+YTQEtYRiw/51owT3GkZ+
 z8fBd/zb7LzpRSMidFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290100

On 6/25/26 12:16 AM, Kamal Wadhwa wrote:
> On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
>> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
>>> On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
>>>> This series adds support for the standard `regulator-off-on-delay-us`
>>>> property to the Qualcomm RPMh regulator driver and updates the
>>>> corresponding Device Tree bindings.
>>>>
>>>> Motivation:
>>>> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
>>>> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
>>>> When these regulators are disabled, the voltage decays very slowly. If
>>>> re-enabled too quickly, the sensor experiences a brownout and fails to
>>>> initialize.
>>>>
>>>> Verification:
>>>> I verified that the core `drivers/regulator/of_regulator.c` does not
>>>> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
>>>> Therefore, the driver must parse this property explicitly and populate
>>>> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
>>>>
>>>> Changes in v3:
>>>> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
>>>>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
>>>> - Updated Patch 2/2: Refined commit message to explicitly mention the
>>>>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
>>>>   (Requested by Mark Brown).
>>>>
>>>> Changes in v2:
>>>> - Moved the motivation/context from the cover letter into the commit
>>>>   message of the driver patch.
>>>>
>>>> Saikiran (2):
>>>>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
>>>>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
>>>
>>> Hi Mark, Bjorn, Konrad and all,
>>>
>>> We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
>>> helping.
>>>
>>> Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
>>>
>>> 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
>>> 2. UFS probe enables the regulator
>>> 3. UFS probe defers (due to some other dependency un-related to regulator)
>>> 4. UFS regulator disabled on probe exit
>>> 5. UFS re-attempts probe and re-enables the regulator
>>> 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
>>>
>>> Issue Log:
>>>
>>> [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
>>> [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
>>>
>>> NOTE
>>> - Issue is not seen in first probe attempt, because UFS regulators are left ON
>>>   from bootloader, which gives enough time between rail turn ON and UFS init
>>>   sequence start.  However in issue case, it seems re-probe is happening too
>>>   fast, which causes init sequence to fail and UFS brownouts (similar to camera
>>>   sensor case)
>>>
>>> - Also, we compared this board with other RBxx EVK boards for UFS rail, it
>>>   seems that this board has more caps on the VCC regulator, as the board is
>>>   designed to have both EMMC and UFS, and we have DT option to pick one of them.
>>>
>>>   So for EMMC those extra caps were added and they are impacting rampup on VCC.
>>>
>>> Since this is not entirely a UFS part issue, but a board design constraint, it
>>> seems better if we handle this in the regulator side itself, as adding it in the
>>> UFS driver may not be acceptable from UFS reviewers.
>>>
>>> Please share your opinion, if this seems to be good reason to accept this patch?
>>
>> Is that board in production already, or is that something that can be fixed?
> 
> yes, it cannot be fixed in HW, as the board is already in production.

Re-reading this thread, RobH's worry here:

https://lore.kernel.org/all/20260129174829.GA1324020-robh@kernel.org/

seems to be misguided - AFAICU this property would be set on each
regulator separately, not globally for all regulators under a given
PMIC - is that right?

In that case, I see no real downside in allowing that, especially given
it would/should be used sparingly and only in cases like you mentioned
where the board has some quirks

Konrad
