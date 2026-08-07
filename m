Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DB3A4F2F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093439; cv=none; b=ZdgiRCeeC5rLIvYgkEx0b3BulnJe2/YS6K+P5lbjNPq0/BpsOv2+pszwRDNXZEkjsCp32ZnsVjFG0wvfxVGF92OiJ8dKrn4MQ0cDPX1ZQOTByGFepEZvKkaP3sTH9lTc0yACzxJ4ZK0Ktuj4N+FEraOlxvvg7JBa+d1Y8ooS2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093439; c=relaxed/simple;
	bh=6qpm1hYr5RkqGjInfrEiDCqKYgYPp4MbvxjnH7VHeMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfMh8f8JYGbMxiTBIZlJDRU5o0z39YGdUSU0nlxzhZ7UliiCAyAQiIB8CNAtJPFq4smMabrVHg5p1Wg1Y4xMlha1zmcs0glWafTV3wekLVRE+kxkX3qDw67H7V7RAuFTwi3y13BEFNI0H7JlAvrlqEgEXjEHBUW0sxcBAgQwJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrebY/ox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcDsyxGK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrebY/ox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcDsyxGK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777mUmu493151
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Fd0jxP6Kyr1lTjklAhR9bTt
	VEDBHCTLrVECFH+tmXM=; b=VrebY/oxK1ULEBZmWR003ElIvBMt6M2Vr3K1Q/VX
	SPWfMmBODxOD62KjYFBzesL3ZAc2pmitjCrdwjxmHqHmZTW+Ay3/o4py3+uTmVAQ
	CVMHtR1Jr+Rgps/PUkAmjlnRyka9le33EQDvpNeVyWJJpsGDw8LqstTBzUqvMqVi
	wxYuIIOpMdDp+0yQUICv/fFaUG2PjSF3wuYeBhrGoKaOxV9pCx47j4MyBh1xrtiF
	7ZrEWxS4E/NxVNJTYDqrpi2XFPat2nrhmRJ2O7+7nI/HmBUxT0XQX8O7L2T75Kn8
	UCPlQnXZFxGpGCaNFBdmk5j1lNuxL82fQGzXxCAC8QHMhg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb36h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:03:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f871so31371466d6.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093435; x=1786698235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Fd0jxP6Kyr1lTjklAhR9bTtVEDBHCTLrVECFH+tmXM=;
        b=PcDsyxGKGPHZqRq8S4OEjxDf6z6Pm4x7HvCDBbjKUFrfebCLSPb8+C71S+jINf/Os6
         KA+hI+bzL4BUJTH8bCLL9yWdlpFR6IIv07J28rHk3fhfFSE3mr2by4DqQdJjRQU8Xbfv
         v39vjuI93zleUDHFzLjp7IrC5Uvz7/5MANF/ZAHxYvKEeqDK6E+umYxisk8sU/dnwNaL
         c41a5tuTwzQUVJIn/NzDG9uenzq2cK5VewhPiDqmcMP/Ow8rWgYcGS0uy2KLWBKPcWS4
         YYwadkHRROneV0ZlwQOjDMLDGFlIgK+b5CmpFrf2JdkHHeLHkR48Z2apNRQFjxX1z1yT
         eL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093435; x=1786698235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Fd0jxP6Kyr1lTjklAhR9bTtVEDBHCTLrVECFH+tmXM=;
        b=axNuVLg/qicNGvN2hxDn9NW9ddcTVA8NcB3vladXNaKv/284xsiQa9gIbDrRv5/Tpb
         9Tk11WDgguKAlSLZgnxctKOD2a4Ki1HfusDbfjvaOjKw8b9zAf5/eykZ9Yv+Uoq8XHys
         5PeL9uHWQERb6FWpugtBrn2fH9oVkRsUqK1XyJpuQIGptEMhyz+B9ivR2Q9dvsh3+DkD
         /gpvRc+QXYsEzC8f62jmZXjTQ7wWi0Df0BOSeogtclNTUMbCKWfQnr9e1jg66yOpF5nn
         sIBGeyTFvAuD3dJrU+35R1zfMEEZIryYQNrlVHOSqVFpLZtovzPUclGi/ejem1SDckOo
         BqVw==
X-Forwarded-Encrypted: i=1; AHgh+RryYkC2w0lgMTjP7J3I5W9eDdt5ct3ddpNPg3rsB46zF1y1H1ATsMOKBmFDHAyXAY9U2Q9WGwvEfx5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxXhTO1UWde8VPqMvi68+Bq1T0I3Xw+KV5NI6XXso7L+CVMKGEM
	llPjSHy0Ua9r30G75atbX+XXdoOymeYL61b1x9aqXDAXFSNJIkozXQ4p7xTX/ueUEr8U+8vBX67
	6JrcddpYGQTpKEj2RqWlG68ATAwkp0j3lPoys/1f/dDg7SyHJ0670aAtWQcrwiU4r
