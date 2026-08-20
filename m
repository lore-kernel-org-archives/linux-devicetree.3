Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145C442FCF
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229511; cv=none; b=tZonLHnAbp6Qj51ZCzTSngMwAzvaJSx87pXG0Jkpy9pXUthJHDLRXyRWmmie9lG7kZS5XTQpCdhd5/vB+GafOtbLbYAMX5A/LOogkgfIQXC9Bf+cSyHiUReochdU3uNAQXX/PbnSrg/JbHH5+Qdg/4sD72sKOhQk4tWjl5i4WCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229511; c=relaxed/simple;
	bh=l/R1/gOoK45ubjLpI9AENYiPKBHJHxzJitxKvQeWDJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqrhtMDI0/ddzYdkYbSQ31kwIohqNNtrI6IEPkPXFU9LDNk6o9qd8RLILuAjGuNoskDKAhFV934pvkdysjXMjklL35bNvducMTTCqBUSSGHVzPV3jRLRNsGK60Cr5pmQcD/UsF/dO0w8u7xMz03ozrNzz4X3wxP34nP3mIPQaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWEhB/XT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktDd3B/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWEhB/XT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktDd3B/t"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8tK9c3515491
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v7zLYjanpfp9TIHoeaGe4PsU
	F/pgzLalO9L/jWNZMoQ=; b=EWEhB/XTy40L55d3I6BqgBjSG3N0aw18Kz3B0/gl
	xxbLW+GrKld4bOzheSIU0xKDS5WcCDWw8WVLoiS8D3mpteMjwoKNdyQJKVD3yIJY
	SOo0O5wAP0snDMmr0aRY1o9kn83EBFIIePsLjynzeoKGjEI+FJNF3SrByNlkdymP
	Os5N0EdeDX3H3kfrm6fExdK4Umv8gIpY70dM8gQE3sEF04usrhqS++SNdu2EJrDo
	IGt1XlYBL0vwPpwoRVt3WFW9gjGL467OReWvYYcVHmxKSIac6TIFw4OBYQiddFY9
	Q8rX21I4xPSePqq2+mfik7asL22lqy1H48DlvP4MPmNyeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc8tvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 12:38:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso203309585a.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787229507; x=1787834307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7zLYjanpfp9TIHoeaGe4PsUF/pgzLalO9L/jWNZMoQ=;
        b=ktDd3B/tRKiNyQEUwCUqzWvgZmXQdOw5UOjKn54+8Dn5aW8Yj0qrHs8cOC1ix0fiWd
         DIFAUVvcdj0vizSCWPX9MQjmiY5hi92/sYD3j+mZcCb3vcMl1wFw3gCpR3xVhW9ukGMX
         Mq+A6ShoOGec+kIc8ZsRAnjIyPW2q6D/6YwIYyySEXjThWGqGclpbq6ZnDLyXf3tZYry
         qY55M39RyfGK9v1/5h+8OjmzKj8KfxbEFx4GQJVbymc/f2FYS/obvNPJCvSnN53Jdpk9
         P9CZZFg0m/kKIbhR9lHMxrKq+/gQ/HsTWD1/ObPGX1+HflmHhdZQFK2E42WFjOPWhTGw
         lDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229507; x=1787834307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7zLYjanpfp9TIHoeaGe4PsUF/pgzLalO9L/jWNZMoQ=;
        b=FlRKv5nvEi0J1QiyaI+8tdSy41tQz6eT7DdvHR1t16xgEABQbsw2BE1dDZu7DchlP2
         ZpXaOFY805hv8YfpIDtHcFh+uZcYo80zPCxzLBxAIB+alXKfvSOELPgLz9+BgjvFlWr5
         bVCfvudiK42f1B0lqck96AeH6tLTtm5/hnyHCVL0QcRxAHp28ZtE5/brSduQz+SFAC7z
         JsaQCZUl305u9CWLKEyZ681UN5+PgOSfvH3AQdsrLDtssU4NAxfFYTkUS8ZCQCUNj82N
         ukdLCg1oYea8zboS+Fvf4Sotg/RhHxNtd+OgJfoHeIBdh3HSzX9ovbNh97VP+t1m3OXK
         3Kng==
