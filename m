Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091213DA7F9
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806497; cv=none; b=i4DABYeDg27OK6pAaklYi7w5T1bBsOI6flIrAH2q9ap5OKnRgO+0KWlTm6QMedhkiQjR0oCP+GaaUmdF41goP60uoqEa1JwfIcNmFadWnNaTWwrHVDlMTz7uBnV0QAgS2c8euKPRpcfsbF5/4tCB3XN3OcLG+SxCS/6F7h/aJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806497; c=relaxed/simple;
	bh=Z5sJhmFXLLRBr6ct0ASzImSOYf6PD/pJ035AWH7eKmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsdFcU+9ijeEVRmxjf/UeBJ3svKZt7ySHxDYSmAnyWMGGIrhsYoLQFeTkg8wp/qIhpiw4e+2UtBiT92shlnrf5gtEca4NXE6XrzXARAeUmzoKg7LnQNXLCmJRSAnsvk0wlQIMQYj+cEzrMEofSGLWWeC7kH6iGf76GptvLn5JEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYdVptU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EprVsPee; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYdVptU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EprVsPee"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FwD1236269
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrhbNqEncl4QgLdWY9y6kNoy
	1o0cUezfb3qsSmxywFc=; b=IYdVptU1X3ctYZlug+/fezFcYqfNDBBu52XN8al0
	c9RscLH71bIGCzoDebkynxcyhIXqysLpsNa98hIdbTtK9ja8Aje4NNExG//5Zctd
	4Zq9SdFya5NZex3cpfWW/ame7QTFdJZDrxYrx/wR1JWfQHU8bYOh1sScmj7Gt67Y
	y6NpG8IohRPrauwJmlIyT+RTkrPints9vvDiSbh+F0eHfp2RwmVtvmoVt/hHO2fg
	i4By1JCaJ30kYO1jUwurkICJpNTUNLpU9XX3Sb4RfMkX7OU8gRDlJsfqn+pYbCwp
	gbciaxfsJQMTDAZMUg8ybXS1goVA1RoPpRdUvpAXkOvWYg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6djucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:01:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso133360e0c.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806494; x=1792411294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=EprVsPeeNUNnkQ0lb+sN86EtAx8tEQphorN5vZlpx8hiYets4MODErvhgNs9BztLfu
         xGwqGf6/1taTUU0myDJoO8XYfyl7BeJENRJIvoiBTahJkP91ffT4uZ4bmlE/62kkv7Rc
         pPJpqaxRXw4ZPAUKjpuYqF/aZhTeeLw+ZBmrzJq3XXFuY/9cq+IaQmPeUuqO7+ej8uJT
         XHweg5iuGrX9R4ZnvwdsE6slIORByitmElHYAUtCgFpsh4c1XLA0Qc55YqdThzcLjXU0
         mzAtwC/VLIYSxPLti7ZKyqwrJZ68Cp7zkr5hHBUFiOolcHxELdL59wVgUXsKKmtw9Yf9
         E+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806494; x=1792411294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=a9La6Ja4HZ54YsknvvfeoYJ5fU65uKRi4F+O2d2FpNU9fZn8h3MACs2mQFnhYxTT3j
         8tq7OAtOd3OLYrDao2MQ71jd6Kk0tyLGVoGwMTaeq8WFvHWjppVpeDZCpOhMK++biYkx
         OZpIu2xlTqHJNRoc8fa9LnimP8iqOCpOY5Irn27OYyFs9MXpC5H6R1g1/E5i+QV3yBn+
         s8FicAPuriDE/b+jcGz9vff20K3KwbnjiM7GsxKDHhETrLH2riFRHINUHWqdfm7J7vYr
         tZmHwJyXtsT3WQRqGIr3mKubahVysj1YioC6EVa6LwPH2/Y1tgf0Rf16/uQf7qMjjpVc
         0Rvw==
