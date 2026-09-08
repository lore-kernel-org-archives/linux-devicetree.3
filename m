Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942553016E0
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843690; cv=none; b=Nb5Gd01ppU8AmG0FwAq6UhDuPQm0oohZFG4sPx0FAwzWTDzaM/2gkJFA24znuteY3efoxNv0kPwmaTFvGqb6WoRCp2BhCSfK18IR0pYNV7Yc+ko88nLAdD9DRUoqbFu+2eOsotOQsim9jLEpwENsBIUyVaRMTNzQqa0qj940WTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843690; c=relaxed/simple;
	bh=V+6ScvaiLo3JPN0wkVRmkS7bOLe8c075r83hcHldHlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qt+LYUa3qZAOzP95+ryv4B1S/+MKI9sI5rOMT+KIz9IJQ0+VeUitr5HRTo8trsNLsChUnU0UZ6lXXum6VGsB4XBSlwIif5jettBu++AtiDkIrktGpaVIgC5FLzm1GpRqQm4D/92fRhqbDTTPxpZTWDY1hfxlKrmr5qx7uMSmS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E4dze73v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fj+/n1DQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4dze73v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fj+/n1DQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlJNj107446
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 05:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=; b=E4dze73vOYcJmOsl
	DoBhJt7JXDTrf8nHORTblhEjWf2q6NL8sxbveTvIMT4cqs+rUw8a5bEuoiXX27Sr
	W6bb8aZcPZz75aoXjrgzBhoYvzmF/rgafPNg94rV8taMk1KGD+ucg7juWJeQ40oy
	EKlSa54PXcVCT026h4+KhyQWdh1AOxb8WXUO9tKXGdEI6GfbGBUq6eMISiUk/FIQ
	cx9hZDTniJYRjgfb6JcwWdk+KcTeGUapdZGta25uYfXoDWjl1TVrp0/3NJoUCDPD
	4Hw70Di0CoDAkQDQD050+1kP9Xuzvr+9iEeag9yUCEt2whrQcQ/uGB5ZkkRsXmYW
	+F0f3A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty3bww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 05:01:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d7151120d6so66503485ad.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 22:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788843687; x=1789448487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=;
        b=Fj+/n1DQhDPXgBzQUoGtbGUYDUCSAI0Nl3xs5AouQYhyM5Kk5MaJbhaG9/F3tVw35q
         L50TgmruRNr2sN1DCh9xuqK8cIQek2FH2z/u8CIkquKysnJOINO+Mrh5BoQME4CyrlUR
         YpKridvyUuCNc5DpAnJfD3xRRdhJliLP66MKCnk2WdxV9QADHeeIdDciduhfEIPtFBBK
         FrJL7HuZ4IR4dEQnFC1TPOehhbq1QAHBiWvoFseCpDoM9akUcO1W/h3sOCxD4FT+oJbk
         Iufu8jwfYvUab4VI4eDnkteAome2aJNRLyKk5/o+UgdJwFT3OmSgvq19cCfSEtMcXnlM
         PXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788843687; x=1789448487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhTD6XyG06zkUFyhXjqwJP5PsLsMnHTDifmAKJrZVq0=;
        b=WV1eyRV8/BEEuDjYYsJw5nA1FHD5wzzhYvP83iQwetxIXLDlZ0F+7vHjq/gQ5o6Odc
         maOfDLRMP2QRIcJ0auD6Bj30QpQ2XqIwbFVsI9mIAlHXWi5X9dBp+nB7iyjZZ/kb6Xch
         w96Kz/jM/YGxfiCV7fcRbSjdNgQcSJRf0OKSWymoqKiH4IgTcD4FhgmEue3LjeBwGmnk
         5PVgbtc0nZHccLHu0DwKmAhUhPHY3oiJ7c5fT3J62wnp0HclMV0haOFy0hcfMEB7Y7Qi
         TatyiTcNCxMUPSwh2iw3fhUwIrBy9dZdSc/DBO4HVIkzfHqQoGny30IyNXsnkJPGaFhF
         ydgg==
