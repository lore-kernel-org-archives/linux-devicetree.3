Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519613BAD89
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158861; cv=none; b=eliVHkVe6tgSlQ22wM4dRTuFPtQyJVIpMtcPXIjWj7+Dzx7ohYo+MFi0H0XBGR5q1qqkBmSYtIajBjSQinknoaL2RwJtXRdUZUWnEmsS7KHsG3fcUxwDKfoEoWnRhskdeypXfC2svAIw8TjTTVQ1ViQcQpZe2JrmEkMm2QHzzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158861; c=relaxed/simple;
	bh=4+OZXRJn2PTrFB3cidnhlXmOLT/TUxoYTbD5SdiW0vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsyIT5mPg3qheWutkjpx7msboJ1eB37FBtcsRcKB69QdGcGVFMJPDi2dd/VxSJZkN1HZI6zuVOBdHNFged3nhOidgMj+jQo01mJu4JtyxsXXqp15hTGZiQnVH51KMhMVGvKlILGXIB/1CQBedBUOcoS/vxbHHF0v4ojV5FFjqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+Y6CQOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBFPTy2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+Y6CQOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBFPTy2g"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6T8pl2633484
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=; b=h+Y6CQOHmqD3430D
	Fg+7KdpmH0tqpl+2HeWW9MoPmj7pAHW8ZnkB7dVwr1XRSwts6SPcnhwdowJpE+x0
	NDI1ZuexHZY6LE9WTGn8r+qQvsjIIOZAuUZ95l9R3psnfiTbs6bOuTB53UAezKhT
	L4Kxhte16DnlO2LbB99ZYyGqQ4iWMSlXNk6lJ2sTfm22ry5zzauggn6fmG2YFugG
	S63dJ1WRk2hzs/qjyoupI/0eSHa5NodVD2trkgJoO0BxfjDe5P4JRWrdWL1iWZHd
	yPYjN5n4X87bIFp7STiWASK+KqN4KIeANEqPDuroYkOsC0y/RHjAPea+zCWt2OTO
	UyLMNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca2wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:27:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so107523785a.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158858; x=1776763658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=;
        b=EBFPTy2gJCm7US2QzL4o0AKWZuSxhqqMwpuI6RTXtME5bRWLDo8/cOSZZdL3yXJUvs
         nNA/HTbHPIGI2fb/oQZs+WQTpdA5cCFXcwuJH5cmGYP4CsDbZLJQ4GLORWR7pj2P8Tbp
         RUj2/oHK9ba9eX9qYETJrLLYeiL8JgbDmfIMHHAwGelbHBFoDY65pNEuEs/auiii0noS
         m9Wk4R9pX9GdZvLfrpE2u0bFWrp+e288Tk6aY7BdcXK0ctikscuH5YsJ7Rf1J6YrFJvc
         4K0ggNQXpSEWVHlg28w2biKd82fRs6F7rdjK0KnOQpNFssIqzljEoPnDjEY0J7JAaGEY
         AQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158858; x=1776763658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9NYOzs3gNV4L5c6n1IErZjssEPAfF6D24GIAKU8Q4w=;
        b=MsCIE5PrMBZJJhn6O2U7IOH+wxE+fsRznlI7W1SLNdeqoB2Sn3KBnxbcicRcehlZ6n
         F2RU8AU5bZzF63J1y3219nwvggm4kEd4svsEDMUONtXiJ8PP5FSHEHa0nEYwr2fJPBZ3
         D9ygw+HVNO966QMQdF3vps4QzkjsynCDnkX9opOAwkalj9m3oohdliBmEuscCdzJbf6T
         m3/cQJKRkYKmYst4eS3QZ5naHF8AIKrD3CNdIMam+RMAL1PJG+ZVIheiIPFYWdbQ/O3+
         tMxl0wQlUNsQBsV9QU3bG6Fh5t8ne5uaaG7LpLFi+sZN519NWQEhx5cIDegd9ygNVNRF
         qt6w==
