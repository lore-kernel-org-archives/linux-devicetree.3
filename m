Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D9409107
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782820924; cv=none; b=Pnv7D06LxXpkXfinhoRItDCA3V+1eeIMEBxVoeyRPcU6/AdbbGuyPEwE+wAApwHtuGKbu1W+xabw/Sxx4Vm5E3fxppq70fqNAX3+F2vhExhuO/5yRuVA835ONATWIOieNYPVUKZ36UZBylNbX0Dz2ApXCJLFmVnC/2uy7YiHH3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782820924; c=relaxed/simple;
	bh=jB8ORTPN/Ir/rdNJDngB2P7qDRWmgC5iuBxccmgQJpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5z6j6ZGCavhvh10zBf57DSDv/3aS4IGw3CSJehTu/oRlpjDPHEFoNlw5+khtHC4bYhgYSHvvviXCZrxGHdIZMxflosDmBx+ZLg60fdX7JVUIOBRRsct1GdQwBILDNXM+v4CXDWHrI6HCoiwhtLYTsdfgPtZsfleP5aW8/0rqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3aionmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqL5elB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3aionmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqL5elB4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n2Uf1602961
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=; b=J3aionmFiPLg5GU6
	Sv+MSK0KCIjz4E0L5/BagG6QrzTryp9CS6HWYvJ+Nc8rCdONGpes/ANva9n8rvhD
	N+VHMh+8VnebliA+jFtYhVY9KTdapI3zygRUJwd0RqwLJ7Oi7D1aXf+SI9RhehtF
	LsKt/Q0Y0KQjvO1+TK/ObRJDQCfUaDXRZoB1l17r9C4iuRUvOcNP8WxDuSD/SKXI
	MfU3BrQNfbgaNjRJrj+kqipfDsxtpagxrS644oG9tPCIgDkKN4DcdIzmlFBdYhNX
	V10f2t+yahF/Kkd1Y6gHUyEVmdeVeSJo5L1pNsSgGqAQ8LsZa+fFNOeso3AjkpR5
	5eULPA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprrrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 12:02:01 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bdcdbc954eso2660e0c.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782820921; x=1783425721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=;
        b=QqL5elB4JYCc+ryAlcJ90gp1BljvkgJi6NLzIxMmgBU8NN2leCA/kHvMBq2R/Piuir
         ff49ipZjMxO1odKO0Qe0UKRHP93t9o2R7etircp1zs9WiFTQWhwACULYdCQqBJrJKHgl
         DX7MEKMOA94xohZ+8IA8V4UeSSXbJau2mEPafYZ1T8P0k1oxHHx/sS7z9xCbHsk5clF/
         oxAu0wOAbZR6jOLVLcrtBvXslH1eTmDXHGH0JKckxW0ggDD57Q4MBoT1y2RQd8zq/B6I
         D2/6ATvptPRCt+x700kZLFcE5VQcxT3iYmvLJXx573vTr6J86XPd62MEnfr6w8kG0ACR
         tjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782820921; x=1783425721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghIqzt2swN22I+Ok/FxKdmKOxX4q+2Bz9NLExdF6R7k=;
        b=kp3Mt/FehB37h73lfkH0bLRYg622ANIma+GUhWs/a14qp/ayYikQeA9oF/Wsqygred
         GaAQYUCzB9K704a3IManbc7JazwmX+G/BchXzWljuguFHX6Pfdo+i4uabJn0NmmqCgeE
         whEFUDtoNf/4z3gai5xKIoijDQG41S9VtdSHpEtwQo6dnfGkshPnpuh21VSlF3QGW2vx
         Lv0R7wpHL+n1iiV3I3fSjPB1UQNUKJI2bif08+n9DgkmcyfcWUfav5YbifciMnCO9SNF
         pAly0h6d4rkHOdbsHWRzI/infFZKHv8Jx1z+UHCTt/JxWsHDcHWDfYik4th1a3V1o/ET
         FllA==
X-Forwarded-Encrypted: i=1; AHgh+RqYJtsLD9Dv1bnjtaDYTXIsIRgmJGDhL/6yz5WbdZxKvdtL78gWuvvaH14ISWcGBk0DG1tN3KrYzXpA@vger.kernel.org
X-Gm-Message-State: AOJu0YwKhNNH6lja3hoQGfGZ6oJvBJZZGk9cuIg51+LhNl5v2Mq0Ducg
	Y7+rbLDkXVBZSL+kmC/vn9OuLQ5/deBk/rg41EQ572KY+xFl0C1UFnlkCxKJQ5og3+9HpYAb/0v
	BFsJJlDZcCXN7B9Tuv2vxkcqC8wrSgFsky3hjPVi/4g462AG3snmcqwD05QsQQ5+C
