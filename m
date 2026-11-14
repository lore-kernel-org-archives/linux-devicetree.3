Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630495;
	b=larTGEdu+AzCikezO1B5gE7jagsro6wgkljyszaU1teUBg56X4W1io0vpJEliuBRUDKf
	 UuS2drXD0kgytD5VaqCbVDX6cLCgR5wMQE1d3MlCjIMVcqf70bODgOoxaLhwBkQz0GTse
	 OacLx+tR7nieJLqwGu4zgy59LQITEdn3yxzGnQMyg916vpTAtRrYdw7Tn0n+zf00monSw
	 cRz6DMFMdC9Vy7PuEE0ZJomMuqlFC2Ara8TSR8txr28OcZIZBoEi8RFfHu9UyUc7VpYJV
	 JatcIVeAEADbHLPPeQ48OF5ZGRvQ03kMg2ubUXoakyl+opT6BKt+futz7F7x1cQ/g6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
	b=3NyNj6eMqMOXD+HTHcRRTpwROLIiwnF2GeYIQUGlxWmYA+R+TtinJNrp0KEs6SWrShhx
	 LA65L/RJo/HdNIP/syF51WG3JAd1gDSakUOqrhnAw7sH4AeNMp3FIWSfaZPd+8fHBPzGG
	 px1sp2SHawM2R4LbuZnIhDjgSqWuKzroQR78+Yzp5CI6HR9R3YyWpGvmQbIdHExBoGBAU
	 8u2By5+MHVuoaJdl7vYFFa190F051FUxxtfViVYJl3cBMl3oHzj3vu1MGIIXhcDYHrvfK
	 E7AQo1bvoiCD7erogG5kh68qHAvWFMOvNPZvlRfEhg2aMmZD+jtYEDFg3hFQIN5mcyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125F8606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 125F8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGlHfkyA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4X3XvfS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE3YfkE2864136
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mfnzKhlFqbPe9BxFyLjXeFlU
	GqJhtzF1P/zaxEKCg38=; b=DGlHfkyAVjbLeQibv0xJu7sEyaiPh3sU5qCTX3DP
	4dSkAuzvkY5vbmx7Q9flmQ1l/n8FC3kReG4T2d95PmkSgm9QgWb5yjBBIpUH07Ds
	8WPGozSvsqnFyd7dmZSDKXYFQymbCjb9cCHidPa53QSu8iXqVHTWsRWE1AjKl8BG
	jBDyQBGyz+mq5w4V6gRMuYRTutekiDyjdZIbpukxOBSB5s61zeQD+CKN7FrrUf2/
	CYMnpSr2qHvIt6e6xSOyS39Hin36rXJZf4xmzImUH9xDNe9PtBzJKn9bCli6CMs9
	ldJPDBPfF/cfs3Sc9It7mlO6cWQer1PpMwePs2SfN0hRfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxfv3039a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 04:28:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fa5673fccso3891958eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794630493; x=1795235293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=G4X3XvfSjX+7NHFr5Bs8PKMzeDvhvutxt5HkckXBucinSbIEPAG1k7KeE8QCWKGDe0
         lRgrmkGZd0MyMDzhSs/st8tEmmkd1H/cjrKV77BrvpJ1A8ASlKH7SQT9psLXEmigP228
         Yl5De1HvnHeYRJqfkWkVbAW5/OzTPrglN2VW9uPyywE45Tp+yvB2YSyrXjXkJiWy/l5H
         +Y+QACuZX4LT7YJMP87rOsskQ6qAyEIJRUcP4S9Yf1e7XXsJoyDFMFAyCob3fZklajLf
         j6xyb+yXpFOXOLnQfYFkTOVNIAMh2uYjbLgO+9AZldlWyReSWnAxdV2RGROCqbptTBsB
         pKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630493; x=1795235293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfnzKhlFqbPe9BxFyLjXeFlUGqJhtzF1P/zaxEKCg38=;
        b=V+8FNsSltYcD5dTlMdWdAhXdl9y6BpPLeB/uw9Q8NYOf/RZVq6/6kPn9Px8EtRwQVX
         KwghId7d0WLKV8zEGq4Kx7TBaHaqF7YqZeDVjzG6isn2AgiiPwDG1onw6aHr9HPYYkYL
         lUcPM/5mHx3w+zU/NchZtOWaAvCcStdXC6/fC5bdN8ABLFzSC+9b07Ylwguq8++N5wXb
         0X0spfIKNI139nXxAFGb3G0L9HwBKrmjq7fi9dxQaUTBbD6YdBLSB6Ai+L4PaRmsib+h
         KEsmKceNAw5FJEk3rn3Koj5HGF6xYcRy5GBvOlR3rGbjNh8YA/HkFY88Q3tBvr0cLUk4
         UcHQ==
