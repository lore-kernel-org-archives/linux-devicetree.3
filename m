Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7883AFAE0
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333791; cv=none; b=KcFrv+CIlzZFRiJiZXydkE/w8AkPSPGkiTHZUKhhk6JBLxZJjShcG6sbzlb0b+5jCT7SRdSSjXBMHwtiZbWd4oDX+bWOjo1bWP+TytlPzI2gftuxPW01x+w5D5FxT/LlybkVNqKFLK69L0HiST2vyKTS3V5DYCbz5GxkpzxD6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333791; c=relaxed/simple;
	bh=w41DJ4Ry6ZbMPP3IttDbLbgduHem4JSys+EOUqlMzhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkX0UgODDf6QXWA8qepFdvrnFkpHQ50OY7VFqdpDLr8vhd4mgutrkfFRcV4yb9fZ5PFErBp9pDWYx+CK4izsdDTLk50SiTyfGtlqw9Xvw0OrWjEWIbWqfEyzcRUOERW8I1cepXgNivitbx5r5xQCJToqUf8+FOBu6+92EDSB0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQ8DxLlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePigIWJc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQ8DxLlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePigIWJc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p5kY250546
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=; b=CQ8DxLlC1ALFL0bg
	Iw6yid3E1I6+R0CgByXSVw5QVqbIw/oMVh7qiOlOEkFuGx3QpEqAO0SNa+Ky6Bto
	S9SzmKNQWG794T00OXtZEsjYUYnr9oala9fjspMTNn63lqFAppasLonfpBcCCtWd
	0//Pqou3zsTQc03sJjgOfuwRW9od18ohbhoR/6RsfrEIW+OtwLL5m/oSxLnVo4ev
	AorzrNj0RU3TzN4HuVwFyMSFbpFzH41IE6yEiUNBqTQiYUFrUGGhDFLUJ2sG63nf
	lGNjBW7UcdkdUPuiNgPjKQDsGvyRA/fZqkA8JNWRlCFGu3O9EklEsK6o+SfoiIJH
	/wQtEw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr4r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:29:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso7644206d6.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333786; x=1783938586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=ePigIWJcYJuCjDWYqE+IM9vkH1Qx/lmM2feDBBbbliwoWo7E3fKewG8YcyaJTLAkmJ
         nEyOyT/EJxiWiiTZG7W6aa7c8dnOl37Z/DmDtI3mkkuLwb7LJFVX2/I+eqAJSqg843uN
         JCiD3L7gXERbpLJQ28tWns9MsyDadlq56FOOsUimNkgdNScS3WTTNqqyaU6xeZvVMA2b
         c/BdPS6qLwBkfMGHP/Dky/6ujWDEkSXGOoB5YfAvbWivUoeeOICKRn/BdWZDseOzFFAs
         8oA7FMxgc6YxTEMFy8QIlikzufXdtmIzJDDPm+1OSEAfxu88vwb1T/kJ0oU6iQA2Y4NZ
         Ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333786; x=1783938586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0pc41nX7pRqFYy4VQDIaqHwirZrUl06nKO1Kp135PuQ=;
        b=J+fDAQQR0o/i/I0mF1OfW/VyrR6jaLxLeC6AkITmX0ldPgxcz5KOH/jQyLxMYJvXvc
         KOq+c52Zgt4XBhtqhw7HQvKzO3lmfm/P3VirqzGV4jHc9fv2+4+t/uJFb7TVS9TNQkZ4
         ybIZQUDwUccNiRxOsS+2GbY0jqKKO6mvCOASeUtEEjHYvBvxFDqJn39kcQq4sHZhheMH
         s58LxxcLITWsZJwEJDjjGSO2ruh1Y5D5IudV2B+5OJa8hWmrPrIHqCLnjSK3HO9bSJR0
         9DRbf3569l6jDiPJvYTem9e9K1fuOclwFAUfEecfmVi0WoE3J6K6zQ2qFqiO88IA8KgK
         duJA==
