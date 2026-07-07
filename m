Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD03DEAC0
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419722; cv=none; b=OB+SO4O/Ec+d0VdWpR5m8+w0hGjuuSSd8J+jJIyAoQPtbNUEImwOunDbqc2E9mpdYf5YYxDhstV20AvyqZHYhbqvLo7E7+anHuV6g+ooynMi/n/WZcA5dScSQehBx/z1IRUBkYrejEbzBRzB+02R2trRl8zD9NjUrJXYRccDSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419722; c=relaxed/simple;
	bh=OnKD9+dtoR4+Kg+NOHjkHev+oc5f3OmADkx3Zs5N+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hfl633xN23g2lNo8B0+aXA4jo0sEuuSNHcRVTgzZg7LZ0a1xRStKu2LyoIkxvoLVHis/4PKPAisfzb4QHDipt7F8HCj0pWJQopMBo/63GiP8+GqXoprDRJhq63elbdG59KUfp8STNpTQJshMTQ68MkdPhV0g0wvCxPE09WcbhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGgZ8QVF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmaG04E/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGgZ8QVF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmaG04E/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E4Eg3004568
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 10:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=; b=lGgZ8QVFL77OVN0t
	xWhpKDyGHX8oRRgoSf7/BGKO0SeTGSgdtxJIt7r0gOw8ZKm+KSpE9fR6/Zket3AV
	H1EbcpfAicS3wygii0pBA3jomdyB0JHkaqbm4XkZIrvJz4E4Npg4Jfb9ncLhPIhl
	elGd2PXqzW+RBIt5eEappbECtjiwua2UjF+uotE6eWD7hpqbtTQ3roig0wDfp19D
	zTk3N0OPwfw+aTSHjj7moIEujJB8GPCfzKa04syhNA2tcMvX0p5ZB7D/VQIYRmF7
	ZPTmxIsMcoirB4atxvkEtmyHjypgvsHbVxUL9X2Q9KPfxODb6AWQHqOQYSQI8W08
	Lj65/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su71ekg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:22:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so9204241cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419720; x=1784024520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=UmaG04E/4NzGVAOI5b04/ztiDhikEHXuBBHVatZPUJ6YeJQNGVzqKWbtsYLIfHMeW3
         vg2itpBBBVrzCLUAHhIv6k4arxf7evvanGtNF70HBtTmPyWHpJBrlc9bobPpcaFUDEV2
         jtHDVvJWOsYlOvBGTfEEZboIkJ2omNJTt37cTwTC3Zfutm4xAfy5WooTOAbren8IXehs
         DM0fI5+p6oRgoKIkLduZ/G8EnG+XPVwHpVdcIh0eB9GxPphQvXGp022IvkveyQdAusZU
         OmbvEP/ryXwR4dBVMH87GrImaqFYE+qQ5KOy64iimT9w9Em+zEtucXDdsMVhN23kWtIX
         45LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419720; x=1784024520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SBXaiNN8LsnBQfq0FlnEG7p2cSnPn2BJbchfZokxTo=;
        b=iLamb0Lo8uuwgy+0CS7KuAZUC2ug0XEF/tftqvvvTORoCPCq+5nlTDL2RTQk5vVisz
         xXVK0hK9RUwP2HO4NrMHlV537W0qZEg7j1dlX7s5qK/VyTAeJhPostiC60pdZIqYtxoZ
         fPRdAtxOMUnGH8iM7c6PPTAQU9VO9IBxat7RfWHCU9oeuVG6WfLFOw3Ks+rmGOORMPVi
         gwkGF+hWq/i2Q0opVSDE2uc3zkm8h0SRFaZxRrnHHNJQS8LhPraWUPYFnM56OPqlzI/q
         M4g8NwawppUcM3vB9mBNHq9zS9OtUYLwWga2s9ITR8ufT8ystqVl6aLaFDBb4wRmAO3J
         OaLw==
