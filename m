Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588D93F58CA
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787127100; cv=none; b=RK42TThezwJae8V58Gw0aKWZBVlurxR/+KyLGB9GXCHZAU/PUyvRMLTWsnXrqR4eLQLI19UFAhv++1YEeVdo7LOd70tHiYAFINYko8M7Uld00WKI4wb51yGn7dV4ZHjaDFfrenAf6yYa4KWHn8siWPSQGFl74JszC+p2V0OBbLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787127100; c=relaxed/simple;
	bh=Qz8lPNzuIAl2JFfrvLAw3SUC6irpQGTdatNMcIiuT2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUZotU5BZzMR5Vy7KwzvI2G5lsM6fc9Feny7iBcIKvX7U5fruM61TJWVgS09WIBia8K6qWCrQjK+ePGU5lX3wjFLzIKz3m5L0xT5le4hMPe+N67MVfWclyw+dTVXC/lYVCSa5G8vizF1wZkujX9FvJHAA6MGFyUG9G1Eo/+7b0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyUeZ/VB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1m8BZ+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyUeZ/VB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1m8BZ+a"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J6Z3TI3670856
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LAdAz8cgyVGRPXUN2AcIdjCd
	T1S37okBhULEMz+SDiU=; b=MyUeZ/VBAXmamh7/bgo+0D/d8VJcmyfa8FRlF0iG
	Vd6KbLHHPbph/JsciMf0Pl64GzkEaq/a7iEPiMsrXXZouio5f0zg853k9WsID5Ca
	axyvNfknlueuIpUjVneIHR0Ttc2Q1mVi4zlc2NyVOZcdo6kyc2v04rPxOKLfNsZk
	RbCpEv90z8mdAdoqREHyJPovjrwhuP2wv0ln8FjbA3haN5P835IuM/7uEYbJq+7g
	M4lJB1vc+FQB8QpdnQeMQLp7H3inux21AT6F4OcmMhzX3GH/u05ihD2GLriOKzQu
	Walbi/iAZqFZxd2nPzTAuo8Bh9AkEA36idPWtuyYh1pEBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftt55v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:11:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso79989185a.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 01:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787127088; x=1787731888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAdAz8cgyVGRPXUN2AcIdjCdT1S37okBhULEMz+SDiU=;
        b=A1m8BZ+a1p/S/caKuWS4zpYuKURbbPki/c1LosXar/1u4CowTC3JQX8PH2ggpnXSJX
         kLUJIW5xPwf4rQWM4pEZv5PuyY0L08gBeJ7AIT05FrG4mjhs8N3veKufAYo07ex09/Qh
         tP8gjGxjSdSuae65nmqjnI5SCNDzGIamCgJQA4U4cNY2tqHEOBb5TnMQ/3dNFv1jfVlp
         /TwagaoUHy0rQ8LqgHtzPmXNMKa1P+Qiiu9LhiZx7SIRdPws6x6R94sDzuiQfL/yAMzZ
         EfxGTElMNP0ZJm55YFaRQeOxTweMueTGbK91cQ6bsb0acHbjgwv8FIhrED9cAOhrxjrb
         8awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787127088; x=1787731888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAdAz8cgyVGRPXUN2AcIdjCdT1S37okBhULEMz+SDiU=;
        b=UZmE7AcLWybyYXBX+i2Tv/EeHWK+0Fn9CVVFzPB3fnTdf3nRIiC4s4t3GqFgvD/Sqa
         LuYCtjOJfhmm9qwmucrVz6IictV70YQF7ni1u01jY5ib2a89W7K5e+tI7uEzyzFlQ+aw
         6vNw+KglL6+K1DhjAD/MR8MXUGPuWAemCjTFCEy72xQd+TQpNwOGpNw2jNQZvz0GG5ia
         Ff64O/grISYkxGEPxhnNTTVZI8aZjSLtT4QF9hF/74PfJqLfnmQ/UQFDNZwsDQN09eKU
         fC3+D/h2Hsv+D/hRH/AHVy6K2N+Xb++NwYi9h7JucyEoq0s5bK5fdkyTNolBkk2RO8qO
         qrZA==
