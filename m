Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84A517BD3
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165983; cv=none; b=NNQKKmlZ+jlJkHcSfVEVhF/lPKaJcL/rpzZUclXwohLMBKLDKeZGNrCLSPjS7BIvyNMQaK3mP+65Vud+B98fE19G5o0ZrSgh1drxExNJsOCR09pvU/hFZPJ25uXazbRQoDHhme7aDLhX/NQqo/n6Nb5S3THKcMPl8eQ4t1FmUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165983; c=relaxed/simple;
	bh=FRdZr1Qf2ewNAG90/1w19BygcGtrxeTxuYozL/kI2NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CP6naOJd2ySFBF2iD0WpgfuPhAy5r084RFocyi4hn1fAylAZaE9QiYr+fsbO+Q0NP3ox5WHzZXdgNih+cABx/l2DfFKZQ12XJM3/4k2DTwXoqfPkHXsVj+0S/1FZhxXX0s7uvt6bEZfmeq/gxUCa2Gz4hwdQ/EtY4q3RV/YkNcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSFRmsHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0oBM9n3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSFRmsHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0oBM9n3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUum2443305
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=; b=kSFRmsHs+oW+GSUU
	LEz6kZCbnLmpB6rmdxPPBwFZ8nEOw6U3TrYlxIcfTNQg5rpTCFb0P4h3jowlyhRA
	HkpRBwcDwfH0kDYeBBhUwa8GRa/Z+H+mmVWHOHw4mlbl1kjQSo10i3kN5LrrPcdm
	knEs9W5dcHZjmPCaoFnVPTQKtchQqGhmyNFg1xf7jYj4cfgyizDvxcQGUmf00e06
	1sjSaUZgzZvoo7wcoRn5JT20n818K2hSJOWlNULI1wz2xV+So11VZTZyIK/lml3g
	8HR0IsaDkrXUpzcJUFH/m6yy5ETHH+tyjj+bTYuEnUGPDq9+6/y3ursRtUiGw6j4
	ysbULQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7gr4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:19:40 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97f18b9d6feso28940241.3
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165980; x=1790770780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=;
        b=R0oBM9n3EsHbNbGF+9YMcC/vXlvEigwOm9e2vI7nSKjQ22Qb7wK1t6oPKhgEo+TqQb
         drf/5EBOBKpD8MEqg0T2Mzca+0yJxfmV0mLP7oQkmfHnFA/HF7oXrw4KcWs6j+gqHUtb
         4s6kGhCN/uY20hKOKV4iepYAqN+2fZDCdV8hlKliTs3CYmF212jjt7zrPjh6TYMNK0FF
         aRWqd1prUe1apnA0M2L1smnqhYJW/omid6ttEpgGv6IzurlcGmhjtvjWtcfav1+vlDh7
         j1TJsG3WoCNC6Dl0bvfxDMlj5rOtvc1ZXRYq4H5TV+wMPKx0OUONksYdrw4fzZ+9SYoD
         2JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165980; x=1790770780;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMmorU5z7ubvp2RV2au0vwumoI2G82ZHEvqLawCVIM=;
        b=qlcBe14oSAWhQhkbabmm1sjrzLZhBYJVJe+1Oi/4N3V5TtDaUU5E5Za71koHzfd7kz
         3zJPSSYRh5TTJmhtaOqOv3hQKg3GAPJk67xEFFloXcOPmeslAuwQLHEOvjJolCQeliSc
         oBmI0aTL4YGWcXE+IMg21rY95wMPbbvJdFkSwwhVtfRL9brCWS7W6p7NDtCEyb/Q099t
         sXiQeM06Tjjvye8zR61973PWSvecm/KVvKJVZ0wyfnCCaENdv2kgnfrtLCZWi8LF9ZBx
         txrFnovRf1yV6hu4Z8yvKgMrzJmbdEen4eKnjlyXDrDCEAL2Kt1yomxrPfPApALwnLQF
         auzA==
