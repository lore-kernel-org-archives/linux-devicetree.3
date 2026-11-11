Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420866;
	b=PTx3Au9mZjdZF7LcxzY17m8PnjsZUvFbqdderfIgIEXuDnKl1Yo4CD4FYBgQsBKQ4R/r
	 GRyZQnHVX9ITuu9VKV6JvuoUfs7XVvc2c/cEjDElNQ4tnY+r737ewgJzah14eYcDYRsK3
	 ZR5QKfsSMUKXzgyGdukA/KfOyNdV6IZV5/7NFMaJk9LCLU7NVbzDOcUTuDACU5NgjuqWY
	 xWLZZnl5h1Oa2FjCFPEf674gZ75nyFUU/3d3u93M+2QrtxuiBDMDl3Qp3x3HRYDegFdPz
	 87NCzjCpI20jZc+/SiHWf5bf6CZSsvyjxMpTiNKNU1aqZvsxgDuBvdviG2+Z4J4hcTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
	b=vmIUO/n1mUTnD6N6DUGyrYpkaU8RnBX4gOLwHqbHAzWXojff2mx8EokL558yZC3kvnQA
	 s8gmLS9DwTu/RP2fw/QYyg4s4tAs+42j32a/7qAI/Ioh46/4aLae1uRFMFC4Cjndacu1t
	 MAg+jYeHyN9/Aid2ogHAnuAfBCeuZJz4DMcooejg92Dxe7DSLL+ju6k4mwssMlOW6JHJx
	 BH7BMAR7cl+N3old5FJicV6Wm+DHzdi63QyqbS873dBt9Mhkprdb/XGRJrODubCW3zr99
	 tupUfnwmk2AO4iM9nb7gJBu75drPZ92lVD/SpEtipQXJQa7BvPfldYxtW8snULxY10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EA606D728
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1EA606D728
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHthQI1400059
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EVDD0ZIf0hmd9TQw5ueEix5r
	vkoEax8Jzcz8T9iUU8o=; b=NuONsJl14mEotLSRpoxfRhUuboX5vi8srBBzXDdz
	n26rpdrbVtVMOGXsT4z7KXPpMSu4bvOmar6YXOj/HAnpI9UumXpWDjlX9gy/CIGs
	qw0lgkC0KCTfsI4n1PsoxSEuPXjaZT01c4ecsmjM8kXPyEBR4t41ECPZ8rmlFNgN
	W4IRTefM3QCwYD3jzXhCanx14hrAePIZLqO1vBsz5kdsBex9bXEAtC7osJojjaLJ
	QUsX0PmNR9ashmm++NT7CSGGyFmOWGi4vssF/Nr7y5RgSOd+uRULSaWwQivpC8kn
	I573ti4CU+RX5egjnmUJEqvA6Wds/iJO2qfVzM2DdjIZeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34vww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:14:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso776561785a.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420863; x=1795025663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=jHLpRWXgKJbBr0KI40phKI3MHFfnG8u9YbIoQ5VHrek5V/k54VZJsaziDl/3czMIC+
         BPNWyWC504TwpMi86dRADRWMwAqps3lrb6aWvM2T5jFOjle4Cn79Xk+c71puhvtsDadN
         wy9j8LJ7fCIfCMJhd41fOiaN12NjwJ6ScXWSdv/4m/Gm8Bzi2xJbtpQfrrm67wwvMz/h
         JY4w5g89bAZX3lo45gQJynExe6YUKCVxSHfTYs3zepQa+U4hz8kfX9eBl/LemX30//Ra
         KYNkEHqsVCTuTDe76snTNLJtAxlf2tyySDd9PDHRzgvpD0mBPpC8yc6nMSCiR+IL8REs
         hl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420863; x=1795025663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=1EOGtli20eDXumzRWcfzEwsuB/ZU1zpgANPkjye8JrH4a2ID9tVCgeixwKFXGSk7ip
         V6FmIRGDN9tUT6fXbViyg6QHeOqfi5gNp/hQ02v3obgmiTdldaREehI2W5tYAFahNNd2
         Vwd9JeAh0MxY1R4hdYtPQR4DAbXpwWsi65qqp6Ib5coTRumtTul0wd1+xrzJ2ZxKB9jb
         24hI+0woxuHcNgP8CVTV9gqGXcTDPS1B7IFYbCkP+3gy7IZyWBRswoWneL2txbqTVxkb
         Uw87THEfn3n28oul/uIlKPKd+Yfao9hLlEaZQhkdLfBT1jDVi4Y8rK7oH3rwZLIwQEvq
         rJmQ==
