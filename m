Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68765434E31
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348783; cv=none; b=g5OMht7rLhsCWxeBAalFnRKxh6bRV05B/JEqNDWnV403pi1JUT8UuTeywGnvdsbtzjk0HHoZuoSyN7i0Dlt1lvY10D/mM+t5bXX9pcIPOwsRX32uykTEhkQ6l3Ug71J9/lu7pHj3HpReSzfr/9Nh4bNFfTuCNszu2Mxd+jrrwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348783; c=relaxed/simple;
	bh=v/r/WqLZEOFyAMYQx4rralUtoGfSDfJuZ6bjDMVoL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY0v1g3SBKCh0Pi7BqevIYGr47QSeFbOJxT61fWXsjDm0L3pHOPBbXIYHDP2yCCYqgJh3AH2sDMVFVDaXc7jDedAtPO8z0bnk4Z+gq34QCygx5Oa6DfnKtXMVt1dSor/ylyeHR4yXDUBC3u7dc57wBjHSDWF2DEF3KlPMwDqlAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ko24b0pF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwYAsrkg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ko24b0pF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwYAsrkg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEItl616656
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VEz5SR4P6MGHr8FEm9V24BJ/
	fL5kDCBLdYNsiYU+fAg=; b=Ko24b0pFQ71GsCvA+R8QJ7d8YA4SgN6xcO+NiAAz
	ObmFn3kMSm9+C5gUOzLEChqAnS/JBdtAe+AIIdzdQzYBDzH4eDOByNVWEbLlvQLi
	Bsqqp0BYH78cJKUaE+hLbO2tsrzdZMtAUBz/nap3o1TiL/+yAGv5UnY2T7ePl1Ic
	iUi+ybm2xa/vE9uCOrNM1qdqJQ9OvSkVFTJyM6HY+nGu/FvDtJwoIfWhYHAImPTz
	3HYze1uoUkqzuamD5UG3jLB91BOjcDwuN9et1HC8RHn7MsnbEFawix5TeqoLnv2v
	bTTBdNrG0bZw/y7vvfS0kEmwVizQnoNZ0SN4IXighlFR0g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsuse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:39:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-966c4d68d91so628693241.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348781; x=1783953581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=ZwYAsrkgw6L8XfvJ72meKLXNelzntI/pi1/uBQ1usXkcZJEnmDNl7YA0U+zOs2IWCy
         lbDMXYVLJmJkCP4dU482oJ/sHJPKGeX4GWwCdzKalZqa9D9YmBWQnnqAF4+i5oWvyg6I
         yqBwJEMy3okl+a67OlFWSnLirqpvyYGpdPjobMzWrA4/JYyvKsBtyhUupBlDCIcje+MJ
         +AV0uC/3Lf9z6KuyAMf1SnPT7ryu1ZD4X/Cj0TaDPfbzhNhvoZe2Pf9hobwP3uIpH8bS
         4t0DY3xd53bU0cZlZtnwJAXSLGCHWOYsfrYadRWGqllOx0dFEgvHZAmeP7NB2NXXlIGQ
         3zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348781; x=1783953581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEz5SR4P6MGHr8FEm9V24BJ/fL5kDCBLdYNsiYU+fAg=;
        b=Wcp+HTSUyQ6tLaRnLE1Ab7OhTu0hbRdwPokgnpfZq8z5XQm81OcgLskeBobjDCeJdD
         bzmhRRrbjsF4rr9yz0AuBRTRx0iTjTcM8W6raD7ngJdg1yp1Eku+CmGz5g8Uqo6TekW9
         8VOI0FLd4QCisn6aIhyAaERuoX4jvyqyOApAA+r66fq6KWL8krVkdzAXuVQ5wsNTOm2m
         yDCCApQdZO8flG80VzUhFnkq5FH8kkqPB1w6yOCM3wxRmxNx4MIQ1H7xJMruD0/LevfE
         pWc7EbC6mFXMPiT4XiQFwI1mA+Gi2Ka4p7lCS/h+n21HCQa3nBXr6C2UHkJIgPe0fYkM
         fkLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxYLZ2dd2E2xFMYGcMqPVaxxjEK6jL6Uo3HEgKg0eistQptLO61GOUUPn/xjTu8GnIuPm1+GCAmFqe@vger.kernel.org
