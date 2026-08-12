Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835864248D2
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530209; cv=none; b=M1QDWmczJNdz/pVs5nBclCtTems0cCHzvMCLo8gByoXtWPLU1XXzb7XANA+RLZqCGqsGDDbopZ+DUVptIZ8UuizEZPohiTAA/VRXFa3Qxc2sGNJUCu7cJ4M4VkmDBgQ/fu5bA7LsQ6YaslexVe1eD7NIwcZ3bAymkTknW2zUAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530209; c=relaxed/simple;
	bh=5659lMYIBBWse7Tib1nN1eL0nh0PVcNZ8ShWdlQoLng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUGMCr1eA6D+/C4Voat1gVp2OGYW3nT87l4fNj5Ff8u9xZ4kuLipJmaaYBK2vWdk5S4cpaJXXrnz4tM1OPRgXCeK7m0ZYkDZ7/bjZpQ+lqZMMclfEThmdJ/PFGHAVrIDm824ySYJHY+0d+MU81NFm+OidbyMy9A8ZQyMr0Jyu8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njT2YxiC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtE1dlmZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njT2YxiC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtE1dlmZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fsrn3997200
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oc8mH2Qk/F/k1cXQlTx12IMC
	JpZIAji6P9WcU7YRupc=; b=njT2YxiCMOBIhujCRSbBo5oG6rfCV9g0xII4xDxh
	c3kDNFu+M4CSTS/mVNtrvFiA1rmRC/JRAuE8HcHdBz9Wt7vulM7YXbkk74A7UR42
	o0GP9Xb33+7GV4LavdwphqHQ5sZN8LqdtCVWlNE4ELAhYvQDHX35wNyO+/tepnAD
	13gDlaXEY9Q8z3xY2NG/p5ZD7r8b0Ow/Sg4RVEIk7vuvIKR8ySoLVdsStLHmoj+U
	il769tBEJI0pjRy2vyGKzEFMX0OJq7zjgf2rWQpKRO4L3VOeOOijkwA+StdOAgnE
	P1snzZ9m11174d93/AWcUOl0J4mXvl302M328LLzcJ2iGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08j5kbuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:23:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52cd0374265so14978961cf.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 03:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786530206; x=1787135006; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oc8mH2Qk/F/k1cXQlTx12IMCJpZIAji6P9WcU7YRupc=;
        b=XtE1dlmZvU/KhqGP3pfLwgEbFNQG/dOJ0HjgqyMnAZRpTW6QE/ZGMhDJLo+Zn5QHup
         T0KgCx7hYZDSynhi3fMYiEAx6JjNy/sj08VlFD0RA5CC6o7McGWNlTBsgWl3X7cKMAMG
         6AjKC9QkejiHw8vmG6OlyRYCFB8u1XfPyYVmQf+0KVZSpvnP7sA5L7rtvYv5/UYalZyP
         3HsMrks+PmQ1Ku9WVtujCjjGMxka1HVjM6Egt0i9O65nq5nGhK36IBizgG99kzAanAAF
         kR104g7/u39BO6ps6XQ1mUTC63Amsu+6R/WQiiYcsPCEUSzVDdKSlmkV4OQnzbk+8i2P
         pxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786530206; x=1787135006;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc8mH2Qk/F/k1cXQlTx12IMCJpZIAji6P9WcU7YRupc=;
        b=qJL7l13p48iTciLaioqb8eaHP12jn8X7Xrkwkmv2UWHSWSbcP+SBAlcxDRKE+sgKYZ
         kDxs6BZwiW+AXrv7h/NPPVJAr9pf3PWmuxakOzA2Be+TmEH04CCkQ9rs8N86yGt0kK0m
         y9BaaC5f44D86VNHWPvhVy/4Z/jC+tYdFfsi9o3UOAg3vYhE/BM+pPUNSbtiqMStSxVE
         bAEgh8RRUcxttq2iO771T+xCKzsR5aUE4OUGuWfOiTns4ROH/rykrdgY/2Tq/i8E/HQs
         c2TQ8yLAu/aMgl5QJCV/BsIDp5tR5C66yt+xfvmzliDVcxPASrgwy6c1Fx+q1mbYAHfX
         KLQw==
X-Forwarded-Encrypted: i=1; AHgh+RrifK4E4ds9nDT7F36iqFnxTVDQRCYrvJxpHiM0gGj2zOqNhx2SlRrDU1MQp1aqdEVvnlyxEyiLLCb8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn814DVZyJL9RRoA8+ema4XKAbByfyZVQApphIBzai0ivwzQlT
	s9iS55Ir69Y35tyXdZuH4GzKwDEjpP+Anw1ofwN09HrsPxWxIDKIecuZf3jDiSpzHGcG+s/E/SF
	PrKpVOdvO/LIYfBIcBf7zTzvJFs3ujZm6pMPHy+kiJXI/UyZLZJXBD2r6KkoMILJW
X-Gm-Gg: AR+sD12TEi+LaHVmvXv9DUqFkL3yNZNefd+EE60xEXwqGPHVwMNc52r9wCrmfeiThH2
	vZZeiyTV6f4jZNIexrg03xUoDukWnnCDx5SpC2aUbj0jGfRCnxsF+2ZhF9QWy5orVFW0HiHwd8J
	OkBCoBV34NHE8V5GdRy9rXBvny35rAZVMPYh/B7q0ulCXYW4KXCuX+oUvPOrDNvhn6fb6UVxAdk
	ATuUgxX5FW3fWWPFYcrDY6VGJv5rCmatjhMBIsVr0yIiQic/bK1V5PzcKSyNK6xQT7DM4o8HnBX
	SA1CNXde+/zdbjE6aTPgNdfztWF1dK9gCV/S84iEkbDYQej0ih/8a4vqRM4ClkG8F+qwHfjaDCl
	zx6sFVH5x8kpxogM=
