Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42839363081
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 06:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182074; cv=none; b=FgLxZDOI//q1JglpyR3JpRpaQ5r7hYHarjAsSP75WA0UVXS0Ro1wdXb8MMXMnWtHfssXK0rPqE6Xs88vFHB2VPxLAt5TtfAsOckLDEls/i+9LXPRtn6xgs2bnCqzMfA4pbYuJPfhmKvwoKtwrs6MWRXqrsrrH44onTNX7aMl6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182074; c=relaxed/simple;
	bh=Aq40os1hExCvC1MAKwXlkNhOD00JAVKrB5sdw+Gp5Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtkN+X4ERtqXjG9soHwW3EsnGMknyB7Wgrq+C6b2wx/GTumvZdG3RNGMZ5I7V2dcKH5BToT8cagzJkJ071rc472QrUHGVPDr891Gy6rBdEOSPQvkgogO/9zkfgekJ0f8Xp3oM4KGBa8HCjeW0MesXSfy+BDXii/59ueIVZy2Eqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPwlFgnF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bjpWSQm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPwlFgnF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bjpWSQm6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510X5r093925
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 06:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n0T0IOWboKdZzgixZTEBycGe
	F7SAtlri90r5Da2YU1E=; b=BPwlFgnFC/fFgks+dPqwYJ6/Z18qCk0hOVn6FenQ
	OwabMH+ND1jxkfi4ryL1eHaGQg8Y2RB9uqmXtrkUW0BqVEe5hSp3MIo1anEAxMfG
	TX1yLBR6wi7Q6VCJgUOKQGZpIs5bJiYp6XLcUbVkZybhJCrc7lxi649nvUjjye2c
	lG3vriQHSnsnbs6IxJm5RQtgygMdtOabx1Ra4oZHmaJlxHCwwgYfiWEphA2p6UQO
	RMaazbwkIOeXM7AZxVdliK394YpaKgrt+IlU4yHd/anNqV1sZnsdur0l+1qRww1V
	/askKGtpyyezdftFCjigoUB7d/BLosUVXopwIkjOXGDjKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu4qr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 06:34:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so305197985a.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 23:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182060; x=1791786860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=bjpWSQm6XMV+1yM2ORPOpQdbA78q4232vTwuM5DIQIMD/U/mXupV3+4v7eNRSkhjyI
         0Ko/9pPDfTytrqTZJAurEKhFEfFvN7HGsyf3JpxM0jJgz0bs46thGMkITct7udlCr2r3
         HTJevNNewmnKM5XjGYpPMOyWfv9Kwsufe6c90RAxxnvuGJNiJjCSIvg2Vdx9obPMsjTM
         sUBGuiYRWBBHFIAJaHEZcBaw1mXBNNcv2KdPgfR9gyAtkJ4YDtWwfySV0VsSC0Qi+7jn
         q5sExUfMmV9KFwaoAtmNo4QIcP7pF3BK3y4c+13isIvKuS9xO9n+BQyosjYfLc1rqjq+
         fmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182060; x=1791786860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0T0IOWboKdZzgixZTEBycGeF7SAtlri90r5Da2YU1E=;
        b=hiDZB7qzxxvMmMIRVSTaUZAQc9iLxneCXu6/NTtDD2wtL+TaC+axmE8xIH08RttINa
         UVPJIzyDLU+js2VpayUlLZY5TogdigS+Ex+8To0jnWoFqPpPXfZuhBVSNB4z5CnOVD+H
         KwEeYNr31iqeKfOckKvQTqyd2xoMi4PnJefD3Np+4wkoxloZURzdRvSIIiInurPyUu9G
         3xYRKgD+uoi1lX/bgH5WwR+tMVM1h2IoVs3cS0WwczKF2r5UcbKFrldvO0nxajhjAQu/
         JMXvNoZOXElS3EahuH85HTDq0K1wJoe9FjISZfenOk5CtZelzFImtgmyzCSAAiqkTLCY
         5qLA==
X-Forwarded-Encrypted: i=1; AKwUvBy0zDlesdD2PIRO7R86uMSmLVb5NMd1yU1eDebVm/SkQjhgBe00a6hWXRGtzy5At7SMhFnufFM9i8h5@vger.kernel.org
X-Gm-Message-State: AFuF++ljoe9ewbkjG+1xpPIgEGO0FKUw2t6oghl5xC3h56UL08kgtcXN
	xJ/KTPqFlfaundDrOXloPoD45vEx4khr9q5i1nH4rxnnJqPq14b2sU+9NXfPcpPLDv3aqJWUvvJ
	DsXNBPoXYjLhxClYUvyl3Rhd+J6rb4CaKnVy+VhwnYQaM2Da7L7hJcamkgh+RX+AD
