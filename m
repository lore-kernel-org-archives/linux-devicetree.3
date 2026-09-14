Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA73EDE7C
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371373; cv=none; b=BK7Q/3DHTPENkGGiJM6ZmdtUH01qd/8m5dtGZStpvMew6waCQR8exlLZnnk+XfFMiVrg9wjre6OCnuegzOBENYRt1Y47woZkzEcmGH7RXfbJMykS3YdRVUxEUoLGA9d0crRMoG8k3eDDXesA+zl5edwssRfMZZtBZYh1lfq8W6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371373; c=relaxed/simple;
	bh=vQynw5OVOYNKq4gspa+H+H5QODl1bA0pWBY8WjJmkFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIKD28px1z3/XmsT9zSyE1EIjf7OBSgge2R/Sbr0xizbq0TuSPtmZluKrfaTd6xi+owucsQxObqer5G6DCXT9ArXTUaismA3PgTovXiVSHTdrTfU2rY4nnd1kF5l/a9fp/6De79ecEoVz0glY2Fuw4wJmoit+oEpIXkLtPpNIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUOaDGr9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqgTqWr0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUOaDGr9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqgTqWr0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jQV23842847
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jSKLcPTefbq6W/OU8NO5vQ5Q
	j5YwT68D0oJVE6nhMZc=; b=QUOaDGr97jM296Aq0JTy2tgYCVFs+hlK0Cqki2j7
	Wv8OQiQprn3aqnrDsNFQyBN//13JkiPaiLEvcI/xEmCorVLDKAGXAdWshvdv+qG1
	tTjO7UY+Mnm8CZi37DWekxqCkPKJZ2xnJEJZIGDVK4txOJzI3v8vegz2ZJXkSXeS
	fWDlx2+xrOZKzKPBrIIvPL8kZ5MoaOwOjRZz7R9OlWqf4vsPyfIQzmX322ikOyEP
	52JzvWfxXLiRjpFPT86jYxeIRCdO4nms36AWfxoYWQsxvAzu4SDAQc6ai598fcTN
	fALdNEII6sYtgB6SfXi4XlPGGeQFmGZmMtUw0PyjNl4PQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5jd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:36:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so809334185a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371369; x=1789976169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSKLcPTefbq6W/OU8NO5vQ5Qj5YwT68D0oJVE6nhMZc=;
        b=iqgTqWr0xmlg1/w9HouXZcKwp7NuPqJ0z4bJ1bwCoq60s4tpC0vprUKjd8KTHVi5VX
         ZyNhTgIaiQ4ricOHvBy1X9BIVNYEEa6ta2s4VJ0kyHLjfAhUYUVXdi8pdVxaZ5gqFR6w
         N5a63JRk45N307lslvr3GDulwIpBZrl4SVtCSNH8W01gkUcBOKvjVZL6qvT/tVeMtBRW
         CbDiHb0bhtyOduvpGN7mOAgoqr6Lgn4018POBv1PGUxM6+TqOhsGp+hfoxyRw2CwgnjY
         T3yUlx8HDmsPyYJRCqw/BRfob5KF94Xxbe4j5dnEvSPxZIzuo8pz11VSumuLwBnWRxYG
         F4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371369; x=1789976169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSKLcPTefbq6W/OU8NO5vQ5Qj5YwT68D0oJVE6nhMZc=;
        b=GoA/yyilUM0vg1rQs3jaqCIyHRTu8AnMgeOOiypQzt9tGzKWGGiE3eBM00b+/X4Svp
         COTHbep0x717hljoxK9I4s+c6orK/jeLh9IaKc0aH7D7kL1SzjS5/6+UkNS74J0RMKdj
         pfqKVihowE0hSeH7wRaO2lpArn191z0X0KEO5hEoC/2qwZdBFnp1Tkhujq3+sBkmPX9R
         bnC+21ifxrXyeGVo9JTYvk/vbHYTG8YGxvXrgKVzR38a/syWRnvhd4qf35v6RjkSpYh0
         OcmwJ3giSsrxG6woAwDf1CDDNElQuJgL5UHN5IjprJHbqH9QhHRdnZTQY0/+3YYNaybD
         exTA==
