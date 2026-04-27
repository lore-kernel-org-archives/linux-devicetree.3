Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CEC3B47FF
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285858; cv=none; b=UUiHCTYsdtVyYT4mzaBQ+QzRjcfJbxt5ohNIzLzleLbYogowaS3BUbs/idA9XeMa4cnhOzVQSLfJ/aGx+vnU1bJ3AeagQgPGiYz3/2A7CWpX+5wQx3D9S6QGiaupa+8SQ2hGLV/CGjrfyY+gCX6Brc8yl+CGzaU+8yC66b0tAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285858; c=relaxed/simple;
	bh=xdBoUnvTDWHO9sEx2ME9vk0lNpYrxR1F0k+T/dobLLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o26gp1XKlZg1oW+8LNb5WoutGdx/U5m3X4Qg2iYFgahkScaBiJyxbMD6BDygVbdgqQdpHAzIDXIcSoBL4hZ07j2S5Dx0Zg1pDwsbmvjgDqqkU56/P6ayt7IUdcnKz6ub4++AWya7J3F0bGfQECp+E2rVh3RPXAzRsbrv1TTMdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAqqMFeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvBA1vf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAqqMFeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvBA1vf6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9Qh1762094
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=; b=ZAqqMFeVbWvp3N76
	xshBvYocfLZXIdyiltnKdHegAs1tSBQs4ss/RBz8LnhAKhkjo8X5bfvMORkV+3Pb
	HiCF+Nzb+sTIzisqgzC5iBmKA818F0bKVMxrKncz2HUMHijnmRqNqv2BQtLM77WP
	kjWkV2bxnFO71WBwqVUk0OwpAT48CFdfiZa95CKhY8Sx1vnuIImMwP5l9BP1F0c3
	2cqQ9wbRUBB1sFTLXqGojp0F1YWbsSm2+pKjBUm+B4EmZwA8Io4L+tUmJYseAuOt
	DNiUd1cOUOzfbWlZewuPkkzcn61wz8yM1W3JWWokz1OmbXX73OEuygQr+x7J4WGR
	JtU66w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9dn79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:30:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb0b93e90so22172891cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285855; x=1777890655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=;
        b=kvBA1vf6u1ao8ePuhOs8wU4HSCDp7g71vQgsmrix+URjPhApobIXhzR10OUSw/FMrl
         Xp5BeNiU/JWWUC2pSRyWbIBBAyWsT35nUZ9ltYQzjvrrShaaE/SCoTzoUxPQ+GtVZlDg
         dgoB4TNgrJC/NUi6m6dnYTW0BI3RVpxNPy8ipx7+5Kwx9vs+5oWtD1ikPFbqQ1cDF7i1
         N3C420XyV1vZcwlvSZC0KT/r5VTjPF7YA2cM+2rSf7DmT3X4kmnbVDTq/kayVBtx3GxE
         vZ7h5Kvc8yyi04gFU/8/VLlM+0lk37PTQFgsaGVQfFanyI8d3grXNTD1eH/OGq7SWIgw
         EVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285855; x=1777890655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hribx3Te2zGhpwNccaQ0/B4nggOh01mXDEMzMU2RzM8=;
        b=pzwsDFmxfpvXO27cnIA/EpT8CpNyk6I5+ggT7Xd6rJ6XLPHZb9GBoqaf+x58Q/AnJv
         xJisT0WWKLl7VB90LMWVPNewcvqQgW5MeAukIO83ILd+y3bboo9mCn1/7sDJ7VYo8soA
         oyEaDvjut9ocVj6oqcgRunBNgu5sD24taqFSXdYtKaH0aLk3t//wDMyb27dpR/cJgSk/
         KMscQlgahbzsoqwiHS0J6t1fvcgkD9r1LGJUUrVHs3bfQ4T2CBFWWPEI3PGxLm4tfQ7z
         EXrF93ZivSjZuOBPrbpFF1n+sCenqDpBBk7hBt3yfZ8SXN17J4SE8GHPDnb2inLL2bJp
         mQvg==
