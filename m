Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798834AB1D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339687; cv=none; b=ToETaFdvZ16v9VEq+jRl9YcPakeXr6OFEWb+NBQoKfUPLDnbUfB93pGnX1OLrDRzbvcJ4DyjUcadUZ+dhOSUEdjh8pnjWArSjP3oI6Vsu60U3Gs12hYCWE7fxZ2ZtlQnOeSQ7Uhq2blbaNEpZH4ofPctKT52Hd5KKcvaCl7M4y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339687; c=relaxed/simple;
	bh=u+koxI3Yoe/GinKMBs6efvqTvGNRQbfIRJCp+dtWl6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc3Qq90enrtYluckFgeyZEOnkbs5RRAWfi73oVppX6K0HWhg7rwhyvOR3Wh8HxkQM+KW5zbnUqi26Un1LomNefhrXCIXM8QgqVDkYCP4L2O0vM6Y1z6rVAN1WC0EDjDL4A32YKJxMF8jU/MkfogJmP/OqsMY6DYYpIdlJcVupoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2B+Yzmf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2f5e6yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2B+Yzmf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2f5e6yU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634KJuIF1309708
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=INGDAgs64kjYvsGtYYAY/66g
	nxazyYC9vqCcyr+LqGU=; b=P2B+YzmfaMcCgwrkM06rKzlcjL9hbEkLKma1lf4f
	plGRK6eCmkF5Ii+81zPxLvkJcmRgVnpyg7XQM0qCJtO2q6WHplF+0WXzcYipcdeK
	7mo/vDXIY9ih8lp6Op6dMSwJiSoeeuKqLQCvZCzrQaTJ3kEbzI6BV8ybK+S4hP4W
	BXCZ2VzJtgiGnfTNzfe1/uGD8w7ZhlTaRKjmHznpYKmpubTdM6NG6iqvNWFF1qNF
	+OEhnU8ofj0fl4NPSY0GiQ+2Ijeh/RIL5Edv7YR62s8QzwEwEaG7DHSr4lnw0ia5
	nEavtQNlunTs9O79tYzc6f68NDWVxrN0oGWdcghX8NE/hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mhrvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:54:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b6f869676so70305971cf.2
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339685; x=1775944485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=G2f5e6yULwRnkaVtDxuJtjk+M9ImPHl9H3+sd5ciSplubYG/uIIEfw2TWAzbyqmN4r
         nTVNRYqX5QebWXfjkuJJ2kl/4A9khg4ZDmD/OW2hglVPFvR7iuCSCqsAb9hH5JGHsfVI
         d8mv78zGd4Q6XIJrW5iUkZGJc9pTR87XB9PQNlBF8ygXJCju0pyFOs3ftdgJv3CxmjCc
         3IRDgR09h/+Vvrleq/jFWvbiKROiVKhrQw6jajxgj6UL8KsODzDKZn9RJJl6Zkv54gk6
         G6b2Gn3XQy5eHO8GhCTb+MmwsQuMnq8RWyoNKZgCyXizWdNpuF2LnDeXvIbqOxfspfiT
         2P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339685; x=1775944485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INGDAgs64kjYvsGtYYAY/66gnxazyYC9vqCcyr+LqGU=;
        b=Mgd9HKG3yJy2uboNBrhou2KE0VyUsPIOOdNNe6bBrgSQoUQ6nsJBfA9rSQSz2qFWmY
         KWV/3s43CRH6KKgvddwnWWQ+2DBCzYHV1bWx2C6AJVWo5+ExICoeTNeFSTELcBRexGA1
         +8Gat+K4D70v/54vcc9gUzEZprE6wGu/Op59olVagQzwdG6OHhrF1yPSxwVy6SUrFYZy
         mv0g/awoUcBKAKaluAv+MIvfVVyeklL6pvYrGWhLucspEwpmgVv42Qn/ZryMVQAzkAE+
         owIgROEdnG/ptpO5IYdC+LBLRY3YYSMRULeuokKkg/p3W2xBzRD9cehdVn9nOETasNyt
         LnMw==
X-Forwarded-Encrypted: i=1; AJvYcCWle3d8/XQqfHAxUuHJ/lS385IK0cXnJvB1ndRLKQzPTkrfZc8JehAI/PtDKNNQ4WUYIfYDTqDWBVIN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzevuo7/HbUe9yXVeApS6EiEiGv2gIGYtUNQGtpzsU+6qno/0r1
	E9+RyaowogP3dGB8/jWTOXjaYr7nThPJMquTdhaE/YU2B3gtOB84eAcnai3iUtkliRGu14clZrm
	jfQqRlNSclY/A6I4on1srsPqKd4EM7OS7FgAgvA2PD/k1OLtKjC93UZHVpb6oPuy1
