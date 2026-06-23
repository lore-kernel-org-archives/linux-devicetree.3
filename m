Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781930DEA6
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232318; cv=none; b=GoR9CrJDxfpic5f9Eb4TYsLBnFLoqshsjTZ90LFgUUmyeSTGfiJg8OHQrUqlux8d82/DThjxtSjnfRMeZBtemdVHL6kAl14s+9IQcxHljCpxN8STb/hofuzSgGzbMqYeNtW2W4RHDn+ux+gRExLQknzKczHil2InlzKse9io9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232318; c=relaxed/simple;
	bh=zYwRlwa37Rk2TVjMNmDVdga+Wy3uYUUgKg2SsmHDRN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wn33aiwp5eTQno9nDEk+46uIzqVskQzMjM40HMzrdAEDmeAWrixylMLAruF5bELKx81xYpfSf8j5BQme/9Nc6oa9Tm0we8eCGT2XlAQ4nI2z85Woz+4ClhX7AMZYV3ub8PBLwi2e3xp2GgwfLDRUv+LaicXp4MoPxpEiLguU6ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESUWwHoB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeCLsBGW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESUWwHoB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeCLsBGW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXTVk3744683
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpZit0nzAD1TX3LmUuhtrO8w
	q8/DhirAmsH9yXDIezk=; b=ESUWwHoB/PYrdnzgspHK50aVHFG9HG0SsYqEfjcK
	zy3aoaNgH/czKeAZ0dhYEzvc8zj5J+CgxxbnedXTsuYRgPWHLPc2PFl5NVhl71B5
	RzAZ1QTHSeWoAg0DmOfZuqmnTFoJ98qSXI13pKXGoBq6v22b7zOvt8Tp8WiqEJju
	p9oePXq6Oj8Um594mC8b1BhgZVi78fg1jRXMfsxb3w1ShooV4RrqzM57YviXD7BM
	J8FvAdOBL4AMuiWP0Dh9PCHX85HUP9B4Te7sj9/puAK1R6J42yxzqKsFGGXnfzfV
	5f8fJ05IbJCt/q4yfE+sukmirsLHgEPcUWhEzCioqzK8Zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx39yts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 16:31:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so10086a12.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782232316; x=1782837116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpZit0nzAD1TX3LmUuhtrO8wq8/DhirAmsH9yXDIezk=;
        b=ZeCLsBGWDpTcpqUZ7m+kJoXzdybP9sVnr9uhni7RsPtssRkevUfYkpg0e15VBb6MB+
         4jyM/BRpcrHeD0BceuPNpZyqIqxpGiih5rDX2Dsrw/dz624tm6MiT807qRcx0EadQwTb
         l66+LP16pxRmk3pdkkh1amrrIBHxV2JXTqghozOHz4CQHFAP2wcRdTW4BCuXL5RdvRcU
         dMClolOLBOqMqMXLEzp6NCoIVX9Xju4qBN/TLtQ+5KFzDtVZhcpKn7ltCecRbwchpKfM
         cHZZFOYwtAwBUDNmPAA3a2uhSr7Onc1G2Gj9Uo7QpHkSTKATUdu2rWU3anxAKQuVr0gJ
         ArMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232316; x=1782837116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpZit0nzAD1TX3LmUuhtrO8wq8/DhirAmsH9yXDIezk=;
        b=EoIfD3Sx+PLeJr+ESmxfbyYFFtUl6gkWn30NttWMUZhfPw1KXcIQaGuzDyNqyuMEwB
         xWSfNS8IuPpFDdDxp9Q08vCZYYjVl0ptxF77XKpLJfEWdyY7jUE+vfKBj+i+/JV8qyeU
         Kuaa2jRtRBvN60ZiQO/8UHryQtJQ4a/ZLrCnZIBdA4rjHjbD8xQEQ7rpucTleoui7lAI
         W1Xa0sPs6uRCOVH8mbgnP0pPExVdeRmjuLJtPr4RyRUcq3IgWkfMog89VfA57Kqy55Hx
         yG22SnpI2KuYjZAJU2Kfwn39xeFF52L+GVNOMHUepABuYVD4RyxW9HrpPjtd07Bz9LJz
         OCww==
X-Forwarded-Encrypted: i=1; AFNElJ/WLuF4pojTsCqci3CluwSUDhqZWlG0zHCOKFsxDAUOaEbBqf4/sfoB4wKo/fRegJme8ovzxwCUo3Oe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1VSWsZszJMcCW06ISCVvvJrbV2g8hVX82Bft7txnORkmyJRP
	LlMgTxUwa87Lq0fL/dI7HcTtTbfsAqOFMrepyCjXgmI8zCI8GrKe26lXuCq9jJonFirPzyoElFV
	LZ9FO/XDoT3ccWCrBFHg6qvVt68FoqwTfxyHaM3tFn0pclw5KJbyuiqCyDPNJtPlv