X-Forwarded-Encrypted: i=1; AFNElJ8j6FW9XnRvB9GiQZUBwdvyUMLvQ+XlqpELd5olYtmYFXyV5LkjxuUGrUYzPSOu7TSFMZOZ5tzf0FF0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+x9ruDGTU3ZsomxUfR8Lf42NDwyM0dfYSGMkyUJvS82pke+C
	ffgSSIeWyfYQmpw4J4d6aUV8cWGeUtye3wDwTVSY4FRv9RmHbJbyoZkYPelejLLZWl+sX0GSHzy
	Qt58DkEujmzYCmWjMJKf3omZjC4OoCvh/zB/6EgTiipEXZIsS76Qdehv28qE2cZRu
X-Gm-Gg: AeBDiesQXQ0ha/T1xun6Tl5UCh0pHVdftBukF7N0orVzCk21KO2tb8JdUgNEFnofgMo
	1zqyHCpqhOZ7jilz1cwaGTdZZZrPiiNd83e704Y4vTpThO0+SCuK2uMoG3L7vNoJ79hrBN+tenT
	4T3A0U2eSnubA893FhxO0MzB7/A0w/GgO/PANIt5kPJwSvFVJ4vS9sXN90+pfbpzcfoYs681gZb
	yCn+zGP9j5nQ1IW3VJ9NLUToFRJK6Xwx7r5g4z/cgjAn4LKKYO2ahhsp4QlJdo4A/Q0VWybRiJG
	E8XMdya8aevu6fMosdwYfSE5/4WbmZcmt98c7cPbaEnTGR9PY8wE3WutQog5WwQzBJozzXv4Vy2
	tKajf0bEfxx0/o/TNBkldE6HaGMPbsQfT4JhWyI2hmUvRh22QGXHdmFtFbvesPOmRJp7qV7hepD
	s5jF85SWeJ+qyqhg==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr422782661cf.0.1777285855454;
        Mon, 27 Apr 2026 03:30:55 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr422782261cf.0.1777285854850;
        Mon, 27 Apr 2026 03:30:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm1097310966b.49.2026.04.27.03.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:30:54 -0700 (PDT)
Message-ID: <5522e3fb-4140-4c64-9ff4-f0897b85cfaf@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:30:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mailbox: qcom-cpucp: Add support for Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com>
 <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: muZG4he8kiXkd-PcSXnNBMlifpWqud1u
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef3ae0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yOHyN-RScyqsYvXzJDoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfXzbVt/Zj+oeWv
 0wguajp5YI+REuA2L537VBeBsRJJcv8g+2vEkOgAypBCAPsDN4veb1W5DFkhHBKIAROBd9d+rST
 1k+77j+wbp21IY+8QiwePUmEQMTDQPQXdLjN/spbo5q/+0c1dao2gKnh7VF7xCAs1jaGUFXuDkS
 /TwGpuh+tcVHdVZ3VLGnc4rWU5u6nh0Cpt2l9EtH/NMNzFLH0Ia8tP+1/XtyYQXpwgxeeQEdnkE
 mvSktk4iOrFAPj7XoI1TpSwYeDahp8kDn5scQCufwxQ1UI7+M0ylg66vE6F6zyRFMxUPNdiXToE
 w+0AUdgwWyWp6lD3oEGHuUToAnNHeS1ErejLN2irdBJDSItE9MkP99YLnHPe08r/MH+GNP47iH8
 IFggp+4dH9PbJU8LGR7pZQ8ncHrvbXycD3nNxmXCczdPzmuOBQEJ/9DTeN3l8OCcgKZU0onwy3k
 gJJyw14ha+2nr7MAvAQ==
X-Proofpoint-ORIG-GUID: muZG4he8kiXkd-PcSXnNBMlifpWqud1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270111

On 4/27/26 2:52 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> The Nord SoC CPUCP mailbox supports 16 IPC channels, compared to 3 on
> x1e80100. The existing driver hardcodes the channel count via a
> compile-time constant (APSS_CPUCP_IPC_CHAN_SUPPORTED), making it
> impossible to support hardware with a different number of channels.
> 
> Introduce a qcom_cpucp_mbox_data per-hardware configuration struct that
> carries the channel count, and retrieve it via of_device_get_match_data()
> at probe time. Switch the channel array from a fixed-size member to a
> dynamically allocated buffer sized from the hardware data. Update the
> x1e80100 entry to supply its own data struct, and add a new Nord entry
> with num_chans = 16.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
