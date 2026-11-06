Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961407;
	b=iYZ9XBfhhc4jr4xy4KtvRNTYWaFqVjSRkyI8W4smiw8jm9ZJQEICJLbrQZqtrDIkoR88
	 YhlR8TN3a0UsGRChTAfjWj/zqv1qEixpAIWq52WZLVOCfRXRTCyTpIycr9jK2bXx2XuvX
	 w/F5p7Pqgt8SBC34TlPDkcK/hZr01G34H1GN1Ag/iUT+Tai/ffxhdlEXlwFBrsJcJx5mV
	 Gk4Sd8oaE7i27oQzdl0IWT2vVz1LsKLnuQ78Vdk5yxmpC3qy/d3aL6VFyYiWzAlhC9An6
	 Ej4CauqQK1MC7Hh/asTuw3gpsyN880mLbpV54kcCUq3F0qDbONgQJfmcNS595/hUemQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
	b=JRflg6UHhVeiFLnvG7wfob3Sry9OuwNIHCnkryoQI/cfUebRQH56NIH5Y1Ko7ik6JPJo
	 9FuLBoBn/HancbyIuqzorXs+EOsIISreEv020ASaLao0yR6RWvrlGKz3bWa+iXi3kG7Zh
	 /kG9G42EQkTvGwpErMKJ+NqjeIO2yD0WvdfegkwaZpeOFjuXaPDVVx9qazn7UmuJceRiT
	 /tD8TnYivpeqpalSyIVf1TU/pQQYhY/b39+VTocHalzVfVP9q43g2kqLYJuB7EcZXHe7v
	 2buYn6TnCPAICWLmp310QuCUwQ6rbJHuxrypJqaScqxCiISanCG5cLRpuVH8++duLEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OVlT2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDpPcUah;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4189D606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4189D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OVlT2c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDpPcUah
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP8md3703888
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 10:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=; b=c9OVlT2cojNESEDS
	7dgR4tpP8A1pHJdPy4VqU9/FRLrrTPUmE4cccbo4wWLPouzpmNA01u/vrILyoa1j
	HfenqI8h3LZrkrDLW4SGnb9sJsidlk/n6s9NpFXi2F9nZGR8hWEAv1XVe2Mpt13q
	uQM6+WYfEsg83lIvvG6tSLyQaYZsa4wIQZuDOGa1b0ER3oiwdkLu7WG8F0lC5QwP
	bQWeLetbYrYWjs+T9cYLDoerCe1Af6n+SGBGhJdK9ZLFlPeNuL4+COssbxpSwxG8
	br0pt8iaDCXqA/m9xoqG2awHNYSrxPgLOn37NLOw/t+Pgl5JZJIneSwt18hckR/n
	AoqxnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2esx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 10:36:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad704d4760so561418a91.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793961405; x=1794566205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
        b=EDpPcUahnJsI3pgdxkd2tYEtkSGFQ6Qe4naxryX4npp/2pG8rR+MJ1oXK9fL/kiwa6
         JoZ5QmBY6bWFLSuDWv1oMn7PrtUytmb7PGZjCgqkkCKAsdXGV217UVtgsDIsPQ1dfO4q
         fgFMNI5H01e6159jI8W9GO/bUcsZBFeDigmMzLDJy/bcd8kV36htz6HouHc/yKZpzbHD
         lPc6Uk+rYQn86mLXpLKdq6ceHWD19bzb1KelP3rebKIk2nh8y/5ok6G0yCmEexdKCfgx
         eWL/as6JM/2Yqx6ifzL4AdUca87V50JR5GwJCPVhBECHWLEck/Chm8v7Bkz2N4loiLCs
         1baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961405; x=1794566205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZxu+tbVDDy7xSEFH0lL5b+ofAM+EN3/G8wai787Xb0=;
        b=eOhUS9dP/Dqj+I61eDaCCdbi/+ZLfAoqIlVA11v2WPVq1xjREQE3h2+qNJdwRttcii
         NqDjxckdwGScGE5xrDX/nX8E5l4NlEMd2S53JUYQeAh6+RxxMgt2VKkoLYd/ZfgHFnH4
         7a5vQtu4tlG98YpBPW5ag/p0xefClvlTzoaKy1vYsEvoUxAHLJZQHeSVwV5j3+vInyVi
         LS3A96SjYIK0rLzpE/xcdEXp49B7UAeuwCmkknR3+1z4N0lmqmF2K/P36TXhhS//A1S8
         kemHofQIAUSp6AZmtRrpoYydgaQEr9bRZs1vT9uvmhAgw2Q9cCzIr4ThkH8Qy8AESOTx
         eJzw==