X-Forwarded-Encrypted: i=1; AHgh+RqraruXYJY+9wUfPzYvyxNmAPsh0xuS63gExyvUTVMmdl+y4YFOkc97B/0gBAJ47pAPyfRwfNdOiC6l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tzXvlfqg+/er2JWnJ97Bz0OUdwxD1iWaaYgZdCQLXBkb/hTO
	PBtK7Am839Woh/VY8pT4JzkXvCZJSgjixLsj1pyLuE2UuwUlkYcaMu/jlDaucItp12RhRHSkdZk
	dEjED3onLQ973Hmrfywv2CFJks0hOqwu0isvOwvT6JlUhFdE70kEtYsDfzd+hUSac
X-Gm-Gg: AfdE7ckEu5VllcNhTwSXVkPc4fWLalh57ZnU7p+VdXPmbj79Txim+RQtDEzojKF302B
	OjpSAtUXpl9deN0TW2rd4iMQOUL87kJgc75PttjOfbvh5io8v2NXXVemI0fgJ6jsjcpLmD0Vgd9
	6mvm08Xc103DZMYRs2EjMwYdsSJVoDNxQyfvv8M6rRFXkoCrUu8GImKAfjKUyxz1Bz44Fkyo7u3
	BShOPH3GFBt5AtvhhOMVb8ZjfxKANYVTURpICztb+mBXmYET2Brefh2sc8Ygh/aglKFthVNUmWO
	zQOHdUge9g4uCWbfFHZRq+ze0eTZYksNSEbKHG6DYib90XOZBNxV+CKY8B4mPuoQP4D4titxkep
	E/OTQCc8e/ifmRxDCRDjplY0BObGqPN+6U7Q=
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102221cf.10.1783333786489;
        Mon, 06 Jul 2026 03:29:46 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c4bed6c6bmr90102041cf.10.1783333785996;
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6095b7dsm710039466b.19.2026.07.06.03.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:29:45 -0700 (PDT)
Message-ID: <5ec94740-c81f-4117-a067-0f10a462243b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:29:42 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS
 LPI TLMM
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TTv2WiM_SSljCmtAw2rn-B7d0WcMYqfK
X-Proofpoint-ORIG-GUID: TTv2WiM_SSljCmtAw2rn-B7d0WcMYqfK
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b839b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-Wy0pycvYJKZ-mX1LBAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX6s92qyaMqHkH
 UM1znJaO19eB6iVuwNMNVVm+oSRDBmPbpkZboFtLCxU1Dit8jB5kC7mdgFPA8G7Knp1MZUL0TDw
 vstWVJ5qdaO4AgTyhEHurfxs/6F/o/omRySRCXoyxcNKmSPso2uhfkthWCsH8p0ZZbWgWzkJBgz
 CAWUBasWg5jOieX6laLnYOETaG+ChlXcaLp7Kps1qo7bjla2BzYitf3XQIoXRTDfpvDgCWgeW0s
 dCKmJFAWHeG2C6HDJ0kWuho/CInUR60i+SXsf9ssOxp7sOozuomulphLwC8AMgNLHqPGnBwAnKt
 RyLAwyjLZuxIp4A6GjhnMeFMpoE5/n5UUyusfgobqq8hK0rr9ZqqOaDq0QyEvtbZWpX8QJX5wLS
 JiTwmKS4Alua5cy4hYbGIPASim/TDSWwJkyai19DJtw/HhfQhmPeewYP7CN7/yLQA3Iq65RV8li
 Hp+OdTOunkmO5SXlzfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX6HBJdTpMQ4Mb
 bwykb79x+KbjQKuff+ghISlVLFnMJr9mVsKXtBrZWHa19UiR2FiiexEKnuWKSNfG06E3+bFWhqo
 BLaSEd3KD3U3z0kumIPZZyLlRAEhjlQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060105

On 7/3/26 9:30 AM, Ravi Hothi wrote:
> Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
> slew rate control is in the same GPIO config register rather than a
> separate register. Add a new variant data struct with updated slew
> offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
> pin descriptors and function table from Milos.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
