Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A44A8A0D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362211; cv=none; b=CZzkXXao6jJtKphD1LzFFdxE5nJbG3Jg2NN8HiqG4WoGYV7DoKzFM+NzZ3T91qRas6TxFQcj0U9xNnZW5QdG+1JxjOEMktydlKd2N4rkUpJe9kCKpsMuPWwJfkGAVFOGqfUgY8g9SLOZEiTVIiF/v1mjVlyFYbgdfx7S5gqer6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362211; c=relaxed/simple;
	bh=EY0WJ+63XZMHcJg9sqnTRl/NTwGGgC8KvPzy8eZihAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L7WBSE0i6tjhNKF0lOovMxSwPJ+KPckI9IZ+2hS6bS6iB2+Mu1Dfa/xSti3JkrDJ52KArxSpq1eTytrRzVcyPXfq0QeUKLDZGekhD39AFfY+K+Acoh+b1/i/uXEFkSS1fpnKTOHe993tX9HLLsezv8bl9qdkDLJBIgg9El2h6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqZmbgUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTkHvk7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqZmbgUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTkHvk7K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682DHVtD468420
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 15:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x6YJYhz6qJkR9ol1EGjcREszafaafwzYWX/LvB8sgIY=; b=MqZmbgURP5B9iTcU
	+127h2np+UJ8c0hYXMDLQM4bKzN3SnO6lfUy8MhW26zEhwQQL9o2BlVuIkzjESXl
	7YVEB9TTe4pWjR0v0s0tupgKP60kAxpW34IlcrX23tAwAEJ7ZGNNHXW8st3WqqP2
	zS7LlsNmt4+VKEiMnG12pnqMIFMzMas2MIAr8wNyVlTyZFS9Ij0AO7dQhsobz15Z
	6DVzNOrl0kps+EAIbgCtvNvM7GzKsrLhDQZZABujXG9aTUBEIRcq7CdRD6iKKVyQ
	XiNIUSxfgj0rvaCwgvX6IBimTJ6lUimS/vNIliqyFp60GQaWBhBiENR7Thf+jm3Z
	1mqAWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja0eq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:16:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ffd22d2b1so2351151cf.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 08:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788362207; x=1788967007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6YJYhz6qJkR9ol1EGjcREszafaafwzYWX/LvB8sgIY=;
        b=LTkHvk7KSeimAVdyuSyvL2T8QS5vrnnwGgCLxhtrzYl1VFEdTTG0iZPCVI3Oz0bVH1
         R8/D4VwKP70KBt2C9O/xyGxQzl+UfNYG6oJpa9EDNDJp85qun5HkXpVGJj7THi/SPSyG
         UdfZ9SBBh7Y7t8Kb4NhNGwq1aExKDpj/42bXiVDPf4SpRj190Kfz6EdlBxFpoxX9CrA3
         +3Wj6gCmpHAPyv17mwIlwsDvXxn/IkpOoDYKPh+H6PIzmRR5TJ6aedCGYwb3d4NYRAbv
         TKoP6mSX9PEN5TUqSETbr3ZsRchAXB4D8RH9TXye8MeJofbu8G4b4jzbaqOEmqVJGv+G
         FJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362207; x=1788967007;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x6YJYhz6qJkR9ol1EGjcREszafaafwzYWX/LvB8sgIY=;
        b=HsP/kXGmMi1iMGkEg/xxpITfvOF7JWWTlmmNbOVaBXLQRIMcaRyhpN00O4FSlctzsR
         Qn3HjOVArvfu4d/4p4FtTk3crlud5ekbqILxaodJvD/BX0aIhDICDIg+FKgoja5DLigU
         eaVZY7XKiNe3j8DcAW2ZTgL4wXSmKWrPRjhYMq2Tyn4wXL93IbMAGQ6qHCK48+kmK5iZ
         7PrJ12YAigI5YOE5WTX6gj3q2g5mEOBDO+16R9IFeVLgCafnYazIZnYmpH4yyydU21KL
         +LgPTkx2PH12jVh4oDa1yrgBxWr6/caDn5dWA1rcL9yZ8NO/WV3NbfIIOA3wLeTjMWwz
         Cu1g==
