Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12A3BF694
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150563; cv=none; b=cKwXUtLesrjZZ0/X56KR6O7AomiLIscW1Y+P52JewzMLPGcmitKa7jGbfTG2nxgBFkeT6JxkpB98jZfCg8X5Ip+xWO/h9tCIPRWg/S65MOZJKEBsich8S1AQpY9Ei6CaLuGdtrhYJtRhzulMs0ok7TEZqYC7Y/avW+n+QSLNJLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150563; c=relaxed/simple;
	bh=z/zZjs5bOOaK1GOv8zryaod1Cgmr0AddL3vgONRM1O8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOX90ZAbC6RkCk9raN+NWD0EAAjriczGFO26+GeHlR4aNF381UQd+bUuX7EjSW1pXs2WlB+NHTg0jb2PRzRKFBipOrpsrJLEoiQ5J+wO2sgeNJpgTotLXETOqWNNY9ch1QIiejJEOAfsCWjynIBrR9STwsdVMe+SlBgjUi3XBkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3wHKl6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YU/weOYg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3wHKl6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YU/weOYg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEcI7T391103
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=; b=j3wHKl6Vx3Y+LhI+
	5jiRcgyFDMbplJUeiVH7vUbgO2l+GeS1Is07ur+zqQK1iaLkgP6G+oTUDOWmQH6+
	etY0RqIPg2CRhEX9FHxdARyf9fpFFkslLspAagPjlWR/uFPkuLS27GWoGu6SumAD
	6er/ccSbydPxGMEa5pPARzKSznkWbIQXqCnV7JAE1fe+jsYlyw4gC7SpqoBKCGLY
	XAC8G6dsav5XNnoVzLgmsj/bjBZxCsxG42v660n3Ld6OBQ3++4kb/KkjYK1owspl
	sf0cIXd/CXkiWfTuVev0rwkmgGSJdWylOSpckQ40jZCLaCrqX9DFySzwcVZxBQrA
	Qy5mxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkvrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:42:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b81c13b0so20371185a.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787150560; x=1787755360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=YU/weOYg5Z6ebJTDG3wx6ypA05cA1IVKk+Ur8jBnAkJYDgaBqrxfx1rAzQab17PF6+
         e1g1dQ2owgag2P50000GuE1/249BFV6xsWovYeL241QZGQJtiYUZc5cGIMuc8sx44ZlY
         sXKAdRb/jPuIeDPaBXNaxo1eeuw0c/EP1n4SkuZRfGC43fsWsQtVa3gOzpbrt52DTCpT
         MYLiSKhycJyVcRKOBusXQoUdn38M+L3Qz70Xbf3duQLu4GO3JUQyaWGiTE87j/yqQmzQ
         pRVimSKq/plWxeQPDJBuTaRskWRpxXRnJ6CQG9/BqGqSzlnBW6K2h6VGCdnHoITWw3VS
         ugzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150560; x=1787755360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRQxt4GSu1VAaSvVfJScpbqr50/voI1PXeAYPBdH90E=;
        b=XE3P3hwcS7lUUTBZJiR5ndOUnCyJLItErbBEWsawB9ZyumGT9Sa5TQr19FY5NZJ19c
         fnkcmWO2cVRgnM9lXU4ndH0TIfcnhQ7U8ag2nKHo0CHa0rlQX/5Sm2L6ssx+iabSmsaJ
         k7v102JbdrXTdFvtoa/LlSFBF5R1/K2A8jMRfNSjK37zt1ETvFE+3OcLIpYCDhmFjPJK
         mjsi3GO6e5awN6mNSi3JYzKGNA/hGZ9L4Ej3Koq+6h6omcvqeKd+KEoPxqTI/KatBywj
         rQn5K+7CaE6SkHSMnN5jNcmsEVmORVyQhaROMSsDl9TmT+2iNUcmNoy1O/B134hbkcmh
         V9Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rq22G85ritPlfZH4bKthxwWbyy3d4d4Lliwdsk7VPEp2JRJXgxF1IAr4hgwSXPJvfga+r/TkJ/Mlhtj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw160IEu3NDZaBXM6ZhBqyBIDsTqyj5OyoQnmeufXqPcJ6PJIuu
	G5hDFWIXaOcNqnSVv9bvPqiGlNpsrpipyXcXCWrYWFVA98NM0eTD/k7MiAyeVswtdEke35Y/56m
	ljZWef+ThFcwneoQkDiFDr+nwqmUCC+LSvnstXewgV4OeDD9//UbBrfZlPLaGSBY369uyTMHW
