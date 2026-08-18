Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B647F777
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787074717; cv=none; b=uMp2tknxwJGmopk0atDcxC19RpISQoNOzVJv/V1zXxB4zXBHbUhzvyZg9zbl1JGowlKtEhVK49PSGNV0H0u9XBKbPKq7olVofphwnx6t0J7pdVAPRd8j4K4rNPm+VUafklkRa9qtvJJZDchFgMLL8rPHCIl0gGEZBrGl3B/2YvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787074717; c=relaxed/simple;
	bh=G227ozOR6YZGsveigSnSJ/VD7xq2jTvpGPaHrNvHe4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EprRSCQn6nDMh8djRboIkj2XuMkm0354mjjciosU8tHtMeTVnup68KBRWOxbaRxORsZ4hnwdVCrDIQnB6oxWCRFhwTXOu30kivUzz0u8bTAzhMcA3hLbf7RY0U7b/uc67XfpLqRU32Al2dthVOugeTRik1FCce3zZQFIavSzvEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAv6iA+M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx8Ed3FJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAv6iA+M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx8Ed3FJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IHGx8t1549009
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 17:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OZzXO/L4OGKla/e1sm5ctZ3k
	8+AOXfY4wGZlOTKQYrI=; b=XAv6iA+M+SfVm+feu4Lkosyyt78zQQaWc5OP/wQO
	2/TupyxDFYqIIRG0Ouzc8cPr22iPl5BgRfS4JjBM47CdGu5YACi+CfQ7bCLnVhNN
	6fJKIN3kG0hPeGOB3QXR6agByqHoHksBY/XFtcPGGgxa2QJanY0WoWUb8wzaOPqS
	PH0LlPHntaNZEPtG/2LgTfqInDKK26yJ0iOT3xeU+FH6UXkU9jNHkzok27QWZ8q4
	aGlwvQVSAoqJhZvLl20sxBw9TZ+kTN5tZXs3ADIV7aZv+stx0KpMpC2xy8LcUmFi
	6EcaREQsxf1DE6p5MaLRd7RqlKdNBPPDelFI9nOOJ3JhEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4uj1g7dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 17:38:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso42487a12.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787074714; x=1787679514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZzXO/L4OGKla/e1sm5ctZ3k8+AOXfY4wGZlOTKQYrI=;
        b=Gx8Ed3FJIL77b1/B7M0ugOPQJUHvG+xmJaLhvqc5/rz4jDef5IIpYupJfsvLJ/xllH
         3n2AFt1i3ubaM93Z6j/9h9KvY/5oEh3alVzyScpoke5+JDTtNWt8EatTZBNgVnDLl8Ae
         DrHjLp2j8PjbRhFSdSWp/n2oqfRb3rPPnaj0YYxLKkVG+ISzJnUGCJCm0lD6tC8rc2zx
         jk8KF1qpx/4bSb4SheFHtRhnbn2S0T1rr8O9kE+ZuToBMKQ7cSSBklaNCU7plE9y8AAg
         e79fnY5T0/XM6uwdj701f+/qTy8VXjCx7+F9dnCC5FZfTHHLGnZbGW3s+NR3C9obTVS0
         hPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787074714; x=1787679514;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZzXO/L4OGKla/e1sm5ctZ3k8+AOXfY4wGZlOTKQYrI=;
        b=Prn+IM/sMNBE+uI3Yr5/MSWZ9gsdrEshZH9dMZDHGgB5B4L+6hvH88sb2rdw8Kzip4
         Ho2XrElZOCHZT9+W7L/2vNZY6ArrT4YLF+n7yhLYf4ahm1yUHKmO7EErmP/hk5LWcRf4
         2uAfik/axPIuZrzBBRhZlfGkw6FHn0OP2ms4SRCOoRwNzFFBw0Puoh2dXOPBVuJjp274
         mjm6eV7QKJXPZJDsAnUTMs/QqGkLwpYyT6mI2P9c8M1RDR4i0jcrpgB1b516k3y/0eR5
         +Qy86FxzxyHS+BY6mW9cvV7EndVuQ7Bxj4A6iBGDQXg6RitzIMGKGTiBPU7BwYqSjY9C
         bt6A==
