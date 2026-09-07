Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C138451986
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777527; cv=none; b=G7H51YAxkPOZkIfjE6nGFaHPaQSa49Ooprh6fQT/I0RwPZe8UaBcTE/DH5/LREveSnglDln9K/e8hnKMYjRVsLqKIZSwHWBjrv+4meO1VjNo1raF3BQKwRYP9VvmHoYGK4j7MRRebN8d2E9XMchw3dTSd9+6bTBMwMThrnTtUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777527; c=relaxed/simple;
	bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0ak3nT7sqwbHNrU6xq6FDl0aJdHN9IGOksSIYWffryN94aYXSSAsU9WYTb4VV4P069YuvaWrAitZ+otomTSv24SBdxPYKJem/hl06QQC/TD3cHPGkuwG3t6caAF9KfPUAMQh4n4s2yNdKfcb7b83Q1KWadYQt2EteVzU3Yf16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MrY+zChE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y5mDQLQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MrY+zChE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y5mDQLQN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879brx33618771
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 10:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=20LrBTk7+xHKrR1eeJdTqXRk
	QeM8O5I2RAnmQi7GLEw=; b=MrY+zChEQQm6qp+doFuSD5i4lPkXLV1rvUDW5aH5
	rlgfO72gukLe06Uu8jwT2Z7WUObGCbRR8q+fOleBCteaQj8pEWheGLvWGcg12OfY
	PT2RKNCF0Bc8BE98HfJA8z7ysb4N/pqzLB7GXsujDk/Mi6DkiV7hFA7IHlAMsO+C
	/6xZdYXF/YfREQEdyPLZpYeFZfRM4e6PKEgRGhPeaUIrfKTwTcV0EjgGvJsGh9Ps
	i/uETnId/zeMUZ+KmbZjmqsSDe8HgYvpPmcmTPROPABIFdCBz0hiDSd4hhQSAgYU
	r3RaWb/G4DMSZsyjdhhEZ9/eU2RHUItfck52mZv7MPdVQg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygnmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 10:38:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939281526e1so232460885a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777524; x=1789382324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=Y5mDQLQN6+nPMpCXVGRBFVDONlu+HnJhYaNNCSwFG+SdbqMvLtrPPl7z0VGJcC5T7x
         3d8EQJVnhBMpMouykS55qGXB2ERn1mRJ3BbKCSCOEJCJ0IybKT3cwg+UzvC55NiD9BUJ
         OA1W0+9ffKdQ54TWY+PRCxpEvqzpo9hVg8FVWI6y2vYTJJUkp9S1ZOVhknBbZkUvHiZZ
         NB+fcxt/im5qpczX5nTcJqkw30Cjn+b5/ym0PY0iNi9ppwul7WpHDul7sdOOT88WgpD6
         oS1F1QXJgBwxpAQOdd3fpTxZ/0Q92nBHM9l7ZwzTWithYzph6UdNxJM6WdQxHET60Jov
         BzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777524; x=1789382324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20LrBTk7+xHKrR1eeJdTqXRkQeM8O5I2RAnmQi7GLEw=;
        b=VmbKbjkf966Sa1Q4s1p77kQj6eFn9AW4s2zJD1qeOIIcV+PEuIrPHrNz4z25FGH+j/
         vatS/Z0nvVkY5aLkSbWk6H2ta+Ya+UW5VbWECZob/C4Tu84mF7MKD/vFduJgI2l+77A/
         sWgSaTksIO0dg0blOF1NAJOXSZVEeH7cS/tUq8Mz5teA860oM+oziGgaHxRYZNbxDUE1
         z7hChXg0W/dZ8kL1msxp7ZsK7CuL+SoYJK4COF/DC/0ifvedF110HrZ3RwUWD4OTwXgO
         Zb2Fl+2bgFF0Fyb/kf0NP4VvPDLZ0OC9arQ4DHGMjw9WWWRJwh72CMLq16gUz7jZv5h/
         UIQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcWefhebXeYw4ius+WCzpl+i4AmIF2mMimDUtgwFgKZx7dfvSTJ8c4t1oxzgdU/tqDCEvtdeY3EOzz@vger.kernel.org
