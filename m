Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9894921BA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330173; cv=none; b=C363uqZTqPTlj3qkqKIMFqYD16JUzXw7JWcWV3gJEiln+qDvkxp0782LXuSQm8av8/D5WHM9HN57zA4kVwwey60vZcIYQQ+ELZIX/IsqLPusFaTsN5+SOgW48STsmJSOJhw2pXROBw5lFePA+Xw6m8RbmumBDto0KtHQripPUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330173; c=relaxed/simple;
	bh=9KU0+Qh3UhQzV4S/AeidafHAtgBcfgMjLpUHxSSz6u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoeglypHK6fugyJ2tZFGL6VG9AVntygpvmMxVVw04APZu3x7+1X1HbRrU/jPkt9tohbSyP/meMYUg5YBkOQYiE4XNKFQjLl9oCEo/fwwaq1jS2EzSjGSysHbeVjfVPMCu1a7SRJ4r67nwMH56FlUwQ9RW5lCWk7UAQVVZshrm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQXpdCcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAZm5w9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQXpdCcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAZm5w9j"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gsdm160025
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=; b=DQXpdCcOo89USyBt
	8XZNqqdIN6Uc7qJ/6IOlP74kJALJN6bjVoLmq0R+FZPKFKLPBFp8aiv6hBsZa+rz
	1IjheFNVRoS9AV4wfiswBidnQ7JoFfcs0ubVq+a+gJmtXb4vTRuQXq7cnhFHCUR9
	cvxdCe/GEfolG1RqOOFGLWV9wQ4/gyCPCESOXIHVWRfFoJl654MTB+A+F+jJhbcJ
	9xnTTASdXKR7DoVapAWlLnU4lKuAnVZbEh9H4Va+BV8pNg3h41oAXKQlebnu0Qdn
	Hh59yagpr9OJ47pNCBNt8Da48V1RYyeefgHHXOqYfPuzcL10xS4Q/UXQwiPsMR7w
	5/xdVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr1d6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:29:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9c0c4492so65043885a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330167; x=1783934967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=aAZm5w9jOKMYMllCZPBgiCBwqrxxkXCTnWPXeWJ1DvVxZcqWbQr7B+o2o17KmnAEHZ
         g/i/DknjTPDGDIdx71GbvXL6awt3LqPd4E7QFlSGdbmSJkfuYs5jSotBdfREpmBlrRqV
         0mPJfoxz4DtJDZOEo6rRx7ZO7GmCyfLwQPa4RNMVpUPvPfEEEpBedkCsxPsWystYQ0sU
         OkNuIxP9wInGmKAsjsjmUPA1FS86a9+1F4J/vzdNVYH243xVIsW2piCpKCyhO3hfy8ZH
         DpsH3VGC01AbmM8DAVAKNkQUh5DIV43ceZ2a1aLp/1p67MXXTq42OdgMHLAv+Ueb2O3c
         +1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330167; x=1783934967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvz+CSUyzlqCqRHTbEXL329YuOaKM2li7h8uXiK7yDc=;
        b=dgL4srTckoXfJIZUef3N6z0/gjtSH+jFSzapBLA1ymYNLHqJuEBrPOCzze+O6acvXM
         jJUyKp0fYHKDxmMag9TLYl/jbd7jn7a30bYEVXl91sxpbitjFdCNREcSjp7W9oB5v7Fe
         9Fh4Htor1PPrhxm5/fs0S19QAwUYXPwgq4nMVZVIFKG3K/ZsgNGzbL01XSLbRSgpc7nJ
         8sOe3SBH3CUBtePhKj+4BM7IHuIvSJupDA8UBIsKx/lSDl8enAsj89oWnZn7L+q/Cyns
         WqHBFY3CZa/BjdptGXf3nSpQFDVqUsj3o47ls88wSegfOYHh5Pd8gWIUen0qEK0ope4G
         UPMw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs797k0LpzePRJoQcNXP6PR64lFN9q88JBtMeLwUHbRwcy74+9QfE284AIpIkgz9aDmAziJjxqLuTY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd9jBsXPz9LnSbxgJ0qxWYUGlsBrOjztP0C1wLfMOd8i7RMo3+
	wChqn6b/7ifR+H+sCpeAc/iQvber7U5dW6dkTVb50ZoY6fTy/RJp77XL2bxIxCjMoGR6MoUKfA1
	PaUvKUmAftOAsgt3v6zG21B3DwOVB7XHm96t/dnm7ADg8IOg/fG90CnQ0XLcEc6Ij
