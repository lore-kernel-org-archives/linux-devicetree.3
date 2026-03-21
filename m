Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C72E6CD8
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086059; cv=none; b=AcrKOz/aNG9DUWpl1CeWMwCYXEDz5zIHaPfN3rcK9EaHMEHnErOr1gElKdcj/S6UmP/szJOurf5A4DKePe+1eU3U3OT7e/4ifggFClTPnauYYmraJveVkfF+LDXyt41YoXPmjlPjNBuSAGi8wbt+0trCQSK2TWF1oy0DdYPO8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086059; c=relaxed/simple;
	bh=eh/2M8ss7jVx0r7akVgK+/XLYyUSmSMYse/1Hocd5u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lj6fLxFf3eix4KDx0dF1AXpxI1AZUJrBovJMcIyHRHeXnG5jleClDzujsRouV2ipFEJvBV9cQFW4df1YUGzJ8QMRKXJBTfWc5bpq8NZz2dX1FEwvdi23lOt9roYfm4+NICDnjNQnftgEghqzvp3rBUT4tNeBWdln44ljLXPrVKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2g+vSe7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XmETAMwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2g+vSe7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XmETAMwJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L9EoNR1123378
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E8eyVsiy2jHKw2brNCiU2TLB
	Y9m4sV+wrIiTlH9UwN8=; b=Y2g+vSe7T79pCNdZaV1ssVdTTGxEeKkfNm3J5Mcj
	wrGuu3ZH6AB1Yt4fdtpXnK2ktonT0C9MIcFxICLxFQq5OsTx8IKCWkW5aB3MfG0Y
	QrzQ9PtrJzJ5CBJTQZ1ePoJku1iECPxVtuSIp7APVLM6ilHel15xMcZDdTmkh3U3
	GeRi7FuSFBZp7TlGDWxSm7d8LRfq8zZ1Re+Jxm0UMI62dIAVxGk8iOeOgOIy7/ew
	Zyf18wITZR5Zj9Km+QoGT5I6pL1cYw6ckHbhdibJp25fnGb6p1URwk7g9HcYLa14
	TNg8HKZJGbyMpkjwvKi/MZyM4Rjh58g/kZtWMpsMUta0IA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgh8b21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 09:40:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso199002531cf.0
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774086057; x=1774690857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E8eyVsiy2jHKw2brNCiU2TLBY9m4sV+wrIiTlH9UwN8=;
        b=XmETAMwJjfZ7UXYefkFzfKHzebn9ak+V9OI1lQnZrHYU/W0ahPgNBXxgb/Txd60X/1
         8B1d8XhtCTm6EEkxKGTimbgZI4bVVplOZs2mskLtAD+JZpb1bR1a0Suz7R/VpO7aDIoG
         wtK99OH3U8IxdCJqTymMYqnS6pl/wHnTZXSaSLsjgaZY2Mmhf80ZS8VmnCW+eDX1YaWv
         Io4GS67TfZ5nRGlRBZnkOVTWhXvh7sAO2U3W0VGGIh8HC3MGyHnKjGKK5b2HI8xJxIG4
         GrM5dIkfshv8yQTAEa94+zFKq0q0L9q2adU9X7y2MjgiK6QI4QJmNJ0FJLHdWBtE2YEr
         i1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086057; x=1774690857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8eyVsiy2jHKw2brNCiU2TLBY9m4sV+wrIiTlH9UwN8=;
        b=eS5xZmrOjf+3yOzNcIb/KXK9LXsdLxveSBbqyU/iqOCMOZnC3+eGb8fa1qGjVQhgDJ
         G5mf+0fZgntIzEAbJ9Hkf4DjjAcOf6BiSQaK87LqxVXVgY/5nYaAmN36ksrKFi+OPUOe
         zkbN1TPHy5xI0XkUAIB55DSFu5GTwkSJssMfr7cZaKBlv81FBjhd71B3JEwikDrRzBlr
         z45fZDt9ck3Ej63zQpg2F3GNaidXP0Av2OYZsUSiWuAevCPUwuXpIs0l/pwaMpq9VDbN
         JxIlYtDLBljT1hXO9bRdFjqnPiQk9RNIGY1vNkO/JsNm7/u74h+RwGwnY8LmskwzUUr8
         TwPA==