X-Gm-Message-State: AOJu0YyRPAsdYW18gacke1RM6KqxFQoWDzEI5850wjiL90RGgry304zq
	AMmVWqVCuCxJYI+fQOCXnnYyH/eJRMBSQN7t0oqMt+o59sb46Ow6wyqyUORQJfqqLwRudGQAliI
	Ihu+H65TyE00kujPiM7GJNaCI/hmY9wanQZYgRH9ihaNChsNB5yn4ICT2BrYCevEp
X-Gm-Gg: AfdE7cl6sWhEIKKSv0/NUax48xJ2/enPz4cmjyp1MwJWRRSLUhUbHW4JqbjnTaVOBPf
	w5p+vUkTyCFf47hoYEiCIGopUkU1lBW2f4gQfqgktOiVB0VKQyfqEhMLHucaIi8YN19Hf4El+9Q
	p1Q+Ab53d/gK0Z4B6E9HqQcL7OKdN4K8FBKPMh3m0HZ1YL4Xf6x2mI2RkbCJSmz8UPxP+o1OJV9
	wDl/hY5F+Fe+p/Ds5mkzdW+kIM62i1qWS4phU+RHWScdBpbfFnmmfFjelO+k8r3Sa2LN0ZrJalv
	0vmQ78MCryLVJlaHIeXqzuC8qBOEf66RxpOtwpwZ+jgxK4UM1h7ohGJ7B69SqVSLH4AtOxBMoo2
	utgE83ugAnQv30n12oWIKBm3+yT71jjnZ3+Gb++stiVS/xikj39MvbziQs59qnvmUTHWac9BepO
	o1h/KBkKyQ7kAJM32ffZCDGWP6
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473107e0c.9.1783348780700;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8288:b0:5bd:9f23:a74b with SMTP id 71dfb90a1353d-5be9085aab6mr473088e0c.9.1783348780248;
        Mon, 06 Jul 2026 07:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbbbsm2906428e87.43.2026.07.06.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:39:38 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:39:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
Message-ID: <6pecwkpvl4inltqzy24hbhouuz3e4hss477xy3ce6zldk6qcvg@4vnvqxykmio5>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8nX-9u4WUr-SOYqKtMrH2HJE5fsv-_DJ
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bbe2d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=d7ClhsmVZ3m4v3ji_18A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfXyx7i7H5erlYy
 1/y6AOmuyEbVxWKQ+Kz0LjNfKamyH2Q3tOlQ2VSw7NEvmXVf/lEEpij85dzqny+WQA27c9Cu0DA
 PjrJGWKMt0Lro1Mwoxd/Miht1a+xmK0=
X-Proofpoint-GUID: 8nX-9u4WUr-SOYqKtMrH2HJE5fsv-_DJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0OSBTYWx0ZWRfX+Vl7D7/dXGTa
 jbcCO/B63EoU8Ew10GYgqNlAJlZBYgZV4YMLh/TxwmTvLV25sa6d/S6mN9HU7MCV/KOT6sYsAD7
 ZWSs76cJtu30eKNs4C64bAArpXOw4EabyCeR0gSuSsljRIU/UqgS0v2QBjWzenaeGD9ZEKNA8HN
 y10JSufxy4UI37yIlcEwijpBvrc/60U117K9Lvnybe/gr1l3kUREPhXPj1c7CcGa32maUfNgZm7
 rSMLnN6s3HWdabaqOjPO3ZkyiqhD4L75Ux1zo2d1GMd5BAkwblSxwosbU11MAYEUvTJzh6dg4ru
 ACL0GIXtyNDNd4CXeo56ffuAnfdAlEcGUJm9vA09caV6xKNU5dqXWEVC58YsvgWnBFntacoxJih
 wrIhke6W5aT3kxlBU0n+MHXXMIfDGm3BM/4afZdj5k66XqHsrITrxYbMMV2eaBnnTU+SfsCsIWt
 lV4Ve4UC5xiDD1xtb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060149

On Mon, Jul 06, 2026 at 02:27:15PM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  11 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/videocc-nord.c | 507 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 519 insertions(+)
> 

This is almost the same as the Glymur one. Should it be unified?

-- 
With best wishes
Dmitry
