Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915425B0A0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779459525; cv=none; b=sElAOaC2cK9ncyySJrzO4cTbohJZiefo+odr/DYUWP1oCyet4REJsXsZ0AY0Jw6MPWjmuH5ox5Ogpm0bfX4fKl2Z+GdQERBPX/ymNHZNNLiV++1Gj6UFurXjC34QY6E96Q6zu0JcPxByzXKjYX0X1d0gDQLzJ5pXlMVs2Z4qca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779459525; c=relaxed/simple;
	bh=rKk5kOKOEdac4MZDYNoEU/rAZHIAOQAi0IZqIe6ALQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VR7Ctf0SLVwXaXc2EY/QzTKTsBHoAWPONMQwQLVZY++hwN17sTwIgyFQW818SXAt37q8DzsHfh2pj23BDuWJRCxvYo2adBxsD5pKUweLstUc0VCFRH3PmUu7WpWi9PB7OWBcDC+EwmPcrz56cEHDQW+Ty3yn+sTgM1UiGjyDrFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lC/qTYdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeXBEt02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lC/qTYdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeXBEt02"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIqbS1800960
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WyDl8BgAmZhuooaEQjQQKYRZ
	WgOcTk7HRhEVqKAFQSI=; b=lC/qTYdH8wki0e42+wogfuum9zXKCwai2CHMwcKw
	PJ+cH5tx1IwjNH8N0iw1HEX8AlA+0Nu9wGx5TCFKI544nCNM+Mr/jn9XxWhbuY2G
	SnyYUN2NHc3yXEkaVmG1T/LV7Iv/6rafb9c6Q8gcbB5ARKkKC89Aw8mFfhYgQJiZ
	maCfjHbu/4k76yapW2UbxDr3awRSrYdIDxMk6g8UN4FvRt6EpuclhdzT4YyYjTqx
	zLGh7YX5US3MgII4n3K60mM2dOiOqdYZjJKY02pKLFy+/AqkadlPKkIMwZvVpt4O
	/CDmcNLt6gzxE7HKNMUsxWTMxT27C1pfnadWFMVeqUI9yg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0tq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:18:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d1fd7dce7so2789281241.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779459514; x=1780064314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=LeXBEt02HZSYEe7i2x+zIUub+62caNQExGmDpEA60faVSpgKUx15ZKLhcwaF9Z077u
         Xi2adR/8wqxN46ZffvNvyLfzddmAM/jnSChT1R3lbf3Smu3Rr0C5HteBQJgsNtBYZhWe
         LjyQXpKzU+0Ty3RM0aaGeNTES87Byvn+KA7oKmfNOPzIAsjTlshNeq6G86OCYRNGsX+/
         1G7EK6kP+M4CkT9a83HP9HxnNifEE4aGPXgC3jfGRXTtvyMQ+unDEfOaW91dseLNHWnV
         3TLfjRkwW7SCs7Nu0bjtxf7Po5HLGI8GTZOdgRSEEKnvqMsYK8Hb0U1VSe5wTl8CN7mZ
         XW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459514; x=1780064314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WyDl8BgAmZhuooaEQjQQKYRZWgOcTk7HRhEVqKAFQSI=;
        b=dt5YsB+bLmXdI+Hekga+h+/6xpqukurqX5DTHeK2BytJI1Wkv02PbTICsojDpZr+VZ
         +g2Ra/aQw5BK0haX0z2J/pb5Zg8sJPT4bQe7tkhHKAbetZLraqVxfOdWZ6L0mMWNMjYu
         CXqqXOm8PvwsRMhkg3v3b6ktbOaJyoKoYJdDTFqmWXZJOFv1ooQ7P8WKkUiS0R8jjJfO
         0R9L3FMXNXGpEodpgk7CX8leC9EjFmxFKy2uctV2udQN4mcraeXCj8OraCDl+wnakphr
         mTwS2Yu2nas1t5Wkmq2hWWWkSiuBlhVBwSzmtwVzKvFKxMnMZE/zDYET7/B4Gkfbn6vm
         0ENQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NEqhEuswGdEGoNpZn2P070Cy/2QclO9q6WKf6Ad2vSzZ66qBIAzaYdmPz+I6pjJ0LxBg2EOua1mXh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcq5jFk8LsZbBovGJOfMibVuSEiayDhGh1Bj7X31HfmHEjgNIM
	A89qsBi+/oruLE9ZC4cSJo+Rg4n+Nsa+j8nDLanjVD13gexVWfCIJXVWDkRzasVq3rZZEefmsdc
	rRqty3ps92wnyxs7P52Af5C99zSA1NNqNBQ6kLy9ExnBsthTbV25RYMhUL3INnKOw
