Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F443D648F
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300681; cv=none; b=RNK4LzFjkG3wJFHZjIdTu40ufmrBs4AAMN3hm1MCA5WmBl4g6EpYadwDRLE6+HbOAmSt79pT2Vl+p0O86nU9lD0DcybA27WS4xE6YDhVRAoYpWKW1pqUUvXcXqepse/yG0OlW3QM8B97rm3W7YDxJeODVcyIDaSLHqguucKh0Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300681; c=relaxed/simple;
	bh=2QVwQq54txjm+tz8crvzEY6MS5j3yuO8G5yksIevunc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODFpb15ge02TglCPpOnG/BwJJCWaHv933TcRHdhRDiGUB2hmFy39xl7ytiQsZTurlVgzlf4z8sa5OJC7n4r0le/aks3fBwCJjTbUCk64977phpMXDGGN9oI2SFeadMDgq3PifGF/W2bh0r8OWIa7mBv9v4Uo3+VhrNWMhq4Ubh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JSDFHSmS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CuZOSlEC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSDFHSmS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuZOSlEC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7qVF1973436
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8mFE4Zuem6D5GuQC7kLvFWE/
	dtUJIComejuqrkkbY3o=; b=JSDFHSmSQFFx/hexVJNiyKN2vqwoVtyxqD9L+lQ6
	twtkyHBAnroclehLzOhzHJdkowq1vF1++CS2F1RiRpicatk2UprFYJCEYQIXMyPw
	oYJ0daKUcfz0eOVTRNizhV7UeeY2adUCtiStIRC9DfmFdg26B64sBGv4mFjVR+CD
	CMRHO9UCud3PlKYXlNzkpvoI9C19XiK+JnlkKOtH0/ovdWwocVGdUaOKkX/1stiS
	t57L/82PJpk60CKL+ipVG3E6uGGfuFj7nzyncSeh9zMWgiCh0ElfIhsNCYCe78Bf
	3isxBgUu/thBn2WEM/KBFJP41CoSUpeWB1WTzDe1AN4OiQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2vstb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 15:04:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso9003032a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300674; x=1784905474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8mFE4Zuem6D5GuQC7kLvFWE/dtUJIComejuqrkkbY3o=;
        b=CuZOSlECOxlWokMWAYAna5lV+dzKjA+Fwi+UO+5gIWrVT4h72onAsxwX8xaGVgDSLS
         +Q21UAbDwvZjsP+zAdxxDT5DXsx0yoXha6UHwAiGxrmjY2cXG5g9WnQ2dN8qaqGDCfwR
         OYuH51CSW4P+1/EyPBDcc9+pnmJMDF3HxU3dARusPXE2lbyx574STKEF6gWZ4KualNeu
         Kv/j1DD1l7LwN5hbPTWXwdQjNrKbM7P9kseFr/vDcpn5LwEaZ14g3W2XODwtK4JuWPFq
         7qS+YLG0W6euwo4/KabVLbUXCVANVe6rafkQNuRNGg51ksSt9RTI4HKiqDbhukChtUfn
         HOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300674; x=1784905474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8mFE4Zuem6D5GuQC7kLvFWE/dtUJIComejuqrkkbY3o=;
        b=TjZmj9qpiHZ16fTFzJbyqsdh7brcDmv9/+DCvZxpF/uylrpUd+ZDgdObK1eoE0pK2E
         To4KrC1CGSV5y0wYc3oY6wV/erNIx/5Qqe2D48YMnjPwoCjmufsluMt/t9kPDn0AIaxS
         Q9uOCFjUBmER3g2/3VTslixcQjFSVD3sql0nyNr51KywXO0IQRtndHpRTY6gJLGdnoH3
         jDaU3vmwmyfp/06h2txldyRb+lgoLSTyUMZ/h3GIzgvoqf3OK5JebwST8TkCFWmz06mY
         CspYqU9ieHfdl213lKZCQJkSuvW0uariveB1wAZn130u2Ger3Qji9x8dDL2sKvJTb4X7
         X+5A==