X-Gm-Gg: AfdE7ckoqe20S5+lpvdoY2BRi5BaUmV2CGOMxQpH4LP/S3/7dsfmJYQfJZQXuNE06Xv
	KQa1Y9OcNF9xGFjydKPpxkZ1QKcpHR+Y8ue0Nn+j+KMIhoPEVvBeI0PuXPLI+huYpeIKLQulWER
	gT3IHsjx2fhfm3m0Z5UwifNYb90rOPRkwqGsLlpQZi3/qrbAA9DFz6OVxxU08Z/4HZvt/aIfELM
	Fka7x4J3Pf+A0q6x+anSpQxsxNIQPBDI6mfbmqDIGo/ejKBR8uUV78AeT92TExLHsqaeoMq5kDV
	ssIGKqWU8yKW5s9ViNkD8Jt4XrGNRDpIma4mmIP98atNfQKReBCpmUUHYhJMdKeqMKzqs+6dD0A
	35udNOZZ60nqCSbcoqeMjO07iGAbU4sdhswufMw==
X-Received: by 2002:a05:6300:68c8:10b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3bd151fd460mr2827989637.35.1782232316117;
        Tue, 23 Jun 2026 09:31:56 -0700 (PDT)
X-Received: by 2002:a05:6300:68c8:10b0:3b4:870e:6f44 with SMTP id adf61e73a8af0-3bd151fd460mr2827936637.35.1782232315599;
        Tue, 23 Jun 2026 09:31:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5a1dd9csm9850337a12.22.2026.06.23.09.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:31:55 -0700 (PDT)
Date: Tue, 23 Jun 2026 22:01:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v7 01/15] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260623163140.l7dvkqa5szqkej36@hu-mojha-hyd.qualcomm.com>
References: <20260522115936.201208-1-sumit.garg@kernel.org>
 <20260522115936.201208-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522115936.201208-2-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3ab4fd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=scVuWRnFyv5x-Sid9UUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: y_XuzdS9FaY4NF06ODBryZQqor431VeZ
X-Proofpoint-GUID: y_XuzdS9FaY4NF06ODBryZQqor431VeZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNSBTYWx0ZWRfX4Yu8X3Al/wBN
 DR2/dOwl7dMXeLvLo6fTTKAI9vupq/hwXQsgQkBg4tfNp4eTvSrk3UxCg17X8c1mJl7ts4rBlau
 3FPYe28BpSbznkwr1Rpu50lI1InIkMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNSBTYWx0ZWRfX3EdJeo1uZgMI
 eNM12hIy/iTaurpKblB4HMJ8Kb4RQbn3CBQBYw1K6pLkWKHdmggBqItKH9jZ5V8K+PCAqpFibzG
 QXoTI6+XKeiamqsCl3xsc//FGbT5UmqBBkKIkMvVTWYMx+xlkEJGtxi8QdCQxR5x/PkqkMtfn6H
 JazpZFGrWVGcrdpbH3dZadRZ1piS33GXOaLvqMx3BhBybD+/Jet0IPHaKxi28Ddv3+aUka/BxgF
 aP0srhBMgTi7lByr1vGpth/NopAA+stylEFa06j6yewYuEAMZ4aLYS27RRAsahNdwMRJkhXPkVZ
 hw8jm5AwtglJuI6ovQhM6u/kZ5Hcis8gK24cICkyBuT/m7z9wuhaU3kmUENQRVlbjtBbW7RGp8G
 +W9XVP+8XxAwRhVYb1XaWsIraP0M4AKFKEXUn5de8yDDWDrBeavYMXSxw7jUuUUPlz3VU6lDdfM
 VY4Xpma1Ozfcd0KaKsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230135

On Fri, May 22, 2026 at 05:29:22PM +0530, Sumit Garg wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> All the existing variants Kodiak boards are using Gunyah hypervisor
> which means that, so far, Linux-based OS could only boot in EL1 on those
> devices.  However, it is possible for us to boot Linux at EL2 on these
> devices [1].
> 
> When running under Gunyah, the remote processor firmware IOMMU
> streams are controlled by Gunyah. However, without Gunyah, the IOMMU is
> managed by the consumer of this DeviceTree. Therefore, describe the
> firmware streams for each remote processor.
> 
> Add a EL2-specific DT overlay and apply it to Kodiak IOT variant
> devices to create -el2.dtb for each of them alongside "normal" dtb.
> 
> Note that modem and media subsystems haven't been supported yet due
> to missing dependencies. For GPU to work, zap shader is disabled and
> in EL2 mode the kernel owns hardware watchdog which is enabled here.
> 
> [1]
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> [SG: watchdog and modem fixup]
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

As discussed internally, I will be taking this patch separately and you
can drop this from series.

-- 
-Mukesh Ojha