X-Gm-Message-State: AFuF++ntlYNSORRvv1ZgqYA75ro3lwcLaZJUXBbXJLZlJi8mTbYEx+zT
	7YrHmxvP2iiAPXf6YZkNmadtVjDm2yCxamn/dFtt5EpE5q5jsgM34Jv68Theyy5z0wGggTyq9BE
	pVCm7MbDRGQLpAeQJfTDqlXyUTi/hNZADv2U4iDoxiLdsqjMKFxcs9U/BcoMfZk1K
X-Gm-Gg: AYBFou3uIvfkmGtCeBb/l88V5yQLSDYlhZp3XyamjvvGNKhPrGC0YsK1z7ljlu+sRon
	Z/eOgZtIwpKug1d6zdAguw9uRweCneVLdCRBFzOSnt2/34IGcPL5iBJ5GTQr9FfkIk8YgRq1Yqt
	3dUcYwvdz4s/l5rFPJYCSoIdg6WLDdcjyrC/sNGMf4Fu29RnajI2NTrT+43I5y+glhcryPNTDWC
	Z4aH3WVx/3UvfYu1itX1fL0E/v6adnJzPi1odRHZNCoHlEcjXxLgFi6fiYuHj52+zL8N3tiC1+w
	LEaNMMxck/9A1Oa283R7Naj9DmiKulTfkN3eO7o+3L+3fY9g0ZNTZ//+IONLYgHFo4VWpn/5Bm5
	MA3TZHnpwpEFlwQ==
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091272585a.14.1788777523715;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr2091268385a.14.1788777523097;
        Mon, 07 Sep 2026 03:38:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5941cb6sm1280275e9.4.2026.09.07.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:38:41 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:38:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
Message-ID: <jzc45x7mqbcxon227yv6bthbx5l7uicz7susv5kqxbaoammqf5@lr5cxiqrkrfa>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z024VlmsH60FP4zYzpCM5shbWZtwshyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX39AkWcr4HHf1
 Tq4rFkeGqP/eHhKlKqOzfpfafj3x61Jspn9npnTSOe/3BF9FB6Pkel1iM4Xch+y0slmHlGQNJcx
 NpFnaAoCX28zccVS9rJMJlinfJGmQ1yrGnCK3W0v0n5Yw1UZD9s8zHCyBfNHrbvAW1NxzvsIJ29
 ESBGEHlcawFT2NFpq01YOwCtdS9ohyT6c7x3phXzEp00+qg25Ul6TfbJEdwv87Ugi3JR9NDkFmr
 Xu4PmdRGqIq8DBhZ2ViNVDPLle/66Bfk6TcRt2ZsC/8shMaK7fgn3KR0x1K0VlClnQ0nVJw72T3
 xA5Sw4vDSGzRHSfUS0TBt9qXWb9xxmu3Gz5+ORLrcDvPSLQH9OLH2U31sSRs9OffPM+m9R4LGb3
 M9bno4uhB/7mboOgu/Ug/1sjIq5HEROkwxUD5nJm/dDAlv3EQXuOs/nYjU5Q4lADNTNoEs5MzXp
 2fWT4YDegHV7NRxzung==
X-Proofpoint-GUID: Z024VlmsH60FP4zYzpCM5shbWZtwshyE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX0CvzDFMy/TA1
 ngWpOhyVOKEaoPe2+os6Ak7TuAaMzhCxGATBAfLZM0VBDcZoiL0ePuPxF0UwCJwjevEA7be7q5q
 X+FkU99mepPzJkFjzTJb0htX2e860tU=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e9434 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JYGUOujTUg0PU0TV5iIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070116

On 26-09-07 13:56:14, Taniya Das wrote:
> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.

Wrap this line around, please.
