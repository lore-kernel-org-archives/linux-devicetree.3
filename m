Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80D3A16AC
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830936; cv=none; b=lbnL8W3njOHXAAO9xaBV77EtENqpAuNN6BRND+RkkHoodblWXfQytZVEMQsyU9KSKLy6Zm8AGVd8QPUe2XuIk7uFrR0tOT0VkfIutFa0tra0BTpY8O4d1tHHqZCeMLjZsggt/K7hLjo8vSFHOhMF74JPDyoTt11Nj6E+qF0Jinw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830936; c=relaxed/simple;
	bh=IU878TfwJWjEzViHg7yoM85ADerUxuFmfEEp3heHIM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFc2e/JYBxEhxy0e1WJQwcbHvBk222Y507dpO2LOy4P3x2LkNLCwZOdfod8vrzS6iY9wj2tGwkK9R/FHsA460+XhY1/EgC6kfgsZY3dzDpyo6emVSQ6Ite0R3hNMdQl8P33iSglX1BYbDg+oSp4R8RTxeMnx7T/ElpK3eBrwKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgNotiYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SG8g0njK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgNotiYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SG8g0njK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B2o2l417601
	for <devicetree@vger.kernel.org>; Sun, 7 Jun 2026 11:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tQH54m9TrZTMQRynVW84/hWI
	Q9TwqqdJmnTFXIMCgzA=; b=BgNotiYabJwDU67jsdEKqsjHjfHMX39CCvNi/6wt
	seocsNnlcGyiiQaheQFpv2f1MN5OVkp4yOHXU+93rt7EPAl2xDsD7oKQebYTZLE3
	s1eyW8j+9R6iC1ADS5oa8Ni9U4/mwnEjsXqRP8fL7ygA8Kxvfc62GLJg9XGXKKnB
	ZzEC5hPOZYTCmKBHlpXBkoUCe9FQc/+sCumB29fIyjhHQlUJH33OSUUpJEWdclIh
	uOo42c6+jHS0vMea6Y16crDlfG9aQ05yRT/MWt+3X+85QcJNRl2RxaN/6ixwcQSf
	VAEAcfsuMYjLpYG0bPEnkjpfNY/SdgUEbSfS0NPB/Aqn5A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w3rw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 11:15:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a94a743521so2723947e0c.2
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780830932; x=1781435732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=SG8g0njKVuil/1wfORaH1qtTJVNSUXxQFrDO7eqjJbtJMQ4k+qzHke/XxJ2muFHmqM
         qkxKirSKkhMEeOpBLSVNTX5m0zTX61e49Vi/6PsGIFHewIz/7596okNeXrJ6BDTZN+Eh
         qomL6s2jKQ3jQoMvd8sPP1kaEZUliUwariGKUbWG+WRu68xXRXFGMTBwoz+sUq58tfxW
         5f8VZVSkFvCbIevyRPoNVLLX6bdJfY+bcGEzb/0n8mewpUJ+VxMxGH/kcRJ6mYrxvU1H
         rSJV8OeWRgEfKZ8V7gclGSxrOKRHnOv/PuwtrU+GNt8PxqOzVSvxohAKoXiVqOz0VQph
         WpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830932; x=1781435732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQH54m9TrZTMQRynVW84/hWIQ9TwqqdJmnTFXIMCgzA=;
        b=TAeHSW15JKzBLIS25s7oj6Tp96FWHlJIViKp6O2MJ2jtMnZQCPW6z6eWWcYPJetIxZ
         Y1EogZ4zc1A6CZ90q0OKN5V7l3R5QGCTrUOVEy+r+gYP6YYCycsLpnJjCsvnOE+7Np7J
         CxK94Xq7nIqXEG75MGaqcrjNpPxuVtCPURmQuAnDSEDqwO43uSUeB4orl9SrNJHyg5fs
         YOMourrPzZoN+lk4y2dqxKWC+h/0Bzzq47Ja/tBtYPK6rJMl2HLDx4uIflXQCLxLslLN
         luExWSw55+w/g3gIcO165KGUW5LkZgY1C8qassqRUbwE2L/cv+uSVfRlwhLN3YKlkxtT
         zx1w==
X-Forwarded-Encrypted: i=1; AFNElJ9wT9pnoBuTUw56p1Y2HCAcr8c6EjGhutoL8T1UCBRN3WhsvlbIifoVNK5ZTuzxk/hsRtG5sM6Vqaz9@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnK1iYfBQgmBHVIFWsMuKxoU7BoPx4I8HOXa3N+RTHM33g5DU
	5EFalK0K2L+aXvsRFoFqYnvEQGlA1tnU3EaxlHck1BRZNbp2wgL/ILIg3xHep6RPu0szBT8z2Nz
	WcuYFGE/Et5Rdbh6aIOiS9E//vyvkkaovSyOcXyAi2VrJNcxjJ8pa5bf16PQ7MhWf
