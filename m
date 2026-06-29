Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E621F408038
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782738410; cv=none; b=ommX+i4jfE0Xg2JY8kyS61LslGmNOXZsxtNrt3KkJw08D6feVRYlPE+q4TKg9oquXCKHvxkR+gK+IfhtqYA8ewEDbI+yDInRm0xpnEw05onSB7vQfVEfLTCETJ8EaSAEeJT+7DWAJqCk4EgkHqoTmKfKYHhmul0D1UqRbmUQ/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782738410; c=relaxed/simple;
	bh=l8xmnKZyogtxblVYuRExx3KDcBcxzaoxeA0hboGd+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixuDRME9H28fp8WgtufJdG040IukBveUhAHv+0R/Z4M2EBRSejKwHUr+cGZse1I6RiqyIEBlPSPqULhCkc1B+8IcYBOMfuc2oqeRMsp0H/iSSa/Kfh+wjfJlKlp3PYi5DYZabY6G8NKH0OSZR/J25hCTfr03pOUVnqVRJYY41Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxYoStG/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpbA8/U7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxYoStG/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpbA8/U7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3fw2641697
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V3Ubk+UOHQ19y0xPujiPR9uA
	upfXfjgvmCMxsopvLFQ=; b=CxYoStG/c/8W9UgQ2yCt8y4qytS4I+rH/zmq/dwd
	vIGMaLjxpshv6ucAHCBqqkL/TGjJQGq+3InBDbpDeMqXNdh1r0YKL8nIwDnYCNs1
	wsr/gomoH6fAom8iWApOvIGGt8VPlZCgIQ1ZLUKcFxbnhW8+T2Wx7WbMLgcTI6a7
	xYMM/7IFStrFTi+zMjLFR8rrzma5lpKz1ITD9H3vRcXH2u1xzv356u0eIyezDu9B
	bac7ojOO/ee3Mk5QoypjCwK+ruMevlEzsIENhG9cuDWLeL9kZEebTiADQHESh6Uf
	3EWdKJJ6Hv1hbFZpBtU9Xj9plcGscwFMXCA9XSjzqTB+bw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nperx56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 13:06:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73883529f3eso1127345137.3
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 06:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782738407; x=1783343207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=XpbA8/U7Dqk0fP0iyqSaDiuuC4OjLWcqeXq9M/q5KZO3RKuRuBTXYLPnYgAbv6xa8I
         ZipoA8NZZ39uKh90OctlR5buDtSt/9LO1ZmY0fADuzuQEeXTwiALa67PCUyNel5Rv29A
         MOtaW5mvEP6JhEAzQZG508b7hNdix0L9GNhv0ABNv/VGvhkAueyOsNdOhgaFAS1opLIa
         tvnL2sBwKFgq7hIMWGaGs7V9whCwT1ZHt/JXyDan17mZSvrmnKNnqm/OfFQYHO9g5Xa6
         f4qtwQTBSL9PqK+JCIxC72uhLHNG0KVPioXfFwSCPeiBdTM3FnFdTAuwxSDN+ZuyCfes
         GkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782738407; x=1783343207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3Ubk+UOHQ19y0xPujiPR9uAupfXfjgvmCMxsopvLFQ=;
        b=BZ6YoaVEow1bQSYMiMlQzjj1S6fuy0Rc2lKGQx5mHd0bpUsmjMQD/4XHMYVLbQ3To9
         OWA/IQzKYsPF6f8F9rKw/iN3naJdPmOIf95a9C6YkG36q+QkR+cA5oJpNvWmZcyadwnY
         RkU5IAheMqpRG8IRYU8lFlPdrpPKz+q66op/dZLPiEicQrKt7OSp1RWS0brY5/SFXCBi
         bApTo6ctEwQlJcKqawWIfE6xznMFXxcROVFNGcc6AsL4y3cdUfkB66EaHaTxJ3E54woO
         oBjHlQFDWpgDHd/t207qKqyKsV0/mKvile8fbz3botogJgDmGHbqz+yy4hO42L/1+mol
         kAag==
