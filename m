Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0C3B9927
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669483; cv=none; b=IuyxBOqkGbtyLKlA93XOLA2oMBJQ4Ra5+PofhJHqTe816Z8Oel2ftcA/dhQlzfrH6PiQYmoZHMV+1j7BlpGTdQ8CRmHbQ27tXGSzUiHEUPjJ9K36K0m+iIjqZVpXThM6zzm9yhqag4F+tKYDiIsa3CNb02K8lJVWTrOwP1Q485U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669483; c=relaxed/simple;
	bh=WGcxnkGuEQ/PD8PBykdNZKm9HI4t29kXKfK+xdeajrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHk1QDI06gqzx/di7ptjgaVPyYRVAN27x23GsF9FbIPv2BCCLyrkRY1icnaYzNt6EvCTttF++ptuYdhde8lRIPTfPJoEnN06Vj/ZfvySV6pGsC8uITTx2iKJci8hJgTaOPJ+LGv8+Z4YVu1E7uWG0l2kbovx36IXkouLz3rXgUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXSQVZYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PEs4h5Px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXSQVZYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PEs4h5Px"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKldGW3954804
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Jxq/pRyE3KiNBgXhnGvpItM
	kfBZsfa0vzGX5KU0o4g=; b=GXSQVZYdMbvLJv3sWVy1pwfL7lQt9Vr6Q0HO7HoX
	szVkVijIktha9tjhPbyCP2r9gnasbUWz2RPRFxqgatuEzyqRlydpC1NTUI25n9cp
	LqTuv2/5EPv/SXPCNusJtRFL6zZfuJkmEtXWuacMSPfyN0x1g99bUWgUm7a0Hwwn
	g8Q58+2u78ixXgpULUHiRbk8b/jq1nRh9StoI3vlNiA4iGND8BbFo8l+uPl7xbG5
	dHrnmBejUYIp+ozh7TTS5KPn8+C3ZwJDizB1xwadmxbUSbm/bMIjKZotsZSaMvZk
	0+yK5glDU/vf1oBhJFNChuLXm7lKrUtZng6eMr6xmfWbqQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsu4w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:31:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso150319141cf.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669481; x=1785274281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Jxq/pRyE3KiNBgXhnGvpItMkfBZsfa0vzGX5KU0o4g=;
        b=PEs4h5Px0l4WR65M6FsC1oBBm/snruS50ju2Mz+2Ux+plCH+Bj1qVIlToQNJHF2GNv
         h2tc6nNAILV/UaYh7RCdEOLLMQbtkFgE5mrsxtoCFZK2N7nKKeyv+htMK9qZOXat1svO
         eCRuZgL7c7sGJ/YS1+UiSl/ydH/MZ1VPi/vxeRlbaeliYdab5dAyuMEM/mB7b2boxGyq
         AkL+lhX+o/pLn75NGGRTcOEgWhJetYbAcrAPKduQfTuMvCYXCn3kFyak2OorznF5PiO4
         nMhs+HDu+MxAF0lj8kow+p3yvfiQD87aHD0nnWckEkGv+bWuargzV93+bJQs/9hbgG3p
         58eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669481; x=1785274281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Jxq/pRyE3KiNBgXhnGvpItMkfBZsfa0vzGX5KU0o4g=;
        b=kEawi3/h791/srWM/neVz9elp6kHAqfkx70KqGv7hci2msO+Z4iFcGc0x3ymgfZ0lN
         uTQ0aDYn/tGw/eZ9gGm9IyZOoMRz6yKwlby2z9vauzJMMKbzI8R6fYvIz5VbyugQ/V+O
         2xf0kUzJzEPbu03CCVwWdocxneSwP6krAI4h5mchIxvk+JTC0yKP8TQvIvxHqahDOhW3
         T95vtfV7/pUO7vAek2IMSksxHifQvwOgzW4bTmLydXjGG5+CApAYFUn29QRztd1vzwQw
         y/BkkRsOCC6Q4NP6y5yZWbZjONy+v1tI1epG+R696f4NZ7xRuZ/eD3Pyw7AjB1uR4Mbg
         ReKw==
X-Forwarded-Encrypted: i=1; AHgh+RpbBY2iG2qgYcdp0XipUhSwnkb12TFLp6AyTKx+ZfbPyuF+kTN2zc6WKKgt990O2A2qHRTFfP8I6YJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YznLUhyewXCfYDljebFJ56K+1bBOC5bnm1oyv33duzv9POj9plc
	whHsXJcQoq09VLpDrh43ToQKYeA9xMoZm7E+FnEzsS+6cKms2EqEegXwLl4KnL+e8iGSdqzpWr+
	gTQdcaDXSCmcxdc95IjAJaeZwZac6cOqu6Pj9IVhtzjsMr6vtIw54E//wsaZTq7z9
