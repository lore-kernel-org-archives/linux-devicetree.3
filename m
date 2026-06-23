Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA71536729D
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214624; cv=none; b=d0MQzpos7HA5vMpQosV7i9m6f3A3ovoWAjzUYhrx+Q+6Hbfk76lJS7Zb1GSrjJPSLIUYtrJKnwKhPmYprGGgzs801SnCyjG07UvBTz94zh1NtWXVxoUQK93Xf+u8Eq4C1ESVqhsEsRMO8LI7RN0D1kYgvEornyRvaxUOsF96zSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214624; c=relaxed/simple;
	bh=aTuVaf0nYfYAWfdJkxo7EvxAlbxCaffxQrDNMK/QZvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2BER96Yd9zAaGVqPVj+vf9/N6cL5DALHQGDfScleQs/DXXex5H/E8KPQUnaO5XCTUiskFnsUh6xh2LBObWYQ6dHH9ISS+4tkjPjOSNeEO63HzuVX245QaKD2GlSyKQUbhAlGSohtC0GppRM8kMk5iajDaD42HHnVbe4YSoHvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OetdD04s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhqI0p0/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OetdD04s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fhqI0p0/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgCQ113419
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=; b=OetdD04sMT8BXOHl
	P0ZfY0xGtL2vRhpknWkdpuLX31ixTvC6kpV0E7VQdx0gj/pE8GCrCnomrMVSoU1+
	L2bCcW3nQ+aUWuIXihofuZXtk6g13KrVR2/2baRhAnB8pdxL1JML37cHNUuDwsL9
	5MVe6YTHbtX2udMawnrW7aZgXiGhpEAyN2hDgmAJLUOFX6tzvK3dZK2DqvRnWAbA
	ndKWhmmmPYlyDqb7nmieAixUTjlWqAOE0oPFv8GUUkOsTpEFyBJ6bbgzJ1gvoniI
	XyL5R7akeITlahYsjQv8hfHbBlRRM23j5kPYYklFHNfS/zERxNBB56rvyaxkX1YF
	GewvCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvs9bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:37:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so17285151cf.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782214621; x=1782819421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=fhqI0p0//S0ptLFS9q3SPgjA90L49YS8l2fOw8jC5j8LgGtMLdMKOAWZ6iT7/yZ4pY
         KqEbAQdVTqCEiKx5pxur0hNuQn25GetIndI9QLHFyaWNmw7eGbVQPHRlnXEjCTPGew5k
         43ktsIg4f06uv/jCEG04lVn8/BWElrFgvGq0Kst9Wuot33QnqUbGP5QhCHAvSKep+bxA
         qB+ndilPmKj/600u6wbeZTsLU6dIBb+QmGixrROXRYWyqW8KfvJdFtZSJlhd3FRNccwx
         3acF8jbosGBQ31sPp7yVY4DYuJWILNuXhWupEfAJ9ulS4euKMbuJY1Vntrf+IxwllmDQ
         idPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214621; x=1782819421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXNsvpmExzEXM1J7XKQU25avjaUjuFbYf81y6omDQEg=;
        b=eb80WLI8O7t0NInagVymitXzboKwEV3ZzXhOj3hOOFQg1sIYOA8qj6lMIcPxBMbDjA
         ExzTBtzV+uxYNc4WSIiR+bE2+U75kv5EKHLfyePEHyFgRczc2ci2jSF0pK4l7t57++nx
         uq6o1IoWuiYwwlaAjJpe74VVs0C8pKvnwzcOZjsDFaglG7/lf+odQP7E3hm3pn5dBEmH
         n1FSG3WGI4G9io8ezyzn91p026jta1cLUwq1OXTGD/+mM3MuaCdJ87iWCdo8deQ6w65D
         8gRB51xlGJoNLeB4qH2JlsvUzywX41N92fL6rGVikRz78Cuu97HOwagxaGVJ2wCMnr6q
         JpVw==
X-Forwarded-Encrypted: i=1; AFNElJ96L/2EsyjWB2rc1juBSeQOOuhcqtMnGVlzWbgOctSVvWfj2fhiJU1mzjLLg8e15EnOHaBHuUuLupxV@vger.kernel.org
X-Gm-Message-State: AOJu0YxAi6/qFyHQ6SGshq+j752fysWKGZR25bFzfhQNA7w09gIc/bLz
	P3Hgd+MQqV5kJ+yPsHQFOk5cAFkLLXAwIH8jutYdjn1v6PAzAcdHvJQSjgJ25JNR9EI8TO7FBit
	SbxDfJZ5i/kfnBDVHxpn+X/WIy7K88mmrGKo8cV7vymwOd06lr9CobOR7Wnd1zXe/
