Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF872F83A2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983288; cv=none; b=eHOLg6L8SgU0GjKFgOJQYsRXa8gzumO93KPbLS9Y6xM7T7gB4r69ZqCNK2fb+UKTiJz+7Agcj06AIDt+B/Bv7xBYTbkM9pODqedH7NayYzeWQODyhuNRPXHKDwrFUbZDE8bfHq2fyVQtiOFhZmClrXg3HQEDcj9ZuTSOooH7G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983288; c=relaxed/simple;
	bh=mFAeI1Kbat1wqbu2WyXO8Jw3D1ixAbjDqGG0r/VkSMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrxgfzK+cA22AlFxIAgRLTNoQ/WIZaAmv6cEEU/9H3heAbzPcPG9L/zR26TT4eqIS4sLP6ZjfEp3OZ2mSqFDiJsZmer/IVUZSYWsdR8LqChqqFbUIPbGxs2SxyHfStTx7Cwiwdy1YgCX8sfvofXcRYf3rNseCo7hlMBxHnVn1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmM7Z+9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hr3ghffr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmM7Z+9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hr3ghffr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E91VE93000868
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BzdfN9MeKD+vw8vNIfy4bpFCE2wbRiJT5GCxWv5jxo=; b=ZmM7Z+9l2TnQ7NFT
	jtVKnbUfei6VSgGmBY2io8fVrlg3QWdOutVkBEu5mb5fP1VTYuBjGxKmi0M3O8DQ
	lbMySfC517SUF6p+dJN8bnmniTZc5e53YdEG46KrQfKsksaePtf2vg1BZH7KCqZ0
	TLhHg/qw8zbbuE2HVs4JUPbDrNqR+vYNDZRv7KHq0cjH+6taKmUP3qDKMIKqAw3z
	NoAgPKX4BH9Q+wMUFwH1oYjLBaOEtCwDXc7y5MEhAl8gEbKCQ3KKRobY+g2qXjv2
	fFZZjjMMA8bbtDtL0zXcf95uzoVGZdm/TZOWFHLF5dgTYU7j7puBE5MXIHoJE0zp
	5IAu3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbev2m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:08:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so51601885a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983284; x=1792588084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BzdfN9MeKD+vw8vNIfy4bpFCE2wbRiJT5GCxWv5jxo=;
        b=Hr3ghffrIuGBXLI8Lgm1vC0poEYmZKgUV9P0ylqWc+kn8UF5fLHDApZWXSQm4+16Tc
         eqZ/VL38j/Q+jvbPky0wiHoHDQmrlgcriTxceXGQc9zi5zEWu46iuAImecqkAKqtA13G
         u/Yga5GKsSfNo+IX+rjIo59Yn6W+v+oZ4LmDDtz75Qdcda4J1cHk8AeG4cKFkw0lKQzY
         fBBywclpGgIZdSrJ4Ve9FcD8jtO9hMkTqWYOOz2UJnsSIsA3WGlKAY7flK0ZLqDVVdfU
         BSpphwYR+imyLvLz8YYdebrqTeWlcAAP90xf64J7JyO8nKRsVCFPOr5KKBL6cD61JpUT
         ZlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983284; x=1792588084;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BzdfN9MeKD+vw8vNIfy4bpFCE2wbRiJT5GCxWv5jxo=;
        b=VG5QITbIAGataieZtZhK0JrjCdTf/ntajtocCLrjBbPAriIv2S89LCEaLeWxV6EmYb
         nv2qgu9PhgeBCG/EndFSViFqBJ0hmJmGKUkhoDbbJ6juDsT4Sllo8CbRboZKboZNungi
         2lNsRFNNvAwSIbttt6GLcGdj8oqERFSO/aUEj8sRP9DMpU7Zjccemivz9aePPmHnQmp/
         TWD0zNUvL0bSvYANDxh9+cmr3ZE1eV2oH153m0yIe6TZllH5Pg1QVgjwhjWlMH4a/8P2
         dmjzvADE6TaiqPzYWY7F+CUsRQ1YtfHbnjBj7C5OuxHYeUeQkx2/W9xKQk3mEn06w946
         vvjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL5vQj6KKuOCw51AUreezvywv9dg0ql+2abGuW5m0NpndL7E1M6G3a95oLm2JVNgRDd/07lFQYhhm8@vger.kernel.org
X-Gm-Message-State: AFq9FYKOsp6uFoK5hOMv8o3V+Z7QHREkkk0wqE/m5NeMN+DXvAljFIsa
	E5lO8QyF3rTzG6ddaJU/zHRj9Usf7Z1VheVK4OtrPMKuEYRmm8KrD3DOET0e2KBDRS1xVdPiap1
	7x2MeQUOiM5YAOvFQd7c6jgb5x3CxCv8A3PRv7JqyrXv/LttcIltaHZkVjT3qPTHu
X-Gm-Gg: AYBFou3Pt4+a0f3AtXSIltAyfQmnTyujgm+RPIlmcYeYTOgvtAkT6ew2atNg8DUhqQr
	Qzg0n+QMSag11J9TKvD1Zp5ebFnK/GN/HkflspzIT5wOB4Do07uGT9JDDJNpjHegTY88yDky9Ug
	sTqftDok4h1AvPrZPbxGE4mzMcBwb14rAoQOrJbaDOfgVwb3cGXPUJ+nEN3F4RIjEBrWGd8LSi0
	JySilJJwfBM3lBU0t0DpnUotYweKePgfWjd6PaCPqxAWtwuJQzAVkvXshG4zoBOcSh0uLKQfha8
	xQPakr/XgzSsgz7FmrEcUIxyN39xO0XAl0OQblAwkBQYL79UGZUL09cbSmQbUhTt+O5dmn6sCfU
	l8euItQzrtwu4mPvEr0cGYg==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2865610785a.3.1791983284152;
        Wed, 14 Oct 2026 06:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2865600085a.3.1791983283581;
        Wed, 14 Oct 2026 06:08:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm640484e87.59.2026.10.14.06.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:08:02 -0700 (PDT)
