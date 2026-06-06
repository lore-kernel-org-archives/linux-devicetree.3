Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8A378D8D
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780748254; cv=none; b=kwBtiFTlKBA4VyNP6CrhLCEmhtnHVIffIKMIk1v+ThNtHjCMO2afu1xgaP3FoXMbkF0LaVvGkQf3R1BmOVXq0tNA1rgtfjn2s+htJrtUbo0sKWO6nVSUIMjgQC6kNNGZ1e4AnIqOfr5v1Iqy1NWQRqTezZC1vOZ7gRDdn30FlRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780748254; c=relaxed/simple;
	bh=cb0vdcAh9cY3J15mE5rLya7MP8jlTCeWMKnX8CcOiwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af0SSVk2bTAxVYBEIk+Tw3uJLoHOae3OsZ6CxfTWrj9f4FkUFvdpDVNT19JV4PAhJefI1xXdTLeCjwUiz1tcE2KJx0fPmS2U3HA086jMFs0bIJQdGKOvODQ0zEhBaujGdkONmHNRu2EjS58aoLSzigArBmKOtbvtddLCNuQ++lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpo9IbW2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHf7qg+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpo9IbW2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHf7qg+c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BHTuA1251010
	for <devicetree@vger.kernel.org>; Sat, 6 Jun 2026 12:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgZvs8ItyoeNzwdrSoQaw7NU
	3tYQCqRT79Wusa/gol8=; b=Wpo9IbW2U2wCrMvLt6Xez0VLv8ki56i9WVHlQUZp
	bZooegCRoCJXy5IX18MVaTLrte5oIcfWoS9qaiLiVqEtwTVNKDPGdej+SKmX/FX7
	dwnxOh5eNKpI0M9t1AcExvxaLEvhZWxOhSJ/zTKsdACXfTr93T7SGknbAcrFXCtB
	lKYI1aL6epM8UXzLhlH33hc3OpiMVEi8I9hSx4Jnr0pbzE8DnpM0ZFmd+8z/YXMc
	KwugfXljpdaQToMRX/9XQaQvO+mAONFvpj0RsabkdtlEOQEsdcg0sEBYRh+fHP5m
	NM2dnniTrJIJrMK2054lywh6lRSYo7JSXRXJ83ZpyP5scQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf17bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 12:17:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7e5ac77so1354422241.2
        for <devicetree@vger.kernel.org>; Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780748251; x=1781353051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=WHf7qg+chO4cnz7JdOqBulYGaq+PWu78ZoUC5rx2dVpnlRHQdEnt4ngEPmSkf9hY1/
         DOGiEtFwCyOYk/SMjRjMkw3AsAOUBq1KV1aukaYaa+tABbU+1sScrdgMIyR0tYXyBDHJ
         2MHYQUYC6FrkdCxw+skpR10j+cTk05Xgoiy2WMRbysptF+33GNZvF0oajdKmRX564H1V
         pL/eva6Jl7b7hTdvE8Ki89hekAgqtyASm9ct/sEgyN0k3leuzZvtn1BUy5oaDoMzT1NF
         30XD3iSor5Pt7MoeWXdZeiUPDRByDEX3/Acxn8EKrKxrkhkCkA1Iuq+rzCqF/s64263W
         Ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780748251; x=1781353051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgZvs8ItyoeNzwdrSoQaw7NU3tYQCqRT79Wusa/gol8=;
        b=f8QrJtBR7Y2nzGPY4iNh0hfcstv3/a/de2bo+4KCk6oExGCkVz82Prio4fn2jvVdUb
         KsPPhzfIHZWGu2r1dBnmFRSdVBdAnWCbnmqlFTsZajFQ+BXNzF41DaJY/XhfLqJDSJ8M
         2Bk3CGQN00KXbQohbHhfoU/8BuRduu9LZzkSlEQDiLG7Z7V/1maCLpp9zhG/JG7dHX3d
         tLRChTHVUcbr3CnrdYtl5zzzu6JdeJrWYeUKxKVRMNmC+gaxbPVHgt797qFE8r7Sfrlj
         QFcHo1W1HOkmnzUEuTbincFxpXOrkGcka9gjomEe52T6grflEocnM0UinXZuUgSr6AXC
         2eOg==
