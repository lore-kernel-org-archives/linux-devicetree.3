Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F920433BBE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355816; cv=none; b=Db9AoBgtoTw/27sa6knClA3j1fRKFveD4ox5lOQ/wMgQ/I8u/oXZSTc858AwAXgUolV09yTMMpCMiRzZh8VYNpIgQ5Z9TQZXREGB82Gqlj+afk8HMq+7g5+4CShnX4HyLp6fvy2n3CP9BuV53hH7ChdswaTz9SB5+IWxqGX54U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355816; c=relaxed/simple;
	bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqI5mEtCWflZCve0ig+lLa/4UnJOp+f1+7yFPeFUjtY9T9QlkTTwFzq+8T4/Eu8p8kvNCmeVATkEGJk182v5N1wMRRgzCACr3JiFHk7PKY6lLiXOVx/TKLYHm3bNHwc82jK/fAISkAsSxr9WmFTU2OizLpyIBOjqEZYUuyx9ckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kE9elW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVnUc3v1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+kE9elW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVnUc3v1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHS3958770
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 16:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=; b=A+kE9elW43k3JhEE
	wG5rxbGyVqiu2EJsjUp4w8h255fyh8Sp7V1w75SG1Ng9NMOdpwAOQmFB8YKd5QjU
	d7HSNSGLcZaVU7dC713562ldZ6524HIU9eTjCknQ3KlIdtBzkUwj4nGhH9tCg6Ro
	rmCpvpmSDucwm88BxcOV+oGsUYlUaOFo0KNIwnZJ1O/wvfe1FeYeLcl9poOZwNmL
	RqZYuT469qkFJg9EG1djaMfkTW0CTmzC6c19Z7jY7BAgY7gfmOju+N2koDZjgUhw
	WLyE+QaDhqQvpN6lbTAdalxfKEI9w0iWF56xBTM87k5N2fLk4qexXlL8+o07U2Ys
	f5UTEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9abuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 16:36:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9c0c4492so74575985a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783355812; x=1783960612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=HVnUc3v12Y8jkP86s3ZduFwZlRodhbGOfnUycxAuo8zyvRc+gMDxY7p8x4eEI1mWzq
         AQxsCp4CGXIUEHkZOo9QXGdPT9n56LZhV2PaFQeNrTFxYkKlxkU8WxUeFo4e6K3snsQh
         9FaJnEiNq1uvwVal9RIg712H/4W9SqpkxDsD6IG4LD4CZuanDKCMM9+YUuBmQopdHYt8
         nC9IixDtVDe2h9qk/oTJSq/un/ZgfTb+XkJVa/aobPL21KkJeXVkuPQUh9Me3wm7V2Za
         kCmN6GCCqRAoh2tp0Fz09uXhld9NK4QRWHHyNQMI44sTriJrBQ4Fnp8QEE5/2hTpkMmm
         CZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355812; x=1783960612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=G+QSHOO4shvEEMVkL1lj3iSUp5GQ814xAlxpQxcxBAe7z5ZJ/iCRY+9JvIteDA5lwy
         hWLQacED1uY4mdrxA90HqJAr695ez+5wUPfErzExm6EbTvnFiOjA2/OknMdej4SX9bNm
         nL2J9hISGSqilUwh5TXvq7M3JcjKbScvUIBhzAsFalGLPrU65FDlWGIVWeJJqW8Q+F6r
         uljD2Hz8uhnKsTdegvLOWJDn8tKAR8UmHpeaUlgJk7Q5t31Pc6VIOERal0VZ8wNRwwKH
         bksyjROLhYm+G1KWfL75bC4OAufHS+a1TxGRxRwms8CIRMwv8IIrufHDzCGaI+MzlBqb
         c4mQ==
