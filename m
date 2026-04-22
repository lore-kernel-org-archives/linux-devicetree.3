Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5C35E936
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776899568; cv=none; b=Jf8ZfaCCE10GdPIyvbVP8hqNCeQ05w40aVzjVZ6z9gxnMSHlGLvoOx+ixEUzB6TwKy3lFs/AN8iYiEhfyLtLRTs8O2apgnTsiaKrWmCdIDvOUZ7ygxeisAtqyIWAwMp+ITf58NyepurlIxWR6PF6hLACQ//5GlQ+qfL9iclKWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776899568; c=relaxed/simple;
	bh=wqVfJrH4Uhyp67zDnOha+RXPxXsq82YBvUqO5Yv8kck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/GQBcMkVV6U5N0kfL4wgtohMfAKkUb38N+wihwuicao/1qq+uLpiV+9cTFtpKZefInu10Bxk+PhBBg+c3o7tg/JXIJDuTEzlU3U3OPwA/hbUyDdYbPLlQ5Z7leYtlsxm+xzjHd3UH8B1XkMbRYw9RBRQQDaWSkH09UunQrFPGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihVF3q4c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqevJ8nf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihVF3q4c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqevJ8nf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6aB6872752
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ph7u1INcGMhgHK+sGQnUu27B
	CMlXKSM9xv8A9mrsM/E=; b=ihVF3q4c5Z+ycbKZNi/bDOfOILlBnCr7lPdpSaUS
	2h7JPUionDb/PdjPGmSXb3I0zH5BTT+LbhXDuKcgIyikxuythTERR5vwZFM9L7tg
	WoW0ewqf7Dj5sPhpOSMNidunPfyZaU80cGV3B0Mn90did8AQ8cIHI7OENuDMDTJK
	L4mFPaHtYooudIfJcyBUe4BMLm8Hqj1JmueDR4iFfpRH5a/+S/yXFYHxrPe8mVpL
	YtmXcJoWW3Y1q86ejUSgptRThkpY6YB+ysPTz0cWqsp8/C/oEuz/VRjTB4pnL22y
	iMphQqHEON+IYZYUd5Jll9zOZPUu/tGgSbt7oDD6fCw06Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh1c51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 23:12:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso61097051cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776899565; x=1777504365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ph7u1INcGMhgHK+sGQnUu27BCMlXKSM9xv8A9mrsM/E=;
        b=cqevJ8nfanoj7fagqxxUI+oub1IYmhot2zTPZYDEzbS9rxAJb6o9v9RDFk2titkXuo
         oZ5cEWBuQ4oqSD7VvzuZzyqCagzUeeji8qJUaFkmNOb1iBDsVfo3sGigYMi7txhqVPN/
         M1JWi3MIduu0muUvU0E+kYebQj5iFTx60D64VrG7ez1oddI/mwst+W/kN6Q5JI2t1pHU
         UZjlwbISM9iSqTOOW3bDTB2IpE7RhTfoCPvd+XlkCWlUjcoUVpTK5hyUYDX/oOUoNy5k
         mnVVu20GtrKuTrsDy70TGCjnmBgMWTV7C6RvOa/dhvvLSNzv8/Rudf1KxIS2MYA5d/WN
         FHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776899565; x=1777504365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph7u1INcGMhgHK+sGQnUu27BCMlXKSM9xv8A9mrsM/E=;
        b=P4f1/S20HtOpWAESsNVCXqb7YpKId0Jqo2cbuLrQf3Fc3ksbprcgXPZfL6/W5Sk6Xf
         FNjbRE3vPLKzGJqphhH2GQU0aTg504wqWQGMFWBcvdQJ1KmCZFenqNJLP36lswtQkILB
         y/Y3eJwF3Z5rGuLglKd9xp4Z7BLRuFnFwND4IMmVt013wZ40ekAKLwnk43MRxMVLlkaI
         9oxpyAypgE1dhzRd1L0VmbdyhMvbAzqhwm/bud7uR+dq2/UwGpO+h3ACPLUTZKkaA1nQ
         hBgDuSI7UWqr/qbFN669LNZj0sMNH05Ynb+3Q6zJphpIBFuVprKiDuYkadfAhEEBh/ON
         BzCw==
