Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EAF3AA19B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371339; cv=none; b=nfGdFDcmaNAbwNuntvKig8+fXe1Ohx58EQFS8dYFk/+C9x31sB9tShN+Qu9xNv6WmEEdPoHPjknT6bIWQDUhvtrfczxU0W5BferxgeY+Ctg8NfAtIef8npubOeaJS/cjHPFFIEkcbGTCI7uen8N6vev+1QwwT0/R9IgpoodyQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371339; c=relaxed/simple;
	bh=zkqQY0g40O7tzHkPZvr6qu/tyr/ulYc6tAuUweY152M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G21KT+82r15odLzYFaK72ZCwIZe4cX5+uBQq8dWAR91Iv+frHwe6VCuKFp/AmfMXxo5oJFCbxa8vR1Xqx1r9j1map10+Y58OWPD3BevLO1lrKttd+VgownfeyKJ/hFfSYY/KJXFhKKjMUnzxwvAZn4meICE1AE+slgMev72QH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBAOUimp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jD605tNG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBAOUimp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jD605tNG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S25G3351624
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tfcBJLN0sEaaIWpvWTjozk01
	Or3fCbRWwVDZEbPf6iw=; b=lBAOUimpCdUPikMNPL0kXammOLvea0iMMbnW0C/r
	NWuVLjSerM3bpdD/eX0uaX5XI6KJaGN0luefSoaBzjDTDwc8y9V64cE4FsfPiMLf
	hESaXPcs701ehUHcXwZ7cirUH9tcXMh12n9+CZv3nicnvd0RAa8hqT/iXZyIOPL3
	7audb9Goj8xxrMNeH9fGUY0p6/FhVOrbjwjzgJc76TaAea57Uql5VNwp5PeRwPOj
	CzncMF+MHShSV1K+uP7jUHeBoGLUYg2cgzpiB27FAuW1znY//1VJ7vXngSEgYPpN
	94P4N052Jk7kqW6Es0Kgnp37GwHw2vUStDW0dA8aUmwGaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg00xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:35:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso393775385a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371336; x=1789976136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfcBJLN0sEaaIWpvWTjozk01Or3fCbRWwVDZEbPf6iw=;
        b=jD605tNGAyEDijGo3Bu//jqHSMAcl+ZZwyQFMbdU5ZT9WyzfnDeCwwgeZD98U+ADkX
         tq87wd2ThhEqH8sXd6v4LIenEQLBNFHF8wRjpky/RaSNq/LLe2bLJCA9WL5fChrqCx27
         dWcmhLtgkiQk5/vLHJ3a9xk1HCcvGEn5/koaIaAkvjeN9oaqW4JXeeP5ZRYIHb+e84LW
         +b0imWTcvqEvPheDE/MzuJiZQyc5K9YGXjEISbdyiZGTyQ1FTVxOBJgVc+mPP9kQWqkM
         3xHUei3lG/pZoPpiToylb0KSrVZNxH6JXYt8JlDDx4hwxx7RNdwNvq3Z0omuB3PEE3Q1
         g1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371336; x=1789976136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfcBJLN0sEaaIWpvWTjozk01Or3fCbRWwVDZEbPf6iw=;
        b=hAuqdi2msFJ/8dPm1OLPKR2NY6UO7reuMta29+dIknbLEVumZbOkKJAbKGiJ/ComEw
         7I9HUl/X98awrvZfnVqDC7pBVnL9q0SlIYL62hIwpjdqkvXXV/rmM2poEjxJWzBwCshf
         i9p63bTAOOeZCqu4DPhjh+MRJIP+etHr6tgFWiKGP5i4wAU42qlQc5/jGYH5soA/RvaX
         5dv0GpO2HyGte5zqLNJg1d2lqdCDkj6lsSekNPg5KdshvZnmm6Gp6MOX7F8Z3VxLy2g7
         juq1gdTNtSAFdcxbYZpGLcqgFTpgAD70r/0pfXYTCx6c/3WkfJjNnrS29f0ue3De0HWn
         zwjg==
