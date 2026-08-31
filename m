Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1B3BED2D
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164167; cv=none; b=ZflLTKbfQ4Teite+ph7HIkU4riIkCQeMSmbiASk2DYtsdQ1cWZ0gcMirfR+ERW+7gZDzKYX94k2NmnLavsksGFlZsj0LB2fBC+brMk/iATWKFYUqZTw21C4WneSWdT82HZvD00ZQRebLUAyKkBD+HAeR70XWWUmm22ae9VXgXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164167; c=relaxed/simple;
	bh=QBU8DfkTa6n4YbEvZzxLevyquP+Ka5QRnZiV3dhNKJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDAzh58IdBFyGaHm3FeveWwZwlWIwiE25Cp4dsQQVcQwl7s84/BVHCVQtJ4KCGZ47hMppTAn0G5n8LXvYQutaPcuVZHfKVRMq7xLsrQEmT8bLi6dGLFruHO9DVO76QN5qCJ/8cmOBVxTslUU9x1TvjJTy1TtQ6wIrw866pEbvMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1BM63yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tm6saH1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1BM63yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tm6saH1D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xI8L2460280
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LyTcuGUL0Z/mag6M9SZrK5m
	2t3i0XS2stCBvD8t0aM=; b=J1BM63yKhY+4AC4sF6IWQ3XqowqXqAO3d8Rto/Cv
	y2WbTXXMTttJhaC5i7pH+8vYxasqVQAUDB6mQAviLlOc5FqCS3x0r7NjbJgN3+yB
	cMd4oQQYJR39mGpnf5Z5px/QpVQd2vBkRbYuNtIpbgBELf5VsdW2rwWYWBAPeO9i
	SiqOgZwpeKJfqvMvJQ+rcbsMnzddZFlSrU7zEzRzEc7dP3ZEnIFAfaf+EltDBEC0
	QhrvH94GOvLgw+rj7lbXlpfD8RLLGxR0fNqKG8iPVga5W9F+3SnnuMPZqW3nvAIV
	hID/ztustt8Gdux8ro9dGDmhLsrWcNIPwdd+NlPxdgBWxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556r6qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:16:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so486670485a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164164; x=1788768964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LyTcuGUL0Z/mag6M9SZrK5m2t3i0XS2stCBvD8t0aM=;
        b=Tm6saH1DtfzQzTgTXCl53TIlFkf6Vh0bDskV+n1Aj++bYlDU9J4ne5LGJyeZtBMoQs
         LUX8uJ8E40sOmL8pai0jghfq/JtME4AxZidCbtEnahXns2t56MfD52Skv4cQnVpMAu5h
         QcZyfT9Ff6PgEBmfF03TUtBz16XSH1eP3CFLgTLJaexI9xy5eBQWqOUnKNlM5orvt0f3
         OrkDn6OvDgUWpbT7gIMWtpX4ekiLthzanrIi0qi+jKVn9lA6Hy/9PF+iByD5ysrHMdeF
         d8VJgJAjeoH/lfW5kOb7eo0HtRM/kkjp5HNfbmJ9suZdDv4QL01wle/bjh/Y3jOpkjyS
         RUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164164; x=1788768964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LyTcuGUL0Z/mag6M9SZrK5m2t3i0XS2stCBvD8t0aM=;
        b=sQvj3e4SFHXwyz2WhDd5chzwLuNaJgUex9bhyS806RFiDVLCwAl5w4b82WLMV/ZkDg
         H+BpdXoz8+i55f2kyDdT8aO4sj06uQG0X1Z10r4aI7pfwF/JcqNFt3fvoGC8Zc4alFgh
         wPEdheE8lQpFzS6nRvKIKas2Hk4xpVixJGXKIaCQ1n+0b1U1KwYNoBtQ2HTCLcho9sXc
         3VNmy7Yefxs1CFjihqxCKxFLO9sYpJYt0rgYGxkHk0jzvalJjbBwAI8IExHSNq6LgYT7
         A4bO+PCHl7lg7apFaswz66lEsrgrL6YG6dCgnyqQYBddI5N7d6J1VNK2jox0JLoM44Tc
         unkg==
