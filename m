Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CCB4A5ED7
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 13:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440557; cv=none; b=tGRTG4lYXWsP9QbPBApaqdRZZD+OaPJv3UBQVQMVzCv7u1QzvQsTD5PyX+qV9Dzgb60KsJXX5I5BySJysorcas9hDz5unuCjj3j1r1jBb+6ujoc4QUEPARbgLA8UoFXA3YoHeSXeqm4AqtMUaBBhsI9Ct/34jMTrMPhC00Yr+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440557; c=relaxed/simple;
	bh=iNUyMqHvX3S8pNMhywE3RHDU4buVV5PMKqGs2Ue0/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWWKAA+wTpGrt1vXalKrFYMYjYxP24KBXgsLca5pAgZYOBMjeiBwSyIWtwT+yoH3akzYcJNPzm+a+aVfHlodx9yrM1d3yAkoOHm8GQnNNs5NjFJGHBnS2rFtTwbxo6Mpo65MXt4FqX3fwQa6zB5Rr2Moha1J1oCazTmCsw++izI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RlDh2bxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRE+fxuY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RlDh2bxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRE+fxuY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBqJ162783
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 13:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RxbC8SJCtxAxQqyfjLxRAGHc
	UklS+ixE7pJvZTRJkeY=; b=RlDh2bxk5UMrd5AiBM0FL2s52PEI6s7AW0Qkt2+R
	zSA1ZYIUxF9V+kJqiXMtnxZLxlrlfpmVDCakGrKTSvFv4EyDamM7GyVmikD1/XUU
	0HPi7b0br90hsaLxTj7siq8cvw7ef1zO7Ca7PhxnGYoIkV3VPh50QF8YM//5mKvv
	vpFH+k0Lxa1drxGBn6J8hzEuMp23vzb0JL/5vodB/hQ6eHxFIPEofGK+amUIjD/T
	YLO/AmaqScrdPyKn0pDH0JZOu+h6+wi8qibqb6Ke5CY9Qg0wN/i7i5ibFsPsk2mL
	y4xS8dgisaA/7Tpy8AzgYDEZnzPk/8+U+nBEYHWvzinLeg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0mv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 13:02:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-785827e6073so475219137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440548; x=1789045348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=WRE+fxuYIeR9/JXBMS8ElGrWamhd2K3snH8cNKxU6w6z+ky8jX1eUsAr0dRqWABF9K
         +AvRymAY9lNwQbVR3jXZJajDk3et0FkUCWExc/OeP/v5KOlVaGHJJ9vd3RocbjffvrJX
         vH8Ro0pwOiIC73u5BtEBY3qCdr320cjZhYuSdFZ3q5miJ/tX6pe2nW76P6fKxxT9Yu20
         vcRKH4C92TYuTW3hKAGFvLh7zVkvFsTCC4LIiXVIVBJHPlC+DhK3JDrzN0FJWU1Q5bcu
         Y45Vt2YNwl1moRUoXBNMA5YT0Lpx7ENd1ZP7NDtbH/hvKbr01+JUP0UjN5U9a9wRs66w
         vfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440548; x=1789045348;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxbC8SJCtxAxQqyfjLxRAGHcUklS+ixE7pJvZTRJkeY=;
        b=YBnkrW0Xy7/VYkG7HgylfnAHT/v7+qIPHkgoeH4FCnGacvSEu6Ofa/RmZ6gBp4Pn0n
         /LPp60QdUD9tKtJQ+pVMlpFJg/BmilkMU7g+6/RNQ0rzz5HYrG+3rqIIM/ngUnPGrGJ+
         4vgYPV0WRKFj36xsji0d+cfqzbsOEvyjI7xQeTRQJk7QewVjIRzN7cpKVUyEJYyD3YUb
         TA3bDqFUYzgg2UeGXES16nH+yNJODYy4OefnhnPkZWCb/7qjqyG+dxCxNXYJUCpQDnpF
         xgIjN4ss+MLSyKTCwrpdSPI/8Ph36hvpbX+f9jlDhg0HhGO5/cXrRzZcVkOzZr3dTB7D
         9h5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6LKHYavqU5hmLs4nSUeLKm/NPxl+RwjMazQ/+1p+iKJ77gSDr4yclDzyCUC7PlLVH3CuT9C5kvoji@vger.kernel.org