X-Forwarded-Encrypted: i=1; AKwUvBxdw8yLM5dofjsvpDO4V0v1ohJHm1AMkTTf07ikUzJmPpe43mQ9tP8jrDxpWk2/Tc3lutoFnchrjpkR@vger.kernel.org
X-Gm-Message-State: AFq9FYJhCivHDER050UxR+aiWTMKKTelSfK+k/1L5uBhCazoMWyOlTBT
	de/lt1xUwu9zTH1hP9OYWo9PbnZ1LC8RuSH6XCff0zq/vOcHeKf++3mwxLhqjNlU12UiY3u7LxI
	bd5zFHU23sNDfyxIk115L9pz+svjhcqZASfJEsq8sCBWEevvLTbU5ZHOnZYKR3DU6
X-Gm-Gg: AYBFou3AoOSWiuSY6jytBo2gfnu4innkvmDU+OFBphi8mkPulWoqe9S38IXEan2aBTx
	Gksso315XCG3vfX/ySBAJ/VJHiharXx85+FjE7XYlPuiCmRCbXj6R88IjmWQxsanICxSLG93JmF
	Q3XfYwz4DTkG+xk+U2OCcMgTJl0eV9sesdjiBdSDvmtNvgsXC/lz68nDgPtH+ZflXHI8b9ek55g
	Rsn4CijoKCTpV2GLyVdSzmxbGRnlFfPTtWd+iuN/nFBbd063wV//MJhcFdBsobSYOA+IGEq4Scq
	3JWb24s5wIzbUMLWRnSxCtZg6fR72OnKPbVQCwUrXn7r1sgyFLAxPZqhQ9vEFhj+3LyMTJfGkJU
	wOdZkPUuiV9MWWxCZF9SzyKOB9dWDXUjKelUUY/JU5ymuA7Ngs0wH0xVEsqsM9upLlBLd1OzWzj
	r62tIh3o2uAprC
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298499e0c.9.1791806493762;
        Mon, 12 Oct 2026 05:01:33 -0700 (PDT)
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298466e0c.9.1791806493076;
        Mon, 12 Oct 2026 05:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm2853885e87.63.2026.10.12.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:01:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Message-ID: <7sumgith3zgt3yhkv7ztlxwv4obowr6ed3vxshfg2ineiiakjd@n6a4gvnvksng>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX9cTsCsZuHyhV
 NDEoB5no1srsShtD63lHbwxAFk9cPyy2ekopTS3mimrC1PJ9AHjSTM6cm6aBKY4sDDmNn029YAm
 5bw5G4AV026Lb9xWvIJOGQoHSTuSqRGazzCR1YDeAbcg4fesPvH312LjycOuoDk1nlBjq1/izSw
 sjvtBMBuCMdlWNxPbMeviKVvzlkeZVp4v5PnlacYm+VqbEcUy5u9Yf5RnUf/hOe1JYDuuTHtTKs
 waR3+SxdQA+ESrylmImRSBXRpfRRoV7LqUHC94139O15rGbd7utJTyZCIbojmXcvYZ3cls0O0SW
 IGEUmruQkEKImF0orxQi1ekC+7tdS9ZuPE1NmyHThP8tV1DbeieGGsJ+80S4nOZraqbo9K6E4/C
 /Tuo+/9tL7BbT+fVQz8r0YlLpqQrzAflaKy+8/lH//NRBqa8mHeFzv3lmaZG9B3ObRv9vtBtS1u
 e81pK99wR8mvr8zDHMA==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acccc1e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=AFMKbBOjxLGfIDlROosA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: w9pyLa9-FIltK_6OX6U5-1ebpbAUYLj1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfXww0+jlr9AjNJ
 5WbrhaK6sHh5cETR1sxKsQiCDX2Dq0GClvTuqF2YJPfsACiMQtmGMVHb60bpT3gGBE4TZOXA+Lz
 jSdlujgPr4BNgcNbtso09fk0DvLsn1k=
X-Proofpoint-ORIG-GUID: w9pyLa9-FIltK_6OX6U5-1ebpbAUYLj1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:27AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
> PMIC, and essential connectivity, designed to mount on carrier boards.
> 
> The initial SoM device tree includes basic support for:
> 
> - CPU and memory
> - PMIC and board-level regulators
> - UFS and SD card storage
> - QUPv3 (I2C/SPI/UART) instances
> - ADSP/CDSP remoteprocs
> - GPU
> 

-- 
With best wishes
Dmitry