X-Forwarded-Encrypted: i=1; AL+hErHFL7wQ5S8Ymf0x8alXught3ySZWFhGh9lVa35z596P027RK4Gc+RbQUPLsZJC4Da1mPbR0XuwuNg/g@vger.kernel.org
X-Gm-Message-State: APuU4Z/xWD8nWLYPMMZQBPt4CrIOjmDA2h2CegIuEOgYrYm4Zr6lv4wE
	K2+/VPj3czYgqRMrc3MW/SNvMFoQWge99ICnp146aGVvBO5aCfxH47VRR/SmPbifr4XYpWRjtIv
	eOQgMOy1QjnAWUqtqTAvRh96xcDiogDa3ICTMXhNuBlcKFsWEfoizEeSe+P39UqCB
X-Gm-Gg: AYBFou1oKcQRqQgP63blBfu1Dtyq7HP03dUa0k5ykRFIGQBMNXVK50o1AvlMAuIFZSV
	t8tLCFQHWMdatVP2S+gl80zmoeVsf3JvIug3OmQCpShFto9p8DMINkd87alRsrc1ZSXe1NXV+ZD
	7YQMwxEwR1xL88/gq2jjCteOfpCgCj5h9uD1J5axFLlMxnEgzX/r2i++qhPmZZeWkf6LSixs38G
	eCidPaIiuOIou1yth8eSwUz74s2z9MUsMaJrjK52Yt2iWvrFdhZVYMFSjd9esFVBt8a/XbskuV+
	Wd6EOeHhWk2/OPJFxdySqDnO9k2YcQ64SyKCyNpZBsT/SFJTrO+W9oZQSXnu2mfktdQymdgZTGb
	rNQ5DaJvWnfv9OYXwfg/w5gj2JKWENcnev7sU29jx57lzvu6BM8QFCOxeFNirDnSmaWpeUJhv0g
	02zdixetbQh9jFqT4=
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499147eec.23.1794630493379;
        Fri, 13 Nov 2026 20:28:13 -0800 (PST)
X-Received: by 2002:a05:7301:d192:b0:369:1084:8ee3 with SMTP id 5a478bee46e88-37966e3a6eamr3499115eec.23.1794630492711;
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm20332733eec.25.2026.11.13.20.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:28:12 -0800 (PST)
Date: Sat, 14 Nov 2026 12:28:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/2] remoteproc: qcom_q6v5_pas: map SOCCP carveout
 privileged-only
Message-ID: <avfjVqCHXABFg4ue@QCOM-aGQu4IUr3Y>
References: <20261113-nord_embedded_el2-v1-0-48f717e97066@oss.qualcomm.com>
 <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
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
In-Reply-To: <20261113-nord_embedded_el2-v1-2-48f717e97066@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D8/SufRj c=1 sm=1 tr=0 ts=6af7e35e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=d2ahPazU6wztV3fc8WMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfX9gzAPLFNTElH
 jrSFuyegAeKtL4r+bwlg/m1rxoyKSHgKjBwEW6ZaXYcuXY4omWGNq0TVeqrjLlrNsqIxT0dXdX8
 ijRL7Y0OpiUZwLKYAOqZYbP+C2ebLqs=
