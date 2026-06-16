Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFAD46AEFE
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626649; cv=none; b=flv1J1SPH3L4JuBRm6AO+iKzeRAHj5BqOP2ka4fCPib2TvW/6ii8UQjPTqukBifKI6FrgEdscbnfPtZJ01exsHWZosBGhayCmf3hzlhHEiaQ2gqYFKcWP6Npef8tteJhaH/RsbHml61LkCBb3HcNcNgZ7quVr8O9zaLbz7M4b4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626649; c=relaxed/simple;
	bh=Gpu8Y3KK60SVZzWxPNeDmjgN5yrbsKeY2CSqd06xT0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dlk5koNfg7Dsz5f37MxbFLmT3sACOnbJrVlIO+fnLQMrK7ywZNu9yJiG+orDXIguy5LKy2SzYGKEbUaBbvMURnbxjHGXp6K3oEl4rMXR9qAMCUpqpq4t1UXuBwjh4DIROHLffmKK+gAFsAcs0Sf2petQf/whuYHHTNuqC5cQDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbta7TdU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hinEEWEr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbta7TdU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hinEEWEr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFctXm3595798
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k8jmCjdOTgQQP3Z1ADzlmkhE
	ZtRTG+VtASOwyDTz8jQ=; b=gbta7TdUF6RhAfaKwmB36JsrXQPLO2pBds+OD6d9
	nKHaRAyIgTz7NxxeT4kAsQUIJCocUvOAmgffkmvki5Q6VI3Rd+b01RToTZqEVwOH
	QzNgjWF0gFkGKynJEPD7T9WeZ5MzyA6jZlfwswj/hacGUZrT3W70KTJ5cxP1TdwB
	+WViBjJ4SABFJVK/UPel1wBy3EP2/sYRKCZA/OC31JM+a+tKMjwRtomKGhB7EY1x
	tKjpS23Yf3gAdmBq6ylx3pkJ4U5UA6EwHvo0b0yPfS6mV4lDSy7z5Z88WS+H7JOS
	Zl/21WSpfszSNfTgUfKo44yX1wJogqbhzxT2FC6yj9xGXA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etx8kbfs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 16:17:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97955899so4598807a91.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781626647; x=1782231447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
        b=hinEEWErZMYYuujvAd1yNAQCgAvUBQfPbs5hBQ1RRr3UdA0BOiuWi1Sdx7E292kzen
         L+caUY5W7RXyDGCwhoOvXU1fzfdLyoHKFrVreHMNs3Y62N9v+18eLDOVLPs1Ky7dfper
         rbLEHOgWPfjioNzyRzMw08KtXADuHmZNAp5T7JnY+Tsc8Xt24P7KfyDp1y2/Qk8EWEuQ
         nf0TFl7tnB5ZjR7FSe7GGi7TRO/OtajFR7ihHHYC7Y8szzqfVaMnpxpJvLt3zavT8mse
         tA/CDvZJ3R5s1dhtfOWc3BUJ2erT9bcI0hf+6LiRbER0KGvRdUAHsXu8W/XCEqm+uvCh
         FOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626647; x=1782231447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
        b=ZdmrvtDTpOh37VhBzciGoK9WSTYKtlXHl+ATeQjqEnm5wwPLNhwlv9gFG9yiGwVxNN
         2Cr34hHrsh7Dsm4txdV9KKmPXuud5/EHcX0ghjE8BGI+X6pfhLHlVRchPXOXQ6xOeASc
         GeR7QioQl1cITHjUtyiRxVzj+IO22g7H1N2aq+z7mQglnWWdfWLyjHG9ABS6e+WlcaNr
         n+OexpDDe+tv5271s66l+tGUNXSwr6nyLZVyj5OZbqsIZuUD6J+h8GiuHax45Er6c+35
         dgLyuz27uWCZBk1VkGLQ3az8tFbhhX4NvjJBJxCMR9XUX1VICcjym7Z/yaxsM4FDeQSt
         s6Ww==
