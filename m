Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6C3ACEE8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 03:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308064; cv=none; b=AN6UhEH6r/p/u8SnFDZay2pO8qG7SIDUUF28AF+/puLn5DItQ5RP/DzyWPd1wtd7rNdOyR381N0ARfxygp+e0CXojfHukAdtTj4t5im3wlrYpx56nQ5nj9fLmbPSnJMtRf0lWCmPjFaZ4lnVE8Az+ETN2wYMDjXxan9rqaKLOtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308064; c=relaxed/simple;
	bh=Plon+k1ptMC43wXIzK+E3enat2n/BRnkToi0cHLDPaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqIxOZ3/kQI9f550t3Z1laFxer8HSLRs4sqq2yiI/djtblZP5EQIMajyjh8jSV9sKvpglSSN2ney06t9+A7gqoVW4zeHZQQhtapH+vgzVwKBSSmrwNBpuXORV89wyIIC59AZrwKoyEoCbWhIam5g2tAGvPohBVJLzJ7iHaDqD2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHmuGCLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMHFEmfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHmuGCLY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMHFEmfJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665LxXE42716361
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 03:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vLaX8Moxxos/n9tNRNhn6IzL
	amMyiQ5H7q2UWMNWees=; b=gHmuGCLYWsdIgzQ2elBnA8MOUviMYzZ2SXykis0H
	GTCQae6YOYVzAS981IYPu9siHAeldp2JeNVSrmJ0e7kiyxVFZEmCL1vtVhnHK5dV
	nPQIyr1bm1CBIzHIGLhx92dm1X5l0hFVE+DU3LixqVevpY8vPz/8TzCdbHLIh/P3
	X553my89J3P7du2RocH2hKaiS740XDylIdxi4UUC2krE7tqf6ACPtMaCg5jgMqeN
	DKlgVBt38R5vIrz7u/4ecj0iBhhG5gYW5g0mfgBMk0FwgR30gYUHw6CSxCcHVjkX
	Kquu0/95F5hprjaST92exq9eZ0NaxZKXRt26dgCuXmozMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txem1nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:21:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc77a6943eso47119545ad.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 20:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783308061; x=1783912861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=WMHFEmfJUasiUn5aOJBjRy8q+h5VAQblba14cq6b5EcfK+zEIdSg1/8gyrEUrqkosr
         SRxnRqep8+FjBht0MCHpD2KceNMVYKQYMNJU4ARBcdfdnigCGlDVKcHo7QBfoYanxDL7
         1ztRlRDguO5DH6tjBf6FmdgQCzXiB7fyZqqxpCq8e9sZtQ4U5IKA4w8jQFg1K4nQzz2o
         8/l0UsXs3v57YZtXI1j3A/NK9Fjs7eeT2OyIEAT3UbLTTSC6Dt2Y8TeR790bEdTJjDhu
         nciw4jn1Z5PsL+d2sukHTqSzBfY/Virr0ZIlduUoF4vp7wPJFUrnBTF/bo2+yDuOW3Vw
         2ZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783308061; x=1783912861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLaX8Moxxos/n9tNRNhn6IzLamMyiQ5H7q2UWMNWees=;
        b=dWyPu12Vp5iFn9IL2eHOPpOV9n6btdFrXt+2tG8Ig4Xf5Wb0k9yQOksiv2uo8GooxX
         WOHBsLhFwjGxRAp5a+2NgcnkMsKxrRLaEUfQ1Oou4JxBcXB9wqPhA7r+rFdDTViA7+P3
         Jkr35UrU6+l63Ze63CZxJAIuXPft+zX9SCrzSZGynM5WFdcEM0WDZJzv2d95+gAPOniE
         6FLPYpRS8pl+K3ioN6bemLUPnXRy5DSGMr34d1afVs1CaTF6rIuvK8/sR6r0sIk9vZXN
         shwFhmmQITshr1BGIXgSxAbgni2XgjDbnCchqK8zJhXe1XBY5afpob06DUSTVTyaeTUY
         PwhA==
X-Forwarded-Encrypted: i=1; AHgh+RrBfz0bCMIp2v89UZ+PbdGHB7vSUbgGGoJoCp+i3SG+Z6OQWutiUPEsNUE1/rTK/I5IjXpiOEhv1d3E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fJTiyFKWriHA2RZiMvL5mfkkZz1dl/Biz+HA6TaANTJzi0QR
	6ewKTrJUkEOMcVRgvitaWocDbLZl+dw9WT6DlHmGKLuBkG2UvI+QEdeuYQsxRaXJYxIvpuSbcxf
	7Ps9F42/V4KLG80JdMd59z7B6VUwy85ghylGYbtnlkQ3Q1ZO+R5guFmkT/6XuLR1v
