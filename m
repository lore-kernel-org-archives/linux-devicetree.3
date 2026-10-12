Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525D4A0124
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819106; cv=none; b=DqrhQNQv5RPP1AnT68aeMT9qH31HvtkizcnkS+6NpTnmxIM3UGTxy6lAmnQmDkun1YaghhkG+kOqWRXaa7o0/KunDPCitx1wZEA7lRG21m89T0TunjT/NFuFjeSc8UEohah2KuE1T9VBOipJIRvPUg/0h2w4a53LC94zL1qmMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819106; c=relaxed/simple;
	bh=IJRoYw6sJZ0+0l+od7X0+0OrpYFWPVf9diA5uu82KIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=evKAECqKr5AzfB5EW7lMQVQMp2SRzUb4NLOqHQYiaqJuyRTnwQVlgEOMKnSpWbeFZ7MgLD7dY7M4Rl3Ymo8zqGV6bBP/8zctKe/kYB8ohA2fjV3CIW21AvOpYAKiGce/6b1Vrf8HnHkWKgiVTAUdn4b0AWExotahvHJCRecE35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxHYWyqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPuRFudy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxHYWyqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPuRFudy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0JIT1236677
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=; b=cxHYWyqNTwYYIUkf
	WRf4h1ZIxDqQQb2DVmesjtxdwNPtDPf0lu/IZj1ScO0cxsEAyxTIUAQbgP5+CfTd
	M78cjQIf/mlfgXsky9Gc0RzZsl1XM9fAswa0i/jowYRimUrzs9dh+qqB8g5VUxi4
	zClzx55R3XtQZqMF0sCyGS5ay8AV1KcybFo621dZtHMXgXk6OkmSXdweUbS9Jrpn
	I3ZVK3TAqytFB5mXft2o3sZ1/F+jBMcrCg4YzxRQIK0s9WEwfVotDj6GBQAlKGAM
	19LBZiKXE96Yzo8/D6+jgpzAvu1fvBcccXkuxEI05pnGVHSAz1ByQRiBHa+ZOtXn
	tNSC7w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkq88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:31:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cba2460f8fso30595137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819104; x=1792423904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=fPuRFudy4l6K7WxwDBgnIGgbc1Pmimv3yq+qhNnuq3Rm5G6old2C+j1gznMxfAPzub
         hofkh2lrZQEZXOIM9RX6oBm+vlAqdacau/pBz5mongtl3pBOGpqONOlpNYLYasLC9HJY
         ZcHz7fnltmuDWoYWZ4OgQPElHUk2lFdwyu/H9LtQazzLoeMURk/RoCIKvg/ZUVKAJqIW
         /TImz0Now505DNrXIIE3pNVUNLLo+yeKxdBm6P9nP5LkexaXgBAkc/ViWLks+Bs1i6Xv
         kPJKAv99dReoA3uqInm6KLXOz9JFJtRmY27rr9NexEUKJhC6V35Dus57fd/fkzlDDY2b
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819104; x=1792423904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GOYKBkBIe5rfJaEIMD6Cqv63TqMggSTQREHcWWPJLc=;
        b=w0pRjJJHiA8TFKWjkhS2k4ebHASC7fGC4fnR6z8BAxtGGd0Xur7szimchmTU1PWMrt
         BrKzbgOnzZCha3EYsCGb0GkIfST82xkU41coyNjVM8g62L7YhHR/f8aBRbCxX3aEpEDx
         isHM/vaK57J+6wt9lqt9/JtzsWjHxU2wIMc+qI274QBWobTF/yAL/8Hs3Dkcp11YFzrU
         4A/alqx/VJBIXRkuvfyEv7ho8nnVKb2uiuzSY+5DSxQzRHkqxIxy1HBrWsebNWHPBZyh
         UZM9nHh7oWi0CG2xlU9zX7Q7TbkttH3mBImC/0Z21hEMT+fm9EkafyfU7euVloWCCPtd
         wteA==