X-Forwarded-Encrypted: i=1; AL+hErGTyF5i70Zp9MGZ0bfZN87+n5SuZnr7Zc7e7Dc07AJUeSArN5OymLkG7dSjnccJfLCfKFimZ4AvOa9W@vger.kernel.org
X-Gm-Message-State: APuU4Z9ljuPw+boQSKo1MlrJhv7cpTs/ytRza0AiVLDfFA85bfqTjJjM
	YHRGCEcpLQD0pbivJQQ2uuxnlDTFA4Y4zCgFhZ/HKF3X6MFOu5JZ9Aav30xz8XT3mirB4Xx6Ha6
	xHopqKE858pcVVgkjtE6XJGtlmcwkG3hNeTtXCemBIUUkKiM2cj2yMkUnu/N1ka58
X-Gm-Gg: AYBFou3Ocm+gHOkb4OjP+Paz2ARsP3cVs0t1EV548EFV4dOwtucVf6A9X5y+O+Zy7CB
	T3rJU1ljnGhLiwR2kPWrzMIcvK5cKucrS/E2mvN38Bx9dU80TJEBcYaTRN4x5FyP8HwBv1Le4/d
	D21Uw1tLFaH0lixVW01uUJsLmJNf69KP2lvxQQX61Kbuhhs1wHMg3WFdUgh23BD7Khw+2FbGOB1
	ZxQvNUGLZeSeJddiuxWzZWLOzGJ2tLoVeiOceTBKid9+VNuz/PlXveYreRSB4X3A10LWp+q9eBq
	oe2N7TQmGFD8Ms7Yilg7Eql+CEUowIQHqRr5grHu+u5TeFOi2wS68J4rQ+f2DK1Uqpcao0EeUFf
	HMUFOaMPP8TSzqyDpxbAQc5muNuRTsbtrzUBhgL0GEh32epn5Sn3aF4Ttq94kq/T5VXCovSVczN
	xT4Lp/hTnHkqEoDdJbbIkHwgjn9xVVLdgEA01VIqB+cfTRJ3h00P11YTBOBwtMzA==
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552405185a.62.1794420863175;
        Wed, 11 Nov 2026 10:14:23 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552371285a.62.1794420860004;
        Wed, 11 Nov 2026 10:14:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6552871fa.19.2026.11.11.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:14:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:14:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <dkplnfllwn2zlx36yh43lynz6qwcnzp4af7l5d6yph32shcy7g@cup3aqkgevw4>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4b081 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=FelehbBqFq-cYOsUXMkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX5VVpyqkI6wX2
 Own2U+TKlqsXNmr5hY25OFbPxYgTzqgFfYoqmTsNv38WkZuJG1tugoN1b5efTClw3mN5kEGCLOF
 P2wT3HMvbxgxeiD4G3NPYZ8lEAtbJhW5KX6O8rYb6xWgPmu5kRlFunyQZyncG7o75srY2k4VIJO
 Gph+kF5o7azvo/uld7AoGsxHNg/tuWHhdFr4Dj2ERXD2aQoU7rPMtQFe4nc6DW4gI/xsv2XA4mG
 OpbSFHnYlJ41farKD9i0rECHsESl5r+i5TeVjnC4dP2aACEnXHOtM9frK0ZmQWy8Lg+JSg+HAzC
 SpQb/k9z25zloN1QEOdCFMRNtxMNj6Ov0HMIvDkZxn1nQDH58oGTDckVQGfmq7TaU46B+1x7GIW
 fiQJtak47P92GhHJME27oPvEalp9yNLPmGRJR2KtNvpSf4gTVP1JvAwsGnmUjCvoa1UkdRhvn4z
 GnhDXyvR0WS5ZqqInTw==
X-Proofpoint-GUID: gxZFRXthHkqsoVhehoH0EQEYOX_mkI8q
X-Proofpoint-ORIG-GUID: gxZFRXthHkqsoVhehoH0EQEYOX_mkI8q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX7F5Ano/tfQeN
 i3AT973pORXD7B4fEuNvDMJWCjnKUTM1nRuXuM9SqzGrnII6RuTOv1f5ygLNriM1dImuknqIbTE
 Adh5eZL2YzsvCFiAi6FkDYfgof5HuhE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
