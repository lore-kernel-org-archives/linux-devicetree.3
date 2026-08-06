Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC993CF1FF
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018382; cv=none; b=jdiZcPMob2FuifwLCATxSlGyQGSFFsbUUcH3gNDtphw5Fg6Z02+Ut0nH4xHy3d8q7ILIr6k8uWowX1tgvgYO9qOyWbNnvfzki5MMO38ARvb3tDD9Iwug+WvRzbnqXQlbGe18YOS2L+3qtx8da9nj39Q7hrdBOXmZ3hvoQb0zqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018382; c=relaxed/simple;
	bh=/HFz+tROyi2XG0C6YOveEYH1xGBIKHTQ1yyuq+1e4dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXQwOMvyOBOCPtD1s8gpkuZACW+MUAE/6/H50Jq/CAAaiQ7sB9V2BwLTC1ijAwJTipgNN8+9oaSDIjo5rgXpni95pWmnd0SZnAORCsHRfMpMZO5U0qG0ooAQDtoxdyPwltj1mO4OHWdDBRTZ/jch/A3/6De9SBgC8LCJl5mYcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJ0tNGSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBrqk1Zs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJ0tNGSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBrqk1Zs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769o47W1581636
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 12:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sM7RDCxH2vl6P08Gm8MUGOs3
	M/Hwc1SGIEKlBUKfEM8=; b=TJ0tNGSGZRGgKQSZ/w8j8GvIrg30RpSMkj9ARWPv
	0A4oGSadxzpAE5CbIohg4BgfJnTIzy+egJL1Ta56BkZYmJI9DiOwov/ZisGQsc+g
	Y33UNwN5M2R6RnqsbSeDeiyYg6azRHArHKPlwmo1vNPo3nI7aO/O/ZpKeFwEt327
	TPkf4FPgjAtM6m4uNkxtCvRDjJWc0L8poytzvpMciqadtw1QKydljirDrzKfGAXD
	hkDd9mLr3jpBJLE3QPo64uxxI4e9uP/DYALMHgo7zSEeUD7OkqWGMckxJ3kAImPG
	9BmM8e4jHoEVHLoOg/kledKVRYhHb4DiMalbdeLWmARUpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvmrjhjph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 12:13:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so23378491cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018379; x=1786623179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sM7RDCxH2vl6P08Gm8MUGOs3M/Hwc1SGIEKlBUKfEM8=;
        b=eBrqk1ZsH5pD4U7928M/HPDO7NnBnme8mjp4PqJzOzJ27aU2d63dimQXXi3rNzez5O
         J/0VZRFlb4dNZGqXRha6+3DvVnGfNgwKPt+575s80/CjAngyvR8ZGXqtZ+oyQhrwYBC9
         SJv33Mm2hEkf3j3oUEmmXABYRIA3o13sMe3d+YXkTTda1OsAyNt1mfHLULlx/TDZSOba
         zNM201aun5icMJa2x43J3GbmJTkVUteq6wiqsB87IJzkxmtN34+dmWHk3pCb7n6ZljbL
         GkkqrFBjtbIQydxPxMTXFHTeTyuji6sEW6FKrK4fxFcqBewoGY6BYfG9xnb2FpdPqBa1
         uEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018379; x=1786623179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sM7RDCxH2vl6P08Gm8MUGOs3M/Hwc1SGIEKlBUKfEM8=;
        b=j/OfarHSoV5qItz0mxaYFydMCeME1Ty86TMv9O/rZBh2Yesj8Ik2i8mk+vvRsRXfJ3
         Lb5r958iA1pGzOaGLMTVBSuzV+qFZ9lCdOA5K4Sk6G3MrDGCvq9qJmQ0OkHn5TKO3K3c
         PDK4CJGnvObeqwQjFMgt0IDDcT8hBXehtbKJyy9uucL9MDsfUaxvwTSra2tR4ffEMnVw
         wFUezUd4TEI4Rxmc/5EsIRmAB4HenWSVUwg1inpv0vScOsmyV1Nyn/NDoFiVCrWoqnUZ
         PETuyKu9KB5tvfpMIJ+b30XF50JqPgtZkMjTPlLGbyCOl0rGi66TvOeFUFt3FMfNPIVD
         +sxg==