X-Forwarded-Encrypted: i=1; AHgh+RpNZe1Z83RSbt/rDxwJVPoLQpScxYabTsZveZxUpF/7hCx353QqGwmUfdoxgwDpOvKAePXFMpMv7bEu@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKXE3a+1V09P4oJAErAaDeiDOVSntdsJsJGxipAhTZhPqN9QR
	3HhT2FyCRg2vVrp/zOB/zsoeEKobtov/YO3yuCoDHzf/e9ENRsaISRauVl18Htcy+zcdHIW66Pg
	bit3VOOsufohTPE7eOc2fbR00JIomoEMdzkU2yjLg0tKY9cl58MyM6zwChQlkjMJSOokifjfF
X-Gm-Gg: AfdE7ckqFKrYgqJa2jYwYdm3PzVQAo3bKN2SFlTTL57XSTJggqjDGEzhnNXvabAshRf
	lhg15MmvjnGjexZogwUhU+K4gSRFatE+GkB56p1iKMHUABOJPtBIyUABYeqhJLzZ1IZRupvHirk
	n+XLHOEpgeL1DUT5avkay6BX2Qg85LqFxGm0S1KQC+0qLe9Kb2lzBrJxQWVrWPvtug91c0Yr9J9
	e4ILaEuqXTpyvCrM2IidTgog5Xgf+a5Ggbj6c5HYNUnS/hOArmoksgYjDdtHGqhTSpFl7MWHEVK
	+/lA0arkZjNKd0FzdHvZZXV3zzzywxNHoC5vZWxDGjWac5Ke22EqLiMl6s2dBw+D0QBG9IEC/T1
	vu0Q/qxX7lZAomTLUQAk7AyJ9UBY=
X-Received: by 2002:a17:90a:c885:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e4b538938mr3291375a91.21.1784300673695;
        Fri, 17 Jul 2026 08:04:33 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-38e4b538938mr3291259a91.21.1784300672917;
        Fri, 17 Jul 2026 08:04:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm6280032c88.6.2026.07.17.08.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:04:32 -0700 (PDT)
Date: Fri, 17 Jul 2026 20:34:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Message-ID: <20260717150425.nfynctjnqi47upw3@hu-mojha-hyd.qualcomm.com>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 9Dh8TApRB6WQyoufuGJkSQDq0puvx7ad
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX6oS2jlaP/7qx
 /4wLv7kcR0yS6Q/fPekiO6dBE7qAK3ei9+eSmQZ84BjiwvMNZuVuSpy25wmivvpwjtSr0bzOBsz
 Qcq22IyqJxw8d7oQgDlQQITFg3xnZSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX88isJEyCKsH2
 Jz9xg9DsUnAtaUViaYzOV20/vzgMzMroZ4pfz8V1YfyKUNI+nw8sVPlHXtVGmUXZF3/WVwhxqeH
 xwBw95XGQAsebNfW4O3c10KX9ztTFyqgqWJGrb/rnEr/gksndGNn9ougKLRDwu1qudKMNPwoJhY
 HrCwwGI8Y0h6wlgusHaO3Ec0DPv/5npl4Pck38s3sk9RCdPnSIE2Dh6r5G7FIZpBbxIEpng1zAt
 ImPMolOlnK3E2mzgCHNdYbK1pPNiAjZBgsrB+jGnIbNM4DTOFTMNqoMcLr8iyvO+w5K4ETOvjEK
 msw3fwW4/UPNEmbZkYaXL8FrbHLS7ErWw4D9ZLFiAhafrJ0bHzEARgcqDJZ46/YkymPDDeOsW8x
 46QcyflT0+WoyjZ/2OVpQCsEpa90Q/6V1E4dmyVZyKeVlaZPdJkAhdRqOJ9ATJmbJAxoqQI2Y5g
 YJH69tPqvlCzdy51WRw==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a5a4482 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IXoLagY9VYqCqr7K_xUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 9Dh8TApRB6WQyoufuGJkSQDq0puvx7ad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170154

On Fri, Jul 17, 2026 at 04:54:11AM -0700, Gopikrishna Garmidi wrote:
> Add Glymur QCB board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index f35f2ee39130..e0ea40b4302c 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2326,6 +2326,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "microsoft,romulus13", },
>  	{ .compatible = "microsoft,romulus15", },
>  	{ .compatible = "qcom,glymur-crd" },
> +	{ .compatible = "qcom,glymur-qcb" },

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha
