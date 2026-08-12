Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B2545D5FE
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547304; cv=none; b=kIkfcfWnIuvBKk0D+nnfMKaXxxxeKYfvuXOWyeWOkge6+FbkTFw21M4gBMMP7+Lg9OrSGDM9FepSMEdkCqGCXK3Q31avQvnDXvVuiFojW1ewpe8KmYF5W2rrRecpOzHQlUyx3KHFfl2VorgJRXMeX+sXCGgXW/KqCqFBBkB0Yn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547304; c=relaxed/simple;
	bh=/HZeIkKJEbfMYUyl4M++7+DHUMqUfxPEqVvYErFIO9k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Th+myKiyvPsojXLGL3ZoCskxrg+UsRWbYpZIqx1PftmlYYPA6/xTjJ1YK7XJmQNBLbBM3x0+6vkZiN9hPH0eQ6c+tkuzJfUXBK3U5vwzH9cmavJvBTUh9DZ68O9m3Ur+jEo2tVRpp03mItv5Ug9/SKkTSDL8T14Kagd6ahqI42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2fyRxSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZNcDeI6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2fyRxSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZNcDeI6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDcBww3950935
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=; b=a2fyRxSdqAcfJTia
	YC40ZY3P5/NshqG1npdGBFHD/w1FPBnG2LVykWmqDsBY3+8ePBPb4Fg2uGAPSitf
	UpUCE8xvXr+X2vxrZb6mP3VpidvQTBoguMNrlzJmABb8XwszO+QggkEA3QyhV2J5
	tSg8VYxdvw8GEb5ku+vCEirE+kGvlYhlbHqhDA0qhBSNYWoCBwouXQejpnPXGx+7
	3KXwEw9TO25DoKvs4eV3A+5K7vzvQlbiRyPViDXcxXnZdCPLSIY2ZOXXOz86OclT
	DD4keaUrA7SILJnsS9XFp6Xv8HvgyQIT6QZl0sI36TbIp/hcWdqJBddVTqfQD4x5
	lzzLQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj2tj8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 15:08:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso776274a12.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786547300; x=1787152100; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=LZNcDeI6KQ/vGMLh8GAnrDKmL1VyTOprvHSw/a5wYty8wyhpz+xoX1x7Lgy/c7JSvG
         CrtKDKEOfJ3HAytXF/o2Kc65q7k1Q41lmCMIJ4kO1VllattcUHlh+qopdyXrGYgengYx
         1L8JQ41b/rugQY46w5VqrGyRBGU3Ybvz7oYMWJWl6rRm9Y2ni9K/XVHXL08+sGX7mTts
         Y8JUvLOOBX85hbUBdvBWtmTB/OgB4h+yQnZ/f4fOOA0F7W4mxaqQaXEaAnyI8i8jw/yv
         zUVdZkdvE/p069u9ZqH9cn4GSA0B+CQUvU6E66L+/rJBs42Z8bwlOKZdDuJaTCSiLwf9
         5YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786547300; x=1787152100;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d5og3NAwXYSPZz2d48+V2J5XesJedhZ2AvckE+OW3Go=;
        b=ghjnzKMpg5IGB0RhIXv5weqpPbh+orIR2EMMrjRi4fMH2hw9qfOZZPYjAaARrf7AlZ
         8njDAhkbtXWBhhzEJZV5QCAQPHclxU1txnmKaRF7p3mcL1GbvdTcEyb+QOfgO3bLZlUq
         5JOW8f27t0cRMrqepBq/4+9kn9IxbN7nQG9ACEAP6Xu1p8MIjw09fXOn98rZLGS5auCd
         XpZ8yJ3dYg/MO2ptv1nQi1QVivxN6LPVwkco75KmF8L+gCPqoaoJWiHylhQeU8e6TzAI
         xXMVXbTPm55dz94qilOkHtI55PHRsihOXXFspHEhA9EP6Uay8SwxtI1j91zmAkmEqp3g
         vEQw==
X-Forwarded-Encrypted: i=1; AHgh+Rp65WczO12Sfkd+XndWoKroP7philbzw8fCN60Ifkvc7qG1lfV4J4q2ATI2VfU7bmcdTUQixz7aWapI@vger.kernel.org
X-Gm-Message-State: AOJu0YwpYUgcDxDW7sk4hl8AoIGvuRuxJ+LDl2Sg/y2ETFrlbfbjWPT7
	P/ZAFGbRX17w+Fb9p+XjjL1Ha6PH/1wdwpEJVMs75mHBnlu5tZfhg+Ti3ZgyzUWqVWnuX754GO8
	jri3ISZayyPZCejmnCGWRunyH1sEMjCdAdZFCJt3lnHhfv79n/xmjkGHrMU9whmUL9HcyZL0SMs
	kXxw==