X-Forwarded-Encrypted: i=1; AHgh+RrohZvdqlOs9CgSA/bNsT3rwxESgQsj2y4aIejiucNctGUXZ03CG8q152zbSU62XRS/xQ63Op7kfeaL@vger.kernel.org
X-Gm-Message-State: AOJu0YwuWLYl8OdEmv1v4WC1QF1wOmokgopSmJC7HG/Ao5L2NWaKRUpQ
	Clj/k//5Pow+lAGJiRmwephQqjMUSLXMeE87eWwJ4aj0+Hu8gEHV0wvss9ni/1SO+NKrqF6/84h
	ANbhgWgi17SGM8Bn6UDrUZaJbt0Of+0BgARUYZO+LFrs8GuT39M9RcWyG7SLwactE
X-Gm-Gg: AfdE7clpeuhQLQd0QvvIb8KK9VoecqN+xcLWtCRVmPffkp3vLPz679UBiuNBwYcYdkP
	6g/8Q5C287n3RfIamB6fuyfB24ifpM5wTpSk4GYpgfCN7WE7xn4PNcDDJMmQWKv/d/5btm8S0ov
	PYvq09uXGGQWctF8GalQ5xySqitgsMvmGylws56U4sShplgIaAA+QF8tsxbA9j75ORQYdUlqUt5
	glPWQ1cZv5f4+NqnjjH4PmfpYx31paHquYYvgfap5siG64JX7b+NmvYxzGoxt6uabnorX9rrGNE
	YgNsIh5+66bGNcMcb+UOj+S2YXLQBDERw/3h+91QdWmTp8r3KxILO1yHz/P6ogRr+tMRiki3Nuk
	rDcFhaDTKsg7R7A5Na1YdaEbg66AqQqnp5dQ=
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176431cf.3.1783355812355;
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176081cf.3.1783355811741;
        Mon, 06 Jul 2026 09:36:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm4668489a12.7.2026.07.06.09.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:36:50 -0700 (PDT)
Message-ID: <7cfbc3dc-c1c7-4e4d-afe4-67a25084f607@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:36:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
 <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
 <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KwNXKBJTcPo2n95owWyq2hZT8rq-yoMM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX1EjQPy7VsZsL
 Pynu3QRM1J5KWT3mu1zDlhOtU32GJhOl6k9S05eplGgyvYPzvlrrcNdIuPIfu+O38j8bXW4+fsR
 VRJ2x0JAnv3DXl1vQ9WxdRWNIm9nBrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfXzIfBMiBFf37+
 BcM9dOWnbdagZSQFZS9PAZIupXNWpw3cDJ7LHDIZrzumOeLyO+qJG2d3rmFpfBrwhgHM/LxJXA5
 uXo3CHZjEnjtHxOyNLcjkuRlEm1DRrp0+ducdpXrHbeDwBSdyG93rTx8y+b3gI+zluAbZiXD5hA
 tUhNfgweavdfeDGnHx3sTVaN9qy7sMj6Ad2/JM0EoOrxjqlOTligzpHEDwvirwlMTssbydTmqhw
 mVaNqtHmuaZgDdmWh3BRBEZ32KHpe8yRd3iF8C5hyRrJOkSKfhRdAVIOabNNlAuJXgwoCu7kobo
 1WzGc1cFhbMb8K4Oxa/1Exv7JGGo3dty0nMuLjggbDMTPQJkuR0SwTV5vBRQX50Kgxhp2oWov1P
 CzXCYOo/yFPJSz1f/N1c0kg1zPmMqeBRd5Kmc3/UZnpaKiu6XfewAykLgUHMVcwc1wGPbJ19lvp
 VRJ9v/ILxPhwG+tyiyg==
X-Proofpoint-GUID: KwNXKBJTcPo2n95owWyq2hZT8rq-yoMM
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bd9a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-ycRNR0_AuAsNl2EYwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060168

On 7/6/26 4:44 PM, Esteban Urrutia wrote:
> On 6/23/26 7:36 AM, Konrad Dybcio wrote:
>> It seems like 8350/8450 should be using what this driver calls
>> v5 tables, with this fixup:
> Any updates on this?

Dmitry, could you take a look at my findings?

https://lore.kernel.org/linux-arm-msm/4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com/

Konrad