X-Forwarded-Encrypted: i=1; AKwUvBxhCvek35DpM+H/5r5RNXqc3PoG294LELPFl1Xu3kwkTngSW0PI/inU98jPf13DDpxtb0ZIrrDnI+92@vger.kernel.org
X-Gm-Message-State: AFuF++l32s6VgiZTPyizFHB2GO7eV3dlBWUmHHnVHje473rucJc+B/h8
	XXTpmZIFut548dh63czHRkp+16MB0IRk2DQ9jWJT3GMrjwt7Sb1j0m9QjZpw99qBRp6PRDg9GEl
	LobGWUrgKE+QFp9zA05iP43YQ65NkUkqQSIK6yV6nJE+qf+FM0OgQQbeE7aTzun1UmRwE27xp
X-Gm-Gg: AYBFou0aklwid12LxArN9ay7dWfFWoIabKLg/6FonPu2ru4FZMFxeOcsPhgD0S32/iE
	OXMaemWuDjvpa/rC8/oEXyOqHXecKOmyHyHiAVsfiseMhzGUeewy/CAgi6EHVe55CTtvaL+xA4c
	0YUzDv+l+1onfpf2xPx2Mf42mvQC8R2QNGZWu/09Uzt2+6FvAVia38Bx6z6BZovJyOqil39Tziw
	eENFz9w34/V5eL5RimbQ721HEBRNxAd7D9VSQOcEn3pInse5PRTPS7NQKPpV1GQQaHI3T5VWlqO
	UzzawBpEVfPj9/1XUVgCYmuih8WGPq+nDru2kFZn6ndE7ujRdGg/hOS1p1SFFd6hJ3AjtP3MjLY
	G77uLqFF8n1ARBeLcTzPTn4CI/ImW8rn2PJhzDAeQFA==
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr40141192a91.1.1788843686075;
        Mon, 07 Sep 2026 22:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr40141162a91.1.1788843685573;
        Mon, 07 Sep 2026 22:01:25 -0700 (PDT)
Received: from [10.217.217.129] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm24555583a91.2.2026.09.07.22.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:01:24 -0700 (PDT)
Message-ID: <a08e64a3-d5d9-4568-a795-6c5ed355ae05@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:30:53 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] interconnect: qcom: x1e80100: enable QoS
 configuration
To: Marc Zyngier <maz@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mostafa Saleh <smostafa@google.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak
 <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260527-x1e80100_qos-v2-0-305c6539e6d2@oss.qualcomm.com>
 <20260527-x1e80100_qos-v2-2-305c6539e6d2@oss.qualcomm.com>
 <apgeBNSiP01YfNcs@google.com> <86ld9d4h4n.wl-maz@kernel.org>
 <f58bd978-ca45-48b9-a928-45a2878fb54a@oss.qualcomm.com>
 <86jyox4fas.wl-maz@kernel.org>
 <ca962589-3b6c-4e5d-a11e-b49cf20dc262@oss.qualcomm.com>
 <86bja94234.wl-maz@kernel.org>
 <0916741e-442e-431a-9831-9457e3af1cf0@oss.qualcomm.com>
 <86a4pt3t15.wl-maz@kernel.org>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <86a4pt3t15.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9f96a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sWLy_TsMIpJ6H1EfkIsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 0m9hRn3DBp9w38aCiwO6qs9OLGtoaRe8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA1MiBTYWx0ZWRfX/kMR8nBIPhML
 eU8lnY8Ft1SgGnEBi8eaihwwXT5StkmSZTSE/qasv2Tiidjy23VWkiFq6BD3dO9neSOFnCUU+al
 3McfLfL3gK0S9GzNaNr2RPfDMVYVKVs=
