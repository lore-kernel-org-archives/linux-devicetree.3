Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462726;
	b=UMXXsIAnBWhk28DasR8+ElYd0ibXjtV/RF1++K3bdu54mIFJRv1tIn4tBmgOTv+wQDWn
	 LX5HVUhNaZyO6rRB/kss09wXGnD9KMvlC1w4W289MxGI6O9pXMBzsw5rhjqS1jnVuWt+l
	 gI0TfnL7GxQZYtPrG2HTd0nqiheM5yEa+dkKKfozMzDETCbCvhUh9ftWkZgWDS8S9dCLi
	 WDBY5/v2fu6LM2YCHXFCjFLYVG+R1bzC1zIB+7OmqHTc2SyGZO5q5jLZ9oMZAAfP/6YQ8
	 S+mQYUh1/5wkkhLDyn54TT05FhB0pe1e5o3n12kmzZoR2V8secukZeKR8EUCg+zM+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
	b=Jl+yjsFJVJuaApnyHOUZOJYGWuM79OHzmK9Da3qH4lNMFva1c+vER6uETHU7k5PfVNNa
	 TPoEPeIHh4QmEIAQrbeNOHDtoAOXVupYboGYM8Dsu0jTdgvLeb+yJK6yZx8BGPiNPCwaQ
	 7Nd5C3vo79QmOsZmqU7a9vUjIrPQuaj9lhS3AHXJVgEHOrVWfE57hEdT61kzW+Vqd8iSv
	 5yvosOqYXTUfDMcjehqKR1Y0O6FLvuT3dzFSvHSJ+9xMiTWyI975kzXgg6GMqj7fhUc7M
	 oZHj0AbcSU18LBIQmuZn2/kOWasKc4P0rhBDMCDk4sdmBqsjbA1y64YNTBX1DCmsSlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906E4606A692
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906E4606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGsFg846532
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=woJtGyolaPSm3epuc0oRfWRq
	EJQCl2Rjtu6xIFO48pU=; b=evvI6gG16yb0OpXZQ8sODJiJeD0hRonbIqh306ra
	xuLTFM1G8GcuFl5y7nIH8r9yXtxvkwhHASzlgE6xaS4oG5AvC0h0LygXzvXc8zHs
	SPtx8lVyt3KLLINiWrVUc3SWNGPGP8Ia8/Fr6QI4Gu2LXcgOQmYcM3dluIFr/HOk
	w2x+kcsvx9+s4QYNcgmsXdAbIOJK6Abh/CRHGjaPbrlBiyGsfl8C83R9/Lu4taHo
	GmUfF6iaB67NjLe7g2TWT4Cto8mNG7lzX75auIKcCEWD7unPWTRFOXO7JuwsSSX0
	knEpQgDNcmvdSk9UaI3Y+/JVHd8woyrD3gV42U8MQ4/WYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7435sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:38:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so401454385a.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462724; x=1796067524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=kp772S1ZQlcvqnIgWKj6OJ0iWIzVS5V5IkAE8Tqs/d+wx+tkYygkhv0jpodD5WcXt3
         oU1d60R4xh/9YXlD6G4Tg6WngZTHfClMFaeOsL5Jb2A/xqQLW554mAF3Kw08OXmi4Tc1
         E8FILLrkQZiYHCWNHf9oZndxqVUf6czoJok1ZbYFyHimSXysbx4ZuiT++9Kk/UV41UzV
         poJjRric4eU+rr+W6NT1pxLfibsy/HqIirSJnxjIP5Cftsla2vIAcTbipJATpDKu3tgK
         F5/8mffMetW3yIC8x9t8sCzRcicKU4NkX5zdNprYEuPg+CGod5tEVCJoi4z2IdigBWxk
         uSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462724; x=1796067524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=CklXcjr6GAwMxxn5WKQ2XZhLSkc8CnuD3intx7xXYDjsqUL9Fiq/WpXlVRSnk5wsdB
         Xj5qT5n9jDI0y/3h150geyd3kNKt5PqLxb4iR+m2qFJqecrR2N6kV1giVzP/BA9HAONQ
         u8GXOt0r9ydZs8N5Kj0+5hLKM8esepGLo6Fxl8eQfLWigWDg5wjZWtgyPKCxIkqiu23V
         /v+RL027MAR6M/95Gtcu9Xub0iPsofzt5NjH/6/4CeXlbxux8RbvDZIV7zcdI6H9ziJU
         fK+zxfir+DycMQ0dzpnslZMnDw9LHkLz3+ka/+92KH59+BtlMh6Mj9IcPlJhtP9wQ40H
         /IRA==
