Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DBB37F731
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357521; cv=none; b=H2pIp9UXuqNwjEZZu2G50xE4iQjRnkGTj+JtOZGzmKnCHM22Tnt3yArnt8IokzVyV7VJKFm5VtKzwcFJKv+cxAbqaCBXfqVnH3/9u5552LiYVriTn3oCUu0WpabAmQHxMW76VHH3bcdpm3Ec8cyTzxKRTBL3r32C6QIcg2cXxCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357521; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unTSYxsjmpribNLOdH5zYZ2hMCg/CgW8dvDVwoCumUxc/YhbwRR05Q4MKa9wNtQZlP/mp/OCMQ9KxawAojja2obBrNtVSOOvwulchDh+m8VC7fN8F/4WBfV2+GS1sB0hA6iGmY9mbBBT2IqQugdLmm5OAn8ZgZhkOtB1MCAwj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glWLPxZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYiNodLV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glWLPxZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYiNodLV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AMY43556032
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=glWLPxZEQjnUpPtW
	bSOMo5prMYo1vVUDL43yXrNWq6XwzLYPo+9qLLfY88ynXx9E1n8I1KEam0nTZep8
	3w4HHe71jCul3r0webOC8PPouOZnEZcJB4qX1l41NzYy0tBnImwdi59rWBdXUF2K
	qxQXSznv9GpeTzj6FvK89zTlJ47K4qXSKHpe89yTz9FiuQSAuU9VxpWQlnnlvD+0
	WtafydB8m+XZ5n4mDUhak27G1zRYgVhrCSwV3Q8Q5Xo84ObSiDQRk20CkzxLSVZV
	m4m+TmCJTO4NeDd3h5e7SUvUYGo6Pz5rdece5tmDcnz9DBj3T2Bvlbr4n0/qSgDf
	f+hvcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kx24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 09:58:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fad7b0ae2so20636521cf.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357519; x=1779962319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=JYiNodLViRhKjHt1naF3sVfYQWHZlCE4Q1h2WbpNtDanl0LCfsExNKWFg26j7w/yVp
         wwhgmt0yDhHO2VcrudUHJ/Ozv98w+ZBk7sxgh5UYn/NoL/ubrgcVwJI7QdJKDlJ0gkTk
         amOZ9Fy0jZLJ84j1IrYEtVx/5Te0LpGjm4f14bboiTMg2+QVhpXIfXfxKl2zV1EB6avQ
         DKHuz4n7lbSJ40IdnxxVYs8gAmefIidkJTZ4xBERHzNINLCfTd5Acvl/RPplAYTUPTNu
         UcQn5Uwb76bCE6JiM7/NYsKdw251YTp1UCXP9XRiGb6w+JUavAv+YJkp6mqGkVru0Bem
         8jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357519; x=1779962319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=TM+7s8jAvfVif7QOhPAX7tXVyjEZA8bkQFM3KAM94/X61jL9PNVbUg/p/lCgpMB0El
         ZotqhiCFO7Ze+SkCYrfv3vZApis58AKIphhISI50mX5UQ9YbDS3GRcKCHZK+Bpny6rco
         4pZiXSurGhzJOJCY6De8tm7ynkxTkLT+1Q8d0b3xh/KyDPGyC+0AOIiyfiYPr7+Tk6bg
         5SyQ8XmnERTN01KoILTeFo2YkyBVVksrFz9fsgv27xug88/HrsVEtc7H7xqFcwVxhhcM
         mtoZ9LeWdJrtXQtXXlIL4b/7u05WTtNEbGCbJzQvhQfeQrysTsmQBorzZ5rXug9Bp3wC
         fjWA==
X-Forwarded-Encrypted: i=1; AFNElJ9gfykXjfjE594iqtXnJY9f7gylCJeuAr/aGNgmjK1BmiQQY0+vQvCk+fRBVZi3/lkamisiiEcZV9Un@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/QCwVBmxD+jfc2eccY97diPCXWJ5gNbGY79d5mqMAYOnfL+D
	14TJmnT6lmYRmpHTrJEUOlM5EnjYick7ojSanqqnDhBa1kteIQu1zFQDCSpkNXE2Gq/mUqp0n2D
	QfbDqXd/cPPckS+wjlqeLdEP9WS9WgT2OM6hrKz16c+zQJkgmEUXkj3SKkDS0fDyw
X-Gm-Gg: Acq92OEhw3XkKTLuTgLE36CyFDYDM84RVU5eKnBsnJI2xih65FcnJM5dk3WEm+yjpBm
	h0A1Brsy2msrY2zWBh5ee1h/yPJv9C3I3unWW102NjHvHSRAeqV6Qewpaqsp0tCQMlsGgtxt2NR
	idbBli+DryOCsdmZNLXqHyKNv1uqz6iREtNyfXg7hRDG71o+P2/5/P3/Lnk9LNnB17qTcyiwQ+V
	y4+f5NLJSsFylu/vrCeGm66MHiWevVnDZJYrwGs8r3kf00eWyLwADgy6PUmplvb/0M5gLLRYKEi
	K2FzsfzWLfbWvJaPurqNAlI93smtJpbcpT7i+VQ4xgI0IMxQ1Zjo5j+3WyojYrssGDAGpTXlWop
	XHibLzl4ApA/mcgLlVUW7zy02v21Z9YCKrYwc6WbZlz2vBwxKWTOO/BGOy9goJz/g4SKwOcvhC5
	CuIlrDNR10KThQEA==
X-Received: by 2002:ac8:584d:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-516c56b32f9mr18871691cf.8.1779357519022;
        Thu, 21 May 2026 02:58:39 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-516c56b32f9mr18871431cf.8.1779357518639;
        Thu, 21 May 2026 02:58:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912f4sm25602766b.5.2026.05.21.02.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:37 -0700 (PDT)
Message-ID: <9248b61d-8fd1-43e6-806a-aa3b270b2ffd@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8550: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ed74f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Xrjb5V6ZJMw7tISA8Cyi_ssp8UNKsfU2
X-Proofpoint-GUID: Xrjb5V6ZJMw7tISA8Cyi_ssp8UNKsfU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX69/aJzfNT3SG
 by9oP3qxCiczsZi6TyaMGS6NkwnRgPgHaG0dfbYgZzs7f7dobZTVUUug2atunY0uUoVtZ3ysAp7
 eA2/rir9jTc1aqsVWKD/2pHOvRs9ESplGAyZUYnmCk64FGqgVTlovKo+4ifhT9l+CokP6IoXxty
 2RNPOL2uqDeXW4+8GmWi8O7AOLpn4ykudsCfHfSMbr2gExzk0BkwWoMqe1+nGOlA09mECS9TjJA
 bIMxAvzDYM8mea6Ggvv2Y1vYKZsrPGQPJVk27pqGxS6nrKv6z6vt6dS7FttoisuWXvAj9xngkE9
 ODcCamT+2xlq3LuQhJl3K2tBk05wq2yqR2VWi0h5aug/pbXZ5k+cDNtCpPJyYlIoQKxDu8P6z7/
 9zBX5EGYOcKOHqfYWFH5+mXTQ4nbD3q/JJ36P27NPb9Q/4yhN2RLyzRuLPJGG98hPt69qsoEESG
 tAWONWVja2yd3NbOvdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
