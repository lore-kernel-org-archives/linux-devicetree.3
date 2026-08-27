Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E80838B7B4
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822227; cv=none; b=nPhOE2u6UOdExhsYGQdN1/jubxDHQpRME1IE3vrNF+GcOLt+TjuBmvvDcnhvpDCA+n0DKpRwJZwqI+DK2t86s8skxsCsPPnjCgRXyHnK3xTNTdUQw/mVCmukO9eglgVibjNc+3jX/HGyBqbSAdWd2j8QbXALu4uavf/0BD7jNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822227; c=relaxed/simple;
	bh=EFvzre54JxGnezmSd2Zmn1F8pbR7B+VPAVWpl2PZLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM7cm6fFJgpeTDMbU0aEkDmfEQVQ0yvNHse8QLq+bLxnDPDsYzwJoMoOzFb6yQsEjUIvVBODkzjK0oTDUuAYsS2E1BKIFYQehxGrPJGPPbxTi87duIVkQaOLmPkdhshWcgm1ZnFJVRTKTR2cGS27R737C1gJ1aD9/CcN0ZRMEDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsUonT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9V1skwc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsUonT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9V1skwc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RCJ13269905
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRQ622yfIeZ4mbFm4NRuC4KD
	EWeJhchUHxw/jWrkUso=; b=PDsUonT1qZtgzICr9wkFCgKI4C/dgi11f3zhFSzf
	FQ11tvBWhzR3wObvm+UQOepH1GKHHD6D3401nSawWmMFQWlEGJ6+bgxG2hWPwYw4
	A09NbXFrD4SjftVreF3bzkh6T+gkmWcHAqiJUKuy7dMjm6ePmjOqL4C5B6Ihpbgf
	TPvFWhgt0AX/S7p/bNsE4kiuIYQBHuS76vI6EcIxV9Vqq2N5d638P+FcFvwymkNF
	eeV5AQZ9WMhEddH40HcQZKs3U2FipQJhh3pYDBOrRHpNzlZg+WuhzFZ5HkU6FUFQ
	HhTzzramSIjq/oSQskC/Qpo7W9fdkBoj/4ggMfxzv4JfZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075c7hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:16:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so34822571cf.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787822192; x=1788426992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=N9V1skwcJgTusR0rLbnQ/zOtb6rqGfAELG8R3VggyW/JPj2qG5pFYUr3SzCZ0iA48y
         uXDFRF8dWVV375b9qTyY+Mjh29hIOCl8vzU8Wh9xs+5kh6jYuESFbzGSX4yvIfu5yxgd
         m0tkYqoeDwMit73lBGs8f+88upx/wL8wgsMtNyG2ygXu8c07F2PU6dRCVPaEvvGIpe/x
         sQYvIPZRr9r/6goPW7Pds3cpHbMvYmQ7a2uOME3MazwOJoSn0YPVcNiR/mkvQuWrJ7VH
         yNysOmSFaKkcVAsIRzJS8oEFFrn7B1w6OUcZ+hS36sSExotFg0prW6BGDM9KthLZkJEi
         rJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822192; x=1788426992;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=WhAlFHnWHpIvvlqy7aGJsQcoZnFMJ/UGcyKFZOGBgNp4LcPmKwvot2h4eWKc/Wc0Rs
         muBTJDbb4wzYdsR7mHBPl5INcc+VmxBT1lp4Zegjvkoqla0Du+2OSfSZ7JnILYgIZ5xJ
         GKggoCcaT/PmtpNzwi1HkqI9sb+Hx25txD5WrHzHhtJfn1pP+RDFCannpeG4lc6zw92w
         PNqa4crROwTaMbZPX4YCYhwLQMWlnms/oQ7neX3n09/m+ZuD/QH9GmSCdWIXHktzPhQn
         B57VcmHMUwGrtccDnRkA7jj/EWYLPh0byAHpJwZNFv+g32OM0e27PHduR+WBTRektRVv
         nEXA==
