Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F60423A88
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380737; cv=none; b=NviR7XJHeyyAWh3oOFsIzTp7nUptcImxBbySu+3g/k77YI/bHewl9f0aNe9OqKxT8GrvU7bQXCRTQCYGnz9RRFpIjp2vgMGNJ8bkJPBSvNjtWIe9Yn52oc94YHjbvYis02IEh5WXjmykk4wllcaJoa4o94a2LgQKlYyQ7E3XH60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380737; c=relaxed/simple;
	bh=yy1G2x7ZbOhCmhyZ0L0UtzskcrB5jw2HMJt0sWko6z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3TeYWz2l1KsCr66ntblT2pBaa7FKPmxfK78w5SRUDt0kKfqyvB55ezMlB8nXJGkxQPq8ti5uRossNbBco8xsmrtafAGmIAGpkf1hGVW7RnH2F10MZGPx/y5zG5MqH51uMCyF3sKCOz2q9zIwLF2p974/JQZyIOCpktFUs5NNtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OseKwjKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFkF9KKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OseKwjKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFkF9KKw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hlNV2045860
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuan7vpHDJmdEctZa38UzZ/S
	gPHsnWa1zkAu/XAf5ps=; b=OseKwjKDrdP+q5dR5FAVBWnyflhYY/Drg9YSJG7g
	eUAfPi3bhOjKWT8RbWYthJqeoL9NrG/eYddclzIG03lwaNd8oS/+6OdE647hwL3M
	4d7s0DT6Ct+4apghqaYFx+byV2USOwT7/9ZLkr3Vuydzn8z5AinRhz6mYa3mqWw7
	4HQq4Q8VTYa1ZPSqboith/g6lS7ewDq29n9o3EMTrmOjdsgWJmwwjRVY60ZLv2LA
	P78xd1mTYAyg6VizROdECjuOWshfuTbQtMoCR4V4XzWZx+tlJ9/H7NVTOcgTEnWV
	he8FdxMWvL9ipl9Zg8NwITSfmrxUUQAs1P8orTEdGPwJow==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrntx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:52:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso6901555eec.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777380733; x=1777985533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fuan7vpHDJmdEctZa38UzZ/SgPHsnWa1zkAu/XAf5ps=;
        b=EFkF9KKw7l99aydPg4pZLMt+A7FvR65l7xkit/tVoQlZLblgGJ0JF6plsTengJwueV
         /OVX8a++Cv9/b0NIBnObopicDwOhdUUpqq8hrfOQaxURnRMrJMDl/EqeWPYQDCz6QrzG
         U8kfjj6rxa6P4jLZo6UdE3vF2u0w1toXJls3xynrZU6ZZbi+ynjauipUl4+hyEfeueKD
         asyrvipqRqvN6YTRmRyXXvy+9XI5xKNuNUq/Vadms4EqFVOBNyH0ZTP+dXLQcZE0Wrmr
         vkaLUT+66QRLdCpGAsOF1HFZDphYu23JC2lEyENEIy9gS/LlGqtQBL4KHlJyym/5ttny
         qs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380733; x=1777985533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuan7vpHDJmdEctZa38UzZ/SgPHsnWa1zkAu/XAf5ps=;
        b=VjTvbfA9byODdOCD0hLmhgLLgX0Tvlw1io4/3EIB0pMGNwKoHf/8H1TMTGL47k9fOr
         Ymm3Cnue+2k6kLywRLpkqFngAKZ5OFrYuvXzYEJw0PMgKskAvov+bL877ecNyMAOJuHf
         fGY6zcUVg/X31A3A0BoOncKf0u/Jxev4LJQowSpR1vOobjps/smcbhHG6DGHf2nGMYds
         ZYkVBArpo75iXQp7IB++wCht+OstajLm7GrH5p8chKku4ZN5CL+F4fvkV3x50EJjF4eY
         QqcR33NPpmUyzDgr11ZDdCXcsTDN5125CJ/cEUj8Nsqm4QPPFYg+5YfXo0xYhOSxfgB6
         hlrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tlgRsAfIUPlMmjLwP4AL6p4grS7XCL6k1D/LTHfGOKl/d0ITNTSjnVEQKx5G2+THb+tUjKzIrzNEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2CVPFO4ogK5XGsaQSU6yi1+21SOHLk4Q4BW4F+n5zqtAfmMC1
	lUV6mOBrvutOhuGh0zm5ROHUz+8iO35t+YtrRk3MIrszzJQY1fUg2sA24zggOTxaq6lMjLfDrsy
	zn6132xqqo9ljJgX7OtmubnnkS1p+OVyInOQ9lSUWTH14yWVozR9Qy0yoC9OBYLN/