X-Received: by 2002:a05:622a:4d8e:b0:51c:f04:4aa9 with SMTP id d75a77b69052e-52d648245b2mr30152411cf.32.1786530205721;
        Wed, 12 Aug 2026 03:23:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8e:b0:51c:f04:4aa9 with SMTP id d75a77b69052e-52d648245b2mr30151931cf.32.1786530205217;
        Wed, 12 Aug 2026 03:23:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e285sm6120879f8f.18.2026.08.12.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:23:24 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:23:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
Message-ID: <qsxaqckpbvqlrtpd27fcufrmo3fmrp3zf432a2fn5hpvw57mnq@xekhebfewl4s>
References: <20260812083522.774711-1-greg@ferrisoft.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812083522.774711-1-greg@ferrisoft.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX4XgesqJ8fJkA
 9Q9WJ/nPJaeZHVHeSA0z5ZMk3xQJHkhJyYJK8ATv7sIU1LDJb3TzYaKs+I3DL7UyUTAA44R7oMP
 ux3qHHZ9+55YBKWIZpRPZH0uf05E8p4=
X-Authority-Analysis: v=2.4 cv=evHvCIpX c=1 sm=1 tr=0 ts=6a7c499e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=si8rVs-nPMoGx7KwlXYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-GUID: dsPHmZn-7lJjXqHshSfhHblWKjMmAJIR
X-Proofpoint-ORIG-GUID: dsPHmZn-7lJjXqHshSfhHblWKjMmAJIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4MyBTYWx0ZWRfX13gWfrqlvuoU
 kqtGlFB+TV9S/GUZvebMBLW73h4aUzWBTQ3Hd2rV+cu6qs0Sd1Gy2X4scMMYvbS2fUAIAtL2tUn
 wy+UHHdZrR910RqoFqD5lAnnoU2vjJDLRUGGbhsm/loeTBhLs8ilA6pV6TuTQpvqS5Aox2rQsPy
 QpBAr3a19s9SatV1YjNV/TW45/7BlDKnGmd4jTQDVSmU7nfIdykPT436cMyYt1T95XiDoESiPhY
 gDgxHUNBiQj0Ul3Zw+zIHJMl/SHWd3eKhVUzwY+z4pTaBeYHPQsQdMiTQNJpIypPqOJdbsHesz7
 OhDhU5N7y4iukXpbIjiCdAXy48LP5m2VgRZ3Qi+kIe2KWCOtlU8BuBNPSyY4DUDQhHYX+xKTN1z
 PcM6/GGim1nFXGLmFNaQKqjXw2mFvg46EKhjUqgI4bcCll5Wgf3nKawPCtayk3hrnIL1Kq+tCf1
 Krxp5fY7mZKB2frTkHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120083

On 26-08-12 10:35:22, Greg Ociepka wrote:
> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
> are missing three property groups that Glymur's own usb_hs node at
> a200000 already carries, and that Hamoa (x1e80100) carries on all five
> of its USB controllers:
> 
>   - assigned-clocks / assigned-clock-rates
>   - required-opps
>   - interconnects / interconnect-names
> 
> Without required-opps the controllers place no performance state vote
> on their power domain. Measured on an Asus Zenbook A16 (UX3607OA) with
> a SuperSpeed device enumerated, CX aggregates to SVS while the
> controllers run their master clock at 200 MHz:
> 
>   $ grep -E "^cx " /sys/kernel/debug/pm_genpd/pm_genpd_summary
>   cx    on    128
> 
>   $ grep "usb30.*master_clk " /sys/kernel/debug/clk/clk_summary
>   gcc_usb30_sec_master_clk   ...  200000000
>   gcc_usb30_prim_master_clk  ...  200000000
>   gcc_usb30_mp_master_clk    ...  200000000
> 
> 128 is RPMH_REGULATOR_LEVEL_SVS; rpmhpd_opp_nom is 256. With this
> patch applied the same measurement reads 256 while a controller is
> active.
> 
> Without interconnects, dwc3_qcom_interconnect_init() silently does
> nothing: of_icc_get() returns NULL rather than an error pointer for a
> device without the property, so probe succeeds and icc_set_bw() on a
> NULL path is a no-op. No USB-DDR bandwidth is ever requested.
> 
> Without assigned-clock-rates nothing programs the master clock RCG,
> which keeps whatever the bootloader left behind. On this machine that
> happens to be the correct 200 MHz, but ftbl_gcc_usb30_mp_master_clk_src
> also allows 66.67 and 133.33 MHz, neither of which sustains SuperSpeed.
> 
> Add all three groups to the four nodes, mirroring usb_hs. The
> interconnect paths follow the provider layout in
> drivers/interconnect/qcom/glymur.c: usb_0/usb_1 sit on aggre4_noc,
> usb_mp on aggre3_noc and usb_2 on aggre2_noc.
> 
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:fable-5
> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>

This looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
> Note for reviewers: Hamoa additionally marks all five USB controllers
> dma-coherent, while Glymur marks no peripheral DMA master as coherent
> (only the SMMUs, PCIe controllers and remoteprocs). That difference is
> deliberately not touched here since getting it wrong is a silent
> data-corruption class of bug, but it looks like part of the same
> omission. Is USB DMA coherent on Glymur?

I think so, but lets see what Wesley thinks.

+ Wesley
