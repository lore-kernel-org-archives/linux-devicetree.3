Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0203D47B1
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780552913; cv=none; b=fdxcrrbIKYkv4u74nHK99ZDFD3evruzqK5rJAx7kJ4gUfW0X9Z4DECoiXGJYL9JSOAqnY9jOPhT7bfiWSUMhwRR+mpMhUMNqrdHWpmBTkLaDZEfUqJS0vPvYdSKapNoSLRUHaiQ+SUp4eeIIV3ND2a6efJBrzpynhmIqCECrcyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780552913; c=relaxed/simple;
	bh=84ayR4B4aJcO8wg2iVF9z+mIv5zWJb6AyHz4PJZaKKw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gStjhUzUn8plhSP/mBmEbH4fi/lbKVAtLxRYQ1/gNYfY/g4W6qIaco9rwseMBvnVzoOQpaICAPFgTnSIwhItErNAy4EYOW++fafTl/JMYgsT4rtmppFcIvyGYkeSrhVchMCZLZDRToYm26m17l/dT+PFpc7LL9IP+t7wVSgz/ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDGob3Cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+SbY+uT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDGob3Cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+SbY+uT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542U0is3552293
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 06:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=; b=UDGob3CjXLWnXR8g
	a8MND0HbYIqj8rzuTe2NfSH3/m0NLBo9WOqOdf400ZJ7caQa1WfPWd6Y1GgTHMjt
	hOn53rzZAjqzi+GOx3k3QzfeAJEXOQOqHRVf+rmhoh610M7ygUGcSXENphnJ5DS9
	Pd7/aahzVbCBsXrKPLiGkfX5812wIOHCosnhjnFDiCF5+q9ZY6tCUYIwCDOeiNIb
	DPiMMoiTct7RlOJOavRtDk0btDlq/fICev0kTIoMqw67iMkz6aL1p0aM/bZeMpzu
	hsRYk/D0NGP7OEneTCR4uq56B30G4/dHa4r84/72GZQumgPKBLzaXWZYdOeOAZrf
	I55u6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mv88j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:01:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so8030395ad.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780552910; x=1781157710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=U+SbY+uTYxNmp7TX6u7rK2E0UqSQCUSOZsZXlslM9V3m7ljZL8iScYeuDA6VYYmELJ
         jduVHetDcqKIi1j/VlM/bzvgoCj/eYTKLSPk8CzKCVlFwo8MmR5AkOGjn5/xom3/WnE3
         PtG924K6GW3vE4X12KB1TR/5ZD7B3kHUdU7PmhSxbADWaSjKoZcMf8oFvqTgu6gFTcms
         cNrWLgb4lrQe/IMZfda6PLaflEs91Xym6CbO1QZWsQDxjDViKX98Bduaa09NLXKetg8D
         DnXyszJXvTc+LwEXx0t5sG58tvt+CbWiUlegNkzk43HK/ZVp1NmmdFZF86h9D0Fx9/uJ
         iBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552910; x=1781157710;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dgiKFbDkeqTH5aR0tttNrB6PzO3jiYE3qdTpFLIH+I=;
        b=JKialrDtkUn42NvQytqRkWcnIIips+//BE1tvipAxKuQi2ds+Nip4iHFq/YQflSfTB
         eyy2IadBqV/nHcja3X/SHkVHYSXDMkqkiIN5W3ZI0j0y5IVcn4cjVi6uOqT3WIqx1VmH
         yQ3wVH2LXRwpl2q6BQxo2y3QwFNgYUWXl/G5WoqPyJjiZwuoc71QcM/nPfLViaYxk/kv
         Kxg+L+weMoLIvyme9QhZPjkMomtNmj36ToSoMr+Yaqcv0/t5sHLsdBErJLm/dPRpaKIe
         A1d9g4/WVGZ9Mt4RxApdSGEnF6yopQpOWLRqvKeJ1pDckuMHv3I7ni9bBJsmPn69MMKp
         4ddA==