X-Forwarded-Encrypted: i=1; AKwUvBxXfzKBjL4vXfmLoZ57RvVc8wT+dcNGpsuAlwu4ZaS9aw6+edT/ow23DSbc+93MnlZT3L0hyrlNH9sw@vger.kernel.org
X-Gm-Message-State: AFq9FYIbA0mnW5ThqGRc7DyCwQyQGMxTF2GeWB0+1FMlD2okggz5xZOu
	lKua/g7yaWZKBIFVX1AMH9KgPCNiPd7iw6362ANqNp9CJ2WYzhR6yfjkjyc8YIWTFA1rDMqFDfO
	cWDWLw7lS0N9EVcB/lk1FXPNf0aYZjhVvpwFNQbLhak/upUCw9CmpH+5sUjB6rJOZ
X-Gm-Gg: AYBFou2FW8Gv7TQe1fLmdhdA4zPVSuWN63GGo5MV171NsKKI/QfduQ+YhjkPniUVdqA
	C6b+ZZLBGETfsttjiBovttUVy+3IcyuX/UMkfybXSBS76ZPbIVcrz84ywtUl7t1st9HHmKmLbl9
	o9OarL9Te7zWQCz1IDQ5e6yKgl0UNISg4uNa22VrSXDHWrT9/kxCdkRpKbYC4dVjPZJWEC0NDQW
	0DkR7etpOndRRPpH8GSeAaqPOdjyTUJ0XwJyqyas8zLsDXYrLpB72hHiSHv4cS80XwuqHEGzGn0
	NcqIqOVvBaOJyQYAdfokp/8Bchg1/pL5q5HhMX3N1rhr70CpNdxhlU7mPOfUZMSk1yQdwaRanKK
	KT/yKjU1dfrKwAkDgBcsIpA==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr1958800e0c.5.1791819104026;
        Mon, 12 Oct 2026 08:31:44 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr1958654e0c.5.1791819102293;
        Mon, 12 Oct 2026 08:31:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:41 -0700 (PDT)
Message-ID: <8635eeb4-037c-4ae2-828b-4587edb88896@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/38] arm: dts: qcom: msm8916: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e869c2bb5005830c9ac1d4bf998696ffc4eed335.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX5SeYUYRU1PNp
 17L1LN0t885R+DUY/lc+qRkW0ffvcVsxL+On1nqnD6FtE0wmqEZvtL8NIimxsH96sjk+UwiwEKt
 lTyD8dZOa/x6+vTyOrjo9XR0nDZ4Ra6p5LXmureByCiuZWYdsxVJcyBlokdLUEjVvPgH4/QWjBe
 awY7PMYfeEV/ks21I/EfpD1ISB5xPIH+l5DDmGFg676ngCu+B9Fn3LdeSdYAY+23wR9zR1iUEEB
 5BlokIBZbVE99xM+r7+I40wzUYqg63F1ofxOTiPVrRLkATNCmE3++d1oGBcipIv1RFiT5fwEg97
 DCqtGqV9OsM9nxOs3RsX6VYb8jZw/bqiM1H7IzZhmLqSvcdBg4rIDBiWI0IjCTI9GUE7ZcwIh/B
 ZbmZcmcY/eGaQKeBRw0Nt3wOIBlRfpBtP6sLye4XS+8862ojB9VlJ3pAddxtrNdJlV6aJ2eYWK9
 S/EXcM1jG5hFxBsPUQQ==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfd60 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=-aSRE8QhW-JAV6biHavz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: -jvn9NEluRFhn2eo4EtDIjbhlCd8MPv6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/gybRih6X4U/
 nvTOtZlJElzBXoCmfLVX2KmWdn75uWV2iAOB1GnCMxsoah/3ODxLWERLQKfgsl1wkdsgVWKhM3c
 jGlmA2kf9qbyGD3pKZFQG0i8U8HnPLA=
X-Proofpoint-ORIG-GUID: -jvn9NEluRFhn2eo4EtDIjbhlCd8MPv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline between subnodes. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
