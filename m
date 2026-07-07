Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55CD385D8F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402841; cv=none; b=mHGnSVLAzwnORVTRLUbUCZ19s9+zrgwkTLCNwkVihZXPJ83x1bLvhr0ZcC0qBL52/uwIUasoGXzXyib0z6oDhIUZsbK2/bbUYOd7lpeaSsI06EON8tFeOmHzjVr/rqZHccVe48qxgGyRCuq41eNxzl9fR6mHxveZ+Bz85lTd5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402841; c=relaxed/simple;
	bh=2tGlw8u9Rbdvgrkw3LNp7XhIeWAt+H/gpCH0Q53MUZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RubrvpgHgM00OFDqYaxIrA7C15j8nVhvPPC+Wxi0PhPl7bbmDWC03sP6o0HndisW4u+Y3R4GkPY2HztO716lPjz1lkhGsd+3u1xiB0FHEgdm0tbE6JAq0c1dN4TapWwvuyAqHXOLpwG9KfoDfIuFUpQ4Lb/SJmw+vQazExCxvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkLGvGfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRhsItac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OkLGvGfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRhsItac"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748qYf2687489
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 05:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=; b=OkLGvGfiGBUgG5vL
	WKCnDi1XODznle+cnWEVbG5R7qSGM70OtRurYEvAwiJCD+RIvG1WtYODlMwQQEnN
	qQ9hYtbJbj99NQaP10wJwkzqD+sOU/HNQZsb534UJxG9HK3+xVjY4yaaVRfmtdje
	ORIEEDJqZ2bNn9dA+Al1WYyRO4lZrzcYWK0XLHOY3HDyv7QjrtLLuMyu/VrQDZAR
	tT5F6hR+cRv/0GI1pN5UtwBbE57w4cEanivdkyM6yHtVKTlFVDWGhenE2pSB4b0A
	EE/YOdy5InErfZRZPm0EPoj3RVOuyJ3XYn0+M8PA27JOqWFRufFFet23H6RWz9tB
	a+1Heg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvb8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 05:40:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38101e6fc6cso7296889a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 22:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402839; x=1784007639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=;
        b=ZRhsItacYmsR3wO9UJE2QqiLZzB9BRiBuG+vQVlk697EOjJIIGIJSsvYpKzFNCGKZo
         Fg3IL5QQv7/Y14qhMT913BWD0JLpW9p37aymGSK4qpP49m+F/Atj9QMeVqYCZptQ9b8x
         B35fv68Qq6LTnomfCXqXQKPMlfbFT7GFJ8UTiwoezFIKtC47cKrEcrHnwFvEHMNoha2N
         a+KJVulwz9fRb+CL8JFk8u36ZgXOfFu6ZGDUpQV3NzNZMz/gHtG9CcEPlu2H0VfhcBNf
         DI1xdTEffKgpRI/H3Fegjeo0XKq5Xgr9uyXFC9K19KOV381pAtkx+5A1VNHYCrpHEKwA
         AGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402839; x=1784007639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=;
        b=VL5SxNLpB4UozkLYD/vpHldEjYISImNvB+cSI2dYw2GF14IFI40XbHsUH1bKML8+3X
         hezNR6qU9gVdSMq7RETpqDDxpCMjfDXkJx5zkcueslLw6za32Yr2BNfhKhZ7PuYuTcrf
         MhnSN1STS85dmEuMCSQQbtqNse4+mkXKpm8s/vsN4B00TLaZUDkUEvWvjW0IQ+PdbddB
         0iYOW/pJ7fDgFYB6vN+3siHSxP3SUQ6zlVUqzibNcwvrAcpGmN70NkRVX9i94bUshu1J
         HNSvjuyQ+X7RaZ0SnKmjw5tlmQvQZnM6l3SRgcOOC8GbhUEmGbpCWRocidXz3PgwqFa6
         rdKw==
