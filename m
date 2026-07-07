Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0824D3ACF15
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408369; cv=none; b=VMBkQ6O9eBg9qugferjw+3cC24fWJ7RxsR1MDcMzlT4pGbpFv+WsJH0WaR3VYJ3GWYd3dhXXn9jI1e6h5vlTf/JWCzD/bcWF8fMOZZrUmK3gyeIIzNL/oMhBZb3jd7jz4g6sLL3PJIUdUHI0mgbSFhL1b7+6zovgabZ0cuhuEgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408369; c=relaxed/simple;
	bh=ipDzK7euD7eJOdng8Kug1BKrrgzjtJMdV45pG7Y0khA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFTXdqBnbrHb/KBMdWOt5zdywGeIX4amu8vKVa7B27NTZP6er3p7QbyFOb74GIwThA8DU8C22yr/ND+HQiySCIERLSeCp/5MQg7FUPaFJnpc6i/afkEPOOUBotu5Ow3DGP9oOszqnVTIsNEiuZfXBRcIvKXzIs/6RNSEZMoUvNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQHSR+Ys; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+5Oq2EU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQHSR+Ys";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+5Oq2EU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748fYZ2449650
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 07:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCbttV0skIDHUqvl2VroCHVb
	jJ0V51s+CD/3Mvid91M=; b=PQHSR+Yssphk7iPh3OtR+k58HzN5ouZIYET+XpFY
	244T09V6y3A7TxLo9Y5k8xPuHAMZovOvVOXy2GM9UgWJzhimETE8eJEAbijF7eN5
	QruSweu3TJfr06N8PBMSrYyBhJ5b0RRANBr/7vnhVVl0TPlS3a+WCX/rA9appB/J
	9LojIU/KlwKMnsgQLbQQJq6I7tkfXJ1X5XN6eIzYgoAMsO1BpTyh3RL+Taa9C2tu
	fMcrMNhDx3M0/3r24mfDHAAnSGhdKTT71x+gI7b99zbmQ0UKxZlxSxrjgxoJUS+A
	qc01TME3aiQ93sszKUetJceW+G6j3OT7e6bMJrO+1bjHfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70nxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:12:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eebafso9496491a12.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408365; x=1784013165; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCbttV0skIDHUqvl2VroCHVbjJ0V51s+CD/3Mvid91M=;
        b=W+5Oq2EU/1zzmKC6jvVCe0nu1wpBBV5dUWR9Zm22u9cqQCZBKpHy7kvDw2dDaj5TYn
         7L+AdVwk+OcFmpQkz0XQ3bQtMbih3NItkeyx/Li3V1iMcWfla4DUEMyQxugen/Tal+nx
         2OP6chHz4ax+OROH+uIMpTYb7J73A0zR56Wqu0zVpqXoPdwXwWT/9CEPmavXD+EdxzJy
         Nl49WS8xmns4UoDnUIREn8oGogm7HFRb8G+MQ/vEhbprwJbsRd+2sHA7GBxVy8UbSqTd
         N7tmzy/OcHKuQMFzNbgOd+A7STjV4uV/6GSwdIvwxv12UVZCezS0RCYXBCr1uOoIjosU
         /y3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408365; x=1784013165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCbttV0skIDHUqvl2VroCHVbjJ0V51s+CD/3Mvid91M=;
        b=Kpi356MuX6u47EH9wYoBNdXSrIa1gct43u+t89lSmxqsr+fj6bXW/4XK2kDg9amRGG
         miNVZqK3G+LxAVWNNmmn0mjwgQCerYX09J2BqLN9M6I/IwnI/F0idc0jD+YlJQVthRUJ
         30Py5KyoaB8+N8J/7LkRHK7Lm2bj6QXQyyPuIxgQNNieovkHN8WXv87vIEkQ8N7v0/cz
         2Q72KbbKRjFjuUqZqe8nIKwiGteCeBhF/JXhweSKGpv2fw2ozzO3WVWsfYS7oP81S/Le
         ZMrrtDAF2qU4sQaaZPgNqpR9zLFeaFqShcywg11rGbFwgv2BB5zynuyagMjfnmnLup9U
         iKWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp87DrhmE2LkNgiA0UgWUhczBoGctG8i/70zOJuYavlv9yf5jxKVSZ8BJ/K51gNpDbeyvtqqV3hqsbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wOBRYR3ZzdwkMTP+bvskLuF+zrsROrDaLdYrCY7mffKu169s
	sOffzTk/g4khuYB6OL26VIxGajpe+1Gu1dejDQALZcFVq7AGUj40IrzBAFxQizeKkdMcaggYSoK
	H+gyRH9wrqXenaLE5MRj0qqt1UZfJfChPUodq8SeUKPTT0uH0IpP5IAMgIfFQqbMZ
X-Gm-Gg: AfdE7cme4ziHnU1D+0u9/VEq8Q7V5BMVCSLupcJqyGJ3bfpgHbnysg7Hjz6k23mNUmH
	IEFxJdcOHzxhe+B4L17W+5D7XNiXcldFHauQt37mNQifX+lkn/DzKK7C4NO2dOKCfmZc0nMmWVx
	c6RRflQDFbbTRYiPeH5dcwldyy+CO0C3LG3RssAsJHn8M7k4Ron5pa+W3ugBsQaaSJ5nojwyVJ9
	0OpX1aSyrL1CgfByT+KmGf7Rg3kUER5ooXzJTwQPFqGDESE7h51m15qF+3IC1sBhQRRMaLkcnGB
	KlNRYIljbctW7SS2lqgdPTXlX8ylRIj6HoKnHabK4A2CLwG0hu1UdhDSh1dnJiRAxiu35cme2w8
	lGjO2B9djffAglFc96t5//Qf8MKQ3b6BYe0ibxg==