X-Forwarded-Encrypted: i=1; AHgh+RqRhveSuKe9tFwGfpSg++l9UEL6p3zuiTjs/RTxCKhJ0tVBq5VaDFPF/p38eIqg+lZNjWNN7CFoOu4q@vger.kernel.org
X-Gm-Message-State: AFuF++lE0pq0tMaZfwqjauKyzi98kCOXhdxj/3oHH3NRUe+wbhN5y6AO
	yob+QXNOiTIImeEUUfDYqunmysW5Ex+dxTgcpF79TYutziWL0xruVMPKWDB4/zhV3sXY4SuTBMP
	hFv7AE9Zmcs1kJcwmZDLkarHX/fN2tiWL4R7SL13+gUBgW/0e92WwgZvR3DNfPxfe
X-Gm-Gg: AR+sD12CT3oRDf99EIHPBsvQ3yV+K0/pWUFt2okj1x1d4VBnuNY29Sqbu0QoWxi+rJi
	x6yIaibrnV+ZQRExij5Q5sGNykkEb457zOIZfOiFqcV+55FdxqvcH7kIoDzNdhRpvmoi4H0ls/e
	sxTGuOEle4pjjh/mTkhr0OzAVt2dEc0M11b1c4M8qvkeqqcc3HcMqRwzpiyuLvwmZXRRfZCkvws
	mR7GNFmoE+5Op5TZYl0x4GU7w6M2ZorxRQvvVdfqI3iN7OmmVIWUGD83pznPJfUptYlNZAU1hOj
	suZJQhyHXD8Fr3Z0dYoQI7pH4OuUEDe7imuTqrAj1qDy6UoRBoRwVck7O3CTTPTByYSXjCrP79x
	IK4W8d0XWf9SLzg==
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153306431cf.39.1787822191529;
        Thu, 27 Aug 2026 02:16:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153279081cf.39.1787822164661;
        Thu, 27 Aug 2026 02:16:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm60354455e9.2.2026.08.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:16:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:16:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150
 into SM6375
Message-ID: <u5ewh6gl367sc4f3x5f7xxyvzf54vznnuevjfztlgqhpjcpp6f@xvn43ih4qxtb>
References: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dfqQgMRfVO8QJW1gmsTG5Tb04JHa1TJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfX8L0ClRF2SBCg
 p/ZaUNw6fJ6rJWARzmwwQwYP1m9hUBlA/KZU071WlT7PgsSnJ4Mx9didIyIl6W7IviPrN6SPydY
 ZsL+Jse6UyYUaekuaPKkWHCuZMz6Ur2S30CKRE+nTHIG47OJMJDYoTyYAynmKayIAC7uHqxM18+
 io2feRmiSD6Atj71F3eCsLJYj4ccTnS1XjNM7adjX1EtsGNZWNJoCIur8fTm98Wg62Zf5s0RsW7
 8izG/JP+hIgQhyn6ogzCB94tkNS0A9kybLeogC1hHrEf1Fo4euuCDpbT6eM2qOS5Tek5HJYxccY
 Gv33CfIzYeqSU0sDaA0x5teMBkwuUbIpNhLi6MUAGpaDN0A6krrXlqm6rQnwgeM8RzKam9wBLiP
 rnyPUEII/isS4o0v8EXVwi71IN4qPGo6bwENs9hMnsO0f8d70YkTuPUTr/2XYoZXhqmX4jayYe4
 nqwHDm5xjLzhFRcyUQA==
X-Proofpoint-GUID: dfqQgMRfVO8QJW1gmsTG5Tb04JHa1TJh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfX3xwJpTZQOP4n
 1Do8OcUgyQQu8oOecaJybWj9bdGxgF89b7BbLn/4XLoE7Y5HV8eZHYyZujd2dM0WBtEdq8wPkJ0
 IJzmDtSSvXf3BqkJcRCnN7FeAmHfg5I=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a900070 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wAkbjeueQAX_hA7IGqgA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270076

On 26-08-27 08:39:41, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
