Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D7F43F4A3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393861; cv=none; b=sjkwY6DrHgangQOQpiCfl0x0/BK3zjHE/w66h5geY9s62uZqH9W2/S1Cdj09S7FFDMD2A0MFfki+hH1VFqwNu3zvmvWs4BcWdZ4hBs5hZl1Lwid06wD4LepR2bYwVnL54n3e1dPcLERICVQb1b2NJDb6SmBCpjw8nJ8cUhmN3iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393861; c=relaxed/simple;
	bh=s4ofHt+NebHY6YiuMsjYW/TQtl7fNWl5044K8306YQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URqi2yoJ6y97EMbmexW42uL1Q8ZSkLg7nKysUN+3li6ndxOzg0KywLpv6tPPWK3UjpsOik4TWS5RHPkv55GoW1HbYXrMTtYzO39pel3UFA4JVVzUnhwcUuSv24zKdXktFKayyi64XERENb3UT3KpKluL1HSLQ5PWOjWMPNT5e10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aUdJcWjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLte9SP9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aUdJcWjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLte9SP9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dTl1200591
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JUfQUldAY1a70ltfjEMb3F2Q
	DASbbsXbw6W8EjoxwFU=; b=aUdJcWjWT0jzmalZks3QOnJNeE2iDcgYuxOEVnz+
	hze+0Voggi5cuzDSTmNlyb6okQk7r1Bm0JnsGrmO9QAMn9l5bMJ2DMTpG0jhfDWd
	jA75OJ7js9x53qb02ANSxnS6EmKmb7sjuirUw9UE0I9QIx3VDMLNDYofCoPrf1p1
	uCoP5sxFDQguHR9U0Shd2VopZrqp+o74b9wlOtVIAOUPjGspJxSwz2Ou4Fa/GWm+
	kxUWt0Evv/YCKndwCPuuW1qNw5p4wAMx/wjKQPity1/l7ZiKuZb75szK3RdpZ9+1
	6EBpHUS6aNNjGNXOcMW5a7jYBu8RGUZRR/SkaBkauGhuTw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs4pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:57 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980a896f53eso2677899241.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393857; x=1789998657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=QLte9SP9I2JMkZPGJp1wBedCzZqy7t44BH4q8enr5wOoaK1qej5CIF9xlc4DyjcnYd
         hOT5BvmlC/xX0ePoAnIIoBPHFooNw21owWY6JZh38D9/I+z6+/oKLRkK6v+YHT2BY3aS
         UM1oKt1CKkdIkQJfNdSChag7i7Pdhyw13efIbeNNXAyHCrlSmT4IydPFeBzkHdS8La31
         AG0qsYYdHLh4yh3ka2ZSbryXv/Dk0JAE2bqPl2NWA/OPJJ2JzHxx6vcZ2CpjhdHLwee9
         ziK17afU3o2fsDQDDR1q+PzhFGL6zMRBalWIbTzVbqLnyhbBUHDHOIqjM9csMLcMYx1V
         Mlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393857; x=1789998657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUfQUldAY1a70ltfjEMb3F2QDASbbsXbw6W8EjoxwFU=;
        b=Z67R2nwsjQ6cMmlLTfAt1W3zlkEsWovL6TpQdOmcVZBFnV+nP4AfSXTCfbAlKfJOJI
         dpVWarQsR0KASd2E/U3gX/fu2NWqjteewwwXfOPe3qYCxGpfePC7w3SzhVHxjkrNtkmD
         drKK31pDV/YgSlEDMkH81ZatIC/5ofGGgK07CmZ+26hfOdz67zutIxs64F7J3fLf9Aj1
         h8yNrVjlnGxQB1jktOSR+DgIawPo1w1WAt93xgoivDoX4tbWUBEdj0QV15yduLWVkRVV
         Z1RH4U1g/Ahdwua+wcIZfz7lzxp5G516/mtHxMM3nzdt9J2jC+wO3Ls6zqQX5kuGQJsX
         pezA==
