Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090FC3E49CA
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653411; cv=none; b=uXv7vq1m8ruOVcIjZlHu3pWetG3aAa+/8AcE6jdl/ux49HRb9kybk6tU1RGNidrU1IXG7NAANJEwCkQWFgMaPcWqFuLzp44db3hILJYhxKHeAxkV5FDiQi1mZx9JEiKwl5zzyu/3sRfgljx7kiJPRCKesFbkeoTe1/+7ESR/9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653411; c=relaxed/simple;
	bh=AdiOWnHiPW65nM5YRiStJWIJJIZeis5wrnpPpaqE8jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYeWJgg/2jYQITZfH/TXDSpzRYfpEWzAuDx7oW74AW3NRa2zlvAAgftev/X1ME6XFMw1tFPDSc/+U3Xp8H0AiZ88LHf8G30gx5S2crxstKekLNJKrWPMIxHh7Jv9D5fYBaWKaZtCrUXS+iJf4xcCKNCtuG9DY3B/3lUOuEkDZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh3QrMk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1eTQ1Db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nh3QrMk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1eTQ1Db"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88CYS1376024
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=; b=Nh3QrMk8RIPoCGj9
	nRZ6G+gwgtI1rBp1LECEuq4f3qnBYjzth1nQqiZpdS5UOz6i1zM15OheR/XCJp0k
	7tBL8dtWEZN6zuxagJZBElcfhIn0kkJRW7y+en1nHPk2+0E5ukvx57MN7u3o/iG/
	bFoe4kr0JRG+uWopnVvrj2IR37L2baz72cJ91uzzSDXHhWuJN9GHIVp1ixPeSZv5
	f6pItsYBVvHLpEV/2aFWQ8I8BqN14tz3AXtLdx8Pq0ln/LUC651f1Rq/MFTLn5hb
	2PsoocQICNz9ZOBRqdz7Sxt/lSvFMgCFi/nLEUNUPw9M29zAZ+swcH4mcsGD2cp8
	+rs04g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g96abruxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 10:23:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c59dc5aa18so72066e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653408; x=1788258208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=;
        b=e1eTQ1Dbfqr3w2G5N4yzBTmMiirmIzavnul7hU62Ijzh/JqhYWBvKzDp5Af76XKVV/
         K7sRGgidxGq8xrLbH86m0sH7dl2DJt/Hr4lzeUWEC23+CnF1cfntwE775dOgsZOtMFyD
         PCq8ECOE+LsfVM5DhxYz+W6e8t8VwvukT7KCrT65E97kdoWPgx5qU8BM24MuOOlnQlyh
         8AwB9xOVQ479jc8qgGkKFgvxe55SHIJYq95o7OcFTNsQkf3XshZJ4DQVZgKywMhMdRwd
         e2tZyqLkwYzCJdhWSKznAX1OqZnrHcIn1UbJu5gsO6N0ZYM9Gbk9yesDdGixJOD6ivXE
         12eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653408; x=1788258208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=;
        b=S47yGkY++mDrzV91kBbjGso1xrvCviw3JbKhyrKrFE64ZJvgELfRvuYUlwqQ4tyqp+
         stJH4bSkK1novLontC2e8UG1bbO7H8fPyMZxZKxjEgCa8oJiqKblonB1Iy7UUsHp7nmI
         EeNR8Qj1oQiVuT9dl40wkN8pXleLIU/3W7k10OqzH0aZ+ysPdT2MLtVHcSlews2GtKAP
         oUG5pvLcwEKoVoXTbUWje7u8se+pXNR+kia16uo4ACEf0dJUtl8xY7tUaoFEZj+AEqC2
         Z+4zAXfOYqzMGN8WbyxCKogcFcixxyBp0tXVBMO/zUzNh/pUEN0JEIRkd0mp/fOjsVNX
         v7Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoN6HWVqhz80eUDFhJJY9bhxJmUx0WppMPoUgkevL+iKaLwyJLYiG4lp8+EcjnkVv/Vg5LTDG14WbfA@vger.kernel.org