X-Forwarded-Encrypted: i=1; AHgh+RoIOiUfd5kIY2rgxLA4ipD6r4bEMyYpRxUE04Iu+Jj+a9SnBbKAkqEr70EUhOtOPBACN6uEWqlG4QiA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wbkBHyHgsHWVOHtyqSR8eb4kqPXTPiKraNFRSCcL90y+/K5o
	ZQUouBpJTu7OpyonbOpLoWd7C9Y49v06VbfzKoF9tI9wZbsd0t1OVEt6ikTf2MAKPbktQQ+6dja
	eWPrKpEScGc+rn+fPUPZy9UspJ3IMdaInTl+lUZmcwM4mcHHjN/EjNeOWxva/ayZC
X-Gm-Gg: AR+sD11EkrKBNNpLYa57KHbGCD9dgA3kJWckL3SNbZvzJgZlQgtdQ+t6gs2kq6Co5dG
	tppZADQyDpLrYddfcABFAdRIUcz9ShLncTl5rFEU6ZP2NUIIvVtyG1jPe2JmSGV+/Ag9pksdW/A
	XrXjXks0mZ46DUlbJ4x0uTbHqcSz1qVczLR4+F3q1oEdoHn1pbSUa0uGOggnPPttL48yovJiuR3
	OL+GRb7u9Cwz/L10AwlxDGNgIxROW0ZhLYDfUUi1NcZxMl/QRbGKLIzW7jQd1HuW7Re8mPq+jc3
	TnzVUGTA3GrY2RnLBnwJ+9FQpCMI0DHTBDXX/ee1rkaV963JlF4cGKVrdzr3hwUdivnwJBHL6FI
	9lFsRFugTfm15TCM=
X-Received: by 2002:a05:620a:2590:b0:936:f9f5:61e3 with SMTP id af79cd13be357-9371e1e0984mr1097070585a.1.1787229506590;
        Thu, 20 Aug 2026 05:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:936:f9f5:61e3 with SMTP id af79cd13be357-9371e1e0984mr1097064085a.1.1787229505983;
        Thu, 20 Aug 2026 05:38:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa074740sm150341215e9.7.2026.08.20.05.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:38:24 -0700 (PDT)
Date: Thu, 20 Aug 2026 15:38:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <kagyozy3pnlmslc6koypfrhnqutfiruusnwkklkxpfvkizf4aq@eevs7ox63jrf>
References: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86f543 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: i8SneSWj7g0h2yCVBl1lR8BYZ9s2g-EX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfX8QGrt3DA1Nq2
 M2unZqPC/jHZTsaSRdKylegOsILwyUvd1/MOVf/kWwr9GoSt08WWMa3qrpXWU5dDxG4FQboNzua
 zzFkraw3DCLq+1csdZV+dvZY0F6tvwz6jig9g9kwvXdV73fGHaRomYT+nsTPjKziW6UnBChXpYT
 tVUMPLdJmesELXIMONwsn7OHhHJqkVvyrv3a4/bp0cBGZubc/h08zJGm8K+s5TeGzuMNkuvk2kD
 Y+Xx9H6oaOu1IQitPrnv9oBCkptTax2ke5QMzlqoPA0qWo77wlnQR+kvC2HLqpndJg42IHpqrDf
 xPhsTKPRGn2y0MOGDAQxWO0YtauZ8JMqh2czY0fLNoi17LccR7XCpFACL8SCrt6Sgyy1Q8RwpXT
 tnUQ2hIbjjkl3k+f+WDj54cd4ILKlDpJmU3rAqtlreCi3+Q52XK9aZYKuBGHVnlTHFwrVJJsZvI
 PsXjAQFe4/5bAl6smNA==
X-Proofpoint-GUID: i8SneSWj7g0h2yCVBl1lR8BYZ9s2g-EX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfX/i5MEeg/Qj0e
 L3ZFJ0B8+eCmftu6vIFDYxqKOiCNwvdC2M09m2kjC8WWGk0YpVrQZ6WNdTpDD6iAsgTFNiv8+kS
 Npd7d/V6dCDzCLVUy9JZyUqNU5C+iE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200094

On 26-08-20 17:46:56, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> The TPM node is kept per-board as the dTPM hardware may not be present
> on all future Shikra EVK variants.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

I don't think this should be part of the commit message.

> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

You have sent 3 versions in less then 3 hours.

Wait a few days (at least) between respins.