X-Proofpoint-ORIG-GUID: hEdexEcRpg5nqFp1pxBjjP6eexVaoaek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAxNyBTYWx0ZWRfXzJgDCa6tCJoF
 sc/lidxDvOXc5R9rjfsmbMoT58IMp/BGy5wwLbj3Vy+ATZ+k3cqHAQtn2qno3jMxoPJ5xKdaVYg
 BeVPhefvMkAF0HVphXmaEL1FEcr/KOcv6rRUMJ8gYav6W1sJ97YQjAPFZktIvlnlkDvxMMd3fFL
 yXp0OkMvGT05fkjnCGWkbH/Zb4LDwQWGfl2DrwpPk5I23lO5xa+yn0FNm+jOtkDd7eOETVstUpA
 D0rnLPhUlIe/D2B/2MZaz1xKak+LfU4H+CVCbYuaIqGctEdMdGF2KV8JHGiXYOX1DinPZ5lJNf3
 QpNQjhvBRdEkZx5qZSZge91GunK6lvT1p0dLZfZ3Yd9wklQQkAdzevH15hkr8CaaO0dZpSsx56c
 b34uFO7xOwzNiBOdKnljzPoO6rsycKvG+PPPZoesVACmcgAUUnq+aKrzS8XhkAaytmMjjey0sBp
 yWe4upDzbD3FIUPj1Vg==
X-Proofpoint-GUID: hEdexEcRpg5nqFp1pxBjjP6eexVaoaek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140017

On Fri, Nov 13, 2026 at 05:54:13PM +0530, Anurag Pateriya wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> SOCCP is a RISC-V core whose instruction fetches go through the
> SMMU in privilege mode
> 
> The memory region is mapped with IOMMU_READ | IOMMU_WRITE, which results
> in permission fault when SOCCP fetches instruction, append IOMMU_PRIV to
> mapping to allow it to fetch instructions.

This says what fails and what makes it go away, but not why. A reader
can't tell from this why an RW mapping is fine for a data access but
faults on an instruction fetch, or why IOMMU_PRIV fixes it.

As I understand it, the chain is:

- Without IOMMU_PRIV, io-pgtable-arm sets AP[1] in the stage-1 PTE,
  so the carveout ends up AP[2:1] = 0b01, i.e. writable at the
  unprivileged level.

- In the VMSAv8-64 stage-1 permission model, memory writable at the
  unprivileged level is implicitly privileged-execute-never,
  regardless of PXN.

- SoCCP fetches arrive as privileged instruction transactions, so
  the first fetch takes a stage-1 permission fault (FSR.PF,
  FSYNR0.IND=1).

- IOMMU_PRIV clears AP[1] (AP[2:1] = 0b00, privileged RW only),
  which removes the implicit PXN.

Something along these lines:

  On Nord, when Linux runs at EL2 it owns the SoCCP stream and the
  remoteproc core maps the firmware carveout through a stage-1 SMMU
  context bank. qcom_pas_map_carveout() uses IOMMU_READ | IOMMU_WRITE
  without IOMMU_PRIV, so io-pgtable-arm builds stage-1 PTEs with
  AP[2:1] = 0b01: read/write at both privileged and unprivileged
  level.

  SoCCP is a RISC-V core whose instruction fetches reach the SMMU as
  privileged transactions. In the VMSAv8-64 stage-1 permission model,
  memory that is writable at the unprivileged level is implicitly
  privileged-execute-never, regardless of the PXN bit in the PTE. The
  first SoCCP instruction fetch after PAS authentication therefore
  takes a stage-1 permission fault (FSR.PF, FSYNR0.IND=1).

  Map the SoCCP carveout with IOMMU_PRIV, so the stage-1 PTEs are
  privileged read/write only (AP[2:1] = 0b00). This removes the
  implicit privileged-execute-never and lets SoCCP fetch from the
  carveout.

  Other PIL subsystems (e.g. Hexagon Q6) are not affected as their
  instruction fetches do not go through the SMMU in privileged mode.

Another nit: please use SoCCP (instead of SOCCP) everywhere, e.g. patch
subject, for sake of consistency.

Shawn