X-Forwarded-Encrypted: i=1; AHgh+RrLHOVarQ7fRaMB9E2x2PXPuWcueQC9dQdVjeCd2No8SaX80bmkcYJCv1X7JaIowMhhp0BIufXR48OK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx596y69NXECzxQAPDZOLLSC85CNhLa92ryYzoAZKGbmH28FC7I
	0igs+jONa1l9x2uKUHS1z1ZP/VyRu5/P2KoJ7a9m3uixd4SR6MC6O056VoPBdGy2vAnJVEjdo0U
	zojmSc2TQov+D0qzFFkVvuZl4NPARmlhM8wT7evKpgg6QBjFDNVtxQWs6S+L7ahKY
X-Gm-Gg: AfdE7cnZDx+w995L8O0bmcyway8Cq1BSZuu5VDWwXIbNkrnnsAICx8rbByzjGmKrJ3q
	3RlC/mQee4Y5ZlLXKhoyp9SCQcDPLPwDleAgY94W3efgwr0nwNXxNujf3I6cGg3f+ogGRdifuGC
	6Mf1QW5uvYUyHEuACEUiTZ84Y3gVLd3gxdaspgHtQ4JNupGFaIhlVLk0hm/iDyCvfzLBJ48avNB
	hWCdqFBPPGB/gVCJPDdj0sto+QADDj24dkRXs3uRPNm8AoGFWZmzzULCA0XtIdhSzB1p2mNORgi
	p0YOTx/t0iulMQogtTrX9BYak4513gmJyOskBg9A7x7hslPhgNHtT3h/CCgDYDEfuQqOwgCRyRK
	AfxN9+BNtUpe4+BHNk6RkYgmaCfbSogShlDc=
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr73791541cf.6.1783419719731;
        Tue, 07 Jul 2026 03:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:760d:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-51c4ffaa09emr73791461cf.6.1783419719346;
        Tue, 07 Jul 2026 03:21:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9bcd7dsm101151166b.30.2026.07.07.03.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:21:58 -0700 (PDT)
Message-ID: <ebb49042-ecfd-4c76-af5d-c79c1694b401@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:21:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
 <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-4-8169953634ad@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX2jl3Jn1puNe/
 Ue3gcZAdvs6QVKBKsjPv8Hg8csu84hfRi+7+ANYuCq64Sq5f8g6LBkKEnbxHTitgxOOVunm88U5
 oZQMutWcYFcGu7N+7Omx+AHOILVO8n3ItpcnAG20aL373sajmfYJeFmzlaB81BzVEhoRyrtZHuL
 K/wspSgiqYIZDDf3mEPoTEylzeOkIiaQJQjAKzbpyF19A8aLQQnWpfQClYaOBgo/4l0/NS7LaZC
 R659qVFDO7ka8ZzBCnCdkSyJZFc/M9zrb6Acgt1gxTUhwa6vPSXskUywyfxFM20Yyo4P3a6zmxf
 v3TeseyQdzJEJJamdue24N0HVHFVWFQ8PvbsZIVvqzA760PsjdfiF8sI4cqxrw8o4P3PGIBEnyX
 vYXvKHpi0rJizCluDWkkDMX9N/SLvsEClkZi6QezGwLTbWM001wVw0P7ixOr1WbOQo1xXSZG5wp
 s+ynVb514Rznn5OfN4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX3/JTWAZ1uqSh
 bGEYxKaPynS6EbV3H1X6Bj1c0v/K3VXE5yZQ+QqrADNYp6RGlxB9zOjfP1KKv8RWgUVOrlGcWHD
 8IMmzYl/e5uQ8xaQRq+5j2IFqqf7Ers=
X-Proofpoint-GUID: zol-097sDT_OcaWhhgjz6d6m13gxZzn_
X-Proofpoint-ORIG-GUID: zol-097sDT_OcaWhhgjz6d6m13gxZzn_
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cd348 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FWBTG74ICMjwBxTGBBgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099

On 7/2/26 11:48 AM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
