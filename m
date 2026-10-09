Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70848124E
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532353; cv=none; b=Lul+MvhXU+ocGv8zVM/iNsPy92in4EZIaQU+iwXvBJjCGYHFE3f6NY7p8UQomzI2SwOKh7QDbKyHlHK7Sb4bFZgJwzvWe55kCzbqP9QkuMcTjLO1FS/YEkoX0iYRn3x8chf+UAJAIfRjaqasSRlnlthWMTbKchHoUzmQ4MhrOYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532353; c=relaxed/simple;
	bh=kFdS6UjgyZ+sc5RdW9BqWyrb0+OVvxoQt9fazGBVrPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtYWnahgxvbdujjsEJgx9befEQ9boKh2EImb3Qy83CHU5y8cwyIdysH10Y3B+Pn6RWmz403uedO++GTTv2P1EraDMKyesmGtaty7Twm8zYltJVAqzGLlO+s4jdjU3DfST5IG1Fq3oIP6M1EP3RoCitg/5jaRt5P7oktZrBUl8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY6O6pkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gc77b6kV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UY6O6pkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gc77b6kV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HAto3942629
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 07:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBvSfEAeglow5QvR1GvNQDQm
	2rjRQlHlmGnHZrTDfZQ=; b=UY6O6pkfp6oOYJPmunQih2TlVC8L6CiIP42BNa6i
	puhIvcuD5xX+pv+5QaIGSoV/gzMloKAvfcLdHuQc0Pdk2+5epDBnxTBDDrk4e8WS
	0iE+7qZphXf9+KlSWjgVY8YgVV3StbhXo0rHkShZjyh2FusofBGa1KLoMSVmnbEP
	jYXc+Lq+O8lnomumWzzgagbG2vnz/WLJpSnvoxundV5pL1J+tOl6MJGDWbZFtXFq
	cctfsBpQ3krFKJHlfriwh0WTvVHMMdmmDFD/AdBmdD70Hrobi4v6FfD01UrleVzl
	gEjbsIzohQhRM1nMA7avPHhM/lBM2k6ILAQixD91L/KKNg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2jee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 07:52:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-147be78cd56so22100331c88.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532349; x=1792137149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=Gc77b6kVzlEwGnKYybSfBEgtd1ycyZlgqADujUaACB3AAU7C33THBF68strXF7PPl1
         5cvHCsSxSG3YJTbqisQhyt6B5smgTLmx3jmkq9DTXDHUnfxL7BSFfFudnqhmhZRQ+Sf7
         tfgGwd83m9ExcTII42getqYoZOz1A9ytYPpfMpQ6t4i+mR5CaY88ZpNxxDyXMLUGCiQB
         EJkwX5vPApXqpT/G8oTc9ZZlv8T1wzYsLJ/6CNoa2VpCUCjgHi92oifCK0Xv5CrqazAx
         Pf8AY9/i+wglpKesOBu1Nx9iy9XLZlTBUaD6fZoDhvTwCSHoY8MzZo6SSJ774waUiPrm
         vMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532349; x=1792137149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=Uj5Sk+pKc78BQqRwNvzFUf6OePk5gGmYDs0LF0upT1lYfJGJ9SzbR8c71WMEfv3jVV
         uZmD2lPVowsjutQpA1bi40Kb18UvoKvIaMccEpp9PlK/muJQ9OTwbrxhtr4WqFMzDcl7
         HNeJoFkGiVFxj+5fNuXwizcZd/Yy0XId6SINi/l+hVBc6BydN59eypDOYWhRd5KXSJcK
         xqKaPa3ikmtS7/j+iysWZk7VTR3YUHt0Sc4EbYQI0d0u9riaJ7PCLppctkQSHvLz3oPP
         F22aa1XwuOnuvP7Hx0Vsv3fZ0vyyt0rc4i8v+Vx7Uzosna5LO5ynihJYkmkS/Nldkkco
         lQBA==