X-Gm-Message-State: AFuF++kPQq2TjgsiDigCpI5B2CUvNlWbSdVO2BqVzehX2RGmn/D7s4iY
	CbLUspFUk4cIh2ReLBNna8y+6FTKACa0iqp2wn/EQ8uGJhFV6YLQsiuylkFa83UgX1rzGis+1qW
	IIC23TMjqdqq56GY6uVFdHaDb23haS+Hymtc8gEXQ+DZU3poSuCJPa7w9y2LrlxIn
X-Gm-Gg: AYBFou0Kw8LsIZ3pc9sTX0BffnCXDkW/1Q84aGHtCSGTP7FxAfwW/vB4q3hg0MaKmjP
	RBbg1nIZtZ+D5UNf5piyNr6/5gR/0x4BXPYnojemYgPAXmgSa0M454XjjNMIXA4QAznQkcAypmH
	xayv0vEj0r0gEi91OEkwf8oYkgtcXVUEq+nLto0EqJF+4uYJw+9vB7ujpzVx+uHheo1nlquyKPB
	KBqekrsFYCu11t1Ng6uq4WKhUo9jVghiHhwMeyDqxC2c625Db4+SfMf66hRUWqvh24PqSaxe3ZI
	aXhLlD2nNm8dCy/+mifhlVFmDATYdebae8sjP8HocFWHoQguWDjN73zYA4yIowXCZlHS+J9R2Tn
	PNKqZ2Tg8sXpSGw==
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308842137.7.1788440548301;
        Thu, 03 Sep 2026 06:02:28 -0700 (PDT)
X-Received: by 2002:a05:6102:3749:b0:784:4156:80e3 with SMTP id ada2fe7eead31-78a1f24853bmr3308818137.7.1788440547636;
        Thu, 03 Sep 2026 06:02:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm68179745e9.7.2026.09.03.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:02:26 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:02:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] clk: qcom: ipq-cmn-pll: Use
 devm_clk_hw_register_fixed_rate_parent_data
Message-ID: <yfvkgixouxknoc24eg53wgluzh5jufx6hcodqx2hci73puqqab@fqkut4o2yktz>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-1-21c3db378611@oss.qualcomm.com>
X-Proofpoint-GUID: igzy5YbsHo1E1r5bU2uNBcu6Vu8Tbxu8
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a996fe5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C_jcV2f4aFh2m0BU-kAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: igzy5YbsHo1E1r5bU2uNBcu6Vu8Tbxu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX7eVNql0jj0Pl
 EipgzKqIJHvPhnpGGkjflBzjvWOnta9285BGpv1n6r6h3uXQwwxAki3h5T0P/fHemlTWR9d6avT
 ar6egbSQFpbJyRFhb4AMAEF1zueDfoLVaRf1mCWVVvgvHtPldR4uBZ3JvLhEKGomZVig4K61Dw3
 4oI1H5ZEYbCPxhs1qVxe8qTaUBJ2sZLj6XxsoxoJ2N3KIbPpkCU3DrD9ZBRcucI6fLGZXiRQ0/p
 2PS+sVruR9XsnauFxylLlUbtiftB7axHPH59jM+mg0lajv7NZER3ko6ETWR3RU4+hTMI7yGlkIf
 VBB0JwPlaNpcxxf0RhxKJZHfsbXPBpR5nj7n037sRX+EQIF57B78pi8UqOm9T8Po+qogxxzFNfw
 swZcsEzSrvIxXHi6EaCxd+dxnQgkfnFYIheKn9+gARTCAjoMyCxtHrt9Ct0UiNWrEvoHSLr3wwm
 NrrdHKjLKoyE7iIWvOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXzCdqnlYEwTiO
 EQNypJCA7xRuYOhCQqL0WfL6dbpLFIL4bCjBAlC5y+StGCulx+Zf2LvpfQGR9E2rOEWGEQ8uqtr
 mZNhrQKCBmD6CX3Wik3soFR+ekUXZ38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 26-08-14 05:48:11, Luo Jie wrote:
> Replace clk_hw_register_fixed_rate_parent_hw() with the managed
> devm_clk_hw_register_fixed_rate_parent_data() so the fixed-rate output
> clocks are automatically unregistered when the device is unbound.
> 
> Since all clocks in the driver are now registered via devm_ variants,
> the remove callback 'ipq_cmn_pll_clk_remove()' and the manual
> 'unregister_fixed_clk' error-path loop are no longer needed and are
> removed.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