X-Gm-Gg: AfdE7clRWFEkrUO0FKB+as+rselYa5qH9xIIn6C2RYK4IK9fD7M4cFEzhy+TtP4lR91
	tUKnTnX9YcXthKbMGnGflaY6aYyWolG0q0z4fOVnPdV/FPpmlzHfKdtgNuntkd5l/XFeP53ltt+
	E/MEiiOr5oEal3n67G0D1rTpVZzTgafY4S7/7PSHJu93F3/nbE3kMVM0QT96XAQ8rhYNUBpg5pb
	hMuIvt5m1SOiPs2DhkcPX/U6T06fIQYouLAkpt78JZp8HnflMlgFfBHZrEFqZTL65gPa0iSfKvv
	efrfju6QYdGI/JTDzFWGh1GNcPGUeA5tq/OTp30kOGpfKASx+CzV2cA9Li90JR3BcbRYVE44IUx
	48+GFrVpdX/9syv/4OQfEhSicbTIG1WvT5YXvAVPX/Z5Sn4lgLwX2yHOCiBhuR4FC2S8nqRAl/o
	yHjgXWAVQNVnOGrw==
X-Received: by 2002:a05:622a:5ce:b0:51f:636c:8eae with SMTP id d75a77b69052e-5213bb21712mr199304921cf.14.1784669480590;
        Tue, 21 Jul 2026 14:31:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:51f:636c:8eae with SMTP id d75a77b69052e-5213bb21712mr199304631cf.14.1784669480127;
        Tue, 21 Jul 2026 14:31:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bafdf5sm123323e87.35.2026.07.21.14.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:31:17 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:31:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Glymur QCB
Message-ID: <n2v6fnsxxov2rxrhv5f5wj3kxqgc4hj4hmkwjhaxegz5wjrmhq@mqw44qc6hzt4>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-4-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-GUID: ng38lNllmp5C4bsV3kW69ziI4-7Msn0c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX8c80fGJ4mxEg
 U8SxTKUCorOJOAN042IcKMiCC9cIBlhM3Ddu/vQ0el0OtV88N1yMpEM6VuwP+NrGz2E4Et5QQ9x
 rXWCZUKaxggG13BXMqPFV/fnHgHhtAo=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fe529 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oAzEektMd9gfuz-7_G4A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ng38lNllmp5C4bsV3kW69ziI4-7Msn0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfX9NCoZVNvuJP3
 gt5FMSSGanAO2jHBlqKybJ1QmKDLktGqCPWWU6raGQSpVY2H9TvpABsUsFuUcWPY9/HD38Hd37i
 d32Ceu625L6nYIkJavye+kqkTW8e1Dn+qWKx7BRMiwPDQAZolrzMnbFB5BvYATSGq4zDeu35OZq
 3Tuq+zpWYfJ6C9lwo6W03WCGD/EG15cTIpwoyE6vrlOwhmkq2IYvypKM7LL7stzOwDRbwWLwTa+
 fpSGisPse+yE6fJrPU7lLwgYttNyhoHzxqqd17x4ky5VpOXTQ9xrEYBFrZCv98MJgpyeImD0sFg
 IvqYTenTCWCEKaJp5+9NfS2PnF2wE7fRqOQBg9TpKj9MRlhMeDCe9l3oB6Pa48eFs5z8x6MHBLe
 Xeu6IlDjGZg3CJDlGlHr8z0FNsNNqwfvCP+L746Z35bL+7kA32HxBF2BoMCDbuWmb88mciJ43pA
 Pg8gM4rsupEzgiqe8og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210223

On Fri, Jul 17, 2026 at 04:54:12AM -0700, Gopikrishna Garmidi wrote:
> The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
> open form factor, aimed at compute bring-up and power/signal measurement
> rather than the closed enclosure of the CRD.
> 
> Add its device tree. The board boots to a shell over the uart21 console
> with its root filesystem on NVMe. Enabled so far:
> 
> - Board and sleep clocks
> - Volume up/down keys
> - PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
> - PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
> - WCN7850 WiFi on PCIe4 and Bluetooth on UART14
> - Embedded controller on I2C9
> - ADSP,CDSP and SoCCP remote processors
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-qcb.dts | 679 ++++++++++++++++++++++++++++++++
>  2 files changed, 680 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
