Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4C39185C
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782237516; cv=none; b=LZy1UN7tpIgqmBNozoIIjkMlpVLWG/zJ2W6gqsiSewl+4vw1FYDL1PyEgvCD6Xg+ifmKeuXFgA6m6Wf3/DA7mTTNULB0w/CYCwBpQcqoAdHMTkUkKAqxjxIe6ljvh+oTzp4icjh4xj9t+/QkErFoR4LslOu/ay3zqcNBaFYPpZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782237516; c=relaxed/simple;
	bh=R+28QlrNiCN6K6py3dNPx0pNB10YcrEwOklcujjM080=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvh30+nSrDL0mJIPgONd02/Qw5zBj7MN9rVb+v92bXnWxqvTS0GqHe+cGRgOe+VtotozeEUbkP9YByfx+/4yqUWTPanQXtYI5t6G+Y1ThejyeEj9dq61f9GftY/gnA0GvrhuEu8NJjfjuhzlVAC90LGJJizDyc2idOiVorENPGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+pm5g1S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuFo8Jkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+pm5g1S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuFo8Jkd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NHtCDT4017423
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lidbR1OsPBa1dvYdzrXIvNxl
	oOyNJfjxIFISM5r5VJo=; b=Z+pm5g1SdtWM+L/1Db+V5VCgFLpgAlBUuhe7jXdo
	91TS+2kqc6CbDdIE2HTgkiPtMMiM1tpY3vg9wS8nM6Ffi+6m53Zv4bc+JM250qHK
	cNubRC3RbTfyOx4Q+JQNXhSiVqb1oUeyUXCc+5z9GqXz6kdyMQKbFOuS0jUr3+zw
	NEjxOGPGrPCCuv08vixJ4vcTeESswvy0T0nycMGn2eVtlWUxcSTeuQGKdt/SRzbk
	oMXKkR9WccAFugcHcXQ3T2Q0qAm+rXq3TA2EYP2Yf1KJK0FWG4Ujnck9n+fOwUVO
	eYVVOeuHWw7RmDHgnCVUxhxQ8upB9GT5/hSusgVlt7/MHA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjktv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 17:58:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915c364ae3bso9873385a.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782237514; x=1782842314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lidbR1OsPBa1dvYdzrXIvNxloOyNJfjxIFISM5r5VJo=;
        b=cuFo8JkddjRNtemhSbsLR+cAzBVOUBSjWcrqPjJ5THETBKbNOqvDoz1RFg42Qt1KsB
         Mx+eTMpjdMzSfALZyQ7A1QqKEMZqLsNUy+AaSxlHsoH40FmQnQ7sfvvcW3M0KCOhYY6K
         IpwRvlWQOthY909Vc0ssvaqGE5GMIx1x0hsy54emqdfMgn57eEASTQxjJXyoCYjKndID
         jxvR42ZoqgH72Vt+LT3BAzLfEQeaOyL7RH2pSXESVko0NkMZcydapCNou5eFroLCny1u
         WNwmcMkHADfRBo8J9L6OrWfYcSSfRysTQvz7vMmEg0U6LPLWuBiZMhOieR/u9E+Cj5k1
         rqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782237514; x=1782842314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lidbR1OsPBa1dvYdzrXIvNxloOyNJfjxIFISM5r5VJo=;
        b=evbyMn7BllKgF7oPBbHYF3HBzK9st0SzvTLJynpatrUuaAmKX0UKQNwfv+uZjoJfZl
         A9TaXXUcfubovuoy+gWmF2AZoLbD1+vrzYh+NjNAduAUaGhu7yX8uBNgpkFaiJ8W2Slc
         4dsn/mE+sniaxXy/Tn4aB4HEJloH8jeFDmVgLPCb1T6/Jgrnrn9gbskl+RyxjYuYOsBj
         2qrC1dLUCVEJV0LEKwhKG8C3bzq41lO2CwClsxdVo5UUJHaANosGsiI4SqeQ6jlGm6lQ
         lC+10KSu/1kyVkv6lkNgPUS9ca/Y3wweUpEUhD5//EoEYiKJpfAbZDJ1yn5RLpveMwok
         jwhw==