X-Forwarded-Encrypted: i=1; AL+hErExSBpxJHRXFMUS6RpW2ZQ2BnngCocPo5i3Nlkwwss8Hvn1M3tsdOZ4opO0b3rcyw1zGE+6niX9xAo9@vger.kernel.org
X-Gm-Message-State: APuU4Z8LbyZbqt6VyvI1GGp154ljwe5pPA/dVHXYabZgjc4kaXq+0Du5
	8BGaLCuhwzTtczsE1laTr05yNRcmM9o7eHeMCWaUGifkQKDHYZkwFljxXk2MwgKLNwGktkQyhKB
	2iN9m5fThD23Pkln+T5K0j1pCwkc1ttQrOXc9h4f3zD+1GB/eB3EKRIgRGq4nDkPz
X-Gm-Gg: AZFdTZc4wY1RqIUgGSxfDui34THG0U0cykpBfZL+tiOSZAfHRUPpr/8SndShboCziZu
	W7tuSseKnnGXdltc+6Watc26ITwt+wpk8s0Q/CPLet1b4jFClb2wer3dvPQnbba3spnAkJ96Up6
	1d2dzyb3JZbCAZZA7RMgrsoXQ+U74h7DubwcPyd1+P6QF2APF5Gn0LkP17O5B7rKwmS4tX6Zp4D
	1lav5me0ix2Y9GDXpkM/dK3szqkVevP0jT2tKf6Xn39w1qgbghZVGKm80GKN4vi8G1E8kK5B0l6
	PPA1MEZsBg2BK+tg2rbt+iu3MQ/gxd3ZY0snl//0IP3uTia9GAyKt2HyrdPR8sf2QyinLrqmenY
	rlth/daWBVyIDlPchke6B9J0J+A5xi6w0VtMK07ht/r/A837YZv+mN9phyjYtBUrD
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007143685a.73.1795462723779;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007138285a.73.1795462723165;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm24078327f8f.52.2026.11.23.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <xadzsuftq6la6asx4r3cdknho3hbjljpkrqr4iblwowbz4fhrc@yt2dbeff5d63>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: wZhmeRRMC_3al5tnSbIefWc9s0rViyMf
X-Proofpoint-ORIG-GUID: wZhmeRRMC_3al5tnSbIefWc9s0rViyMf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX08BMNWcxBnr7
 KrQwVOjqUZm5pHvEn1aX9+PGL4wNi1f5RLxzj3SsZDCiV0MD2YwpmFr2Fyq+VtX7o4OMBKgh161
 lOpNVK7CQQ4cnVGVEfIpM46JPuSHidw=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049644 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=umFhNDnhut0qF75FkN0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwGZVRQ9L58iH
 KRqMigZvFQxbvl3N/aklQQoRr5SxgI1SB1iNJEBWJTMdW3Qk+ieehBkloDpbqqj6qUxRuW2w3+S
 4ESeY02ptQTZ8kPtxyT9H4nl7u5IGYNwDUXVGN6fQDGOd8N+eWdNe8qaOqfUzs8vQhFSoMw5pCz
 X6Ly0bHK9MUuZGyUBMgwNRCrFukZZ1CYn0baLVKKbofSuo+aKwIkPAWInOnn8ZloKwBnhUdTC6E
 LeertQhtrwoSfH84QoMmG8nbl99fsrBFtIRSz3plCuOF3V3Hb8krcPaEwETTJMYNZ7TdG0wI2RP
 96axLaLzD+76juw9ZQNVx6nRpBUR2cCgdZmcoAABVSN2n4PebQIUfN8qICBh0qhtF/nlD8Y1Zk3
 MW2+g1KyBq6+CCgUTBPH25NvyLwH3kdud1lA9QvbqRoZZ2M60E8xoZpgLRU1+pAVgOp07AXwHa0
 gNTz641B/P17lpwofOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:35, Bibek Kumar Patro wrote:
> On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