X-Forwarded-Encrypted: i=1; AKwUvByQT1j+R9LZ3L92JPO8biq1noBxRf/YQyDZ5vW9AuA78aps2SosSmLV2PacK8yzPvMUCN4ZhEpLhEjo@vger.kernel.org
X-Gm-Message-State: AFuF++mSoJWxGTFDWgHs2nqk5fleTm2RfDgYAeoixP03EI4zOA5ReEcl
	O0UlMcZDzOJB2p29jWdCFw7OkcwsVYiKb4e+rxjx1H1jOUW6VTHfxUWGhKEAoxUz2Rkw+Ie4Ek/
	g7Eb6f9hRMWwTuQ+OK9EHPeiIWl9RhfbEQAjIs3q2qrdR7I0MUiqiO+AnrLHwzAiE
X-Gm-Gg: AYBFou228GQu90SooBkFEwlGMBie1R7iw9FgkYuJMsmwN12EYw15PvpJwBXAg0fLb3/
	Vp41KheLpYCHWiuF1EVMkilDQiDVW95mTgPS8y9U56C1jzxgnBoNoZjBTjscNOkBrRwhLGLxpoz
	AFoV6mJ+/+yKqRXnEY00JMRLfJDcjRQbkAakU0/68tww0isA3/lMgiRb6v2tM9bG7VRyYaLYQND
	mJv8JjBq7ijpcWDPh54yRfK7J0NZgdc3+Oi5dEYWIQhOqnWJANJB/600zbOztnL3iRh3WgG9g6q
	8kQzzQV+nzE9uJBmtDNXH+GKMQ3pgVQy6Jol/NjB/o1eu8m/K8OhTXd/1ERTx4wkOWXDJDqHAcM
	QWCk6mM4tPQ0dKw==
X-Received: by 2002:a05:620a:2788:b0:939:a45:8c96 with SMTP id af79cd13be357-93a185cee4bmr481426985a.19.1789371335834;
        Mon, 14 Sep 2026 00:35:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:a45:8c96 with SMTP id af79cd13be357-93a185cee4bmr481423885a.19.1789371335281;
        Mon, 14 Sep 2026 00:35:35 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e636f7fa2sm297258175e9.15.2026.09.14.00.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:35:34 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:35:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state
 names
Message-ID: <austvfofuprz5rizz62fpog4hwdyobodxfbjccpfuqkdrjyzzv@cxbyob5pdxhg>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a3c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YiyR5B_2n7VWvMOyD40A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yT5c1YytyE-Gr-Nciwvv2O9SfoSNGPVG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXz62LQ23wkkYL
 HFTpO6yb4D55lFblkUjuc+duLyPIbLN1aG0jU7EIaB8IjVqrhY+JhuhT2V1slQob0JFQPU5Q2cl
 n+kCSZTjFAjMfjSPd0dOvE/bnW2IX50=
X-Proofpoint-GUID: yT5c1YytyE-Gr-Nciwvv2O9SfoSNGPVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXxS1kjSwUKdQ8
 xqZghHXeDoIsckwDAOGePEI4PU1lTP1EFu1xafGO1P/yu2BHlvZb9yxP9T3OzdLxPdUeAyGHbuG
 a2nggfaVsCnCb6jWD0Kh2joAoUfbh+aGsrrzop6FeI0wrabGqkKMQ6M3IcnKKyspOQBfAXte6jd
 sNmQxGTJAmwEvetsXbwLNrE78Y3n+RST8XFLensg+6nSwxqGZQBwuqoyVM/YjoWV0dP7G041uAs
 1HexQAZ9qF7Z2IUYVhjz++hz9MpwJyiIVxKN2K2FLcXRfQuTOngYkt+osS4k9CWzzkxSEc9TKh7
 yV3AkNhmZhvBIRy1zzXfw2kjuKlOmuGthnoPM2GiUdej+fKytk+BxHtmDyJlJB6+piUKCYQZmoh
 TainlzvvaU+UVPeiIK0/1z0UOQ+EQ/+QNYmUlCQScmEVpTxMSNHm/do9HRR6PvcRL2Alx+uvwyK
 3arvDRf9JlEro4HkD+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:33, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, fix the big CPU idle state name, which was described as
> silver-power-collapse, and update CPU idle state names to match the CPU
> type and low power mode they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
