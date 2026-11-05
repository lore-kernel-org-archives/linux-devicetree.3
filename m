Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893290;
	b=s5VJSr1G6dzP+YfihBrzmR6wMIzrP0xrAQjVBCf9zwloL1zGQZTArCzn523flDkUlRtq
	 cfpTLgObq7mDlxVxKdl8nvYnAhtuJ9Aj0nOzo3pHpds2PKicjBU8/Ga9fhUzTvtHK8U6l
	 uxboLYYQPRHL5nn5ucMO3s9TNzzfHjgCyTaBAsyf1lMz4cWhxuUlo+eYO9FBRK1VFHvfU
	 1TtP2V5z3isXDkrC7lqNE/hZg3KCABy+ZfmNyIaw7lfKBodWkBLCKc3juQSopFviOQvtE
	 xfti9QJHryV+dOXbShdzDBiDy1DJCTJawPBebmK73bd2r1fs7x7wh+wdxnvA7vsMJMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
	b=m+iDsFZrSZgvFzhS5VKjakT1QF+TiGPqTLRmjSBKRxNxcnzuLQO5YoSEzspinZbhQ2v8
	 IwpwPWOtP6/cS/0OliAMfhJMQ+Xf1dp4CrWeLCGV/QCbN8LdS0F+MgU5F3FREx6F7+3Z4
	 wMk9xPFPZIQkGNcGs2eMo7LyisZe9cTNt03HED7J9iMTV/56yA61FnTlUU031oxNyY7kj
	 q2KIxVtk+0gQ8PAxsBXgT5kfH1gGrRN1fTai5ckYUlBhpQ+JZ3pvvQj1Yl5CuhpxZ0esi
	 nUj7cykIEI1u7vgbseFHW4MHp8FWPXCAcTYNvuJ62jF9MJ2LokHBVIIf3oNDDqz5Fbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66044606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66044606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGrp2004506
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 15:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=; b=jV35Qm96buL+DzqX
	hU43ReF0gjg3i97yPfe5frMW6EEnCnbpofopePaMSCOyDaiJETNBGcM/+LtODIPl
	+zqdPxnfpyq+015Sf3rcAs90YMRq7Pz97dxSfgyVNnksKC0FElyd2ZGfaCb4cJcV
	qoFXb1qTBaDHymbGe1SA/rM8m1Dc17aXNmOVZxx9HvZRr7gxiK/pJfPQMa3qM5t7
	l8ljIil5whHILqlMlWkLO+U0KkXJoHFjiR4a3YxplPv+NmOlIIE7Kg+Lrai/1Ujt
	QZ6MUkx21fpMEIhA+lHBME0b+1ZLfdLg5jobMLAs+ZXqfGSr/h4HVhYtGkfpE/HS
	Crv+rA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1dwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-945e8a244bfso4797885a.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893289; x=1794498089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=IdTZoXNu1NdxxD4uO/gPZPpW5dNNnXrHlBhOkXkSsB7w1dE+pOaZ1HI4rRje0o7Kms
         0oBxIgGBnGExbhB1Ck9e0IRTfcyc/mHiSUhIb85mNK0c7kPC/9i3cGSoh2ToQsevTwbH
         vh6Yjg2JSJQcLOGQlrqzh2F7PUShcfkjmzru+w9qiTEJlwvrqV/lr507E1uspyrTUxJi
         l4KF+cpGIKveQww5hWQ0RmfoKEWGnD5l1CprkzruttM2SoDChBJa4FwQgLpByuwvflJO
         YmLEX9X1sirM8YiIS8dy+zLP4GDNXi39n96h9S3Ejty93Dc078Bxr6kWMlKkmd8WVYVB
         THJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893289; x=1794498089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=vyB0eAmFAFjwIgx46B0JXeFgf9PEIJeytsPjULV3m5Hb4pLzFOtpXGpO7WF4gtxpCz
         ozRoEpZGVqrC5tWvXC0pNvQkDx9PnjxeNtoUvI+acxyuQveJ2Fg1RccH5vKPY9SMvxhf
         Uh0iuwGLk6gCy3Ac32mpcX3uMeN8VF3tuZCHWGU+KUIKdVGgJe+7pieh5FhdNuHbjnSL
         1SWOV2OoI2LYdsr0HeaSt8XlSSJZhwjccb6Mi8eCwnHFMeTQsqtSxZZdz270r/WhyVtP
         I8nXwYGbYR1BSJ0H9X9zEn5KZGwzaoorefl7Lft4hKsjTvyo7xdfiD7M+P8cnxiJ3Xrs
         YQ7Q==