X-Proofpoint-GUID: 0m9hRn3DBp9w38aCiwO6qs9OLGtoaRe8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA1MiBTYWx0ZWRfXxKbUp+AWpOJU
 tffE/zI0mUAhz38u2rS6FFC1s6zHpp2fwZAu5JkK/qLLpCC3O+mL852U9CW7UWYRoPt1ilFndmI
 SlcIQDtv4FS0hh6MVSCk3y1T7PZnjezozXEU30h3+wOZizD6TrctWVaU3rbtV5rOhAOqhCnM0uv
 uhpY4wFMU5OtQDTkPhsAu/zzBUKUz+S8pCOJG/bbCMjbyjPt7MEbXxT/eko0Sd1v8e+V+Lt1oe0
 O/tz/H/6lhgccDzllyI9HnmPbr4+8DK5qSAB7WftfPRjBKRXVZRdRmT3d4IS+TsVOJyf9Y104H8
 XjR5oDbZDvspAfatC2DggZEs50M23q1LjeZFTDaU7xxCoZiD8DNcXZyiYuwjVWAdIBNsmzcUk2q
 2lQPHEv5t7vbp2zPd8t5g68yimmHISqcWSCol4kqi9ziqnVLEb8fd2y6OC+poKf0n/Mz/cjJIga
 uU/fxRXcWmnW1/RgNEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080052



On 9/7/2026 10:20 PM, Marc Zyngier wrote:
> On Mon, 07 Sep 2026 15:34:35 +0100,
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/7/26 3:34 PM, Marc Zyngier wrote:
>>> On Mon, 07 Sep 2026 14:20:26 +0100,
>>> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 9/7/26 10:49 AM, Marc Zyngier wrote:
>>>>> On Mon, 07 Sep 2026 09:18:38 +0100,
>>>>> Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com> wrote:
>>
>> [...]
>>
>>>>>> The current patch enable QoS for Hamoa SoC, which get programmed only during
>>>>>> driver probe. This shouldn't impact or cause any spurious resets once the 
>>>>>> device is booted up and probe is successful.
>>>>>
>>>>> And yet it absolutely does break things.
>>>>>
>>>>> With this patch applied, the box resets within 5GB of heavy network
>>>>> traffic, probably because some transaction get delayed, and a watchdog
>>>>> fires. With the patch reverted, the box keeps receiving packets, and
>>>>> everything is hunky dory (100GB+ so far).
>>>>>
>>>>> Which makes me think that the set of hardcoded parameters in this
>>>>> patch is not universal at all.
>>>>
>>>> They are, provided the configuration is for the right SoC..
>>>
>>> Is x1e001de different from x1e80100? AFAIK, it is only a binned
>>> version of the same SoC. How do you explain the above regression?
>>
>> I somehow skimmed over the fact you said it's on the devkit and not
>> on the mini-x mentioned before.
>>
>> I pulled the Hamoa settings I could find, there are some updates but
>> none seem particularly related (maybe the PCIe one? I don't know how
>> the network card is connected), please give the attached patch a try.
> 
> I cherry-picked the Hamoa-specific patch, and gave it a go. Same
> result (hard reset while synchronising a bunch of files), but this
> time with a nice little message:
> 
> [  272.468031] nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0xffff
> [  272.468039] nvme nvme0: Does your device have a faulty power saving mode enabled?
> [  272.468039] nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
> 
> indicating that PCIe has died.
> 
> None of that happens without the QoS stuff.
> 
>> If nothing else, please "bisect" the QoS additions until it stops
>> crashing. Although perhaps applying only some of the settings may
>> have its own set of dragons..
> 
> That's not exactly encouraging, is it? And if the "recommended" set of
> tunables is not up to scratch, surely there should be a way to opt-out
> until someone figures out what's wrong. Something like this:
> 
Compared to Hamoa, some PCIe ports are removed on Purwa.
Let me share you an updated patch to try.

> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 3b445acefece7..3a4743c364dac 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -224,6 +224,9 @@ static int qcom_icc_rpmh_configure_qos(struct qcom_icc_provider *qp)
>  	return ret;
>  }
>  
> +static bool enable_qos = true;
> +module_param(enable_qos, bool, 0660);
> +
>  int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_icc_desc *desc;
> @@ -308,6 +311,11 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  		struct resource *res;
>  		void __iomem *base;
>  
> +		if (!enable_qos) {
> +			dev_info(dev, "Skipping QoS (command line)\n");
> +			goto skip_qos_config;
> +		}
> +
>  		/* Try parent's regmap first */
>  		qp->regmap = dev_get_regmap(dev->parent, NULL);
>  		if (!qp->regmap) {
> 
> At least people stuck with Purwa or other abandonware (such as the
> devkit) would still have a usable machine.
> 
> 	M.
> 
> 

