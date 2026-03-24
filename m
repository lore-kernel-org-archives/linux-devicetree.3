Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B53BE659
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349362; cv=none; b=NDUPZVimuvA5QqoUa4nhc4M1zjHqqsEd4oOBkozpmmhD2ANO9zZtRB/buTro8BTusIFP6x2vikdL0XlWlWvBvI9ZOGMiOMKhNfkIYYWOcIx4mAYWc0QpcxjI+Dc1mbxiDkwShylG9gLzlwrKE7fTYouB9UKaKPTou7NvD08QOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349362; c=relaxed/simple;
	bh=IjpnHCeDmjW2Scg1sXPAEhkG9xa772e83xdWC05sYMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0OAycPf2lGmKHu/p9bQoZjnkLXNOt1Rqxz+w8B9MSFHygf0GJD5uPafVICzh9c7oszAsH8Dbl/doQXtvHaQjLDY1i6DWXlV1wrKciAvLhDLZAsvJCSh4rJ2nZn5mkmrvvx6chrBJFEo12pJfpPHJmDiJvb17ZeiudXWyNBPs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCjRROio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOZONhOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCjRROio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOZONhOK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O6XY7p409088
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=; b=PCjRROioC//sHb2H
	MVjqUuBH3UJnURQXC/0a85yChIymRAYk6d7ZswgwTL9udZZFGSkAHktssLpoJZ8G
	0v2S2Yy6dtMxqaZn9Q4eybmy0vZwvLdiJko5btL2DIEC/Jbrun7nj+eE3SXmUmK4
	z6gx6ZGjeYNIhX1fURrD3vinzZdHDRh13XasJ+kJOIwjS1VrEQp3XsDtlGe2x5wc
	Ai09wCzhXD6u3f+JHwkp4O0+fCXlWhd6y9TlgBMq6UptOk6i0aQXfyDC8X394MH/
	UFaIPQmwcrqJqUEd3u6yOVQp+o50J3pHGM4sYwjx7EwjTZEKpRc7NX34U3Uwrbnr
	LP4I/w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3nexrwus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 10:49:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50947db2e97so45362721cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349359; x=1774954159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=NOZONhOKILRG3XhsmwcOAHEinNdQUu9J2sUGtwwU8e/Mpf8WCXrFiL5PFnV12pcs+q
         H81Ld59SgNCrvqiry1MdRDEAwe6khbLPrXeCWZJdbU/z1gR9V5e7dz7knrZ/2uDac0z2
         GvWwOUGylb/JVSkC1+gD+O7DchV5z6TVJvKnETy9i0u+FNeQhoaPgv05QL4yebFBdpJ+
         hxhdGNC/HsXmVa14WCQpGm7YYhz4Ia7pFhrJZX6vn6YYKoDq8n9uG0njzUvEHA75PUqz
         cXzj0LEUcsioEZt3WCUOHy3G/ZdQFr8cTd06H3lLxyMmCAEldHRDhtdk+h+k989spYpl
         KMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349359; x=1774954159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lVPbhuG7aZ6hrbJuahOuRBjUqlqJeG5BCXHtRYeuWE=;
        b=Vzdsf1oKS8T8Lk38hnDF7WxuRVT+/X3aETPyPt5usvdmdaUtnVsYsS9I/K6ss5NLYR
         YqhuC2B1SkZ2sklbATPU2u++JWc5WSSTt2zxVeV+e4k4yGXBwHe+vtxytRkms6TYfU3p
         zYPIW2c/sEpbIJKQMZ9+VZ9ZZcU1tWTRUrm4fHkexIqDjj8c1vyAa940lE0uiPN/tGk1
         gePsrueIrSaDAZR7edO7d8PY7kw/yd1VhJ9Uu6PxXKwe9o0bKUr+bmOkAiQPYvLKAcOX
         1bKxD88z84ZZYHE87VMfSLf7a18fsAz3vFYy3YtPCTNOt5D33LEkiXCp4v2fEfwO1mCk
         7MPw==
