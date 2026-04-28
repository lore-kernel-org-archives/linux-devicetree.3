Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFAC3101C8
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365140; cv=none; b=lYKDV+V+CmFOjVFmPU700/BwgMXfhFELYvoYHBRVOalyyEon/Pz7SoFCaQz/x1ELnj5482FFsLAs3FsxxSic4DfcOQQOdfJt2m26FnImu1jiJD2p/xV0CEjBMuLSYCcI8d2vCiM7X3FR3i78OvLzrcbpBFc3C/jC4/sOpQtfiTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365140; c=relaxed/simple;
	bh=ioDuo7tnWPkIV+u/gZ4vdbcGbc+WB001JmPbBpk0llU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMGNtalOj8VqyCDJTSq21E+BT9s+YuJvvPtrpEI53g/FazazTBgrqDIhgCQ3lHzhLkSXldpBa5CU6dzPx0XIk6IN0ahgotnqLbXSpQ/h0l8aZSzNSudcPho/V84ArwxJ7j4UFVCVJdgzMLMbxXN/dG4NAXDACf3IfisG+S6CQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS5ctlWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hT+CQ1Nz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS5ctlWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hT+CQ1Nz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7KJ5A440995
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+Zu20h9/F+SJQk60N5/Mbo/x
	F3FttwLE1vaX+pR9W0g=; b=hS5ctlWI9cIeddy6YUztSdjjD6lwbI9thiZ7wkj8
	eAO5IbI1SQy/hKFouiNAywQ6om510bKSBF3fhdmg/sAyZPNTClkKiWDtyQznB/WX
	fz6BMBWaaEdEYERW/t1QptBsRMUa2Mzb9KcpV+vwJGd8SDN/jBLiL6EK4NBU25IL
	GWoMON8TshQ4PXU7Wm3gvF8cobE1twwlcCgrd2N1Q7yxvAsqlb6SjlEi1q0Ijt/a
	t0SZ2fsmzOaOOGWzAipO2hHB6XDGNYYF2HJ+j0LoVmfJRv8Zfys2yCKTmlELbPO+
	j4JoHRZVjHPVS8hukbOLNGeUxK89FxTEN/W7Fmjw5jT/6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac43ffx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:32:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d826ed6f9so153412401cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365136; x=1777969936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Zu20h9/F+SJQk60N5/Mbo/xF3FttwLE1vaX+pR9W0g=;
        b=hT+CQ1NzpDrKIuMVeJPIr5RSejffhxrnqBSHsvd9jYB7tJnoh+XAvryFB+VKa4Fgwh
         wucHkUrGdL4ww8J2R965XL1XpP6GiqGs9AJDRhI1l5FDVHRaAfilv7TMHLXbE/f0aQKL
         NG6iLyJB2Kw0nFkzapEWoeMuZarCJFcfoUbZ+xxqLvVP6ESXAustfCvMq6lNXtICkFpU
         ah2OaAnhd4xkzlILEAUDhW/ZgzDoNN+J95s90Sa58BYYwBTBi2oXo7sweOrrfTo5e1aN
         FiMimTO2CaHHHLvW4zsi9eQlq6PLXhPqRACmobKt16nj5oCmPQplM38tNMQsBV08y0tr
         s9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365136; x=1777969936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zu20h9/F+SJQk60N5/Mbo/xF3FttwLE1vaX+pR9W0g=;
        b=PgQ1awvuVDGg6Y7iRFairt2oFYhRNrS3rjMnH5MZjas12m6fgLky0aT3S+s9ZHD54O
         vPNcGeCbmH+YtZ4/4kJaTRigMcXjKTjlGnYUxhHZBUSdyOoknPbqTcKUhzplzbiml5ek
         dBLBqLErojkJwUzuCncEbUQg5In2rVNCvNqcjQsvehdxfyHBATVjPGWPH2ZY/n3+7g7Z
         9PIBzQD6yaOrYvbzK6s4FZw/mJdBzK+gNbbm3E/NEO/rXhPB8ssinrNY6IgxPoneI/dE
         r/0K8uCCkv4Fdz+uGYHLOg9s71/l7vaFZQcFmFHcOJYwePrkTziwW5wtYJFldXDrsTBg
         ZGfA==