X-Forwarded-Encrypted: i=1; AFNElJ/tCP4U/ujZGDnr1Ze24XEG1GKi6bommHx7iqUXkTPC/jpAUKZOHr0wMGmnzDYFMbK2IjTc8pFJvIoL@vger.kernel.org
X-Gm-Message-State: AOJu0YxGboEYXAlg+S9UyFS09symMesuGxDJ5x+tZulxKBYxKs3SbLY/
	j4NRVPP0cvL7FFoYxCKb7eKhJWfwl1XNv3wQSLm1Ocl4jAP2tQ2BLDKJQaj+/rir/JSu79ctOEz
	yCkKofqrlq7cRBB98B7cpJzqZ10G9xq/BntkddDraM3INUJWANifJvAAFnSJEn9lK
X-Gm-Gg: Acq92OFBv5FySK/thqfzpvplRrqEUOyQnp6y54laFijlRYWyIejnzsa862BCHukAe/U
	KgfNhkokBZTRvt4GRp3U0U5PA8ZZLsa7xApsbFxliUdHUttK8ZMWMY5g2PYVCOpl7BKCBlo5frr
	hrNZ/1pKgx76iO+LTh6YeALdoxVitOniugc0xkKe0F2eN1T4LzjdVtet+0hdTsiszH33OG3BD9g
	tEGXBuVffw2eT6G6DAn45Fu4CTiUR0xpl0dhlYN1DVQ3fPnzLXR5vJ77y5uiXzg9g1Lbf6PLZRD
	yS+SeHobHujBKaLe3r6seXgSn+KlcT8J2EoRu9CV2hEneBICQDSO4/+3RfzKP85fKMRcmPHEjsX
	/39be2UaiJppOH+iO8i13vflACFwP1L30VWnLOelfut9Y7WfuCgjFRUXh3It+pVFi
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73809065ad.9.1780552910464;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr73808695ad.9.1780552910070;
        Wed, 03 Jun 2026 23:01:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609ed97sm44346975ad.41.2026.06.03.23.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 23:01:49 -0700 (PDT)
Message-ID: <29b9b286-63a0-f659-8407-9e8b5a9487de@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 11:31:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1ChaG2Sg_cUs6kB2kslStJ_Edn_eGEu
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a2114cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1NiBTYWx0ZWRfX+rc0YMMPcV+1
 xoLvoRMVZjNNiyg9gLid7y2FlPjneX0fHlRGCPZUd/EGvtJJEsIS/SPrnmVg+YKhx1UKSXwnWt+
 D+vLV6bOjknSusxnE9/gRy8fB4ttiHjXLVsy4NBS2sJ09u73FMCDIOqOpIximZcQVvrQZOcPuYf
 F57BlJ9RiyBRsPXOsWSFAwDMX7OloaDqGA/usZmwRYeeD4SACXGf1UdGRqMShjLTY3FWCcpo6n/
 pPPCvVVoCpSyiiKKopalO83yai/aSixtIu/GPh7PFaLMmA7TxxVU6nha/id7PSSoJwIkHRem9AZ
 /R0HJ3ZzYfn3mFAmPzDN9xXRFuU6z9hkyaubrZIXN4+LvN0YCcpiK07whXoIxrZ3QexcHdigiAg
 OdMH/CknW9zwx6cEAy/qBFaWfaAg6VQbpZE0V58DxHr5zdOdsnbdf48j46PwnBU6yggjC6mRxDv
 cR8Thp9l+Ll2qLoYF/w==
X-Proofpoint-ORIG-GUID: o1ChaG2Sg_cUs6kB2kslStJ_Edn_eGEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040056


On 5/15/2026 5:29 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm6115.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> index 4c3804701e24..c5251aff9886 100644
> --- a/drivers/clk/qcom/gcc-sm6115.c
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -3218,6 +3218,7 @@ static struct gdsc gcc_vcodec0_gdsc = {
>  	.pd = {
>  		.name = "gcc_vcodec0",
>  	},
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