X-Gm-Gg: AR+sD13k7Tr2E6P8fqVKyb6yMcEHArJ2Q085QGjiwKfN5ptvFGuFGaPuV0XKFxQVWQC
	zTDlY0aU3hQ4M/VvmCVL6swm1ZA9eaoE4fTcJNyq9FRpfyVXRXVyxgsc9cFQeWii3qArEQ9hFR7
	8ZYJ1qawSqRGXzIQ+pVdAVzOr/IEFeBdz1EwzcOsN3zLUP6ut65L8p+B4+s26LumFTXMS5jkUqO
	pykbuvSQfMcBO1N4S/cuMhr2tJTrbDVhAihjr2i1oU/odAWKxKBKoRMOVJAJtCMuqGGGk+KMve6
	BpoiELs5FO6pIef31VpZ4yFmISK936/vSE2mzXlKSDJJOptzq8jeg1F4F+VfoF+43ri58HtMG7A
	cI2Gf55qOrerGrohdR6DtfiidAYaeTdOaQeyGHCwiZW3cvUask0nO2mEP3OyDTk8tuA0NMAPmcP
	MRlc0kRtAZ/4ldsQ==
X-Received: by 2002:a05:622a:591:b0:51c:b900:5136 with SMTP id d75a77b69052e-52ce5e1bb5dmr213222011cf.0.1786093435401;
        Fri, 07 Aug 2026 02:03:55 -0700 (PDT)
X-Received: by 2002:a05:622a:591:b0:51c:b900:5136 with SMTP id d75a77b69052e-52ce5e1bb5dmr213221301cf.0.1786093434942;
        Fri, 07 Aug 2026 02:03:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050cf492sm344135e87.18.2026.08.07.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:03:53 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:03:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <ruow4uus64krlpy2gvm3g2d6rq5kgmgxnlhstmecil3gw7lhkd@2golvucd473l>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-4-3996f67e33f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX52G9sa3fwOHe
 iD+dEOizVOs5J16JoFhDJdNXGEHcGDWOfwYmuVDlD/gk8sKErL1KaNNIwz0JBeFYiEEC7Mmz3tr
 qfPwf6fRgBq3vlTKmy81bGq+Lt7jO0RntujWkTBiv/Xqq+BzuFcqfPqAnTf6r8cIl1R6JgX25LG
 7aoAkgypfL4YRBnMsp0iy8zGQgdwZM+qnbjS4qjy5C78yFPpHXDytk1Xg4J95Qx1wa6tMcTMTiT
 JGAoezcExx+41ziT14ajk7iBxBbOaTEphS3Ib0XgQV3KrrTnYnzw7leIU0zeuG9xS1X3T2LwzNI
 CYBXPpGsq87git+HQ6qwNAEdL/e8N5IsRn2QT2D1hc6sCh/nBA3CQFstxnIU4Dmq8d2hBInGabV
 30vMF8QKmUsI2GJlVqSxeJnnwDlqoJDdHdT07NIKf0Ipo0lDlrKEb18gaB0G9fF7HFEeN4nlSLs
 v0y4+Ewi3hp3D/OWIPg==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a759f7c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8
 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SZajUbaRgOUCVt53atAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: ENgCBdNJO3InzG_jn4tQqO0ICfa6PE1s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NyBTYWx0ZWRfX65pCDJo9GKtz
 5oYu5JtlgeBL/BkGwHJJfJLc4xCYBbAIK69e6Sim7vyYOQapOWOZYOpIso5KdVwxHlWa/h8E9Vd
 ciIJRJLf0aiTpDqS6wWOeknIVSj+qnM=
X-Proofpoint-GUID: ENgCBdNJO3InzG_jn4tQqO0ICfa6PE1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070067

On Fri, Aug 07, 2026 at 01:54:48PM +0530, Vikash Garodia wrote:
> From: Daniel J Blueman <daniel@quora.org>
> 
> On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
> below 0x25800000 (600MB), primarily for secure non-pixel buffers. DMA
> into that range, from any other stream id would triggers unhandled SMMU
> page faults that cause spontaneous device reboots. This is readily
> reproduced with one or more browser tabs driving multiple concurrent
> video decode streams.
> 
> Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
> and reference it from the Iris node so the IOMMU layer keeps DMA
> allocations above that boundary.
> 
> Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 8a96ea1bdb9c4c409b2af997680d8c13fed0643e..87f424765d513c97b06303bceb75ca9f176d2ace 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -666,6 +666,17 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		/*
> +		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
> +		 * primarily for non-pixel buffers using different Stream IDs.
> +		 * DMA into that range triggers unhandled SMMU faults and
> +		 * spontaneous reboots, so reserve it to keep IOMMU
> +		 * allocations above this boundary.
> +		 */
> +		iris_iova: iris-iova {
> +			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
> +		};
>  	};
>  
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
> @@ -5439,7 +5450,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>  			interconnect-names = "cpu-cfg",
>  					     "video-mem";
>  
> -			memory-region = <&video_mem>;
> +			memory-region = <&video_mem>, <&iris_iova>;

I don't like the idea of this series, because it _again_ doesn't tell us
the truth about the hardware. This typicall ends up with bigger problems
later on, when it starts to affect other bits and pieces.

I don't want to NAK it, but I'd strongly ask to reconsider it.

>  
>  			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>  			reset-names = "bus";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
