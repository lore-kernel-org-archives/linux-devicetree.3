Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873678;
	b=s2Do+NOZQ0n2SrJS8HdGO/n42MJr4/UhWzTec3OrrCdgt0b0O5rmBjXOjY41WBBULNge
	 MmvWnsBVB3CcVVZXI/hswwfM53cmnY37bCtgO56l5M2erijzO9wB9KqSLYsJ+yO+H2euk
	 xjW7cRKmuhSlWwUV48BJaiV1Cmmb13A04KcNEMcropJ57lEAED0a6cymuCdh9mKg54pDq
	 p4EPh7Nkh1K7FF6mFC1ITETS3sN2rxB5xJl+qitzj/S8UoFMjGjbO1XYCzl65ENrEXTxq
	 lJv9790xq+YJR3Wa21M/4RIYd/hqMErGqCxhI97/QV/PqI8msv18u5PhqDB5yAH13mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873678;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
	b=uCEUc1CjjQT9OTTeQFN0PkhGABaho9tJxC0cmEI92BRIVEQcy1CYiNNazzbD8ReS0bE4
	 XK+HzZcqvtssv+CzcE15k/5BYD5cv5HTmzPAPrUw5n2DsGnqhODwknvJ7uJrO/3D06Qgs
	 asI4y1GfLCyvsEVwKsUFXU0jObLbWVRPhFEPgWlmbpYiDTEBVhZlsFyxIXWj95jzQvlb1
	 eseCb28JjR1NK+3OdKaPXDbzQcHGBwlBmrGuxeEZ/aR6+e0Fni/JfoUh2qw9a3tM9AsfM
	 NNQyIJPsFgjjVL96kMFl2+Yj8nkZ3mt6CXgRny51NYBG1TG7yA3M4CTueoif9LOY/hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cw7fARD5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34433606A31A
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34433606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llXsbZ09;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cw7fARD5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIUKWt2308162
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QKc9/tOdnWTGf3efjYi86dyI
	+DwQZ2YvRPmsUwFYhUU=; b=llXsbZ09axsDg/0ECDgCXLgLw/EVNj5kofvPVZC0
	DZgz0AdBV2nZnGm204SVWTUIH0ZukScHc9msDzEKTKX2bJvZukUhxjKpOoBHhu9a
	EpKEzthaWzxhwMV10vpKyk0/L/Rxzq6eboMbo0o8qBwdIgspMl0idxAgSRcWR1A/
	0E9pv9pYrocdJt96ppDcTj9r5f+JKS4W4DtmvjJrPiqkRJTQv8edUWiSFq3O1gxt
	r8ea58yK7MKlV56ze5AenhSGxl59iKwWTfhQxV8AbN8Y/VE4lP5eU9XvDQ5LD7qR
	Pj0yBNWa27OBd/hU1VS4oaOne0obtmxKIQKX6m+RjRZcSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pa3e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:27:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb98809caso350834985a.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873676; x=1793478476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=cw7fARD5dpYtQNlaD50uxwZwGLSuXRkKNlosDUVUAVfI/Rihng1Ze8Wl/IxZjkyFc2
         Bz+CDp8+ybU0rQL1M7WAqJWaEVRv3nQd/SO3WZg5LjXphFGdv86gRBrDnlzJ0UMq/0zH
         kWbhasSJcDg0dTfvxFtruyPEyA2zEVDyf/ll+mZjeTEnNcM+z2WyAbhu20pZWOzOpdlV
         imYy1bSk20b4jh/9tSN+H9oc77hw7dPIyW7HvTqxTpv5L61Q3t7Ey2ZETZLrqL8Jk6X9
         61VFM79M8djbkavE2pMdKcitDN30n7HKwo8uf9ogynwfUSBFnc1KrDRLVd72yfplkyNZ
         jn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873676; x=1793478476;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKc9/tOdnWTGf3efjYi86dyI+DwQZ2YvRPmsUwFYhUU=;
        b=oLIgdAcYZrA5c20PLPq//HKAxYMHrW8mAxPyGlrAqK8mRmYD0nFiZTBlPGYFdOVYW1
         DlObxYtF9d0DVlUG/6qBwW76nzKpMohkYOFnPwfSTRDN7pbDO6yOCBLdCZ10hpL0nmqb
         GHueq8v+09yQbOZe6TyeMJwsliq8KyF3BoD8/E+jOEItjtfaxhHJ9qXlpNBPdamP1IUK
         coz6wv5H3cy2/utFO8G6pNCvw06vwIxPOEbvyYxMhBaU32ocUNVyFkQJhBiHgT8drJYE
         LDPcTalHOoB60vMB84ac4EKMc+l2sPQw2P4ak3EFgZ+m0Yo5GT+A4e9kz60jb/IlSfIc
         CJWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzswY3je2qBPAsYXa/CJtfOkjG+10AokAG8SOfheLhR7H6M4EeIx/75qqs8mGaiz7Pw42XQQT0Q2GHe@vger.kernel.org
