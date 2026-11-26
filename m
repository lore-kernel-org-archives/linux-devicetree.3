Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702411;
	b=JDzQYG+CPORnJBmr0G3aZ8Seddxbq+RrZHaafqMob47w8koaRTXGSStjoM/K5qgdwKNJ
	 hc76RQZ/qvSqxiL53Mkx82PKrxtcw0Hmfh8Yu48Mks+o6zzR1f/NvokLApRMXf162b/nm
	 aXfvBCG2WjtJqHQbOoSY8Fzn79k+dmIbHN73aXSu6fdrf8yBLCR18OlswLrA1/YwrTzWt
	 bh1n8CMwY/MxLgQ/rywvfuPn+ktrLduDJxsoNJXSXQYInQPhawDJMXEYUdXPz5u9OAWhR
	 tVmJGO68pxWBQcM2K9vvUUAyc7t+QwPeW1XGMKrIRoHWFB7CXlXCKG5VWwyyuPa0idw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
	b=pLQ9/YvkhNJBwdSxha0ErrbKS3A11tRlZ9C7jpU5WwaDmH10kth6Ahq+CABlMi3abUY6
	 tYX8+MkYGKozqDgL/ibqIHZxixU83LFBfQAjwru5a1v1EzRmudzjRKvZPIKhSGSDmdx+l
	 oHcLTHMtdmW9xAXCNSLbWH3JLcur+fay5Q2yd2N9IqwKmI9j9eK0yQo/rLIqvnlrxoH5g
	 M2D8dWZW7jgtcA37S9rENWbp+Mzyz3ewjM+NaOWOZkNLHZ2E3c5Z6H48EPhRy+aNY9G7Q
	 HCKz64xLaz5eXatpLb6riFiMzgKd4rxy+KEeKf+oDQ6u//w9QgPOgxNSNtPRlTxEGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLBp88Yd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCgDalJN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59512606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59512606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLBp88Yd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCgDalJN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVShD1497082
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=; b=WLBp88Yd9Isb5HNV
	zaYDUPM66mu8uNKM6YbWhBtBapSGaI2FXbduLvTu04xJ9QoS1N/lLDryZG2C1RrP
	KQBB/olxf/kIxdYTSUbfsUTJuG3r97vjf12ToVD9m3aBbkC2zM4+qpbVd6Wb4zRU
	JIpWu/MaWjQemL9VsDnywAxFs5HJ7H5FghFPC0QqxMxw4gjeLxAq6uaEEjBZcb2r
	bijegpEiX0WWMdaY2rwmiO9jYHL77wLRF8iJzbUn2j0lwsOamXzedr4Gg6Jaio8g
	qS4pm+6gYH1enz3KNJM+sTPwhQW0If3/fX+r+KUKZDAcFMC/Y8nhC+lNrXgJzGtw
	2A5s3A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3cr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:13:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee433ab272so267160e0c.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702409; x=1796307209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
        b=FCgDalJNra04DywnziuQbzamN8YoxLVkyHADsHFf2O2xjvnDNbY3qu+NNY0Vga4nbv
         mXTy/F9+hoSVn7Fc+wUxBUGjIglaoy3kA5oBO2jXnTLYluQCnW8MJnujbsYVgTLHuwzW
         hbbt08673beaNFnFc/qR/128WKfs8nnW9NoZ5i1XVrRHS1YDatiNVQPmk3dcCTXzioxg
         tzEBviOQzCZkDPB0y8+LOUyD6tbBl4UjN34DghMWYw2aPLT74TS7iiuQYxdpB0L0im24
         itFC7erYx1Cc/kZECbPhUUWmUVePQ1PCMNwdMG5TOpeuQVf866Z8mZRgjntLkSgR/si6
         8drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702409; x=1796307209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDJ82FHg+x9YvhW2dNbSMIILPOdbryVsdHA8c0swgyo=;
        b=Ftm+k/RM5D71Aai1gM3jfYpVPVKtGzB1GkjOo4qFcZ5QR8TGnXW+aD1Xreu0pvzdjp
         TVPoBTOb260tXf8MTiDfDls0g+VLiW6Lo5mtx4hM7Lg0kCLWUjGELrBAhftY2wflb/GY
         zIJgOBHBR/rr00nOK+eUb4R5Bif0A7jxaC7yFrw8uuS8bISiQRagRbDK2UcI4rfvUs67
         IIWzSreOVrqxxEwyd0yq5SHFUWxOiGDtBAGgtsT5gINpShiYzSfYx8x1pip/mc4ruJf0
         eJfZ2c2sLcnBCyqPc/bnhVVGGAMqW1rV+Ot7ZSxDIw9cW2SK7yJEKO3fDGuRgYF/i15d
         wrsQ==
