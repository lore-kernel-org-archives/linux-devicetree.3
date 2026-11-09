Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216430;
	b=pBs/5S3J/zPGFJysi+P14O+mBmuj+Xi/RKkqtH59MXIlcy2n6iD7oklSZHu7yDR+ke+6
	 Srd7WiuESv6c5tapGhFcSRCYsRH0KBJrRYBLxEBO1jXntkHl7dY5yBG4itsH22x2KThfW
	 W043K75r7mUo7x87H4+CwvS8pTrGh284TLTFu8jEaBTod4US30s5QgWxywIO7KMTcFvkT
	 hePwxIAcdLj+upd8jLsqDtbZ7NRwnXi6s8vqSPaCFgN6iUH9v+GwOPk4yTSesncYhe4QZ
	 GDKacjRt7F/+zKDcdaOw+P2sIDf9lCtbveiv61Ou7sFPdUGMQWF8pfv++DNlRoanQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
	b=y8ZJB8Rfyejkv705vyYcldjwcfAdnDNTFAh34T93MXnVtBeT7WBhgOH8cAme44lW+8Y6
	 WESg2a19xVVA/vvb49HPH8P5KMBCF1ht+ZsEJBUb+6sX4yMLs7x9ZyUsNqYOq/9j3VdJ+
	 Mn9y1hkkAbUT2vvPLGGG7Npl7tW31UOP2si0hD3zusmKSD2QHnAY+Pn/r0702MZ8h7vGJ
	 phYhzxhuNHLafWCSP1uCpGJr1UWCnRAknI8NC0WEucdoxFcGUggFbPkfbI5n72in67vbN
	 1FDgh5NiO+EDwhYN3748QvURh8b9lurCpdyXeXa6BH+5wAsXhRxajfHhQyI7caKyHHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS+CbvMl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4BD606A332
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 09:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4BD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKMQwUUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS+CbvMl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A56D3298468
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 09:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k98AldNnLDpToTE1usQ6ljOv
	dKlSyqcs1qtKA1cJ9KA=; b=gKMQwUUUEeo+I3aMqxy/wLQMDWMf3z2dG+pM9i+I
	V9+diFjLR/XeoZNRr3PTTXwE+xloGrPDuuhtRIEePQt3y5Tq92n6Z4K6PWB1wqYa
	NG/ieTLs4M0FJisJp79ntwFPFDLyfBsasZ8wYqZvsS8pdl6K+yYBLCApF/vf/lmt
	vluuc4pV2/bi0p1Fb1/AnqRXtODTQ5/TTZSLoPGNAaq1vIIf5Ue8syUDRdqXggZN
	SkCqZ/9YDkZxPyGmbrAAnRGS7Jq87wm1yrn5OQUS7NeLEoSe8CfFGN0KA5tXpTI3
	N5YDl3DxaQFfBXRDWnPlLZ8cVn2sI00GydtCUfFATo1dPA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwr1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:27:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso301832241.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 01:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216428; x=1794821228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=aS+CbvMlvbFzd0c0FE71ZGbrUiKGQg1bDxDPdeYpFFlE09m0vSOVQ6VTdxJ6dvVdHd
         PLt40791iu19ixjtx/1KALJg3yi1yK+2TGPMmp4yVg7AXvG5OCkIZaoHDJZKf1w5AgaN
         wA5pcUXPIexCRKSgeafNw28R1PurxkWeG/sGNAdp/W/PUmf/HbCH8AbmbJCC7tLIiRoo
         TTD5XXo9HCPMXHm7JXJ2bOUqKd/6FymIS+qyaVU+PMVHLRRc8v1Zp6H6pmwa/ZN9XvdE
         fLZZ2I9GLcRDDFMYJvOq/aVBJsRSFyx37D52POl7Lwvy5TrIbRtH3Nn7GJqGUIpFA7NV
         9yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216428; x=1794821228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k98AldNnLDpToTE1usQ6ljOvdKlSyqcs1qtKA1cJ9KA=;
        b=kC5edfFA1pte0XcSkZA/XWd6ndjKOlOghkPVmqMPZbsmHCrc1r4Y1sNfAtXZaafznw
         3dzyr6Xfe5PlCdPRoa3A51CbN10cswR0N4ob4zkwXZUoAUWPIAtZSKBZNbSevtYTwk6x
         wD3vL5i10TeQbQS4iGgTARt4NoDgTm9LlkoOi/AGthQbrPS7ELY5rSkxxmc8wRh171hU
         ZQr4dHrlgF813j1NI0fr4GT6oya5VKZ1PPVfTMahP8ilMznSKBeQsiCyC0n4yyYUCJ6x
         wor3PnY7cQFPGA4B0XHFmF1pVisN1V5uLUYl/bnPZakiHU0OSo4lILCRygkQdGlU3g10
         zn+Q==
