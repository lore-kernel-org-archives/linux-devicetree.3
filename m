Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967224E4C5F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410491; cv=none; b=Ryf1mRiHjbqyftP3WWbkjmsvDg5QuVqq2UHjfTVbXRNQV0JBNikVpRVuRpu13zsPVEK24D4D0DHPB8HjaDLvmgnxIccB5hV9njUfBrFsBrvF5tyc6whTwOE5xvhwV2I+7pgCCDGOkKBQy4lrnyc1DL9ofZakSnZmTyKfIF2Rnw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410491; c=relaxed/simple;
	bh=K/8pAO/eAzqZ4mYJnQheLP+ihujFn34TwXLo1Fv1AhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkerpshLDSoUgSlwp7SGJGhXwTN7CRVGcM8e9VAzU9OAEKOyYT8+nwrfkYh/DuMLCRkyzGm4XeC29HuNG4STJQhnFwfu8DCwX7zqewUcYLn3XlrUo/2ga8NPZb/EHnLvIrFrgNH4cbXeEQsDq8Wov2IOtpXGROmPRolcHKdA2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVLQgX2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkUbQyyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVLQgX2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkUbQyyh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OvMq1168064
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=; b=BVLQgX2G4+5ibb5z
	naNpvmFbebPYybUNIVsEbdMOcPaQtWO0TZQgPPkuEM5Oe2Flb0vJqGsT3qQPjNev
	fIFxxMJtYJ0YTRcICEBq1Um5HlLABsEAT88Rk5c/h7PMzBvVnaJvhmK4acvnE+Rb
	hDz5F04hTez5KuKKe0jQMfpG0+uprWJnuyKyxxql+riWqDem/iIv1lMAYCCezd8f
	rCyxZOcQzaXomi0jNI+/Bi1HnHRUQqZMshj29rnCENYK+o5lQfQmqaU3T9CTrDcn
	xC3LRGegAvzRjHTZeRvYPxJYn3UGQFVvn9N6R/vWBv5Q9YYMWdGzx9BwNPGmArHA
	i9FN/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8vy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:48:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso18225985a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410489; x=1793015289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=GkUbQyyh1WFTuL3KJieR/rvnJHzAls57/8IFCY0uVRUvI8zoe+RfmmPHOnQWsp1Ow/
         3JIi+p9n2LXJ11Sv5/6/xK3NUY5R0OZfi8FLnYijBI8nKdj8C6MuAVoerkCY4Un31RDp
         vW1xUQgBZsM8+7d+fw7ysLNRdaEA3IpMz0xzdXBKuQGCGBKNgwDxpWsjJZys2+BrV81u
         66mW5atxwfckC8UxQAE+yMOnxQgkabo6b2fs1S77aUP4LBJYLbPi4a/2079BEAZkQuMO
         SiU9ebcg57grjEfogcW1wQKimYnQrbKiVRBd4lh5nkTVWoPi7XksUG1PUWnP7zFILxn0
         y5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410489; x=1793015289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVpmXKjPqO0ciTUQvydqlwZmfEo3zdqJh9QY38OJqM=;
        b=vAWCdU1hNkK4MfQyR9ufxJ7xxKpHFTJcwzE/nbUcir3M6WydxEM+i/iHAYziifcGew
         up5xZvjx6NAwVdcdtyobh1yxypXKZGoVoY3jp26kZrYUamVTuyKeyK3Lsk/+HNbjMT11
         IAwQfChlCoBg9gi2BdTxImdL9QrTEsyCgYsHNOQAYGX3Ehrb4e1g4QCcN/6Pk7utq0bw
         i+vv1YEXFst2+jtiu3NY4TgUcvUA+RR4Lyxr4UFDCdOIWe5OVHM7oGn605L54UGjvtZd
         L5kq8HpHjLweq2nmB1DU8BoKcO/SYl07WFo8kAd4EaxC8urWdjpgtJLM9PkU6A4TrjqH
         H1jg==
