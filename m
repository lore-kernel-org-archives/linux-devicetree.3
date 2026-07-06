Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6442F3EBF24
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326377; cv=none; b=aq/pzkSbSR6yyG8Q71d5UrKbMYS7gd1j/pDMQrK4FDEFntv2sbd2cc/cNeRr8jkCb0Z6o/HMKE1Ci39H9T5pls7TkuSh8A5i+oW1cQNsdfW+IIAeea9QbDhDeJnfP0KMPbYkZIUkHySkVZUJ2E0sT29oqtw2umm7slBpMc/uvlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326377; c=relaxed/simple;
	bh=9TmJTxog7qWFnufWXDa9AB11Ah6aPGB3aFbqJzzK6GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/XGCy78b4qyX1J+Olj/sSBpL+L/3C3DvLvmsP1ORCYpyyCztRMiqNwI3/zMezzgq8skUZ1Q7GoaKc5mXSksmiuhDvoCqqKSe9VEKKASSamn5NJ5y4o+8b4BFmitOxQ/oYhJ4zlu6btPgn7M2SxQeCC/gNVjimwuFLTcIjcj8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoadJ1bN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJr/42zP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoadJ1bN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJr/42zP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641Z0R3614034
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=; b=PoadJ1bNUXKR0cJR
	ikDqu6Q1LmideY/RA94Zvmpg4XGcT7o2+VO/kWzxMy1NfEavXt+IF04c54pKzu9q
	g6WExmCYKB//0H3sUv3gCjDAMcma1fL7GZDkBLM1HlRW6WpidJm3Wt3edaXIsaQr
	9V3nbdK/QyVsHwkPAdVNL9tGJuNXakfANwq0Xc+XaPZ0edlK/pTHnlrW7+Kq7vk3
	D1TCitT9Z1dyHxOA+Ehj20iH73s8WPIhT7548rLmf4vj29JMaETTDX0gJifb3JT8
	cr90RPHFdKMBckozPHW76E0Ha60nrA5ziLXTgjkWnczg9xbUyyEa6PbPR9jYuEyG
	COig6g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnb0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:26:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f150e7d40eso4957516d6.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326361; x=1783931161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=;
        b=RJr/42zPnVyYZ26/zfi26wCH95ZBhc3gwK4tAOvoHya8aPe4yEaOeLPRC4oiPYw6mM
         +Jd0PqSYDl0y7BVUi/ZAF/3kOP4OUfBsM6rjF4/0nojZbacRXQ8Ne+yxArW3/HLFD2O7
         jlpf5dXuBcN5GBcvgWLWp79uQkFe72NzqRfHagg5JFG0PLadPFjasah+tfTm3khIJR/c
         WjWXhjHHfppmQ/0MOBecMurO6ohNNjnasQoNCt5wbWv117aXvlJOTUndbioXgJ/aVOKn
         M/KQy2lrSttbBmwhykN8D0FVkPBsA8be7vMOCkMZivb6H0FTI0cMGET+7WKbIIb8aamd
         l9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326361; x=1783931161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2oFFca8ypbw0NEVe51w5DDl3c9T+p48AMW8pgp02Ss=;
        b=NIfpmv7HRT5LOeguEnmhyjkVhJDhApw6x52MhciGYPELqDSQz5LehYtxCW0IOtDJlD
         6Qr2yJUmPNIcU1AF7DRyAJqnT/qDAPI655kWfaAr070g8MEu6GLqEPXix+dvc4r54T9g
         cBGfSbCH2mf6jSeNDaXn9Ct7JZlPdM7YpSEseLRkumfTNNitAd+BW4Im8Ohci3wD2p3a
         35Zfr7xvR6h2gDlJIMNZKafmGFuynbLAzxGdaItlG6xbMawph1IlZgwRFvDPZzW714hc
         CkAvJZbrKRxSVW/ZXLZU3fHADmnR4aHxu5UACJ5VWxTmz36g+QHMSBVhkhYZfwZq5MNA
         wM7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqcXrkuE655uZKlRTAEZdlXfmF2dWh4UTyhKyTQjjllRIguWasghUSnwQsmFycSCjXT/bedGUXPBl2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5+B0xnr+ArznkN34EQUzIu+JsJc2Rhf+wjGAvTqgWml0RZo+i
	/kE4Yl5u/0TxDVKxpbS9V7NsaYzE/x5qcaClXt5/hCu2fLJ+aq2x7xoYsGFWBVuIvzqBy3Wr/01
	od1uAIpMt6ckmnx//byBouptr3QkEmIEp5LcdGORxuPSbxrAuA5x5hzpxAXREItbV