X-Forwarded-Encrypted: i=1; AL+hErFdzf2DxqAxF1WJ5XaQeFGPfcdUw8EfEGZPrQohi0PHnNP//9w/GUCwpegckif7u5m1cnjalWCQglZQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+47LBS+FZ3bqzfvQkCELtib34xjZ+gT7rhOFbuYqHFsqrDykTW
	iFG93I1DeW62B+j4AFf7pmP4QkR38Y9PTpZOnDLikcye04AI/dZpJekiYCUIQJC7kx7RI69l982
	FDukeDvDKIlolI6faUNfiW811NGhrGhRNTqkSNgPUoRYvZyJZhwlBWsJaDZgCro+e
X-Gm-Gg: AYBFou1tBFsIygA/sTGsc8bqYu00YEkzhnD2WkIaMdPKI3oEh4g6GawlWx+FmCo7LQN
	tBtMLmjvDkCAng+d30h7AT5m4E1lp4GjlXPdSIP422Ryu0SJOrGFB+rXxUFCeKDoA1KBrqTwosZ
	alEen1kp2KZEtxNxg6PGSRwyfabWMm/HpyE97B+2KN/dCw6WESB5gHpgpNOEeBF4o4Wl2OSNHUu
	Bcbza04hJDAMD9SAseal97NuujwNRRpIaYTLgUghIpL97HoZhbzWH3HL+nujKOQW3SwV39GBPtN
	bkgnZKvdJnJPRs1pZnFOBz1w0teb5JGHaURauxo9EkE4TQUVMPCia7GdKJRTIHPY6RxhF9NwJWH
	YsYq63vjjQMIo4xo1DXJO25tcWTSbn8bqbISCGi+HzhfqJTuGnYBIrOwFDg5Ucp92Sk2cwDA10o
	c=
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr1991650a91.29.1793961404874;
        Fri, 06 Nov 2026 02:36:44 -0800 (PST)
X-Received: by 2002:a17:90b:39ac:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b0db6f156emr1991632a91.29.1793961404355;
        Fri, 06 Nov 2026 02:36:44 -0800 (PST)
Received: from [10.217.219.8] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c66fe1sm2885209a91.7.2026.11.06.02.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:36:43 -0800 (PST)
Message-ID: <90ad258b-00f3-45b2-bf7d-5865a9d66258@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 16:06:38 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: mmc: sdhci-msm: Document bindings for
 Nord SDCC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Ram Gupta <ram.gupta@oss.qualcomm.com>
References: <20261102-sdcc_scmi-v1-0-244dbd893051@oss.qualcomm.com>
 <20261102-sdcc_scmi-v1-1-244dbd893051@oss.qualcomm.com>
 <20261104-sticky-perch-from-sirius-d3ebb3@quoll>