X-Gm-Gg: Acq92OHpzrsIWkYTA5VT2gbgF8lWyYXtogk72Nsw2qgALMs8NKCqlV9xpMaTknoZ7b/
	TUsPkH26x10gHmT0G4BygjD6qghpHy6AKhkMP37mIU7XAIVR5J8GcDC4BftFhXBjpRuoLowo/Xz
	sWosp8Znls/nyyE/3FNUE/66avqtrO9qScMWQrnF3ymK7LzTLS/mAfF2akRj6/Dx0grnQNFV1jq
	btoSThbje5Bp9vMLJCs3ktRq/AUkZrK87vxohcC/hISgd6qouFFeMBuebqlZskhZyW0dwLdwSa/
	uieYzsxmNuqvzD+orPf8ciPOqvpjXRYEALlLpKxkCqNGsn1z8L+1MYlYjrGuN+4eHaspbx4l4FL
	7hW6ZGW+uh1IVNhkuZDUT8v6Ixdes4BEqTSMNlECwTT2YpGofFokxLbgsnlGWq6CGleKEeGuzpK
	4i/H0FEjhek4oxKO9dXH77yV4GtYP1UVC1NkOP5JkM8VOE9w==
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259287137.15.1780830932444;
        Sun, 07 Jun 2026 04:15:32 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0c:b0:6ef:f691:7043 with SMTP id ada2fe7eead31-6ff0eaac5ddmr5259263137.15.1780830931776;
        Sun, 07 Jun 2026 04:15:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d3a1dsm38587541fa.28.2026.06.07.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:15:29 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <isuyh5tebydvld2lxolpx3ukunmzn27mx2pkamsu4wmolnnyp7@defpphasqnit>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
 <rvs5c4shgeroxsllqtxyjtsrb2447yprucw7qtmeissbbxtvtb@24nexo4dy6r4>
 <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d5e1b90-5d81-4e34-a4f1-79ef1eccc0a0@smankusors.com>
X-Proofpoint-ORIG-GUID: Jm3LrfQ0cJk9Xm_2GYbNe-7lZd7laorr
X-Proofpoint-GUID: Jm3LrfQ0cJk9Xm_2GYbNe-7lZd7laorr
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a2552d5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wxLWbCv9AAAA:8 a=pGLkceISAAAA:8 a=pxQ0L-axrEwUrt4MK4AA:9
 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDExMCBTYWx0ZWRfX+FvrqD8qprA1
 5j/70ACCDVD1RD6JMHjbY0O8sEEhu0z/o6h+muvlp/eAaNXfQd41rYsrLR1LAj+eWkZ3A2XvZhb
 KVICpXQGfPrzTx7jJHyPKCOOE9bMEx2wTwYmOHS8OdL4Z5VqxZKps2t0K+yjw0sbOrc5X8FEIc0
 WOkO0NvQ1n6Us82crkqTnmw/P/HtvwDPhnOFcbszuTQW4Sc+k1Zx0Cr0TT3STZGl6+U3oO7PPNO
 TfVP5WHcaMa8RLR9VuD0s9FIydH+Hsg84bbf7rUI5afZIcRSTXL4Ak1RN1xXXCEGYAEH2e33dLW
 LCEO4fmqXvy1rHZ8eqbCrm9MizhHezmkPCquRC+ubU27Y3Zux6u6eZAo57zt5JyLb0JbJFXfyaK
 YWc/oLP2zh34YtEY4Xak8JnbgeDV77lbFd8ZC2BggpLtdy5HzMUIH7PvWYDBCewg+8SUtIUPo5i
 13aW0+MTXlY3vykQpng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070110

On Mon, Jun 01, 2026 at 01:36:48PM +0000, Antony Kurniawan Soemardi wrote:
> On 6/1/2026 6:38 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> > > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > 
> > > Add support for the "qcom,rpmcc-msm8960" compatible string to the
> > > RPM clock driver.
> > > 
> > > msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> > > rpm_clk_apq8064 for this compatible.
> > > 
> > > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > > ---
> > >   drivers/clk/qcom/clk-rpm.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > On the other hand... You have added APQ8064 strings as a fallback. Is
> > this change really needed until you actually have SoC-specific quirks?
> 
> The fallback was recommended by Konrad in the initial review:
> https://lore.kernel.org/all/677f1d1d-a1fe-42ec-9e82-c9e504873c98@oss.qualcomm.com/
> 
> As for SoC specific quirks, I don't have anything planned right now about it
> though...

So, I think, this patch can be dropped. The entry for APQ8064 should
work already.

-- 
With best wishes
Dmitry
