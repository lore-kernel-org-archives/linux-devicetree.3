Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A734334AA
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141756; cv=none; b=kyrrCYDOMBSRWi7js7UjP764FlpdgacobBpaw0LZxrq5mKRoXQSdBeLv5kAW80SPnOJmj4YM5f694NciuNLTwk4maKJVe9c8MdhmOnwxCXR4PTD4FV7Zw9c99CDtGXq+1d5hyMEgwur3KnkRNbfyTdx68ydqLhyRjdFOMI/0elo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141756; c=relaxed/simple;
	bh=lyvoeq0e8iebXlLsQyQOWuo6au41u9pWEqiAdJIh9Ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNSLT4//Cz+1X9KBDwrrIKTfICprG230nahw9EftzjQnFJlFaFdDp1jUlSzzLSc43W0vZlcYm39bDBw2clTGe0NWsU07Y+PVwk3p/PSNwbPV0D+rsErTTFTTQEUaNaGxYUse3D7bf764tWVNNDoIRe6xFnRzETiOyyIeVPu2E+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARk50zr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUyQfzVP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARk50zr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUyQfzVP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m4W31465285
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=; b=ARk50zr6m3Ulzobk
	Fy8URqJ1oVGMLtdbHqnYnRv84JSNMxzau0MmfzbOAkygZW9vRUd+AscGgJBO8bQl
	+2ci70X87BY2ea2bxh9Y8ThaXS06+7xA4x0zuTlJtJBLfA17NeILaC6JokLq3AYg
	cSKedk95t2G92JDJsOMPIstIA8C3eSfhLbAEXgUDbsHrPdu/klGgnElkogCh6JD+
	CSM8Dd+99XGmrxq5Uitk9tvNE9e4MNauCm6Fy3Uy3a8EtNAbga9TirOKGc3r0CnT
	viQM9o/NbaO1NWYSP+kMXEsIU2fYfa8GiA459iIgtsqrAGONl3NfvBF32zrlXZwr
	5bMp0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wugd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:09:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso3829685a.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141754; x=1792746554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=LUyQfzVPtGv3ppfb8aG8Z7hn+n4EnQ1w7ZTIH5uLTBlz5+HA72azVtSt3jH0RxAdui
         LkmkE0ec333Xd2YbGF6JZSsJ21SpoIKQkI1Q3G+58h+6fyNTaHgy81F1D1g7O/2MhyGX
         fWF0H146Pgc1y3HUCYHSHQOwCMofUBPJZ1KHx0wLRryclC6cGL9LvUI1kmeCD964VoXB
         mcuY7X8KSTwJhSHUhMiV8Cw6D8JjgQXAWF5G9dA4L9QX/PUQjk3rHPpXj5/IxeG+hJEN
         wafFMgAL66qocLx/0cue9VQdGDfCZvMeayW0UnmZy7znTgklF5rw+jRQKwFzuAECY4Jd
         qhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141754; x=1792746554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2Y61SbarNC1NRnPllqbF3Qp+uuYMSjYKhtAVsLZu3E=;
        b=Ja1sbVl7bsxVgmZ45NLiHCDqjPIRZGqYCYEIioPK0hSwHdWIUG5U87NemF8MkbsZKT
         VQgJWj5CUA70zAxwFGreb5ZNngu6uR1PBTQ2t9mV30BDGkfJjL5rpNphl0k/egIa8N8h
         9dLeAz3vuY7C5OJJ59K8se0moUE+fNID9I4emWMAjA0Quj4TY3WXBluFzS54kTxvWlLA
         hKs1kGhLtx+yzgeeotcrD32uMp//sRhGO2ks8RRgenWtFoBXHrmNNytj10mZKeG1Bavr
         8DcjUEuvYUXTouuBvyUZXKe/oPZmqIFyP/F3N6EgUXrOn061Ok90TivUQSGZs7Wz4sMR
         u2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwZinmfM2Yh42t816dQ2sWhgPsVHQtyfP4FzS3QMWSrstne0YCl7GUXUQ28oK+yRif31y/Pc7qEcyWr@vger.kernel.org
