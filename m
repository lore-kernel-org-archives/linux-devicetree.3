Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D693B4EA9
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968415; cv=none; b=Oz79bQYcGyVx5SbqOjY5DoqJCkPdtiSY9/77Efg8NdfF51DJsunCd0/XeBcxb/DF5fg1WGaS1ZXJldt0tM+6zciHDJyjS3Sb2pjHGhVRwDDssvbGyF3qdAHUU+RDQPdDrKpMBMLcN4tVgE6x/91b0uR8s44/lG3HgMWU7YEbAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968415; c=relaxed/simple;
	bh=8LM+xoDSKZHye28CyhH4ohPUeAIxTs/QkmtP2fFY0hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TjQqY3bkZyn8V1VtvY6Au4OoR3qmgI3LQ0DAvfHZF6ZlZNGILMaGkm4+ine0LkdymxWNpkYcnHnFZriBXmGCZifoSdvhoP++tcyNP3vYwvoZRxSlRrJTfAbSXfunKiXM3xkc/Z11z/a5LjsA9lX3i/ku03Y9hHHMmdWqQHNA6LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NS2MZBAg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/xfUGnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NS2MZBAg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/xfUGnB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9dj3T727991
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or4p8FHMDZFJR09NECDM1up3ClrEb6rUu4ZXWXV6Aww=; b=NS2MZBAgau3WBiQX
	WL4fNGkYZ+8CJgOsQHQsWKz1a8b5NsLT2nGDZNploUhD77ZmB+oxj82iIsqCrJbj
	k0OAL2Meyi0SAbztPWjk+TfIemKgiDRIQZLU2JPIQ2pJMB+JndBQ+CVzzpbUpgob
	qnj7VNiIDMORo/dVKSp2aL0RkcYRVoPgw3jP2QnL9hbnmP3YITdcZw765Vez9BZx
	9Uhx6NjygOXnxnnvuyO8D6XGJmkzAyKNEo1kAVDdP7zRENrBsyMIw2OnoqZlaOtO
	/5GBUgVaOpHiPsMsHzte+8KOAdZtcvDl9IlQK6qlPS5pslXaTsbbn5+vTP8ffvrR
	XWZHzA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke156w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:06:52 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7674812ca4bso51401137.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786968407; x=1787573207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=or4p8FHMDZFJR09NECDM1up3ClrEb6rUu4ZXWXV6Aww=;
        b=N/xfUGnBy079Mruo4w0irsIGjRA8MwjmNoyBMbCsBbIqMJiWPb3LEtcHV0QkwgCvUS
         5VCJFlBTLxiCg0s83innpMA6xlMsCD55k10GVqWTFF7jw5lj25BNKHuISumcz/8PgMez
         vy8yLxju2B+HuFFkpIdTeDxkz7TlF7KXcx1FS2o095XobBcn0rUjRhACjtRQzS0xdy7O
         toffOjcXi7L4tXFHOboiBAeS6Lx2xYmFR5ulNoiaUz9rPXh/RthCn3UdYqyrjZu0cnaF
         o4oKHvBHfm0seQdxnLA0//Xl6pZ73EB6yQTGOM01DwSPhJevYiaJSCwqkbGFP0PjHgR4
         AJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968407; x=1787573207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=or4p8FHMDZFJR09NECDM1up3ClrEb6rUu4ZXWXV6Aww=;
        b=BMMRekXVvfA/9hUQJsUwOYNn3dwtIOIXEhQtKQY0YUVaHpLpJbKW4SPVCcByJHVlPQ
         JzPN+jNZMENWbL0NqGg0K9htjTx+bJqqRr0mpKn5j1JFNjALADKL5SgzaBcnrJwrjsr9
         uUue+/xUrPUlPkyb+Aj0Qj3pFSRu3f4HTZDnj6/E3P0NwLK6MSNds0aBYMnzwRlLXkQE
         Tp9jTcvkoaIPx7qQCKHibshG5jPnCYu30/GnB7R3vfjF/Xw9kYmuqXiCF/4BVgUo8baL
         /nESCYS3XCt+k6LyOxmMcMtN217ZqSmuuR4n4aWigEuzS5i7+KETgvB8iY/wsBT+nHCc
         z/0g==
