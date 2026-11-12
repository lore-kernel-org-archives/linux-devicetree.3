Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477009;
	b=ZNIO64rPUBd5rZfaqImnXzXksO76D+YeSaboK0TWMUoXZWlnaSQYDPkL75OTpYY5d4dT
	 2lRN9cLpctKIqF/euN7DX6lxPP8Y8n87x/LSMixqoIEw2s7TXLscjcGqDJG3fpuMEqKzF
	 n8tdH9/m/pTNORYqq7AnSdT7qFQYer5qNQ87DxojdtWBn98hiNFQg0vbnZjLGdsozNnw4
	 /Y5Mb60dF5kEwYXETmVJbDJOvN7auZ7qLAKCZhrEs6De/LspUNEkEXIkDoLgdGeIX58Qo
	 jalZoloc5BVbvdgz1uQBCeSs3NDYUN0uEHCvchbLdM8/63dVd24pQ+6EGtecGLZ1wwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477009;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
	b=U8hXAKZxTp2qEX9XzvhLHqTn4Nl5x8F1kkmwt2JUSZKz6YrtzVAf1LJyV/XIHipDV0PL
	 TmrhD8jARmlRIqNjv9UO0XWVZAV9WSgR9S/ItkEp94kMGiNldD+PFvBlE3N1Ngrn0w0m+
	 jQXegqfbUHI4Ns2NMSbPZQLeRGuXTEF+7/jVjOUm9bw3PAnMhmUc7UzlQrK19s3r/UF1s
	 vFDYN/zTzlGl1wALsP7aLHToNNhOn/VG0QI5TgJ3f0crdq9eJ7Nrf+uxmy1JjUDtTsMnf
	 pv0gHJbjW1Eu+TnTCBGUXJnjm9FigUotWCj1bZhmQCXJZlYCzOYvx7qvNZQnJAEeuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PaFMb/hs";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A1606A32E
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6A1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gNUvkOvm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PaFMb/hs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC93xhs2514179
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yCyj9Uv/I3cJ5AJk11HV61Sj
	vlAanpJ3mDDAS5FWulc=; b=gNUvkOvmqou/N739X576Y9GcOyLlpZGaayy5WwrV
	iVoTyscancZTueLdwBhOZleco3OBYFoGfA9sAJKSlB5ogdF4AOewrgARDfOAzz+5
	PyZq0kr1ewRvDudryhevfTQkJHs0zf2T8vvFEVf8wH7nCFGyEf0pbp3iHJooHBHn
	WiGMbEU1KsU9hfpnJmGyctKs/QxB4NUJ63Pitf9ZA90sq9b/FH6pc9WDkinxbtxp
	7BD/Omt9Y1iaOd53rBMJXDspQnHRDWEi09xT/RltEI4z4JVeIBKIViLuIU7ma+5K
	rieftMMhgqXDmZOd8aAIP50hdohWQTjj6gKbrWyrEs7H9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1u0rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so280091485a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477007; x=1795081807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=PaFMb/hs1SMsiM0trj1W4qowQ3+LXKli5r68tzyIYr5cT1oz23ZoHNRrDWH+cr/Mgq
         uWJjXbHEIIHuAQBPoXpnWernWtWzi/tTlo1iqMGvwKSVyLOM83rx5cv4c6wanjif/rxD
         /oher8LB/eAST6t47aSaVVktOhOq9EPtX1ddD406y/zmx8Hgzyvxf3DnhkUwFV118sG2
         tBsZIX/W/b1rR69HsPNlXi8IL/6R8esotd4pd+/1Ck+xqko5CkRSpu89Kfo8vzRygPEQ
         MJ8QUWX5dFN7AsQkfYto0znWMyteXXoIJLPJ+Ao2ljedwEmreMEbhRp0psbyvN0dnHtU
         0Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477007; x=1795081807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCyj9Uv/I3cJ5AJk11HV61SjvlAanpJ3mDDAS5FWulc=;
        b=qjeAmsru1c4M8flJYU4fch2ZWH+R/okUbWfRJOgk3166cQvQJG7Pk3PLVAdVWHEqdW
         fb+MEwMGoRCoRipYy+IpegzZ/+IwmVzXzxE/I0Ofwzkt0Bb52tXYd+p//ADw9LH0dG60
         5XPkceTmV7VVF+jOvgEWhrlHumNVCHlbkhREEvvz39O7/ZPhrWLqpDWyUluJwB+VlQkm
         MPZ9PCtEO+eGwD/1WRDK0tJfMFvY8s6q9KQA7of1tH2npEVwX+Lnii9aKMc8Gy6cu6Y7
         49fiYwRAt14+3Jv2+E85rnGCnMnMHmMvSRkFBZXgxaQZHbOGMloo08lHL1CWsVchtdPX
         pq0g==
