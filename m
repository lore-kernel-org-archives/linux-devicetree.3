Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A53FB7F2
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677502; cv=none; b=GSEjIFM8Sq3ySq7Ho225r2BtGzcpZbEN7GC+QhY0Vxbsm6cK5ieMshoGFG73jbkdn4Kn/SWGCUnP7JHWQdWQeLnCeS6/Y/wMCq/VEUXM+w6vPxx4YLpD+mF8zEcHht7OguuwZs93OFtz35uP82xhsd2+bd+4yUtAzeYXnUtSsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677502; c=relaxed/simple;
	bh=qAjInHkeUeHTU5/obRlVXmq4HSKxkWkrqTV+hOURKFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi17k9nTijxnZQWWeZnZMN5A9KClsOoh+zWhWR0cOTxZdl+Yz/VOd++sdnpEjBYQc59nAfGoQZOkfBeIrGc/TLPMte1+pEvERbnWdEj1OmRcUbfJAkhMSZyI6xSORw8I+9WDWCvu/UbVkMB8W2VMrGOROaHLgXFrB7VIkRjerQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncSLyGGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFSgnNAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncSLyGGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFSgnNAh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A9TTqR291947
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=; b=ncSLyGGpPvbrnftc
	Wz53y84iTBPH1QfzLRYrhx66/kSb3qmWwPwSTSST4N9jozoowWhT7NSxkncZuBov
	MpoxUWJe8kuhpTlwKHknrLt9RSvaVoS94jC3tuVtn7E6udHhjCTsiTWsC06Q5VZm
	Z3AxoBSrlVJnU4ZgqXzt09FJscXqAKWvL8m912Qi9roObpVAgOvdsFKVMmHrkOpa
	Fy0VSv+iuBvuzcyfD2YMXySYqqAbbUACOFtw/OhI0cO/D2DzOgL3aBv1Yq01YmTD
	XaWcP6bayY+1jgISD6ReKFfgKf+weW0eNZAVTKUvbPkdK6m6EVR/eTL+QFuyrGwD
	wJeGtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dg3ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:58:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so2814691cf.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677500; x=1784282300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=;
        b=SFSgnNAhjuVoQ/HRNOTZGSdq7nX4kVpIqLQTLGEly84tlFe5RNUbgKnDudYryvFqR8
         fqnOleLtKA4QccfyyJEG9qWFtK7GE262g9K8fSpFRW4Htuq356/YM/sAOhivSVPTuXNu
         lNmU5Eq+76FtqHCFilKdPTaXr7xMCGXqSVMKObeyxYKWx/Z854nYwLPLvwdwJtl9fIId
         x93rmKHB53hjJ40emz1gFkN8AEd7PO3t27SlSl7L7290r/wNv4tE5Mal7LyVKYrjEE1G
         jW2niDMSit7PD+d5S+8fDj8zEKO90xp1BqXsiyeeJ92BbfuCFqq0Hdo9gR7fnkV4//yr
         fqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677500; x=1784282300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODeSgPG8MhSR8ou+9lD99WLW4a/i5wJARDilaJz3tTw=;
        b=JpgTgKNivaYsH3UpS6lwib6ak3uSE0vvvsfky5vezJTWdpaDJzqsWQJPCZG0oG5Ozc
         NQJUoVw4Xw8KQouRXDDETTTWyHQxt/6sjzI0iAPosZUfEPuV89Ru3DfsHys67/Tgie6B
         Are4nAxZVGahH8djPmUssH14IPE6ObDfXFsdXm0JMSQtLXmdG5ZBQzKMaOt6lNC3mBFT
         c2ymRNIzdA8OM3TuuCgG8Y8dDNygjXHyoXlVgNoteBs1mJO0MCYnT9wGMiKUYj8BSHPa
         X2RNxxfF751tZfEQmWvm8ezhb0cnztOFGMmNCdiaKwtFuCowGgB4Unr1QMQ8TjWvJD5M
         Kpkw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg6aYunic+nnPj/d3gqmO7VHlvz/WTIHvt2Bzc+xPHZ7Fi/i+rI39gg6/lp9M1KmZGoQlUGegI8Xjq@vger.kernel.org