X-Gm-Gg: AeBDievAuCV5TmgAOcTxH8xvvXV0Fsf+/vcMas8UPSUxgsC+oRFnF+35Z0gyzwiSBWY
	Eh9XRgO02mec+0i9tsiQistEKszHoj1LdwcjFnblvzNk1ZvYcmX7uCLn+RE3j2J7H0JCNPNblBU
	34sLDwsYJh7RJwUEfpEHTPIg17xiMvSN2OyLT2RQ1MsfbSzfdaLha3rgnOWK6vLqskOYZqvim5n
	4Dr4WibVoyt5P1+t2ai/bQIbzDNcXvhq6uTTKQu9jiyQbQX5kBzs4zpMuewyyx6CANJi9ATafxY
	04i43RWje5+/Qa7qWz6aEwqDUK53vJ1a+PEa6retX/SuWI1xfnTeFdCeienmFBEQZ+CjxuLLtTj
	u4U8GDwcc7boPgL/4kmG6XEef1dqn4ICML7rN/8f606hgHO5cOIUqfOgQ9o53hMFaZ2x4bqyGhA
	Y=
X-Received: by 2002:a05:7300:a985:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2ed0a3e392cmr1341463eec.3.1777380733195;
        Tue, 28 Apr 2026 05:52:13 -0700 (PDT)
X-Received: by 2002:a05:7300:a985:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-2ed0a3e392cmr1341449eec.3.1777380732632;
        Tue, 28 Apr 2026 05:52:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a13ebf5sm2150541eec.27.2026.04.28.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:52:12 -0700 (PDT)
Date: Tue, 28 Apr 2026 20:52:06 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: qcom,tcsr: Add compatible for Nord
Message-ID: <afCtdoJrcvTMmyKo@QCOM-aGQu4IUr3Y>
References: <20260427012116.231226-1-shengchao.guo@oss.qualcomm.com>
 <20260428-qualified-pronghorn-of-success-ceb0ec@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-qualified-pronghorn-of-success-ceb0ec@quoll>
X-Proofpoint-ORIG-GUID: 1FJSlEdpzLBGVdEx7eZfEd4-uyBStNF7
X-Proofpoint-GUID: 1FJSlEdpzLBGVdEx7eZfEd4-uyBStNF7
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0ad7e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=l8WEheMYnMOxm2Lny4kA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNyBTYWx0ZWRfXy+n59ea5N3bG
 nBqnXv2RWqBfzkGCFzDhD6lJYEm9Qy2qhRw2AuA9u8z34kqao3MjtQNETgtJbF8awcsEHlR0iyS
 mOoBdrD9a0r/2fKnuogvCekldcxhESODeKcaRWYJoMmrHYtBVVWiYWp+2PZVC+rGaWtWHOPr86V
 E5Mt1M9qT8pPY8O5M5KRA4RnTbQxUBMHO2Gb7aca6JCMp7W6CvF1ikuNVpzOWaRsIzRIhyoVlh3
 HtEPlQ8RDleaPaimfPO/kNJW+z7jMGj/hnv9J7+24V0J8+h6FbWs45LFU27AEB5u4UBTvzEuihS
 +7w6VkJ2Bz2oC04wa5Sb5HMFdoJ9YH8qyQNM/BshFS2lMFcPDH+j+FwZar+7UktTZgaklaiTJxJ
 mP2WXt3iR8i6UdeFj9cPz5Lh8hiHS1pTdDZTeePzt/akri8ciyqsWuxYwhImQdDl2b/f8/9D0oS
 iuFrwcqARYqxx97yQsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280117

On Tue, Apr 28, 2026 at 08:18:37AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:21:16AM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Document Top Control and Status Register controller on Qualcomm Nord SoC
> > which is compatible with 'syscon'.
> 
> TCSR is not compatible with syscon, because there is no such device as
> syscon. That's Linuxism. One device cannot be compatible with non-device
> Linuxism.
> 
> Few other commits also are not helping - you keep repeating the binding,
> that device is compatible with some other "compatible". But we
> never asked for it.

Ok, I will just drop it.

Shawn