X-Forwarded-Encrypted: i=1; AJvYcCV9VCVZFwwFySBn+Xz5NGC2ajkfpDnqtaXfE7xnxd52PTwwcoG4ZPAwGhh0fRql/3HFlv0VEEll7hMm@vger.kernel.org
X-Gm-Message-State: AOJu0YwpcFvwbN6+h3KlD8OWGkpPCMxdd8qdC+TXPCanRFkfh3hXBRsc
	zc0zZgLQOG7ZMyzSCLKSx12UoN3EwqMMpEKyPcaLmn2gkiJR8QjeKkTL+Gue2J5CScb8Ly03BrX
	sMdlWAY1jc0Dg4x9yCYRkj48SXaJAvn4QHq/3j6sZu5JycIxHRwwGIZZRQAv37Ai3
X-Gm-Gg: ATEYQzwFeU0iEXeVkWunV8mL2s6wSHDgLzYjc4NGvI8pnhd7BYg7TOIxGJbSjOzvKUr
	B/SYKslAH2TE+SgTLISJ0CjXbooozBamDsAoctbAEDwBLM+i1vuBttNoADQ7x0+4Yn5K8YdaufU
	yKDO0Ji+tpo4P4EbnBKYIY7if8peBnB5XGRRjWtO/y0+e53Na21thVt4D4y8oZjNgQbMys3rSx+
	ChJ0EPyV4spUqSk1+hT3SS8CCEp9NPzRPl4+S6v36mcYVN0oVzlFuyNcbXVCbVURMICQkUeuICA
	zUohVFJk4UtrAxSmmjtXLbDXpnwzacLfYg/u1I/1MfAZx9I/mng2NXbp5YMS4kLplluNaPnI/DA
	sa+DwmTR9RtyG+Cw3AH1FE28gd/9B5NvPNXzFl8YHLrtWnHOcvme4FqJv5JioJFelRMgogHKcix
	jS7u0=
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260241cf.2.1774349358669;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
X-Received: by 2002:ac8:7fc4:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50b37425de9mr178260011cf.2.1774349358231;
        Tue, 24 Mar 2026 03:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm630113066b.54.2026.03.24.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:49:17 -0700 (PDT)
Message-ID: <e32a0a50-9c15-4f3e-8c83-1f96e5aae4b0@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:49:15 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX/Ef25awRaQ6K
 Zyu5cB5jasV0ueBTvYBI8n++pOSHws70MDsh12+p5xLGdOYcFCzkt5OFNQUjPmO1boQf8ZmJOmF
 QEHSIWP0CJEg7k8FuItJFZS1+uds8dLJLFmns/zQXPsfLtC78OgDspdbrlP03EhcnGUoTDe8gZc
 gQtxO+9uOC7h5hOt4ZtjKKMf/UNaONznZg/JCMUH0k8IZT6I+UgIP9WsKyM/RmjS7Epw0CMeWkS
 qs+sn+931BruxTaEvaELLkHhksMYvFsrn3YmeA4d9BqYchAPt/20qStIY/+O9PD46UyYfV91sPz
 1x9kBVgytVMObx3PIABpwg2sQIwdJRknbqGK8x8cb+RkdyiR+FcL+wVneTwAVmd9yxg4eIziQSj
 wQr7LRGl5FJAE3na5OUW9PE2QSD8L89NlTN0oRTMbi2CYdQyhw+j5Y/ujSA8uD+nhWy1/n62smA
 tV0mtefOlEaOj8p3IkA==
X-Proofpoint-GUID: rC8aGX2OaQZFwRO91JZS9vljF6niiqB7
X-Proofpoint-ORIG-GUID: rC8aGX2OaQZFwRO91JZS9vljF6niiqB7
X-Authority-Analysis: v=2.4 cv=Bd/VE7t2 c=1 sm=1 tr=0 ts=69c26c2f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3zMdaVOh9OzsoKMNJxIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Add paths for Qualcomm firmware, including:
> ipa, modem, venus, gpu
> 
> GPU and bluetooth are confirmed working, others may need more
> testing/fixes
> 
> But regardless they will need the firmware paths specified here
> and firmware added upstream before they will work, so might as well
> get started on it now.

What about the other board (judyp)?

Konrad
