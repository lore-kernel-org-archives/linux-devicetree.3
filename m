Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BE468C13
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345752; cv=none; b=fxqVFPWndNE/VejIfyY6605dSSUYKAHAzrQCL9svGv824o8RjS+bI7BxgGxU8YIB2iqnz90aHyWhfPr2Fka/ZY8eENt6qln54upOAroPcan93bvdkOQ0J2uNN8s3aw395I7WhN//DJYFKuJKM30q9KhO/GTmelN9Rqhf0DyK0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345752; c=relaxed/simple;
	bh=v+f50awr0OZ88U1G2v97y6c01J5BI6TU2HpExBJ0wcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tphty/NJBwZPOdRUW3tlC0ja/wJpuuN2+iRTE4lqXu9+VE0In9NWkXwq3LHpSTpK1wIy/qIO3biXD91MxzaAN6MvY2r2tl5fgC/5V+kR+t2gwQrbPs5fQhnEsY5j4lry1ga2uuoZp4ZFRYSVCiMyT0dYQMTSpE0LQFQuNIdNSFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaYcDduk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuMcHDN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaYcDduk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuMcHDN0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682AR3lk1287356
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=; b=PaYcDduki1gBueqR
	igOujD2fG2GonUhNJfHusEMnYKZUWfVzoCm+OXuxB6nWOzQr7IB1mN8ADGWkf5BH
	y0aEx6vJ5nSSJQqK5/ZOHLiJnV0ePNnrtF77hhx0bfrxHyljLXKDHoxayBf6xAlq
	gJAN8sIKG8ph++pdfVThh08gyCvTBaLaKoDI1hVrdDd5ii0pF4DCz0812e/k5j4y
	d12XuHtZu1OgpKEk4oo1gBCBcF8Rft2ei+mYxok2VBwClQGglWFmI29y96M1/WML
	AGPf+WcHkJ0lfr7WWQJwWHgbcgQrBb7+H48yUsvAZrp+BIGEMjFGqrZf9Q2ZLkZM
	kmSERw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c81tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:42:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso22999585a.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345746; x=1788950546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=IuMcHDN0lL21hZ2xHWUVZEynHyN7aAWp3jjpBVlXiJdAunElqj2KDq1ACDOtIBzBlb
         rHZaOUFv5ThNpbhEvjTaBPrsgQmx2KbVUMMAl0D/48dwsG96d2WmQI3D65/FzLVX/fX3
         r4ExQ8GfQNW+isfMIiXxaVLjHv71eKWGJHHCpqJdVMv4+oYJ81n24mQV3bCfdLWER9si
         m8+NaPjysajxq5cj8ijl3TvKqnE9mRTQuqw/iumcSN2eg8XPMDFMv7PXH9KZnkNNyqaY
         rQFNFCQcfXtpNWn7Q8X0+5a0XEGVYwM9MOw/HPOx5/ugNj/uW1SqSSCg8w5N28nYwjNT
         al3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345746; x=1788950546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYnQe34KhevnSS7u4RCPgQ3k+Cl6PwnRX6FcYBLfRUA=;
        b=KlWMOfg4qKpElZwYk6jHzI/Rti8V/hsMHa6C0Bl0oSAUDo1i/nMvETRjUSfCrXt82A
         8MCIMDTYdvaJF7T979KTgsrj75gPlOLRDAxg9JnoGiT7NZSF9IjvtPSu0fRWMEAVC/Mg
         B3Q8xQcfwg9zgUAiczfCOi+qj1ZraH66tO/j5CREjpZmAup5aDaf7UIYgEeF8dL+U93R
         WVlIbTEgUUoEQjwSMu6EXe4LTdM51sftxeOHMk+qk4LRAK8Qjs388SZYPjSVqJRVA6wy
         GmDZeLA0rA2q+97WnDHR0xeAyN6MFu4lG1xA5oLW4wZfwAAiV6Bu41Pz754KJliXeadE
         /46Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkwHryi8tTc4iFzxOhLul0tOwR3PveXLOqYMfNLt+NCpzuiu5siAdzOAlZhtqCVX/mpz3DeKQP87vL@vger.kernel.org