X-Forwarded-Encrypted: i=1; AKwUvBzyVTi/YWh15L9P1h0h935dM1IW/ZxUuvQTqZ8/w45Fzn5kwfhv/RQCA0VFwKS3cKv0yOYWIVVCFSz/@vger.kernel.org
X-Gm-Message-State: AFq9FYJYnk8GmpMpvPYo4MAHgzr+IN8pkohXlAM641qdO507b/iapR6j
	qYVm8FcuaRjat67WjpU1WSUKnkUifSJPEtlF8WqBMfu0lp/KvPPhu1TlX4DM6P9Jl3JG4FclZVe
	cIbhlszyYFR/0Y4FgRZrOUhgKRoOJNDVxrAfAp6SYpjitBN47MczQSYXlikNLbD9b
X-Gm-Gg: AYBFou18uQq92yAoUAu9CNAryCVH0/IAwoV02WuTK9VdQYr7weav68r/dUeZuFATjbK
	3wHLjHTzOeLklHgDLsB4ymgL56mcBWHSQvMY2EGDxAeIMxAUFm6hD+VbF20mqxk/Irs7eSaBtmQ
	/ghFCrIbSK9mtyC39XuiIxHE4hY8YqogSj/KJXCCdQvulGdr3BaEt5UxkMVgnZbEaHOEiP6HK0z
	VTJ6aHFdlOBVpnNKB11Bdw3iLbJC4F1CffnC9H/zIsvog8yjoKCVXGRVUMqDGOWHLkI2lhxpo/S
	Eje/GW+VXJOCzCF2qTp24aXbht/HqR5ZHq/smQG/MO/fIU0j0AR5kXqaEVkBhdXzP9zGi1vmdiJ
	JilVGDM5Nj4knMiU0lV2xcg==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367152985a.6.1792410488818;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1367147685a.6.1792410488269;
        Mon, 19 Oct 2026 04:48:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceb9dsm347362766b.24.2026.10.19.04.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:48:07 -0700 (PDT)
Message-ID: <2f63cf93-acae-471c-990a-c844185a9db4@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:48:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXzfZwLLIFPjMB
 qkRDvSST0UcyocAO3mT7BUi8A33Li5XQx1m5HeAmsmCaUcufD6ncrsuHI6uRXDQ5KEXPjlkBcgY
 2Rr/BWaLEleWL41xeQJUlGZz3vi6568=
X-Proofpoint-ORIG-GUID: JswoLderPo9HrixmvOX0SZryoUTztOnG
X-Proofpoint-GUID: JswoLderPo9HrixmvOX0SZryoUTztOnG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXzn6k6Y5ooptV
 4RMfzcs2L31ZeQWxDOq2ccIQW1A/nT0PbWzIOyA+R5gCHz8LryEorCwZIiRrQHJ2TwzJgnJE90n
 vlKAYVneF5sUALXojeRp9lZNLCbfh53bnqNwXPNao3jlNPmdLCyl4T26YBJukociAopQS+4ACvl
 XoWHZKc4ZDsPBY8Jm56ONh7op5TF/+chy+iFltNY+WGs/Ug3XZnczLMtbnFQWrZ3e6ehVm1ZVHC
 chc/sVSLvjpCCGGRaClHJvAY1iLEJCV0vuXoYfXm7xnlO3+U+iUhfFmwKg/4zcWI5mqKha4MExU
 ZX3IwHq6Sn6xBfWw2wKHjj6sIoGM33Gi7vWp8ypkWXhUcvOdbN+NHfdR6M5Zfli1q13Sqw2gQ0G
 Wck0MMi4dA64oHWbFswt67Fi7JgmXCFbAwsgx6WctsiTZhAuw7ASBW7ENPV3BsdiGXjd3rlBgBs
 +Pih75OdZz402YI/S+g==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad60379 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=R7n-rOns-cfn4W1FH0QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 10/19/26 1:25 PM, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