X-Forwarded-Encrypted: i=1; AL+hErETMBhU8FGaODODdUwOuydbPedxS/Ydi4NyfDwGgDTWVX2slx0m5j/gdjok5eDFUaWWMpoqYnL4HSO1@vger.kernel.org
X-Gm-Message-State: APuU4Z87VQkbqSYby+A6cOM/x1Doao7TsbB+PV/FW+HEpdVd53BlZwTV
	FlDOndr1N8LINxd1FuJqy9uAqmGD54LDMlnWFi5HMgDbnLS1upjGZ/2CcJJAMEv7XhyNqJc0/Yj
	YAb6OpFTdNf1aNueB+DYKMLowK6qmujdP681tWnED50EnBPOzf6pJhSLM31ppAsvR
X-Gm-Gg: AYBFou3OEP2uooHwX09sTAv/xRIFz+1/P9x86ohzlgiAM4rRTmBuNoMuMV8vtoWoD2R
	gYL2pQ1Jkx3KUlmkK5+AJOPtklc+0GNh/ng8SfW3qJZlPoUQcMlIErc7+OjnmCGspmt7ZBV+84T
	NvTHWMPazhTVn4KjuEn10pw7MUIpeufo34PY1T1xrKZ9vaB8N1A+cnHXECiR3cefd3pNeyEmT0f
	Bc7OPNXyIwITeqvUWOs7mbO2tt6g3QPmJRX0UnnhKEOtfJYTcF3llcqTNaAyWZxiA345W0Ia6DC
	xqXisE6weYp/cXqUtBKpQdlKzBOOfGyWPSaCtRGouvFgdb9efcJOwkROPMwOMU1XlKYu2WsCLX0
	FLMNNXOG+sriFKw5lYArWfDLuRIFYV47bkaiahA4MbRrqpZy3dV4DoqokxLf1iTU=
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682418137.21.1794216427339;
        Mon, 09 Nov 2026 01:27:07 -0800 (PST)
X-Received: by 2002:a67:e702:0:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d2db13142fmr682404137.21.1794216426710;
        Mon, 09 Nov 2026 01:27:06 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8477370f8f.36.2026.11.09.01.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:27:05 -0800 (PST)
Date: Mon, 9 Nov 2026 11:27:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
Message-ID: <s5rb27nhurw7arvnem4yec3z65oscezjvlj7flmywcjfqjgyou@25v7efso7zf2>
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
 <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
 <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANn8UmeS0Fvdkamzu0Cgbv25+WdjHsXvCLMpsL98QSo-Gd731g@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX3Bpnl5M075Bw
 prEK92UJkYW8nDOc56liJhvMGkqGoqPn54XSw1m1WUJBnWvQy4Kr62B3He3pz84HTKVKSiFMxlu
 wk+Ell3hqMZfQAI6nK/zDSK7ZxYHvsERq0DJ/NQgeNwawe2kkxbJ/W40K5pPySYJIsGTrFSF9f5
 pbwRqU5ALUVS6Dse+mxsi7zNnpy38KMap6DqQV1/jNz+mA1GhGeK3eeE8Z6rZ0I3bd37N+iqqz5
 HiAjH8GFLpklNN5RvWG7t6kWZCMX3LcUnH1kEz095pgs6Y9ajoZxojuHa+79KM2HL0NwUY+e4Yr
 govH9BS0UbiP/D3JSHxdstmJbHhUMh1fUcPbZCjzKWKcDm/gF2/INAI6XZHuPRWxhtiesZpoYbR
 CWxz9Jin+rn5dGRPZ0bbv8keUjGdquar6YCLgNzHFkFHlB9pJMQa4zUXeuT/i+Vxj1H3Qt0K4Sm
 l7JoRcGZ72IU3M5vv2Q==
X-Proofpoint-ORIG-GUID: rHlJ0O1W7_v41nX-rztCpHBdARLKmNMP
X-Proofpoint-GUID: rHlJ0O1W7_v41nX-rztCpHBdARLKmNMP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfXy2JQxdMZndFq
 n6bgjyNBoJw65PnnPROw5M455d5LfckaSv1zGzFjSsl0vOiJF+mcXv7xJ1Tg7MCRMUyNtgWdm0r
 kRXG1TS9cysk/29dsf+GTTIT2ZQnZYQ=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af191ec cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=n44UkhTd5bL0-s0LC_0A:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037

On 26-11-05 18:51:44, Andrew Gigena wrote:
> I understand, I'll keep that in mind for future patches. Should I
> release patch v3 removing the "Tested-By" now, or wait for other
> reviews?

OK, now you are top-posting.

Please read through this:

https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

You can send v3 now.
