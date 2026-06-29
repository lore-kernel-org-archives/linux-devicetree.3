Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AC04192F5
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743694; cv=none; b=DnvVTeKL/XQ3TmMPCy8DjyB1L0lKCSfwfQdZskzw1vM9a0471vqiRp9qj+J+1ss2nEhhpVI37VvzvnIkDMxkaxKDc01hn8yEGNiyRKBvgey0brE4mX3/qp8iXcuO8InLuQ7aAsowUKlEtiuA/y66xv7gvhTdC9sB6lq+O2zTVQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743694; c=relaxed/simple;
	bh=d05Fycd2bYo1vzS1RtKd2HZ2iWBH0Agkyzhv3yB91pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0FP4wlvh50sMHylxTjltnuPuQrU3BCbHhOqe/nX283nCf6YQSBh/9/KZY3OSE2NncDO44Hfrwd3DfVC5sLDa+Scajk4BPvXrgInCHvhE1KLTf+uu2nOoshMNd+V7lTQtlRakNY89IAeVdPgsIdRbEzvRUwvRb6xOKjdBFxsDrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cakNeJZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmsnVjuj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cakNeJZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmsnVjuj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT0hY2641507
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=; b=cakNeJZC3hkOaDJg
	x5BeMewWb7qRGF+V1MWGBoz41UrKVB8l+Xdz/ZnFv0BDS0gyGoEiV8dzTwa81ZQE
	ejsT4pWOBbJRs36ULqtLgn/YGEgslOPrQaCqyKeZliyT2Euh8nVrdHoI6yB+Krb2
	MywU3DDkZ2aZolbNHMThMC0uNfSxiYh1XuqIr/9kY/lb5IA3F3jViITOCjaH5pK8
	IAjxb+1ypiYLo47pb1CJdswPEnkygWzn48HqPt2tVR1wTJWQD/gGPRExL1QTvpF7
	2pu5DeN8Mw7av9oN2TIk8CcsDtizuE5ZyOkXVn6Y6az2ZwJUp2hzJOPdCOwUTPFR
	J7+kBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npesa97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 14:34:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf5755b57so707341cf.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782743691; x=1783348491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=;
        b=kmsnVjujkr84UsusCovTuhtg1awcT2LOEJsQN5YvxHhafyNgBfQ8ssj+lyyO1O2jfu
         Qo7m6YpBDg4ahYjSr2ecRGAkWoeONak8z0NGip7/fyo4loKIRGrHAdi3ltNjAM1HaLje
         gwyrX/mR2B6/pAOCeug/YTPRBeHHGToj0cz/4YwDQ7JkyNamtDAismcwoE3TTtW4mXc6
         rPjnr0A73Ig32PQHaGo0vuBoOYQH1yMnr58YGPqxLhNFMXVXvdxtAe9ZiC4t3J1a18MW
         XFahEcylgaKhZDjDhn+xyUM59eAwzN8DoONuCFKy+AkG92cAq+qF8mDkfsXggRxiGyzw
         BKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743691; x=1783348491;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqxLsFSIjpjpgfIsOF0zA+8yLigOIjsUeyr/IlQVCzU=;
        b=rvm9h10TND3LnO2iSKbpYKBmdZzSmQsjSK3TY2P4iXn91ECt62WQcmXWbYzAY8EQdx
         xjbZ7DNpZfFJT4rfC9KrIwM5NKF4q1v2PiKSfiKLj7Mbi1afBpP/oAceaeSv72vVmOaj
         mOwxBxWv0h5u4Ieace4r//MrSBeZiEhr0jvqdQ0QDYl9z1VMsZdwORlG7JHrEI9H0XNQ
         cPVmAOa4grUNASX8i8PLKLtT624Skx1qV2lCqvzzkIesvu/fcx7Z1kmPTU+K4Bzgeh1W
         AvskGsjVX+RSV0Mk5qMq5juQqW39Tx7IwK49s2gOOjmH56OJFGcfajcQKbnNFKJALq0p
         iQBA==
X-Forwarded-Encrypted: i=1; AFNElJ8lSiSUnVwum8R/SwOiqFq3rQsELebtTfxfSmk7xBIPDeQlc9DV8KZ3TbNrB1or3AJZ6/mcQgClVbW5@vger.kernel.org
X-Gm-Message-State: AOJu0YwH/lIzZ5q5BJHUPh6TPonM8PQuf7q+KXQ/XdgOuEZmv/f83UE6
	TI11jXe54e6688LzTMPQ1rDzFaMJqjfyRNmIYYAGKdQpEhXnoLkLYSs8kMpKMD3vUJa90XCr4SY
	pvDShCsP3eiftwLGxifqcB0J+3d+GMrEdt8AAZCCtfpiVIQY7Ge3MYadLqe3GgGDt