X-Gm-Message-State: AFq9FYI2OARQvJMmOxH2pxxRHq4TMy12QOwq+HwCkXMDvSWDSS1LJ+S3
	ra5DaS1BEKk1kPWLnYGaKwOAk3wlblNYPPlbXXVo2xHvdGiDWcEnO25SdD8RCN1rkOJOU884bnN
	mXV+MRZ7oIvns7HHd7FVNrWlB61KhK6x+ABUGz65YHYlfZCitwITJdV/RPwRbEUR+
X-Gm-Gg: AYBFou10Utel4qIJ3p4kjuRE7WPVAkR5MrhwXR4Mw/rF+o4AzwmonFN2IRDrw7j+Dx7
	MCF/ERcw2wXyGeCwLXJvnhTzY4kItqm9XAF7mDteZOrXp9ZfQfSybIEs9fhQ9b9So2P+Xj4wONi
	51+cACUozvGwNSCeXYAb3SwrLpUSYLH3qemNMhGfV89x5YxeVtHmIqCeaRwr9JZ+DkTcjL8biwc
	uY/y5gQZVVTtSzT1DIzxrWUCsSta8gjeahexKosb7am1Q8cPeKi/CwtXz1v1qioOX77KsgB3my5
	0K9RhTt7R+IuaPyDV9GlwjZB5NSPoadjgOpc8MIMEitrK9A/90oyf73xzQ82eIHH6f9G2FHEO7h
	HZb0G5xSNRhHmCBNn6BcZLA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675064085a.0.1792141753575;
        Fri, 16 Oct 2026 02:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3675052785a.0.1792141752034;
        Fri, 16 Oct 2026 02:09:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm53638266b.78.2026.10.16.02.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:09:10 -0700 (PDT)
Message-ID: <4faab1aa-18d1-44ec-8a3f-79d732f7d0b6@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:09:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-5-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QyWkYCIAvAPET372jrKsKyqnh6VWRTPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX7BcdgrfNOAZT
 bDUdsyR06E+HWAeuocMktk/HZ4z+33b0R1JX1AXwf5+wKI3Un2hRmtEYaPthnchiCTHEegMCrd8
 khNOVY8A5OBB5se9OEBFMeKSgs+ySZ9suMYsqWWX3GG4Ci6LFi2iQfx7QCgcgJ+IBBm9rWJW2M3
 IfFHNRgt/t3QK+LoWjNR/g3argk3ND2BiS5Yn96//jqf6JSIZdOraHqCbnqRtlDqdBYSi9Q190d
 Fw3KmGtg28Prvv91fs1HcHBRlTFyFfxTarXZSKOR1xz0ujN3DZsCsKYpYbeXB12NiGKbevmPHxP
 z0nxLhe3qZBL0FItKa4wcTUsBDlY4aIJBzITLB5AFoif8plFP95cb0R6WvOpTe9S4jz5WC56sY0
 eCmDYmNUBodar9rpLFv57isnDCgey11yVQWNLSAS4FY3hTp20oMPd5vC5eVpIbtg7Q2/avDeapT
 DQN1a1g8w98r1Hwx9Wg==
X-Proofpoint-GUID: QyWkYCIAvAPET372jrKsKyqnh6VWRTPZ
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1e9ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8oCPm4Ec_qhLfyN9vMMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX8Z8iS6nCM8Ou
 hVrMoqM/VWEs53AsTJ+8nc54fR7rCRy09F0WZd//r90JIai6KY7QI/rzQTPFw0VBIrKdHsD7Fha
 48znbMn0FHpCagheyWiLm0qtlJFQlPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> index 22eeacd7aecd..3bf7baa2bc82 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
> @@ -1017,6 +1017,14 @@ &mdss_dsi0_phy {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {

Please keep the nodes ordered

Konrad
