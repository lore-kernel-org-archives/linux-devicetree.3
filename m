Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E81403EB5
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789980807; cv=none; b=Rse+lkSpaqIqA5R6z48xd01vqac0N1a1VNvNL4eIU1MK+FUxQAwezMnDjrDf7d+lvWLJKpmEbUR8YbYl/X1NLhsWPA0ZiqJzG+Aejx4LSBfGuZD5wuFJBiBktsqNQS1ijwl4ZwBRdNDxP3dQz7luOZ6q7FKA2ymTv20L2cnkjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789980807; c=relaxed/simple;
	bh=qxsOET/xoTWM2NIVM7JWYgLYxIAqgXmxXJlrSmA6ZzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3/pFPci8Tt2j5IhCL1ccaphacLMXjaPiNp2iwnNTngGFGbVd++A7M7TzdRbywh5MEnq95aOIl6w4U+qO9i64+GcXfc/Mg7yccbPl8TqB/QaFqy99iHKPWhBlh/VhzhYhs3Zj+omhaSMRAMvYNus30ba4fh4OMslOUaHLLXMK9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJLJKY72; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oamj+WXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJLJKY72";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oamj+WXI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79uvs1624384
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tsih9RWF0CqioO1q09Qzdaef
	pjJ4G9tkVN1i6xRJvsQ=; b=fJLJKY72xIusM9HgFEJpL9Bf2P9NyierBTnDvH2A
	QaxiA9oycf6MQoHmkSs1IKiwK5WXazOEBhaa+SPLEew3bv7XSDmg7zuOe9Y2Yz7N
	etfMg4VELCHqKKAqh+g4dzTXPKL24P6Z/MazBMqgm4QJPwSpOfSLJ/7x5Mz2SpqV
	VJtSg95j1hox5EIymNrBq2cgSQMY8FXQHfVcWcvXohh/9sSZXriXeUJpuAVYtK9m
	7K1Sd+BAKkclZ4J+tgdGD2NebvRAn7jT8Jkgc1cDhYPWHl9JHw0ydvkcLLGGxGYK
	18v46TsdS5oZsPYcIwuWit7H+KbIACV2TVr/unSBaj6IHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsg38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:53:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so2674387a12.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789980805; x=1790585605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsih9RWF0CqioO1q09QzdaefpjJ4G9tkVN1i6xRJvsQ=;
        b=Oamj+WXIyL2yNM33oto+An0NY32DT2VZ0HgMjpUamFH9+fECJ4+a8xw0hHCAHZF1DR
         SSVMRJZruIBe4pMMoK5+y1sNzHNI5Y6gx+FWsA2OhQLp7D9KS05aSF2+AEeuqIc+cdso
         kjhIoaK4ZOzP6pES/XYK41s9dKiUONSHxqwBsW7MYbeewdKTlgTAfbBh2f5b99z1xCcP
         5bK1idq06NFfAqTciOp/ZKZXL4G4NZBAlLjKzHXeuiF3AOrctVVcaVxkf1ziWchQPrW4
         6hspefHtsUCwvKYaourY/J5gfHirVq5SOUJCnDJ/RasJNPcPJ551Zb5QBf+5gqzx0gJB
         Fqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980805; x=1790585605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsih9RWF0CqioO1q09QzdaefpjJ4G9tkVN1i6xRJvsQ=;
        b=AdjTl9t1W8ZvDbp+tlTNsV+Kti0GJGsj5LA1cZZ59GGCsH75BPYshtlnsPAgGgahHX
         5RkCCR2escsJjYFYz0tcxkVFWoe7bTfcGCGvLHyauolwSK5Y0wO7y94UaRckf09vWxk8
         q/wtWEFs1/Ta39E6MaDx7VV2ZjS/AdzcLzNQwdZiG/daYn9l3wC4X6gO7S+eGDMDAxV1
         VdOJOaSq6os1kxX76GeCW/SW9eHxwu7+3BYD9+GDbNaivbd8NOdL4VzXEXunrcFpDbiY
         P1AsBUuzex9SebPwxkNacCcJmplTwKanB9kgyTrdJMG8r3tZXv8JUTtqJwt0o49nAl4d
         o6IA==