X-Forwarded-Encrypted: i=1; AKwUvBzaya7v2z7bmgtZfqUZzQf4c7fy5lkWQUBedvv6zayi8/zE3K54lwCNa4aOBnKQ1CzzT8d0EyuE8j6X@vger.kernel.org
X-Gm-Message-State: AFuF++nCPMWoqQE0IXt2PjpAtFikhxJMAX5ILtpVdzzQu+NDgqTMPzTy
	qJwVV58T/awvmMGgZpc0oezdXDbmUHJ1VSghKPF1QEC/sy2BHKKaij7KDdZojgvP3t43RHZpMtW
	ZEwHlldI3DrGlwU+BWROaLi2O+mC80wcn+/mLQ0SpvDaMaC7URDy0wnoaZLyj1a/H
X-Gm-Gg: AYBFou2st9AmntZaUVa1adK396qavdOwR2w56dX3Pvt8Zn9uMTHaWU3e03iVWsvfdBg
	mvVGNdZNh+CfwsIIP5gCB+4nXZPCYUaArVgBj3tQWQ1LO0pzMHQiqXftsF8YFGr3gUPLYQBnGpy
	sJa2ZW7gxEQ8pBf09S9x34ZPXkd6G6yd0JMNA2m2fv5tTa+KksavhmR2EKjffTAOMo+/iN3wvUm
	eTT14zqcRVi6GMSS5mAADlXvVmTeC1atbuB0k+nt0VNpkR/HB0W23YV3MkPu1sFopkWnicxF9pD
	FhC5NrmvS6eHdZL/ZsctMe5453jnthV1Xn8cS1AuYXr0RFtlDg3aFmdyQo/dd40m3mK+yX/iSg6
	k3k6N/kIDG5qtKyM=
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822928137.8.1789393857165;
        Mon, 14 Sep 2026 06:50:57 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id ada2fe7eead31-79ba93c04b6mr1822843137.8.1789393856630;
        Mon, 14 Sep 2026 06:50:56 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ad0614sm341763665e9.10.2026.09.14.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:50:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:50:53 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Message-ID: <ohy25kfxpbwwvbdfuocibhboyhudyzeyht66blralexwmjcrxt@jlxpxt6mxbmi>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1vcmFWCWIMMd27pZbniJ1jk-IF5jk70w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX/emNFqfbzGq3
 mNtsaEI3fPtCnvZbPSYf9EDa0YhkMqMNmM3HMyCaQ+fkQ+Init3BpKnZAdhP5GlK0OPJiXCRyX+
 wdkjb4VxkOb254sLjCEYprexh2Wn7F4=
X-Proofpoint-GUID: 1vcmFWCWIMMd27pZbniJ1jk-IF5jk70w
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7fbc1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX5q96gRK4RC7Y
 BdRp21In1vqRH0drC7uTEHscUWLvbjHKu8m0S2TmrL31aH1CJK5jKHhQyKHLfaJKKV++83mwtGC
 D3A9Gt5utYZILwUDSU36uIw6J3d3n71t47T0JN/5JjMXWBQCZEeYx4osxKMx+4rdesk9Hxd4oPc
 5uzcpo8Zlk0e+neGy6DuC7QEpbPK3543N0Lowt91bRNi0EdSyfgM5deWbRJzrqi5TEt1+8tMZ9P
 6fUQlwJp2MAv5j8cYrRDsMjUuJvQmPIFMg2YJe/lWR4irX5qURXtO72NT1/OnPFjqsj84dgEPcJ
 p07SUMVrYRNrklImpZ6irV/v8Wq5I+5/wSbPG6vsb9zKnyDJmrNEpYc6qYqZuyRZT9smlSGX8iy
 eBq2UK0tdP3iBcaw5h/fnJ6comz0lWiOyB37W6IPFGfez4mg2qPKjsu4kriCKXH//Xkky8mHd85
 8kG1O8SWEi2WW0NFoDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140198

On 26-09-14 15:19:44, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