X-Forwarded-Encrypted: i=1; AFNElJ+PPotksQPaej4+xEDOTxu4TagiiaxWoxTVACuRVQE4HQUe7AoF56zLJWMk1QPUNcnVp/syFcRoJRnJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2V7LAHHjOEEGIlyEQq8/UCRugIxTBOaQtxnUqQBgOllMeMdAb
	B0n1nlhF+da+WIC6gPn3AVEHqnqvUN6XLsEH6jNF3I0IPvp8KofvNkwqvC77rR1HSHIMglEc+K0
	7xjsVMCuOJgf2Rx4w91kpp4fk4LOzvUmZ32aMymbSmna8dB+5tbsSV3HqqX3QlL6r
X-Gm-Gg: Acq92OHHs1cBnbPwbW9o5EX/eo/fEsxmRBGuD35oYb/p6QBvN8hFDwl56RXIi1Kpe9+
	R6I6GNVkO3Qor2/n4JP5CloSH8grQNPgLdHTtnkpXjjCp2czc6jjWX0nF5Tmw7STMlljsjuRB9V
	xCGmAux15f1+agZRYJJuxfKediuDC9hTPCx1RHDJR4J601QqkDRvjqW+62FkWlTHzq77sXxC36m
	6rDzvTNCxES1cHrBvX0E2XcC7WcrlmXIpwVhDxf1X6WmYFBTx4gpKGzlJZt0odHWNdsjzMLl6Pe
	gwsjJXzmdPATaO6jpZ0xS1pCyEQC8lBO2PNxJZtBS83my5sMyzObnTDHi1hvCNNUfZFyWEIwiwr
	tO8rQVnSlrYJoH6aISEX5GlhtRY2AfIHYQp1xuuZQg8GJvrgfUVDrlREgTm7Icv9lTaayqQcci7
	5PHpMbGX/kcvz9d6QD0NXEf+mVFzjSuTa6ff6Hwm9HDkwlww==
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403159137.1.1780748251235;
        Sat, 06 Jun 2026 05:17:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4411:b0:5f7:240f:bbee with SMTP id ada2fe7eead31-6feef48d3c8mr3403141137.1.1780748250808;
        Sat, 06 Jun 2026 05:17:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed56fsm30934311fa.37.2026.06.06.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:17:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:17:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <aiQP1wpq1MAlsttR@umbar.lan>
References: <20260605-shikra-display-v3-0-9846ba5fe635@oss.qualcomm.com>
 <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-display-v3-2-9846ba5fe635@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a240fdb cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: D-bLT_3qgqIIsZHrjFrRf6688imNtG5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEyMiBTYWx0ZWRfX0TpjOGCFd0hL
 fqX1e2A9+EYV1KrWHAOwac+zEuUcc+QL2sfhKmSvoM0x5msPLuNvOMUTEbkwdFp2wy/pBfXeZfK
 dIewddZbGtbuxeaCHzrM7xWFrZoLmZGAw67uIfHsvxajiUreUSiBgL51mnXvzIztgXgEqwTCoqV
 742ay+hcw7OPIMRjqwQP3VEGCx57XlRiFxT3gnEkUVLxoGMQ51WXloLd2jYK/whBk/57DaMhOjd
 vOHW+6fLkk197iElCyu4oDvoJd9+iSRws6hnyGakOcXF4hCaNHVgYi1O1o8BoX1EZXKkeoFNY3k
 xZWKVUaqlFVaEOTTy5R+G02YiCTXj5Ac7cLjo5jFa6lC31zgUKwmcC/WU1mhfRyX2KDH34bcPfR
 lShfycXt644czm/dw71fq1LBGZeKgB3+Pw7wjcIsyFOaikUHhonJ+B5PMbc9HjiBVbycnvpZwZ4
 uUNRzjmIQ62VmcGfQ9A==
X-Proofpoint-GUID: D-bLT_3qgqIIsZHrjFrRf6688imNtG5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060122

On Fri, Jun 05, 2026 at 03:48:52PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Okay, you are really not reading any feedback. This patch doesn't belong
here. Move it to the series adding the actual DT with the panel.

-- 
With best wishes
Dmitry