X-Gm-Gg: AfdE7cmIMqf1xRa/sF23NeiGU78wU2bOUz4hn11AzfE5AQgL/8DHTACOXn23WVVb+GG
	7B6YM9XokXTE3jay/+rTAHfdZnDwboYXVdwCsDMCuQ1EJxKXGZJ9Cg62WCyOs1heYzVcVCJiDxm
	9XxQOoW9/axpAKYkrG8+TvIkPSqLRDnFVZk3eCDyNA2wJBlQUcDmWcXYGwQ7PH2t9kHXxxeEWIB
	dN0uOjA2E+3WujIYCcDONfnqZ2HrOjIfArHgmPAxtuqqlKextzj3hJh2qspLF0+AxzdM1Tk6C3d
	FuzGovw1mDutXVxgPuxG1Jb56P8MbyiCBGMVF8VDeZCyRwWe29bLOeqnKWlTPAhuMi83jH54XML
	cqF1W4ZFEUryxfO+MtQo47KZ3zl2MAzYcEVQ=
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117511cf.10.1783330167401;
        Mon, 06 Jul 2026 02:29:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8c9c:7de0 with SMTP id d75a77b69052e-51c4bf1ead0mr86117341cf.10.1783330166902;
        Mon, 06 Jul 2026 02:29:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4ad4sm3562261a12.12.2026.07.06.02.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:29:25 -0700 (PDT)
Message-ID: <8d4f10ef-602c-4e1e-9711-443a5f3fa7f3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:29:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tDsjRNLNWcE4TyAaOpiGgbTTg30wN1sz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfXwTEdo/fggL+E
 u6aurcOcUi7km3QC0IAMon9hCFaNtkXbCwdDvxXKL6cMiXETLTum1HsVjAVbnb/L4Kc3FDyoWiW
 qXEyjmpC+uMCy3gRlfl0lRmc1tP/JEndAvaLB2Wj6H0+l9E77yU1lsHuUETSTkX4BJaANSoQfIV
 nBWyK9mIRh/Z4ZHi5tiLU7m9DPaI9FB4GWwEaoppgniBGgLFAAR59N0At1j4bEZr/Q72O1oG7wL
 s0AxWbDrso0a8eJJ3YMDvQEWNIrLN0UxD3Umv/qjPRWUhPXen2nAv00tz5fNpr4W3W4mle4F7EZ
 D3RejMdwWZg6YJqy2fKt0Ky+n+f2AzCMwPVLlpHhzTxjF6ssAxOFEJKUb+Pv8xR4QqCLAp+NGhk
 mUWbcInRfPjTRWJh3+e3hmnxpX+QHoG/g+ceVrD5QrvIkaf5AWT2WC2Hw9c7S+Rz5uSH6zxNGvx
 uOxqO+9n8wkZ0QjJZgg==
X-Proofpoint-ORIG-GUID: tDsjRNLNWcE4TyAaOpiGgbTTg30wN1sz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NSBTYWx0ZWRfX5j/WgYPJDHC0
 j6JyqHyoNUMVpttmB8qBlGXT8sF4AQxM4odmap6AieM+ohrCdxRTpEc1GU/IVF1ouEejMcSQzd5
 sHpQeUlSFTD6+LyGlBLQ62CzUusS5I4=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b7578 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=so6UWzPJPvBV26MIzc0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060095

On 5/1/26 7:06 PM, Elson Serrao wrote:
> Note: This v4 revision introduces a design change compared to v3.
> Based on discussion and feedback, the binding adopts a child-node-based
> model while preserving the legacy top-level 'ports' property. The
> child-node approach is required because EUD needs a separate OF graph
> per UTMI path to accurately describe per-path role switching.
> 
> Link to the discussion leading to this decision:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> ---

FWIW I've been running a slightly modified version of this on Agatti
(modified just because it's one of the platforms that needs one more
register write to enable the thing) and faced no obvious issues.

I'll happily see this in the tree after we're done with the paths
discussion

Konrad
