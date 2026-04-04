Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE0736655D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775340332; cv=none; b=c1yCaQ6N5gvM6fn8imoyjVo1e8kB0tximUtNnUGbH4QPQSLynCu5x9gCfve6LF3WhojQWIa0WbQusPpF/18/71Wnnra2lhCex2x3X7QP6lsoUwwFt4xaA3jFnjl1zSFMeGaOrW+Q307HfSO+iXTntm6+LBSa7MM8JL+jXc+EZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775340332; c=relaxed/simple;
	bh=yy99E4UQJ6aHM4tucnCgmHUeXZeq7RdsCaXFg7S4nGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQQw0ifAUfa3eWhyktUpOnJtyYmXqPbv2TQ5pSxHGUyTExRh7mGl/5SMdHSSKUx/E7yHUXfluQ3qks9fxHLAyTmWAqrNZ69pXeTN/uurA/xKMs6Y8pBLHl97CHDnnJXP7d5GOfaNmTGtiTuNgt1qLntWjysh9EVVPBS6bPD9HJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghbameVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fx7XvV/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghbameVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fx7XvV/G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634HpDZK1646111
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 22:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ho+efGTCBcefvlOHxlNZpncU
	78YecnuQWH4t/w2YXXk=; b=ghbameVeekWiDtlLQCrNk7VEAh/QIbYXysFUki/4
	QLHXeO8x78ubTqaX0OdBgoTGfJNjPoTXLYbtQWxC82gW4wuUUlsd1KcnERQj92ng
	LdPs/l91Xi1fo//YO+M7YEznTUWYNxdh8ZVOrTuWu3bqbrlnyuAQO9l6kKcwp2Um
	Ws8EV7hpdrHWPFf3IytJmtB+Y4QD05iZa08VyDiGljFdDKYRQkbb8InpCHGorhE5
	EbHn58nRth3ia47qOf+KRuEsJtDvrZd5TngBbSvQeP3EYUshkYKLJMLBLRfhYQeO
	nK6v7iDLEAWnWaZWx2INZ4iZ9JOu8Sf7tsKhq1UIOWkCgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dasyfhmt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 22:05:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d831e8083so7973451cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 15:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775340327; x=1775945127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho+efGTCBcefvlOHxlNZpncU78YecnuQWH4t/w2YXXk=;
        b=fx7XvV/GBJP0PHCHs82kzNGiatIjGwRJ2I4gRjdhwaqtNxp10OezAVXChaLhIFXsX1
         UTUOoY8M6vwbrjGhX9t5EpfyS+AzHAeoHLp/o9+lhACw0ERSJA7jZmQWy9Mg/SCZ4q1N
         ENVd+i3wjvGxKR+6x6YM4xmxSLnhZKavVpT0X8MDEbsGE7i18Kx6Q+/ixgeamJn5b1zA
         kxohKI9w1vayOgdMpCLrdFOO9B6BK2fF1tro4E/K1tE5umJoeIbfbbC+148lGT3S9cHN
         aUznMypxTS5LcN0/gNX8QqLYoPLmfgb/IhGS951Fw4Xwm7Pv0rLBTLQmKR6RZ8Rfzqpo
         GxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775340327; x=1775945127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho+efGTCBcefvlOHxlNZpncU78YecnuQWH4t/w2YXXk=;
        b=BhmasyVILdqUiTajxIgG14iW0iGjiOabd2nUlQU7xQsY1PzVE7NbBzEfXvap72smF8
         JMNJ6D0MgjmglDN4CxQVTGHVGWzsXwQNuCGlfr+JSwYC+TTXmV6RflAh2LTtHZHSDmBV
         z2oBzwYCs3sKdLBiMn/Uks3rsDPfRrc6oUN0I+GPJimwURWYc3mMQ3JDTh7f0O+VgIcQ
         A18k66+1m5sE69WppoFJYcT4qLUH7Vleo0cdk7bjferEUjIQar/ZXo7RW/5zflXQN7LC
         ZB5kPPU5Sn4dilIHnLhZUN6CHzpNH29CljBzJn48J1FE940k9Pf90taqeXJQ4n75P1v3
         NaEg==
