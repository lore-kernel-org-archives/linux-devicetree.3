Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213977;
	b=tuBOHMjpXE9/88pdDDlAD6mb7clAJMk/HAwWt4a+ITWJKSrHIkpqpWlKtxzeFhMf8Bp8
	 FREjNRWgNbfZTqZmXjSMvuQhbSqVYcNMRmVNBEVs/FesevdZQyNkR77SsIHnOyJNGp67z
	 lCeuRnZ4PviY2Brrphog+pDjuMcpBtQfYC3zyc+kkTIUNw2JoXJUHaK1I+3eBrwYUJibH
	 UCSbpE82oypuK8XdmVzC/UcGkj7b6xLevfWXXzJ59fEAVPwvSNXo+k8OoI+HL8vHWtmwn
	 o1quxJl2MvumDRYV+nILaoKWncB2vNXDS/oGfdKhOI4k8sZE/P9BLBMRNaN/Z6FQGsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
	b=V907VgddOaRtoRnk4JRytK36EyvNSSsSMDl8z2is8/DQS0s+1CoHWw8INHy2aT4YMTkw
	 npRDHFYQrdVBA0/C0z68eO3jcW/jDdbJcscm1Nuyk0CJB/EqgZS8wF4cAkTDMAAnJMy7M
	 51X8x1X/+qFXs2hOTob5EdZWzDJQooNN4z/tEAxSPAT1tQSLkeb692QBhFAgkjnY+kbJp
	 zmuipQfVGtWmbe4ih3Fhc4mv0W6uhmIjzHfBAobs4Ep10vZEBZRB2EK0Tt7Y7sY0qFRKk
	 bCAGOOQMuo1NuPoYYIxyEceMguuBkuERqLKd5sfYYAROvb898rUx4C3F7dgLzajWBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B3606A323
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36B3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIjyrxxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hQLoxymf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A27w2668278
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 08:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aPhVMVnTP3+PU03MJpjQMo/
	vWxMP+DMEwmZ9LrbkXQ=; b=TIjyrxxorzBIRI+Xpdfe5wUX2n1ON4LGatB2aYbD
	jaA8bFqHfAsyCXksgE65yZDMeNcx06EIEtxtvq9DkpngKGbtkeljPe3Vt1gNuzQ5
	mPKbMDBnudmPspTp90VKRrW12BL6LovO644gGVaZCeuTQeduQ/KCJmZwVjLDs+8H
	d/M9aPNAoNBXb514MVzWzbB+d3SF9Yd1AC1wxuhyk9qv70AUEw41lRic+C5tvaex
	/SUPwaHKH3eRXtvqUPkK+9Pau2Blr6te+SmEdid0swwscNsspg8imktIwEGMclix
	lfEtXUyajLfiS5Zcp77RFWfIyJ8si2Z+ZLeuRcy14o5kVg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99n9ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 08:46:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so52060137.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 00:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794213975; x=1794818775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=hQLoxymfbK5Sxg5oZSPnefwFwTDhbffiREOzEfhws4fqMsUrZc1BNpXYKGXZrCOn1S
         PvagUviMakdlysqqS8ZSmmeYGGLQI7F+cMJK6DURqoWmiGrj2Wp5A0zvzi3euZdTi1mT
         seprykMs907qpnsxYPwk+WEuzfuYjeAH69BGbOY/7Ec7m+60+VzKEmQD4C8ReMnit1Hq
         pz10L5J2JPvfDa0EUOdhOi/4rAT2ouDtW41lnydCwRm8VqnokSNQjb2uvmylcjeQYiNR
         Ooku6ST2C8Tk5zuhXqHmJ+P7aO7nzwxG87oYLZyjz0Jc7b9LM4xKUWVFjWwREYsgxrSU
         U2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213975; x=1794818775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aPhVMVnTP3+PU03MJpjQMo/vWxMP+DMEwmZ9LrbkXQ=;
        b=xS7o7OzjvgPnkp+xRQSO9G7CnBCZIKtVJoDX8znzjC0l6A8bScsdBp/zo4gGC+Y9pa
         5ANMKTKbCZ/rFP08leBWgEg0uDWHg69IVGQ5Q/w7bHZZkCTMIUiShwcK7tQW08sL6KaD
         481VzyOxfCwH0iInmz4YqKLcUdkK8o7X3M/Uw3H04bWsE/Ur30WK6jxoEzJ7Ssh1wf6u
         1JO1T8vfPnwWSB45fM1gJCm4uDQPp7evTQkfnn4l6l+NKAW28HwmYL3u6xxvKAPKHq7L
         93LlMH+YD46ztIL2FRHDahSQHTTyKjE8pUEsX+1g23aOLU0wgT0pjGkXRCUD6wukE6UK
         /JsA==