X-Forwarded-Encrypted: i=1; AHgh+RqkDg3Ue0WF7TmuDtBaRoKxaFZm+spPA3ehC06CiRqICYH4FWrzy2NnEnofepLf+ujMToBc1n74rqb4@vger.kernel.org
X-Gm-Message-State: AFuF++kTZOW8fLGYmFqcJuFtJpe8dHpHitQrDSf8x54x1kU2etiZmvAG
	NNKO5pR0VF6V7LZasBGd93D/XGpqO9r7RhLQhDpNYhhZqRZNMHNl+QTkSbdncaP1wRXO4nUwRn4
	eZsiwUq84TToZsrtp9FblUNebSGZHtaqeeOQVIchE0MwMQ31khhlXrvzfvmTQSoOW
X-Gm-Gg: AR+sD10OYqXCozLdcjlyeNkLNEnkmTIbfyKQPVbt7Ng8o5HZdfazYkYMCF0B8s8UpFH
	hS62RL8Ukf2nel7CAS7qB+76He92QvCVe+mSBvcSRjFNpiamHva+QjwHAwx0nd2aKsMc7dqA4gY
	5CoDMC52aZGyLfskzmiTk3veBt7nquTguYKPEs1VORzmOfdXCA7QIBWfJ6NwpOoUzX/KzvgyUSM
	6ypZA0v9RuIpjT5I5saCp8ok3JVxZJjTyVb5rC8pmEwCfa4syfP6EZxq2Ls4CXBeOQojU+JdPlF
	AOmfy+7MotPZlgZKlKdn9E7c4ae+15mDXomxeZsOBKtVsiT4yolgJ3zoLZBklWP9uspEKHRfMex
	tcUzXVHlV8Vi4Cg==
X-Received: by 2002:a05:620a:8811:b0:936:9525:e952 with SMTP id af79cd13be357-9391398ca1bmr2730073385a.41.1788164164197;
        Mon, 31 Aug 2026 01:16:04 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:936:9525:e952 with SMTP id af79cd13be357-9391398ca1bmr2730068785a.41.1788164163630;
        Mon, 31 Aug 2026 01:16:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm20302271f8f.21.2026.08.31.01.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:16:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:16:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add initial support for Nord Ride
 Embedded board
Message-ID: <o5fxldighgmm6djxauuyzv3p42yj3q74e37msw5ephzlgnql62@ptghyorawgzr>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831032103.341633-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2OSBTYWx0ZWRfX2u5lHq7Fpped
 n7EeAn/AXVLzFxX2Qaz2uiCU7I5PHi9hdwuui/Kf36nd6lb/VqmWOcdJ2RySMJIkd41wMuOP6Sz
 5g6HZiVPFAELsnzuoRBTaY6qE8M+c48=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a953845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GNrPpmwhwOQ7cWpVhzUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Is4BfVYR24fZynFHHHJhcHJBh7GlC3UX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2OSBTYWx0ZWRfXxs1Hzgcx+Mc3
 Vxzg2wqLEoYcMPjpwIqdIJWkaqatuA7mRJ/p3c6XwlSq4QiT7yEoi1VBY3MI7qXr7vlrC0wSpOk
 td7bXvT59OmZ8uSaOEolqkibYczUKa/np6iP9mv11FULuzuFH0eBbxrhkQD0OcaFsgCvzbA3+uU
 98DgstNZgjoZCjf0Tm4BJorrDDHN+PMa5YwNQ3qzX+TDZq6+0ERkdOH2e0q411Fllb0i87F4IK3
 iu88fDVtWYQ6ei5ZKAP2/+E1pjkIgHbGBkyFLJ6gi5J8vQ33k4YA1SY6+HPsJPStArwNkKi/8Se
 UBQkpnGETNtlPN64BQw+GqqpBi57FhbEKL+Ew4iRMJiuTmxJT+qWHYoWSW0529s9TqJTM2CWZpj
 yRyLXDd+Wql3lpLmNHOKpBEQF3x+aKFV2bfJLDFGcDZe5fXbohVairbFDkTaw02M+KbelYjABp2
 iqcn05lV2uxlfo9qHvQ==
X-Proofpoint-GUID: Is4BfVYR24fZynFHHHJhcHJBh7GlC3UX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310069

On 26-08-31 11:21:03, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.
> 
> Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
> and describe the board regulators supplied by the on-board PMICs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