X-Gm-Message-State: AFuF++mD190l8ZyrXHA74Rg4irFEfNIhgOsRLvDyjO5eR1AhSGU04tdR
	/HKs5mDmVgI1JiDih/uOOeVYZbe1ToV7sTmdDI5tlB9zzDlyVOV9ALNTBvsDO5IjYFhYpOfmz4v
	oED8DKIyfXvDzoJNDT9ku6XqHLpPy+aMdbZVCdyFFQB48/ajgxfTb08ftPd+Cr3K7A3b+Hr8U
X-Gm-Gg: AR+sD115AVnQK3bwSWpb8S9ithCgJde0vTFjHAZOXbzOy/nA0MeAF9XHcCM43GVHvl1
	la+kUV4GMVapslsPcLyKybRxcKYvAWbzK+X8g8WotPMkvVn+PLhEVdw1NAB5S4TyH+2kLmIwTKO
	c38XKUhrlLvXNXw3MgzixuUimt7gXSytmCrHJU5DqdZHvPl/kqeB4YeuTQteYGfqXGs/mKojLyG
	jQHaEUsYj7cqSSqa6QtrcVT/IseCVxMe3pz/L2sTg1Zyuo0JTFfv1+EFTiqQguWMSXDi+DDBYZj
	h9E9haTGX73qqrNqu07vh20j8fDM4YkppqZEJAlPHxKMlkJuQPSIIEeif7hbauRRVJ/x5t2MIt7
	kKvJFgTeeq3Sq1scsiaT225Qq
X-Received: by 2002:a05:6122:1296:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c5ff69b867mr3688923e0c.1.1787653408095;
        Tue, 25 Aug 2026 03:23:28 -0700 (PDT)
X-Received: by 2002:a05:6122:1296:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c5ff69b867mr3688911e0c.1.1787653407657;
        Tue, 25 Aug 2026 03:23:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm13071304a12.18.2026.08.25.03.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:23:26 -0700 (PDT)
Message-ID: <294ea94a-5749-4d44-8aa2-35c16fc60145@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:23:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX2PJMMq0N+Rod
 YDteDZOb2kjQDbiXji0NpghJF2TJN0r/peuFuyejOCrY4koIhG/cFhhTnIeR+cg93z3+fD4vSkT
 gLjjVqP9+jKa7581SAWVdS6CqdDlJqQSGLIri5Bd3+lhvEcol2BSBCBdSDf6+LU4y5GtKBdXMUq
 9mCP0beT4vDAtpvN2FgNqRz9GM/eJBAR3QOpFfqovV9uxpQ4Zx9jBe3YMIZ2gticTl4lD5b97FX
 Uys37tNZjgT6IBBaD0/nc9QOve21vMZYK+2xq2m3csD8nqDZLhIqxSYY/gJbyAtbthbBAkD30T4
 4ecppTV97lwQds8fNY4Mk0iI3dJA6K7gygaNhW6JzkcF951Cyzgim6GvsBegtZErb61zBUCREUq
 b5ZtalqX+3Oa/Cxs55ZK6cT6M+TgxInQm5h8spHO9ZM1eTYZBDMB12yrc3ojb2VaOZele9u9cvL
 EE81HHhIONhoudsErvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX6sNykxaw1Y1v
 dF7AaPO8F9WEGUpj8Sl32IuBRTF02ERzLfY9DJsbmMzLethwAoddarMhXYMeS1Adm+mm+SET9eG
 9UcdEY+12hmaz8mma09+fu4Xd+5+OsQ=
X-Proofpoint-GUID: ACdk8wR4_tp4GJh_2KnLK9SRJQcJY9FZ
X-Proofpoint-ORIG-GUID: ACdk8wR4_tp4GJh_2KnLK9SRJQcJY9FZ
X-Authority-Analysis: v=2.4 cv=SaHHsPRu c=1 sm=1 tr=0 ts=6a8d6d20 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2CJPG24AF_AVZppijzwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/25/26 11:58 AM, Abel Vesa wrote:
> The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
> the USB/DP QMP PHY. The corresponding GCC clock input was left as an
> empty clock specifier when the USB nodes were added.
> 
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