X-Gm-Message-State: AFq9FYLH6pbSjwFQrdphzId4DS0/cxu9fwu/QiQ5IWTvcJy4W/vybQp8
	RsQB9mMHXBOJoKQrzWX341hSHElp4RGrePDLhZXNiAqP508JtIbAwt3y8eKXl16/Xd78CeHlKhl
	3LJtxTNPY0ozDpvpKXBB/lKCtGqNApzIXiIij9FvSOsH7UriZP8Pc154hiFyWj+rY
X-Gm-Gg: AYBFou3zW7Qd4W3Mfl87r3Z4MfilVucMGz5Z1C21IklLJSYDzM1bhpKzCMEqEok/QPG
	AU00xUFkITzn/uCoOiI9DL8U/SJZIxx4vxn4X2un+VGFha7dP0dphwE7bB3ElgKif+0/PIJb7y/
	v/JBBgu7WCKVMtLaIDLYqXQtiuYOZtImBJQLo74os5pyZCpCqzFGsP8Fiivp455kFx8XfUKnGuk
	Zbc6JMSBxUMaaoQWGZQwJdhAx/w01Eej4tHaPkcGMxAIc4BMe7oZ9F7ycc4bzy6jFgYWxY9qX+h
	mAN5uB0IV6mms1H0oeuT6em2KmDTj5YITKMWKbpTGVNOeXFADmF/CuYbh5orPbTHfr7eBl7V9Tp
	mXKSvPwq7k0RV30AP
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406806285a.4.1792873676242;
        Sat, 24 Oct 2026 13:27:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93e:bcbf:88 with SMTP id af79cd13be357-940ef7ad8a7mr406803985a.4.1792873675559;
        Sat, 24 Oct 2026 13:27:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdd5b3sm6024139f8f.53.2026.10.24.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:27:54 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:27:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Message-ID: <jjdtsucojghnlo7hiaxmt3oxbbdvkhmry2rke4cxqwh5bpfd55@rbdz4agoxncv>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
 <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-1-aa1030a75e46@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX3mvpWApkEMGV
 6hVxNZ70ea+o/OjX2qWCE3ty1NkhaNDaUIGdkqLrPmLNsyP78Ln2JmvNFdLFtnVfoQs2xm/icvl
 PivPraRM8SBOo4WxP7Pbzgd2MgQN/kw=
X-Proofpoint-GUID: lhoZEsSTk2KtpUDkK7xkqHRmUN2eNuEA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX366mu1HhDNX8
 kfFKN6NnpotSk0Ub61L7SByXFExqbKUasgO1omYNzBdeEI1XplrDOKi2JY2RZq3aF+ISEJwbTCk
 QQrobuXQPDQq3bD49+wpeWvk5AnDLxbC2CJ3MwP+t5P0mVufqWLLbVzqEN9vIvYevKt+77IyymM
 NoRD2wcudJ85iPvOeSK8MglYWp2bJ2veARsKBYTjsdGhq0KuduqN5LyGo7LgNexqwgaExdqFRln
 cH0zOSAG9wlWKig1KNuHZnigB0W0R3K0wWbcBaUx7RYbrsK1DJTFbkyyDyxB30Q1czZiD9R8jv+
 FKTrdbQ7+ydE5QLcLWlc2CV+G/n/q1tG2+yXZNXEOz4OjEUWeYuefUrrJsL7MFR0QbWP//FYAjd
 VOgY//z2GQRsmBl2gSaBEfvzCKAf1gxLgYkeehjZeXuzMQAbjwSEG3kFCTfVmmslPluvSSdT+gN
 eqqxOJRnrK37YLTpygA==
X-Proofpoint-ORIG-GUID: lhoZEsSTk2KtpUDkK7xkqHRmUN2eNuEA
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add14cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:16:57, Neil Armstrong wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