X-Forwarded-Encrypted: i=1; AL+hErHgjuhSYxL7K5hC8cqd4XRDkfC3/dijZWViTqzX1Lc5JcJaZHT3mR3xsX/jqAQmldWvJyWY22XAHUVZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/BIG2THx7UMOYlccPaEbCd7tDnwA8t2AVTirGjf1zdl5+7p4JA
	ATspUBzP2RdwgyV9WMKx4ba9IelysFPwCAU04iEpJBgXlXNmFf2LAbsW3wrxLjI18OtoWDZoAQl
	kfkeynH46aBTIR+VMoM2EEEDVryQjWvQ6AXrNza7rIJXj/sZqvfRSdSI4gyxNZO6Z
X-Gm-Gg: AZFdTZfGfhr0EIG/2AYTIFwU6ML4CcBbNcoDQJAomaWwSE1ASQ/VwXZmkj9MWXQ5A74
	kJCWvUHRFVLW6jOTbnT8ONezJ9WgdvdXfNPgxwYNrcFd9tiyybl0LhOPK0nGJpmDDF/eDPrGdJO
	DrlJVwtevgv5lOB0rYNJOt5Xh8aLZe+VO0/F2k95UrIrhnkvmZlwYQnHzMWY06Vswm0Tre9B1vl
	fZKuPHGhIDy8ovqXtou5t52Tobz0SPc7+ZBPKX6pONrXcXerf46aFoE5ee4VuBFQHvZMOMJhyX8
	y3FR5ldPvsHWa1CGzqIBGTPZMXfCN4hEsez0s1ARYziZx9pghRvYNxs5fQcijvds2FoHjB3THVd
	M/3b6Pib3s75kgOq5G82KktGp2GSrvcFPSk0WBAZ9fCVBvJzvYJLaviQodLOBgGfaa7X1VkM=
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr14137663e0c.0.1795702409557;
        Thu, 26 Nov 2026 06:13:29 -0800 (PST)
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr14137637e0c.0.1795702409150;
        Thu, 26 Nov 2026 06:13:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm9124759a12.13.2026.11.26.06.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:13:28 -0800 (PST)
Message-ID: <cc092fdb-67f7-4261-b450-d3bcbc16bfe7@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:13:25 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: qcm6490-idp: Fix the panel
 reset GPIO polarity
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261126134508.320700-1-vz@kernel.org>
 <20261126134508.320700-10-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126134508.320700-10-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX7Q+BoRE2+9V9
 zskecP3nB85Crzs3RH8JVjvHRvPnHpZ89G0Qt8OgxqHmz/Tzq+k4OroXMCYzod+LiROxz6U43nk
 nWUPNl/EHzwtTEcdtfjstzol8yE7wr4oREQyqD5D/EWMcrciYTQlNMqKetFvQwRHv/dnMBfwvhw
 43HWXWH0P7st5HPtYCn83hDEt3vPJm24UlXDGgRbrZ+UYOFmqhMd8eBIvsu8UeEf8+xZr0OHchZ
 ZoTtxCKbML8yVAJa7kaGW7ihqUWUAOppmUc/Kb8H69udzZ+SbMYgQ/y3CRfXWi+LflypP41IfYJ
 4ENSOoqINTXzjxaMe1s8QEPfmIroLgX/Z2VwW6zX3wACRSrWiihC8e5j4Y+XK96lww8VWSgDMSC
 0SGHHhS7FVEym72ISjxYprouzR/3xyoEccrSNqpe2Z36oa4EbLXEfoCB02puNbnmA4RxfKjCCIN
 UoMvRzHkvQTgeZIqmhA==
X-Proofpoint-GUID: yMw0IzdPMqQik6zJls_dQOTYtps1UaXQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX+JXKvgUjK+D/
 v6k5YTFj+GTtjOVthlf7QHrI2E38aqintFq57w6BmYml4FbhsvZSaghwJ8PUKvVRc9lHiAbj6yV
 F0FHlELkBNIiwS9WNWa7CZiLGecXnpM=
X-Proofpoint-ORIG-GUID: yMw0IzdPMqQik6zJls_dQOTYtps1UaXQ
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b083e8a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=guKfAgVxrzOWnIkQY5wA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055

On 11/26/26 2:45 PM, Vladimir Zapolskiy wrote:
> The RESET_N pin of the NT36672E panel is an active low signal, however
> the panel reset GPIO is described as active high to match the inverted
> reset signal polarity, which was assumed by the panel driver.
> 
> Now the polarity of the panel reset GPIO is enforced by the gpiolib-of
> quirk, so describe the panel reset GPIO as active low to match hardware.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
