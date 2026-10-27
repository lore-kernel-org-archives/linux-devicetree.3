Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100331;
	b=Pyqq9Zvh5ZALuVREVht3aU1z/qjflLra2GIxQACCrkfBKJ235eFgp1KJYk3NlP3poKok
	 ubzxqh2ovX2/sPT4cBxrHl8vNOOj0mIBLtfqVXBuYal+bornfp1fEk8VoHi3pgXzA/2pu
	 kpjxbWkjs339Z2d25/dV7zTmdA6i4QRIqFCWQ5cSxPJorWaIT1mAh3a9HWosovrYKSJRS
	 MWuEQXPSM9AnqObYAe789Gywcwm3eIbjvVF9AGGI73DU5j122vy7z/tEKU7b3hqVzksJO
	 Vvj3hL84CvhJKjhXkIunK1GRytB0PzrhwRG8HNO/BQSsQk4BR8orlK76ZghIX7EMGOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100331;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
	b=M7G2jHFTcY7H7ytLfdPevKL31V7R7VAQBv7XQwTM1UPqFHtH+exiYblmIH6rCGPHTyMB
	 JJDN6O7PE+PXOfQlNyDp/mxjL1kYrrbFk2WOv9UJU/6Y8A8uozSNPhdHWUoagMzxf7Nzn
	 NDaU119F9SC1+uIKgCAviwaBhEWkPXpMjAbWz23y4xMrZATxiP+BBdQu22UAW5vO/e8FV
	 72z1Dw4kz8Yp1+Y5K/nFYJymyBjmxHfHje+OvntOpGTCPVDwzQj0iLnOsy8BaRTRJ+45B
	 1iOUYHNWUknIadRNoYWTbRD6iyNKX5cHtXDLfV8IvKKsKIqj87e3W98FPfg3CtlB34A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6495F606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6495F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otucpBEd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzZBjmTF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJtO1427422
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jyhYkL/qDxUg3dans9Xl+flW
	G3nvJ4Kl35GuTAw54hE=; b=otucpBEdRZceIEHPz4JfQB8zfOptPJkPcuZRoK/8
	c3i5llXy4av1vUCXEy9RCr0Yh/BUtimx9gZOBSsSRsDosf93BZTdUK5Vr+/+0HmH
	t1uFkwc87jdXxMXwZFw36q/nc8uZjWcTltwDEQH+60a7lmRYdiSegbkn9S8nWyh3
	mjN2QM6FSy5+L3OFwKZMQ2wSm5vLORhOGUdXKVacv9so93xjI4qYgrjdR+et47Ga
	GK2DKgqhnj3/95kaR71G9OB+mh9anESWyF+a4EccMa9+1Ae1+eO2A6C9cyeDFvT3
	P9fHOnq7k9FxEyHmKgI65xiuBLVzL9AAKVTakrXW17N8mQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbav1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:25:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so427981285a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100329; x=1793705129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=jzZBjmTFDTSSM/aY6yrAGRZCeNTM8/6lUk85TxZ821ZgR+S+g4HXdU4mQQpIwPiXCi
         b7sfrpSGHyx7bOjIKDVVkf5EYC6/XStjhrG/4bKw10k4RsDzNjgviA5Jq2Cy6LdCCIPE
         IDV6jkMSqAMeNuC5z4R+XV6SWoTZVfdeC45svHEXW6bao08knMRDZYxSY90mkXLuYtYX
         IRhY5WAu+w2qx9ULM9XvJJcU42y/LEPgVmNad+0/6ro5hvibTIHFg18dU19eRb2BXqOJ
         NRpTvheBoT/Rz37SWluJ7pezNgnWk8q5gl/cCZYUjCoNNW3fFEy39SjuJAHqbxrWnnrY
         3tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100329; x=1793705129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyhYkL/qDxUg3dans9Xl+flWG3nvJ4Kl35GuTAw54hE=;
        b=XlIGbRSfe8RO9EEGkBvcv3EDfRx8PwiyhXX8p5okGcv7DqsWUAaN55yV37C2peAiX/
         NxDcrnskNzGgoy9Mozd94D81p3Hjs4asERPVGirvnmgZdhY+VnB96LW3NorVZ4hEZ7da
         yQOsLQT4QPhwgAdF9zbA0lmych2nNvyRAk1ctsQ4Mj95X6D/w4KHRfmztPvpYpFS6BZ9
         PqqOM7ogaea3/mvdpxyhcb+/xZmILGIGhp5H/d+IkClhsLw7JQ8+wKFqEFZZQKbEZekc
         X2iXSeafbq6AJTBdjWEa57g0hBqGXWfZWNKrF/wQyti4oJIEcfmQnRakMCOEvWpt+jHU
         uDHg==