X-Gm-Gg: AR+sD10LidHrmfhD/XHusnr6eFr5ZWYRGKO7lYMZ8M6BQzf5pS6mIzNPyEPwNUibH7J
	xzb6WYJnohwqTiTl7AKvB7kXuH4mxfWcD2aY0GlRxCkHAfFZpj211JkWGUHsreLaFECyrkoM37J
	oGmaZGRPcgPzHHX4VZWOJtoLdSacKBYgIG/kzPi0CB1M1RrGXHK1igjFjyIFk3gnkEgmyUrtFrw
	kM0jCSg6R8SsI+pw5rGwz0UNpbFXtdUsc8o4fL3at05qmDSMyJL0oPS5oKlN5eNLuHpY4uryfcR
	wLZD0y6IacRi3h5M2GQwPC+JcLGcf0h2+I/RmuPWPMhm20fLN62VsnJtlsQ=
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411180a91.19.1786547300504;
        Wed, 12 Aug 2026 08:08:20 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8f:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-39301621e8fmr6411072a91.19.1786547299966;
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94f24fdsm3850262a91.16.2026.08.12.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:08:19 -0700 (PDT)
Date: Wed, 12 Aug 2026 11:08:14 -0400
Message-ID: <d2cefdc95214a7912df9e8298c010b9d.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
        conor+dt@kernel.org, linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v5 12/17] riscv: dts: spacemit: k1: Add Zic64b ISA extension
In-Reply-To: <20260701140057.EBFD91F000E9@smtp.kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
 <20260701-rva23u64-hwprobe-v2-v5-12-2c61f94a695a@gmail.com>
 <20260701140057.EBFD91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=a8EAM0SF c=1 sm=1 tr=0 ts=6a7c8c65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=xdqrkOY86ttuWl1pWAoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: aHUwiTiPC0Tp54VAq4Vp8Czv-CRDaW7B
X-Proofpoint-GUID: aHUwiTiPC0Tp54VAq4Vp8Czv-CRDaW7B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfX7vtULQP6Pznl
 QMBKEOuy2gZQLU6wXOwGhlNdnzBsAz06UpXdp3JGxrxP/3n8Q61gG6Qr+1wdqeQumLJBxnNuz77
 Ls/v+W2XNjrYLsVzOLmTE4/zd0ZFNdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyMyBTYWx0ZWRfX4SCMzCxLzhQz
 RJg7Bvc/9UQ9eGvOfm3yK5vUNXDHrkQF4+0QBQtE20eygUtHEL9GfyfzWMUjnp1op3OSYXkmr63
 BlCoyAtlxlMnY66QYQvYP3h33Tou8g4z5G7RERLZx7CdMjIu6U2QeFeb1E3H6rhu/5ggAszVOCq
 0S4JIn+qcyYekMQOVGo+zSm5u1UeUGs1zAnSRLJjp4RwvmQLL/WtMoLv5fuY9zEq3nTY5+72R6b
 wzYNo4hTf5c+Cj937CYpyCSg+jV37jw4oAoI0V+buurch8YoI5Ru3LlkatVoFCaJCZn4RVN1iIb
 QZaLx258itNw9btLE/vSsjkSDPdpEFtlxEDkeX5e8+/chkbnpirRPheFtt+QlObxG12oJFUF9uk
 WGdBJiL+d+67QttyX3ng02HnGsIi2nFbgqKpozXCQRC/Si6GEPykZafoUYGigyhxrfjY5XmQHWJ
 Prc59uI5MwmLcwvDSBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120123

On Wed, 01 Jul 2026 14:00:57 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Adding a new ISA extension (`zic64b`) to the explicitly deprecated `riscv,isa` devicetree property.
> --
>
> commit a35d1f188ef1737f4ebf996e0483596e27176d0a
> Author: Guodong Xu <docular.xu@gmail.com>
>
> riscv: dts: spacemit: k1: Add Zic64b ISA extension
>
> This commit adds the Zic64b ISA extension to the K1 X60 cores. It updates
> both the riscv,isa-extensions list and the deprecated riscv,isa string
> across all CPU nodes in the device tree.
>
> > diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > index 08a0f28d011fe..f179c619f5807 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > @@ -54,12 +54,12 @@ cpu_0: cpu@0 {
> >  			compatible = "spacemit,x60", "riscv";
> >  			device_type = "cpu";
> >  			reg = <0>;
> > -			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > +			riscv,isa = "rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>
> [Severity: Low]
> This isn't a bug, but the riscv,isa devicetree property is officially
> deprecated in the devicetree bindings. Is it intentional to add the
> new zic64b extension to this legacy string?
>
> The accepted policy generally dictates that new extensions should only be
> added to the riscv,isa-extensions property.

Intentional. k1.dtsi carries both riscv,isa-extensions and the
legacy riscv,isa string in every CPU node, describing the same
hardware. As long as the file keeps both properties, they must list
the same set.

Inconsistency creates confusions to readers.

Guodong