X-Gm-Gg: AfdE7cm1AxsJExEUmrm1UbHIorMoo2i+wQK07P5Xf/bBjparNwArTxcAAxz/h6c18Yp
	6adOU+LyPt86B83Zj+POsfBCsBq9tdizDbt6gDZzf2yh6xO/hF7jmleTGfZKZ77SH9KzoIS/r72
	+e/fQmCTHkijlbSsIc89DEK3SmA5CFq/R93DenbrvowVr+77mJm3jwwLiQc760ZN8nsEro02yvM
	v7SRhnlUKStmwh1gYfr0ftUxBFAFN6ccVgxJlsyE4gPAnABkzanLVV3LFhqR+q3qpSRvb/cebE5
	PQB0YlV2yw1zO3ECZgCETUyXrgZgqvQ+5/b/NYvE/VA9pgqqWYpJ5I+rUP0Ol0tMxGAKP3mJ7Pq
	7gnJnKTI7dhGu6sx7h9ODIrivrWdinzkX3Mw=
X-Received: by 2002:ac8:7dc7:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c0a85c063mr13123651cf.3.1782743691067;
        Mon, 29 Jun 2026 07:34:51 -0700 (PDT)
X-Received: by 2002:ac8:7dc7:0:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c0a85c063mr13123191cf.3.1782743690417;
        Mon, 29 Jun 2026 07:34:50 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1250a80b04sm289378066b.34.2026.06.29.07.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:34:49 -0700 (PDT)
Message-ID: <64691236-178a-4fc2-a9c0-f053b7944e66@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:34:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-dt-m1-v4-10-2114300594a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMSBTYWx0ZWRfX8eTIWYIyFi1m
 vTJjukBxgwa6MoGqAJ5x27em0+Z25iJyuRHgdMPevjwzBvplHFB4vY1w5kDQrrYKJjKckTbOXdE
 dIXN/0YBbl3o6A4HWXIq24gB9uAcu3EhgVYTNppInOR5Yr9HXxDpexES7hR6WJkFk1OHKbh6tys
 tmhm1O3gCM6DfU+Z1cgFQ5/me9g3QVjwcF7SzLOP8MuNNWUwqcHxznkNzI6RVAsuU06Kr0/Kfif
 DnMUfIaVmilrFZlX0fymBh9j5UBHn+1EWlhfWH8SBVWya3trGYz9q2Yv0tFTQo1wXKvPyWYIG2K
 KUk+vL2pXF0nuWIh5JO2acWDVuVFxz2jstDXhHdiI1yeEk7O3fA2leyXoDkBV71JUzxNQk8fDC3
 oH2jVSeqMA84hqkdtWry1qMHsoiwylSN0gURrdw774AxC5+NC8mc9M4h4NDXWOCJa7VzWLDc7pJ
 I+NjPs2qEwLg+gF6tsA==
X-Proofpoint-ORIG-GUID: b4_-ZgJAvvVPHut8iD75WwOaMpO-SDE2
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42828c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bA5z4lzVfraiEpfBxBMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMSBTYWx0ZWRfXy5TdFtvYG4/z
 m9AWkhEf3JUvJoSR9Hjen9eRxu7oQtf/GQf8ysnhhvlgOC8WVZOj9ci+XrI6WG6XlNBF1fssJ/N
 iFQ145okVDKNZXo6YDWvd4SKbda5Qg0=
X-Proofpoint-GUID: b4_-ZgJAvvVPHut8iD75WwOaMpO-SDE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290121

On 6/8/26 3:10 PM, Komal Bajaj wrote:
> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
> EVK boards using the WCN3988 combo chip.
> 
> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
> board-specific regulator supplies across CQM, CQS and IQS Shikra
> EVK boards.
> 
> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
> with register space, interrupts, IOMMU configuration and reserved
> memory. The node is kept disabled by default and enabled per-board
> with the appropriate PMIC supply connections and calibration variant
> selection.
> 
> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> --->  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++

Split the SoC and board changes

Should most of the board-level changes go to evk.dtsi, since
they're almost identical across all boards? You can e.g. simply
override the supplies in the IQS EVK DTS

Konrad
