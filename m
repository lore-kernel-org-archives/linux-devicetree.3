Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB134F474
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044806; cv=none; b=Y4hcq9xBTiaaVWGj+zmImV7LkVFMKx0zgAjE7Js6iEbHzTTJoLTqFfzihEISeUi3pEcRwdXckvzMHqV3mTUThYPF6z9z8/y6DqZDttlBRVtmU135+VmjBeTnxKbkC11CE+F5MnmPYGQwInTeWL5BhlFEe2Mvtn8v5sAI3taQEpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044806; c=relaxed/simple;
	bh=4q1IzlaMH1i4/ZH2devjql9vNl8F7EGw4Ej1RAH58to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QU39gFVSPYLcY+15goiFviD5u5piQKqEVm9GJNyXdd7hdBG0edsmfsbmFe4Wi7FufmuYZ2WYO9lXG1YkPpBDu6K5lzP2nn2YzSO0iUAP6ASPWiPlV+Np4S/+0mKAKwJF42u2dkPA8wKAeXYQAeekI8xeXVF2XpspA7nYnjSKeX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRvvS+oQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2gRbSR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRvvS+oQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2gRbSR6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6XL5Z1540465
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J501CW4Qc4fRIDANxnKi68vK
	G6WkIy8ukCvOtNCfiq8=; b=IRvvS+oQM4ZQZsdlS2AGkR26ru84Addn+49ioDJ/
	F1QI6aB5WteEVof9mKVdNl8j7k9algRpjJP5IP9o/ypdQs5FtRPdPs+xzYfvySg+
	qhuRqxKLpoX5+7OPps30MDVfl70naxiis6Qs8VZMeIIDgJ0tdDybQFWtEYmps6ek
	8uTzb/xNoCL9tpUqLGpyXY+8VHPGE1LSfqZ1LQuTgdk1pWnrKvhBwJIGhcv2Szul
	w0s/GTX1i3r4VWiCK1pIhlUqhY1FVOx6kj9490WqheJLLU1XDBDrQU4io9RpTOEa
	BUdyMNoBSVYqBajwT7YyLmMs9rq4Nk5WqP6HksVuBzahpA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4u7ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:53:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516eaf9fb76so113701611cf.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780044803; x=1780649603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J501CW4Qc4fRIDANxnKi68vKG6WkIy8ukCvOtNCfiq8=;
        b=K2gRbSR6uI3DyYWEOA6sKWUx6dT1aCcAhjnSErw4N1KIbk7xfx+O6Zw+0oc0CH5ob/
         8TQzqGFkCMvipymNFwzbTHa+vzxaZh0yydZ4oD2t/EBWT5BVDStxpci5bbEpIZVRt+6B
         moNzHloL6tdaSa3IZRLFBmZafJx9ncM86xcFwE9iJ62EFuewTVwCTjy+/TKoz1+wP1p6
         6/5lzz6fkPAFEMhu8MlL6e7iUqe5jUudejAKZwL4ILcWrlojYTLwgLgUzH2xLMLGrGHB
         wn33uZYuO3af5oQ+4fjy6eO5dbHtOM9oBqfrmqLAUarYLzx6pICClsCmDF9LqS/xTo1G
         UHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044803; x=1780649603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J501CW4Qc4fRIDANxnKi68vKG6WkIy8ukCvOtNCfiq8=;
        b=UA1bLdx1wypNHpINy1KC9PU5l4QUbU5avouUYvLDD98Ag5VqUJOGBF/PqRAi9RMH5J
         Q+ISndgByiQC/AGrLUwj3gAqzC8lUT2o7cP2eE3voM8uxhxbCpP+Qje1Wj3ZkuSgrHdZ
         H04K6SiWjGbaJBbUiCfPtS/qEdfKOfgYn00Kf7f9WZ1zMpF4b6tbSNUsLQrKlwHdK+Ch
         wLkrNAUlffweLTBy3Cc1UMvYhyyJy4XZGC2EJ7Kf1f+oj1LR0J0qQOBLk1hikiwAdwTQ
         lbk/EVmtabiC592RKm3Z6ryPcgcq2ywbafj9D6eZyaGRByYtPV6HLzH5+UExH50/CRBL
         4pcA==
