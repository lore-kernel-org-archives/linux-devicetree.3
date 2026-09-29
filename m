Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538524EBAC9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687987; cv=none; b=Ughwn+rmBCy+BXCgZOS30lvl5X7KcfwMsvhhppQhLIFyfotbqeGRm9wQNS7AMjE7KXaszK4EbpjQMTDdFGc1SVgDYDb1xw4l8l+JvKe7RSIWu/ly4OjDCF3H26U4hu2zGFiYW/PvT2R8obg6HWByeqAuZLHJ6UoezEbbTA+o8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687987; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gta/7sVsoFCpkrbStqEGCDZJGR5zJkrrBN7z3KWdJrSS/sN910Ko/WNLt+ruFaMXg7HhZEIbmrMZr5JHQoC8kQM+Fd+qUsp5d/yZXSV7bw3/1DnCwRwXSXqRD8Pgu6tPDUoxHmfqiEcYv1QwLKAE0L6BtBdOaGafkF4jrJV/8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlHzN4oq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayPriXCe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlHzN4oq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayPriXCe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqmLK1017118
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=TlHzN4oqB/ezUHQHeXfCDFgi4nzSCw28zqyr8Qt6
	U3fYQZPuXk+FID/DS6lX0cxOVWvZneMpq3aTdYlof3Dz2EfjaPLS1KcEGderFqG0
	AXFZ71yDrrIvur7qAOKFJQIOGEleTV74HfbrxC+nKTTTmUoudDKU/HSuChUd7H+C
	8NildQB+6oDGiiPWOAt5VguE9cg2BUXlSxoU8ZIRWAF+pAAtybVDNUoHHa0iG335
	J14wx6trFoDgdCfDwXj6N4lNuLWx9e6ir34mNOOROFCN5HqUTytwb1eHD6StS3dp
	F2aTHtNwlbzeUUPQXRl5VO/9owlc3ePVoml5Pc1fUIx3OA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj5hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:19:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b2d35b3550so3322782137.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687984; x=1791292784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ayPriXCe0M+jTnOXo3hKHwTf1Dl1XzrBvcNeHyHTBiHJD7RmclbWYtWNWe4qIIBqWl
         icjD3qdfVcqMGvX14139zDYHy6/BdLVGO7LeQu57+0sG/LiWDOMIVM6LeMSm/rxC4PIn
         PVb55sxp8bDX3tnedPKNkmHh7jQKLTqRX2H/Q8XMrLxv0ViHvISnHLbE9NKUEo2vPsup
         692yKBBt+cTVPnyO5ciEz0ZGCXvL0TjFYfkVR33LBvxwug+BdCGTCPwTzHiDEKJdQFVE
         vGwdpkXLHTGrT+9PnbfEczhGGttZVZ4GKeDAdp+Bohdp/r76DtIBCzyINJPmFmNAVdyw
         s2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687984; x=1791292784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=uxq/XkIpPS6WneOkRbG5yeVYZZzGKI/gshT5hnxItPpbfHAT281JjkBX0YqmZyrxyS
         +cUYaytSzg2ECRBxvE/Yb8WsfLDiqW3PdYYCb0g6b2jGEhQue84OBz/GQ7rR2ABCXlCU
         kLwfZKCerUOCf3j/PFMdBK/K7KouN8QmPzpbnfEImlxfVnMtqNsL7A8NT/Et0hc3Z00n
         4NsmKgKEoA2Gxyx2K0f7G9VJ4he4fBXhpmmHH370X8WfyUtEOhNsHbrKpk8LMaPxb0QQ
         wmloOvLtd1vry5w1Hc93KRbQXMRXxvG79kJaT7BDkgAOueuLveCRXD43VTRXspPMsa1S
         lH5A==