X-Gm-Gg: AfdE7cnalf31nx8aKH0wTT2Q5X//fSJCaeUGg0865W7PhqKJhhcavZORl0uMyu+a5tb
	0WPJR+RuMe7UIo1HfKllb9bKImbB9FLmx7qbCXd9iNBmIXoQ/lEBrRakJwisr6Th5k+tqNAnupR
	2ClmbFOCQHVO4JMIVsxfK55ltQxrElkF4klTdPkn9rNmqSsL6Iyo15AhqdMV0MXG+gUmyGGzzld
	WHY4hx5131RbyEuXTcv8y11Y162I+uXyL2+8TDMARNynZgYBWwEw4uV0/5rHfCMqcrQUUrGp2h9
	JohydOXMLsBFsc7J5cXpUeiuQN2o7gL6AuOCYqh8gAPJb5AoteWTgVbQO2ifG87reGIL+EIRHqL
	7Df7OfDYp+uxq781XQSYSYe2k4uetVcBW+Qw=
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr492853137.0.1782820920703;
        Tue, 30 Jun 2026 05:02:00 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr490634137.0.1782820901854;
        Tue, 30 Jun 2026 05:01:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1d61asm113746666b.13.2026.06.30.05.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:01:40 -0700 (PDT)
Message-ID: <c7d263ba-e837-4489-838d-8191ae18b993@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:01:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4iLBi39vmEiT6aNAOH16m1-It6L-RxEU
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43b039 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XhgZWyofoZ1-JSIGm7gA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfX+cB5Z8wxq7Br
 i6LvT+CE5e4h4fEUGvHxB/VXmY0A3wqQfy8VYcEM72ULTdW0V6AktCzWK7pnEWcksSZ0W0qUXmK
 3MKrzXEqc+1By/EwxwYANuzR6ztQeSJTlPT/WlfZIlcXDIKe1E+hl5Uzylh2WTzFTbolYxYpqzM
 HIta7DaWtRVhzvvV98Bn8u7QDq/NHyaIgOZp95nKtppMceSPcviqpmnTBDaYCxOSH6roivVTQ/3
 LYJH8VVoCIUk8DeOzGozpNbLsTQa82uTrHgvMh5YU9KO88Rc+fiYBn1mNNTBo5MIKHFQe5bUxo3
 p80SOVYv56uuVi5w7ayl6QcgBzHLkHyFRKWynVMSgCqkoGF8Hh7atpge1gbMMIXiQlNX2m0MGTB
 1hicXJfR16cc+muDvuaITZ5LS+ay2gRuziSHCpu1lTCoiHEPt9pTZOCCEHFvwJSKgQ7XtajMWKd
 tX9s4tzTf9M7xUuXmoQ==
X-Proofpoint-ORIG-GUID: 4iLBi39vmEiT6aNAOH16m1-It6L-RxEU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMCBTYWx0ZWRfXzjn872+0Xn2q
 AcO8T4M0E4AC5yEvKCtKeAG2thJVIUooPanl2acFjZ6wbqc80N1EcYgMdKJ7+fTtwUSCML5QMPW
 z+XRFlpGL2xUohmdm5QGikZFYaSPl84=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300110

On 6/14/26 10:05 AM, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
> correspond to the off-PMIC system thermistors connected via
> PM8550 AMUX/GPIO lines.
> 
> Also,add io-channels and io-channel-names properties to the
> temp_alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

[...]

> +		sys-0-thermal {
> +			polling-delay-passive = <0>;

Drop, this is zero by default

> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +			trips {

Please add a \n between the last property and the following subnode


>  		pmc8380_6_gpios: gpio@8800 {
> @@ -451,6 +697,8 @@ pm8550ve_8_temp_alarm: temp-alarm@a00 {
>  			reg = <0xa00>;
>  			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
>  			#thermal-sensor-cells = <0>;
> +			io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(8)>;
> +			io-channel-names = "thermal";
>  		};

pmc8380_6 isn't mounted on purwa boards - do we need to override the
channel definitions in the vadc?

Konrad