X-Forwarded-Encrypted: i=1; AKwUvBxR9/cNdLdZ3Qi7Rhhs19DRrRLQ3+4Z3QDkT2/cvqic11NT3GD/ZjzGCvYQfrZNO3UTtUv4FWpuDvpQ@vger.kernel.org
X-Gm-Message-State: AFuF++lSYPduNkN5b4ulFoPORPX0trMo03/GcyZt2wNbBtwrk0BAiP7m
	/lJ0mnsWKbiRMYzNzkFSibnblrnjwUo30ZBPUzH+PoateRXVaewbsz+L6L3foB0zer/+7Ga7BZe
	0UR4DpAEnMasgYIvIohOZKAfCjN2bDDvZCeTnPRA2hu9eELGXr4RUGtpRbpTeaaMM
X-Gm-Gg: AYBFou05ZlOlDTZazYyjnSvqk+k7HcAhIcmP5RkFB/X4vJdoMKEQTMFfJwstfrpgYs/
	xtZAa4ngg2IgM0nJTPRI395Wlfta0vvRb/ZocCPJzNE0BBso6/qWISVeKzdPDU40CpOF+Lq7OS+
	DFYUfZ3dHFstJuWW9fq5rfOIgu1MTAG+MNnNsoClXBwqpAwjOjuMVgpQhLyi/VdN8/plLOBcCQS
	8AMXiVU8x1NDRn1Pm8dVDsDhe7zw1rtonOeg1zxHKaOl/b9hJTOG9u23NxBoJHEMFtsOtw9d+1s
	AzKw2eXVEnVxZ9+bPLJ9+AQhTfpCyd8NZM1WNEt61iRmom2iQQohYKhXyxbq8cpY7azEG96YU09
	tFsF+/3ci98FAe7soW1xPNw==
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr1987607137.2.1790165979966;
        Wed, 23 Sep 2026 05:19:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5e93:b0:7a7:ad9f:539c with SMTP id ada2fe7eead31-7ac1ca9015dmr1987594137.2.1790165979587;
        Wed, 23 Sep 2026 05:19:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab0aae727sm92143166b.0.2026.09.23.05.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:19:38 -0700 (PDT)
Message-ID: <07ad0b0e-f666-44f7-b5a2-bf9ad016b297@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:19:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add endpoint PHY configuration
 for QCS8300
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-3-63c5282fb0db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sAa2n_88PqF-9SzM-5j1K0QfuRkO-a2V
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3c3dc cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Z49P6srHwRQ8gCsPR7EA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX2Wk3uBy+wuE9
 3rdgO/f/ijRsTRMc7SlA6r6pfUXxEe+aOseq7VmgmyqKTCffT28qNq2+K0UFrIQ7lxIAffTJIyu
 Kh+xeb2GuqtmrHpN1DJE7axoGzR8jWHBFVnnZGLO00ml5qtSZdmGn7sjVu71b+oyraZNs8GTBuD
 pB2Kp3ecAynoVnKJQWVrkikReI2XJdM2F6GHbBDUiREOk/pimzis+HwFOrp6WrTPY8uczCOPtK3
 iTi85GQHuprNZOIhonQRikMl3P9k0OdsgJmuNT2ThL3UU/9XhwJV2Om02rAfrRGNOK1mdxp2pz8
 R0wv02vlxD86EQ1yW78cSdQvGOb9hFInB9Wrv5tl5UpAh7MW26I7RZryAR27WGyNn4cRqgwVfvF
 2BYVDd2bhTk4Fba/VtUMUJrng2nJBJ+Rqdqk7sfQhyEM6c/biLX9hHMefUxAbhT9HfVgzK1lL8b
 k2SrkjU6lpAWn7CNXeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX5GTdRxb5zPK6
 u96+V2lgObsoBPi8wFTxfo5kD0VH2FHHKAN7TP8M7hOaP7rbQiE8mDZK1HZZW1CZAb5hLSgm0aH
 W66AvHfvWZNUKhvvSrxcq/0mNhR6LMA=
X-Proofpoint-GUID: sAa2n_88PqF-9SzM-5j1K0QfuRkO-a2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
> Monaco supports PCIe Endpoint mode on both PCIe controllers. Reuse
> the existing SA8775P Endpoint PHY programming for the 16 GT/s x2 PHY and
> add a new 16 GT/s x4 Endpoint PHY configuration with the required RX
> tuning parameters.
> 
> This allows both Monaco PCIe controllers to operate reliably in
> Endpoint mode.

Does that also apply to lemans?

Konrad
