Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5339C657
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837372; cv=none; b=Se3H2NR7cjRduul437VSfgf8843XxRdSR0wI2If0zuXihx60Mic6UUdCqYlXEIZKRF1eAdPLji2AKJuwC+hBHLFEH2ilfQvZCZHVKkd+g5SMGknTODWIAAgGzgtCvBep2uABC+/NCzx/l4t9LCBfIV/ayhWcbe3ScuheYgY/ADQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837372; c=relaxed/simple;
	bh=H0AZCZgDyOvdK2zdRG3/lZrnk8hCVizgQMRAjseZ/DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=An1iVGJmA4ihONXJalL89MoXruD4+0dqcNBvkY/BdOAWE5yNOnCsEOSmCRe1nzlbgmN7X/iBevjr9Fdo3J+p/1PnO2vesego3HiMoZzYhyg9gcyMDwcJ+KASHmYZNPwsidos4kCpL6nGJyTEC61M4WQKh3KbjhpMkq1OZr+Vit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m33+PG7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h5Pcqn28; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m33+PG7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h5Pcqn28"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImGeB575374
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K7z/EglnG7R9Oaf1L7bayz/y
	cLeY0+/gd0W+4yHQeZs=; b=m33+PG7o55a7zRNuMKwDgAcuxYK3P+nScaRFrF1s
	QFji+hsd1T8PhSIVeix+lIVEe6/+ddKYgn8rbCA/Q1Av2Hz97/LKSofiQP7GZVKW
	YvZRQIYBZbQUZlXDZ4YXI3A+omgC2d3YNl6MEdz9G2Uz6XRUyTo9+BUlPi42GETc
	0IY+K28srN3fGn1DUXk9qNs306YmQgqCbRUsDzPvOH9EICkI4UkSMwUOIClks5O8
	ZiX1u0wNd9sr0ibenzt5xglY02VGNhf/hmYgptbe7CD07CYq44UUGOFqmXs3QoFP
	1BS8jmKwRz4EUUQEx8/pv+OPqwYUarCLS6q7wOOmHBY0wA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0kudbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 20:09:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907c59bd73bso20249156d6.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 13:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784837366; x=1785442166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K7z/EglnG7R9Oaf1L7bayz/ycLeY0+/gd0W+4yHQeZs=;
        b=h5Pcqn28jlKaQKh7cwWqjx/SOqHOD4k1SxcE1Xa2HkPkSPxJAMiTroPMMGKDJbqGg1
         huUM5dHfi2A+y4JtfFCR1oaV7fhKUWT7+zZv9cg/BDVncPh23CCnjhl1qfvlKUaoOgZ3
         XxK+7zpBs31LV70JGNoxACyy1sLfKno3YxThM0XXiA5y8AYrpVBEtXWpgxHhc4dy7i6r
         WsKzIiSi7Vg/IrNSqODrD0bhovkktSvYH+EPDgOZfcxLSxxvzITxkO4U+d2plozRlLji
         f2JTuV+noUytv3m1qbDOJDXrx/ExthqpGf21wPig4DyDV3NjHeeQ5WrBvH+CI3iywo+s
         bA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784837366; x=1785442166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7z/EglnG7R9Oaf1L7bayz/ycLeY0+/gd0W+4yHQeZs=;
        b=InkXvndsiHSQAT+0bJhw19L9GfnoJU/cX2EjgWNJcQSgYK8dfhtNtLFQa3spRvQTsz
         chHxXbM1GoMrvH6a3gBf5pCvcrP+OOzSbFyqM96x1++NHfxgph2TJhPdf5Vu/K9EdAAA
         oYPd/oFwrWfHurJEsf40iPnXCOyv415Ee1ls2b0KslVNjVh++zLTaG1/GzU9XgUtMU7P
         e5PgrpKf1P8Ec1JtOM4pM9pz6SuRX8WnPa9SH9qa4slb3VUKR+9J9vFFYUIybA/TRhVi
         6Ccp7N+3SUx6nltHPWJSQqAa+Knlz26lIxjgUMBrydpmtzZe1X9lzeaMcs1IAw9Mx/Ne
         +iTw==
