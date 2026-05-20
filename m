Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0433EF648
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289726; cv=none; b=YI6AHhbm21PSREDhu17xejQY+uJp9GUBy6XbU6o5hW3MHlirydzmviKCQyB3YeZgBKLvSdJiSavUnr8RK0xpWNxRIgSuM9mwyyOnq43vyIfG3rAME8Di1vQ2CYscWGR6+/KC3zsTZrFp3VY5YAtpUWvKO23y+ws7YIT/hN2u18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289726; c=relaxed/simple;
	bh=f8PxnRrttPcfg9STSBvnbNWK5Gua5P3qasJH5h7Edwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jW6+WiEkhTRUTX04yQicEMA8YvGoam+c5dGt5iA+/VpB9jmAivwFuMzRtkDrtWSHOg7zPFt4gjuZ3Uz4bNlTm88sm4nHEYx286UVgX9MZVbqHuB6qyY49Xd+eT0SsdYEzDFIw3i9O0N4q/hgBaLAEQn55Yoc3yvSGkipG7jcLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgHHbe5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Le6ax04o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgHHbe5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Le6ax04o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZWq63084995
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h6QXXg4PTNAXr6Wnvwzj5ovp
	8hOpuwWi5pP4tDUYudw=; b=KgHHbe5zSmPPLXQKNMF3VZc1lv/QPNS4gkGVrOaF
	bBurasaBTZHkN40Io2t4sEUNOxDRe7AGmFM23INJmym2clJIzRcIuzCuwlpn+AFF
	7aWwY+oEnRuXnCQknchRzcmzFmt1RIUYG7/ymHh2B1B78KSp6xwuOhTEzsVdLs7u
	8zIH5+HpREVfJFY3J6vHfcCVKSqr8Tp4g6L+r3ItrJZEzUnHNkUAMosLLL8Fs6pG
	cAT1VaU+LzupdA7zyL9skwBwpHn72ym03b1ObmHpUWZjmETKaaIS4Dk8vLn5JP0W
	9Zfi7PS/F6wLF+9uAq8Kw2QHJ6/LfjqqhXC30GrR1MiZhQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f0tf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:08:43 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dcda4880efso7534507a34.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779289723; x=1779894523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h6QXXg4PTNAXr6Wnvwzj5ovp8hOpuwWi5pP4tDUYudw=;
        b=Le6ax04o+F17nK6XBCAeEJ86Hv+ppDaGwDrjTeOE8e08k3YAc6yXU1m6xUyZtrx0NJ
         qKYm+RCnPpS/6qKo9hpwnwBgkx3hOfjSael2t+3ydR8wuluurtoS/UZ5VUbHiccGwj5Y
         phORQuXFGNt23S6U9DmowFDSewNcfF0ZXbRx7CcqR/zHJKa+OI1cC1KnJ1sV+UrbWq2r
         Ji/BeipXAiJOjqDNYn8zKgD7Tj5+ZPEiPChZFxG0/wo4eC7vyKWMREBCJ7CHiO7ajx3J
         KdDoo14FZbkfJswmjLVi1qTpMsHk/lUzhV6wv4bUaBPUzOEZAD1D3bN7qX6788pG5umJ
         FItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289723; x=1779894523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6QXXg4PTNAXr6Wnvwzj5ovp8hOpuwWi5pP4tDUYudw=;
        b=CtMNIlPwF+vuxefqTH9C0LRn4ITjX1mw5jUbfUhudQsjw9BIVCCkYsKSIeOBbgYDt0
         rr+xC7KLQXeDvAtCBzGqVcTYHzogpDu7CV05a6nVvJcVLH1yaThtRih2HH5xxB5msyWv
         xQ29Em0t3ta1s2Dmok7teAhs/sPJKYwO3HyYEDXzyAA6OG8WYJsc0qwIrdP+WedfpxER
         q7Xe9qG937j8vcjzG6kBYq8Kdt3XSMnY/3MgzD0Axa+MqFprc+XQCAGJq81QLOGFW/Rt
         I6EuDTeMi6BbU2SXpJvj5+IvG3capobgANhzrZKhITvkZARNAWsmW4/fg9/Dkc1Ng0X5
         tqDw==
X-Forwarded-Encrypted: i=1; AFNElJ8gmoJTnL2v/Ekf2HPIHnESb9G+oz5japdys2MON9zoIHOmmR7gUWh9eQ+DnrJXDVXac6CCdHT74WBs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx29767d35USKLuROtSIbbM4jIncZZgqjJUq7nJTeGjgT4gU2R
	/1v6fb4ZQ+/hTGn8sfF1BGYFLUEajrdxsw9z8JUD6F3mjWBlml1CmFYBxRFsyx7IdQU3O0vOx09
	rExBXNhKY8fDP4ZWJ6wjVQ4jfMqBebFwhrWLBgPwRI8wWV20rLqDGDeVG12BDnC4FSpCyS2N3
