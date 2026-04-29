Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB363921CC
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455137; cv=none; b=TahDFs5YkW2eBljnV8lEy5lonSfe9WozN76HBCkmKH693KBFs6KpWMYev6kqKLJGnT+9GNPKrz8jiQ7M0C+UZnELJBbHWApwXnnJo/RQNS6/30IPLQtdTYpdxC3j4DQ6Eww9DxIMhTkK4u7LlUPHw+QAHPFS50D2YcrnBwSg8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455137; c=relaxed/simple;
	bh=5q81zyT9bNFdWJs9YZZFd/1yiVmz3SfrynLds2/FimI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOVumV0qO6Z0yloSpYdbJN3ovZaxXxeAQR/RetTTEcy7lqUVx0utWGygUrYAvOD+xwvYtXxK0jTObJssZEuvG4jpGiahO/uzG5wf32zjQvPSBp4qeHYNO1Q+ZnLlwWW9zTGSpG3Bxy+tJG8JtzfbKQXsCUFkQKWRCXWK6GZE/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrFnsG+j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VK0pNfsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrFnsG+j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VK0pNfsU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pmO5901571
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=; b=QrFnsG+jG6rGzo9W
	lO0/0zNIpKPh5RzaU880EfRtJvcH9VKGHTso9BTsUoTdKhUk1V+siOywCL8LjgFi
	tsaJ6EiG+/j7Kabmwf9GqvEIuGlyf5V7pT7hOuM4P70FxKSiOaD/tOSHyLtQrefW
	NahBP2Wbc+FIakFEpEPpbyRRGGIXWu6Xi6wR4VZSz7O9gK0wRWBZh+f+km76aphq
	fOOYVZTZ4aExY24etzO0XVpDZqW4GUA9FcGEePBWxgcP3ccKN4YTkAEUhMCMSj6J
	LQanDekJryOGgpc0YHp2feY03k7QMgHdrEByr//wIDqm2f8yuyI9eHD1g6WhHYpm
	GeEgXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9h1hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 09:32:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f71af9dddso903421e0c.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455134; x=1778059934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=VK0pNfsUNUqEa4lJ9L2erBXv4206Il+blXl2uWvUQw8lnUzT+eGJKmdhX3BbxU5QBW
         5RhQMXFYTj6dJ+95kXBjOx+x44MGIeYvwXQuZdPHn8IML7J2FjREp8Z875QWiv9rajOv
         apGnMyu4i45kqcRi9S94WV9l1V0z9hVVQhhecbzdalNpUjaIqY5ZAtvDr7/IOZjHcbtk
         Nrfrpx473jxWjV1rPAM6+t4EwNELb+0DOa2/Im5Iwh3HHxjz1/Tt23r+5FNuSL18KS+b
         UR0QZ3rZiXRs6Pnn6ZyhD+e2e372mVMTkoSlQqkmTzwaK2C39X/Vf8gFdH+fLilePojj
         aUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455134; x=1778059934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpp2pOYs+zgwLnYd8Zpm3wMJtqBgJtWLRZMos+6qw+M=;
        b=oj61lmehNin+bDvoG3hYu87F/BiK3Y+E9UB2raNBv4NmDb8aMJSETiKvLESGhn5D0d
         HL27CeK2t2Nb0h2HZPXovr575pnDFFEhyCPieCO1giwEfIuo4hXhr/26kQ1piqDKQOaR
         Mcoci9fEGI8a9gNPUqAoWwn5/P7xygO+HqTMWF3EZLdRPndNIxxsAbUrX/Yz1jzhdOLn
         m7pnmHH6dLoZtfG4bih7ainS1GbrZNvqYWZWlKvn3dMkJjuRkeRb6tcS5kIaABvH2blh
         uCx5HPmLrL/4KyXR2016e43eOBNGEmCOGFN5ZgIGk3W5KDrpXQGNdHH1BRQXQ2y3THz7
         Q6PQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hvVQl8A2ef6xnRP+LvvH5kYPB+gbQm7eUtKgiWRX2etpZ0U7fOHqLVqwKqFbwwDxYYxX8IGXJg33f@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWFAFsHczgWqjhACxgXl3JO5PfnXmmaBPN+/S/6xYj8rx5TQE
	4QToZ7b4sEfFBTpExpegAD2O9cjpWTxM1QJhTNqh2fksU2oIBtEFcd3XLr06LnIpQ3XmbOn/9jZ
	efDtj1B5lUbuqHEV1m4CAvUo1Ab6fTYlCunpKJr9G+L83Zs353Px4fZrj2wvvdKtb