X-Gm-Gg: AYBFou1LB3lyjczUiBg1FGDVeUWkU3VRIx5fBErXeqxyBJAmG4MFfxUzllmS0EffUuh
	tNqm4MbHHqs4nQHBOZDkulKfzFT+rBpkjqIK6nC/E4kggbJ+hCxP+olZVwT5bf09lwSRY7o2ATv
	7rdldpCrhtad9ed3lUI6PHz9o4zlCIf7HEhxftdihUVWk/3uxJWantBdkzvqnJHf5rY5lwsxKjK
	2DWGitE76SXXusLZTgprFXYynhXeShhsT5tIQrNt9aPFacqozx2uk88B6iZI0qpmrxgmpVz3AZ5
	Xi3h7jmi+W8LV5hfkkR6zvmGwzHgewYzkw/ty+8Z5nqtrJDSgwcFwjAGemwqyGHcQXOT/X2gr4H
	SAjyfHl7aGf7qjmPojR5q+piZcWmqxz1UPzb810HJGQocancRzV8x+81tmdGlLMbXLmeUGlq+0x
	Eo4eTk6HEQh7DT
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638677985a.52.1791182060407;
        Sun, 04 Oct 2026 23:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:93c:5951:38e9 with SMTP id af79cd13be357-93cf17937demr1638674985a.52.1791182059963;
        Sun, 04 Oct 2026 23:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c79da2bsm2924985e87.48.2026.10.04.23.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:34:18 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:34:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <w4vltai3lbzu3dq4w27jjotlu5nobc6vfnuxoo47g6mrkhr5ta@tmmd4ug4gzyv>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfX0CepHEuO/SwC
 8FEMnG2ORkECDEYQ/aOhKtvuvCJVe8TPJfskVQzgCmdPEPl3V4PitBvvdbg52xyrWuNoeNXt4ie
 9Df5IixVQU7oPQGLaq4iTJmDgw8uXsUMhbGrJh+SQ2l8pawqqp/o0OfuvB4cCuIirjbbsX1xh1Z
 a2m+eShwfxeaM577MfFax1De8A0OT9PlGLLkDhpuamW+x2UdJyCgFYSAfWaURnxXXgPnWzJOYwH
 cuZ8rFpGeq66GG2uZiHmboaQcWITQK97Aqzkd6Q4LnHovgmLkZCejlXGkEIKfRtJmGo1ZmXjZyk
 X1//EF/SZ6+bvEL0nQ+nJmnhJNxT4U0Mq4hP8gwBEZ/kWUuDvpRcG1dyBHmp/K4INZDpH/GvomX
 oCebyb90ISyKhQr98uie/BiY3XHqZ909/WCHRmAOsSmn7vLAKcfpdPPDImjLOGV5XWwqMvMsPhP
 5RhmQRPSuzZ2fT1ngtw==
X-Proofpoint-ORIG-GUID: BR5PmwJVHHzIriWUmyt7Mqlu0_BIGdvP
X-Proofpoint-GUID: BR5PmwJVHHzIriWUmyt7Mqlu0_BIGdvP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNSBTYWx0ZWRfX4EDctmOYNFWd
 SOzHgalUy14zAhf/2afXtTyOko9SYpk5I75PW5JEWzoDyo5fUpF9PGALjeRWbAzATVdnjiwVED5
 6cEHBphsUQN2zcO4TH9tuuTzoNpQkCQ=
X-Authority-Analysis: v=2.4 cv=XPSl2ghE c=1 sm=1 tr=0 ts=6ac344ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wyx5Qp5Zs_5CJwpGNdEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050025

On Mon, Sep 07, 2026 at 12:03:53PM +0530, Shashank Maurya wrote:
> Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> I2C8.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
> 
> +
> +	reg_backlight: reg_backlight@45 {

Can there be an underscrore in the DT node name? No. Is reg_backlight a
generic name? No.

Use regulator@45

> +		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
> +		reg = <0x45>;
> +
> +		vcc-supply = <&reg_dsi_touch>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#pwm-cells = <3>;
> +	};
> +};
> +

-- 
With best wishes
Dmitry