Message-ID: <1807728b-2cf5-4594-b353-267f09d35548@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:07:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake
 IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A3NkWIE5TXffrRUqPaTGrsTGqTno28W3
X-Proofpoint-GUID: A3NkWIE5TXffrRUqPaTGrsTGqTno28W3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX+U+bLLYpSeH8
 de1uCYvYaRdfUy7taRSFTEJED5RT/lGii5SRz4KmvDPrbMwlcqi3x9mcbXNSOYmlplERQTPmXLJ
 fBfvYrP8Mtu7Cq5HGRQLWrCsFGeUwR1YMVNypEcUJE+hIAwfzzbKQ43O/XTAQmyy/PsRNv18Oy9
 O+QRoqKgL81LxgTr7mlFCD9IlOb5tSzacLqxcvFaL8u5BhY+DnXeN5wLTMruPW6PHaj1XUOG+7r
 rY+yc0w3OWwz/IA4JCW4668sKkuEGxHtUumJsA2DN4VvkGWMv7ul9wpPb0Bzob+QancIRe7nQmU
 nJyJGqNdCv5PSBQqwfdi8SfUPh75OZmLxsqT5VXb5yuwpY0gHAs768Ryr/bDrXigtcezkobFLL3
 jPP+ESFmupE8BSFE7LERKPOCxY3wIY/aakOGOGBWfJ7up/mH2YptgGkvcf+XzKhGw8bZiJ59FFQ
 UTbYv6IE3tsQmUd1+QQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX3l1R+TazVbGn
 B2t86UcoQmjhgMNQsHEgNIHyNE4W7FuEEtq77Ye9SLuQIGi4h+mXzKdTiv8vzSZ2g+bPMnIGhz4
 S3isryg2BZ836xcNrFPRrNO1DU2c9P0=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf7eb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=4stbDPrVBKr3fIij-fIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052

On 10/14/26 2:19 PM, Linghui Wu wrote:
> Some WCN3990-family designs connect the SW_CTRL output to a GPIO on the
> application processor. On Shikra, the WCN3988 SW_CTRL signal is connected
> to GPIO88 and is used through the MGPI/AOSS hardware path to request the
> required RF clocks.
> 
> Qualcomm downstream kernels configure this path through
> msm_gpio_mpm_wake_set(), but upstream does not provide an equivalent API.

This information is not useful to the reader who doesn't follow the
Qualcomm downstream kernels.

> This series models SW_CTRL as a dedicated wake IRQ. Requesting the GPIO IRQ
> resource enables POWER_SAVE_WAKEUP_ENABLE in Qualcomm TLMM when
> WAKEUP_PRESENT is advertised, while the PM core keeps the IRQ disabled
> during normal operation and arms it for system suspend.

This starts off good, but zooms in too much on the specifics, instead
of the functional outcome.

> This is an RFC because the intended hardware and software model still
> needs confirmation. In particular, please advise whether SW_CTRL should
> be represented as an AP wake source using dev_pm_set_dedicated_wake_irq(),
> or whether Linux only needs an interface to explicitly configure the
> TLMM/MGPI power-save path.

You threw a lot of Qualcomm TLAs at potentially non-Qualcomm reviewers,
so it's not really possible for them to give you this advice.

> The series documents the named wakeup interrupt for the WCN PMU binding,
> implements dedicated wake IRQ handling in the Qualcomm WCN power
> sequencer, and enables it on the Shikra CQM, CQS and IQS EVKs. On this
> base, CQM and CQS share shikra-cqm-som.dtsi, while IQS uses
> shikra-iqs-som.dtsi.

The second sentence brings no value.

> Testing:
> - scripts/checkpatch.pl --strict: passed
> - dt-binding-check: passed
> - dtb-check: passed
> - sparse-check: passed
> - Shikra CQM, CQS and IQS DTB builds: passed

The above cases are implicitly expected and shouldn't be listed out.
> - QIPL validation of the equivalent qcom-6.18.y implementation: passed

This is a useless test on a year-old kernel with a million patches on top
that doesn't reflect whether the change works on the target tree (which
is approximately linux-next/master). You must test your changes on the
base that you intend the patch to be applied to.

> An earlier experiment confirmed that requesting GPIO88 as an IRQ changes
> TLMM_GPIO_INTR_CFG88 from 0x942 to 0x9c2, setting
> POWER_SAVE_WAKEUP_ENABLE.
> 
> Linghui Wu (3):
>   dt-bindings: power: sequencing: qcom-wcn: document wakeup-source
>   power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
>   arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
> 
>  .../bindings/regulator/qcom,wcn3990-pmu.yaml  | 22 ++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi  |  4 +++
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi  |  4 +++
>  drivers/power/sequencing/pwrseq-qcom-wcn.c    | 30 +++++++++++++++++++
>  4 files changed, 60 insertions(+)
> 
> 
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a

You must base your changes on linux-next, otherwise your base is
effectively 3 months behind the current developments.

Konrad