Content-Language: en-US
From: Anjana Hari <anjana.hari@oss.qualcomm.com>
In-Reply-To: <20261104-sticky-perch-from-sirius-d3ebb3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX3+d0VcCUawrh
 CWKheoT/NWu3l6O1K45Gva0Kd/edqywTWCtzIsNoUVA6m+e4cYgEqxR6iNEjI8c0sWV4TS28mRn
 pqP6IM707EekAZfXmBpbis2TiK9NPUDmcdD3dzkYL0djfOtbh0bGOoFnrq85/CEhAn6r+4VdMwd
 mPvl8W0emuvsiwvvutYJr51lt2RUR6aoO2JnC9c7cX6FSA4Q7QTgJ5W7oulpeqMSYUlqlc1MNfm
 rwkANK8nhMrEN3EVLY0G3qY3OkxlUCiR217/jfP8d0DJlZzMWPz8GWFa6EavcAyUJwcetnXCppM
 y1w3kA3qxQj1LSt84KVN+nehGRmopRdrqDZCsQmJpP7SUvhGVVX47eNYywnwtaVmx9Euzh7CU+h
 2vcpdzNILmUDakSATquuXIW5SI2zl31arg6SCnyWsIk662kkTxvfujEyf2t3htW0vUb6jsHV0hE
 D8GDLSxq6K2g2+08h6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MiBTYWx0ZWRfX3nstE1G/cy86
 BsJz9zNWjpx7jalj+Tu93u2eV+0H35cOayuBpoJMggnUNDcB0XOdCzqsllVMyXNW+1nUkBh59VL
 nHtRHJZy8+f59G5Z6qUvvFmAEV5gcLM=
X-Proofpoint-ORIG-GUID: PgG1B0MqB7rQZsrwlWk-9kChkB62RV_O
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aedadbd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=f_B6lkSkO6dyqIEesxIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: PgG1B0MqB7rQZsrwlWk-9kChkB62RV_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060042



On 11/4/2026 7:28 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 02, 2026 at 07:33:41PM +0530, Anjana Hari wrote:
>> Add Device Tree binding for the Nord SDHCI variant of the Qualcomm
>> sdhci-msm controller, where platform resources are managed by firmware
>> through the SCMI power protocol rather than being directly accessible
>> to Linux.
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 
Acked, will address in the upcoming v2 patch.>>
>> Unlike existing sdhci-msm variants, this binding does not require
>> clock, interconnect, reset, or regulator properties. Instead, platform
>> resource control is abstracted behind two logical power domains:
>>
>>    - "power": controls the SDCC rail power state. The kernel requests
>>      power-on and power-off transitions via the runtime PM framework;
>>      these are forwarded to firmware as SCMI power-state messages.
>>
>>    - "perf": exposes the supported clock frequencies as OPPs populated
>>      dynamically by the SCMI perf domain driver at probe time via the
>>      SCMI performance protocol. The driver selects operating points via
>>      dev_pm_opp_find_freq_floor() and dev_pm_opp_set_opp().
>>
>> Both domains must be listed under power-domains with their names
>> declared in power-domain-names.
>>
>> The compatible string "qcom,nord-sdhci" selects this variant at probe
>> time and causes the driver to attach the two power domains via
>> dev_pm_domain_attach_list() with PD_FLAG_DEV_LINK_ON, ensuring correct
>> suspend/resume ordering between the SDCC controller and the firmware
>> power domain devices.
> 
> Do not describe driver. How is it exactly relevant here for the hardware
> description?
> 
Agreed, will be addressed.>>
>> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/mmc/qcom,nord-sdhci.yaml   | 89 ++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
>> new file mode 100644
>> index 000000000000..c512628617b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mmc/qcom,nord-sdhci.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mmc/qcom,nord-sdhci.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Nord SDHCI Controller
>> +
>> +maintainers:
>> +  - Anjana Hari <anjana.hari@oss.qualcomm.com>
>> +
>> +description:
>> +  SDHCI (SD Host Controller Interface) present on Qualcomm Nord SoC.
>> +  Clock and power resources are managed by firmware through an SCMI
>> +  server, so no clock entries are required in the device tree node.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,nord-sdhci
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: hc
> 
> Where is CQHCI?
> 
>> +
>> +  interrupts:
>> +    maxItems: 2
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: hc_irq
>> +      - const: pwr_irq
>> +
>> +  iommus:
>> +    maxItems: 1
>> +    description: phandle to the apps SMMU node with SID mask.
> 
> Drop description
> 
>> +
>> +  dma-coherent: true
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: perf
> 
> Best regards,
> Krzysztof