X-Forwarded-Encrypted: i=1; AKwUvBxFqum1aUq4AGsM1Am4uleW61YGosIdEi81idRSKmiljtgG1EMwDVuXCuKv4JyhgKgcSsLuUHeoEPu5@vger.kernel.org
X-Gm-Message-State: AFuF++n7YbRIITbGQPPrVGtXc3dk5AZqfIQzVzybmCs7m/txR7x32MKr
	xcfBU0sYJ4i2X0HQhlEfjjWenFUjCqcOBRSvHRbhzFLCoddlbIVlLATe8bJCEQU9Kc4VUEMuUX7
	tIMlORt499OzzkU7h9HUJVqStfvbZ8vZ9Gytbrw7y6N9vmuiKJiP2vZGDBQdmhuGh
X-Gm-Gg: AYBFou3HIsALvp3vSpiJ5prwahQP7qjLTteFIW01BpPsLTO+aI/MDawLQaBypSaIym8
	vEaZcs0YVW6oZTfUW8P7ZlxGolndF1nSRgS2hczRhZARerlYYmZajMxuE3oGjCkoM3OzJcg6uUd
	eX71rbTllM07Y51wI1ExWe8iKXs/pQH8athXfyfKJ7hKy7kJqZ5xIvss6WuO1o9fhzGSbK2v+bh
	PEVPA4rPr69KlwpTQ/1Kg5dYKqWyKFk1BdO9SD0PVw2+854EsmHeXAgF6pMeOixU/FVYpgAhPJz
	gisMsoohjStOf2th/vo6qoZfpZXT714nkKOh9KH7lHOyUjgnlt6odPkgpM3SNpQd9KpnqsEu+yg
	LE2DtdqSz+8zMgNA=
X-Received: by 2002:a05:620a:40d1:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93a186027b5mr519355885a.21.1789371369444;
        Mon, 14 Sep 2026 00:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93a186027b5mr519352285a.21.1789371368939;
        Mon, 14 Sep 2026 00:36:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm194764005e9.12.2026.09.14.00.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:36:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/31] arm64: dts: qcom: hamoa: Add domain idle state
 names
Message-ID: <d5mdt4sjvlgkneh6ujxwg2vkpwscxq4z2xjsdqdwjru7rxab3f@czqge4bhvpdm>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-4-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: C4-UT0nYDgOIuUNVrt_nQRytOahTsrh1
X-Proofpoint-GUID: C4-UT0nYDgOIuUNVrt_nQRytOahTsrh1
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a3ea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfX6HI0/7G5ZL/Y
 h2yY4c7yBwUh+xkrX8KGGDWOQDdMnmGCm7GwjaFURHXcCtfv749s9uzApV/E++iAvF1wj2upE0n
 iG0u/Os1YpTx9DaZU1/qtZV37Kfy933umoe0OeRpyQHGfV4+syQCMSBF97iip/lOc9gapQlE56W
 NlBcnjflk1m7TPi7hI0W202YHhJcEReoA7eMcOYbFlL7qZWhbZnOItJT+LbZnVGHlNTV45L7bPB
 Uh6TADf5CtXF7NEtpWnMKVAwf1ZMkvjWLi9HelVKuRgiytnPKy4NHBurWuhKhuitfSQqyh74z7J
 xFVRZo1UJJas+0tQg3wsIHwfsJwBdKHWYaPiG6QZr0fv6efDynrgyueG7eF3STbd+tt4W70RgKc
 SGqWmtxUKmCdqY+RoVY6JnFsLQJmoBP5BuJ5dHIgv0JSCYisnJLQy8qhcsAd6knBsH6PKLn3pbx
 711gg7MRkwOlOl9+vTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwNiBTYWx0ZWRfXwSYRNaStr+Vx
 5Ev+a71vU4VrchTrr5js26/mKvYmjsaGIFQ2jSJiMymrttNRDvY/gjEckk5+lEczUCVkROh6hcA
 OmNb9Xz0toLxmlg2OwylXrYxwAIrr+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140106

On 26-09-14 12:29:36, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