X-Gm-Gg: AfdE7cnxR0vz9EVpoXtER/lOIcl77mTOPSbrKvbh45L5hXrZ+o+/VnzRetWF85jfcmm
	vI/W/tbvVziWMr+ob8Fe54yZkip75nyN4VcJoFsv8spuvVbQZ47LOa077V8ngrBseAuuqDoNkTr
	MKR1HmYcGy31wzEV/j8U00RvOJRHGwXRWBfIcBliFazxPqceWwCsjH3Ms5pzjNeFPMDNtuo0L2Y
	5kM2l+GjT2eez2qa+AfoOuBrpGr0ghiP7EyUq6GOGv8pphZTWllljfA+SaVXqecuFa7tJC44mo4
	Q3jvYjBgqVx0tYtWgbfXfISP2XRhfM36pH8b3eR3St4apAbLdDFUib0BRFmTRTaCeTCFw/4KaTA
	CA7k89IosTPr0GNGEK/MMSC/mb2CSgwezqCk=
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47487321cf.0.1782214620872;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
X-Received: by 2002:ac8:7d49:0:b0:517:5e32:f3ac with SMTP id d75a77b69052e-51a4f380d0dmr47486981cf.0.1782214620409;
        Tue, 23 Jun 2026 04:37:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm4536670a12.20.2026.06.23.04.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:36:58 -0700 (PDT)
Message-ID: <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:36:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a6fdd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=N-WSo6sfiX0bQk_JYPcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX2Cvr9M2B66sH
 EJLllwOwZGjUdK3+0esnYb7+QHvr3pTLC00/IMwAV6RM8sjLxvOelAdCSuRDXZj8abtyoAFToNQ
 Q15YywDwWleC0LElH+M+1beorMmPMec=
X-Proofpoint-ORIG-GUID: F8bGlopmeq4ycteCokPNfl9DB8VddrJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX2+Mign8YQ0ft
 t2Pc1Z1q9KNI0zrjOWyM5eWP4LyOJLlpnUAut6ZjRkrtmLrU7AWX0G2jb/cpwLjJgR8XN/+yGw5
 /vXjOZ++wMY8+ZLq613dqyVTeKnW0f03+I3xI5jvrUsXL2ao+Q9op+GNBPV6dWXM3vv7xyqeiDP
 X2R6uNwdYrPWAG6cR/SP0cKB+IfJ+a/bDKepYl/wtvZZgCv5ifiFTXvg7zk7/PjUkEtySupeKY2
 35a1upNf8coyALeK3QqpI//I5POEidiMhwewSN+nDeJRgoIAtmS3D89vhXCCbgHhvKdCVwnR70Z
 wLYAWm7Z3MwqBH8RuU3v65ut9/pKsngIlkvf4EC5iYfEYWX87I5vq6viCQVzInyFqubQpX7ByOc
 k9wYsGzCJTKIob1wdOf/BqAwsCvN01visZ1P15srJALKeaZNs24QFbIxAmcm0uhTEio5GUT1+NP
 iAEQAIxtZ4YdETIRadQ==
X-Proofpoint-GUID: F8bGlopmeq4ycteCokPNfl9DB8VddrJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230094

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Comparing sm8350 and sm8450 tables, this seems to be typo.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 9bd666ac2c49..5b278fd54a16 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2108,7 +2108,7 @@ static const u8 qmp_dp_v4_pre_emphasis_hbr3_hbr2[4][4] = {
>  static const u8 qmp_dp_v4_pre_emphasis_hbr_rbr[4][4] = {
>  	{ 0x00, 0x0d, 0x14, 0x1a },
>  	{ 0x00, 0x0e, 0x15, 0xff },
> -	{ 0x00, 0x0d, 0xff, 0xff },
> +	{ 0x00, 0x0e, 0xff, 0xff },
>  	{ 0x03, 0xff, 0xff, 0xff }

It seems like 8350/8450 should be using what this driver calls
v5 tables, with this fixup:

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..63a4f2127e3c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2134,7 +2134,7 @@ static const u8 qmp_dp_v5_voltage_swing_hbr3_hbr2[4][4] = {
 };
 
 static const u8 qmp_dp_v5_pre_emphasis_hbr_rbr[4][4] = {
-       { 0x20, 0x2d, 0x34, 0x3a },
+       { 0x20, 0x2e, 0x35, 0x3b },
        { 0x20, 0x2e, 0x35, 0xff },
        { 0x20, 0x2e, 0xff, 0xff },
        { 0x24, 0xff, 0xff, 0xff }


+Dmitry please confirm

Konrad