X-Forwarded-Encrypted: i=1; AHgh+RoFfTkfYqwtC+qTfH4uCgybxQRdw5AHL+cBEoKyjVbHHaAmsuDyxBba3jHaDl9+oGs3a+FuoE1YIvNT@vger.kernel.org
X-Gm-Message-State: AOJu0YxsV9znXphB+CJ5q/W8zIcwtvAGfhGyLKkiC8D76AcS7VbC+YrS
	Z4rqKHkR2FoHqn5rL2OE7zUwUDRr/qTygGy6E8apTC7wxNla8NfQVsCnd7PLonuELycTmu3OrnJ
	IBX02bNxknrNEE7jMAgkAa+XjMQENzL5HjQQ/qzzF7E7bm6C+kABfM3vSL9+tFzE18DvuDpVm
X-Gm-Gg: AR+sD114w561PbxfjTh9S76tIucNO4VKkezt6xIQ7xmROTpyKl8JDNey5CNpflURAkl
	ZqdJfTGVcTgz9EaHFB+h/eZy7qegS2ZQnnbn5fdrHd0xgYPF6uPoFdeQD4evHLtbvtb64Vqtumz
	SfqC6G3hlVM6LpPnATloZHLLKm7sFGsdA3Spa0BQFQ+2b1atfdl4Sz876s7Lnm9/9FSvJEioXoz
	9BARYY6gqHqeIyUNmpLlXhQ3PuvICaUz6wYI2Lp5U9pqrcuEfFm6bt5+UBZKeP6JCJgFlHAhglF
	BHxNeTlLWCLCdBsdAdYtedaijXr93yo8ZXnUnyZLXp1cx783178VFFVlnjgbTJBZfW9vLSiRl9K
	ireF1cHNKPfaSroSCDA+ufsrW
X-Received: by 2002:a05:6102:570c:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-76f2d481b12mr1268835137.3.1786968407338;
        Mon, 17 Aug 2026 05:06:47 -0700 (PDT)
X-Received: by 2002:a05:6102:570c:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-76f2d481b12mr1268823137.3.1786968406932;
        Mon, 17 Aug 2026 05:06:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73c4esm14434466b.33.2026.08.17.05.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:06:46 -0700 (PDT)
Message-ID: <4bd69f6a-e014-44a8-bd65-2c1c8c81d71e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:06:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8750: Add GPU and GMU nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-3-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5MSBTYWx0ZWRfX1DMUsnmtogkE
 TjC1u90JrRV9pUeDwhirjs+BCoicKa8Z9MVp+UnJE/vQS8fyNy4iDRHU/cOKOG3iqJzhJNt/3lO
 OYE/ylD/7iqwPbQdcsFrcTRTphAYCcviHQfOdEVIYPWM2xbGqPmRPQVqf9iIFCgZUzDfTbmcokg
 l7ES99WZEYokPYTBDqcTprRadCI1gAo/EPQj3dvfeMrbbQig1y3eOrduUBxx/og4O6kZGlavPLm
 jV7f3fxyeFTdswAmzG6tpcmfumPMZYBH0RxpYnOE6OlAhFeztGevmT1t9SCuc8ApOQLN/1iMeIf
 7m14hizFqcHGBaHXFJvSYcpf4EMmWFXyuTbxFwvoNNEf0zxb/IcMKXz1cNL7wxNEO/WUoX9GpLv
 oAPbh/9ojDEa9KTNm527fJe+T8iE3eUiPc1kW4mw7HUHY8GeSQ/mH7rcyreaOsoayOBAUBOLeWN
 I0VPIF481ViwTYxnn6g==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82f95c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=OtVmU76MxArhZ2K7wnQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: M81g3b7bFNwcCp1NBvjzNtLLPaEaIOA7
X-Proofpoint-GUID: M81g3b7bFNwcCp1NBvjzNtLLPaEaIOA7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5MSBTYWx0ZWRfX7Z+B1ShN6V2q
 Apc7BxONPFoTwEgr2A36ZRArtapOuVTC13JjSRtGRxtB9m+NTC/4tgMGOVJNUnfyxhN2jQMxmFa
 CGeudyPjLLFEUFkQxDrdBAjzN7qK0fQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170091

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
> Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
> differences like GMEM size, register file size etc.
> 
> Describe A830 GPU and GMU nodes in SM8750 devicetree. Also, add the
> qfprom node to describe the GPU speedbin fuse register.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
