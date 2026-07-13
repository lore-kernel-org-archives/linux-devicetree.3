Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6C403B10
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944487; cv=none; b=tQERKo3uXCaHKpzBun2xtzZuhVKzUsnS2BxPc0L5ILZw2jQDrwB1Lj7xu460sa/rHc4wvnmaDu7N5hnRzgas3gvBnQhp1tJkmPIlskUEJmT/WSaDluKS6f+nn/ZoF6YuYaQRbgh0UknjRsM16MTLm8KmxPeajynCYHkTzBpfUF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944487; c=relaxed/simple;
	bh=m3o+DRtI8SeyLbGcBfrARx+CIF/Y/cDvLkShiTldeeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqWcBl7zIFVrPa8sJx5QcMs0WarEoxiCeNDDPDoSNOzVgmZGdTswh6bQ0GjwQzFA1IB1iFtsckQ7oa021ifZ6m14K1QbGGB4qkYPG/XOCuoKE+o5tmdNAXkOwipJqW8q0nESf1MJIN4Ellj3K1gPAtcahXPCGwC0pNQFvRIU3bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGX9Npx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6GNQi5h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGX9Npx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6GNQi5h"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAfEnb732794
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=; b=lGX9Npx5cAHZYX8H
	mp/9K+oIekZf0rfxwRICUlGFvcb9CyjtVMXkEoLz97HnV0f4HRk+YfX373sLJjjd
	0F3IA9To2bf7mBYemo3ZzXKIg5LjdOIJkXs9iAC+mFmjZoT9CA3XUEixClhfbMua
	pVn0nS4YkBdKC+mEUUMN9ss8kUHi96mXKEe55Sivq5kHQpQvbUhyviJq1TcUSNYj
	KFl/A+c+be+LP7jOR4yoqyR61DlD+acN3t/aD1/Voyryykpohp03fJRu+NewuhN4
	chqL4hoYpUdMdbEsnNgjQBHnD+BLYA1HEXukBAcSchT0dvn/ikW5cAJ1a7j6Bp6/
	kCXNUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3ade4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:08:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so4602580a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944484; x=1784549284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=;
        b=M6GNQi5hX7HUyuGawuvVGxqWQtqE34ChffNZTz0hT+isbrm15V7Cg06KndJLQwTEKR
         VxU869LX+/mADUG3ibC4Jp4iyeeOyvpqfeKDRelXzhbmMiuM7m3MxFTUDEVedQ41feqq
         WWaTt6ewtu9LZNyDbXWlCzFuR46JGCOsGt7xArGMArjZVmQIagyLdwTX3Yv9/TRPTsxe
         GLS81QXFsaTLnnPCCUq13a6XPAhcT8fSZWlrJ+ShVvXTYEXLcTQ2FjLGyOUI/1tICu0j
         2IdSOmexYRthgHeKGpMnoO0r4QS6u8bvINM8tCI3RESmDKtySXHORTxOPG/W2hoG1GTu
         UvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944484; x=1784549284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPAujbf4mGph95tAK5SQBU5bC7l/VUtm//AreUTiXZc=;
        b=WWav6JZgF+/U5lq2NdsVo8JclhV4SHZznD+nYgKMCz9j2NocjAIahYR8WsYeCcOT50
         knuE92C8lqyCsRwQtRIqXfca90QZal6sP0yGkG7Ub3ox1Amjj3fdMZqRXC4c7Aa0eWWA
         V39MtIwcYeT6+j8Kv3olaOSLpoH0Q/6Ydl71mfPo+6qTGeM374fIGf/h3++OYRdgeANt
         LblZSct/sQlpJ3zOADE5Cop4y6k2mlokblnXtHyAfJ3tqdpcOyRVf+RVVarGvI/dFT6P
         XUz5vUBKJ2+y1VqCIduTwV9KI3Cph7Tj3zjjXuE5Kc3gtk/y9nh71MDkxXZ+QxT4FXUZ
         Kfjg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5fSblvXgwMzdgSz9fb+FC5+yDFhsdQKMTGnKMpwsXmlolhf5xugtFn0KA0ivWLL/VPfgk/FzAjhC5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2VgUCbOPxBYPNnT8LrkF0PfcfiXjQVPtd/Dg7qewPQ7LGCpt2
	fQd99YbdTx3YcTpospRPgktrfnoasJqd92bKY+RH2kPtg6vuAmc9lqsQNoVxrCH3aLCzjbCW1gt
	j5JRfyUV4gmLcJTRpkQQzJpZGq+aNUXpieXpeOfDgaHaU+WNozd2PiFHTyxZgifuS