X-Gm-Gg: AfdE7cnrptW6BVZTrqCKUlHzmhVqcxrHL6/GG31KK7voeU6garNsNuShEBMfkBivIl9
	uzvSYMgnGyi6wDgxCW2Ix2Cu5kxoWB7oq9ce3VFsIlzXRK4Rh2ZOuxE6BJbhvpSKp8GdD1YokXQ
	4Jl/N1pqJR0EifE6A8htoWPaC+A/bn/CNc8RUfIqimTdSckv5OMj3H1OD8z2juzkxuVOtVFqeIv
	cit0aPT4fxSy1NS5RcGCedWD7gX5qIfhMFCiGCRjtowAUmrwfoVwDW5Co2i2ZKD8enTVbsXjS+K
	grOgCiLeXGugu38zrlljzw4muCmwbKfuihZPTKvQrboomAn2IU+MwL93GpEKmFnlzMGWvjm2hYb
	YdHrMctowlXEqXAnad7uDQUOt9AZpvZGODRA=
X-Received: by 2002:a05:6214:5d8c:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8f74a615b95mr78487086d6.1.1783326360997;
        Mon, 06 Jul 2026 01:26:00 -0700 (PDT)
X-Received: by 2002:a05:6214:5d8c:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8f74a615b95mr78486956d6.1.1783326360636;
        Mon, 06 Jul 2026 01:26:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm703064566b.58.2026.07.06.01.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:25:59 -0700 (PDT)
Message-ID: <20105e18-98f9-43c4-b604-3fbad9a37b9f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Use lowercase hex for unit
 addresses and values
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
 <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b6699 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EH6yodd7piL4EmllAVYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: QzEWaiMkt5IPnEBr8xlfrcwI81tfeLbY
X-Proofpoint-GUID: QzEWaiMkt5IPnEBr8xlfrcwI81tfeLbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX+0W9DNrj3hSY
 4qVX0KUKdOa71k3pycxSkCci0D7hoToqAm5BHe3zFIE5B3GsyEIny6spdNK5tp/pI3GCTr1gSZc
 F4A3oKcROs9ymPznz7HQHbrXG+vHH95TV1f/x6eHkP7zvLZhvw3BZMRrejEu44rfq+RKPb2rIPH
 Fy8idyCVkAG3XaKNehi2XcV9mHDiDbGP/veKEJjZuT9WxrDAfawcpHYk6sujo2X77RmKN4de+bI
 MZmhc/bufQYjOGfiz49Sn5jNLMxOgK7NMg1xEOB1XLxwDoHgLwg3h8AGaCE6oD+1C854yL5tvYd
 8g41hRMzVddsymchfis/jGHCxMY+xbw9/fsktRDg5ON+8sv0PxbWql0PnWWL+AFzm71j5ooxWL7
 Uo5lZGlOrRAu8aUTYZqTq6ZDC8E2I6xPFEPJbONc93sq40BvtYwHP3MvOzXZyHNz1FmdO7zxYef
 qT+zMWRbaesSb8eGrBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX/Z9vt/ApsKMk
 4rFRjvNu83TvxnTCnvj2ZmJYIfjEFeZBf46neWNX1Mh1JZ8CNoZ61GxNUZLlym1FktpiIFkljg2
 PsSaKbtm6FvG3T9KFth+h3YK2KT5kio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/6/26 9:03 AM, Krzysztof Kozlowski wrote:
> DTS coding style prefers lowercase hex.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