X-Forwarded-Encrypted: i=1; AL+hErEJ4NUBcebZbaBTb4yUc38mjbyU4HOU1BWz1LvdVyp4JNeehuxYgzUsEcCC4hf1mBT64OxTOFLnfc4t@vger.kernel.org
X-Gm-Message-State: APuU4Z8S2VNxe5AVagEwcYXWlCK/b9IRAqr/TwW2YOmX6dD441DKqBAj
	BjGa4WT5F+b6H8fuE9xVJIF/5lEBGY+/SRGM+sbvnA5kTL0LoC/wsOuTzXMM8PfO0vDO0VfTZkU
	B8/E8aNiklQdOV4oM1UASJeqNISuhic/FZXVEkGbFuTw1kW93j6hFdBAxuX4x0Lw9
X-Gm-Gg: AYBFou1ejIc4l2w8SHLh+FVeb+8aKdLN29AwMnkS7g2w1z2WEHhntcZYJprpWCA5e0L
	BpXWfLbtgOn4uE41FbGUcGPIMgznSYCuUA68N8RT+4BdyAWxGMLFvf0UgwGnn2PGNczr616o2d3
	v5Aqdf2UwUmWaealr9OLHvyI8J1qjaV6QjDfuzHW5aMWuAd0zlwBpnaZrUkbT5vCq5pLA8JzZ2w
	8v7hkQq9Sg7eEo58CbHeNFDrMjzrF2WH1OXiSvJWXSLAg8/yzQswDYZHIwZy2o4DlHnVfGvxCCF
	YzdF4vfekUof+PrRTxrKuiqXa2PATgJaaDYO/btKg4BGM2e3yNgEaxOKpIxl7pTtyuAtBLnAkJ8
	aTIlBs1QGa7UipPD7XafEZTkFhgz2LFGEtIdYk9DM1vuZDHWdCdDCqb4lY+55q6Qv
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941055585a.47.1794477006799;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
X-Received: by 2002:a05:620a:4706:b0:944:2f1d:950a with SMTP id af79cd13be357-947affdbf4cmr941052685a.47.1794477006075;
        Thu, 12 Nov 2026 01:50:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb51de7b91sm24994425e9.6.2026.11.12.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:50:05 -0800 (PST)
Date: Thu, 12 Nov 2026 11:50:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
Message-ID: <4newiumsdgb57suqrv4dgbr5tfkn733cjlhn6va2xvrpmjbft5@gjbsuzstqxif>
References: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
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
In-Reply-To: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af58bd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Vws5O8NP2Tv_UqLHoggA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vrTEeaQZqkNOBTvzhO3F4MnAAGprplB5
X-Proofpoint-ORIG-GUID: vrTEeaQZqkNOBTvzhO3F4MnAAGprplB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX12tuLoDeUFep
 VntSywqHoAeRE5XmRYcExlMLkBxAQOw3sNIKOaBR2hjYQT3wtnrkFoOXBUk4WPkMDgWJMpVH6G/
 hBGRhHKORMaEa/0SGgbMVk8CkjFjTh6jM6ZHo20H4AeuFQFx/tO3Cgdwm1gzVbWOCDKkjctL9vm
 3E8GYkfTH4+lHPyIlq1z8sEu8dcYLK05koVNfslf3WH1FqEk/HV1nK2j9xjTaQJR+S+wLpHTIoG
 o7xlFOUvCHmNg3gozi+d6VBcPxNm1hbkS+DVbAwDHghFlNqJE2NMzU/pgDZVweE26skNk7pNoTf
 L9vOAfex29mkoLbu+7f/EgYcXB3dIPX6XjaRTydManjAIZ1yQTqBEbBsIYCZ8U2RIn5TMcqDPCw
 qE8b09HhYFaEXfKIttafaLjLhIWZWQqXafoEwO7LfWFoiIZrhjGFgNww6UUbcdAYrx9x95CxGq+
 KuvmvRcN2nta4B9O9OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfXwwYcQ7phJ5St
 1NkpzSkBu0VuIcbdOgcdG5UijeJb5zRDhEQbjtMvXi34TkIpOF4MiUGvfpIoOjYjaVLW+hW1qa+
 1ohQ1i2V1wNv8GcOaZEYTEib0qsONOY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

On 26-11-11 22:18:32, Ekansh Gupta wrote:
> FastRPC context bank 10 is reserved for the secure PD feature available
> in downstream. The secure PD feature is not supported upstream and the
> context bank must not be used by any other PD.
> 
> Using this context bank for a non-secure PD results in an SMMU
> non-secure global fault.
> 
> Remove the context bank from the upstream device tree to prevent it from
> being assigned to an unsupported PD.
> 
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
