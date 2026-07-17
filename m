Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB86337B015
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259701; cv=none; b=GLu7Gcn8Uvy1U+bI7phylANyfCeOIy9StU6BG1oHphgrxXvxtBlgAJtq6YIypnrZPrTnM1Ord4JwanZ6LhYYOYNZrxleN8PekSuKIrMuwej7PBnJGngQ7R0K94coHJWLQCQArB5aIi2qADr3drrGzNav3u3l9lvQeLg3zaIcpck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259701; c=relaxed/simple;
	bh=p53ALYQS+L5bADI3ICQaxcHUx5mc/nr55b6UmAc5ry8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLIJ0t52eSFT22Ll3GghBMXFJI2AKA6LbWDt0KpdJJu98UZ/noCSAGw176xYeu0nAY6kd7+8V/+/VPV9GVqfsEMyEvGKNABmJvOiBOensEdoZvnPBq/SnVpXNu21QMr6JwhfmO59UquJKzdwxijhbIWExZ6hSsVhziVqDabwbIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7CAZJXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV6DEmqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7CAZJXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV6DEmqa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H341f6533847
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=; b=H7CAZJXz4re/nHaP
	3Lnac1Ktq/K/Y6zifF/w1YIE38869QBnUgoRL0tI7rKQOe0Zw/XUSvYhZGUFonRa
	MgVjOdF9RWEL9Cjbu3UsHz0iKOJr3LXeTfPa6etpLZwmSaUOYImu69Qhc/t0FWqQ
	GNGQzu4MDcYTxRq+YXPm180kOxfHR1b0/PBarP6bSTFIy83oM2n1dG3VEjtP5jHf
	af1cuEFwu3CpTa65lKpx1E7/BkCjBlQQFSKwIp+DiA72j8uIN8KRv2x3jcD4dwEu
	0VDAY+fdiJyqk8epN38wyTZFJqkZ72JCMvooq+S7aERSNORu9Um4dhQqKwV9I11T
	/5ZomQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1v7c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:41:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc101287aso8526375a91.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259696; x=1784864496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=;
        b=jV6DEmqaD4HxFKZvnkz5fvxykJLX1g6R1SUidAoIA8wvj6Q8KZrNHOh/gsyZtTIl85
         QvOf864Rlu62zynwQ3RF53/7LDcT2ywhz/lLRreFQHgBkiN9D9ocyY8vXQdvXn9qVIGL
         4qp6CSs9ltWp5rsxKGzldu3W+OkH1WYaf0Xw3DQLhsZFXN+XJsYcLq1vYmeQfA+KHw1k
         Hw6Sf8Yyc8jpr/VjgGr8S7wrwU2vMwxM2ObEOMdtRMOEmbv7hiYbMobN8hnLNn8zSOSz
         zBN4pZRpB8yElBA46wH7pJeuJ3vwOOPPQSU48mNqWsjpImAIJaK7aQa2dYgYif/1GJp4
         vQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259696; x=1784864496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kq0ypRTY8LlhSggMVl3rvqS4X9hu7uUgtI9ZDu2lTU=;
        b=M/Yf6jBL3NVR/iFf3fd2sS+vI6Mkr7OXY3vnz8mwd42iXhaFUzcpF2yUWru1Y0OThn
         19HX7ABn1PQBUd3TkkkCHRDN8uENApoc7iq+yHc3akDuFZQjNrU7gXPUEZr2a+zkTQdv
         teQt4vopixiiMUcWhbkVGzs1KCNLu6tvYXOicV5xxbER5oAg4VEmuk/OqlozcXtcUr6l
         MzaJcnx++mbfosLsJKFr0hMV0UwWCUPm1+VaH8TG8zkp7GCmjqa2KPYCBlyZTBs3DZ7Z
         baJqCScgpWsyQMxVTv9tMrIPxgDUl81a5/q0WgprIOsgxc8ln7DvFhAsO/Zn6DzPUu/s
         /DhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0MhoT5jUPXj82Gjxz0px10IgDb4I7kS+P+aQ3hOodoAWKOzhnQ9F21OyEjMJgC/rKrWExIs59C+hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwemgREsz6REs276GDnYgYebodDMl4W/povm2MNi/6uAU+ODITV
	L7YElwywZCdGvp5tktC+/QnEMbpc3ELLKMuvL/Yq8gtcGhGCKrcwTA7gU/Jrwj2sTkEKAt0w2pY
	WgfBm9LIqQRumP/j8q1tL8OA+E3wVDQFGq7KE0CwTbR2IolJ9DMVxwoNdf8Fe6Oep
X-Gm-Gg: AfdE7clvT+Bw4PU7eifbycZx97BfMWmnB7FkbEZ/zpUaj1z9lqNUInIYbc8BJkFSEre
	Rg3VE25IgL0oZaB6nQnqq5BrvL7nv2UI9avqtxe8WOGrFVkzI34XDyvVTv5xVdYT1tzUyBIebj8
	bCs7pT2MxG9Q2cTY1d0lj4rL3avKVK66OkE/366oTbCgtNiqlSRk4raT1r7JJkAeK0Ox/tRWSLB
	/megILeAMP1ZY+nzAUR8dcN5dkvPt3PkPNC7D6S6PsWQHNpbvOBJywp8QA/lDhiwu3w7DFxdsp2
	hYDjE/VNsuKftQ50dSG8WRgmHRlZqsLCAnIMNtnNmw/IqYx40zDj8en9egJ3x5/lYx1lFqANgug
	gLHxlmRtKr7datBeDdCfMTYhg7JHLHg==