X-Gm-Gg: AeBDietxCr1X0rcHHDhOl7+vZlFBW7PGGVHAS5C2zE0jBLrKI20ewJ+Yb6nwhGjjYFZ
	dNxdszlJv/+kPOzBgcu8vI6Y2KyNewzs/cZOpK8yxUyXsNieUDDdiLsCSBs/lfZ3rDybX+C8Joy
	Sus7mHQHMQZBtnAU9IGnQ8SPhLAsBcjsTNj18hct2Lq8C88L2rHRXtWyaX+ExGaqIL8PcLU1+bD
	5lH1XftTEa/XIA+Ngb4/l2w73MeglP6yiroT1Gx4bRIad6WDiykkQlD0JDpMQOaKKzFn3gwBHN5
	Y045MLXxq1SIgrRLa2K1E6m/NCTEbhXKbZdaYxKpq/B03tJfQFP70OEYz6KG2LheOkXsu+00m8T
	1+UaT6UfKEQ5xXIdKS5ROu5FbfL3NFNMhzxEyQF3IjrsvLCXuaIDrWlyEZrFiujo1ZGpDjL3N/U
	P9to7+t/D7gJQ9oA==
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309842e0c.3.1777455133955;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
X-Received: by 2002:ac5:ccd9:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573a2df9fd3mr1309824e0c.3.1777455133542;
        Wed, 29 Apr 2026 02:32:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb980a6f2e6sm67596966b.8.2026.04.29.02.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:32:12 -0700 (PDT)
Message-ID: <2390c346-0112-45b2-8d10-d29ca3cc8f88@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:32:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: arduino-imola: Get Bluetooth BD
 address from NVMEM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org
References: <20260428-block-as-nvmem-v1-0-6ad23e75190a@oss.qualcomm.com>
 <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-block-as-nvmem-v1-9-6ad23e75190a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CZOgx6GiV2dXi1EGj6G7rXf-Fd3HIgow
X-Proofpoint-ORIG-GUID: CZOgx6GiV2dXi1EGj6G7rXf-Fd3HIgow
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1d01f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5NSBTYWx0ZWRfXwAfNr85dxQUi
 o79kmIDiVVqLBA5fJBervsHkfFP63y9ue0Jifnj4X1gEMjdZRFCJPx7vnzXfV6nDphx6mGrUP5x
 H5cFo4ItjbGCmYYsR3nnH3Dymk18ORe+TRIbs6bp05oXRTi+D2O23t7wmVqGE+EKTDtfOyRFCAf
 VlcAz685fJTXgoRUx9Cuvim2chlWgWOGLbiNKO4nyaDgfWTqiV1q8mwhiJyPgOip9E9NeJiZLxm
 ys6gvezsJARNxKoW4J4kxse422dHhdLAu2E0FqWRy87Arfmlw7Y8YyDN2Mer0GThJQbv+exc6H5
 WdqsD1D49f/NJ7KH/OkYlalIfcM+cQaGSDwzMhOU0Bj/xgtPYqCBO0BR8VNyWM9VJktHVc+birk
 Z3DlLlvyKhkv44gdk8kW3ZaNhF7n+lAWX6cS653xeD9sjKrK1yspXmAvCq9iSuJT99ZsKPukUwE
 DJvtlsi30obgfJRW5DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290095

On 4/28/26 4:23 PM, Loic Poulain wrote:
> On Arduino Uno-Q, the Bluetooth Device address is stored in the eMMC
> boot1 partition. Point to the appropriate NVMEM cell to retrieve it.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