X-Forwarded-Encrypted: i=1; AKwUvBzaj2ZGSGyAOVp2GVk3GkTFjZY44hQXMVIWQGVoWjiCLbX0rlPK4BGgiY4EuoBKExcIX2m6vRTNgTcm@vger.kernel.org
X-Gm-Message-State: AFuF++mA/uPuyFIRPqbEc8NSK96MadGnpibWjH9qjxbR4iYC+bN7qbap
	iNZnbdAKkipEQX+s7rVCpk+MwgowvgeGKZG7bASuIuzG78ax/Q/vafgEuouKeqsWB08BF9k8jS/
	GMwNMAKwBliFIhGP6wmPMdSk5vlzc4QhwNXDlFBAX44mb42rSWf7urPPAntABTb0Q
X-Gm-Gg: AYBFou1rJE1lt29G2JK+as6ZuIDrKeN90EaczM+p15x6Tt/SJk93t3jvJAc0xobe+n/
	s+GNAGFT2bXo7X8+Niia2cGemgQEiLMxWyckjJN9aqGhMJp3ZxRtvrKX7XFckWu05ymg/0otfJ7
	4aEu6LIeNimAPMY+MVA+tPP+V9qryRGdsdGEoxzCOIoMPEwWbVRm292HUxh80YZaiZtOnXImTiu
	me5Vgu3wHAJWD5LlhCGREaMUmSi0ZDk31SUHBfgoi92q51jcWqTo3x5uEAInZu+k9Yntrlphaal
	85oh3yahYlyJkeR/4LORrKVgsCh6d+F3KKA+jXurObqPZikaLQm8O5OjLqzA+qKZF4GXxA6dSt0
	0qLH4yAix/dYS7TU/K+cvvJ4/UmkkZkce1fuHo0vn7g==
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379451c88.43.1791532348845;
        Fri, 09 Oct 2026 00:52:28 -0700 (PDT)
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379169c88.43.1791532342879;
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm4230189c88.4.2026.10.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:52:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Message-ID: <asidMCpsXHY62FFT@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac89d3d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HvrnEgK54qzgPO-vPg0A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: uq41ms_yqIUzkSljx79mfy6-CUq_Hqln
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfXxFJ/U6Dk6Wls
 PB4Z4LBZGMMVEkApJfF6i65EEuhhd9hvLVUscDZEIzLhXBXNRvBv1eO72z1lqa/FsLnP6Czm4zy
 AFYhbU/gI5AfULDRWUGpoOHLZ0YmLL0=
X-Proofpoint-ORIG-GUID: uq41ms_yqIUzkSljx79mfy6-CUq_Hqln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX5MeSoWj/NCrP
 41/vE1cpwQ3gzBahi7LMGhZq3om+LsOqn74OJmQOifUeSRbBotn10mwnyaa+95Mb0Vb3xTzcSbd
 TcrvS19iTrAh63XaK/4k+k2TMwOXSPVWqOub3XXVmFuzt7SPTadmaNgFxX0U5Da5Ur51oR7Bmub
 8uEiBiMEHf8AigPE3fgHB3tTa1aoGrURnW3ln/vgga4etABZJRZU49xUHFPfqxihelGVE902C70
 vesB2tx3MStdS2d1kvoRZR/kLe5ISDI1xfxFo+3aX0cJRwrOtQOt3sKLaWanLSYG0QrNhxemCNq
 Ud/a24OITesxY4K84HRtkvWMJobz+t+0/mBvgukxFTTunrDF+NZUiwz6adSOhMzpcdnam8N2GwQ
 92Mc4NG1rChYl98VXrAp3EHi3GfeaiPog4XsmcpL/pXeIOZWYO1cHSQ2Ek8B2B62vOJCN6J69rN
 2CxY6eRz1wlHtb+HzUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:39PM +0530, Anurag Pateriya wrote:
> The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
> display and other use cases. It shares interrupts, SMP2P states, power
> domains, and clock with Kaanapali SoCCP, except that it ships firmware
> without a separate devicetree image, so it cannot use the Kaanapali
> compatible as fallback.
> 
> Add qcom,nord-soccp-pas as a standalone compatible with a single
> firmware-name/memory-region pair, while existing SoCs keep requiring two.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