X-Forwarded-Encrypted: i=1; AFNElJ9r8lTBZ1FTRJxfmQogU3KhHNrUQeM5S2+QEQHqJP1UxbcsYNYOtXbxOuI9zU7cbUyNJVP1bQSYOdvn@vger.kernel.org
X-Gm-Message-State: AOJu0YwPASw1h+ORhX4zMCrAlp4nuVykj+mp8i6bdpuixOCrKftNj4NJ
	+Uuq5G6TgFhCQxPqCGQeBmfz9pnmzuOoa1WnIhFLIjk7U9VuV8L4ROg3Pb2lxvfgqtH9XftoKsl
	r8uzYyn61ibffCgvaA1yZrf2wpKDFqvazGaKvBhQA/RG3vwRp1WUsB9akPxuBIHGV
X-Gm-Gg: AfdE7cnzuseN+ZCd6QxqxfE8DqLzwYVXxtiMoDCXi80ukeZ16bUoIMdxy9IRmkktwou
	RCov3KesqY5Ku92/ZgqXPn+qAS/VIJhmZATrWLSC13XJwEhuQBl9LwV8ja3V1OVcYmNlZFRpB5a
	9qVkjvVCZG755TfYm1Na/y/i9h1fDna+hmbJLcE3JfNUm5yQjoepy5LpO9lXW9qkAoQ8yapxlbP
	iRAA4B4B2hyr/rPQyR/2DXt47zZOwVRjyB/rIUX35tKu+NrYY7+GuCaGIsCABC6g5qpkT4lQ5yL
	+u5r7U9WXoGPZIf3j0apJZ3PP7iaAOkMxxj3Qj9FrMgUFkLK0Y/K/mKpR7Qi3XLdCz69+HwGfxP
	BklX7iKnyzdgsF0wqfRrrqVSdVjZYCLWskKm9sLkteAlQXzmBiMROJAu1LZvstiuPFn12g90edb
	tWWiRI49kfuVXmVEmImwkrEp43
X-Received: by 2002:a05:620a:458c:b0:921:a4ed:2d06 with SMTP id af79cd13be357-926453c4a47mr635253485a.4.1782237514067;
        Tue, 23 Jun 2026 10:58:34 -0700 (PDT)
X-Received: by 2002:a05:620a:458c:b0:921:a4ed:2d06 with SMTP id af79cd13be357-926453c4a47mr635245285a.4.1782237513359;
        Tue, 23 Jun 2026 10:58:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156976sm28071411fa.22.2026.06.23.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:58:31 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:58:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY description
 for USB4
Message-ID: <kdcsigkak4ct46cbx2uy7vlhuipq2qyewazf5rtafwec3naqs6@rphkuu32v3m5>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-5-71d827c49dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-topic-usb4phy-v1-5-71d827c49dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX8A9pY+pJFNRU
 yLr+gyaE/e+YoOSsapIoHggx7TdWzCtagnp2QZ8bHOPmMy+tOXND0zQl+SaW0s22yUXdzA5FXnX
 8ksy0p893Mhi47aH8sTI/3RsF/8oRdboIw093Bfio6BjwqUDMN4/5KcMrck3v2g6pv6MkUsKSMg
 PC+OxruA0ys2GsuukEChQ12qseC2hcNeQJTpUQTLFIEhbt3uN2R5cUexL/B52ZnTgqw3w/yPsEZ
 h6hB7W98ygomsR5dwO8mjFhZyst+IVS7z+xz0UT6rANhpTQXhYGczYDf1lH5fNkZN4SLJQl0V6+
 hXRUZS/8WP9cvDc4g0jlbrfIYRXqdwZVLchlrPRAUA+PfyGlduvUlLo4r7EFUHq1zR2mMZCnlWi
 fTXkz63UNWtnYAk2iFp2qwmXLKalhQP9G0Zhju3QqOjA1y6eU+OfvDnfGJ2VLUOJEwTpGo7eFa7
 ZKa1H41NYLyrkDR/jzw==
X-Proofpoint-GUID: dW_YVLo0iQicf94C9gC00e8BI_6XYt31
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3ac94a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qXetow4D2dObSurrW18A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX7LvHiRcxqVIv
 v2P+VuzZOx3J8QTq/DzLNxoEXnMCKXcHFMm2Y63Gr1PacZNCOeNo1l53VuzY+OCMpdXDbvg+/Vj
 gdTlheNjVW0LpOKuqJDK4K7X6CdezMk=
X-Proofpoint-ORIG-GUID: dW_YVLo0iQicf94C9gC00e8BI_6XYt31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230147

On Mon, May 18, 2026 at 12:29:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
> successfully. Describe that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