X-Forwarded-Encrypted: i=1; AJvYcCW0wDGZ2BvGTdOLqTwdfkQu659qLnuW2GeRAc8sJslLOCZgROdIFqmaql46JDwHDr1Z57Z4TxA10Loy@vger.kernel.org
X-Gm-Message-State: AOJu0YzBo4Ps669FUBNkhTryW8iX5Of8gBzDdcWsBLQjjy8IjQj7ZC/h
	zf6CzFX16Fbg0j3667EFluS6Dkc0GuZj+dWewqWagh0BLpwPAGqIPfUhQG4ih/g5q9EgdwmiTSQ
	cBj0oLRavBe6PzTmfZt8pUTiFNe2fbBp50fF7tfGc4HrGrICLxxeY/Cu02vXqw5HK
X-Gm-Gg: AeBDieuSEhC9tc9IDSoPjMvV53q2iUT+BnhF2iXoHyVvz+EIivJ5FF0JT2YRFawZ7aS
	QIFAs+NhSEysFUEhDDex7Qd80ZFwzxpOoYGhOUuQzUqby4ewiwZ1bEO6IEuZDCbtMltQGhWwd/G
	Iyy0LPCh0QoAwJLQ5pFR6GTdDhjM5n/CCAaeOxEyxXhRV2vD4jcLuVkxPWIw3zcNKEvEswHeEoG
	xzK1+ReKuZPptnttp3VEdHX8eyPZRme6KBPTGP49cUvKK1wlYsaBuDKNR6GND9wF9wUfz29cTLJ
	jP5xZdBIHTVKi6sFCUFVBVRuf2NT5jouWQJYeJyJgefSxttfimMln0uY7ws1I3HNcAKtwlT8DQz
	OOCwxHDeU3jHPFUX/LfcypGTh/Wp7XdYmOiwRrWO4ZE+uCaNJsliX1yQxnwWXym1+0UBaAHCnCi
	IACzGyzUCGjKtBpHxnjF/knQXCWbdVYznol+M=
X-Received: by 2002:ac8:5a47:0:b0:50b:6e5a:27b4 with SMTP id d75a77b69052e-50d62d1ad07mr123389771cf.53.1775340327624;
        Sat, 04 Apr 2026 15:05:27 -0700 (PDT)
X-Received: by 2002:ac8:5a47:0:b0:50b:6e5a:27b4 with SMTP id d75a77b69052e-50d62d1ad07mr123389461cf.53.1775340327206;
        Sat, 04 Apr 2026 15:05:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd212d248sm21487491fa.34.2026.04.04.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:05:25 -0700 (PDT)
Date: Sun, 5 Apr 2026 01:05:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: display/msm: qcom,sm8750-mdss: Correct
 DPU and DP ranges in example
Message-ID: <w2om3ztsdcvehsqquynmqkpenfj2zyiz6mmqf7ptfyawgzx6cs@3qkix7ae3rxk>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-4-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-4-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMSBTYWx0ZWRfXwGbHq+bAktHN
 Ghkx53u0ZGeg48iFzc6pfjwBl5QoLZSJudggGadPPvgPnFQyWi5Uqalwqp+sa90WetwVXRAOi2/
 4GRyTarzGuSDEYbJ+SJIIxdz3f717jfNpzfbDTfjN6QWxcDpLXGBN4fr+HGBtaTASRqY//9v3u7
 Q6sRdZKLMUz1PbgPejurIx9gXbJdGuUk4lmdVjS1KiLXo83Y/iwoYmhAImGm8rN2hfdWZtqxnp6
 JEh/T0Wyfy+U6WVoM3GlhhhZ9PzNAn14ekgLFaTGSqVeYCGcZYR7V2ljecfbPKSvI6OGbNTojxq
 OCzzrSPuiDiEyiDpnYgfHbV0RVmB4vP40EssolKAA6Pb6554a4mtnDBr1huJL8tMiqSLGwoEMSF
 cn4wfUmdTqZ4yNV46uonxvjlzLpPRqWlWvS0cV45rEO6Xhqv3t0ZmqZeB/BUBTYMIhdl/XkYO8G
 LFZ/vkDlxqUvM1Kh8zA==
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69d18b29 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=bHnmLuETDjlIWUPFTNkA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yjn0PnLUneQpTiUEsZz0PkEGjdGWCMfr
X-Proofpoint-GUID: yjn0PnLUneQpTiUEsZz0PkEGjdGWCMfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040211

On Thu, Apr 02, 2026 at 01:45:15PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long. DisplayPort block has few too short
> ranges and misses four more address spaces.
> 
> No practical impact, except when existing code is being re-used in new
> contributions.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml           | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Nit: the subject differs in the style from the previous commit. With
that small issue fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