X-Gm-Message-State: AFuF++lt0IBWn7dcLGUw6ZaucGmwEeGTndpRlldt2B6hlw/y2TwFcdP/
	LZwmC9M2ZQjPSAUFfgps4oBBK8/t8+eKKuZVJ/EafKJp94DJ9xHWmiOmwWpf6hgr+3aFc0SVdwj
	yvaz4x4WJPRZvyY/Df1ZIGG6OoIF5L4XTePNSvA2MRLg2x8h+H0XYRfsrrKLHO46d
X-Gm-Gg: AR+sD13ha352wgV5KneNezka3uOcvqD52hxMdSyuW5g+hibOhlNjbKNZN2gQeTnPDZ3
	Q+9QvLB3pu+SX7efSWdykt4jRnv/l79boltveJ8RwxYZvQ+XbOQPncmVVGQPCckGmx65T164Bvb
	4OOA4+KngQFqJVsQiFZRdn2R2t87DknwXWUUnXd0HUlRfO9AGRA0ClJGofrnqN/lRed9cPyvuve
	NgnkbRUXgZipyVdatk/ZI6acCgH3VIYC3YymvQj74Tvb6UJxq7mKFjToTsLAHx2g/nBcSEyC+OQ
	laytuG8KTjcafXTUkiuxdeQrBYyvq8rIaCdeB/KL7A//SSlPLyqCvz05kjkJGF1DuK3QKFctkP3
	E3CyRvLzjwSNb4Ug8Cr1D9Q==
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257850485a.6.1788345745907;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:939:46cb:25df with SMTP id af79cd13be357-939611000a9mr257847285a.6.1788345745514;
        Wed, 02 Sep 2026 03:42:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d0089a0asm111279566b.28.2026.09.02.03.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:42:24 -0700 (PDT)
Message-ID: <4a16a8ca-ab62-4248-a9c5-5362765ecd0b@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:42:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: ipq5018: Enable mdio0 for
 SoC-integrated EPHY
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
 <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-2-629c7bb05c44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX+ODaELP1Wj3e
 ps06XW8np6WQxdbcSM8S6a1VYPtVjp0gUqEcIhjAYTdd47Eqzl+Fcv5xMMMIT27kjPpaEjSxGap
 FOhYLYe2Rxv8KwQZoV0WYX8ogziuCrc=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a97fd92 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ey681UiW4vGkVYvG5ZoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rtitOvG0Yjc5zT7i0DwNr2pxJ19X9YOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NCBTYWx0ZWRfX2KUuJj+axZtb
 u9ppEjthsiYwyNlOgFnEa/Z9MLsRwJEbA67beXy/40EZMGJg97Vk6shWioD8a8g7FnDEMUSRLWL
 To85+cXb/Sox5Gx8pVZTQXxDa+tx1AfkFHmxTb7vCiNGhXtB8kETmPdT4bP+GUDMvw1TLpdjeMu
 inqsrDM19M7wUjHS+QZIa7U9jZYxqi4mFslH/uyzWfVgDhEqbfzcdMNOO7QfvPGo6Nb2iNzxz0F
 PrlJgJyWzNhgAsHKe/xGbAzHVCFSnb+PF30N+kqWolz2BgLJBv+scEgsLb2iNLdNbQ6HSLtmzDL
 WgZbi6TvDHSS6y89pzbRwd8Z1QtE75bLIXFMukm/oRt5T4pqu6TFUqiKnV1SQPnKHKNDCks0umC
 yOMmm1e5Dazb78JFe39Ffh4UZGmeSTpa5qF4TRzMXIZ4e7dqwfC/Bp3FtJznxbWLfuEchQJItjz
 q3nGC9wTkBH6rp/8jUA==
X-Proofpoint-ORIG-GUID: rtitOvG0Yjc5zT7i0DwNr2pxJ19X9YOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020094

On 9/2/26 12:22 PM, Luo Jie wrote:
> mdio0 is the internal MDIO bus used to access the SoC-integrated
> EPHY (ge_phy), which is present on every IPQ5018 RDP board. Enable
> mdio0 with a 6.25MHz MDIO clock in the SoC dtsi so all boards can
> reach the EPHY, instead of enabling it per board.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