X-Forwarded-Encrypted: i=1; AHgh+RqnybVpv7h8qm29lNrjCoHJBHgQUHvOsfq1TAuwtpIlC6IQuA2K9H63NhsNH7Va8pK9jlLXefoGZmZq@vger.kernel.org
X-Gm-Message-State: AOJu0YwcP7ag5XqyljAw8Zox/hfGUgzKXf4d3v9JQyz6CftmNSvhyGeY
	7wS45xIKupZz1PwNeorhXqoGFp9/+vZG4NLTpzw8epLqAI+Izms4cm/ar9NxnBTpENtq9WYNqXI
	m7g5cHdovL8NthDbHNXoBFkf+0Au3+eDtDI/upu7hSYoGFm0FarB8OGy2+F2dRwIa
X-Gm-Gg: AfdE7cm0KlaAOmrzFpbdjqQR4iA2y4Mu13r5SMGJFOZ9xThHXZr/JeofOBiGMx9/hJT
	GAI0m3rrgMEpElEs3G8dx8nnaoBf6EyXuezWKRD45bKkTNmi7BkmxekC4xpLS8eO0R7MNddoVjz
	Cy+fm7NpHm3s6TxdwTLZI6vWxA7bxRiv/5PWk1Bk3g7c2To4MLEO+2Lf97/x7auZMrYNttdsSlP
	JywE8p1AxF8h/La9C3BbOBEf6lPU4BrwfblCIDXiryyZAOQWrTvxi2uzuKNSdsMRTsG8+YDkaKd
	ZYOf7RtLRRzb+JGGIdW5RvHgwgUt88ss90kigDVHYcyHkqZzGcajI/mV/JhdX4ifqztwGi5EoVL
	1Z/tWxZOVl+iI+cxH+EWns7CsLpOKn4+4oSMyhVTnUuWy4zxVNC9hsEWJTJRpnw05Kf5u5wPZZT
	EiukCl
X-Received: by 2002:a17:90b:1cc8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-387e0db45bfmr1432287a91.42.1783402839116;
        Mon, 06 Jul 2026 22:40:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-387e0db45bfmr1432259a91.42.1783402838621;
        Mon, 06 Jul 2026 22:40:38 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3c6bbdesm432182a91.16.2026.07.06.22.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:40:38 -0700 (PDT)
Message-ID: <8477653e-cd5a-4e8c-bed3-fc1a1e21088c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:10:31 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192944.GA224708@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192944.GA224708@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AZ5kZ-JA0_9Pc5bFcWPT4LM4y3hSxyAq
X-Proofpoint-ORIG-GUID: AZ5kZ-JA0_9Pc5bFcWPT4LM4y3hSxyAq
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c9157 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JUOmGHd9cyzBAK8M_EkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfXwF5s/UWO22oH
 i1GnVNoU4wEmUQ+o7BOqyuLvefJCRD9XOGdj7Q4y2Ucw3VT1g6ju48NHRjIXzAXUgaCWMcPk279
 VYTgvKtxURLGmB/ozuiLtM54td8EAc52oaxzbrEu0nI/Az9BNETnPKonGfl6uUOETKtxApmCamZ
 GmnjbRGJkI1jriKqcRbbBXcg99LordBtb/QAt/AFUTV+za7n7s8rIw9N6Rv0LITPTsofjMW+0J4
 YRcaHUaFGX1Gv9isA2X3/bNPjXo/eLydyV2p6V/iYxkDKmZhWmCvizNePLggMawHKTlWiK8bDfW
 zX4NdiWgWdteJVwHsjoI9KYlkc8CnVAoKXcmSUi8YjYeXrkBR7Io174x0TGtHexn+3FaveGICpQ
 S4xYPFMBOJgCLcrWdcb7TLvxOBDnbizoSIoZ6kyjl4X1+Gvfhxwp7DuodDvQrMQoMle8DW8KXWY
 SG4ulzKQ+FNz8f+bwSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX+BNITfkH07cV
 8+hEWs5Mmk2eCsPWAIOQ74H/11wlrIcMRZDVKsfcHLRwD5IcU9pl8Wfz1KOLmWHFX2ouPWsbB8M
 um5K89dEhR8UL5mYhFSjwa/pfTRfgDA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051


On 7/1/2026 12:59 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:49AM +0530, Sushrut Shree Trivedi wrote:
>> Shikra supports single PCIe instance with  5GT/s x1 lane.
> s/  / /
> s/lane/link/

ACK'd

Sushrut