X-Forwarded-Encrypted: i=1; AKwUvBwM4JBiK2aBntpYe8ioke2p+zHYd0YiwSK/jjjAE+dy4hQwy0l3cIoOYFqGLKdTm/y8bzGki9kolXGW@vger.kernel.org
X-Gm-Message-State: AFq9FYLwyFQRXNA3ar8FBz7FjlLJUJvcHPLsj6y5t7/o9HnYwR8KzQkn
	dCF2SDOiSEnCW+DBTjtmlO/2eyn9Vn3/Juz48FuClEAZdT0E1zLe+xsry2uKFrpTWiaalbXVDyW
	6jbuMVpKP/MKYFk3EurD35wC42WoRqZ3LzGr3U/EASgAuvqaOtvGyXny/qadz0nzL
X-Gm-Gg: AYBFou0FtrQs7vSUySTTck0cZY9w9zhY+DjNYvpNDISKjL4GZiFl+RFpTpa78hAdIkI
	WJ8L/f8+AHLf+hSCzyMK4OZlGT4PQWp6hL83q/Qbp7twGrFZvmmOkygAM+kiGM+rqcOO7EeA1lF
	/J6dSJ7dCcg75/z6Vxrm7wxMbFBSRrt7ilwbgU1W7PR5boN54rI3gm17UwYwtYehIeOuElbzwX8
	DfU6Ug38t6k1XNE764XJltlNnYtufs494WO1AK9gZzKM0Uh50KPqO3okT8ipymFZ1wNPHlzyRZ+
	q86JsMUFGwudq+n572cbskYf0cvHSiZy8FVO3xMAsq3NFlrGIhj+x0l1rJmmArBYPIDypHcEp7w
	IxJ58GW1wDkbmGL8=
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908987137.27.1790687984147;
        Tue, 29 Sep 2026 06:19:44 -0700 (PDT)
X-Received: by 2002:a05:6102:84d0:10b0:7b2:43df:ca51 with SMTP id ada2fe7eead31-7b243dfe78fmr2908970137.27.1790687983594;
        Tue, 29 Sep 2026 06:19:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfecb39sm85112185e9.7.2026.09.29.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:42 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <x7k2cumcciponrgroymvh65r2dqgagxd3gaxgem3di4mcaeriw@njn3rc3jwbbd>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX6Yyjjo8QCiH3
 3KbGjrlFqlolE5hWM97JQ2U2WIlCHvjOnlRQvgE55YIf4yE/3sddGnXhbtzh4K7WrCSb37FHXIM
 WfUR1OyYTPNz7O5IaaSWwlFQJPCIKwo=
X-Proofpoint-GUID: kpaP_cGBZq25HVFZQh4Gb31wOyDQCfHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX5vzIvue9Ue6z
 wsbI8TQQ+ngvHuKz3iRqmjxqsPU6k4B/5aJYS2RXDFNpE2g80Ip9dtLbB1qHmLPoahR4p5IYfpz
 ZqDTAYnwtAfG6izoLXxhQZvCeKweZ+yQ2cH8jaShj641b21S8Hb2BrfSlx4ys4SF4GoZpVr55bk
 ZLn9itda/0wgEmpbVhFoWF3kie2yqVd8l4uSTqfndqFypiSds9kS6wQaSnUJ378H05T7GRNAjxe
 jgU19CfBNWTjjjBZCkVn9YxCRSoD1ZO2Mi86iKg3Q4eDeF0zHBlJUsjI8UhUDPSABDkR31nTnm/
 kUCXx9SDky8yklCHPEXDSNzjhuFk251os/P7QGsK1Xe5CBkCxDB/ZozxnxtjtdhXL76Z2nhHbhE
 K1DwhKO0iP5fMHAL7qLM0bvHLB0uz7vVDlUBYr/5om+9LTbVZdG+5a0oAzawu7dtlSaDj4ld14J
 gy9vb/fgi5dj0BfIG0Q==
X-Proofpoint-ORIG-GUID: kpaP_cGBZq25HVFZQh4Gb31wOyDQCfHO
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbbaf0 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