X-Gm-Gg: AfdE7ckWKIwvvTca1FxV1qdlpHICjDlPsc2qG0Z82hazn9p/WUgotHaXXQsfPElbDy7
	n2b5CNDlGIE/FikeQyv01gXSEaMFwAsbov4Ymh5U/92sn2nKkHEEmJHiFZDoubsr2v6VQj8beOy
	5UoTzoyJ7RoQ/WYvSiCctvUz8eHxFmujo2B/LtfQoDDwX2/1E0IzohAEm4sscyBG6sKzkyi6SHu
	H3EPUPFocYxcJTQbSn1VXalWvCqWCaULVmHHITmXqNU5yCnHsWPYb1DHJYEP0HlnosYMy7to7Ii
	V6AMvy1FkDxzeiJlhVOoe1CT6UGI/Jdo54uT6Gtw6tvUXkrku5swKTIw4teiVif+fKiFpNrMMVn
	lh+mYKUOjhmzJnydDElVvaC2vNHweLRzqdtTW2ASHxiUjwumHMYtVqFOSeA==
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90495965ad.43.1783308061395;
        Sun, 05 Jul 2026 20:21:01 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cbb9efe254mr90495655ad.43.1783308060898;
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm63915229c88.1.2026.07.05.20.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 20:21:00 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:20:58 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <aksfGiIWxW1RUTfx@hu-qianyu-lv.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
 <20260703-godlike-artificial-coyote-3e9ba9@quoll>
 <akeoHGv905FTOiy9@hu-qianyu-lv.qualcomm.com>
 <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d23a482-4d5c-4444-a533-d89a4602a4dc@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfX/v7KDwAgydY+
 iI4d4UfPPQFik+5vwWLH5tRJXmNOrTYKU42jokL4PypyHy6qPSamykFsyFHpSAYSoBPqykFp5h/
 6jBziYrNwoYSzBWvzqtza5OSZ/htFMA=
X-Proofpoint-GUID: 0dvlpn4-jYEj6gQUgmScSbmDUj5n9hlS
X-Proofpoint-ORIG-GUID: 0dvlpn4-jYEj6gQUgmScSbmDUj5n9hlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAzMCBTYWx0ZWRfXwtyO+H2BabsJ
 9sDXmL+XmXeXao1k/JxkqMtHTL/A4sygkeYzlUUYQPCzs/EFDZJRWfTypIo13lnPJ6Xkr6lxkqt
 MnyTWiIstIwGUmWndxNtURXwJg566DqbAfEAghpa3aoMQ2t5tId70imuwkOPOG+V787/oEXk7PS
 +K+Hsp9/RgopOtW8PwVlfVFVpeNIi9mismn4aUuh7ODZfBWo/QIaVNTuibmwCUE+C3CfTn6+3N3
 xErmJYfWTsZPcS/UD7vRXA/OWBL1eUk28jz3eXwcfnoiI8F0Eb2XV9YKwFsye4+LNE6xL6EarE7
 2MP6f3ZqYrS/MCUKjm3kuLc0X20yURfDKMfzyYVu0sprcV9/9Txuy13VykxKPNn/x5qSc0YzCaa
 E1rWyJ647VKGy+6ouGICxCL5tSX8O7dbhzzUdy8P2NlTaKhRkGgMu7Gg3nK6KmLfifgJ2N0E5r9
 M+MoyiKzHnPwX1UwXYw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b1f1e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0RteJoaA5KIU4r5rSwwA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060030

On Fri, Jul 03, 2026 at 04:50:27PM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2026 14:16, Qiang Yu wrote:
> > On Fri, Jul 03, 2026 at 07:58:00AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jul 02, 2026 at 12:36:11AM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for QREF
> >>> (clkref_en registers) resides in TCSR on glymur. Since QREF has no
> >>> dedicated DT node of its own, these supply properties are placed in the
> >>> TCSR node which acts as the control interface for QREF.
> >>>
> >>> Add a dedicated binding file for qcom,glymur-tcsr and document the supply
> >>> properties. As this binding will grow to cover more SoCs, mark the
> >>> required supplies per compatible using an allOf/if/then conditional.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>
> >> So you dropped the tag because? Where is the explanation?
> >>
> > Sorry for the confusion. The patch was substantially reworked in v7
> > based on your v6 review comments on patch 2: the compatible was changed
> > from const to an enum, and the allOf/if/then block was moved into this
> > patch upfront. Since the diff changed significantly from what you
> > reviewed, I dropped the tag rather than carry it forward silently.
> 
> Dropping tag is fine, but what do the submitting patches say when you
> drop someone's tag?
>
Understood. As per Dcumentation/process/submitting-patches.rst, The
removal should have been explained after the '---' separator of the patch.

- Qiang Yu