X-Received: by 2002:a17:90b:4c8e:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-38e4b417444mr741499a91.3.1784259695615;
        Thu, 16 Jul 2026 20:41:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:37e:2005:6509 with SMTP id 98e67ed59e1d1-38e4b417444mr741468a91.3.1784259695109;
        Thu, 16 Jul 2026 20:41:35 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d44fsm1553673eec.1.2026.07.16.20.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:41:34 -0700 (PDT)
Message-ID: <64bf3979-51cc-42ed-b66b-c7af04536481@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:11:28 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: purwa: Drop the Hamoa workaround
 for PDC
To: Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
 <20260715-purwa-pdc-v3-2-be08934dc916@oss.qualcomm.com>
 <20260716-starling-of-heavenly-symmetry-09a73a@quoll>
 <almDHnEcruBl-I3l@baldur>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <almDHnEcruBl-I3l@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfXw/kYOLJgXlaS
 mJGNmhxQ3Q0tQttAxcfOglmq9hwxOT/+plT3tEUS+zRkuYViYZy2KnjyZzZwgpFDcH2MWmfY+Rd
 Ynl6QNHSiXvBuTKgPLq+BgUpF1h/ZT3KddWcgaFBauYc6XuZCOU5IO0bmw6zU9iEV/MpVEeP9uq
 8SjWBi+w5VF7Wl7MmF5aJUHVPy9TdKsfbgKqjeEXEwXEgkcM8Dql2yYVf/tGOtMQzbtzrsLt8pe
 kazpVwAlCRy9bOxvrD6R4u6uuSA3cviKlMtpyHmXCikCmM9pokXAtdIVBJZPUNutGJA0p0nJcEq
 2gX+sk2wZpJPmMQzAnfiGBZ9exWNzeZXJ4RC8CM6swIF0kdJq6i741u/fbvyJTO8VpW2OA3CDfN
 vkEbXNHQassYbhfX6UvpPC9iyDv10PIDL+MgkWBIe1gwJuxLYw/C0BHLIT+MnIRWHHAWkbzMYeR
 Eu4l6E8/DR7iQimLALw==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a59a470 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AKtfWkbxmUR3Wn90oXcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: lFQ-cMPIUb-mpV8yUr3DDiLtWFwaqaHJ
X-Proofpoint-ORIG-GUID: lFQ-cMPIUb-mpV8yUr3DDiLtWFwaqaHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX7a455JVRTdia
 nCOynnF88M7x+pg9S/iiB7Vo2ol4l/C/epPvZL6bBPUZyg1a7RRP2WBZ8qcrMw9LyzCS9SCf5yJ
 elm2Q51rB2HvmYtjOHwA2J0KLNQs6Ec=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170031



On 7/17/2026 7:38 AM, Bjorn Andersson wrote:
> On Thu, Jul 16, 2026 at 09:59:44AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jul 15, 2026 at 06:52:01PM +0530, Maulik Shah wrote:
>>> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
>>> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
>>> Workaround hardware register bug on X1E80100") is already fixed in
>>> X1P42100 silicon.
>>>
>>> X1E80100 compatible forces the software workaround. Use the X1P42100
>>> specific compatible string for the PDC node to remove the workaround.
>>>
>>> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>
>> Why does the DT change appear in the middle of the patchset? Please read
>> submitting patches documents - both of them - and maintainer-soc
>> profile.
>>
> 
> I thought I had figured it out, but I'm not sure anymore.
> 
> The claim from the cover letter is that patch 1 and 2 are completely
> independent, but patch 3 depends on Bartosz's thank you letter [2] that
> arrived a week before this series was sent out.
> 
> We're not merging the three changes through the same tree and there's no
> expressed dependency between patch 2 and 3 (only implicitly by the order
> in the series). But as Konrad points out, in-between patch 2 and 3 we
> would not enable the secondary GPIO in the PDC driver, so Purwa would
> have broken GPIOs for a while (not ok). I think merging them in the
> opposite order would be what we want (i.e. 1, 3, then 2)

purwa-iot-evk.dts where firmware sets pass through mode, so current order of the patch seems to be ok.
(patch 3 as such is no impact for iot evk)

x1p42100-crd.dts where firmware sets secondary mode, applying in 1, 2, and then 3 may leave crd boards
in broken GPIOs for a while after [2],  so yes order 1, 3, and then 2 makes more sense.

patch 1/2 - fixes the purwa to operate on correct registers.
patch 3 - Allow crd boards to re-set the mode to pass through

> 
> 
> But this series implies that Purwa has been broken from the start - that
> the PDC driver has always operated on the wrong registers.

yes, purwa always operated on the wrong registers.

> 
> Perhaps the impact of this was limited as there's not that many direct
> &pdc references in the DT, but the patch that Bartosz's thank-you email
> was sent for got merged as 77fbc756d9cb ("Revert "pinctrl: qcom:
> x1e80100: Bypass PDC wakeup parent for now""), and that would make a lot
> more use of the PDC.
> 
> So while nothing in this series states it, it sounds like Purwa might be
> completely broken right now and this series aims to fix it?
> 
> 
> It's not clear to me why the driver change doesn't have a Fixes tag, it
> seems like the patch that introduced x1e_quirk was broken and should be
> marked as Fixes.

x1e_quirk in the driver via commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround hardware register bug on X1E80100")
says only about x1e/ hamoa specific bug, it seemed it never wanted to enable the quirk for x1p / purwa. the quirk
rather got anyway enabled for purwa due to both hamoa/purwa sharing the same compatible.

Patch 1/2 of the series aims to fix this (and patch-2 carries the fixes: tag).

Thanks,
Maulik

> 
> [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
> 
> Regards,
> Bjorn
> 
>> Best regards,
>> Krzysztof
>>

