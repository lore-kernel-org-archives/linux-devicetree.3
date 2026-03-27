Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED73EB80E
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774619122; cv=none; b=ebqqDkac9rcYPKslB/FQjwxH14ARDzzO9y3UqBv/c2COW9oS8dW7t+4cjmDgKGdM9fhX4iIXk2p7AqN6BkCwroRM2arLkpLoEZ+ITej1+ewAxT2Ovy1nLJNPMr7IFU1YqOnbdqKtqgd1e93/ZyBvjOsxnQGBLpSN3gBjaDK88ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774619122; c=relaxed/simple;
	bh=DwcUac76vV09RAO9Jg0ZSLv+FZ3B+zJ71gF7JbdPL+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4hDcgCrkKcVrKEYj1v7kZ1INhcXrQu34B/ZaLCpRnqjmE6z4+Y7I+mGt+a4+EEkyqtKmtpQfiV14UbOLobPyxxAzBfbPEZRsq3pEcibPfKoSYTBAZY8wc38e2nr8Y6BzyKKepbW4i8qLnd7NRkTAyRPZga3uc93xjaEXnyadE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQA04hkK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdiHNrsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQA04hkK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdiHNrsK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhE0p3084632
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XoentRkvS13HRF/jsn+wflQZ
	jGBlnUMdtdu55OVBkF4=; b=JQA04hkKdNHWKzRrGCogVYxXYRgiHrJ0hToiEp3u
	o4hgKW/AMmARNDzGoau1KRj3t8ZZgMXESNSmW3zys4qIxESWOsw52zhjN0PJl7Oz
	rK6FOEeYiGEOs4saPVuXcj+1PQtXQC1k1dHiJyIELOGd/3E9Tv+Drw3Bllu8JEUG
	fWBSY78qx75QF04MvzaYuNvXhrL2VGP2yZgYUkGhJ9da1A85nDHJZTcr2nwXj6qZ
	WCimS5g1pn02PHPAlf9LvEc3kLjjqOHPu/m1cqbJlDaowmJ8UdociG7CviGBvISv
	Lr9SEX0Cs458i2GkHURaUWwZcr+11GBGshtvuPC+RB+qmA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn11j1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:45:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso60775251cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774619119; x=1775223919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=BdiHNrsKZjUKK/els+9dW35kh0ADht+DwQCunO1o1mup6+qPMJ32INqiY5AEJ/W8eq
         PXURmvtA1sTGQSigfOHkK/zt7yut5Tg21U0KpmyGhLm2fVFEgWK95csZhPuKLpv1fxNq
         +ekLpBJiAb1aDNgrl318Sbf21bXogRypVI3qcOOs5yDlNmFI4bjTtQ0X+/ZCdZ6YmlAJ
         3lBuJv8lyxUvxKUr7B1tP+WIorPJ+edJ2/L3mNIH+U2cEaTWiuB1m3DdaHngt6wqyGg4
         9eZ9FTIaQTVOKGu+WNiYws7J1aX4xHT/bjn2c+ekIN5ZuG0zsU/yEAg/N3EA0kPp6F1+
         L/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619119; x=1775223919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoentRkvS13HRF/jsn+wflQZjGBlnUMdtdu55OVBkF4=;
        b=tU+JvU+K/e+cFVqKRfIu/6/XEcm6L7JBP1MSIaoT9OBKPaqPXOXxKtr1LxlMb4bVK0
         RYZnQ+kAbn23Yv7U2UIGJ1ti1IovbTqpZUD8YLKfX/RCQX+OvSufbis/uCxZKRKDgqzr
         8ORPVK1wBlswhhTqgpaayiPSgxn/KKuHIdiymJz8zwqLE5IgkgVy58rEi1PwDuvBfDPW
         x6A9qbmZrG6RXqkjFDqOyaBOYtBnx0vJregDacgU9B4lvCFJ2BwZ2vA+NgMRNPwLOKD4
         lP9ys4NOnacQk2KOeNtyvMIiN04oqwY0QZfidckYDSiVrBNtXNVQbpH8YRmBImdR4KV4
         M2gw==