X-Forwarded-Encrypted: i=1; AFNElJ8rgmXI205WaipNeMn5aNW2BTogRqE+CoB1s3AkN8asm5Efo3qzn/h02Yx9G28lDscRgUmSKRJuu0N8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01DY4F+ZbdcdBYhKr6RPE07nezIo3Ubyr7FfVGZDN+85x9Tiy
	LwZOiCCDFZLLKohy2k9vgcd+r8uf1nuAye+iXQu2tWzDl2N0CtHIA4+ZrNb/hGDRYYDbmspnu5P
	thiSv++JnwW3pBS4+fGVCubStiU5w8pnD0Wsh8GtvLlnCsmyNgMqev05UQ0i29JxQ
X-Gm-Gg: AeBDievBmO0FdrBoFXhw4H0NJkuEgu/nNgAn2LhQCTvk7jMCMcW0z8U/iJatybsxGXf
	BavxUdmkavZv2viMYGv/zu0AkIcXKm0fPV37aY+N83b3NPLkn1kcHhabQg0f0Amf7lzz/5KvOPc
	s2QKIT9T946y3TvkmX4cZZacTcAdiymV+qwLev0cS3Uej5Fe9fw/9ImUuZ9NR6a0q8g3nNIzOj2
	8/43ObhjbX21tWiv+zio7B3Wi81+caVMTzsF+DOQ1AO0s0wapPQXv1vzcYZr3Nq6q14Icbz8m4W
	oIvYmyu67zhiLjCVG13NeWHGZajlZv7ozAhreceuvZXkqhB9PbEtAY3J4t+6vujYT44pQWN2qna
	6rKvl5nmxdCRAajk/qX3p0URoYRLF+hKdNY1WgV20adUyB9E=
X-Received: by 2002:a05:622a:8d0e:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5100d9cfeb5mr22876851cf.12.1777365136002;
        Tue, 28 Apr 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a05:622a:8d0e:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5100d9cfeb5mr22876551cf.12.1777365135474;
        Tue, 28 Apr 2026 01:32:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773a870asm44939345e9.1.2026.04.28.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:32:14 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:32:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
Message-ID: <csj7ilfxa4hcr7groudzrrc4h6fddobxprmyveyae67rsgtian@rxu3gbhvulbm>
References: <20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com>
 <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427214217.2735240-5-ronak.raheja@oss.qualcomm.com>
X-Proofpoint-GUID: p44sX3f6D3BKaW2DwrEqlepEdFOPQx6a
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f07092 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1tJ3z92Lny5kRZNiqYQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: p44sX3f6D3BKaW2DwrEqlepEdFOPQx6a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OCBTYWx0ZWRfX5pbzXr5zXpm3
 JI/4D76r+bRxHd/xJn1z/0eX6ivPZD7fdwms1mWnWfQFxQbmIbbnSO9/vsXi6PKe0O2D6HcSYkh
 hO54QGYVnl4OHnS308pHcrnzAGfHzsi2EeWfwRfvtf2slL5yi8KgmQRuoqSuKk0yWAMkjV8/g1I
 +9hxAFJm32LGp+4aDR71tSSlZOybkH5yACDTxwXAKyNn+PpME+cRv236L/I2HNczhTSL9k44muz
 zgqeua5KRcWbDk4OEmiuyOxTY1Bgjl8aquI4zD/eD8B6FuktWcotcOejCacGzzawat9hXCUk/Gz
 k2OhCBSZKhRZ/9MefApVEzbDkKhZLZS+TCnTbSLtYV5d0CyN9Ewc5VLL1QPTyg3q5B7sxGpkN0F
 Fe0APsQOOKILlNcPuqUurtNKRjLPc9uW8fqSW3Rkhz9G+29UpJqZN50HxFZ/+MvjaoOpzn9V5wb
 c+4YHY1WZlPRdUP7I6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280078

On 26-04-27 14:42:17, Ronak Raheja wrote:
> Add support for the USB3-DP combo PHY found on Hawi platform.
> 
> The QMP PHY for Hawi uses QSERDES V10 register layouts. Add the required
> PHY sequences from the hardware programming guide and new V10 register
> header files. Also add a new v10 offset structure to incorporate the new
> COM AON register module.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
