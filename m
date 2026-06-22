Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AB391E73
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135250; cv=none; b=JqAkEvxynDtmr2sAnaKcLCLPrfaK1SVXjDY72cKFwTIVIctfDYTzBHu9R6wmrMBekS1y/Hhj5rUawwr2wIvSWuyACZETAcosripg3HCZODwSYG6rU6XTugX4YQ/VmFEbfSNa6aKpFCLTWkkKzsGISapWcVGC8FnZ0tw+PKnfkVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135250; c=relaxed/simple;
	bh=xpM1ZEUR722AzMER/5vxKpdKmElmxGBgeGFi7LDxvpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es2qiyLFaSZLAw7f22rmv9se2shQZUrIhpfrqV2RdWoCAQ+b3/SG4UxfcP5pZ/s+2E5avy2V1oDEJ7ySFIeE7Hsv0OLKg4cb00v5bQr4qOvEz2M0Q4r/XnCXVo0Plsohu7Lz6GYsSqCkXhvQewuAjX9RB5Ii/7ZMy2wBCUnv79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRstV2Ug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb93aSH5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRstV2Ug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb93aSH5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDGVKg1364427
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0f5BPDdIj7CppYyldUI6Otm
	CaI6kqghntkZ903ClG8=; b=KRstV2UgewjURqh7bsdXbZNF+7uBIHD/LruI4miH
	usE5G0aKqP+KOU64+hmQDZUARXVQ7vzfEsThQ2b9ZxR/+tXhusjauBwuAikhyHBz
	BMBuQG3yUAye6vOYpdVZ1E9u8/Cus8e7Uxtu+wrnzOwDyHJNdv6zWzeHtWUmSEu7
	YkegMMLgSpoHOiSU0KxgcHxbr4JXFeVZkRze5eHHo05WzAGl4PO4GAVMwNJy1Da0
	QRkA40E2xUTTlG3/rj7n5wkkcZe7xCU5HAEB6ehRAIapgWHhOm7XYEv3aesHqtXz
	F+kn/CoHbPgGz63EUfF/hQRCkvbA8FvMQZGp7eF08dkF5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5ptcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 13:34:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so4176712eec.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782135246; x=1782740046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=Xb93aSH520vG4uc5J+yjugHct3rxOVo5+888bkvlqo+NXnAoD/g0xqIIY9VajTWBJy
         GD93+R/cc2DgQ8XYTVTpHqMr8SFLmsVgCeXxo+OCzU4SS/oUHZGc82Ry03OGl+jqL+Xk
         WynWKSjK/00U2EdMpmgi3703A+X7Vb5bk8i4hA/woIyIHsuuylKkrsTnJxCjmE5zD7XG
         CzOLfrnRXHESp1AgXp82T6wB2+Hj00y34pkLdaAdzIx942+zb5e8mIcV9sTD9cbNNBQC
         yb0yY8rzjy1TDUdkCIndAvNYfSdYYt0h6WuhNfRVf3CbYdCrWbFWepdVCn0/lS2wwqRW
         /YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135246; x=1782740046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0f5BPDdIj7CppYyldUI6OtmCaI6kqghntkZ903ClG8=;
        b=tER2ZBH6NSO39O73oDWFwubDycTJhju0QqvyindTpi9B4x0vKpsHDDyyV3Pn0cLMxI
         PYu6dEi77lXM2X31FcXHezFiSW0JF1hrdMl7leLeFV2AzTe34bd2EsQaVzZtd7ozvP42
         iSEbfhSO2qhl2njPZEQOxRKDAacJbqdC8h935Gq1BXnGrOa9UCylowuNCgr5F1QpXXxP
         dDj2onX7BGLcMICyNOO0BooYZ357Y45ixYRj8IzH8Epgn+2zDHFQSVRNacoa8bNubpMG
         7jrGMJPorp7i/0ce8qDMRyyUcxw7O/YLnbYxZkMheIookb88Esn+AjIA8/XR/EyzitEU
         kwsg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6YfTV4m34biyNJ2rjVyDMF+GZLfglvbs70YQKcqKEF3hbVimWbGnV6azp0rXPlqqgRnsZI22cJkPq@vger.kernel.org