X-Forwarded-Encrypted: i=1; AKwUvBzcO4Yh9vZgbQAIlkZB0GI+4XwCwBbaY6AhV1jDATDDiX4CS2b5z+lGCGl6bLNGknhJ5YT3i8rNnKNj@vger.kernel.org
X-Gm-Message-State: AFuF++lVFiTUVHoEVhHyoqoiHE9pw6yzFJwzyIcpMW25SKjUzCbYZBal
	sDf6FlpD5uLtJaF/VTbSMV/03z+YzrBH0CY10nk3FbDL5AgKC/zJ8OOOlxJNcYLsnoyKB7NrAVc
	Q44nOtj/EjyhG8Ki38YKfJZIDqQ1IqemFF7J/17Csl0GF3lw2M/pWGfuSg11QGKhB
X-Gm-Gg: AYBFou16LjJvdw0AIbAOFkW4ZRWLrrLUOvydjmjlSdPOYeumFw4d1bt/bPWijsj+iev
	2ylph3088diIAywSKANeFHfhZKMj6jz+Hz34HE5fC3SZLX+JVZs585GFXv4nMQW+HOv6dGsOZBA
	W0kpg67i21Dsh50VSMfOyqbhDJiC2fKdqAI5WgVlCIRI1ppANl4ZZSEbYhCoxXj0syelW0/AWk0
	GQwGY1+kvG4nvu+i2UWs7/PQSOdxDx60VmN7OuyHTqZvBhc+CKxUqrpy4X0TZa9lSw2JPKptWkP
	OPkLCYS3PgfCNMLpD2/ce4NHs0Cgj0pYHl5BlALvqc5f3LZ4n+eubFKVwHwkzR+DdWig15lqJCZ
	1flYBtn1stzFAjTsMuqYZRoDsAv0SzvsAPDFcetNP9g==
X-Received: by 2002:a05:6a20:9192:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3dd726822e4mr16962894637.19.1789980804673;
        Mon, 21 Sep 2026 01:53:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:9192:b0:3b3:a66e:3911 with SMTP id adf61e73a8af0-3dd726822e4mr16962873637.19.1789980804259;
        Mon, 21 Sep 2026 01:53:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm18455477eec.14.2026.09.21.01.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:53:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:53:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: nord: Add more clock controller
 nodes
Message-ID: <arDwfm8kRLUoyxwO@QCOM-aGQu4IUr3Y>
References: <20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfYX9HNThU-iKz96E=SuxYrbzvnBvydgFg5Zzm4W6DYAQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfXybHgkmqJpJAs
 KyHMJ83KGHfsxyMW1dv5j5xyN/FUcfxamZ8dKv56Dy6GWaX0j716u5643NBLaz9kU0f3nsDud9i
 CMVn7ZEQMPLFDw7vYBahmRryNerTrzktCUQSlymEWI1WhtL3UL5XT3ivJi3tBlL0eG1FpyOnd7p
 4vhoIBkXksrlKlpmAKvECgEBMwrP3+rH0FCguwdWvXkDTfMWcNyZIEq3LzXakA9utll/erxx68s
 Av6EdoQff3EYxVv802TuNgnnXVl89juM/caFy8UXy8qK2pTz2jlrr2PHoT2OmWCW8OoYYp/RAhe
 MVPnr4EI3P+434LQYipjGUg/2K6FrGscfv4G3p4RBLSH/FPZ400D3Z1A+2Q09eRuCtRW/4ZEzbw
 5zjjG6FXoq6xNIQfmFfDOXVnSGFUp/uUx1MoelP0fB2ybR19rL9dDZID84h7nByBIpvW4I59Ytk
 VBOzbf4/6pzeoGlODrw==
X-Proofpoint-ORIG-GUID: BgF9iXDnQKUhbILgZXiVAx66jGj6Tphr
X-Proofpoint-GUID: BgF9iXDnQKUhbILgZXiVAx66jGj6Tphr
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0f085 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Q8UMQ-RfGDYfl1K3PHUA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNiBTYWx0ZWRfX9sIySr2ImTRK
 9obitBU8zvLQAjlRhIUZUgC6gRa5Kw9TkAWHYaHNUnXakAYeyuOfe5mRgnvWdcYhzvNnx4Mejwq
 hpSHJ1F7Kayz2jhS7q+Uq+hNTbvRuwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210126

On Mon, Sep 21, 2026 at 04:49:20AM -0400, Bartosz Golaszewski wrote:
> On Sun, 20 Sep 2026 10:10:49 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> >
> > Add the GPU, camera, video, and display clock controller nodes for
> > the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> The last bit should be dropped?

I think it means these lines in the patch.

+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>

Shawn