X-Forwarded-Encrypted: i=1; AHgh+RreFf/2u+bkIoNt6CZYirDiTHXR+1bnYPY1tHM97pTtGdBynhd2Im0Tm/M1mAgcAahqjzGvjWIe5PFw@vger.kernel.org
X-Gm-Message-State: AOJu0YzwijJDlDR3ceR6LrJgqeSl7EGxnfNcgQi45kzAxiJlnUdQL4tu
	aCoVQ97FrlxJ36bna525rnedqPYTRe1U+0PXEseoaRfzD/2fI/lPzlflXT6daHEKyYvCCF6CIjG
	59qfoojRzJMM5kLcK0t7APnO6RXxVvM0ZiaoxKfkX/X2hsJ9M+BvUfWBSCwxYElk5
X-Gm-Gg: AfdE7cnfxENAAZunQAokcXjJ8lcWA151+BmYFBrGIGDCr6BtR/vuQz9kL2I0RD7lyig
	NaZ/sAmcL4t8UyPJe+V+WCafLftrXuqhaW7PIjdWWmlq2QNR2KOL7rfm1FlKkGnx44jyk15uWJr
	MqRnKzMUecl42Ag7dDWx3xjwutniwjlSLsDL8BNEq3b/TTG/Gzx3WayiBMGCgNnm5d8g0ccWNxV
	Jn7PIZBIFagahw2n8JouJVW/2rUjWPUYPHmh9Kh1Rt3wuN5hmQJntQ4N2LGKxySexVaahCv+X01
	3AzfmoSJIrh9iK18q0OSfL68J0T0ADGy+c6ZCELU+jCe8ndb7+1bggxm9KQ5jzsatnn+rlMMNF7
	tAZYl6rDdcKBFh9PE3+aX8OJ+km6/W+XWXxUlWBbYS1R2uxxq0yY5GCcCcll4LKIn6gHKywrXrQ
	rpjGSebB49y82JIib4LKdtXCp2
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018154137.8.1782738407159;
        Mon, 29 Jun 2026 06:06:47 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:6c5:d55d:c093 with SMTP id ada2fe7eead31-7343444e59emr8018089137.8.1782738405311;
        Mon, 29 Jun 2026 06:06:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a8b6sm5851946e87.39.2026.06.29.06.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:06:44 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <uyxnmtfrcwmgz42vhegr6t2arra3kebrvs2vxo6252czdw5jip@lt5uw2ge76n3>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
 <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629123359.3469724-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX6QVBWuPP3Txr
 GF0yRsiF2C/d+B57tAiFeg++13cpe2908z7+EYz0izC0Qc1js6A77p0Dmp00UWXfSBB8cim6rr2
 YhgqYw/Osj4cFf/HkUeMTK2FzQ1fghMkwMe8hzaFd3R6EEO7I1c6TAGkbB7eDdZSpRkT1zHeLg6
 FWIRq9uxvdgcm0raJXXYbMLalAtTDOUQhcsA5FDL27o2/T5L5MX/NsTODavRFjQYKxBn8Z/Chj7
 duz8r7EiuMVgAu8NjvL5QlQDy6EiOfPDJHjjOMZT9cF6Zg4mXLDD3hehVpz1yRJpbnufhHHlQUy
 782PZH8otLRk30jqQvTRrX7cThnQXJ0RsIxSPNoW9toYYj7lPQ19d6gbsjjoJLZ6L0zBUdeAszy
 pB6EqVtc2bpoRCKkH/qrCngqMhJPZS0hPt1BNjEZsdafD7Hm7AmkxLrhRfeE2aEHy3wQ9Wnm/9y
 CjhOhz36XmXS+lksqHg==
X-Proofpoint-ORIG-GUID: FXc-Y11xhyya1tPvfZl6Z-ZDSF7ZJ6uk
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a426de8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Z7R4kEFDkqlNfSA089IA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOCBTYWx0ZWRfX3xxs6qwty5ZZ
 Xi863HRnY1QPkaZpXFDaf9TN9A4BIli7mkor+p2D+Rt5tjS4MpPu6Ypegfq6cZEQwLvBODa97eo
 3WHp0c9Boz2N4T4N1i81I9P+5gxEQ0o=
X-Proofpoint-GUID: FXc-Y11xhyya1tPvfZl6Z-ZDSF7ZJ6uk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290108

On Mon, Jun 29, 2026 at 03:33:59PM +0300, Atanas Filipov wrote:
> v3 posted:
> 
> [PATCH v3 0/4] Add Qualcomm JPEG V4L2 encoder for SM8250
> https://lore.kernel.org/linux-media/20260629121110.3469048-1-atanas.filipov@oss.qualcomm.com/

No need to bump all threads just to point to a new one.

> 
> Thanks,
> Atanas

-- 
With best wishes
Dmitry