X-Forwarded-Encrypted: i=1; AHgh+RoiO9ix0wjRqPZ6HPJr5xL1ZvHQAyP2FeW4GMZOKz2ebXWJnOGV3Cybex6rtjDCQWDwrZmifY4L/2Xb@vger.kernel.org
X-Gm-Message-State: AFuF++kFbSrhZyJ39NB39xmKfc+4/zdxgsB9G1GlNaqP1yo5KVc3UIcK
	FyGWIl0WBuMhJYh98YojVSh4+zdfyCADv5V1mGSsUtG3hyl1xjJs7CquFUDOu0RpQ/X20oMKKn2
	a9afFmij+nTN78sV5cNEvsqr9x9KHi5ViQDxmPeCrDGRfmaiSCK8FfM8FMBQMLRJqMwVmNQKz
X-Gm-Gg: AR+sD1310th0qNlsMeaGdA0eq5u9YIDopyqBBAmZPkiOz1Nbfcn3MjPVrXhEjCN0gy1
	Zb+36C3FrQvkjZjxqtXlrgW0ckJJ1QYWl62x8wHCrxV2FFbGIE7sbRIrggBO2ROjyctY5HWHWZ7
	UfUmZ/gDVMBOvzJOym+iFf9KnZyN3FRGli0SkLbesYlYe5Kx1kNs6mFPv3wQqF4FDAVaLSALe1p
	rk2rn66mF/88t8/3KX04du5iqnienkTvFbOYgpTae4M1PKRA7g2GuSh+0x/ZrhSHKNcxizSEseh
	jJdmO8EILFl5G3y4fJAdCbgoep2fPCRsOowem2bFYe2gdPZSh7cHhCr48WaYqO535OEH40905aR
	bmRHkq3op/tgiaKF14Jampw==
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr38544511cf.1.1788362207280;
        Wed, 02 Sep 2026 08:16:47 -0700 (PDT)
X-Received: by 2002:ac8:7d44:0:b0:52e:3b7d:df99 with SMTP id d75a77b69052e-53036b4e8cdmr38543531cf.1.1788362206529;
        Wed, 02 Sep 2026 08:16:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f941dd4sm1212684a12.20.2026.09.02.08.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:16:45 -0700 (PDT)
Message-ID: <8237cae7-0a3c-48ae-a85c-8521cda87015@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:16:41 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-3-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-3-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DEglI1GfKdJQAzEm6XSiYrGmpVuJ1PJ9
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a983de0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX5nwZCdAm0tP5
 oUOfHXFBPwGfmg1FXEzVqF2cL0vOwApojM8LLLXRDCG6wfDv3HEMworoOxMnrj8GXALtuM2oIUD
 TVuaiDHgWO+x3hXC32Q8PkVSe7jACOo=
X-Proofpoint-ORIG-GUID: DEglI1GfKdJQAzEm6XSiYrGmpVuJ1PJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX33+uWFU85QXC
 rr/zlcPH+NEhiRib8UXD/GRY2hxUvdWHScmSqVMoXVu3ZvkV9umVN/S6bqJFrdh7TK3XCCG1p40
 o0i/bGsETcLSbyMuoC6QE/VD7ljNzDKpVOOg5EWixcM99EBLHJ4uyK0YV9NWIL1Jy2tnCuqskeG
 NMKnzjtigVd204ay+1+4h/J6dV7f5eg0zat9O6vGqQ/jSt7MPtkYqoRHMH4i5HA1xrxTSeluzZE
 gQ7hhSXWS7zrlBvsK6qXAnfWD7G/x+QdYRlDyVIEM6EJICDP2bLUjMK5ymO/HWiWWLP1iYwbGTb
 DX2EFe1coXI0+RWSnQmahGb4m9o7vEvJjDZIKHUMV8phN0LyuaJygzK3g0jIXsJXl8k1VQFdLTF
 m9cn/dTZJ5AlMnLk+jWKW5r0zUbcu7PyWem4HKy4STpQszc7/+D42k/DAxabetkUEAdbPJWnTmK
 HlmPeyRZqZnLYIlmScQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020135

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Nord requires a workaround to address a timing convergence issue in the
> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> 
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
> change adds the remaining required settings as documented in
> QCTDD11972446.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