X-Gm-Message-State: AOJu0YzP9AxBofI2wa/w1OGWbV5QAxan2xSNOx5zOcFejGO/SWBPoK6i
	J1CUw1LrfHcLUSegDEkaD56I1kgrrVjJFDQK1mg6eAMDo9wTNlZJy2z7jZ5qByKkLfXrY8D7Dzf
	fMhkr7G9mrGqn0A3WqNi9Av1j5eAjg9qogiIxVavnfGFglSbvnxAInSV9SvVJFa4U
X-Gm-Gg: AfdE7cmJl9Yr/A7/1DD6Xl2f/cYLWfdgV4gYIpGlGe4BPxz8O9Wth5SNz+2xx0BSNWJ
	izb+uQHN1P7zmrc61KVMTwf+PnVy+/mzY+M15tYdw0Wpg6VEDjkSkQkAdCeqRWiMuccllobhrA3
	jJHaTvbFKnerUK+/XEprlNvn+HyZ7AlgCgf+D5n42b24Sca9deXW0lBe6WnUPphL0gdgo+Uyr1d
	Tooau1IZMpK0nmxS9hbx2Nhe4VDC0eBIwUrlHzSZKAQlyTC2wXJ7ky7a1V9Bira8tm14wsDK9ch
	QH2Vqsw0N+t3x8ntQ7p3AW2Vo8QnxUqSCt62QwgAMTJV0oyhqGW56aa/MzZQnfmbrGH5WWcfihQ
	f4afT/eWumSUgV2Xd6VWCd0+V3AEqSk9fEkj1A9vKETAxVC/X3YVlTDH2vQ==
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546745eec.15.1782135245773;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
X-Received: by 2002:a05:7300:5b95:b0:30b:f477:6619 with SMTP id 5a478bee46e88-30c0cfefd60mr10546718eec.15.1782135245185;
        Mon, 22 Jun 2026 06:34:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm12707995eec.23.2026.06.22.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:34:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 06:34:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v6 8/8] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ajk5yq5F9pri6sKf@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-8-c939c22ded0c@oss.qualcomm.com>
 <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9506482-aa46-40b9-830b-afc259f9e47e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX8Knjm36viZZy
 BqqF2H0Fz+MFAIgjA3ulalYx0+jeMYMorp5wvTOFNv1apc07JJkRATzEzoWpHmpmzurYzlje5pP
 ekYG9lIDD8dYeNuRHeCUHeyuf7R16pV2dmB63qDEfKkk16dHasTlO4TqYcZurmTgF1RcsbpNgG8
 orIpYUt1PbllG5UyYM+9BDAb69+YPZdTABLpPvng8+738ykuAQI4z+haiu72XSpkiFs5HWQ+wss
 lSExE3gwWRvKBa8g/NDNXD+KIq7aDCb/2TQLu7Z3Hm6L2xNcf0ONAg2uESwb4AWd4j5YpZUBqss
 cxcPLnYX02WonbJ000AdJ2jhfavZwaXNPi+N1fYe2hFV7P16E0m2EnzIgsNzp1ppBANcdYi6vgP
 IkRRDXj24ibvfEYUZyrwkPS46bfSVW3f9r8g2G3ZH7Awum2QJ6NGFbAYy/+K73N/OsN1A94uCSy
 4AZzNc5N8Q+AT3QnZQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzNCBTYWx0ZWRfX0kNpyYGepn7O
 Xn2zUUNZmnlvyhONy5DEcxjjERKgha9uFFsCQg3r28RirICcNnV239dLGTQgopjUUiWtK51K+AU
 48FooaajRFv5TiWbz1UdJCKVJpo4/gA=
X-Proofpoint-ORIG-GUID: 1_q80h7e0nE75NdA3OKsbS6jHPWJjPlz
X-Proofpoint-GUID: 1_q80h7e0nE75NdA3OKsbS6jHPWJjPlz
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a3939ce cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FiaomCJZojttUmy_5dEA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220134

On Mon, Jun 22, 2026 at 01:37:06PM +0200, Konrad Dybcio wrote:
> On 6/22/26 7:11 AM, Qiang Yu wrote:
> > PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> > clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> > directly instead.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> This must be squashed with patch 7, otherwise PCIe won't probe on
> Mahua
>
Okay, will squash it with patch 7 in next version.

- Qiang Yu