X-Forwarded-Encrypted: i=1; AFNElJ9Vmt2UfhVP/7KWFtKCRdSZ05boLc5GjnNQRge1q0iUX0eMpxHxgmMOO/ZOpaKb7sk4R5aMRtnDeFT6@vger.kernel.org
X-Gm-Message-State: AOJu0YwtBSPIRmPw2vTivjozzCpsfs6JQjADGG2d7HnJ6AceNVOguRF+
	B7yDo3rgPRg+8TW9j1CXL5zfSshC+KfATDKO/vYThj14u5nqjcBcNaBT/LYDfMGAeEIRqbwGi6Z
	gcTPuAHczSkeB/r8VPHlxjBo/YmSCuxEzNj9Gur4HC/MrkZXIH6UbFH+jUX4o4xcL
X-Gm-Gg: AeBDievTG5NinFVJP5GhWFsRcMbuQNICAMd1Jad0yH4YY9RlRvRzVKelJ/tmPOWxbSx
	BZRQzdYDpMWMRs3k5RVubrlht1Xw6ThmQTadO4HifACJwDKLaZ2VjUYD9RPD9Z69BGJei3GggzQ
	ovlGgfrQ4NdYqI31YMeW5ehnr5nC78Wik/T9CXKl+6VVq31dqUWznZvG7h4aTpPU2hLjMK7iKaY
	RFVSzmsDnbVjI5DtmIksdM7xPfa5ux7oBsqwH5MCPKQ3kZ/o2sQx+qQ2MXnbnU8FBbrpWoJAFxy
	SCqI77tyYuF8wNUaOhWVo5Ixj6ZqHY8olKms/lyLgH7QWC/UFlpOfqoGFRl7IYK87QpCtzyUjR+
	wAD5NvUNYmPapJlmWAVmtFnhvZSJRQxb8AMfJU4GIPnuzFoWiURbTtBQvzMSBTdgI4lFHxmALiu
	GGxw24mku3rNLfpxNzvv9E+VG1FeOgQjn/hpsijiXau6Ss/A==
X-Received: by 2002:a05:622a:4618:b0:50e:5a1c:d807 with SMTP id d75a77b69052e-50e5a1cdc7cmr145091751cf.27.1776899565094;
        Wed, 22 Apr 2026 16:12:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4618:b0:50e:5a1c:d807 with SMTP id d75a77b69052e-50e5a1cdc7cmr145091571cf.27.1776899564675;
        Wed, 22 Apr 2026 16:12:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm4795108e87.7.2026.04.22.16.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:12:43 -0700 (PDT)
Date: Thu, 23 Apr 2026 02:12:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jsandom@axon.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
Message-ID: <2ptc5l7iycrglo4sm5nqksnfcaskrjbtp7zf44uyrtpeqm476a@gkep6s57lwa4>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
 <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-rb5gen2-dts-v4-5-b461909c2de8@axon.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDIyNyBTYWx0ZWRfX/a4LPp15hmH0
 B6vP8WrH0PBhWxmawoW3oGafG9oa3U6V2lZTBU72AcAfXNznBfUPD4XI/Spj0ZJpIy2mUORgqFk
 WcEMSwikxK5MZCgM3Pog12Tlo9xydpwzmHqjgS2jJj2dDwWCKhgZsJJcAAky7YXQcN00VMO9vEJ
 SqluPgM/jTHpsYeU8qT5UfAsJmDdlDFZLdRkjP/GzoyXyD+n61XQgFz7ls8WkKtbVQTgPmtXoFz
 Zq/TrZaJksHn0ppC8h0v69bt6H8z0IO1cCrbiFyC575aRRvF9TZPf3HFrsBb8UEQi6iEXWZjYk7
 34+7SUlnKk/g5gJHjEMyMAlXL7QaNzhzRZWIuPimBdckZLqW7TiTy/FxRzrq1fODqr3Ei94j4v3
 f/QH22ox6nbiJEQdr9ADSiz7ozZEYwovD2ePJRVTwBI3yF0FmEpxte1yZyqLP3FNLXIG4Hok/Ew
 MoAZ7dM4WBdhO61IP0A==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e955ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=h77gEMGJAAAA:8
 a=EUspDBNiAAAA:8 a=2a3GcjfFp_zg-3xO9c4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-GUID: VBU7yN6mvUQSr34ILXBoJhDF0Kh0m2v2
X-Proofpoint-ORIG-GUID: VBU7yN6mvUQSr34ILXBoJhDF0Kh0m2v2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220227

On Mon, Apr 20, 2026 at 10:13:17AM +0100, Joe Sandom via B4 Relay wrote:
> From: Joe Sandom <jsandom@axon.com>
> 
> The RB5gen2 is an embedded development platform for the
> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
> 
> This change implements the main board, the vision mezzanine
> will be supported in a follow up patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