X-Forwarded-Encrypted: i=1; AFNElJ9OMnjaMdbmzANiFLeFJWa5TZ0PEYre9HNs+DgZYkGFlD9m0GMZOEbHTK1vgHf8Yv1q+BWvlesITt4/@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6+G7sQcd3T0Gq6ryU+irwRcLyWIGMilm74QEIQGfUTUmYEq6
	jw0k1Gfi6WkUYLKVOaps807oyXjenVUyKKQpDMTYESHHLsSdzSj9fnxiaheWcVjNLaitiddibLF
	2z+xs+ecMflqV4CpSzjuszjhGdGiW/HDFdPjmsyyClYzrKEKyvj2nwA6XHvq0kTx5rl88Ajvm2X
	Y=
X-Gm-Gg: Acq92OH3WAITtX+9tTXEqcVJTeSXQzC8Mxvfwz8qwxKvb2pSvXzSQBM7I6ZGPTypuSP
	j0KdaE1XI3J72v8J5eDU8+u18vlyr5s7CjfNpsFAk9HgEaCQM2v5bPErrNrzubo0tpdAqOpG1Fd
	1+rEqzWGH+WmWss51G+DRkMlpENWNt1Mal1zWJsUF3erGiSw0BjmLr07BIpSjTRSbdvKpAS1X+M
	eEmtXraTurJBnLhD97IRYgZUrvPr7PVVEgK0NA2qE1td9jBqNtt1J4cIxsXmqid5VV4j4MPagJb
	mn60hqwcpCB5LjOLLo+QVRfZy3eoUq6TuGJB84ZSnNwFs+tkBvLkEJRNGyNBa+FozjDuZmBdaVC
	7yPVfsEK4P6L5wvg1lzM4IOZ5zT9aq5AcpYc=
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37c93969a18mr139698a91.20.1781626646581;
        Tue, 16 Jun 2026 09:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37c93969a18mr139656a91.20.1781626645979;
        Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm12281484a12.0.2026.06.16.09.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Date: Tue, 16 Jun 2026 21:47:17 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
Message-ID: <ajF3DUGYPBs1iU5f@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
 <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfX2krfxjSvSiM1
 BdudfNKT5y1k3ry/IMEZ5eiYEJ2g3vQ1VRRELjwuPIJERe0JxZ+RdqKBiOLlTsz0FCh+3EXvNdj
 U9KfJHkiy/oJd1oMKYw9wR6r9bgTbXtQeMnwaDUNmsOLYG7oOJRFSH4zbwFjoszU50Qx60YVEyd
 o6pKT2fWBL9UalWEyogUUAiaoJdbvy0cscKJDFcVllVN9n/cxm1dtlJ8SAQ/uoESvAUwgiDae/V
 fKP+LCjhUnh/IkyAWS4GeRY34dBNFOg4gmKxqZZJW9kOEzjPpCkmiltj6U7nQwYRqsfIf+uqnDn
 J3Me7W1Bk/FuA4hZ9PKeuYVvMpls1lYmIRTaxqkaoSlr3MrhNfP/SyvtWATX/7/cblSnLZZfDAc
 TwY4ZySw1SmZ5jGsTL6z73iqUAsLJCeiVXT9Q1PXxobr9ohFA6GxHg/OE0g0ZkhIz8annVRwls9
 +NJNcWi7a2iNGobzhfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfX2cGdLclK/Gpq
 pSbk9eedb9vMygziSvd7CrA3eNMnjMhTtZ0t3VUuyMsjSovXNa/HoAlpNt8K8LiB5Ut+mDLWcls
 zzvDUp4RGwqHwBoT3QRXpWXYF4vlThs=
X-Proofpoint-ORIG-GUID: 6y5Zg8JvxKkQXMK0r1507piW2-TFd7dN
X-Authority-Analysis: v=2.4 cv=dZawG3Xe c=1 sm=1 tr=0 ts=6a317717 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=267an7I0AjvZusCT9TAA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 6y5Zg8JvxKkQXMK0r1507piW2-TFd7dN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160166

Hi Konrad,
On Mon, Jun 15, 2026 at 02:13:05PM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> > Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> > that must be enabled before the DMA can reach memory.  Add
> > ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> > runtime structs so each compatible can declare its own set with per-clock
> > rates.  The clocks are acquired during probe and enabled/disabled
> > alongside the existing link clock in ethqos_clks_config().
> 
> Sounds like we should use an OPP table instead, we can't just do 
> set_rate() on qcom, as that will not propagate the required perf
> state to the clock controller's supplier power domain (i.e. VDDCX)
> 

Understood, I will test this out for v2.

	Ayaan