X-Gm-Gg: AeBDieu59qwJQ+j64qrh38pt+3nDl/I2NB8lnjUWqw0/9TrM4KqGytF6od60Udi7p6N
	RuwPp0O3dt+FKOkiYWJQkgNnUYsW60zsTP7UhNnq5pkT8puV7ch+Cg+DO9DH51IQlKITpmVyilk
	kjdolynqwlm3EM1eG2apmcAqj8SqyDdcvxOgQvCmiQ+8ptvjzzXF868xL5V/ycLOv27L3ujEDmD
	LUhYMQud7WqO+L36TpXKnoPnxy6n2x8mL5hU386s5GIhD33pvXNvo2AeLX0Gs0JizGaDR4BTllT
	rdkTJuZPR2FMVVMcgqfcA3S5AKgUusXnRuzzR6wnIpY/SRAo/o6kH2KkLC3/5ALoBzHLWLcP2Ye
	nGaRiGgN4wcw3H/aoMn106F2ei0xOc6gS3MSSsv7NmBI6MIb5SwDomMjQJC6U3Q6olOQ3b5I14F
	oHKuEa6+I+asvrO4Zr7Tf4agEvHyh1mlPBFVU=
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535781cf.53.1775339684875;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
X-Received: by 2002:a05:622a:834c:b0:50d:41fa:80fe with SMTP id d75a77b69052e-50d62b09c81mr101535571cf.53.1775339684437;
        Sat, 04 Apr 2026 14:54:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm2351011e87.50.2026.04.04.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:54:43 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:54:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS
Message-ID: <saj4lkm3cwoihwmzensubz2c4xz3b6o46bwevnsnwk3s4oxgp7@mx7qnphkxuos>
References: <20260403054417.167917-1-val@packett.cool>
 <20260403054417.167917-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403054417.167917-2-val@packett.cool>
X-Proofpoint-ORIG-GUID: 4SUbAg_Zwv15Ql-qaz_QXh8YLLsLGQeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwOSBTYWx0ZWRfXwQKC+ph2H1TB
 uJNQ+nAIQa0HRX0bbpW5ce/fw5t6aNW5XYoak7pUl+noUtbBhGPidU29nWwXTSORfYG9D1Q/A1z
 YtkrFs3Z4Jrwk9U0z3bizS+PJT/12rbJLgoto9lsPu9ZoSowo6oJp/poni6msi/V09xneNhNaFe
 WnXbCbfMLHc+PfFdGbu93WiOCf65JYAFAQpCUJp18wdeqs2jIyj5GyDVwK7Vdg36m7w9xEnUowR
 vD17Yix6PAHF7KxV1CYdB0mORNUaytZ7Hs/8gba1BBY5HOjUV82+BIIUlpikE+GlDCKcY/lQmYQ
 ccskFuPI+mwGufbK/FDTWWtpaC2vORT7uiCmVY63OXRLJmJNi1KnwKf5nqBKdqNbWAVhxo9gw3J
 rpw4z/wObMZAQ+KlbJXfY9J5Yet4V1OvhWLMG11sInbuJIGEk2vGNn4Kh5X0k9hi5ppPZQj5lNs
 J4DizCkJ71t4ZJrNusQ==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d188a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ePosGYAZjQQ63RukehsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 4SUbAg_Zwv15Ql-qaz_QXh8YLLsLGQeD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040209

On Fri, Apr 03, 2026 at 02:33:09AM -0300, Val Packett wrote:
> The Motorola Edge 30 is a smartphone released in 2022.
> 
> This commit has the following features working:
> - Display (simplefb)
> - Touchscreen
> - Power and volume buttons
> - Storage (UFS 3.1)
> - Battery (ADSP battmgr)
> - USB (Type-C, 2.0, dual-role)
> - Wi-Fi and Bluetooth (WCN6750 hw1.0)
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: Apply suggestions from Konrad
> v1: https://lore.kernel.org/all/20260329103055.96649-2-val@packett.cool/
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../boot/dts/qcom/sm7325-motorola-dubai.dts   | 1456 +++++++++++++++++
>  2 files changed, 1457 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