X-Gm-Gg: AfdE7cnYmNbLfsAuvGQoxidKn/XJXDMqQyz5t/YidEWY25pw4INW7ZIyhjtsem4qEMQ
	SdwsC0bnYGcPeZ+8dSeZQsZyljqC+Qr0bwZQE3beSYSbXM5OK740FoZ+AiSPjeHfw/yHkYbe58Z
	g8isH1kLtiOxMbFYKz+BdkfIiJYpvq+63GDckK6e28sNn2zyUlyZlzhKgjecIDUINR+Z2cX67Ts
	hfVfaN8XtusMLmO7Aie3NjJ5eWUiu6S3MgQB6BU3evZpKsPMCkwjMU1ZhBraF2xB89hcUyO0Foo
	jbdfCMyt7v6VvDdrc5oxlBkTKrbxsdqvJfdNtAvvGzaYsWcu/kqrqmcOOPEYHtFkHKnC6J2/Y85
	bQLDlWqWckShE3FqY8P+zpJ2sE5MBlB2fm40Kbw==
X-Received: by 2002:a05:6a00:cc1:b0:845:c662:2be with SMTP id d2e1a72fcca58-8488971d43emr7797865b3a.42.1783944484386;
        Mon, 13 Jul 2026 05:08:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc1:b0:845:c662:2be with SMTP id d2e1a72fcca58-8488971d43emr7797826b3a.42.1783944483927;
        Mon, 13 Jul 2026 05:08:03 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b60571sm14012070b3a.9.2026.07.13.05.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:08:03 -0700 (PDT)
Message-ID: <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:37:43 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfX+jaYeb6XoBTs
 LqXHyCe89HFbhYWUSgpHqR1P/ygSjkAWhzv8J1W3lSB7xLzM6VisyTe21O+TwfO39TNzIMJIGf3
 Z2sRemuc8IBrSzpx5PBkceKGW9IUjiGf4FdoqxYuKKuSRUmLGrNl0vbcoQzFv//8dpCSnzbnQhS
 pk9X39BBWiQh2IUktI2eAKnVUurCnjB4It8B4mRF67ZZJrwqe5ltzN2It5rPGwF78BnB8c5HGF9
 3BpkE+U/hlD+ageukM7oAWKyiciKEx9AGEAx8yiklpHAs6KgTugIJWSxN4cXZbpsq2PIdwWaxAD
 9dW/dx+C9ukdmPg89UAtCK6nEBVwmt5D4ifkmYRkpT/O9Pe1h0bQ3PMrmov/Pwdg8gAP88bYwsh
 DtgKBHNF349QeOY+jlaZubIuI0TCWtI8uIyaBhAy062+Pym+GZVB81Q+JYJ1abM7uKkHdCzvjKC
 52KE2p5DNck2TiDeAsA==
X-Proofpoint-ORIG-GUID: 4ZIlZipczpSUzYrYMW8HYBmpk44sLPSN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyNyBTYWx0ZWRfXyLKonWigvWNU
 PrEPJmBtfRCkReopuzVVwjUb74bXZTGpciGy1HNFCYbVmcZzDqldwhc3xnpCnDoxDhnL07XplIT
 UftcVpo+JucuGhe2y58pjTPqgGeKO+o=
X-Proofpoint-GUID: 4ZIlZipczpSUzYrYMW8HYBmpk44sLPSN
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54d525 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XK49fb3b56mXoZVge74A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130127



On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> On 7/8/26 8:25 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
>> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
>> differs across Shikra variants based on Audio subsystem enablement as
>> follows:
>> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
>> are required to be supported on HLOS.
>> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
>> handled on Modem, so from HLOS only resets are needed.
>> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> For the sake of simplification, can the resets be enabled
> globally by default?
> 

By default (PoR), those resets are under HW control. For audio use 
cases, software desserts/asserts for switching to SW control. Hence, 
these cannot be enabled globally by default.

Thanks,
Imran