X-Forwarded-Encrypted: i=1; AL+hErEtSx0mQxSW3dFoyNirKb4B8YLikz1jlNQ7yqMCzyjLfZazOqwfgOISYC5yXjDgscLxtAsJINBjpqX8@vger.kernel.org
X-Gm-Message-State: APuU4Z+qg027yfW7XK3UoS87bsoOkeQZp6UczYNO0JzlHAeIyG/ggkse
	R/8mPr9jgRt+Z9qgTfAGMIRq8EFtSQwj20XgHFev/EGzlW3HBAM3ccHd0tTHwZ3sTv5na1i9Hb7
	/9QnzvG15QpqkVXC7mL17F/TsLZJOmYrjgXA94tTFoDiwY0Ng1msJc0PpPoYAPqxd
X-Gm-Gg: AYBFou0HWR0Rk9FSkiB8xD7o5d2ZPFeUZlStGn6oenDgUthcaIAbz+fqn2JyNqAieD9
	qAq6eUR5NBg9w1cZjbzbaglsY8StIzLIXljs1yeXtUoaO6yS98Kzn6dxLGpuWCbMXaF4JurqfIL
	KbV1X2JM2fquVCN6FYnuqLRVmGUKJa9JBcXrcUzXm3sJb76g/qiGbU5JfW1c6pD48VS/Vxk+LzM
	3ahMjvKv0PhGOLy2sI3Q3Fu2dmoJJSxuEfGJ1Mw4CrFYF1P9TXengswmFHO+9Kb2NUrIEX5oVyI
	THZZWmosnuOqF1iXr0TSz5GSu0YlGH3v0+F6vKwZuqqWgAaLdQ9CGJH9V4LRvaDxVzyIBwtv4Gu
	3bNwS7MfOmX1NycFSkuFJb1b5VF7ZCL2L+0JYXFkPK6cyJt3UVgBRdv6rHR77b2o=
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780342137.6.1794213974790;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
X-Received: by 2002:a67:e104:0:b0:7d2:7266:2c7e with SMTP id ada2fe7eead31-7d2db056341mr780320137.6.1794213974103;
        Mon, 09 Nov 2026 00:46:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9a9ffsm8948198f8f.30.2026.11.09.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:13 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: glymur-crd: Move DP0/DP1 to
 common dtsi
Message-ID: <qemvfv2jf25ero2ru322wxvvfccipniav5miupnsspl5q6g7iv@aqojsdwh5asd>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5jHzauemLspfe4aACAazgD0lOGEwSIOB
X-Proofpoint-GUID: 5jHzauemLspfe4aACAazgD0lOGEwSIOB
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af18857 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yxH0lVdBoRGP_fzzAcoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX/8BqLnK9KRj2
 jDB4TU6NiLgVfE4ouQdOQooUJBzasFHaEvqEUE9hs6/AsgqYypaqpWb7FjXPQDQQAFRsL+rQT8A
 a5SgUq293j5TLvZZ4iUmd2mPr9VFTJXnBUPVrhNLhUFOnWoPYUml2rVwHq6B7eJU+lUChZ8kzRc
 Kg0ZA0BT6uLTrnhbVjMW9voO1K8KHAufoSVz/PAzEDvew8e7uah3xFX5gTw8Ccz7PYQR/b9MgRk
 w9s+NiOb+4Nr7LsX3dJMcG78YIyZNfEbStQ1kCboRKF7piqVmqLHS5lIzbmWgVxJEQnJ1xxgUh/
 wKTksqfg54ICgAecg2M75rlHC5Zl8CHJX92Mk47inrg8va490IkwqLJFynGy3tsq83JkWwYZJI/
 mHusdTXNySZzc1ITVmJ+Y0E4y7VGiKO0ny4PdvXjHGqGmCMuaEI/J2OE5v6Y0z4i3ERqRKgcydP
 uGhwBqvvxkJ9gHwJYaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXwuHDaopVd0Au
 jrBThNJzIL6FqCL3FdSNese0E+AnVpTf82bjpI4m/cgN4e8FzxZALKSSVTxD11if8UhZLYnZ4oc
 +y1A0S1nHORZ2XuStmEoSvoOLMi06Aw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:08, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems like a rebase mistake, move it to the shared DTSI.
> Doing this also enables it on Mahua CRD (that includes glymur-crd.dtsi)
> which is very much a bonus and not a problem.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