X-Gm-Message-State: AOJu0YwuIhfcg4TKpCp7kcHU59y2BzoHwT1WjrdiwK3XNpbe/5CyN9Or
	GSnQqMzjNFcS2wpgVz6yBZSlYHN8denDYARSaL7d6MxwrhztKFG/3yRV8MytgOhqFj1FbZ+oTMh
	pd0e6IZCuDMvhMdSp/Iy2GoelD4n9L+ehpTgCukp4A99pqdkjUA7PaLcXB9wj08NO
X-Gm-Gg: AfdE7ckC73DS3cQwGF6L5v2zXDBHljnbB1Rs9Vydt9/MPTC9aRgqQ9U0CcAbeMKbv/k
	HLRX8ljw34YXd3YX5UbWii/t8UC2GZhqidDotCkiskH9kEuGEG2zS/FzPNOizAAzEDWs5vVfP14
	rtnLYrfdpheF9ilitSRYrek95LreYmhlrK8nYBiu+FITqa9C9Qvgg8TwrnYWY3lCJik+GLHyXrB
	k4pB7coQ/4Om/7MPHAYXupvZJXbJxSo3Vq/4PJOTUc8SwynYXy8heTMbcb9qH3XoL18hYRqeSSt
	MKdW7wC3k2URVlybxLKUzuYZUdUsudHq5nvRt6PR8s/XS0mYVWTgHRLOb5B6ZKEUUepF+ymSiA9
	mbAzOgtg4DOIQIxHlZfe8JtAleVcrA3MpnCo=
X-Received: by 2002:a05:622a:28a:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c965f67ecmr66969351cf.2.1783677499921;
        Fri, 10 Jul 2026 02:58:19 -0700 (PDT)
X-Received: by 2002:a05:622a:28a:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c965f67ecmr66969141cf.2.1783677499587;
        Fri, 10 Jul 2026 02:58:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e6286a5csm225060266b.11.2026.07.10.02.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:58:18 -0700 (PDT)
Message-ID: <8e4a1fad-3b77-4dc0-b4da-86781ea7e571@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:58:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfXwX1eR79iFVDI
 A0XqQ+JHgPoBHbSRGjlhBGfGOzJity0LiLYtehJAz3coVk0ntza+3x7IYcbyMviklYk4rGcn4DL
 Op20RG0TY9EDN34+EatZDag9iUUQxMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX7KFSlhJ4yuly
 kprpN5aD4vVNTshVyJ/A9DP4s58ezFpfeUCLmHtJAr6dOPReVVqHQLM17WVMbNAaIlqqEEBB9I8
 BRSFwxlV4/GjW8XsAmpTnNZGTqSgUQXj6h+wm3l5mMGKeQOBXTEb5t8zZ7xtclEns9B3+XsWPQA
 NUfBt2fvMNXvXQuthe2qi5PDnvob1vKaU0JgB55eNOQjOTOshX8cVVkVDN06OJeM8tsD0kQ4Aee
 BGZij7c3sGjdFxWJQ7VICou/tyi4kLW1hR6f6257rsW56XPCYdWATnk+CJ6BmST/Pf0PfqrlSwE
 Ohv8DV5kcR5+pGQrRDDN3bc065swnT6NpaoPAKMDCABmd/grg8VN0rXB6C1a/Qg+RgRAZHuovaV
 u9O2tBuTDA6F97t0xMDak5VnM9zhqocXpwYqM3VrSRd0Ikr2nkb0EAihrJjxuJZppLFWS3tC3Q5
 dsnFu0e9c/SG8L6A+Bg==
X-Proofpoint-GUID: bbn8ibajnSPIJMmSCXfM4OnBCUlQ8seq
X-Proofpoint-ORIG-GUID: bbn8ibajnSPIJMmSCXfM4OnBCUlQ8seq
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50c23c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=DccJuX7HoWOZ6YIWSGUA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100098

On 7/10/26 11:53 AM, Luca Weiss wrote:
> Add the missing reset (BCR) for sdhc_2.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
