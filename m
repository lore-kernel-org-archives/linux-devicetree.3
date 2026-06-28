Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C7B2765D7
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782687235; cv=none; b=UxiUiSZ84mPGhjwtGEoNc7OSwO5e3DFtGG+GeFC4N+iaSOivm1v2SKr7alhac3NbtQqpDcGmM/5Wc94JVoDYQf7s6qeW7J1nnrS4gmPg8XrZ99n5mOcTKXznswpnDdCIWw47hfMWQsI8ByWun9Jms2T9rp2JQ9nKO5bTdN43mMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782687235; c=relaxed/simple;
	bh=OX264gNLBq3yKdzWgzCkw26t0180hmvjKHJeD5hHvOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCxTBMYNqWjOtph5aiEcIT1+A5ID5I7G1zJduEfk8dxzQ7QXIiBxFG+GvQDB/boV040N+FD9J4m8bNgvto6ha2eRAKpdljSWRe+vKNICrtgPFo9o+Nz1GebnMr+TTiL391eRe6L+ONu4pUdCxOqnvMR6oHQexkuyCjKvmUClE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgyRgftV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNzHTxdh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgyRgftV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNzHTxdh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SMA27U994036
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBiYvBC1dJo0dJZFGs5nOgph
	H0zzbBFmjSIO8xEAr8w=; b=OgyRgftVx1LaUcLi7CbJ7X+EZmlttu6Nb5pxO3lb
	bJxsyhC9uxJQ04+QS2kRlpajNDb9m4gH0QjapQJdq2qE6nVwiOB6X0zNtRXWlzma
	vWBJ0+4UJsdlNq9A0a3q/R4DnN9sdF9OTspNoY+YILH/qzGxJ00Asq+jHUwNg0wU
	A8h1FMaS4ZLgpg46LK8NIe5XrA5WME7QOg+ojudFi67tCYWtxW4LeLc4714YbGq0
	mnm4n6UGdIim4r7n11O2Pp4ewPyScXWYY7zA0BUMHc8egGF2VeNj5W48pJ6K0C1N
	QcsyKoyri5JcB30vf4R2Ar6b3SbXVXuDOOV+lwQfu2Cu5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u73tq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:53:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b2ccd7971so473215985a.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782687232; x=1783292032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=BNzHTxdhFaICpEUtzVLo7BHWblAL2vejzzmoEkah9mmWT4BWUEICxUErK3aeTUFq/k
         zsTfKamMTPldN6jkxIpi8uNYzbZXVnUW6BJZdFnqEJs4IZQhffs9r6mdkYQp1wg2mW2D
         uyTB6/S4Kk8OG58rbBEcFsdxVsfDtYPgX2AmKxTLPWPqZfhX3fx9cAwkyLIkQlyLob6y
         JAebwhfq7Dh1aCcMrS44MgkoMI+V9TXqFUS5PLwmi5iN0kbOWrrIE0kUynLdktaUP+/q
         RYGWf5xAPMgxJcQUi6I3upfpmCSW8w3k5SZqYUcannCDtfZ0iLzhhf6HrxNNaJ8J7wDS
         0JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782687232; x=1783292032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBiYvBC1dJo0dJZFGs5nOgphH0zzbBFmjSIO8xEAr8w=;
        b=EkcOLLbEISS3ZxP34pSRYwa+Xw92EvQkX5T4IyisGg3s1E4QRR2GGDvU+/VtArocnq
         UsJ5zNEyTTBnGsnYHBbLzFNmLTP68dkz1uxhTWlcYdcFVV519dBq/HOXGNe1ox7aurEa
         re3RdBLtSa1uoZlXIIwc27gyiHMymnikcN6rHKYFapGmVhpsdW8Q6qU/Blrs/8Imcgj2
         swlxszIVJnZUo2K3FW5Im0EOCfta2DdvbKGFvSlQKtxxQidD2EvZMfLHzGt5BuSfwmF0
         TUQxBOMpY9w6fJU85aDw1oQaE3vuqtlCP/vPIvFNhI8kj7C3KTXytoF1mAuOycHjNbR4
         BZTA==