X-Gm-Gg: AR+sD139ZNnk00Cpua5sO5kYFGdjIWTSFctRGLE+hbs3lcmPdt1DCRPxiu1WZo2ZTlO
	kcZgzo2EbGCN3kAeb72KC4nPwUiXEupnq48fzRHZ2ppbDlcrTMih/b4pW1LUqbfTvfk2LmcOOzO
	VvFC7mr5499kO9VlPW414swAZOwP6fR3IJc23RDNAW1JB3XnOaMzXz88owxDiNNbTXeXO/6vWAY
	LErk+pXnmLeSofGZ353sqWkdPlnzLKas7R2EmVUoF+tOyDGqYZczWL1iB4mBz/Nn6tsgnsRMf1V
	DuZwyVZRGGfkwBKy4F/uczL25TJxoGXYJkEnfmB1UgdZx7cw0rAf7uZ2U/zLtydUtNae3wQ7+OX
	loAj3tXeY7BqB97K3vCW5BmYk
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323476885a.4.1787150559696;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr323472085a.4.1787150559150;
        Wed, 19 Aug 2026 07:42:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c38b379sm90642266b.39.2026.08.19.07.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 07:42:38 -0700 (PDT)
Message-ID: <40e21b3b-edc5-452a-a2b8-015ac2412709@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 16:42:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Define touchscreen
 in the detail
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Marcus Ramberg <marcus@means.no>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260819-oneplus-ts-quirk-v1-0-0cdbcea195a2@ixit.cz>
 <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-oneplus-ts-quirk-v1-2-0cdbcea195a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX6O7BrB0rpHC9
 7pmGNrAPErHQMPWwNXhYWc1WR+uLmS/L81BhhEXQXHaejAZarjGq6weJ1dXvEvBCtxDPBH0AXtC
 sxZzEsq1fgF+dRDZmeD6WsBDxeofL3VbfTueiKJ1k16ZkH2CqPPlCOBVq9AHSUKCjezeeMRth9e
 fyJLglzIBIevVI+DXXL642tUaanL1U24KcMOR6DZeQAdN0ngKdCjEAFUYnDYEXXxQhVqfU8+TFP
 xjA67jUEQry3fEaSrpnJnfz7EGvaKefk2IyzoBDuBB59tiZl5JQdJC5NKiYzEx5KoaubCLUPGcK
 ojanj8Z1L1BSsTSD3wAPkpTNJZrKStt80jF4yjOd6VN+OAEqWRVXvVwxWiRBXNB+jPwjeHEhRcN
 BDXz+oTKRQh/KHhE/vc2VyyjZE/1Nq4opm8edXKWE7P/SaXpX7YYm8qaGhwo0wktmOEaaNezzFi
 L05RwU3bihYg7yIf2HA==
X-Proofpoint-GUID: _h6bL9Fdm2BwZf7h6ZDaqrBHynIPEOJ_
X-Proofpoint-ORIG-GUID: _h6bL9Fdm2BwZf7h6ZDaqrBHynIPEOJ_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExNCBTYWx0ZWRfX9n5lMpB5+Csq
 JNo8+Arcl8dt/557iXWWzfWf5G3o0lEMX9y2oDU0kyP7aiOcasjig+GhMugYNnGMKLfCK/2PdoL
 QUCkNcxOv3eJyogyzDt7iJ1cQcXyKNo=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85c0e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ea15iDvwudEerf5hAZwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190114

On 8/19/26 3:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Once probing, aftermarket touchscreens report touch over 0..65535
> which is unusable. Be explicit in device-tree to avoid this issue.
> 
> This change should be irrelevant for original touchscreens, which
> reports proper values.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
