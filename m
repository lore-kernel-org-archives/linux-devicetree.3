Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089887;
	b=g/adilVZWzHT8PUMu3V8D7UC8Eb1maw3k3mFp/1likFBa4GLpt3tIERwX7RRfTRACIdt
	 QQ54QjWIlmf8KxfK4OO9ruSoWFzhLUOFaMwq64qyxxLMgFxyTAZS9MyUYqIYBvzCEECNq
	 +ZKo5qzRtsKEKySc+737fcr78JmXlouApoQHAqQJWr9zOn1pq2+OZB4S/eqMkNNlMVAMN
	 YjSrF9+4idOnHCYwm9JgNwswPoQtqb7h9pzX2KpctsZpKlgaaX82igFbR1NgDyus/3Taq
	 OuGrOwwHd0UEp0zLu4CORBxIwoe1jhj4f/o/4OaElJDhnBBS+NNiwDwh78sPu5/NrYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
	b=APJsWDpzmOCKpAtqN1h1+EymqDBMhMVyrmxl8aPk6Tn1jCXoVlggXMhDHN+B2NGrBzuS
	 T/lOmP3je44rUgcr9WUgykM5t1bQ78HPiROEesA8ACzUpzCHKlbZacsz/in0+rAqWeoHM
	 Z9wTnQWYUJbj+KTpWc2n+z5WzC7jsGy6ENeb/V7NiuVsWFNch1YfHpxf3hPyDk5J4oQDk
	 EpfUmY9o+BmfwCqg6rHkJ7UgRgfkiGAikmma135rFBqVJvt8eWRMddkEYISdpMv1SqP0S
	 rwO15KVZGoj1ZvmIpW6Y3azqjtLQgQURj837ZhvkP3Jag+XciAKVzOK0IZzsF8YEzHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo9DMkjA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1aOhkNy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB5606A322
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ECB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eo9DMkjA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a1aOhkNy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5YuLA752057
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=; b=eo9DMkjAURCax4Sb
	6t+TCgPdlL7fsuIVJnfSAj+5uy4i+EjkVPc9AkAZ9CW6SFFPUTCS8wVrsX76pKgv
	L2KgoQs2DCFUwJUb76krjg8Zi6YCOO6DlVogGFLWQ+XnPC+md9/Kg5ERGoGa5T/f
	2JuecC/RVLIvvfNxJx2KrcplC4+PJCHOiNLI8abXVPgRl3ozeSv+9ygdfqtl0779
	9wmPPwlHugoq8hARLlpsJ9Ih5Bv/1FgQD8Ao0ZSkOmhWe4sRK0cV+5n1BY5b+SmO
	EsyV6WYlaOucDCiYvI7RFzEl6bG8AVzxWn3J9D51UYcstX8Bxz3rwDCiicwEBojD
	0ozq9Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmanxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:31:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso232391e0c.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089885; x=1793694685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
        b=a1aOhkNyhvsIKBrcA4cAV9uWmtV7hDCH0CVA/QViKpNZBMN/Hcib/pNDZZrXudW/Cn
         ds5a7FGrUB8DN1Zzty6EGW4tHbgQw+q8RrVRXI9uFthCYoiFwSjwHRZIDZAvhrroElmc
         xPlpeiTxZilkDSf3CyYClcoX4hotLlPyhwMRfSN7+JR6ywBQZkUg5wdQcWhEk1z5ux/O
         /dJKmt869GEqvVBnRwkjhDizoR31xcQ/AlKYjNxN3Gtzr+v9IA0pMNgEADPN5lAg2QAH
         NhoaepNN7vTS3BopS1G4uIJDcyUouN5hRVamQJIjhfqMFHJof/g86UfiCmjeWLnW35mK
         n+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089885; x=1793694685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDfuRlR7hPuki/xS+Ng41cAx4Jg251B4AwP+7qUrXZA=;
        b=iRuXvovlxaOXkDkDwJUS8FPlOXtLtNoMC39i27wVKkCpvvtbh4DHFCsj3tgtghCOQm
         /MVj04VN8FQaxFWuOcmuC1I93U1IRD3CPwthcVq8MqkfSlcOJSx+0JK8m1bvCwp8ot6I
         JRJfZ8RpiIvm2XvkelYLzKUMyvBFuDPUqabhAnMl1zmvIe75S7mYlc+Y9TV/WAy9rp7B
         SkHcLCA2TIsdFL0shkN1cN1/x0gSoEDkK1HcShXu3lEaO+8biXXEm+tL3UH9bEiS6ao4
         zn67yge6J7q2fsxnjEe8EKejRqbkLn62GhWH1KMwLSUYOlxG+HagJYhk0Kd+xke/2puN
         AUlA==