X-Forwarded-Encrypted: i=1; AJvYcCUVbYS8jlSXzXF7jrZqM7om4ywa8asI4MLHnstMV/oJtqMEV4N6bL3DAuPlWk22XFaJySG58WlPwO4c@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYotPjhrQ7r7bxliwzCQeHNA3M+V1XrORJ8SxxgWx1vMv8vcE
	3g5ihw8v53TYaUzlolyy6f95Pzo5czGi+X8ZSl/C/OaCKur5aUxgt7RnY/wCF6cGfYWJRR6cqMU
	Jj8bdNdUcfa3ORnMUWe6wSYn1iRv0dDXlzvzGIbtQsnUxUpLv56r2ZTLaomydzvHd3AdBjO8p
X-Gm-Gg: ATEYQzwGlrSPT+XWJ/Ei9qyZYWysFW8SoZSUbaUJgd9Yhgtx5x25bDDasKCh8t+mTZF
	fWKaV7cX/ycObvwKu/KUtiemJrp6Cjd1voKreQCQAVCgdU0KM9vMLmLFEn+FnDnivCChb4UKrDk
	LpMeLSK9ICotrKBWf42oJ0f+rpAmBL/ZTdwjTqz0ObclyRzMETH0SEpmrsoR1HW7F8SCnEhe9Ke
	GwUdvVwjc3f8aC7FR1iLz2kiifuZlLEOoFx/k3MtOwLOi/7rMNM846bGwePJOY2RtK/uMEAblAq
	kYFvwzJD3s/lVSnnI9xaZsWZ9yM0rg91I5OFBMa8+E+Cb0O09XJmVBa8MZrL7XIrT8cAfLAOynM
	iOmTtrmEkjrIsXQnrd03YcMAG7VzP0AISQA==
X-Received: by 2002:a05:622a:1920:b0:509:3141:312c with SMTP id d75a77b69052e-50b37505585mr87976151cf.40.1774086056770;
        Sat, 21 Mar 2026 02:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1920:b0:509:3141:312c with SMTP id d75a77b69052e-50b37505585mr87975861cf.40.1774086056260;
        Sat, 21 Mar 2026 02:40:56 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm13456033f8f.3.2026.03.21.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:40:55 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:40:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <45vlqcgpehvxiwj3djxc7ikblldsbxvcvbnr22vt6zpm4uhd7w@oenyyprgfish>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69be67aa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z6vw3kXG6mT7Y6y0E1IA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: HWrQszBSGU637nbUX21J71VXOQxx9EY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA3OCBTYWx0ZWRfXynyqbbUJvkYU
 VkycUzmhlcJQPPh6XnU/7LRgru3xToe7G7MP2IyxOH9V8iq6KWAUZzzSC4sStMMcaetBoXOLksX
 GgTNJsFvmONChhDLhDZFHeE7qEyqyqaWh1Xu2EHUI7qbs/ek9iN6e1vaTQJfvKjL3jC9m6YNE9+
 eOgqfQzCyvq7RNL45BROIrJn7ZP74mnQIZ5BTIrYiIBfLJD7SAbyJ8chwkCloqke68vtijlaJdX
 7OA1pORiR12/Pj/JXLf2LXgmqUkHfwzV0ADV0vhIS2GclgZfY1Z9aUVXmbIzsodJ27RelFZHq3e
 fAcoJU7z/XkfhRItwg5l4Hhlle6/mTzjabxeJUEEgZmaEVxN5Fqflo1GQXaHLGXf8LYhfNzeZZC
 Sb63YK8eRxphOLjYyZjxpfnjISiURmb/XL63IVBYiPOzgd280YbKm/yrSkYlX/guWr0dceACkUu
 Rg1jzLmpRflExYKfADg==
X-Proofpoint-GUID: HWrQszBSGU637nbUX21J71VXOQxx9EY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210078

On 26-03-20 04:33:15, Dmitry Baryshkov wrote:
> Hamoa and Purwa have pretty close thermal zones definitions. The major
> difference is that several zones are absent (because of the lack of the
> CPU cluster) and several zones use tsens2 instead of tsens3.
> 
> Instead of completely duplicating thermal zones for Purwa, reuse themal
> zones from Hamoa, patching them where required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