X-Forwarded-Encrypted: i=1; AHgh+RpnDcWprBzVuEaQ+iXVhOJ7Rhdpmqz5xHo+vBvyW6Le3evH845Wfk/J13FB/H3N5NLHaTZSU1HDGXGz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64QSezpaCubAtWfujKdOupkN8UK84wgbCXsJxhdBwh/wW1zOq
	KnqjPiVbIXZoVLRLTQ/p2V6tU3cG3cUPTsCpVNkfNKS/luEJ+JWSgXXXh/iX2auOQtxsbwLq2Z7
	yTDvZvkY9GvEBmv+MbpAEFkwMY6Ry6AU+vRgfUgjnG3Wbey3SG23tyAXHTqCGZuRC
X-Gm-Gg: AR+sD12hJTuIfHMwE0yhfMPTfZjxzf9LawRYwAwranhrj5SgqTre8w7UxY6ar27GjCc
	NiHydE+R6nUXNHXqK+8oRzwyZYwMzYODkE0XEhQRVFlxwefx4FR9+dJOwbZCdNx35VZpO8gVBiI
	p2vRtHIPe/4QOSp5FwDjAgOau9W/K8PijO6b//bAtjPiBHcKpQOG6Kk47Mi5uFhcCvE+7Y7B2P9
	F4U9KRlJdyj2Rgfg/HS/oA8wWoofWOifrOJZu0bBzA+z3EO7pllC0nNmdVruoXzQx4WMMXf1EKB
	IxaKgki8NQN0ibR8A8cRe++DuiNLdUEGnIMaDsjCPcSmdkJLad3uPVleK29vgeOv/qKItQRbygg
	aCI7c7TOupWPpyQhsLChpl22uTw==
X-Received: by 2002:a05:6a21:504:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3ccda405880mr16182280637.5.1787074714147;
        Tue, 18 Aug 2026 10:38:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:504:b0:3c4:2b8b:e88f with SMTP id adf61e73a8af0-3ccda405880mr16182184637.5.1787074713619;
        Tue, 18 Aug 2026 10:38:33 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141530793ccsm19640985c88.8.2026.08.18.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 10:38:33 -0700 (PDT)
Date: Tue, 18 Aug 2026 23:08:25 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <aoSYkaFTTlPOKz+w@hu-mdsor-hyd.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
 <20260728-shikra-work-v3-1-e08c322596ac@oss.qualcomm.com>
 <ee479488-9f36-412f-b6d0-725180cc1122@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee479488-9f36-412f-b6d0-725180cc1122@kernel.org>
X-Proofpoint-GUID: 8BFGn07Gq3fg0o2fKsTt32mj-7iP49sr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEzMCBTYWx0ZWRfX2Z3HiWv6bxOU
 xukyDxAvDzUs5a9qjJE7eH//hcLS8Vq8kTv93efDwOURz0MM2Rwr1BkiLHsY+SSL55KBVtQp2wk
 8oTGNrZS2VHW1ONt5x/AekWFb8mWJ3s=
X-Proofpoint-ORIG-GUID: 8BFGn07Gq3fg0o2fKsTt32mj-7iP49sr
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=6a84989b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8K9nRV67sesUJCHgNhYA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEzMCBTYWx0ZWRfX4GWe+CUfICaI
 JLnfpcuh9LGGY4+9JJ+AKVzLYCjYlunLIxQJFK1DLb1EH6A7TQlvPMVFweVmKZlai2BVAMKS5bq
 ztCZMlevDqdE9RhQJRtFgyGAsmQc8t19TMUflm/qLl+d+N3vaf6wLw+Aml5igepaN3ghbCQoCp/
 R6x3r3YGi/+x0SxIiHOH7XbMBq/sJLgSf/I4yKoMAt6a6I28BqI1WrIL/CCCy4qpVqa+7EDpI41
 EPJGmB4glx+VsCtOOXbhJ4D129zMDVdXlwDicwmSHOOPlqUbMS1mM+b3pTEXYxrBeXOk8dcrgUi
 b2kjML+tYgou30Qedze6Q6dkxf2Ra5RogShj9ycYYox79krCJKE27ygkYhAr8brFsrSuAV4N9Hy
 3ujOz0unNFF2U0cgcz6ofuZUbs3RTco38a2nPtt/yBr9v2cZRPBFdgMRRDPgCdVSZwPgIWhzbpy
 B2jPyCKx1d/p20SSATA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180130

On Wed, Jul 29, 2026 at 08:19:36AM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2026 14:00, Mohit Dsor wrote:
> > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > 
> > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > 
> > The bridge receives DSI output from MDSS and drives an HDMI-A
> > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> 
> Did you ignore here previous review as well, just like you did on
> LT9611C patchset?
We will fix all comments here and submit new version once dependent patches are merged. 
> 
> Best regards,
> Krzysztof