X-Forwarded-Encrypted: i=1; AHgh+Rpb6RWA6NnkeIx4QhYzADrX5KDuPwK42I3htbgw+07Aq6WF+pt6qvkYCYsEe+0MGAO8oOkJaz1be7T0@vger.kernel.org
X-Gm-Message-State: AOJu0YyrdYJ1b9rCyDgpvXrlkwGOkZYzOK7w1Q32rO9Xlx3GQOuoS39B
	wPVwciZF6yarsZcUWj+ch5eMErl3MGbny6B9llLIOo562Yv+piCUCE8oUKcbsgHpj7nQKdRy2p4
	VBEYeUS5ipxKfdCiZnqUEzi7TRJH1Ss/sj8Urr5J1sGBLbuEodYU5zZ1KNVPCeOrh
X-Gm-Gg: AR+sD11ehIiOxxBmOCV1Ua5x7v8rJShx4KbnhpF9gCwpH+/C3xCpm5EJKU6THSFUqXR
	tzk+FtrujYBJPtW5dpSd5SwaayB6ZVzbOCyqodciqZ5S9US78fRKPoOLpRxXYo+krFO+WyEHz3x
	nxaFG88TICSBbPeoJIjCV4cxag3tOj9eh+6GLnZJAc2ZXejFojXPp+Y2IE2MXOhJxaPCmF+vy01
	RS6xVxrW7fpBLXD5Tq5VbxJBr9XtaNMrH85KQyRGxZ5QzleGgOfPShEeIKcOi1D296wPe6cAQsX
	ESWFYg+I8EgHIKmCZzAXLWJbcbaF7BCLwA0OATa0yuwBDk7Z02LF7E/3usTeOMaonu79VXLpLSh
	Q3T7HINU/kvZPnWID8bxRW+DhsQ/w0PE4fgO5brdbOqZZCSgDwk/zkGlcfAgNPHStEsVEJrjrM+
	VBs86LDnR9Wee95A==
X-Received: by 2002:a05:622a:14e:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52ce6183f7fmr132756631cf.33.1786018379226;
        Thu, 06 Aug 2026 05:12:59 -0700 (PDT)
X-Received: by 2002:a05:622a:14e:b0:51b:efbb:fbc with SMTP id d75a77b69052e-52ce6183f7fmr132755651cf.33.1786018378699;
        Thu, 06 Aug 2026 05:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235d17sm698759e87.2.2026.08.06.05.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:12:57 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:12:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Add memory-region for audio PD
Message-ID: <xbw4lpvqi2rev6ehypdng2q4mq636553ftcbcfm6wdj3aa7qfu@d6fctcmuxo57>
References: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-agatti-audio-v1-1-cd6766cc9ccb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VNPtWdPX c=1 sm=1 tr=0 ts=6a747a4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=u-a0JlRQecB2z73C0TQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: TGzi3DgPz7fxwa-sn_usDLLF_2sgM7Bp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfXxtc14rm6eo6I
 JBBIa4DE/s4jcIhNgBWgVEORK6NtHt4qNbbx3d6JXj9KkfoioIYRsIQFTBfZqMPzGMMnYh/8qHN
 G/mNryvobb0tCye5xYAXFakQE0zW7BI=
X-Proofpoint-GUID: TGzi3DgPz7fxwa-sn_usDLLF_2sgM7Bp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX6ouQ/AW/GxCb
 VIcyjB1lIfdXS5WcufJdjoVTHvt8OtSpPU8VXoJbXN5wHiowAqI86IvqAT/t/yaIu2OMM+Mxgvv
 54Y0mO4TkSx7z1dOukc/PHk4+16z1otB1r0e4Kpr1yBlwVfsGsEK9ZbKkQIhRmFPRt/Rp8abOMA
 vfcSt2QvO8MqEs95mYf1rET4tBAGN8+Fz8XBV3nxXMezJsVi6kAsWSViM42MCEN/SlacEAS+vMt
 XU4e7IXlMkWuLD7kT5mrODI6+Ip2hPtbF33PjHNoWj/MUIccHnEgkZCsCLHc48Bzvf1xjIRrHBp
 w5VKtfwNDrn0UxkMstk6HRzYiEBBq2y9nORA5aEl4Vo3QRQEjh2ql30qgu7h0UejpdoyM9Gy//I
 J+wjJu4aUbfvruFgv5c9Sj3fZ2b9apPvcztDVf/JUNS3wp5OB7yOQlwEnsX5BGr4bVVlG3x623i
 +8uP9inxtUSIP+GUqcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060096

On Thu, Aug 06, 2026 at 04:44:41PM +0530, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> @@ -2348,6 +2356,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						  QCOM_SCM_VMID_ADSP_HEAP>;

Either put it on a single line or align on QCOM_SCM.

>  
>  					qcom,non-secure-domain;
>  
> 
> ---
> base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
> change-id: 20260806-agatti-audio-357bcd74ae9c
> 
> Best regards,
> -- 
> Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
