Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093823F58C6
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373498; cv=none; b=S7NDuaG6MGupK0MNf2YE2p1nQAuePPBPhDolR5Ym02BGlduuBeJhy/SHyI1PQLWvHrcY1g6EYFAgzjOrf04VBduMGT+zCCXHGN/98bqMmApOVHOGGx/q5vdPKwSzeCGGiVoftoCXjjle0+e1GcQYuChcn7e+XAvMFgNKubWKlx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373498; c=relaxed/simple;
	bh=+yJVUqDXTIZuke7dSFRZiIYi0J/L6lEfd/W1u6sYik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjwxHKoypBTxAJCFDM66ERV4Xm6bXscmA7eR3Fie97xFEUdyNOBlABde/mdA5uKorfU4qhSCsb3tISttnjZVqb5bPXgfC6CTGFxy0fuTQvRAq06I23XBq2lRGMhBnxzjXShgSEqpL9ofdQzZB3PEyOvzDWu04FrKLYT+tvYqv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9xRteVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brwcbMTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9xRteVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brwcbMTg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEDxB1655372
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fzDGxXLJjspm8ID6JkaqhKtT
	kAtG0hD6KCQrkPkv4FQ=; b=g9xRteVhP5gefYbx3ff3+GVHkD5/NtiD8aFuBMmo
	LEvcsBjk7gLxGiEeBkNwuOxiiOUkedrQgK/jNGCTT8Qx/jKdOvE7Xb3acU3YafMq
	bJWF4WqKDd9ZtgDi9VlLEp/JtlO0xxZskJUD61UsCA/LzCawqqyrJbadehamQfhO
	ACULbQGHjRHrqnuIUhZjcPAn6C3bZZwwXQCINsSe7FIGkS92zjGhusCelovk8Yxm
	fGKCjq7+om8sGd39x9soMcEnV8RwKpjCysdN/UAlBLVv99omvKFvpQ6DkdoW8d43
	+nMvnk6KMg++WBqdAd0X+NpH4jWzhYoHiEJoJEmv/z0B4w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpk26j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:31:35 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9693cc255cfso3423379241.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373495; x=1783978295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=brwcbMTgvJimqo0Snnv4ZEmiagBgwDoCjn3KNoAOasNw/tAySTnJMc6STFhdLfo+ny
         o4XFYAai/5mdPgol9k46dmW1vcqVkdqA3HYYlwNDijTEVFr8kvbS4gzPm4EkJBwDoTps
         LfKGj+/D5TmMJI3AmHLdhTbA6wHhwMcLI/9ghODy7f718FIVy2s3JCe2FUoLGfG0E4fZ
         omU0XkjQEvpfqLhKYEiz10iM9Lc0Wu4t+VG/T4cCqTB1BSZqwGCdEe+mySYLQQUPiEoz
         DuFCL+anQKuQt73kN68fMbieyuLdIE09rquA2FGpsaX3liqnXAe3C9kz+P6mRTSYxt05
         /ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373495; x=1783978295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzDGxXLJjspm8ID6JkaqhKtTkAtG0hD6KCQrkPkv4FQ=;
        b=IW0IRUAHZzr2jCoq3sXlbN8cs7wJbdZ5fVMc5zQ5sv4MGrB+RlqAzvJz1/WYGYdBLi
         /HV0xVnAFeTa2uwzfzVvx0w8Cd/S9UDi/QEyBG0XabrN3GtnLscC/X56aXge5W2Lnidp
         zi1CXNM2dIohxexgkY8qVT9uYFg/az72SEFrvj26k5ov76HHat9ajtLawdtyHO8D7Lel
         IVKC5JrfvzjZ/Ybz4izTYrZtesJWm3/SSygOO+LT2brJCkP2c4F4FNMNxA6SS3acHFAt
         OjU7Vn52I4/ns0FOyDnRhvjz0YBZZRNA4hiyPYksJJLypn6HiJ+rEFNHsEInjOW6YqIR
         xT8w==