X-Forwarded-Encrypted: i=1; AKwUvBy5szdXMiHiRai05Y8GVFljjrgb3fvDYAjdu0ml4xhiaXk+f9GrZHdtTcuQjIxtY6/XWg78bP+EV0lG@vger.kernel.org
X-Gm-Message-State: AFq9FYL7upL4TKBMRDuf1jhw3lsgDu4xQAaSHt3y1p7kViElUGPsxVAw
	elKmW24irfwfWyY7iN6azkEHXtqV/Fw7oXjBBV/tPKJ4kNBisB5yeeh1APgIo+foquI2soUbLrX
	c9d2+U3Zk3ph+jRf+RezXr2mOXok5FYpAucM0Or0U0jakqYGW264IaUXfmwFp5snlYTS0ToYi
X-Gm-Gg: AYBFou0o+k7SoDmYLe92MARKeHjjt7JkdBsue6xDkXjCqDMqRNmKWaynkZ/442n3b8h
	Tyo4a76sdmbBDg+cQ9Q2PV76lODDv7iM1h6+NOn5nCdrDFzYWrjOek82++3Q1NkGB0LKTnHFOZu
	KuBvZd+Id6ZsYrcWm4glVQjLq6KbBGwzMZh8lpvjWEkOMRRWPDbJOhxDIQ/B4RqTT4NyE0n9M2W
	3SQn/LF9zYqX9lqwPozMK3JH71b/KiwXGogdn7JH23JeoGsDpMbwkspZp8N/fZGr2pQ00LhcxLZ
	Bey8+1dkfDYC6o5lJX5uZJ9uNF8sH5mq2ZX3SuXEbf+RCPLnpcEkTeecdop3N4N9kdZvOiSrvYx
	Y/p+1MDRGtgad6H1U
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405177385a.10.1793100329358;
        Tue, 27 Oct 2026 04:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4116:b0:93e:4f4c:b380 with SMTP id af79cd13be357-940ef7d28f1mr1405173085a.10.1793100328785;
        Tue, 27 Oct 2026 04:25:28 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm20012629f8f.41.2026.10.27.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:25:27 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:25:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
Message-ID: <7fa3yfrvz3neingw47vkunxh7ft7u3udofeunuel5m4f2ocqtd@lyvt3a7hozni>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXxIwnjzs/5i0a
 N7W7Mhs6LyZF5PuS4drKugNHM0WlARualVtHWt1s8JsZjpxk1DtBzpvTFMsFG6qEDmyfE6oRyFA
 GRFkwSS0w9LqQuaxOaMkvREb+rtBsFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX1POL4qPOIkTc
 xYwthLwvrLxQfIr2KVD9YIUqW474+B6ARwGnVs01cd6idAX6UpLee9SMU6OOEiVZq41lEyYMOre
 pSpAGVHxpbreLkOiMB7XSDJ66omSfz0ysW6armUaV6cuuNSRy7zb360t0vAeFlsOl2Rot4MQz7n
 DFVuuDK+G+lOWzWCEyjUwLhMNaOhZzoF9G1242WfF61OJruc33og/fb4OANb6/J2yGtvEWRClaf
 ybN4jvdiuB+iVrQgNJNUhbz3LDI9mQjqzyrg4f8ikpuUNCdaOFakDpi1kr5KKd1ZUI/3BOrw9ct
 w7Zl9A0C8PUMgtPOkjjxUUzmoYjoUz6BBtoLLUjsryncV6pfaZv0ZO1cpdfN8JGMLGCDHor4vcl
 MIehXLQtEc0ZRlOD1aykflIgTX4o5HqZu8Hi7PcO/7WWCjoUtbrCEfMEFmKxZqUEcqWmYj94+Fd
 s7zCvbiPiQkCZcIPD2g==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae08a2a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fVLzsXKNZF2toPeuA2YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: yd5T0i-FzzhV-NEJ0MWQsigCUKhdBgOd
X-Proofpoint-GUID: yd5T0i-FzzhV-NEJ0MWQsigCUKhdBgOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-26 13:08:14, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