X-Forwarded-Encrypted: i=1; AJvYcCX5BBr57KFX+D98xNh5SYYIVb/6R26+xAHyf687Z067kXgrWaXvxgOj2oBXRFtetdckrq7HZuB9oYaz@vger.kernel.org
X-Gm-Message-State: AOJu0YxUUeDcVhVWOTinlPR4/UyOh9d6DrFkIfNUadw3VMnQj9km1dTJ
	i8rQ0PFbZIj8q/KxQP+j+TAl5rxfen3dfkXSZpgm/s75exymQ9Wv2AvwK+2xFMG92tFBdQY5lbQ
	sl4RhTnw8hZFU1f8EaX23fALm+13ah7m/mBPeoU9MECoULSKtguFKM6Dgs+H0XHLU
X-Gm-Gg: ATEYQzwjAANqTn3YRhYMUOHYfFtO9UF6z/x0p2mbyHRkod7hPAFitNyGwzdoSsYvLmv
	hBjq+uEbjfWgXuSLbdW0XVDQlVkhsud9zhsoW4FHoPFsN6lOJlE3hb4vIaOmR0l8B9upoEa7qhD
	aS35WPF89pVSrBZa/ZCkkq/TSYRlsTiHz3PsUMJl60QH754BVbdKRoGj4O/5ifUST10mkdVmCOv
	hdoMnrieQd/TM0+XDNJ1bXubrGW2Tr3qbFhoBqSwEdvGXv+8mukH8XtgYT28us7Vbgt+fGwJ0LA
	rDW+stLbJJn5D3qFxcQM7uni7Zo3SQuYOKCXd42kRrcDFzL0kTITDE9M/yXF7UMYMMWcapHwnwS
	ZX2T6x3OHi2UXjNdIh/dFe+njc6za/p1oNg==
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32993701cf.45.1774619118777;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-50ba38b227amr32992831cf.45.1774619118209;
        Fri, 27 Mar 2026 06:45:18 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df85csm21164885f8f.28.2026.03.27.06.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:45:17 -0700 (PDT)
Date: Fri, 27 Mar 2026 15:45:15 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add missing power-domains
 property
Message-ID: <szijgc6icwkzlssrxa5ceawgzaq73jo6lei6yubaxltbw64x5t@ru6x7a32igji>
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-1-f14a22c73fe9@oss.qualcomm.com>
 <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb5a1d45-822a-4894-bf89-026164491935@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5NCBTYWx0ZWRfXwL1KjCw9LNc6
 OqAv12/v5U4/GB2jcntuNnKLrqm5lG6epYPqIlzDOv9J0y/jWKUvjfzWIlqD2igX9GI0aMykJis
 VCfq1RnK2tT43XmmQao9V9TLtksxOSfC1Gq31rMi5B0OkOmOBM4e6EAp7ds1VN8LqoO8DrQ9szv
 OWqEQdAkvGPV4QWYXnSG+MRvEUUEmTLDra7ET1NOAVtKkKRvqh4zqcb5Iv7P1AkP7BZZpaoHnIk
 eJh8O/r8VYrgh41mhW/XBPoRKFHO4Nlg2sXAEaXHyvtooYFiDHPrgk03VARzCOT8K9fMt2McsEy
 EqlVJmtdIRI8xb4N9yKQuXH5Iz+5mtJqPiZF1gW9uX+gA6zR5HQ9nOpYfFlWT7rf00zUXEKHACO
 hBat234xzoxYFPXfhbWZAkvdKNAbzL1EOcwoQnEQBBuATv7MSLoiAfocgylkjpbwXO4WhrkExxS
 IwUsbdFeklCn9W55fZg==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c689ef cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=vx3vbEJZiE0Yo0wITGAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: YPGNYb6NNYZ-9L6CL2MyX25ggp-cAW_k
X-Proofpoint-GUID: YPGNYb6NNYZ-9L6CL2MyX25ggp-cAW_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270094

On 26-03-27 14:37:17, Krzysztof Kozlowski wrote:
> On 27/03/2026 13:13, Abel Vesa wrote:
> > In order for the GCC votes on the GDSCs it provides to be propagated
> > to CX, CX needs to be declared as power domain of the GCC.
> 
> I assume this is true for Milos, not only Eliza.

My understanding of it is that this is true for all platforms.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for reviewing!
