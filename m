Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032825F988
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111592; cv=none; b=rxsnJJE800Ud622rp2RcskdjjQvNC3aeDefT/1/jZrWgJqBCOaUbvSVB5ZPWy40A4bozElcd5QiXMQNxcVTC/nYlHRlC6iUvArA/GyUA+KaytNU3pcmeSosZGk/aInsuI/jEIZGSYgwT5hz8egoHiaTLZajksk8nQUIQ5i0nqIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111592; c=relaxed/simple;
	bh=rZo4kyY0Y76IEd7jHHFyN/7oZ08oGYKJsxlI6R/hxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I35vJrriegJdfSc+P6pHCTbmT3eAyFPznzNN93Dw47CzMnMUfuM79rJ36lmhvcy3+gd3Ne9oHoGEsGLkEfZghY4+gPEch3F9F4mbhzQhN7kzMkWtHqFnh1tRrKd3OJZk6xcraFU/Bd3QACS1qZ4ELEW2g9ynYMGvPW+iYsw6yB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE3pFWmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlRJw3zC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE3pFWmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlRJw3zC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kXFi3709551
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9Kgo58xxN35B1PorN+OPrTr
	ld2F+horzEBlznhVNT8=; b=aE3pFWmd/suJkMvhi7LibpjTf9EAzPP+1o38X2A4
	caNxZ6+X+oSPomgRDPW1gmOze3n/o5Hzh9km5aSB2yOa9jH84mUyEamHrV5w810+
	znEbM+7mZJzzKXp6GS2Qq47IB62192fUYnBetkvXDIA6YnIp6IYMJKf6dJ+MuW3t
	cCkMHBOrO9JMj2UbKf5MQ16hV4INMwuXAc4wJRuHLfvnVaBExQVBCq8t7HmBOLKB
	pNTmO3oGIvMBAkJXqAYi3HbbOqivVkz4xeDW0IrGSEqiqNPcPqPRufX36QoS/Wzk
	EIswpg0AOYZUltbFkerekLoY+qRyfJqvsjqUE0MfK6l/OA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41p3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:26:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso1289561a12.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789111584; x=1789716384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=dlRJw3zCY0lJJYHu9hLtpj2uz98uoKQ05vW9jGy93Lz6p1DpM/Zb3E1faMPG1xtNQ/
         gkSfMmFojYAqjWVFcOlQxu8XpT6BVqM3ufgoNBNL7reFn925XKL+ComHGURkIcXKqXDN
         Zg7gj8wELG4KfMN3S4VAv128pq6Uytdx1lGjbVtA7P280yyb+C5FF54oAHRFcrSUPvhS
         jpJSf0bCvPy50rcIu/mlqSMXE6WXqCObBGakchwZdSQ3VWmVSVyqZc4Vmk68newNSYr9
         MygkyYTKSoOw5WkDVyN0l2c7l+Q9ge4vQ++IwM0nx+qiHi4e9Xfv/hPk2OJCY8cxyNzG
         lT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111584; x=1789716384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=iJEXZbpe81XOn9o/cylTihwdsdJn5k/yzVEDRUhFG5n90l+1iJPOZ1cvflzvone66T
         B0L7PssDTPIt1Vn7JOHTlOEdy7HHK/5idZmUBJOxyw/fBUy1IFtwYTa1ooT37dMKetA9
         x+esAxuwQfrf+VZ7r4jFGhgMC9kmlBFrUkH8vfP0rjRHA4ppGUCRN7QZeDJn4Conr6oV
         znDgAut0pM7erwVUHwFZ4iy4gf4dspwrDe4WFcRCjc4nud4FV2wxZdLM7j61Tr5Kfvnk
         6ilhTPQ26GmwfpiM3e5nrL0TOTnJRAN6yupa463cSYMjxBMfoFZpiaXqnuQIYswEL5Wu
         H+Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwYR4ZSjPDzvcWwGSITF2ClYF5PYtIWGQZ563bk1w2dSidMY7fl3aLeQF7za+RFoVm2ceKzf6TyHFCy@vger.kernel.org