X-Forwarded-Encrypted: i=1; AFNElJ/LvNvbL7PFRIsO31x8I+ktg12CUW0L4H0QEv+PSwVoSWlMUz8ivWvVda822sHWF+GV2J92mICVBu3T@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1lZzQqMjyEsPjIUQXMjefk5tK+v+T/6NkY/rvFh03DVCe17Px
	vMU2ukjVKW4rUggoDFuJado1L8UPOJgozyepe2y63dET1urETTydE1vZJApIhzzBaD7z5t4As8L
	iLBkEkK1WgozioYcdyjG6XDxBUWobOYAAQE5/PPLhIZhbMJamiQNFAehohM9bXzDT
X-Gm-Gg: AfdE7cnk6iJTM00DBOkb3fSgbYl9JVE17jSRE6VX/2DaA/rFUZr3iHWxXOgwQwXgaoA
	/SN9lo81LQXV54J91nxwv5V7cKhTb3wdtnquu7+uACZ/GYImSaUva01q+ZNtkMN4uB30kaXTUh5
	m6qjA028vrihVZD+zJ2UYTN4wvb3nxkCRpv5PQKcVmCQQbXyOL5lpISDykheXOvNHv8JYk59+Sy
	GGMls21pJXygfsYJnaw913l4+XWZGWvEE0sc/CaveZmsY2AuJoucVo5X+USYadbcfiJMo6b0SRh
	y/hkl1izbgmFYHOfQKrtvu/8sj2tjIgREZ/qTP1Pdv2mYaT7+VT+oREylAwPBs0/e4ZS1H7D1dV
	+8sF4mGUPCcPFG9c5rBMxtdX1JCeJBwBheinbBBW4Cd9ViypOXmRaFXnApUd668p0EvwiFZ1V6K
	Z9DmAUhcA7GXyWEplCsZ3RTwkA
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003115085a.2.1782687232123;
        Sun, 28 Jun 2026 15:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92c:3086:6d50 with SMTP id af79cd13be357-92c308679b7mr1003112185a.2.1782687231656;
        Sun, 28 Jun 2026 15:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b134fb1f7sm360941fa.5.2026.06.28.15.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:53:49 -0700 (PDT)
Date: Mon, 29 Jun 2026 01:53:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
Message-ID: <2e7wfaejgbapxhmlxqne4rtxzcuyhijxns5su2kcr6k2do4c7l@3zdmkrtik4iy>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-shikra-gpu-v3-7-9b28a3b167e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX0itQYoeFgW9U
 ARhFMoGxVk0iubWnoUDsjbXwZLkJ0UwSCP2r4+y9Mxuu91Qstu8KL+mTHz5FdB55GoBkrU3Jmvq
 9UObXr/y4I3LW6wTnXuj6ux+pr/boio=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a41a600 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mfaq52WTUvP8OxZ6FkUTHjUrMTwRzIJF
X-Proofpoint-ORIG-GUID: mfaq52WTUvP8OxZ6FkUTHjUrMTwRzIJF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDIwNyBTYWx0ZWRfX1Rotd2igyAJI
 m2ah68sg1abWe128Nue6I/l9yYchnduOH/FbeE16JbUUHp3KgoGoeFap/yblcMdYM5CY6s4fhA0
 3aqEIWgWYu5M/30TGeke3xPpnzb2cO1waPwRPOXpdni0pMcvasVcWViaMBUKw/TmwSot+pX158q
 5/XmgHfp2FxzwsrtUlUeNkq9p9SGaFPYqzTOeeEoVmWuX2aNR+Fj/hR4PQZ2ts+wragUkVfGent
 1wcJUPrShlrsUAuEDw4bEuK7b8A7M0ZssO22yC2wafgh5MXu1XDGCUA4V8UNhS4jNWvGCJQ3R7x
 4drSdo8U2HKgWF61hybhZjv+beH9BqdgGqKxXz4q/a1DlfpwKvmUZDact913FdsEOg9NnTASmto
 4IhRkIcq1rH21wsngT+sfGu86ccReB/Kz+zu+0IDwq8rafgONxtO7qaSqwjc2ciyBBVuKZDpMD7
 amYTCcDyslMXT1Lo1ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280207

On Sun, Jun 28, 2026 at 11:54:00PM +0530, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQS EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