X-Forwarded-Encrypted: i=1; AKwUvByRFIclHpLBbfUngQxPn4lGKAm5xuGB5bhXXi7+7PjRe2ZpRrX0RdeEJLiZQJneHmvHxfX1jOm6iNl9@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ba8yjLJ8ih8IWjetb/QTCdYT0YSZxRL4aAULwSC4wWgNYXYKH
	CbFpjBdg4kTvP/dmW3lX9JfgKOh4n1L9cHrNTpikHlY9StChHLCeEr+evKPguMxpKytrLJfrVjr
	Xh2Wug0YESNhjbyfVvyJ7RwXGS4a5SsX++8ooYnyrObQwniOJfivFq6Jh3ax/70N3
X-Gm-Gg: AYBFou2UDwaHT8bxVoJWV5DYTmF7bwotbnkNHGULeMxXjfHZFYJ2WjzDPKGv9NdzQA6
	qACZkaJGItyhKxREYb3JW3wuPWr/yP4aJNyZnofuFvE7ExdNvebRvLL6htzVSYDIIfLKW2GkuVf
	DgWtB9WwpMrmcJQbaMGhpKhv3oaEnllSuDswTW27vuTRDCeFWHQ3s2FN50mFi5J7e3lldgw7h+J
	vnEZn6b4FiBchzdYQb3fV7xWcvxs4C0aSYf1ELFFzbb9Lx0n7HU0lhQftNu3Kx0wPc8Q/+d61He
	JhFEuuyHfXNvSR4xWLSuQU3YZgg3XpI/aQ0VrfwtfIvrdXY63X06z5w/+tGHXKJzI2rxe8o0bSn
	eIcgheUAjZ28JeFsP4iC3vw4pT1jgQJ2Npgunl+WJ2Bh1AsrCZltKtg==
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911442585a.4.1793893288354;
        Thu, 05 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911435285a.4.1793893287451;
        Thu, 05 Nov 2026 07:41:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac94e8bsm1729432a12.35.2026.11.05.07.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:41:26 -0800 (PST)
Message-ID: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:41:24 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXxg9bHcNno+d4
 muQ3tX1bmKtaMRCz5YZncOaOOQuX70JEk6LkPY5TmhwzPUNnfEBGq2G3HHy0J4aE24h5lHp4UxW
 0DI3eUtiLIJy6De2GGHEtixh/G2BbZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX/NojlQz9ok13
 7/5ckJg3uFw+DUE2yR5LK2dHRTK6BWDdgtj3IZOVW9EU+dWiNRaHJsgoVHkk/3EA7i8ZNyvNvCm
 ZyyWNpF7v7szN9GhiANtBDlGMvfjFeSDkOWdmsWB3OYcHZtYlA6m2krzxeW4ly1exHxfWl426P4
 nKm7l0DJVOH5zmxEO/55hGfk6O3X5gJ5i0P84FIPIuleUvSfNhG2XEc3v3oaJWonqSzf340bKTo
 NQwy6ypgj8BZ8RcGseqoDYoXicvYKFTzzjM6uVRDAtx24e3Ztym9QmXQJniU16NUSXFtAq0v54y
 z9UTkPAzCRki7evOMX3VZNSmg2xsfrInwMle74Uvc4mifzclR5zXUuvKJKr0uNmN3HZsNd+W+GZ
 cHD8mQcidWWKDcsaP2qzJEV6jXyPEZsI4tjsFN1woK+aGY0Jmys6ZnAnmalsP4G8hYD4jus7zau
 iNkBaPIFXTZCFdyJZcw==
X-Proofpoint-ORIG-GUID: ijAP3z7o6z8S8XJH-Xscy_u1aJ2TsMHa
X-Proofpoint-GUID: ijAP3z7o6z8S8XJH-Xscy_u1aJ2TsMHa
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3XAOltBAYhvOEWtE0EsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050062

On 11/5/26 11:02 AM, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR

Can we scale this depending of the real speed of the connected
device adjusted for the real data throughput? i.e. if we walk
the tree and min/max as appropriate, we end up with say 10G
wire speed, out of which we can shave off some static overhead

4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
any configuration.

Konrad