X-Forwarded-Encrypted: i=1; AHgh+RoaQL3XqoNcK6gVI6D2v0Zx69k/LTZ9wQ5AibODRSs4HkeX0+68RjIVXRcLZXunO1/s/szcVSrIfK8X@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6pFEa3TG2ZZcD/GNkLUVozZXoy74Ubx7Tu8KjnOW5j7EbcGo
	2VY78k8EDa6tdtOAYLA4+7/IDygW3HFKaA3VwtC98Q5k1br6iNcUKNf5rOvi7d71PKK3V48SXqT
	DfQYZVxrK3pQfsZC0VMPjUFsi9VV0ElsPfnRfoiaMmHwp0T/mo5QimkZSkTKMfJ7Y
X-Gm-Gg: AfdE7clABxt46Aw5iqIn91PcOp0iLlq/zaQEfzukyVt2AommepTGt2fnbFlYpPZR5mN
	JXslUyHbIaSM/Ei6Mkzyvoh6zfAjyoqIAUSRRDTv6cy/6ML3q70Su5Bwu3AkXMWy8S1qxETBOh3
	gIMrnpUldDkWcRKps1to0ZKK2A/xjVyKe6wKq7t1/PBPBsv1fR35vfFCmwHPXbsxDcVuWmt95ac
	GvI3oaECTBPLAy4LCym+mBfrdmP43TwYJysoBt9JdeA3l3WrDAw+koML3Rvjbm0GecaPz6dlLh+
	OWnSbAjT3xMH1BYlTEPm33Z4gTRm9o5ETwFGN+pD6uaAvh2tQUZ3GlJIuAvesr5adrjweH6CxB/
	Tk+u5js00Bjw4llhT+6/u6iIpRnMntpZM8f1S5WIYV5OMoBgkN76D70io48+CWDM/nPimGNGbuw
	nJaLmQq9KHqnWo6trXGF/sZH9K
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166754137.14.1783373495242;
        Mon, 06 Jul 2026 14:31:35 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:744:a3fd:410a with SMTP id ada2fe7eead31-744b7d6e301mr1166733137.14.1783373494851;
        Mon, 06 Jul 2026 14:31:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb868sm3149884e87.47.2026.07.06.14.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:31:32 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:31:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
Message-ID: <w3cid5vezrofchq7nagu5pzasicagrzj432j3l4rt3ebc3slqw@gvtvxbkkplet>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c1eb7 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: cFGqszR-nD0SMbqvcyQbEyNPzHKjlGA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfX6hRZJpPz2uKi
 pwtrKhC+Cfgo3tmd/o2U+W+TeVCu/YxcY7V4DI1zhZkD3XPiYuvE8TbBcXoOJPVD7T2tJu+Xt5k
 ORHtS8QAYQ3d8NpxrxD/6X749elB3W3Uz4hGRYQqWpq0GNAnaJbBSZ5ap0Q4NnMhwondNwlfHqV
 5vN3BZJjgQrF+xSsSdV+PipepcoAu4EqcUfKzRACz1ZIWBaTE1nKe8uLmHMRow5dip2BRBZyjx8
 kbXtS/SWV+5EvERrUABN9nwL07E00xT47pHOCusrGlc7nHh0pGU0hICesC/phE1Tmheb/HQ5/w9
 I5CXUKMEt4ila2o3ONX9hegkczS9Hw8ymdWyGcb8vgpqyrIVem1mP9xT3XIxe5eC1ozTou+gnRV
 f/tGb6qShyzMA2nyNWQXdbF3RznGv6SdYAkvjEkIIoWUFYKmO7uZsC4KRg7MYnwquur7xZlWrNf
 Zy1PpUQeWLGzC4EDPzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxNyBTYWx0ZWRfXyVPy3vokWe5a
 9e2Q94cLyagB23OS9lPsjCaC2zmqIJG5fEsEy9trIxPll81zlpSN230wm+SjACs7qPJXTfM9BuI
 wUDUs1ExYeNzDmWnhkXNDCnBcxVAx5g=
X-Proofpoint-GUID: cFGqszR-nD0SMbqvcyQbEyNPzHKjlGA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060217

On Sun, Jul 05, 2026 at 01:30:08PM +0530, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the QFPROM node and GPU related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