X-Gm-Message-State: AFuF++n1xoVpzaMG45dZKDQk8VU+ffnLL8UJeMZ6oeuOPV/xQgdG4MXF
	xcIf+HM01igskcxNFkDSmq1I+y+Y9peZo9jUbEscZ6lQN/4lEiGvTTThfQfoLfrfqY+mTW6IZvX
	gVEpjulm+GCVM7C2zVLonz9RW4q5WZj/VHWgiHmgxQLLbY3cW5AooAZPPvsCFO1qv
X-Gm-Gg: AYBFou31mT7rMoPLSg2PrpRzdEah1N8ii+0aaU9BbbLJQKP04uypOoXf4EASaTn8zOs
	vJ0xNzZA9TO6uTza4z39vTIpAJ4pc4lHKmFB8NGbkCZwv4Xoso9RmjhpOu+StveJ0D2v7B7Joca
	ezOFk5ThhmE+CyFM8G5TftUyWYN8ZC/lnfY3oyZnY2/43i3LbxgrefZezQ+pgpDaTBc81WFIDZs
	m7nDZFTpZvADINBhBqPu1JFk5QcF3kRbpnZF0/CkUfhXD417+nVbeW8xbylPn9xGt6J8CwGzPAi
	hySnUwNbV1w7OnnVLOx9b9/wPdEx0mmp34YX/QVfk1JdjlPwiTnoZa1CMmVJx1mjcgxpQ9j9h+4
	M4vDmue4IoORKO1QlQXxh0B6w7YyZBKUELD6UwzGc0OU=
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704263637.24.1789111584001;
        Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704218637.24.1789111583593;
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm4632504eec.16.2026.09.11.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:26:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and
 PD controller
Message-ID: <aqOtGbCUP8CsYknV@QCOM-aGQu4IUr3Y>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
 <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: Sg_0CS7s8ic1XRVdeYay8LkkLz4kKOAn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX/L1SoKNa2+xB
 4cuzXOfjBrOeyrkegSF18YYOQFiC+dGG7u0PlfyzOEpJCZ5Slplgi/Ws3rgq2sPOjezcANMMjQy
 m+hiIs9P9Pe+zUz4YHTVAuYQKllWD6k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX0n+hce2YjYPM
 j3Pa7FAVUBN2WC/LV7vDyxL6izbO+mNcJdWS0NgRHn1qVrDfX4/Or3q+A5GYuvnJU4O7MZpP7lV
 0ti778F9CAY8aj5+94oC7LZ8MnhdNtVM0YJH598z1gHaEHA+dbd+WRlgQNBikqk4KPBUtE+hT8c
 lmVmQVTlRpvf9GyNRvEMELwK/bRBD9GsPrI4+77dw/UON82b0QWRRYvByDasjFeqF1hVBkm6SeX
 ooJ0TKcAcbZy5V+D2e6+ZOoNd9s1kolWNXm2WAmrn+38CoDuFR4b91tMHJ9BIa+ZggxMydGNuWt
 ywXejNHFhhsA/ZrlUwcUcnc3p43eYarPkZCYy0FnrDXlVgVFaTAcu7hXGdOmmOEshW84lDgbxMj
 aozThTlA/i1jNPTqrcq1zUTc5miNYUs8c0Mus3Ued0duUJvtCy57NTZl16a4uDWnZJW6ViL908Y
 qGj8tcKDbSR8XLfVm3w==
X-Proofpoint-ORIG-GUID: Sg_0CS7s8ic1XRVdeYay8LkkLz4kKOAn
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3ad20 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_sypk6m7XziQz7B7UwA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110101

On Thu, Sep 10, 2026 at 05:17:50PM +0800, Shawn Guo wrote:
> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
> 
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
> 
> Assisted-by: LLM
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260902045938.184221-2-shengchao.guo@oss.qualcomm.com

The link line shouldn't be there. Will resend.

Shawn

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