X-Forwarded-Encrypted: i=1; AKwUvByDxqaVDD6m0rQ/27hc59vCM+7EEvbex78CbVnjP5hGsgJKmy44s0L9/J/GZ+7vtqrQd9lFWbv+7VIF@vger.kernel.org
X-Gm-Message-State: AFq9FYIQOQ3VdxS9u9zob4Xppkiy/9F84+ymeNn2wEeHF2TBos14XvmV
	aEFiDTJfWOJol1hhX5Pdo2/1WkkWhjFt1Sytkzsc5M9yARoKmrSEPIDqbJBmERm3vUs4WudOplh
	xkDCJxVXUfMXTwzu8Uj32MfFm7mB2rxzqwSMoIVHxvFmeg0SemUDLmFA/01G1D6dQYF31qxHa
X-Gm-Gg: AYBFou0Y29K2AgmlS4SH46OIoy2ic+wQRJH1x4n8rG2IUEqw1CzHZJp18s3F2SIA5Qa
	pALdBWGM7X6067L5s+g0euSQitJLUyNCL35UuvXr2xzs23iilcZwB44K8LI9HRCKKa9PVxcIBhj
	2kg2Ue+T16S3ag37MZ4sSnPvXE86sGiL8jaTPnZYM/7j4X34YmJMX2KOaCD69Odc33H4H7e/UJG
	xcDTm590xRN8vHOmrWH+XGFbGmy1Ko6m//K4fFBWfuEx8w98fFN1CYYsq+p6zRgddksrp4zh1P5
	5jTgIwzRjqy3YPxh5pzvu7/Mi8wCP7Mtan333irbLDDB9Hl1Gm18huGjDm17uIDgKn06Q8lmYB/
	C1jCQuY1z2SwQrWAH6DDMLA==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr2973387e0c.5.1793089885089;
        Tue, 27 Oct 2026 01:31:25 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr2973384e0c.5.1793089884616;
        Tue, 27 Oct 2026 01:31:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm411593466b.62.2026.10.27.01.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:31:23 -0700 (PDT)
Message-ID: <544a3e7d-151c-42da-a501-a40d720bc061@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:31:21 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2
 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-2-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-2-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX1Hlm87jGBSTQ
 jCQwkXKbMbn44xGTpwWt6bHWZq0QD+0OHYYg3Y2TakJpDaGVQBLFxvraUmO4ibqPOIC51Li38Po
 QCeLsklZJeERFAqMo2VjakxcZ2QmOog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXwZlp0810R789
 Lu1XCz5pa7fL2Qm+NkudIGU3XLpOFXyhjTql0CYNYqF9XqWXJ/MKWv3iF4mJ4RdviS0hj0Vo/Xb
 BTVOBuoPoIJy77Cq1p2Fk389neQPTBy2NH1IxmvqoKsf224gs6uUMpAs+hohQbzc0P/lwll62M3
 QrhmSlx1BYlNJ8jYKUgaChM5PNlOeVqiyEjdqjPamUSpye0cenV6xSWV7uU34ag+6zSHhzCJKyb
 GBjhFzqjUdXbs22+/GN46oCr+/AdMrOf2tXKuvoMxlQ2XqThfbAGxTCRcyRbPQibpJRTCgRRKl7
 ecB4HdQVWe80QfCoUEuUyRtOCPLpbIBnOGP600RI6x+WsztyOdvF9IpEt8o3CUt31BQDPeZrxKq
 aE6MDdH6DsYoEsmmFp08FaawOgWrcntwRVQG0jNu/P3Ee4pzEFNHxkef900P4vthn09J5yw6gPf
 XiIalOtI8sWC5iVMsKg==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0615e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WPJgwWr7pJBm-2QsHeQA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: iRAgmuScscnM69sZXe1vCYwVGtv0s5MJ
X-Proofpoint-GUID: iRAgmuScscnM69sZXe1vCYwVGtv0s5MJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has an on-board SD/UFS card slot,
> but the SDHCI port hasn't been enabled in the dts,
> so we can't use it after booting.
> 
> Enable the dts node of SDHCI for the on-board SD card slot.
> Add the pinctrl node of the SD card pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