X-Forwarded-Encrypted: i=1; AHgh+Roa/19YH1Xe3p9z6uPWnIzwSOhlWFStQCyGP/EMExL0rx7BfOHFHHZaia3brJliKYurtf0uZkV6mZEh@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtPjD0YJ1zyF9meaFx+gBdInbysH3XSrf1Heifo1Rwp4udRe1
	pYPkA7d3ULF0RxmoYYw0TS8jMFGF89W5i3d+V1GQyn2iEYg/v455Wdq9jqJxmDMVY4F3yDzGaae
	TMI8Yx8gXbJVJaPZaWzJk7YNN0ef/JV4D6s7frLPdlLnfw3oD+hdB7ract5JoC/Tl
X-Gm-Gg: AR+sD13srvWqpi8ExipqA53nJECvNiqKnInPIIwfLvfd9RV/PzSyrndarOzBy/xYm6b
	zkWdtaguHgWjLID02ESIVEWZEp9w9nslnVuc3ttwP2KuxDixlVcqqyT9m392QLtG5T1jrf8yhl0
	+jqrOwYUJ5oul20DS/ZnqoS24rmNpbPQ9Yk4joj60Oc17JG/hjfcOPkaDQ/N1ygyryp5GyIMILQ
	HhSLaUS9aaAqsg9vIi+BWQP87u7aG+HN+i5/3fswvy5bjv/KWBEmHXpc8iWKuLoWj3J/R3ATpy2
	OdEMqZJU3mh6dd01uaQ4HlfeM8JYM0GZPjXjrmYbZcXMQk6xSFJijXTvJgpdnOlZ5/jxIQh0n7x
	xr8XawTujXHCKR4A=
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr263112185a.21.1787127088246;
        Wed, 19 Aug 2026 01:11:28 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:92e:9cc7:fa46 with SMTP id af79cd13be357-9371e251dbemr263108385a.21.1787127087639;
        Wed, 19 Aug 2026 01:11:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm42383635e9.11.2026.08.19.01.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:11:26 -0700 (PDT)
Date: Wed, 19 Aug 2026 11:11:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: hamoa: Add graph port/endpoint
 anchors to pcie4_port0 and uart14
Message-ID: <tjnjnvbplv2pihwpkzrsy77ppiirltfjlogaumctcyihqaunwe@f7lds3ogphkf>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
 <20260804-hamoa-m2-dts-v2-v4-1-1b5ceac74538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-1-1b5ceac74538@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a856531 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tlvkwGZ0IAML1G58lFkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA2MSBTYWx0ZWRfX9bAEGeE2gbCT
 Y0Mt4osH+cZv+2i5sRrCMMC6Mizdpwi8jcVdX9KzC1m9L/pxXd/rU7xBs0T3r0iUAe1FkafDhs6
 0esOz1A7IvYWNyLqRCBc8JwVQwL4Jw4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA2MSBTYWx0ZWRfXwG665FTy73aV
 lFWK6tBCvOKKQ5FrlNTp1HPU26ZPafV/m+93vt2FR2WtIlSnCJdMlSHwWnXkeBp0sxNr/uOqTK1
 T+275O3JYZaTXHiu5n11HRzkTV4b/5m51xzoRxBe8UQ06OBccjIAcjEkqJGs7IM5ZsTo9w7alw1
 4droxCUe5YNhIpotbZOCYsDEmOeyJhjnOG0/rpxKx5umEep83jcn6izAoh6hxNGpL7h7UY+s316
 ejZiy68tKhsKbLRsJO4LADooFI+cRx3Qu0ZAi3it6W7YYKePYbqViH8D0wVH492Bbspbezc5ymA
 928hbLvEh1HqZeLx5EdXb/wdyUuDrbQ2UJfEmVywJdA8n3Em4gC4o47nehZWode18bRo4DJvC/+
 CZRx86RvZcZcBmEWRvrlkTP6ULsPxwUt+GHys5Qsj3cd4pwYL/vV5yfaKxhwPifPylixehJX5S5
 k8fGX5GFgzhe9/aU/YA==
X-Proofpoint-GUID: Rt_292txcCIZEPEvcUUgM8pt6KgD9Ng5
X-Proofpoint-ORIG-GUID: Rt_292txcCIZEPEvcUUgM8pt6KgD9Ng5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190061

On 26-08-04 18:02:25, Wei Deng wrote:
> Add empty graph port/endpoint nodes to pcie4_port0 and uart14 in hamoa.dtsi
> so that board files can reference the endpoint labels (pcie4_port0_ep,
> uart14_ep) to describe connections to M.2 Key E connectors via
> remote-endpoint overrides.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