X-Forwarded-Encrypted: i=1; AFNElJ9Jr9OEhQu9/8itpfwZOp1qeA2qpRo77R67ucaJAI1lGMsQwSqUFn0y2aMpfraqzUH1SgL3eeAjf0GR@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb9OMlKFm12CLmx7DvzixxEIxgajSQUKLjTlBqXc3cgwH0YRyH
	l5Us0F63ORSyAC3M9kaaKJvuQINtpzBsFp0pRlo2B3A1T0sRa3ySn+ADyyALo4I1gRfpZ3sMkme
	gFcvuhS7l6JS6RRCG1Vm3LeQ8bHKIMny+yPq5M0tPgbFLYVumqeDDI0KKng1oxTTo
X-Gm-Gg: AeBDieuOKBHhrw7LLAQ37SpOP3LO5Bh9XInROPnETCKWsqHGpk3pqECfT6yQU4w6nCZ
	33qh5xWJVhXT5gDUVO/t3NmyeadLhjjR4jsK/3eg27Om2VKN1qRTlUvRRHydD+9drJH0Ymq5TOO
	whAlOUkqvEO9uI3wNqbp2u4xYXima+P+LfqZkten+HmM0McPZdLdcmELepoC522/SbdGBP2ww8W
	w/yuGq4Jz3GAeFsfuqw0VA9mnfqYinJbRNBLBIXAscQCtjjSYCUuqbNwkogs9KQ3jFzN/thsmnO
	dWXYoV0v544H1zzUf/jn0db76kd7Ha6AhwGo29/rmE55y9IveL3asnJz3GSS98NCW3seZxGClP2
	gwtse2BaE8+Saq3jEG2yZoFDLFU92N2oanehBfsxZimf2TFDc6gb1GvDi6CFKH3Qrd2d0usPNLg
	Mb3ZJIiU7P91l6Lw==
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr198075416d6.7.1776158857603;
        Tue, 14 Apr 2026 02:27:37 -0700 (PDT)
X-Received: by 2002:a05:6214:c6e:b0:89a:732e:f805 with SMTP id 6a1803df08f44-8ac87629726mr198075176d6.7.1776158857197;
        Tue, 14 Apr 2026 02:27:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c886asm383094466b.46.2026.04.14.02.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:27:34 -0700 (PDT)
Message-ID: <7fda964d-5b4a-49b6-837a-d8276f688a8f@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:27:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Nord
 SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
 <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414035909.652992-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sGpQomEDTms9Mcumi6ZkuBO7Mjj0IWZR
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de088a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Jpqku5WnjNLMWeEkFAgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX2V8M5NWX3Yxs
 kPgdTLc3jkHHBYo9FhExiQE33XFEMegOoKTguy1q/24c+Ke46WHkwKYxiqr1SUMTlLL0pR1oYBA
 wpBgQIuVAq132A3a6mFZv8PEMWs7p26nxDGqJcnf1Vm6PMhPvGs6RuYrFKO2ojrzxmAkcPVRYxj
 OzaBS5r/l7fvU666nPpCVQnp0X9hjE8VqoCTA9UxCbwYPIcSvjzn49NG5jalM6YcmizkzUZokJB
 fZQf3TAHZhLeUC2isblczrkDs08eFNg9I9vOVRg0MJbYqcKVjkY31Y7wh2PTYmy+xiU+XWrA6uF
 nusbWDUYl76PuTE/yBnlajB1hg1I3ilisY4U3+CD6OJeAsTWl+N1FCQrQdvs39CWbMdKyb5hGkk
 iwiAHPf25cOSQRjK3fR/doQNAAAsXpfn+XBroYF9ezO1z/1V2aCgc8yd3XsyJRHfQNNYDHenuBy
 cy6d0Vw9BsqCfgfGLUw==
X-Proofpoint-GUID: sGpQomEDTms9Mcumi6ZkuBO7Mjj0IWZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140087

On 4/14/26 5:59 AM, Shawn Guo wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMh power domains required for Nord SoC.  This includes
> new definitions for power domains supplying GFX1 and NSP3 subsystem.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