X-Gm-Gg: Acq92OEyAP0Nq4N5yd1sObLzBMQ+uRxCAn7KVLHDLQFi7M8TnyeAHRw8xDhiXVt9enH
	T/RdrO6nJHO10DPXgO+tEGV32hOP07oanB6QPONSQO9jN9y8W3nlyLijYIIFmYZlYoSnHSNW+iw
	X9vIxAqhiVI7hra2TCKBu6jO9I7Co5nDV07PvmB5w/C+JjlbRmEQ2RFa0/iWbraUfnObwL5Hav+
	r0n1+yOm8kc2vRd5nnVRI60vL/I4ekP9Xt4D3YpKMenmcYfSxPZFSeUH/IUVFZ8OnbUjV3ywPOu
	Pp5NSgOSj4MhcW84fJNg0xpeImDeyTuTRfm5zpRIyGGmdSTe4Y7YNyrtwyoit3wjoodfccLXYFb
	HiaXne6zJUc3OKHaxmiCPj+pAmn2dKzttNq95p+7u6008XZ6ITcOy08o4dHMqzfE6tPpoBDKDlj
	EXtmKZyWh4cOeDoDIQlmo0VLLs+Vux3gyZ8r7OhYwwikDYZA==
X-Received: by 2002:a05:6830:3806:b0:7d7:51af:4aa1 with SMTP id 46e09a7af769-7e4f2b98b8amr16608292a34.18.1779289722930;
        Wed, 20 May 2026 08:08:42 -0700 (PDT)
X-Received: by 2002:a05:6830:3806:b0:7d7:51af:4aa1 with SMTP id 46e09a7af769-7e4f2b98b8amr16608231a34.18.1779289722347;
        Wed, 20 May 2026 08:08:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588790604sm30119381fa.31.2026.05.20.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:08:41 -0700 (PDT)
Date: Wed, 20 May 2026 18:08:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
Subject: Re: [PATCH v3] arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C
 GPIO expander
Message-ID: <inrjerof4vvqmupc6yuvfezpf5kmhtt5va5pjypwz6mstucb7i@wf3pflq2iqxc>
References: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519064954.2759960-1-anup.kulkarni@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0dce7b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mTtDrMVxCzSrETN2l94A:9 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: LI8hbCH9KMKAf6jy7t-l3r6DFOpvJV6S
X-Proofpoint-ORIG-GUID: LI8hbCH9KMKAf6jy7t-l3r6DFOpvJV6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NyBTYWx0ZWRfXx4qHZg6MCK2q
 HUMMnCezyjkfACjjCNjHKiNYe4Tt5xY/yMoNN+rJhFom/qcZ6ro9l2MsHOC43kP2fIp1AM9ylyJ
 xeCRmODzhyuXNbZAIdyfqnlY60ggYM4kWk1Mp9tHOgyD28HSWUCdeeUjB1jxyUJaoetnBFTFD/o
 15/CGX5BaU3o3lodzjMlmDYh76eM0oDWglYW2FRC7gS8vA8f8U5Q0N32yjWQZKx3ETDgyjfqWDQ
 ztM5T1dwF0RVY1huqATmeRYFRUdmCIXA6zxEVVHcEGA6oLEHEr8DtkOpj2dqGB5/oyOToQzglzM
 JJYnwkqN8jOgmV8Z3chG512WRL9dWXP2U1IBsAEPKOizUaFmnLq9efuVQqJ87STwNMPycs6Wew2
 YqI7oBp4sb9QNU3yW/BWiP6Ki5R3CQ26wNSJwAuHPNKG8hGBB0m+CFU+rFd9UeSFobYSplK2aG8
 I2bGO6P67MNCQjipZyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200147

On Tue, May 19, 2026 at 12:19:54PM +0530, Anup Kulkarni wrote:
> The LeMans EVK board routes the RX lines of CAN controllers 2, 4, and 6
> (part of the RTSS subsystem) through a signal multiplexer controlled by
> GPIO 4 of the I2C GPIO expander at address 0x3b. The remaining CAN
> controllers, out of 8 total on RTSS, are wired directly to their
> transceivers.
> 
> The multiplexer select pin defaults low on reset, disconnecting CAN 2,
> 4, and 6 RX lines from their respective transceivers, which results in
> no data being received on these interfaces.
> 
> Configure GPIO 4 as output-high to assert the mux select line at boot,
> connecting the RX signals of CAN 2, 4, and 6 to their transceivers as
> required by the EVK board wiring.
> 
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
> v1->v2
> - Fixed commit text to include platform name.
> 
> v2->v3
> - Updated commit text.
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