X-Gm-Message-State: AOJu0Yy7AoqIW0LIGvQdEvvdSb3MtJq8l6g6OV7jVIyIYiAsTUjkG+L0
	eG4r6jjpMsNq20d7NUx5uFOZJzxl7q4GeZ0BkGpsMsSBGqt+qjd/RXtoI5jS+eXBx30DTAbi9qv
	havrSoy31iUPCnsVa3OjLNQ2L2IlqQTF+xTTHigECaMlWd1sb/qlBH7CFy1quTRP9
X-Gm-Gg: Acq92OHGNBchfqWV8NELtk/UymrGf+z366BTBvuoIsJojdUzOJ6WJLOBkCTcppFG6vr
	ToJq8i3KnDi2aX5BIdZTs6P/sQNEnfAJBkNDhNEgm/rjCfeJL8VgvuEvuRh/Cc8R5FFBe2FnbUn
	6CcQ0sPHLDuH6N4a9nruNE9Mw5SJQcZRlTg/XXSB0LVpweC1iM5VHsrYM63eUIp6WK71CSYxaFP
	nWwQn0UAgUwEKkO0mrTLNginyK6Beh+6YyBPdXZWSVCkN3/7SStGf+L1zXvQiusiMWDxR0xHY9e
	1u95XLyj9e7kGKoZT3luB9lRc0ZY4pH2FZ8kK4DEiMhxekVF0noig0gtGW4xB5uFk7yazdjRIsK
	73QTfbWzZgPQI2kLJ4IDqDPeg5cIAR093PEXRkwynKUTUnj5qrObfs5mWF9yVEi6eH0nP5bSLdU
	SslX5LA3nFTnbcwuTlCocEOykUIWRBvFOHwjRLDoyz+Shi4g==
X-Received: by 2002:a05:622a:4898:b0:516:7f36:a9d7 with SMTP id d75a77b69052e-5172ddef0c7mr22349601cf.57.1780044802917;
        Fri, 29 May 2026 01:53:22 -0700 (PDT)
X-Received: by 2002:a05:622a:4898:b0:516:7f36:a9d7 with SMTP id d75a77b69052e-5172ddef0c7mr22349381cf.57.1780044802528;
        Fri, 29 May 2026 01:53:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0726e8sm139024e87.25.2026.05.29.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:53:21 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
Message-ID: <s6iz6oohv77gj44mby2w24gr7u3k4xucwaknci73hmd7zp3i7o@rcyjzme5wh6o>
References: <20260528152011.376711-1-zstaseg@gmail.com>
 <20260528152011.376711-3-zstaseg@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528152011.376711-3-zstaseg@gmail.com>
X-Proofpoint-ORIG-GUID: NzRUzdCONlgJm8z32egycmH905O1Tkm2
X-Proofpoint-GUID: NzRUzdCONlgJm8z32egycmH905O1Tkm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4NSBTYWx0ZWRfX68QyU+y5nqKL
 YGyKKfkxvz8HYzm7GxspMh+5RlrUNPukUKNy4zhIVQjoOJUNsD1DJLXjkfYnjMI3VM0U8M+Zx2q
 HF+ouT2GJTSazqLtIRgcVXeAWqFXp6BlI0VcWg1lhL9vCp4075ijeE+FRtEMCTDV3o1pdh51bjj
 lLI1evg5VzD/DZhTObBrFB3KXGwqTg2juRMC5N23OjitooQZxQUOOpNpkFc5+vpgnErQ8pE5RTE
 rMLGolfTKrScc4BFdRJUkQBG7bgepdK/yWh9UPrJmdU512RuQ0PiblnK6s2vqPc8aNGNyeCZkPQ
 2/e4r7zcKuHaq+WY6nLqAjIZIQq+K3hBU2tGR8pQe6UhmRjp10Cm7kc8QREF9PqKWJugLkYDx2W
 cQtKF2YZE6gdypFFJlhsB5UNv5tig1pPO7J2EkwP9bVLNrK7if702iUyYmdk0/vKZe9F6ZCuR14
 qaOi6IM/nTd93sux5Dw==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a195403 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=wdaXZt0xLy4RuJ6k4jQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290085

On Thu, May 28, 2026 at 05:20:11PM +0200, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 909 ++++++++++++++++++
>  2 files changed, 910 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> 
> +&usb_1 {
> +	/* USB 2.0 only */
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	dr_mode = "otg";

This is default, it can be dropped.

> +	usb-role-switch;

This should go to the SoC DT.

> +	maximum-speed = "high-speed";
> +	/* Remove USB3 phy */
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