X-Forwarded-Encrypted: i=1; AHgh+RptyqJDCH+c0rorTP2m905LRRi/iPNtffgnxVcdxGqiGKX2v1yhNSnM6UgfsLFg5kGnYoXA3zMyDmzq@vger.kernel.org
X-Gm-Message-State: AOJu0YyWUiuDTd0wqVgZ+ZgirpbXjn5oBS9wbhAz0q+4yaL4pLIGLbRo
	dfsMa94tyrlkCRab9QWlAAVe9nPk0eFIxYu1SX0NIS88O53h78rbIn7F0kZjVYSdG7mVX59Jy0f
	ZHYIDUo+G4PQbaeMik993Z9BxZGg7DSb5C4ZppZMLvDXaywezHPNj9iO1t6NEfIYJ
X-Gm-Gg: AR+sD11DbU7L01A3o9gr4mbhCbmSFli6ObEmdkqNxU7LoR9dXw3IyZfDVH+ddJLHqW7
	nTAkoX7JMrKQThspcq7Qf2Z0cVmHjwH22xySF1Q0nim2CkSI13NshDeWj5FZtdnwtAVf/Dh90xz
	6DTHBnIlWUkyxBwwGd7IjMtz9uoghuDZMBVEQTkKxCvPtQEqY1olXnrRG4M8D/S4T7BkRRB1+ul
	heIekgThP8XD/N1GeL2BgcCqxgbi00KV5JvKDMgiedvCEyhmEi0o1IxbmdlqYwSsh0Cx407HZbY
	d3EjK5krdnh8CnUIUTUVcqnm2jNmdXIvKGdc7CEHmjxAfDWdP15jtgUCmh/9ea9lR4bJBT/17FX
	+yKWfpToPGYqDdOAnlA0myjoio+mp6JM/C/WxiwwDrpWSC8FktRtU/VRKaF5PBq6qkfbdrLK94S
	x7VN6/xMCufSh0vQ==
X-Received: by 2002:a05:622a:1354:b0:50f:b732:2025 with SMTP id d75a77b69052e-5283df4d019mr42749761cf.53.1784837366449;
        Thu, 23 Jul 2026 13:09:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1354:b0:50f:b732:2025 with SMTP id d75a77b69052e-5283df4d019mr42749451cf.53.1784837365986;
        Thu, 23 Jul 2026 13:09:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c41f59sm11872351fa.25.2026.07.23.13.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:09:23 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:09:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Configure USB controllers
 are wakeup-capable
Message-ID: <xf5yjjvxjiefpemfsehqo7snxf3lsvg23vw7pfse2gsmdsywvf@ccddobgn62po>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-glymur-usb-fixes-v1-2-816357d5319c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Dxs7pO1UH5GCFVv1TkA2Obr-j8dk3GKp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfX8jpRoetsbC90
 b++rsSvkOPzrUeUf3+fPFWLTrdJlgESKykHIRE4eOV4je/cDXr7lWRWazZDystXGAuszjwXO2dX
 26XiZj/1B0OxQz03sb65+zWgvRhJqzQ=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a6274f8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=i8nJ_-aNT86P3f_d1rcA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Dxs7pO1UH5GCFVv1TkA2Obr-j8dk3GKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfXw+Dy4MvhtJXC
 b+FHUOxEmriVAf/uWWvIoktDyNgfGI6kyraZrZbLEFYbGbqCHVC5WcEZ/in762ksPgsy1i+m7DE
 X2Q8uZF5w+n2DPgOc8DRKK3C3Jc+re58lKsXEm7KhGfRM5IzpmyNMt4eMbJBWmrO+5g4SSDvHhf
 5xJ5NqxGEKiq96ugvgcBSWcWaShVbGfQqpddKOqaMfTy5afdX6H0AL13hQBg6jI/4NBJWilpuaX
 z7BedtMgYikCKlSDAt1IDnX5kljBNRdtXmqFm+u6N6dYvW3fZhJ3SGpSB70F0uwOkLyyeV7UQ65
 L8h4E4sQ4rJa0PyiDPixEAfzxeuyVddxB9B68HHk5g8CpRE2Egrg3EZdakHOoyfFc89aNjKA+B1
 fYh03Vckrl/fX/FtbEn8E+UYVlzR40g0hcJzLXYnLus/DWQX85Z2vOsMP5cdsgn72wcRefiE6Xi
 yylphphkb/2TvHQd+sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230195

On Thu, Jul 23, 2026 at 11:02:26PM +0530, Krishna Kurapati wrote:
> All USB controller on Glymur are wakeup-capable device. Add wakeup-source
> property for each of them indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