X-Received: by 2002:a05:6a21:62c8:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c08ee3733dmr4777212637.34.1783408364800;
        Tue, 07 Jul 2026 00:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c08ee3733dmr4777179637.34.1783408364170;
        Tue, 07 Jul 2026 00:12:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8bc08sm6225199eec.24.2026.07.07.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:12:43 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:42:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v9] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260707071236.7cyumdjhq4x2mo7c@hu-mojha-hyd.qualcomm.com>
References: <20260706161428.3764398-1-mukesh.ojha@oss.qualcomm.com>
 <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zj7y2enw2owu4oidbxc5qhilmbb7uzp2fhlawapuqlvhh45omi@5j25uydqolks>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX475zxQ3uNVuw
 CPJzd3cdaHn46NYlZwBX6O19c3HSD10lG5Ru4q9liOlj8+PtBRsKPmuNPZVa7e0IW/hAlsjdvZK
 AsYvioyzJLdh+jz1qlrp2z/glesasHJ+HCxEcxzWw5rAm/MWeRsr8WEsyZsEuNX4MeCovyZggAw
 b+UBZjT+iNuo4toEvwS/1tCNRNZSVrldxGx8TGHIod5dfOIje+Due8vVzHN0FVo0MByfiwbxhOW
 el8ADiwC/e64naSKcy09uUjPWC55tAGjXe019i0+3lOu/azulhu9i4JTfbhKVvvekx4FL7GcAt3
 UuYxBAEbhoyAiQKGm3FL+s6BGtRTztqw08FijJcPkgnpooki2gIR0rQsDYBXdePkj3K/+ECLg2E
 NX6+b9LLSmx81cnAWL89NCHjSb91w4oG+41gkwrpUIZADGTocCquY5RrlutNY0i5AVzTRtecWvb
 Cei+/heTGAmLhQrst6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX7hR9qASzuGCR
 ugmWpSnHEHCN/xbbJ2LYOdVAOkbEfSQ3YTTnCRoJYLVX9fba26B0wiTtZKkDvZpPL+Q5UzUzCwZ
 TkoGMT6JFn3NJtEFtO7IlSzATbqhLZs=
X-Proofpoint-GUID: Qb0xTTcSiJHJ2wokI1QdItm7dDMssOih
X-Proofpoint-ORIG-GUID: Qb0xTTcSiJHJ2wokI1QdItm7dDMssOih
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4ca6ed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ElO3I3FmCtZpy0SBe3cA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067

On Mon, Jul 06, 2026 at 10:42:53PM +0300, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 09:44:28PM +0530, Mukesh Ojha wrote:
> > All the existing Kodiak board variants run the Gunyah hypervisor, which
> > means Linux can only boot at EL1 on those devices. It is possible to
> > boot Linux at EL2 on these devices [1].
> > 
> > When running under Gunyah, remote processor firmware IOMMU streams are
> > controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> > consumer of the DeviceTree. Describe the firmware streams for each
> > remote processor in the EL2 overlay.
> > 
> > Add an EL2-specific DT overlay and apply it to Kodiak IoT variant devices
> > to create -el2.dtb for each alongside the standard dtb.
> > 
> > Note that modem and media subsystems are not yet supported due to
> > missing support are not there. For GPU to work, zap shader is
> > disabled. In EL2 mode the kernel owns the hardware watchdog,
> > which is enabled here. For WiFi, the wlan_ce_mem and wlan_fw_mem
> > regions are needed by the WCN6750 firmware.
> > 
> > Remove the erroneous deletion of wlan_ce_mem from qcm6490-idp.dts
> > and qcs6490-rb3gen2.dts as this is device memory and should be
> > present even for EL1 configurations, whether or not the
> > underlying OS uses it.
> > 
> > [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> > 
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v9: https://lore.kernel.org/lkml/20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com/
> >  - Remove reserve memory change of adding copy engine device
> >     memory back in el2  overlay file instead do not remove
> >      wpss ce device memory from el1 configurations for idp 
> >      or rb3gen2 device tree. [Miaoqing ]
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/kodiak-el2.dtso b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > new file mode 100644
> > index 000000000000..37a906218d17
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/kodiak-el2.dtso
> > @@ -0,0 +1,41 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * Kodiak specific modifications required to boot in EL2.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&gpu_zap_shader {
> > +	status = "disabled";
> > +};
> > +
> > +&remoteproc_adsp {
> > +	iommus = <&apps_smmu 0x1800 0x0>;
> > +};
> > +
> > +&remoteproc_cdsp {
> > +	iommus = <&apps_smmu 0x11a0 0x0400>;
> > +};
> > +
> > +&remoteproc_mpss {
> > +	status = "disabled";
> > +};
> > +
> > +&venus {
> > +	status = "disabled";
> > +};
> > +
> > +&watchdog {
> > +	status = "okay";
> > +};
> > +
> > +&wifi {
> > +	status = "okay";
> 
> Hmm, don't. The platforms doesn't necessarily has the WiFi enabled.

Are you saying, let us rely on what is coming from the base upon
which this overlay is being applied.

> 
> > +
> > +	wifi-firmware {
> > +		iommus = <&apps_smmu 0x1c02 0x1>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > index bdc02260f902..6ab1bbdc0a62 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> > @@ -25,7 +25,6 @@
> >  /delete-node/ &adsp_mem;
> >  /delete-node/ &cdsp_mem;
> >  /delete-node/ &video_mem;
> > -/delete-node/ &wlan_ce_mem;
> 
> Separate commit.

Sure.

> 
> >  /delete-node/ &wpss_mem;
> >  /delete-node/ &xbl_mem;
> >  
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha
