Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB2371D01
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757546; cv=none; b=jfATwZml+emeRZXheosRfZKjyIaj2MiQZ+ToX3qyyTfd0jS1SxwtWINTZG7MMYwDVpm5q0os260T1ziYK1BKNZKv2Zgo7oshpoHKAosWegrc+Jywro/d1Id7HzH9tTELy9J+FqLX95wa3zj69w7q/SEcrcNCHKqcS/dpwemZsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757546; c=relaxed/simple;
	bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hekR4+CHs++QL7aDJ1gwAUqIoV/PXD0l3wKnglXxqyLL+2WkCx2SUR5BLSzi1mMna9ySY7oX1jOiF9SP94inG9TCzy77/kT+jW2cKsSmxXL8IXtG1+sNZlRD737fax4E0nArux0jEuXttWcA8VhGnpyj9hCppOhwC3Nnsq+6l/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfxDBEEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bG+q/3rR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfxDBEEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bG+q/3rR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l3sV2902925
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 05:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WabYORvD+LOGTdj3VELPHQl+
	+OeHox5ejDwdc2FqqqQ=; b=dfxDBEEM/cGpHFRB6YoMX3CRESHLQ3IIwxBq/Ca/
	8uijCny08UR4Xgpb/+Z52fGPJSbk7d1bnFXXqmV30LaBXBvF0MAHp9q781n5mOZw
	la+FlGG3gTYovKfS16CVRJ1NnnoT4HxdZwKNCi90wTiq21ShQR1lCmMAy6yXw5X9
	JEUiTWBNXfbNMzg/iqptgT8AaptoB2HMlv3lbZCUABo74bSszMlFZ/zlpBMKJdk6
	kNEpx6cTKlkxF8rRbRv1EonDOCr9a2dy4ZYN+7kzE09Wl6dFHlW8qSPJ+dDkF+bt
	yt1AKjiSIKCtypAU+RKcUz3JqZjaM/E3/44AhxQmjtXeBw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8eq5jv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:05:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so3900576a91.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 22:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788757542; x=1789362342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
        b=bG+q/3rRoS9omuekn7rGA9hRizuwjFKQkc0p8HJWwGTC+lRPSKb+GeCZvsSSYNbTY4
         q6/07H/wmGa6vpVTE4RpjQjjnSNKISvW4DcjnyCpkx+pjQLNAxrKHUg1liUpLtQEqyHI
         Ayaza6XdCv4zAsE4JTcJBfADFPhcJ7Ubco3xNUcscIYiy14Jy6V7j4DK9v3urafmXirr
         fbymYvHJeXiRQ7H8j29x17mnZEZckWjihx2O4Yy7FwUdDO7MzmC4w4RhYe99eT90pgSG
         nSOhm0CJx5Ttgd4sFUAwPN0wD6o2ku1wim+Qd6yLLd+12xvixYYLVGn2W2gAtWOk/7gl
         +F1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788757542; x=1789362342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WabYORvD+LOGTdj3VELPHQl++OeHox5ejDwdc2FqqqQ=;
        b=icRQGXHAuAGGs7FluCZoFKMG3wlNLWSYRD6ZjCwSSeqKle4Pk1QWBdriGBEHfws8xy
         mEYCTae/nk9aiqJ174eGbp54StPAPg/QHow79F2zVwLG0/wFZq180KxYGIr93r70ao1z
         M4qMtEp8bA1w134aVQDO5oS2ydzmmmEkgvCf47Rx0Lk562wXhL223QOtVsakjQVL/cNi
         KPaVJVUuSvw4yIcK9fwXJFdvT3oX8LtcpbSR4NLdg9y2UAaJHt8Xh1Nfzs3aFPrZmaxE
         vtcS0knaB+s18pYIUbEF47MapYMl2XXJNx40sE0nJCDIolU4tk/TEUKNMjmPm+F96H74
         sCvg==
X-Forwarded-Encrypted: i=1; AKwUvBxLhB1v5M7U+ogNj6AhDXhIlIAmlED3fh7iqBnWTCcNF8/rDaVL8Jfd9Pnc483NYwyPrnNeyV/p2JDp@vger.kernel.org
X-Gm-Message-State: AFuF++msaYj7hhlAWNpN2zvH8FLHRHbWOCfI5+VBpOWOY1dJR9zbCYr8
	vtOGEZxB2SpKILzAvDDXSPT2osyUT2Lkteyd9s23zJgFkS7WQG05XG2vQYGwJGK7xu9J9RsRS5q
	q5+oX5fiSHinEkFUNYuXg5zPctubx1rLIAEMleZxfnfKSHr5jdq6TMUsG5vFYAtP4
X-Gm-Gg: AYBFou2s2fOFU1fc4ut+a9FgdPlkWZRTG7SKyVJnFzppEuOzIL3FS+hCpThMho7n/Pu
	0NagQ7BgxYSPfcXB/q4IoLyoVIvbreVaQx8ZeVFuHYphFLPzJmH6e7hHO0AWHLk8c7YxymomQqQ
	+2IVDQZp6iOH6JM9x9hZZsaOSOuPrsdvRrBMSFFWU30scu57IRQdq0ivLmZ8Ap5roko74m6Hqyq
	QvjWL8mQQBAR2oYZUUzmkmPQAZAfO2EJfYyCFr5VeN07CmPWXe5jH5ZPIg8UF8MLeqNdWuUXp7x
	CZ/CHlhgdtRCcSXvAtfOnI8XJfY/cHPICwYFAsiyLFq+toBnE251FSOjKtPb2dwOXPoRMLaaebI
	ImsHAWJEcG6JeMMjM5T+R2MkS2ae2iNaxzOGHwyHPhhu9X1+R6cJ1rLdZj4TwczLCAKUT55J91c
	5feO47n23o0uqvsDmesmcgYXE9bxo7Zw==
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr33412168a91.19.1788757541740;
        Sun, 06 Sep 2026 22:05:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39b262aaf3dmr33412085a91.19.1788757541240;
        Sun, 06 Sep 2026 22:05:41 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm22004832c88.13.2026.09.06.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:05:40 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:35:33 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Message-ID: <ap5GHUJAW/8uGHUA@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-1-13e4e0f63123@outlook.com>
X-Authority-Analysis: v=2.4 cv=F61nsKhN c=1 sm=1 tr=0 ts=6a9e4626 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=59Yo_YLqCPc3mkuWIEsA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1MSBTYWx0ZWRfX8uuiRf43ANC1
 4S3fqMpj4k2UCcisZgqF0t84ljpR9vnKvyuLDu4MT/swJo6OIlP1R2YaNLNiwczAqcK3dII1/Re
 4biiQWD2wynyB3uHY1tQVcNWop8K94s=
X-Proofpoint-ORIG-GUID: QYsHrGVt6x0Vfab2uMdoUFOB4WuaA1w4
X-Proofpoint-GUID: QYsHrGVt6x0Vfab2uMdoUFOB4WuaA1w4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1MSBTYWx0ZWRfX7qzKVuXGj74I
 vgp6gZipT9Ilt7AM40kM48V/JsxuohJXeFamaMAnh7K5ZCpHjD6ywxluMQJnUSfSfLqHu4baKjy
 IzPggdrLkS6jne9KfTLOY5aLCo2MN+1c1WuKVza3urdjq0ApgyA9Sd+FryxIOF9Li6YNkXA1Pk/
 ToEa0wP1ggumcFdPsDVNuJid65NkUws4ISGZXj5wBBRPBCM/6MzlUB4HmHsfmR4Ws6XQUweD0Zs
 bTI4RXIHmp8jnr5V9U/QTNqGiWzJKg0xzzHssYtC8c/cfyko0qkxQjEmCc31Ta81g4HpOjTFW/4
 J1TJ/Wjq6f4qUzGN2L9ixNQdOuO4nRYc4riWJEqiJ0+KGrjsOlRKgjx7fk0sZ2TyThMqu3LrY0B
 3nuK2Z3NtLvHlBdqAXhEQbZdgKeVtL5oFHx1cgAs2lrrcddVzU3fbwghoAYAEALd8AyBvrY+sY9
 hGC2oXMbvi8o9IHzzmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070051

On Sun, Sep 06, 2026 at 08:46:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add ability to pass the reference clock rate from the glue layer to the
> DWC3 core driver. The core calculates the reference clock period and
> frame length adjustment based on the reference clock rate.
>
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
>
> There's an existing DT property 'snps,ref-clock-period-ns', but that's
> been deprecated. In addition, basing the rate from the period is often
> not accurate enough to derive the frame length adjustment value.
>
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate that computes values for the
> period and frame length adjustment different from the hardware default
> from moving to the flattened model.
>
> So, add ability to set the reference clock rate in dwc3_probe_data, then
> have the core obtain the clock rate and use that to calculate the
> required period and frame length adjustment.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