X-Gm-Gg: Acq92OGuPytrto6N3ww53i/JOFFRadsx0M6wrfYYjcgvIM9tyDV8owLDlTN1cHwr8l6
	yg8s1q2K4wZNTXpk8VJCoszPcCCJ9At646gDDdWy2PK7S9uZlsu46ZO6XAZYTkc4W2fDChiHjIW
	SKsAxpHHvYeo0chDVknLT8YX622SZzYoyEDN8ns/ZaCOTWXOfh/F5Yg04YQhHLYywFut8eP7sQT
	CgmX4bqtlZK0xrwwTYXdvY3p6aY8zBJzvLpKPA4X0A86HwVAcL8aV4zBVumj5KG2ID4lzRT28yS
	WVM6vlLSZKt1m3MXusgbjQB44lbGPElSQf0+304Zr77/Quc8gK+zH2u3yoD8+txtokU88EUQtCd
	rEa/5wRLVAHUjNPEawqjkEDUfRg0e2vENP6zO7jB7v/Px8nSEWRkF6Nt3viTsTIoe9OGPzFSX3w
	E7bMJxlHMPn3Fwt/+vHzQ8HJYqR4o10Mir7f8=
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838989137.15.1779459514020;
        Fri, 22 May 2026 07:18:34 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa4:b0:634:16ce:aa3b with SMTP id ada2fe7eead31-67c7d976b13mr1838915137.15.1779459513473;
        Fri, 22 May 2026 07:18:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca031d5sm3900271fa.9.2026.05.22.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:18:32 -0700 (PDT)
Date: Fri, 22 May 2026 17:18:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc support
Message-ID: <zirwveacipcy2wamaqntykkwhhdirw5ln35qkqs7aqrv7v4evl@qyk2tygwrbdu>
References: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
 <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
 <g5wv5mi25l7jyq3vbe3dovriyxguw22m5uvyslkbjbyprbxfnq@kep4x3kxeqmj>
 <fd67b063-a986-4d34-99e6-fe55e72d0187@oss.qualcomm.com>
 <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db13f51a-98d5-4793-9c7d-3edccc3a603c@oss.qualcomm.com>
X-Proofpoint-GUID: FyfqsB-wp7-s4pgI-zP5k-mn7NcjpT82
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a1065bb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jH77VO39CjRCDWMup1EA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: FyfqsB-wp7-s4pgI-zP5k-mn7NcjpT82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0MiBTYWx0ZWRfXy4RTOzuJjCt6
 KDxY0uIqN4zBKH0HNf88No0Z9BTHyAD1G1cTZCBXteYMyDFUBXZh4I+HOcjn7STCeHOaNuCnRf+
 nOBCECqpHvIU+Qk3zr8Y9SM2+FlUEHia4q3Kmf3BRSMYYsibZfc5xulwTidopMqdZLsiYJwrDWL
 537ZOEScbX2FMWeFQ68WsI6eJ2fGT8Fq3nvlbZILEnC3HhcBWIC+5tbD2ipfDM/fcb7HTI+quIP
 GsLepSiQ3YdKav+4kyutpLU+olZdTscGIOHcPHnNbjQpZPrX73/SkCAlJSL/90TxiirQNZkUIIM
 Tc5+0sunMd7LqcAw/01VnAkFoOD4wnQZ+Jz/FhCOuhJWV+IDJiXfv+MdCXWvGhZfa8PuQE+gKF6
 WX+Y92dV4M4dKerrXmGZlEj2BhX4OyLM6JtxN/2UPqo9SlbPa64neSOrIK80R2KC0Ugw0dDqhu2
 Q/xORb/oFySASkd09Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220142

On Fri, May 22, 2026 at 02:13:08PM +0200, Konrad Dybcio wrote:
> On 5/19/26 5:03 PM, Komal Bajaj wrote:
> > On 5/14/2026 12:48 AM, Dmitry Baryshkov wrote:
> >> On Thu, May 14, 2026 at 12:17:31AM +0530, Komal Bajaj wrote:
> >>> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>>
> >>> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> >>> for the Qualcomm Shikra SoC.
> >>>
> >>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> >>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> >>> ---
> 
> [...]
> 
> > Ack, I'll address it in next revision.
> > 
> >> point you can use sc8180x_mpss_resource instead.
> > 
> > minidump_id is required for Shikra. (decrypt_shutdown is not applicable and will be removed in the next revision.)
> > For minidump_id, we still need to use shikra_mpss_resource instead of sc8180x_mpss_resource. <?>
> 
> Is there a chance the same ID would be applicable to 8180 as well,
> just that we missed it in the past?

Do we know, which platforms were the first to support minidump at all?

> 
> Konrad

-- 
With best wishes
Dmitry
